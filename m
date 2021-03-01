Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3B13278EC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 09:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91316.172585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGddu-0007kk-A1; Mon, 01 Mar 2021 08:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91316.172585; Mon, 01 Mar 2021 08:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGddu-0007kF-62; Mon, 01 Mar 2021 08:11:02 +0000
Received: by outflank-mailman (input) for mailman id 91316;
 Mon, 01 Mar 2021 08:11:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGdds-0007k1-Qh
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 08:11:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36c5a0b4-6fa5-460a-a2fa-16e82c7ad008;
 Mon, 01 Mar 2021 08:10:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECA42AAC5;
 Mon,  1 Mar 2021 08:10:58 +0000 (UTC)
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
X-Inumbo-ID: 36c5a0b4-6fa5-460a-a2fa-16e82c7ad008
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614586259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=swrp9hl6sdidetG22tkJhfXywPsPVmZJSgAo0ZbE4xY=;
	b=EPkjV+4w5iYTXuSe1blZL+oFnjO0GpusvSRec8agcbf4DKkfGKme/iPFfkjldx5IBz2YUf
	TfeiY2Ui4WetcS9LegCXG8ipTyj+3wMG3aO59cmkLW2sLZB9c+vy7TI0jmPqQb1P0zwBG1
	WTOU+/3P4w+MoLO3EUoOBlP57+awDqI=
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
To: Tim Deegan <tim@xen.org>, Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
 <YDkq3KwtfGZZTyLL@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72c3c863-7465-ce26-1f57-b71227bb2b19@suse.com>
Date: Mon, 1 Mar 2021 09:10:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDkq3KwtfGZZTyLL@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 18:07, Tim Deegan wrote:
> At 14:03 +0100 on 25 Feb (1614261809), Jan Beulich wrote:
>> When none of the physical address bits in PTEs are reserved, we can't
>> create any 4k (leaf) PTEs which would trigger reserved bit faults. Hence
>> the present SHOPT_FAST_FAULT_PATH machinery needs to be suppressed in
>> this case, which is most easily achieved by never creating any magic
>> entries.
>>
>> To compensate a little, eliminate sh_write_p2m_entry_post()'s impact on
>> such hardware.
>>
>> While at it, also avoid using an MMIO magic entry when that would
>> truncate the incoming GFN.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Tim Deegan <tim@xen.org>

Thanks.

>> I wonder if subsequently we couldn't arrange for SMEP/SMAP faults to be
>> utilized instead, on capable hardware (which might well be all having
>> such large a physical address width).
> 
> I don't immediately see how, since we don't control the access type
> that the guest will use.


>> I further wonder whether SH_L1E_MMIO_GFN_MASK couldn't / shouldn't be
>> widened. I don't see a reason why it would need confining to the low
>> 32 bits of the PTE - using the full space up to bit 50 ought to be fine
>> (i.e. just one address bit left set in the magic mask), and we wouldn't
>> even need that many to encode a 40-bit GFN (i.e. the extra guarding
>> added here wouldn't then be needed in the first place).
> 
> Yes, I think it could be reduced to use just one reserved address bit.
> IIRC we just used such a large mask so the magic entries would be
> really obvious in debugging, and there was no need to support arbitrary
> address widths for emulated devices.

Will cook a patch, albeit I guess I'll keep as many of the bits set
as possible, while still being able to encode a full-40-bit GFN.

Ian - I don't suppose you'd consider this a reasonable thing to do
for 4.15? It would allow limiting the negative (performance) effect
the change here has.

Jan

