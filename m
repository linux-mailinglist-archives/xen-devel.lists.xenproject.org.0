Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447AA60CF2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:17:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914202.1319992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1Aa-0005AN-HA; Fri, 14 Mar 2025 09:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914202.1319992; Fri, 14 Mar 2025 09:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1Aa-00057j-DR; Fri, 14 Mar 2025 09:17:32 +0000
Received: by outflank-mailman (input) for mailman id 914202;
 Fri, 14 Mar 2025 09:17:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt1AZ-00057H-29
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:17:31 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26bb4010-00b5-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 10:17:28 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so1535725f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:17:28 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8e43244sm5034722f8f.60.2025.03.14.02.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 02:17:27 -0700 (PDT)
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
X-Inumbo-ID: 26bb4010-00b5-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741943848; x=1742548648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9oCRCnAvNt3XVteaii5vUjBtZABZ1cVVPcumfy3ZmVo=;
        b=KVC7TT0iJ91OS/8z0ktpYu31cZHaBaJk4PNuq1OXPvfdFNH59W6QGhEWoRAAOcMmcL
         QZcKq3Wbx6B8apqKWP48LK5pIoVsP44rj2+vMFPcQLzvIEI2tDrl1DXjVKfRbX+e/AoS
         Xy7RPtMv64jZ54FJZVVwTI6uFo5Y4w7zLV2PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943848; x=1742548648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oCRCnAvNt3XVteaii5vUjBtZABZ1cVVPcumfy3ZmVo=;
        b=WUMlteghB9LmNSucr6NwF8XTfwPgAbnIEcxOmZXpUn4tmHTuQZlh1nxUqtYXEpscKV
         CihdpKb1GQVjckQ/j+Wcr8LHXpRFcDCncmmzkVVcDSWUvW0+lzmGIdchoaLps7fvDFGg
         W8OzAVhzyVlsHCvUButQ7/WMDs5bQsmglslIRXceespew/uIeC5ELWK3YrJgWcpgjqSb
         IkhRGZfEea2QEQByqw1RO/0ae7bMk1+6GruRA1xDIjv2X3rqYlP07NNHdOlSUMpMk4YK
         koVIWgu5QUgSbaDOROQCfasnaixXDjpVlCSf7VEFy7WSKF+p6G7xr+Rti+nAXI5zH1yj
         bW4g==
X-Forwarded-Encrypted: i=1; AJvYcCUHeRxQQSzvjRYBkQbIbaaYwSu10aQQP7Xqws+jUeazKhNoIw+SlvbZyizVTiHE4irZtyglxrsNt/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykMLoxR6zEBaZbGlZqdx232Ol7oEy0Trx1VwWfJTcrnHbLVoui
	Pxd9TUYUPx+mqlEouMEex42WRUVXTpsM27PgHlsEJXrKpN4e0ihQWjB6BAS0fKgEC96JDx1io1N
	I
X-Gm-Gg: ASbGncsg4GI43VKYErU1viZRZrSkRsuisQJv/RQjK8LvSS4ReTDUYyda86EuAegSRcZ
	6HXCuD1pSjkME/nqC3DXC8NHa+yrznXH0sEHFn1foGPtPPdLZGmZ+sy4yqJkCCPMxP75EdD6mZH
	+65YoQKlm4wFUOiIOApVb2P3IgsApJaw9Bm2r2bW+TE0vuDKZc6gsU/K+E6js5CKzy7FOjdB6LE
	R+yAUjYJEIhK/aExeJk4GVKy7RpDbgkkTOcPy+vSG4rsNHZ1QLlIsTpfdAeTeYSTMVu9zJJszXH
	oPqDMRIsg0jkUuersWu5PQbKjjZhe06B3mmJIgqi9Yx5OMf0a+mi+0LKdtEjG0y1L5K7jh6BjfT
	KkDLfQ4/m
X-Google-Smtp-Source: AGHT+IG1BrHIZUzZZQ4ZP09mkDCezAaGMCEC6Auoli5/fS+T6NEt1emkYrumlndq9xZJsbAQswXzWA==
X-Received: by 2002:a5d:47cc:0:b0:391:3f4f:a17f with SMTP id ffacd0b85a97d-3971ee43fc3mr2229602f8f.42.1741943848305;
        Fri, 14 Mar 2025 02:17:28 -0700 (PDT)
Message-ID: <eab025a8-74a5-45d5-87bb-b6dfbe9eec10@citrix.com>
Date: Fri, 14 Mar 2025 09:17:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/irq: use NR_ISAIRQS instead of open-coded value
To: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me
Cc: anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250314011528.2608217-1-dmukhin@ford.com>
 <2f365e4a-1d01-4f1c-85b4-25be22545822@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2f365e4a-1d01-4f1c-85b4-25be22545822@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2025 8:51 am, Jan Beulich wrote:
> On 14.03.2025 02:20, dmkhn@proton.me wrote:
>> Replace the open-coded value 16 with the NR_ISAIRQS symbol to enhance
>> readability.
>>
>> No functional changes.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>>  xen/arch/x86/hvm/dm.c          |  2 +-
>>  xen/arch/x86/hvm/irq.c         | 17 +++++++++--------
>>  xen/arch/x86/hvm/vlapic.c      | 10 +++++-----
>>  xen/arch/x86/hvm/vpic.c        |  4 ++--
>>  xen/arch/x86/include/asm/irq.h |  2 +-
>>  xen/arch/x86/io_apic.c         | 12 ++++++------
>>  xen/arch/x86/irq.c             |  6 +++---
>>  7 files changed, 27 insertions(+), 26 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
>> index a1f7a4d30a..36d47664e9 100644
>> --- a/xen/arch/x86/hvm/dm.c
>> +++ b/xen/arch/x86/hvm/dm.c
>> @@ -90,7 +90,7 @@ static int set_pci_intx_level(struct domain *d, uint16_t domain,
>>  static int set_isa_irq_level(struct domain *d, uint8_t isa_irq,
>>                               uint8_t level)
>>  {
>> -    if ( isa_irq > 15 )
>> +    if ( isa_irq >= NR_ISAIRQS )
>>          return -EINVAL;
>>  
>>      switch ( level )
>> diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
>> index 1eab44defc..1f7d8ca43e 100644
>> --- a/xen/arch/x86/hvm/irq.c
>> +++ b/xen/arch/x86/hvm/irq.c
>> @@ -209,7 +209,7 @@ int hvm_isa_irq_assert(struct domain *d, unsigned int isa_irq,
>>      unsigned int gsi = hvm_isa_irq_to_gsi(isa_irq);
>>      int vector = -1;
>>  
>> -    ASSERT(isa_irq <= 15);
>> +    ASSERT(isa_irq < NR_ISAIRQS);
>>  
>>      spin_lock(&d->arch.hvm.irq_lock);
>>  
>> @@ -231,7 +231,7 @@ void hvm_isa_irq_deassert(
>>      struct hvm_irq *hvm_irq = hvm_domain_irq(d);
>>      unsigned int gsi = hvm_isa_irq_to_gsi(isa_irq);
>>  
>> -    ASSERT(isa_irq <= 15);
>> +    ASSERT(isa_irq < NR_ISAIRQS);
>>  
>>      spin_lock(&d->arch.hvm.irq_lock);
>>  
>> @@ -266,12 +266,12 @@ static void hvm_set_callback_irq_level(struct vcpu *v)
>>          if ( asserted && (hvm_irq->gsi_assert_count[gsi]++ == 0) )
>>          {
>>              vioapic_irq_positive_edge(d, gsi);
>> -            if ( gsi <= 15 )
>> +            if ( gsi < NR_ISAIRQS )
>>                  vpic_irq_positive_edge(d, gsi);
>>          }
>>          else if ( !asserted && (--hvm_irq->gsi_assert_count[gsi] == 0) )
>>          {
>> -            if ( gsi <= 15 )
>> +            if ( gsi < NR_ISAIRQS )
>>                  vpic_irq_negative_edge(d, gsi);
>>          }
>>          break;
>> @@ -328,7 +328,7 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq)
>>      u8 old_isa_irq;
>>      int i;
>>  
>> -    if ( (link > 3) || (isa_irq > 15) )
>> +    if ( (link > 3) || (isa_irq >= NR_ISAIRQS) )
>>          return -EINVAL;
>>  
>>      spin_lock(&d->arch.hvm.irq_lock);
>> @@ -440,7 +440,8 @@ void hvm_set_callback_via(struct domain *d, uint64_t via)
>>          {
>>          case HVMIRQ_callback_gsi:
>>              gsi = hvm_irq->callback_via.gsi;
>> -            if ( (--hvm_irq->gsi_assert_count[gsi] == 0) && (gsi <= 15) )
>> +            if ( (--hvm_irq->gsi_assert_count[gsi] == 0) &&
>> +                 (gsi < NR_ISAIRQS) )
>>                  vpic_irq_negative_edge(d, gsi);
>>              break;
>>          case HVMIRQ_callback_pci_intx:
>> @@ -464,7 +465,7 @@ void hvm_set_callback_via(struct domain *d, uint64_t via)
>>                    (hvm_irq->gsi_assert_count[gsi]++ == 0) )
>>          {
>>              vioapic_irq_positive_edge(d, gsi);
>> -            if ( gsi <= 15 )
>> +            if ( gsi < NR_ISAIRQS )
>>                  vpic_irq_positive_edge(d, gsi);
>>          }
>>          break;
>> @@ -764,7 +765,7 @@ static int cf_check irq_check_link(const struct domain *d,
>>              return -EINVAL;
>>  
>>      for ( link = 0; link < ARRAY_SIZE(pci_link->route); link++ )
>> -        if ( pci_link->route[link] > 15 )
>> +        if ( pci_link->route[link] >= NR_ISAIRQS )
>>          {
>>              printk(XENLOG_G_ERR
>>                     "HVM restore: PCI-ISA link %u out of range (%u)\n",
> Up to here I agree with the adjustments made, but ...
>
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -123,7 +123,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int err_bit)
>>               * will end up back here.  Break the cycle by only injecting LVTERR
>>               * if it will succeed, and folding in RECVILL otherwise.
>>               */
>> -            if ( (lvterr & APIC_VECTOR_MASK) >= 16 )
>> +            if ( (lvterr & APIC_VECTOR_MASK) >= NR_ISAIRQS )
>>                  inj = true;
>>              else
>>                  set_bit(ilog2(APIC_ESR_RECVILL), &vlapic->hw.pending_esr);
>> @@ -136,7 +136,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int err_bit)
>>  
>>  bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
>>  {
>> -    if ( unlikely(vec < 16) )
>> +    if ( unlikely(vec < NR_ISAIRQS) )
>>          return false;
>>  
>>      if ( hvm_funcs.test_pir &&
>> @@ -150,7 +150,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
>>  {
>>      struct vcpu *target = vlapic_vcpu(vlapic);
>>  
>> -    if ( unlikely(vec < 16) )
>> +    if ( unlikely(vec < NR_ISAIRQS) )
>>      {
>>          vlapic_error(vlapic, ilog2(APIC_ESR_RECVILL));
>>          return;
>> @@ -523,7 +523,7 @@ void vlapic_ipi(
>>          struct vlapic *target = vlapic_lowest_prio(
>>              vlapic_domain(vlapic), vlapic, short_hand, dest, dest_mode);
>>  
>> -        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
>> +        if ( unlikely((icr_low & APIC_VECTOR_MASK) < NR_ISAIRQS) )
>>              vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
>>          else if ( target )
>>              vlapic_accept_irq(vlapic_vcpu(target), icr_low);
>> @@ -531,7 +531,7 @@ void vlapic_ipi(
>>      }
>>  
>>      case APIC_DM_FIXED:
>> -        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
>> +        if ( unlikely((icr_low & APIC_VECTOR_MASK) < NR_ISAIRQS) )
>>          {
>>              vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
>>              break;
> ... the 16 here has a different origin (in the local APIC spec).

Indeed.  These are about the first 16 vectors in the IDT, and and aren't
related to ISA (or any other type) of IRQ.

~Andrew

