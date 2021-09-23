Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B99415A3C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 10:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193514.344687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKOV-0002Ji-JU; Thu, 23 Sep 2021 08:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193514.344687; Thu, 23 Sep 2021 08:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKOV-0002Hk-GA; Thu, 23 Sep 2021 08:47:51 +0000
Received: by outflank-mailman (input) for mailman id 193514;
 Thu, 23 Sep 2021 08:47:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTKOU-0002He-2c
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 08:47:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKOO-0003Wg-MZ; Thu, 23 Sep 2021 08:47:44 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKOO-00076k-BB; Thu, 23 Sep 2021 08:47:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=EFrIMcFb+Qzx31VA8bLct+FAFfProGkLXjBGJVlcABg=; b=MOpm3sGBCAjK/UbEBqTqEtIoY6
	h++YyRK2392PJGzh4Ipx+xZbyquPI0AHHM5YFAw0bWV8fWL9jyFufKAJWw+VuCw9HedPaPRL453Q4
	tFlKDjIx1wKq1JAxTvvVQgrNHUjkOsiyJF9o48UP4XSRL2+LHQguITtQOPXvglM9rKGA=;
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
 <YUr525A3B0cs2rBo@MacBook-Air-de-Roger.local>
From: Julien Grall <julien@xen.org>
Message-ID: <b93a13e3-2ad9-aac4-7f87-b290aa4c3953@xen.org>
Date: Thu, 23 Sep 2021 13:47:37 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUr525A3B0cs2rBo@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 22/09/2021 14:39, Roger Pau Monné wrote:
> On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wrote:
>>
>>
>> On 22/09/2021 13:21, Roger Pau Monne wrote:
>>> Hello,
>>
>> Hi Roger,
>>
>>> First patch on the series is a trivial change to xenconsoled in order to
>>> use xenforeignmemory stable library in order to map the shared console
>>> ring instead of the unstable libxc interface. It's reviewed and ready to
>>> go in.
>>>
>>> Patches 2 and 3 allow setting the host wide command line `gnttab` option
>>> on a per domain basis. That means selecting the max allowed grant table
>>> version and whether transitive grants are allowed.
>>>
>>> The last 3 patches attempt to implement support for creating guests
>>> without a grant table. This requires some changes to xenstored in order
>>> to partially support guests without a valid ring interface, as the lack
>>> of grant table will prevent C xenstored from mapping the shared ring.
>>> Note this is not an issue for Ocaml xenstored, as it still uses the
>>> foreign memory interface to map the shared ring, and thus won't notice
>>> the lack of grant table support on the domain.
>>
>> I find a bit odd that the Xenstore support is conditional to whether grant
>> table is available. Are you expecting domains with no grant table to have no
>> PV drivers (including PV shutdown)?
> 
> I don't really expect much, as having guests without grant table is a
> developer option right now, if someone wants to make use of them for
> any reason it would need some thought.
> 
> The other option would be my first proposal to restore foreign mapping
> of the xenstore ring on that case:
> 
> https://lore.kernel.org/xen-devel/20210917154625.89315-6-roger.pau@citrix.com/
> 
> But it's also arguable that a guest not having a grant table should
> also likely prevent foreign mapping attempts. Plus such foreign
> mapping won't work from stubdomains.

There is another option: extend the acquire hypercall to allow xenstored 
domain to map the xenstore interface. This would require more work, but 
at least it would avoid the interesting dependency on the grant table.

> 
> I'm fine with dropping those patches if they turn out to be too
> controversial, I think it's an interesting option to be able to
> disable the grant table, but I don't have a full picture of how that
> could be used in practice. Maybe others have and would be willing to
> pick this up.

I think the current approach is probably OK as a developper option. 
However, we should at least document in the option that disabling the 
grant-table will also disable Xenstore (anything else?) support when 
using C Xenstored.

It might also be worth to clearly state in the doc that this is only 
intended for developer use and not supported.

Cheers,

-- 
Julien Grall

