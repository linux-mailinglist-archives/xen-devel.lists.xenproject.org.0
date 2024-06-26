Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D226C918173
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 14:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748824.1156741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSAQ-0003wl-CF; Wed, 26 Jun 2024 12:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748824.1156741; Wed, 26 Jun 2024 12:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSAQ-0003uZ-81; Wed, 26 Jun 2024 12:54:30 +0000
Received: by outflank-mailman (input) for mailman id 748824;
 Wed, 26 Jun 2024 12:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3iT=N4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMSAO-0003uT-J7
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 12:54:28 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37b925cc-33bb-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 14:54:26 +0200 (CEST)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-63bb0ff142cso65147147b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 05:54:26 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef32f9csm54525796d6.91.2024.06.26.05.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 05:54:24 -0700 (PDT)
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
X-Inumbo-ID: 37b925cc-33bb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719406465; x=1720011265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gX3ZqrjiIkChEaGWWU8955WHVk5SImB4mMGzS5YrY4E=;
        b=CIlanUa4O2SwPI44DGextiVBVboYoZOIiMywM4A+ClyL4qvt9Ldf698RseScxaksWV
         KddBi22GBocrO8jmhWbhlCj+fMjuO6eJileXh0yy+fFeq9apWYMB03sLpVu4xYyNFlFN
         Ban5zAe1VtqlRrd8i/QQUbrNBuuLpdFmSAbjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719406465; x=1720011265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gX3ZqrjiIkChEaGWWU8955WHVk5SImB4mMGzS5YrY4E=;
        b=RB0E/PO+TrS6j3xBPRgHQ2e9NJDpSVuOQVfFrJC9sCSc0Knoe//no27RMfb0hb3MUk
         Zc+ySIlt8B2FlsG9HL9J8tBx3WrYwbMDYJrFWSoacGK4Ym0xbp3ZlkR6aqhZ1Az25rCK
         XuzbZCODTcZ84Rf9RPy4Xt90XFkwk7oALwLiuAAgxXY/itbfRhKYb5pckwoRLYyReT+Y
         X3KA7dd9uKCsQSX9vPuG8Wbm3zlN1dc70BYUQtjDVoHI2Qj6eunUiKa5YegL8Is6q2b2
         yK34DkHZFw5eqnU29Sh2vaFly/+LMrl9i3rNjUPnTkQ+0kvp1aqMMC2kJIjx4sOaAGJK
         vH/A==
X-Forwarded-Encrypted: i=1; AJvYcCW6eWUqM88QBzIo01NQ8VxR0yZvBxm4D1BxIrMx1WZ7czbuquAN5ZLwLqcMRdSYe9oRx5hC4cnCe8tCRxMTS7qWJ5LQ+qVjCQlnoBmZAoA=
X-Gm-Message-State: AOJu0Ywqi2nC4rvbZ7Mkh40XJ56g7U/IGGXXaCYvw4toogvW2Pj1SSvf
	uPenM1ZuURuJLCjgkEPjVCXooTaG7bw0dRmpyK6yayc0YuZkhULs6LAdZBz5Hb8=
X-Google-Smtp-Source: AGHT+IHhm8+tpo7d506oS964vIzCHDLl158ZRWx5Lhs371xJB9EapGZIHvebkhPy/R5WIw4KJB/IWw==
X-Received: by 2002:a81:690b:0:b0:627:7f2a:3b0a with SMTP id 00721157ae682-6429aa00545mr99368287b3.31.1719406465268;
        Wed, 26 Jun 2024 05:54:25 -0700 (PDT)
Message-ID: <7d1e7357-6dd3-43d5-9fa6-bdfab55a678c@citrix.com>
Date: Wed, 26 Jun 2024 13:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more
 efficient
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-2-andrew.cooper3@citrix.com>
 <fc04af37-6ef6-4c91-a625-d541f9f9bfe5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fc04af37-6ef6-4c91-a625-d541f9f9bfe5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2024 10:49 am, Jan Beulich wrote:
> On 25.06.2024 21:07, Andrew Cooper wrote:
>> There are two issues.  First, pi_test_and_clear_on() pulls the cache-line to
>> the CPU and dirties it even if there's nothing outstanding, but the final
>> for_each_set_bit() is O(256) when O(8) would do, and would avoid multiple
>> atomic updates to the same IRR word.
> The way it's worded (grammar wise) it appears as if the 2nd issue is missing
> from this description. Perhaps you meant to break the sentence at "but" (and
> re-word a little what follows), which feels a little unmotivated to me (as a
> non-native speaker, i.e. may not mean anything) anyway? Or maybe something
> simply got lost in the middle?

You're right - the grammar is not great.  I'll rework it.

>
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2321,18 +2321,63 @@ static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
>>  
>>  static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
>>  {
>> -    struct vlapic *vlapic = vcpu_vlapic(v);
>> -    unsigned int group, i;
>> -    DECLARE_BITMAP(pending_intr, X86_NR_VECTORS);
>> +    struct pi_desc *desc = &v->arch.hvm.vmx.pi_desc;
>> +    union {
>> +        uint64_t _64[X86_NR_VECTORS / (sizeof(uint64_t) * 8)];
>> +        uint32_t _32[X86_NR_VECTORS / (sizeof(uint32_t) * 8)];
>> +    } vec;
>> +    uint32_t *irr;
>> +    bool on;
>>  
>> -    if ( !pi_test_and_clear_on(&v->arch.hvm.vmx.pi_desc) )
>> +    /*
>> +     * The PIR is a contended cacheline which bounces between the CPU and
>> +     * IOMMU.  The IOMMU updates the entire PIR atomically, but we can't
>> +     * express the same on the CPU side, so care has to be taken.
>> +     *
>> +     * First, do a plain read of ON.  If the PIR hasn't been modified, this
>> +     * will keep the cacheline Shared and not pull it Excusive on the CPU.
>> +     */
>> +    if ( !pi_test_on(desc) )
>>          return;
>>  
>> -    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
>> -        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
>> +    /*
>> +     * Second, if the plain read said that ON was set, we must clear it with
>> +     * an atomic action.  This will bring the cachline to Exclusive on the
>> +     * CPU.
>> +     *
>> +     * This should always succeed because noone else should be playing with
>> +     * the PIR behind our back, but assert so just in case.
>> +     */
> Isn't "playing with" more strict than what is the case, and what we need
> here? Aiui nothing should _clear this bit_ behind our back, while PIR
> covers more than just this one bit, and the bit may also become reset
> immediately after we cleared it.

The IOMMU or other CPU forwarding an IPI strictly sets ON, and this CPU
(either the logic here, or microcode when in non-root mode) strictly
clears it.

But it is ON specifically that we care about, so I'll make that more clear.

>
>> +    on = pi_test_and_clear_on(desc);
>> +    ASSERT(on);
>>  
>> -    for_each_set_bit(i, pending_intr, X86_NR_VECTORS)
>> -        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
>> +    /*
>> +     * The cacheline is now Exclusive on the CPU, and the IOMMU has indicated
>> +     * (via ON being set) thatat least one vector is pending too.
> This isn't quite correct aiui, and hence perhaps better not to state it
> exactly like this: While we're ...
>
>>  Atomically
>> +     * read and clear the entire pending bitmap as fast as we, to reduce the
>> +     * window that the IOMMU may steal the cacheline back from us.
>> +     *
>> +     * It is a performance concern, but not a correctness concern.  If the
>> +     * IOMMU does steal the cacheline back, we'll just wait to get it back
>> +     * again.
>> +     */
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._64); ++i )
>> +        vec._64[i] = xchg(&desc->pir[i], 0);
> ... still ahead of or in this loop, new bits may become set which we then
> may handle right away. The "on" indication on the next entry into this
> logic may then be misleading, as we may not find any set bit.

Hmm.  Yes.

The IOMMU atomically swaps the entire cacheline in one go, so won't
produce this state.  However, the SDM algorithm for consuming it says
specifically:

1) LOCK AND to clear ON, leaving everything else unmodified
2) 256-bit-granular read&0 PIR, merging into VIRR

Which now I think about it, is almost certainly because the Atom cores
only have a 256-bit datapath.

Another Xen CPU sending an IPI sideways will have to do:

    set_bit(pir[vec])
    set_bit(ON)
    IPI(delivery vector)

in this order for everything to work.

ON is the signal for "go and scan the PIR", and (other than exact
ordering races during delivery) means that there is a bit set in PIR.

I'll see if I can make this clearer.


> All the code changes look good to me, otoh.

Thanks.

~Andrew

