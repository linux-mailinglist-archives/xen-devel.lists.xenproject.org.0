Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCA09B61CD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:32:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828115.1242950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66vg-0006ry-GD; Wed, 30 Oct 2024 11:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828115.1242950; Wed, 30 Oct 2024 11:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66vg-0006pf-De; Wed, 30 Oct 2024 11:32:00 +0000
Received: by outflank-mailman (input) for mailman id 828115;
 Wed, 30 Oct 2024 11:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LV2z=R2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t66ve-0006pZ-Qw
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:31:58 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f770393-96b2-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 12:31:52 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso1024467366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:31:52 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a081d59sm565995566b.189.2024.10.30.04.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 04:31:51 -0700 (PDT)
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
X-Inumbo-ID: 8f770393-96b2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhmNzcwMzkzLTk2YjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg3OTEyLjg3NDgzNywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730287912; x=1730892712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=thZ8ODbHtD1ftXSlRaVuX2Lz0Pd7oA1SaG4YQ9rAJpU=;
        b=YpKtPyloL5Xg6CLs7Klnisgk0iRI105q27uvtF1pwJ1Bxidt+v3AxrsfXPmMsFkexQ
         Vrcm+bymQgwP3inN1OZCQZYevxqyOIqoHu0jyAUMVxcli4pOnBbuacNCiSO1lgrwHwfz
         HQlwISvBw4BZWOGnhSIhIvpRKNdEcAQ+4QBt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287912; x=1730892712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thZ8ODbHtD1ftXSlRaVuX2Lz0Pd7oA1SaG4YQ9rAJpU=;
        b=gfhEj0KanUlNd+UeMLU5tnu3VAQvum0J5YObOtIIv3qnbnoEQMOFgRwU6obllKwMC3
         P91gA/z4MoeSisV0QhS99HFIk08HeJublOG0r8hK1r28vg3yp/QKd/B1+DplgsU/gwNv
         wUqdE8mcJY1J7VJZ7MKrq3K4N3tEn0bwvFN01ECsc0jcVkZS1I4ihaBpC0aXF0xlxauY
         +5vl0aaErEa0ZMqRVng8mU3pMIkVj5760kmwvvs+yZLmGh6XpUIJ9dvx+MoQUqPBdKeu
         cV5+gmzZNeh+GViRffoKNeuktE7r+PMNap5C1QmbSBQ3Qilu9pG1cpHGLAbZFUvE/1f+
         2b6A==
X-Forwarded-Encrypted: i=1; AJvYcCWvgom2NFvkP6eay/nSMpyeUdWb+RUQ3mmzv70uw55t9WCq3TXA3R2uyWWvmdu5PlxTj1vrLzYxBl8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywp0GjTzjBdL3pmeNo7zHbGJgj6eoQ0e2lIO9CFBOfiU8GL4INC
	eyJVvEZZpcgbyUTylmjC95dmdkxyPrNja2XxlgaOsp/T74AkNsvFRbmdi30fNZ8=
X-Google-Smtp-Source: AGHT+IH1iuFIGGBAcZQfm6STlnGCEHSSchu2wkaF+PBlO/ETIH3FFBRa3PH1bMPrHFx6i6uG3j6ppQ==
X-Received: by 2002:a17:907:cca3:b0:a9e:4b88:e03b with SMTP id a640c23a62f3a-a9e4b88e2famr15651366b.0.1730287912224;
        Wed, 30 Oct 2024 04:31:52 -0700 (PDT)
Message-ID: <e8e2385d-b575-4483-ba54-f80c669af9c3@citrix.com>
Date: Wed, 30 Oct 2024 11:31:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-5-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241021154600.11745-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 4:45 pm, Alejandro Vallejo wrote:
> diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
> index cd716bf39245..04cab1e59f08 100644
> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -4,6 +4,8 @@
>  #include <stdint.h>
>  #include <stdbool.h>
>  
> +#include <xen/hvm/hvm_info_table.h>
> +
>  enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
>  extern enum virtual_vga virtual_vga;
>  
> @@ -48,8 +50,9 @@ extern uint8_t ioapic_version;
>  
>  #define IOAPIC_ID           0x01
>  
> +extern uint32_t cpu_to_x2apicid[HVM_MAX_VCPUS];

Just cpu_to_apic_id[] please.   The distinction between x or x2 isn't
interesting here.

HVM_MAX_VCPUS is a constant that should never have existed in the first
place, *and* its the limit we're looking to finally break when this
series is accepted.

This array needs to be hvm_info->nr_vcpus entries long, and will want to
be more than 128 entries very soon.  Just scratch_alloc() the array. 
Then you can avoid the include.

> diff --git a/tools/firmware/hvmloader/mp_tables.c b/tools/firmware/hvmloader/mp_tables.c
> index 77d3010406d0..539260365e1e 100644
> --- a/tools/firmware/hvmloader/mp_tables.c
> +++ b/tools/firmware/hvmloader/mp_tables.c
> @@ -198,8 +198,10 @@ static void fill_mp_config_table(struct mp_config_table *mpct, int length)
>  /* fills in an MP processor entry for VCPU 'vcpu_id' */
>  static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id)
>  {
> +    ASSERT(cpu_to_x2apicid[vcpu_id] < 0xFF );

This is just going to break when we hit 256 vCPUs in a VM.

What do real systems do?

They'll either wrap around 255 like the CPUID xAPIC_ID does, or they'll
not write out MP tables at all.

> diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
> index 1b940cefd071..d63536f14f00 100644
> --- a/tools/firmware/hvmloader/smp.c
> +++ b/tools/firmware/hvmloader/smp.c
> @@ -90,10 +120,11 @@ static void boot_cpu(unsigned int cpu)
>          BUG();
>  
>      /*
> -     * Wait for the secondary processor to complete initialisation.
> +     * Wait for the secondary processor to complete initialisation,
> +     * which is signaled by its x2APIC ID being written to the LUT.

Technically all arrays are a lookup table, but I'm not sure LUT is a
common enough term to be used unqualified like this.

Just say "... signalled by writing its APIC_ID out."  The where is very
apparent by the code.

> @@ -104,6 +135,12 @@ static void boot_cpu(unsigned int cpu)
>  void smp_initialise(void)
>  {
>      unsigned int i, nr_cpus = hvm_info->nr_vcpus;
> +    uint32_t ecx;
> +
> +    cpuid(1, NULL, NULL, &ecx, NULL);
> +    has_x2apic = (ecx >> 21) & 1;
> +    if ( has_x2apic )
> +        printf("x2APIC supported\n");

You need to check max_leaf >= 0xb too.  Remember Xen might not give you
leave 0xb yet, and then you'll hit the assert for finding 0.

And has_x2apic wants to be a simple boolean.  Nothing good can come from
confusing -1 with "x2apic available".


I recommend splitting this patch into three.  Several aspects are quite
subtle.

1) Collect the APIC_IDs on APs
2) Change how callin is signalled.
3) Replace LAPIC_ID() with the collected apic_id.

but AFAICT, it can be done as a standalone series, independently of the
other Xen/toolstack work.

~Andrew

