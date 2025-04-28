Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D74A9EFA0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970603.1359253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Myc-0001HC-1Y; Mon, 28 Apr 2025 11:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970603.1359253; Mon, 28 Apr 2025 11:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Myb-0001Eu-V2; Mon, 28 Apr 2025 11:48:45 +0000
Received: by outflank-mailman (input) for mailman id 970603;
 Mon, 28 Apr 2025 11:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Olx=XO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9Mya-0001Eo-Nd
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:48:44 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc5b29ce-2426-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 13:48:43 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso31206245e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 04:48:43 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a13bdsm153202605e9.9.2025.04.28.04.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 04:48:42 -0700 (PDT)
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
X-Inumbo-ID: bc5b29ce-2426-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745840923; x=1746445723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ2km4WSA94Aa5syuvQrVCCUr79cfWp8AV8VMfZTCGk=;
        b=Ay1VwIOLMRvtb3zMh3ny/FEhz3ICzUI2lS70yD792xQJTCeAbu3jYGzhbb2kQuOf7o
         yTFxbEOs6IBBV5ocv4us6jorT7jJKbasDBCtfOTFju99I12WUCbaHzcn2R51XDZ1ofsz
         Qq4OtoSTlUMPHAKgZHx3Bq1a70BPTA/eB+vU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840923; x=1746445723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ2km4WSA94Aa5syuvQrVCCUr79cfWp8AV8VMfZTCGk=;
        b=vB2JemD+xnPg4ksuspFvobrw41jc4vWSQ8nA2tpsf0QWBdEjk5fU8pQimb/RLXIuN1
         gUTF+9YrSIQRT2ZqUu2NYctd40U60OTdOFKZ84jAbLVZjDJlOQX1iLWyqE6LmEbTHiHC
         fNHSEc+xOksyNod+g4jVek/BkU1nitNTOLvIIpYSs4mhitUML9NTgY+JDbGJHWYop+oI
         adsNjf8wcg0Ww0z6a9bdtj3NznGDL0pjqfLK1KGRUhij4oSfOnCUCiFtHK/czV/EiDhD
         z8oyvUswyedl5kbunHSpovHlWNKveXEFUhM69533t/rOnRhzVCSZC9u1KpB677+s0QVh
         Bw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvS+IwJj8UcAZWfkIfNPqQbT2Jy547BsduNCNl6dNHTzzEZj+I3XI50P+RxjwvrUsJ3Rq5jI0cEaE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKTYoe9Kd/21eKTaUDj1fbUvSRJvlI0Ceydw0Y7RJfe2c4njFr
	Gn3DX5eOBnyWw9NDAe+0jD1vSBEx1SDYg8ixEgTBvuw6OMCb0xXRcymUpj+h8hQ=
X-Gm-Gg: ASbGnctHYlZ1vC0VZhrGzDQGgdZRuALNjzCwomcVSY3lisLYnRXR+6PLdB2Ce8JimC4
	Yj0WoZLI0EoLwgNQJVFc+lWPXPHddIla3qN3STvX4R39n4i+V72p/uq0Y/j8hNA2m0iA6mJMq46
	NaSa4YYtSqIvXg81bR4vrF8n2B25Jno4kzZ/U+xUEyC0T2ZLkHNQP7wCTNKV52gW/jONDVD8Hdu
	Z4Q/egS08YcOf6eLb/wfB4Siytjf+lj9NF58kD/LdVUu5Dz4JCkbupleaoXe6MFibBeULI8kl9T
	hTQHeW60eEuzZMMZIH3fhzJUAo2PFnAzI1XM357zti8RRApNSNKza4cyVuOguogXKwQmb8ufcAd
	BvibGPH192U8lZnTN
X-Google-Smtp-Source: AGHT+IEQyq+CCqEmndNHbRbpnGXLAZ4saxOHmkFuK5TkVdz3dbsb5dMWVbtinWVSYoQqR6Mdx9gLgA==
X-Received: by 2002:a05:600c:3b18:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-440a669ea55mr79399765e9.20.1745840923165;
        Mon, 28 Apr 2025 04:48:43 -0700 (PDT)
Message-ID: <27800fcd-76e3-429c-921d-72bf7670686d@citrix.com>
Date: Mon, 28 Apr 2025 12:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] x86/vmx: Update DR7 type
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
References: <20250426072739.39373-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250426072739.39373-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/04/2025 8:27 am, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Convert the DR7 type to `unsigned int` and fix the accesses where necessary.
>
> [1] https://lore.kernel.org/xen-devel/0d01646b-83e3-4a02-b365-d149d2664e73@citrix.com/
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/hvm/vmx/vmx.c        | 2 +-
>  xen/arch/x86/include/asm/domain.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 4883bd823d..75c6992172 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -926,7 +926,7 @@ static void vmx_save_dr(struct vcpu *v)
>      v->arch.dr[3] = read_debugreg(3);
>      v->arch.dr6   = read_debugreg(6);
>      /* DR7 must be saved as it is used by vmx_restore_dr(). */
> -    __vmread(GUEST_DR7, &v->arch.dr7);
> +    v->arch.dr7 = vmread(GUEST_DR7);

Two minor points.  The = wants lining up for vertical tabulation, and ...

>  }
>  
>  static void __restore_debug_registers(struct vcpu *v)
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 5fc1d1e5d0..a54ef3a8c1 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -595,7 +595,7 @@ struct arch_vcpu
>  
>      /* Debug registers. */
>      unsigned long dr[4];
> -    unsigned long dr7; /* Ideally int, but __vmread() needs long. */
> +    unsigned int dr7;
>      unsigned int dr6;

... these fields want switching back around now that dr7 is unsigned int.

We always access in numeric order, and they're only out-of-order for
packing reasons.

Can fix on commit.

~Andrew

