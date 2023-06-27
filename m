Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937DC7405E6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 23:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556289.868700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEGVt-0007GS-6K; Tue, 27 Jun 2023 21:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556289.868700; Tue, 27 Jun 2023 21:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEGVt-0007Eb-2u; Tue, 27 Jun 2023 21:46:17 +0000
Received: by outflank-mailman (input) for mailman id 556289;
 Tue, 27 Jun 2023 21:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e6xO=CP=kernel.org=dinguyen@srs-se1.protection.inumbo.net>)
 id 1qEGVr-0007EV-JU
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 21:46:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0866b3eb-1534-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 23:46:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C06861230;
 Tue, 27 Jun 2023 21:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B828C433C0;
 Tue, 27 Jun 2023 21:46:08 +0000 (UTC)
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
X-Inumbo-ID: 0866b3eb-1534-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687902371;
	bh=kNRWvXJ4xm/ToNiiufH10E8eFH/kz2M9O+MlUTHu8xs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dCRVJo7cFQXZ8fu18KEwzUAM8G0H5FyGdPaG2Z+qvBFFcyKeAxATUHfslPZ9gYM65
	 fUBiDpVsOz7s37BrDNtKQR45m2YXiVV1qCXDc7/IqTUyGPp94swp1hVlVD46GBE2I6
	 ROQnI6XrB6lpqjS5yIx1Y45Syzn50mAuAt/l6x8z9hM8jKvnyg9/ULLIdryM37oYq/
	 Yh/pcTOLxD63zBFcAF7ckd4qr+sAF7rCAPraQ9w49bcBc1D8+6l9awCNsC+QptysIi
	 WJeJrxhrcTPAEZJCX0+/n8roXYpzomEdplofCwlGlHS3mGUetW7sVNo6hPwc3Lqpw5
	 gb3eeXBRWUy2g==
Message-ID: <70776142-a778-9c20-5594-835ed6f7e7a2@kernel.org>
Date: Tue, 27 Jun 2023 16:46:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Vishal Moola <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
 <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
 <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
 <CAOzc2pxdqeaRjYLfOqvMW-AEobTzD9xOP+MyP9nxgEbi1T2r7Q@mail.gmail.com>
 <c3751051-7fc7-7129-b9a7-ead71c576ace@kernel.org>
 <2b7e8b1d-1697-6a25-434d-352f95e6fff2@roeck-us.net>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <2b7e8b1d-1697-6a25-434d-352f95e6fff2@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/27/23 16:01, Guenter Roeck wrote:
> On 6/27/23 13:05, Dinh Nguyen wrote:
>>
>>
>> On 6/27/23 14:56, Vishal Moola wrote:
>>> On Tue, Jun 27, 2023 at 12:14 PM Guenter Roeck <linux@roeck-us.net> 
>>> wrote:
>>>>
>>>> On 6/27/23 12:10, Guenter Roeck wrote:
>>>>> On 6/27/23 10:42, Vishal Moola wrote:
>>>>>> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck 
>>>>>> <linux@roeck-us.net> wrote:
>>>>>>>
>>>>>>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) 
>>>>>>> wrote:
>>>>>>>> Part of the conversions to replace pgtable 
>>>>>>>> constructor/destructors with
>>>>>>>> ptdesc equivalents.
>>>>>>>>
>>>>>>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>>>>>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>>>>>>
>>>>>>> This patch causes all nios2 builds to fail.
>>>>>>
>>>>>> It looks like you tried to apply this patch on its own. This patch 
>>>>>> depends
>>>>>> on patches 01-12 of this patchset to compile properly. I've 
>>>>>> cross-compiled
>>>>>> this architecture and it worked, but let me know if something fails
>>>>>> when its applied on top of those patches (or the rest of the 
>>>>>> patchset).
>>>>>
>>>>>
>>>>> No, I did not try to apply this patch on its own. I tried to build 
>>>>> yesterday's
>>>>> pending-fixes branch of linux-next.
>>>>>
>>>>
>>>> A quick check shows that the build fails with next-20230627. See log 
>>>> below.
>>>
>>> Ah it looks like this one slipped into -next on its own somehow? 
>>> Stephen, please
>>> drop this patch from -next; it shouldn't be in without the rest of the
>>> patchset which
>>> I intend to have Andrew take through the mm tree.
>>>
>>
>> I apologize, but I queue this patch up for Linus and it's been pulled 
>> for this merge window. I didn't realize you were going to take this 
>> patchset through another tree.
>>
>> Sorry about that.
>>
> 
> Yes, indeed, I just confirmed that all nios2 builds in the mainline kernel
> are now broken.
> 

Please let me know if you need to do anything. I'm going to out for a 
week starting tomorrow.

Dinh

