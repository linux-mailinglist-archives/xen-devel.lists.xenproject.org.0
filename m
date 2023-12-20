Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D4819FA6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657788.1026875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFwR1-00045u-4O; Wed, 20 Dec 2023 13:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657788.1026875; Wed, 20 Dec 2023 13:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFwR1-00043N-1C; Wed, 20 Dec 2023 13:16:27 +0000
Received: by outflank-mailman (input) for mailman id 657788;
 Wed, 20 Dec 2023 13:16:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFwQz-00043H-Mf
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:16:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFwQw-0005OQ-Ac; Wed, 20 Dec 2023 13:16:22 +0000
Received: from [15.248.2.151] (helo=[10.6.7.47])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFwQw-0006tv-43; Wed, 20 Dec 2023 13:16:22 +0000
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
	bh=QOoOv7H7j7XVI01FNeoGZYmGtO1OduUZJiBcLGGInMI=; b=xgt2O8Y39j+DzfkszFGccDPDZI
	eSBpepcn9IY0FB+9OJAV+IXzqAXnADCOlkOMh+KMcgkJ2UyP11cpVX5CE9JjkCPnuZqK1MMUJuc/y
	rTwBsPCvRIxJpF5kyAyGnmUMN2InFolKgHfmzek+ekQZtvEHLQfyNSUu5xec+XoRXYG0=;
Message-ID: <29076f96-3497-4b08-9f17-22577e3b90c1@xen.org>
Date: Wed, 20 Dec 2023 13:16:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231218202959.1390114-1-ayan.kumar.halder@amd.com>
 <F1A640BE-0CDC-4026-BBB3-637ABE7D996C@arm.com>
 <5E9E5368-8AD3-490E-8034-78F5BAF23006@arm.com>
 <34f3342a-b86e-4e74-bfba-d55e0de55600@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <34f3342a-b86e-4e74-bfba-d55e0de55600@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 20/12/2023 12:15, Ayan Kumar Halder wrote:
> 
> On 20/12/2023 09:43, Luca Fancellu wrote:
>>
>>> On 20 Dec 2023, at 09:29, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>
>>> Hi Ayan,
> 
> Hi Luca,
> 
> Thanks for looking into this.
> 
>>>
>>>> On 18 Dec 2023, at 20:29, Ayan Kumar Halder 
>>>> <ayan.kumar.halder@amd.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Refer 
>>>> https://lore.kernel.org/all/alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop/T/
>>>> for the previous discussion on this issue.
>>>>
>>>> Also, the linux earlycon hvc driver has been fixed.
>>>> See 
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=0ec058ece2f933aed66b76bd5cb9b5e6764853c3
>>>>
>>>> Changes from v1:-
>>>> 1. Split the change across 3 patches as per the design consensus.
>>>>
>>>> Ayan Kumar Halder (3):
>>>> xen/arm: Add emulation of Debug Data Transfer Registers
>>>> xen: arm: Introduce CONFIG_PARTIAL_EMULATION
>>>> xen/arm: Introduce "partial-emulation" xen command line option
>>> I’m a bit puzzled about the order of these changes, wouldn’t be 
>>> better to
>>> Introduce the partial emulation Kconfig and command line args in the 
>>> same
>>> patch together with something that uses it?
> 
> You have read my mind. :) I wan't sure about how to do the split...
> 
>>>
>>> I think here you wanted to keep Michal patch untouched, but I feel 
>>> that a
>>> correct split for this serie would be maybe introducing Kconfig, boot 
>>> args and
>>> one of the arm64/arm32 emulation, and on a second patch the other one
>>> (Or vice-versa)?
>>   ^^^^^^^-----> for the vice-versa, I meant 1st patch Arm64, 2nd Arm32
>>   or vice-versa.
> 
> I wanted to keep Michal's change for the arm64 as it is. And introduce 
> Kconfig and command line in separate patches.

I agree and the Kconfig/command line should be a separate patches. 
However, I think it should be introduced first rather than last (I don't 
want the code to be always enabled even temporiraly). So my preferred 
option would be...

> 
> But I agree, it does not look clean.
> 
> 
> I am fine to follow your suggestion ie (Option 1)
> 
> Patch 1 ---> arm64 changes + Kconfig + cmd_line (authored by Michal)
> 
> Patch 2 ---> arm32 changes (which will use the Kconfig and cmd_line 
> introduced before)
> 
> 
> Alternatively, I am thinking like this (Option 2)
> 
> Patch 1 --> arm64 changes (authored by Michal)
> 
> Patch 2 --> arm32 changes
> 
> Patch 3 ---> Kconfig + cmd_line (which will touch patch 1 and 2).


Option 3

Patch 1 -> Kconfig + cmd_line
Patch 2 -> Arm64 changes
Patch 3 -> Arm32 changes

I could also settle with option 1.

Cheers,

-- 
Julien Grall

