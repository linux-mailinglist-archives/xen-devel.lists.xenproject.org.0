Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57545374B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 17:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226435.391337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn1En-0002pf-M0; Tue, 16 Nov 2021 16:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226435.391337; Tue, 16 Nov 2021 16:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn1En-0002mr-Hk; Tue, 16 Nov 2021 16:23:13 +0000
Received: by outflank-mailman (input) for mailman id 226435;
 Tue, 16 Nov 2021 16:23:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mn1Em-0002ml-8H
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 16:23:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn1Ei-0007wb-Bj; Tue, 16 Nov 2021 16:23:08 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.85.43.125])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn1Ei-0000G2-58; Tue, 16 Nov 2021 16:23:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=wuv89EBRSJv+AgaQLaZ0tKe5JZaIDN832iKx1103IdI=; b=VEGfYuNsk35XN16Jq/OsfU2R8M
	XMQU6Dm/AjC4ytNP2wVeSCJ6u7tpGMA6dJt3ABzKaqUq6cm0ZZ77hGbyJsDwfbRCpnuY8vNRfNVr4
	Op344olMS425dxgdE5D+EXi+itv7Kkw5Wj6nNzoPM9LM99AnkxXVorZq/7UHtaJGrfVw=;
Message-ID: <5f5dae42-795e-66cf-e21f-d92e33bc369c@xen.org>
Date: Tue, 16 Nov 2021 16:23:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
To: Ian Jackson <iwj@xenproject.org>, Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
 <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
 <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
 <3B8E0C6E-0522-4F73-B6C2-827FA45C87BA@arm.com>
 <010fa02f-e561-e7a8-9638-5246db9166b4@xen.org>
 <725F3F68-A1CE-42FB-9C8A-0700CDD02E8E@arm.com>
 <a07ff375-b910-0d73-e957-15ba9d2535fe@xen.org>
 <alpine.DEB.2.22.394.2111151359360.1412361@ubuntu-linux-20-04-desktop>
 <1606F25D-53BF-4350-B065-B1FAB525F6A1@arm.com>
 <24979.51557.253278.46402@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <24979.51557.253278.46402@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/11/2021 15:08, Ian Jackson wrote:
> Luca Fancellu writes ("Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64"):
>>> On 15 Nov 2021, at 22:00, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>> On Mon, 15 Nov 2021, Julien Grall wrote:
>>>> That would indeed be better. I'd like this patch to be merged in 4.16. Would
>>>> you be able to send a new version in the next couple of days?
>>>
>>> I'd love that too; adding Ian so that he is aware.
>>
>> Hi, yes I will prepare it and push very soon.
> 
> Can someone explain to me what is going on here in management-level-speak ?
> I have read the thread and, as far as I can tell:
> 
> There was an actual regression with Grub2 on ARM64.  This was fixed by
> 9bc9fff04ba0 "xen/efi: Fix Grub2 boot on arm64" (committed on the 5th
> of Novwmber).
> 
> But there are some objections to parts of that patch, from Jan.  It is
> not clear to me what the status of those objections is.
> 
> Was I wrong to think that Jan had given an R-b ?  Had it been
> withdrawn ?  I apologise if I committed a patch I shouldn't have.
> (I have a vague memory of some conversation about this on irc but
> nothing about this seems to have made it into email.)
> 
> AIUI from the thread, most of this discussion is about a followup
> patch.  I don't understand the nature of the problem the followup
> patch fixes, or the risk of the followup patch.
> 
> Does the current state of staging have a regression or serious bug ?
> Who is affected by this bug and what are the consequences ?

I think there was some confusion from my side, I thought the original 
path was not committed and therefore we would respin it and fold the fix 
discussed. Apologies for that.

Given the original patch is merged, my view on the new patch is 
different. This is improving performance during boot. While it would be 
a nice patch to merge, I am less inclined to get it merged in 4.16.

That said, the 4.16 tree will be re-opened for backports soon after 
4.16.0 is released. In the past, we backported performance improvement 
patch and we could consider to do the same in this case as well.

Cheers,

-- 
Julien Grall

