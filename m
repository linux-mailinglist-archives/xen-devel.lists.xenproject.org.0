Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FC8CDA52
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 20:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728808.1133860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sADeY-00038H-U9; Thu, 23 May 2024 18:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728808.1133860; Thu, 23 May 2024 18:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sADeY-000355-RE; Thu, 23 May 2024 18:59:02 +0000
Received: by outflank-mailman (input) for mailman id 728808;
 Thu, 23 May 2024 18:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSi9=M2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sADeX-00034z-K5
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 18:59:01 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 836192ff-1936-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 20:58:59 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-351b683f2d8so1998884f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 11:58:59 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17733sm1972053366b.195.2024.05.23.11.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 11:58:58 -0700 (PDT)
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
X-Inumbo-ID: 836192ff-1936-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716490739; x=1717095539; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+0WPKKi8leSuP+9MJGa6rPyPqrwEy/yzHtx7N8uEAMU=;
        b=QclwoxJcL2qIDHq7A9CpNfdOgJFHbVpC1sPqmvou6XK4qFgy/Z77xCjLBWalaxe4zI
         0FqwNIRB2bJcr0nGxgEVZEUEOVsdMnuPDbDKd4374MjpbSQIwq36VNAdAmZVqi2rMpqL
         ZspzoNepPJY0GZlj3W1Le+RBWvJ/OP0Hs4Oi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716490739; x=1717095539;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0WPKKi8leSuP+9MJGa6rPyPqrwEy/yzHtx7N8uEAMU=;
        b=sLtNlg03gkKHJJ3wn8gdQXf5gEVqi9KXsz2PVaKxpX0lHiqm+bOWttRnBwBFbw6Wmn
         Ak8SB/g8OI9lDkJSYdx4moSSq0q0G3rYJbrxlaWXfyzuwIKDZ9Y/6WkftFbRU8vAb2Yq
         LXH8KkVxlW8g9+VdIWG0BVMYvjTyGwyDo/mpKy098C/vWATcgBu/qEZEm2MhoUNPr1sw
         hp0/L+F85HMS6At9Ic1jFqPeuzgpHZ7ZXr5jjgCtaNCi0z+K6C+3MsWYGhkyXq3QMC1E
         +gm7Dqt+4TWeBTC4uc/yik/y7rOsrEaojjh7O1ZDY3konsf/rTRjNF5CPYSopEex3K6Q
         xTyg==
X-Forwarded-Encrypted: i=1; AJvYcCVi1m8KEJKh/+2DtdpDUOcTOqNbzBTcRbr3FsN4CckYti8Sdt5WENfkT6d/qJLsE8QwbmcFBIFuYJgTsMdRNSssfCXXy64MAtCaOgirN50=
X-Gm-Message-State: AOJu0YyPgbjVj1gWf7MmASeSUJebG1Dh+kYkHrjrjQlwoqS538rZp7yF
	ZIiG88XoyhtD2Rleadh1VzQTSCcApRvG13QGRrCEy7fYrqQsO68TwXGpbQowcTg=
X-Google-Smtp-Source: AGHT+IFkw03B9KSl6QVrxPN9WW1pInnSELIjhi22SpzZs6YXbTg6sT/8dTfH223+MYiKI2jQ2ByfWg==
X-Received: by 2002:a05:6000:25a:b0:354:f5f4:579 with SMTP id ffacd0b85a97d-354f5f406aemr2302618f8f.0.1716490739064;
        Thu, 23 May 2024 11:58:59 -0700 (PDT)
Message-ID: <630e0117-f401-4d55-a1de-2682d8d9b406@citrix.com>
Date: Thu, 23 May 2024 19:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] x86/vlapic: Move lapic_load_hidden migration
 checks to the check hook
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <499e029a7d2fce4fb9118b1e508313f369b37c79.1715102098.git.alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <499e029a7d2fce4fb9118b1e508313f369b37c79.1715102098.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2024 1:39 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 8a244100009c..2f06bff1b2cc 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1573,35 +1573,54 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>                 v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
>  }
>  
> -static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> +static int cf_check lapic_check_hidden(const struct domain *d,
> +                                       hvm_domain_context_t *h)
>  {
>      unsigned int vcpuid = hvm_load_instance(h);
> -    struct vcpu *v;
> -    struct vlapic *s;
> +    struct hvm_hw_lapic s;
>  
>      if ( !has_vlapic(d) )
>          return -ENODEV;
>  
>      /* Which vlapic to load? */
> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> +    if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL )

As you're editing this anyway, swap for

    if ( !domain_vcpu(d, vcpuid) )

please.

>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
>                  d->domain_id, vcpuid);
>          return -EINVAL;
>      }
> -    s = vcpu_vlapic(v);
>  
> -    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
> +    if ( hvm_load_entry_zeroextend(LAPIC, h, &s) )
> +        return -ENODATA;
> +
> +    /* EN=0 with EXTD=1 is illegal */
> +    if ( (s.apic_base_msr & (APIC_BASE_ENABLE | APIC_BASE_EXTD)) ==
> +         APIC_BASE_EXTD )
> +        return -EINVAL;

This is very insufficient auditing for the incoming value, but it turns
out that there's no nice logic for this at all.

As it's just a less obfuscated form of the logic from
lapic_load_hidden(), it's probably fine to stay as it is for now.

The major changes since this logic was written originally are that the
CPU policy correct (so we can reject EXTD on VMs which can't see
x2apic), and that we now prohibit VMs moving the xAPIC MMIO window away
from its default location (as this would require per-vCPU P2Ms in order
to virtualise properly.)

~Andrew

