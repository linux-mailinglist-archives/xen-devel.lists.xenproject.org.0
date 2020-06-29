Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29AF20CF32
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 16:39:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpuvc-0003uz-37; Mon, 29 Jun 2020 14:38:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jpuvb-0003uu-5q
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 14:38:35 +0000
X-Inumbo-ID: 35adadee-ba16-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35adadee-ba16-11ea-bb8b-bc764e2007e4;
 Mon, 29 Jun 2020 14:38:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A507DAD17;
 Mon, 29 Jun 2020 14:38:33 +0000 (UTC)
Subject: Re: [PATCH] tools/configure: drop BASH configure variable
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200626170038.27650-1-andrew.cooper3@citrix.com>
 <880fcc83-875c-c030-bfac-c64477aa3254@suse.com>
 <24313.55588.61431.336617@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c202733-cbff-74e0-30c6-4cba227e7969@suse.com>
Date: Mon, 29 Jun 2020 16:38:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <24313.55588.61431.336617@mariner.uk.xensource.com>
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.06.2020 14:05, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] tools/configure: drop BASH configure variable"):
>> On 26.06.2020 19:00, Andrew Cooper wrote:
>>> diff --git a/xen/xsm/flask/policy/mkaccess_vector.sh b/xen/xsm/flask/policy/mkaccess_vector.sh
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/xen/xsm/flask/policy/mkflask.sh b/xen/xsm/flask/policy/mkflask.sh
>>> old mode 100644
>>> new mode 100755
>>
>> ... this may or may not take effect on the file system the sources
>> are stored on.
> 
> In what circumstances might this not take effect ?

When the file system is incapable of recording execute permissions?
It has been a common workaround for this in various projects that
I've worked with to use $(SHELL) to account for that, so the actual
permissions from the fs don't matter. (There may be mount options
to make everything executable on such file systems, but people may
be hesitant to use them.)

Jan

> IME all changes to files are properly replicated by git.  Tarball
> distributions replicate the permissions of course.
> 
> The only difficulty would be if this change were to be carried as a
> patch somewhere, by a downstream, but that seems unlikely, and can be
> avoided by that downstream not taking this patch.
> 
> Ian.
> 


