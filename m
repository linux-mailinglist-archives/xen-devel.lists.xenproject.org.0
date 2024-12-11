Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B048C9ED4A4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 19:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855248.1268241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLRKH-0006nn-WB; Wed, 11 Dec 2024 18:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855248.1268241; Wed, 11 Dec 2024 18:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLRKH-0006ll-TM; Wed, 11 Dec 2024 18:20:45 +0000
Received: by outflank-mailman (input) for mailman id 855248;
 Wed, 11 Dec 2024 18:20:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H7kK=TE=bounce.vates.tech=bounce-md_30504962.6759d7f9.v1-1d39b95fe262477686aa09aac7f8edb9@srs-se1.protection.inumbo.net>)
 id 1tLRKH-0006lf-7W
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 18:20:45 +0000
Received: from mail180-17.suw31.mandrillapp.com
 (mail180-17.suw31.mandrillapp.com [198.2.180.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a18c2258-b7ec-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 19:20:43 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-17.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y7kRs54MVzRKM3Cd
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 18:20:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1d39b95fe262477686aa09aac7f8edb9; Wed, 11 Dec 2024 18:20:41 +0000
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
X-Inumbo-ID: a18c2258-b7ec-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1733941241; x=1734201741;
	bh=MXx6097v6tjQI3SQM06xqM84N8iVt7qg7svrUgiSIKg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=K1X7LGFSxctL8TJYxtAhoObl+y+Nf9iiEQ6A2K0CmwdF+psbYjeXKz36Rby8jBmCk
	 H3N7as4BiMvHb31NucPIkKHtwD+AFH49+Xppo2v6i6mQGDkhb4ioNdNVVvXaQNGOuL
	 o9tqZEt3XCAkC6Rzk2WvcYz6YIAfuZRDDQ4TYRbwqAyB8WlgoK7aY8RbvjgDqBtMPj
	 GIuRhmoJLwAN72Zfls/ZS2wbKV/PWekN/llQOo4X6+J1RCUm5mJk3ix6nurLQr2Wtz
	 NTChwWnYgZm4A2GI4jZWm0gCiF9jgjBVUAUPkFARMCPIiDKvi1vZ0kIVS9LgEvBUxN
	 Os7sOKTHGlcpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1733941241; x=1734201741; i=thierry.escande@vates.tech;
	bh=MXx6097v6tjQI3SQM06xqM84N8iVt7qg7svrUgiSIKg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LPpb4JcBcJauyzgBGfmeUdKYyanuuyElQdCfJMRVo7J+QCVOhsnOrHL63PrfLuXc+
	 GYzQxP7rGVhAvXMkjGpJUZBks7g9r37ZyyYeKTugk+mmGQlnRlAumDFGdplyRF2CJ1
	 Se6An7n4CCCxH9XtdHO+y988YbGly+wze8gMIdteBncxHU6yXaL2kjUnjiIRIvN/1j
	 Pz+sirAyrQsSlc5OpUq9Y+4+d9HrkcMY6EIMBkaNz12YhclIjlwFbX77bklCyjtSjw
	 PmY6bCS87ARtTFWr33GOaTry6471jDw+rSjeLgbkQJ3jjw3PkRFJW86FvC7I71QXSd
	 /l++yof0QYc3g==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/xen/mmu:=20Increase=20MAX=5FCONTIG=5FORDER?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1733941240628
Message-Id: <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>, linux-kernel@vger.kernel.org
References: <20241204171346.458105-1-thierry.escande@vates.tech> <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
In-Reply-To: <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1d39b95fe262477686aa09aac7f8edb9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241211:md
Date: Wed, 11 Dec 2024 18:20:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 09/12/2024 11:04, Jan Beulich wrote:
> On 04.12.2024 18:14, Thierry Escande wrote:
>> With change 9f40ec84a797 (xen/swiotlb: add alignment check for dma
>> buffers), the driver mpt3sas fails to load because it cannot allocate
>> its DMA pool for an allocation size of ~2,3 MBytes. This is because the
>> alignement check added by 9f40ec84a797 fails and
>> xen_swiotlb_alloc_coherent() ends up calling
>> xen_create_contiguous_region() with a size order of 10 which is too high
>> for the current max value.
>>
>> This patch increases the MAX_CONTIG_ORDER from 9 to 10 (4MB) to allow
>> such allocations.
>>
>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>> ---
>>  arch/x86/xen/mmu_pv.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
>> index 55a4996d0c04..7f110740e1a2 100644
>> --- a/arch/x86/xen/mmu_pv.c
>> +++ b/arch/x86/xen/mmu_pv.c
>> @@ -2200,7 +2200,7 @@ void __init xen_init_mmu_ops(void)
>>  }
>>  
>>  /* Protected by xen_reservation_lock. */
>> -#define MAX_CONTIG_ORDER 9 /* 2MB */
>> +#define MAX_CONTIG_ORDER 10 /* 4MB */
>>  static unsigned long discontig_frames[1<<MAX_CONTIG_ORDER];
> 
> While lacking respective commentary, bumping this value imo also needs to
> take into account Xen itself, at least commit-message-wise. The bumping is
> fine for Dom0 in any event. It is also fine for DomU-s with the defaults
> built into the hypervisor (orders 12 and 10 respectively for x86 and Arm),
> yet especially for Arm (and in the future PPC and RISC-V) any further
> bumping would be less straightforward.

Thanks for pointing this out. On the Xen side, CONFIG_CTLDOM_MAX_ORDER
and CONFIG_HWDOM_MAX_ORDER seem big enough on all architectures. But I
see CONFIG_DOMU_MAX_ORDER set to 9 (also all archs). Won't that be a
problem for drivers trying to allocate more than that from a domU ?

> However - does the driver really need this big a contiguous chunk? It
> would seem far more desirable to me to break that up some, if possible.

Since this works on bare metal I'm afraid the driver maintainer (mpt
fusion driver) will just tell me to fix Xen.

Regards,
Thierry

> 
> Jan

