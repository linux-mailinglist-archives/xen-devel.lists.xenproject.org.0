Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8A9E10C9
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 02:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847209.1262331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHim-0005Xo-56; Tue, 03 Dec 2024 01:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847209.1262331; Tue, 03 Dec 2024 01:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHim-0005Ve-2A; Tue, 03 Dec 2024 01:29:00 +0000
Received: by outflank-mailman (input) for mailman id 847209;
 Tue, 03 Dec 2024 01:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=On7Z=S4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tIHik-0005VI-KA
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 01:28:58 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6440de8-b115-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 02:28:55 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa53ebdf3caso157110966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 17:28:56 -0800 (PST)
Received: from [192.168.86.29] ([90.240.255.120])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d560asm563452966b.61.2024.12.02.17.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 17:28:55 -0800 (PST)
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
X-Inumbo-ID: f6440de8-b115-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733189336; x=1733794136; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uq0J8rWPM2r7OFPHUCmfWJUZ2yRsTZhEnzsRvPF/O2A=;
        b=CLEtTSjzOPjz6yxJxXWqNBWAJSIh8SJBuHnOaDvDefkB9Rj7Hb7uX80a4brcFpwTKg
         C0S48jOeWycMgiMuLDb67XoeYmCYsk4QJCCKEHwfgvXWZTxlu79Q8UZAXXtE9ywFqSuH
         +XHLuLZxcKy+cWHQfbhAgHXaB8G/dKhlUKy5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733189336; x=1733794136;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq0J8rWPM2r7OFPHUCmfWJUZ2yRsTZhEnzsRvPF/O2A=;
        b=FiVApbpdNHHLJnHs9rKDISVfF+4V/BG41D6Bxh8IiMJqhgTiaSd9fiR069RbEZrNNF
         qiIld7o0yFQ90b8Rm09pcNrJI7gBfDa802xB2Rx8i1tPWFRz53d3wOarS7HOHC6T3T30
         lt12oJyzdsTYEi7sJR47EGu4oYIup0e+rKxeMyQvj+AN6e1NjfnU5xAbgRK1MD+gy8Gw
         U+P25IaKNvl91c+1bl89ACWJ7NdRabSKHlb3qAyvkGq2409931JbCmTIUc4RBekGzD0P
         jRABDyvk851TBVkdsN5pRRIz/DYhoRjkTdtWRcwpp3eUCIJVxRoPj36hduXld3QFcVEh
         TgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBSgJ1sQNo6fwN4Y/tq3esO/ZrUZywo4XCI1TMhQK8rXUi1rAXCPj8p+JF8a/hM84AaE6AQOisIbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6mHuWKlzCisUMrykQxIgaoLSkRvPJD3kVdV6Ndw+D2QNceuc9
	D6ogdatvfQ7SAZ4gxYhkpoLazYxCH3hBp4EKeYLG6nXP1sG0vNb+QdtaqF2PNtk=
X-Gm-Gg: ASbGncvJU95Bdd46c19ctOrasfHYg0DJS6yIwDpptlgmJxMNlgaJ4XgP5LgX2zo8/co
	5JyjfSzv0kibn9fOGVA+/7N6Ro3gEgA1c48GpFK44nKmYgm+JT58ciDiD3beDSKFSGsvXnjYZuu
	uPBJjYTnmL5MKt0nWYSfSTSNEDiLB+/al402hTPbH2JmzX+8E5iOzHuYdfBA6o1Zpm4PL/gMpip
	uzd/b4nMn0Q5If8XPuRrgxYcGPZERhI4BiGwYYpzVcDC/RJzguU5W3O3WDME0w=
X-Google-Smtp-Source: AGHT+IGU7jxH5mfvqjUzNNO+cJvYRC6zia50akRFOhFPYVPqR473ZqGd/ljEGbus5kELxvRnJrn/Pw==
X-Received: by 2002:a17:907:3f96:b0:aa5:4ea6:fcae with SMTP id a640c23a62f3a-aa5f7daba68mr38700666b.28.1733189335776;
        Mon, 02 Dec 2024 17:28:55 -0800 (PST)
Message-ID: <a9560e97-478d-4e03-b936-cf6f663279a4@citrix.com>
Date: Tue, 3 Dec 2024 01:28:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] x86, lib, xenpv: Add WBNOINVD helper functions
To: Kevin Loughlin <kevinloughlin@google.com>, linux-kernel@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, kvm@vger.kernel.org, thomas.lendacky@amd.com,
 pgonda@google.com, sidtelang@google.com, mizhang@google.com,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20241203005921.1119116-1-kevinloughlin@google.com>
 <20241203005921.1119116-2-kevinloughlin@google.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241203005921.1119116-2-kevinloughlin@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2024 12:59 am, Kevin Loughlin wrote:
> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index d4eb9e1d61b8..c040af2d8eff 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -187,6 +187,13 @@ static __always_inline void wbinvd(void)
>  	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT_XEN);
>  }
>  
> +extern noinstr void pv_native_wbnoinvd(void);
> +
> +static __always_inline void wbnoinvd(void)
> +{
> +	PVOP_ALT_VCALL0(cpu.wbnoinvd, "wbnoinvd", ALT_NOT_XEN);
> +}

Given this, ...

> diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
> index fec381533555..a66b708d8a1e 100644
> --- a/arch/x86/kernel/paravirt.c
> +++ b/arch/x86/kernel/paravirt.c
> @@ -149,6 +154,7 @@ struct paravirt_patch_template pv_ops = {
>  	.cpu.write_cr0		= native_write_cr0,
>  	.cpu.write_cr4		= native_write_cr4,
>  	.cpu.wbinvd		= pv_native_wbinvd,
> +	.cpu.wbnoinvd		= pv_native_wbnoinvd,
>  	.cpu.read_msr		= native_read_msr,
>  	.cpu.write_msr		= native_write_msr,
>  	.cpu.read_msr_safe	= native_read_msr_safe,

this, and ...

> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index d6818c6cafda..a5c76a6f8976 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1162,6 +1162,7 @@ static const typeof(pv_ops) xen_cpu_ops __initconst = {
>  		.write_cr4 = xen_write_cr4,
>  
>  		.wbinvd = pv_native_wbinvd,
> +		.wbnoinvd = pv_native_wbnoinvd,
>  
>  		.read_msr = xen_read_msr,
>  		.write_msr = xen_write_msr,

this, what is the point having a paravirt hook which is wired to
native_wbnoinvd() in all cases?

That just seems like overhead for overhead sake.

~Andrew

