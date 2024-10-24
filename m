Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE49AEC9D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 18:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825514.1239749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t413H-0003hP-8q; Thu, 24 Oct 2024 16:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825514.1239749; Thu, 24 Oct 2024 16:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t413H-0003ed-5s; Thu, 24 Oct 2024 16:51:11 +0000
Received: by outflank-mailman (input) for mailman id 825514;
 Thu, 24 Oct 2024 16:51:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t413F-0003eX-92
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 16:51:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 298cf1f3-9228-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 18:51:06 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a6acac4c3so169459666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 09:51:06 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370631sm638672466b.104.2024.10.24.09.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 09:51:05 -0700 (PDT)
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
X-Inumbo-ID: 298cf1f3-9228-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729788666; x=1730393466; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YIh+dXGoPdzm07OqJgOz2HoIGVQbxiDlqgXo5P32/2s=;
        b=aAC3jSZyBUy58MjWP4XWxZ3/Gi9xVWDcV5M6ELRODLMsWeVj8qCknorFgqQMpmGiG1
         bS9KkFuWqdqBrFFhXcoDHCetL1VbpOyxhWdaYEm7zM61oiu5iKuuwP+8am/yfGOgaNHu
         l3TdjGnuwvp0+xl2dsgGdd7okcMLWVpPw7IJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729788666; x=1730393466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIh+dXGoPdzm07OqJgOz2HoIGVQbxiDlqgXo5P32/2s=;
        b=mmuCUGEn2oleOlin8HKM80VkagwVDg/nZPVpTffArcU613J1zrtbnVzlHf5RNi4L62
         gEKRoY9g5RDUVfHi3rysARpbCkaBObLC+MD3Xz6+xmzXVWbN55RW+K3mrANLj7NgAym8
         ryWJOzyrakzRV2G5dV6hIEddXOhJsQE9J0OdnxzsAjeDC1fNuAmzWim5FC1det5g58x8
         plUrMw9XvRrIlYfGLpHz6eyeyLHCAh7tWSi0Nn/IzdPCb8FBl7tSmQAyGai01iwespcf
         rqBvhYwfIz9ERrUCK6g5WGQ4Z5oiTqR4K8nllwnK9XA73jeq0zgZjeuTbll14aTpSzHe
         A1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXeAP+XLFJECMB7S+Rvrv/jymwDZ1yqwq3IUBVcMU3BHgnWRghGUmmj7m6ttXEAZscGG0SpYEGO4SM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOK5+s+KROXHJP4glj7Y5ee/nW0cAXv1S+FgkX2WvbD6gqYv1u
	kqff+8nF8A0Kks67+uEMH8MtCqUvkbhi5mz0K+yYsodvBA3VRCGZpPmn1T2VYU0=
X-Google-Smtp-Source: AGHT+IHjMfdXLrv2QjI4dGsCystzvqV+z0amooKETmX5GLht/SKwCp1Q5lp7JHP7EMJUmH7p0KFl0g==
X-Received: by 2002:a17:907:3e90:b0:a9a:634:dd2 with SMTP id a640c23a62f3a-a9ad281453bmr271367566b.43.1729788666019;
        Thu, 24 Oct 2024 09:51:06 -0700 (PDT)
Message-ID: <25ca9f8f-0c34-4dc5-92cc-f54309a87ce4@citrix.com>
Date: Thu, 24 Oct 2024 17:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Willi Junga <xenproject@ymy.be>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20241024154844.8652-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241024154844.8652-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/10/2024 4:48 pm, Roger Pau Monne wrote:
> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
> repurposed to contain part of the offset into the remapping table.  Previous to
> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> table would match the vector.  Such logic was mandatory for end of interrupt to
> work, since the vector field (even when not containing a vector) is used by the
> IO-APIC to find for which pin the EOI must be performed.
>
> Introduce a table to store the EOI handlers when using interrupt remapping, so
> that the IO-APIC driver can translate pins into EOI handlers without having to
> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
> unconditionally when interrupt remapping is enabled, even if strictly it would
> only be required for AMD-Vi.
>
> Reported-by: Willi Junga <xenproject@ymy.be>
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - s/apic_pin_eoi/io_apic_pin_eoi/.
>  - Expand comment about io_apic_pin_eoi usage and layout.
>  - Use uint8_t instead of unsigned int as array type.
>  - Do not use a sentinel value.
> ---
>  xen/arch/x86/io_apic.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index e40d2f7dbd75..e3cdfab6359a 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -71,6 +71,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
>  
>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
>  
> +/*
> + * Store the EOI handle when using interrupt remapping.
> + *
> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
> + * format repurposes the vector field to store the offset into the Interrupt
> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
> + * longer matches the contents of the RTE vector field.  Add a translation
> + * table so that directed EOI uses the value in the RTE vector field when
> + * interrupt remapping is enabled.
> + *
> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
> + * when using the remapped format, but use the translation table uniformly in
> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
> + *
> + * The matrix is accessed as [#io-apic][#pin].
> + */
> +static uint8_t **io_apic_pin_eoi;
> +
>  static void share_vector_maps(unsigned int src, unsigned int dst)
>  {
>      unsigned int pin;
> @@ -273,6 +291,13 @@ void __ioapic_write_entry(
>      {
>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        /*
> +         * Called in clear_IO_APIC_pin() before io_apic_pin_eoi is allocated.
> +         * Entry will be updated once the array is allocated and there's a
> +         * write against the pin.
> +         */
> +        if ( io_apic_pin_eoi )
> +            io_apic_pin_eoi[apic][pin] = e.vector;
>      }
>      else
>          iommu_update_ire_from_apic(apic, pin, e.raw);
> @@ -298,6 +323,9 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
>      /* Prefer the use of the EOI register if available */
>      if ( ioapic_has_eoi_reg(apic) )
>      {
> +        if ( io_apic_pin_eoi )
> +            vector = io_apic_pin_eoi[apic][pin];
> +
>          /* If vector is unknown, read it from the IO-APIC */
>          if ( vector == IRQ_VECTOR_UNASSIGNED )

I'm not sure this works.

https://godbolt.org/z/1a55PnKGq

io_apic_pin_eoi[apic][pin] gets zero extended when assigning to vector,
which can then never match IRQ_VECTOR_UNASSIGNED.

Or doesn't this no longer matter in v2?

~Andrew

