Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7DA1CF732
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 16:33:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYVyf-000206-JC; Tue, 12 May 2020 14:33:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYVye-000201-3c
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:33:48 +0000
X-Inumbo-ID: 9670d7e8-945d-11ea-a2b8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9670d7e8-945d-11ea-a2b8-12813bfff9fa;
 Tue, 12 May 2020 14:33:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5247ACCE;
 Tue, 12 May 2020 14:33:48 +0000 (UTC)
Subject: Re: use of "stat -"
To: Wei Liu <wl@xen.org>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
Date: Tue, 12 May 2020 16:33:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.05.2020 16:19, Wei Liu wrote:
> On Tue, May 12, 2020 at 12:58:46PM +0200, Jan Beulich wrote:
>> now that I've been able to do a little bit of work from the office
>> again, I've run into a regression from b72682c602b8 "scripts: Use
>> stat to check lock claim". On one of my older machines I've noticed
>> guests wouldn't launch anymore, which I've tracked down to the
>> system having an old stat on it. Yes, the commit says the needed
>> behavior has been available since 2009, but please let's not forget
>> that we continue to support building with tool chains from about
>> 2007.
>>
>> Putting in place and using newer tool chain versions without
>> touching the base distro is pretty straightforward. Replacing the
>> coreutils package isn't, and there's not even an override available
>> by which one could point at an alternative one. Hence I think
>> bumping the minimum required versions of basic tools should be
>> done even more carefully than bumping required tool chain versions
>> (which we've not dared to do in years). After having things
>> successfully working again with a full revert, I'm now going to
>> experiment with adapting behavior to stat's capabilities. Would
>> something like that be acceptable (if it works out)?
> 
> Are you asking for reverting that patch?

Well, I assume the patch has its merits, even if I don't really
understand what they are from its description. I'm instead asking
whether something like the below (meanwhile tested) would be
acceptable.

Jan

--- unstable.orig/tools/hotplug/Linux/locking.sh
+++ unstable/tools/hotplug/Linux/locking.sh
@@ -42,6 +42,12 @@ claim_lock()
     # it being possible to safely remove the lockfile when done.
     # See below for a correctness proof.
     local stat
+    local use_stat
+    local rightfile
+    if stat - 2>/dev/null >/dev/null
+    then
+        use_stat=y
+    fi
     while true; do
         eval "exec $_lockfd<>$_lockfile"
         flock -x $_lockfd || return $?
@@ -56,7 +62,17 @@ claim_lock()
         # WW.XXX
         # YY.ZZZ
         # which need to be separated and compared.
-        if stat=$( stat -L -c '%D.%i' - $_lockfile 0<&$_lockfd 2>/dev/null )
+        if [ x$use_stat != xy ]
+        then
+            # Fall back to the original Perl approach.
+            rightfile=$( perl -e '
+                open STDIN, "<&'$_lockfd'" or die $!;
+                my $fd_inum = (stat STDIN)[1]; die $! unless defined $fd_inum;
+                my $file_inum = (stat $ARGV[0])[1];
+                print "y\n" if $fd_inum eq $file_inum;
+                                 ' "$_lockfile" )
+            if [ x$rightfile = xy ]; then break; fi
+        elif stat=$( stat -L -c '%D.%i' - $_lockfile 0<&$_lockfd 2>/dev/null )
         then
             local file_stat
             local fd_stat



