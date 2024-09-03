Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAF3969EE7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789209.1198769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTRK-0008ES-FL; Tue, 03 Sep 2024 13:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789209.1198769; Tue, 03 Sep 2024 13:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTRK-0008CP-Cp; Tue, 03 Sep 2024 13:19:22 +0000
Received: by outflank-mailman (input) for mailman id 789209;
 Tue, 03 Sep 2024 13:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slTRJ-0008CJ-LP
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:19:21 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20691f01-69f7-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 15:19:19 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5343eeb4973so8221340e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:19:19 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898908f62bsm681458066b.91.2024.09.03.06.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 06:19:17 -0700 (PDT)
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
X-Inumbo-ID: 20691f01-69f7-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725369559; x=1725974359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kvxNoAwBnzg3BCCF1qk32V0u5MQ2ntj8a1JkMMGlL9U=;
        b=YPwehxB7GUIODTu5PL23LxD8ysmNja4Lzr+L6b960XEnm/tv5etEHm4lS5pM0AKMiV
         6tuPxZimol4dXwUUVEsNcyA4Desd0jlgWgv/aBNOjXO3rhk5KgJEHbzt+qlmt9u9Tmj1
         /MwS3mYWr+HJuB54ZZ1CJ3ZjGKjfxXKUIy1Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725369559; x=1725974359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvxNoAwBnzg3BCCF1qk32V0u5MQ2ntj8a1JkMMGlL9U=;
        b=QorlfCHfUj+dE7reQIomJ13NQmoU6N8LcELRVuV9nWbf/v8W/mN25KRdcCj/Bw5wXD
         OzlXMhs6tpdPBJ0+7dWHEMNwQTwC/0z4stD30hzCqiIjrJpbuE+O0jfHAsrbj/WzGa/5
         Ap6CD87t2N029sSta3+mUbzt07wOe5DW/W/oK2mrCks2VVSFR7pxLbJrdFBhsFv4wDdn
         UQEI30g9hK0L5erLPHOU0Wt+V0AhHyH4Fauagi2s2NDmY4HYAAba1oadCf75DXA+jSHI
         oUr+mIXxWnK/BWu/ZMZv6B63QML3ZKog0cpyZJ/IYysyvsRpCToWuO4ZpFh4tbhnFBOd
         A1tg==
X-Forwarded-Encrypted: i=1; AJvYcCVg71r9OWsb6TY6wPh2OJNQx+yinnOvVeC/x2vFRMk8LNnJP8v3hPLPOzhBJ7C6gjOH5dj+/bWQYTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1p8BDVYsmOI2XLuBN0JmuvRxhrstPPDMRM3CizfqQLpH6Lfbh
	Cp4ejTYPmIg6Em8DxwqlrbETulc5cdVafz7pAHsN1wFpszR8VPO+Op4ieZ4iWI0=
X-Google-Smtp-Source: AGHT+IGeNYlg3QMfrKGUZZ2zvzXs9kfJFTINRWV4+dQZW4NE1cBV7htijXDO2aa3A0qWaSTjr+6xUQ==
X-Received: by 2002:a05:6512:3b14:b0:52e:9cc7:4462 with SMTP id 2adb3069b0e04-53546b1dea6mr12897414e87.11.1725369558189;
        Tue, 03 Sep 2024 06:19:18 -0700 (PDT)
Message-ID: <47679a69-660b-49d9-a8c5-4d7ddb2bfbe5@citrix.com>
Date: Tue, 3 Sep 2024 14:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM/vgic: Use for_each_set_bit() in vgic-mmio*
To: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
 <20240902100355.3032079-5-andrew.cooper3@citrix.com>
 <c33b1051-2a51-4843-8fb5-6710d0e4ba91@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c33b1051-2a51-4843-8fb5-6710d0e4ba91@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 11:30 am, Michal Orzel wrote:
>
> On 02/09/2024 12:03, Andrew Cooper wrote:
>>
>> These are all loops over a scalar value, and don't need to call general bitop
>> helpers behind the scenes.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>>
>> Slighly RFC.  It's unclear whether len is the size of the register, or the
>> size of the access.  For sub-GPR accesses, won't the upper bits be clear
>> anyway?  If so, this can be simplified further.
> See dispatch_mmio_write(). "len" refers to access size (i.e. 1/4/8 bytes). Each register is defined
> with a region access i.e. VGIC_ACCESS_32bit that is compared with the actual access. In the current code
> there is no register with 8B access. If there is a mismatch, there will be a data abort injected.
> Also, the top 32-bits are not cleared anywhere, so I don't think we can drop masking. @Julien?

Ok, so it is necessary right now to have the clamping logic in every
callback.

However, given that the size is validated before dispatching, clamping
once in dispatch_mmio_write() would save a lot of repeated code in the
callbacks.

i.e., I think this:

diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index bd4caf7fc326..e8b9805a0b2c 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -590,6 +590,9 @@ static int dispatch_mmio_write(struct vcpu *vcpu,
mmio_info_t *info,
     if ( !region )
         return 0;
 
+    if ( len < sizeof(data) )
+        data &= ~((1UL << (len * 8)) - 1);
+
     switch (iodev->iodev_type)
     {
     case IODEV_DIST:

would work to replace every if() introduced below.

~Andrew


>
>> $ ../scripts/bloat-o-meter xen-syms-arm64-{before,after}
>> add/remove: 0/0 grow/shrink: 2/5 up/down: 20/-140 (-120)
>> Function                                     old     new   delta
>> vgic_mmio_write_spending                     320     332     +12
>> vgic_mmio_write_cpending                     368     376      +8
>> vgic_mmio_write_sactive                      192     176     -16
>> vgic_mmio_write_cactive                      192     176     -16
>> vgic_mmio_write_cenable                      316     288     -28
>> vgic_mmio_write_senable                      320     284     -36
>> vgic_mmio_write_sgir                         344     300     -44
>>
>> $ ../scripts/bloat-o-meter xen-syms-arm32-{before,after}
>> add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-32 (-32)
>> Function                                     old     new   delta
>> vgic_mmio_write_sactive                      204     200      -4
>> vgic_mmio_write_cpending                     464     460      -4
>> vgic_mmio_write_cactive                      204     200      -4
>> vgic_mmio_write_sgir                         336     316     -20
>> ---
>>  xen/arch/arm/vgic/vgic-mmio-v2.c |  3 +--
>>  xen/arch/arm/vgic/vgic-mmio.c    | 36 +++++++++++++++++++++-----------
>>  2 files changed, 25 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio-v2.c
>> index 670b335db2c3..42fac0403f07 100644
>> --- a/xen/arch/arm/vgic/vgic-mmio-v2.c
>> +++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
>> @@ -90,7 +90,6 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
>>      unsigned int intid = val & GICD_SGI_INTID_MASK;
>>      unsigned long targets = (val & GICD_SGI_TARGET_MASK) >>
>>                              GICD_SGI_TARGET_SHIFT;
>> -    unsigned int vcpu_id;
>>
>>      switch ( val & GICD_SGI_TARGET_LIST_MASK )
>>      {
>> @@ -108,7 +107,7 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
>>          return;
>>      }
>>
>> -    bitmap_for_each ( vcpu_id, &targets, 8 )
>> +    for_each_set_bit ( vcpu_id, (uint8_t)targets )
>>      {
>>          struct vcpu *vcpu = d->vcpu[vcpu_id];
>>          struct vgic_irq *irq = vgic_get_irq(d, vcpu, intid);
>> diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
>> index bd4caf7fc326..f7c336a238ab 100644
>> --- a/xen/arch/arm/vgic/vgic-mmio.c
>> +++ b/xen/arch/arm/vgic/vgic-mmio.c
>> @@ -69,9 +69,11 @@ void vgic_mmio_write_senable(struct vcpu *vcpu,
>>                               unsigned long val)
>>  {
>>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
>> -    unsigned int i;
>>
>> -    bitmap_for_each ( i, &val, len * 8 )
>> +    if ( len < sizeof(val) )
>> +        val &= (1UL << (len * 8)) - 1;
>> +
>> +    for_each_set_bit ( i, val )
>>      {
>>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>>          unsigned long flags;
>> @@ -114,9 +116,11 @@ void vgic_mmio_write_cenable(struct vcpu *vcpu,
>>                               unsigned long val)
>>  {
>>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
>> -    unsigned int i;
>>
>> -    bitmap_for_each ( i, &val, len * 8 )
>> +    if ( len < sizeof(val) )
>> +        val &= (1UL << (len * 8)) - 1;
>> +
>> +    for_each_set_bit ( i, val )
>>      {
>>          struct vgic_irq *irq;
>>          unsigned long flags;
>> @@ -182,11 +186,13 @@ void vgic_mmio_write_spending(struct vcpu *vcpu,
>>                                unsigned long val)
>>  {
>>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
>> -    unsigned int i;
>>      unsigned long flags;
>>      irq_desc_t *desc;
>>
>> -    bitmap_for_each ( i, &val, len * 8 )
>> +    if ( len < sizeof(val) )
>> +        val &= (1UL << (len * 8)) - 1;
>> +
>> +    for_each_set_bit ( i, val )
>>      {
>>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>>
>> @@ -230,11 +236,13 @@ void vgic_mmio_write_cpending(struct vcpu *vcpu,
>>                                unsigned long val)
>>  {
>>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
>> -    unsigned int i;
>>      unsigned long flags;
>>      irq_desc_t *desc;
>>
>> -    bitmap_for_each ( i, &val, len * 8 )
>> +    if ( len < sizeof(val) )
>> +        val &= (1UL << (len * 8)) - 1;
>> +
>> +    for_each_set_bit ( i, val )
>>      {
>>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>>
>> @@ -326,9 +334,11 @@ void vgic_mmio_write_cactive(struct vcpu *vcpu,
>>                               unsigned long val)
>>  {
>>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
>> -    unsigned int i;
>>
>> -    bitmap_for_each ( i, &val, len * 8 )
>> +    if ( len < sizeof(val) )
>> +        val &= (1UL << (len * 8)) - 1;
>> +
>> +    for_each_set_bit ( i, val )
>>      {
>>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>>
>> @@ -356,9 +366,11 @@ void vgic_mmio_write_sactive(struct vcpu *vcpu,
>>                               unsigned long val)
>>  {
>>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
>> -    unsigned int i;
>>
>> -    bitmap_for_each ( i, &val, len * 8 )
>> +    if ( len < sizeof(val) )
>> +        val &= (1UL << (len * 8)) - 1;
>> +
>> +    for_each_set_bit ( i, val )
>>      {
>>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>>
>> --
>> 2.39.2
>>
> ~Michal


