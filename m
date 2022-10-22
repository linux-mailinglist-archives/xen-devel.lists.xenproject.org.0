Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933A2608B6E
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 12:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428175.678063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omBbl-0002dg-QC; Sat, 22 Oct 2022 10:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428175.678063; Sat, 22 Oct 2022 10:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omBbl-0002bB-N6; Sat, 22 Oct 2022 10:20:01 +0000
Received: by outflank-mailman (input) for mailman id 428175;
 Sat, 22 Oct 2022 10:19:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omBbj-0002YP-Bb
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 10:19:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omBbi-0000UN-Bb; Sat, 22 Oct 2022 10:19:58 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omBbi-0006H3-4R; Sat, 22 Oct 2022 10:19:58 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=eXk3fb+T0fBBruJFK/IsBZxIl2QBKqAda3zBSlJJQms=; b=HXqCu/PG3LEJTFjWHUZPSM3U/I
	t5r8Qjbt/mOV9L5WDuDe0hdbXmbMllUqSJrDWjkdd9nzi4E5z07dwrZSjvC2tm0V0nPEP9ooUg0O7
	oJOG3+t9KTH5a5DJBeRh3R1vOk5OsRodlpoO2VxB3IUVCMbjHcikUjNY/rMkXqgnLOO4=;
Message-ID: <03b0e8c8-f50a-f73c-e8a7-72883b23886e@xen.org>
Date: Sat, 22 Oct 2022 11:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-5-ayankuma@amd.com>
 <24feccd2-c90e-2abd-ebc3-4219bd15e380@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 04/12] Arm: GICv3: Emulate GICR_TYPER on AArch32
In-Reply-To: <24feccd2-c90e-2abd-ebc3-4219bd15e380@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/10/2022 23:07, Xenia Ragiadakou wrote:
> On 10/21/22 18:31, Ayan Kumar Halder wrote:
> Hi Ayan
> 
>> Refer Arm IHI 0069H ID020922,
>> The upper 32 bits of GICR_TYPER represent the affinity
>> whereas the lower 32 bits represent the other bits (eg processor
>> number, etc).
>> MPIDR_AFFINITY_LEVEL() returns a 32 bit number on aarch32. Thus, this
>> is appended to return GICR_TYPER register.

The last sentence doesn't seem to match your modification below.

>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>   xen/arch/arm/vgic-v3.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>> index c31140eb20..d86b41a39f 100644
>> --- a/xen/arch/arm/vgic-v3.c
>> +++ b/xen/arch/arm/vgic-v3.c
>> @@ -190,14 +190,18 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct 
>> vcpu *v, mmio_info_t *info,
>>       case VREG64(GICR_TYPER):
>>       {
>> -        uint64_t typer, aff;
>> +        uint64_t typer;
>> +        uint32_t aff;
>>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>> -        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
>> +        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 24 |
>> +               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 16 |
>> +               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 8 |
>> +               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0));
>>           typer = aff;
>> +
>> +        typer = typer << 32;

I find the "typer = aff; typer = typer << 32" quite confusing to read. 
In fact, my first instinct would be to combine the two but this would do 
the wrong thing. So I would prefer if we use a different approach (see 
below).

>> +
>>           /* We use the VCPU ID as the redistributor ID in bits[23:8] */
>>           typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
> 
> I don't see an issue I just want to propose alternatives that I think 
> would reduce the changes, hopefully without breaking it.
> So, other ways would be either to assign v->arch.vmpidr to a new 
> variable uint64_t vmpidr and operate on this (without changing the 
> shifts), or to leave the type of aff uint64_t, adjust the shifts and do 
> typer = aff << 32.

How about making MPIDR_AFFINITY_LEVEL returning a 64-bit value? The 
other option would be to use what Xenia's last option. I.e:

" to level the type of aff uint64_t, adjust the shifts and do typer = 
aff << 32". This would need a suitable comment though explain why the 
shift can't be fold.

Cheers,

-- 
Julien Grall

