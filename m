Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659561CF829
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 17:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYWNw-0004Hd-22; Tue, 12 May 2020 14:59:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYWNu-0004HX-JW
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:59:54 +0000
X-Inumbo-ID: 3b93949e-9461-11ea-a2c2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b93949e-9461-11ea-a2c2-12813bfff9fa;
 Tue, 12 May 2020 14:59:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 865DEAB64;
 Tue, 12 May 2020 14:59:55 +0000 (UTC)
Subject: Re: use of "stat -"
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
Date: Tue, 12 May 2020 16:59:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
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
 Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.05.2020 16:47, Andrew Cooper wrote:
> On 12/05/2020 15:33, Jan Beulich wrote:
>> On 12.05.2020 16:19, Wei Liu wrote:
>>> On Tue, May 12, 2020 at 12:58:46PM +0200, Jan Beulich wrote:
>>>> now that I've been able to do a little bit of work from the office
>>>> again, I've run into a regression from b72682c602b8 "scripts: Use
>>>> stat to check lock claim". On one of my older machines I've noticed
>>>> guests wouldn't launch anymore, which I've tracked down to the
>>>> system having an old stat on it. Yes, the commit says the needed
>>>> behavior has been available since 2009, but please let's not forget
>>>> that we continue to support building with tool chains from about
>>>> 2007.
>>>>
>>>> Putting in place and using newer tool chain versions without
>>>> touching the base distro is pretty straightforward. Replacing the
>>>> coreutils package isn't, and there's not even an override available
>>>> by which one could point at an alternative one. Hence I think
>>>> bumping the minimum required versions of basic tools should be
>>>> done even more carefully than bumping required tool chain versions
>>>> (which we've not dared to do in years). After having things
>>>> successfully working again with a full revert, I'm now going to
>>>> experiment with adapting behavior to stat's capabilities. Would
>>>> something like that be acceptable (if it works out)?
>>> Are you asking for reverting that patch?
>> Well, I assume the patch has its merits, even if I don't really
>> understand what they are from its description.
> 
> What is in any away unclear about the final paragraph in the commit message?

This being the last sentence instead of the first (or even the
subject) makes it look like this is a nice side effect, not
like this was the goal of the change.

>> I'm instead asking
>> whether something like the below (meanwhile tested) would be
>> acceptable.
> 
> Not really, seeing as removing perl was the whole point.

The suggested change doesn't re-introduce a runtime dependency on
Perl, _except_ on very old systems.

Jan

