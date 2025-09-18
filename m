Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D043AB85B34
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 17:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126318.1467935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGlR-0004d3-27; Thu, 18 Sep 2025 15:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126318.1467935; Thu, 18 Sep 2025 15:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGlQ-0004aS-Vf; Thu, 18 Sep 2025 15:41:40 +0000
Received: by outflank-mailman (input) for mailman id 1126318;
 Thu, 18 Sep 2025 15:41:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzGlP-0004aM-Np
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 15:41:39 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6f7217c-94a5-11f0-9d14-b5c5bf9af7f9;
 Thu, 18 Sep 2025 17:41:38 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso1317779f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 08:41:38 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802de635sm29296045ad.82.2025.09.18.08.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Sep 2025 08:41:37 -0700 (PDT)
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
X-Inumbo-ID: f6f7217c-94a5-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758210098; x=1758814898; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c37evmbGxCNIzKG67AS/sRjwa/HfkKZUwl+jhxZ/Llg=;
        b=LZWKapQQT9PhV36Sk24RNX3dFzRSxyo3eFvfpMSrAUXHW3MsF/PSu+Y2bMptqzwkT6
         1l9DROC3bhrVT6k+oD30q3p5dQenmJsF5xKv6rgqas27SG0d3KpQ6i3lvN5yupVuVqCv
         HYGaEIynAL62oZbECts4FcjPZWdxEQivp1VH5DTqXcsWJtzGK0DnL8iKicU55Cahb99j
         ZYBsQcBj2rohFjd8fG6lFN7wUAFPrSa3fb6du4t9dzFo4n8+5ioC8pj/0hlzKnKNh5mU
         Eu77Dc1O4pwYctu6kJs3VoANyBwkDTbun2xMyWsKN3rzU6LifS+MK/6YyiqfXF9vfdsS
         oIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210098; x=1758814898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c37evmbGxCNIzKG67AS/sRjwa/HfkKZUwl+jhxZ/Llg=;
        b=vbsgR04QVy36+2ASae3V4gijY45lwEWLW3ZEt75NNKFdEYjH42WsYFFkR1fUCUE3nv
         siXnWQN6ZAgQ7YEfpS9m44qTkCmh9QTQeFLERkYsRjoeLlfza+8KOeDl6QdJBRlJEv1h
         ZN4P1yiRmIE7YKf8SZZziz0rHIqqExs8m9v1JsT7+u0B0zV8JnCiMOZC2flG1baNbXPO
         D8vf8i3qTAqr4eqlalddRgzcquwzi+v8WPa6jygYG6IjyT8Nm6N5w2yDNCC4ewWk6g2S
         xYQid1zfsyIsvmwcPCJIrGeE8+44wVybdN6YfPezdAkSmaRJIfP/LOBo9KZ8WGzJdlR9
         1XLg==
X-Forwarded-Encrypted: i=1; AJvYcCUtLu+9zMGTs1cgJBYAEK/Zg1+ULT5uO0i0YvvIbHSPWYPiFZw4rDj5k1mV+lN3YdNamlhVgsvZhmM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyO+SYMM7JfYgkkz9QZnYdZHQStT/fXN6wqlZ6+YAizkOqdlzUX
	7tLoWMEtIUmn4FAdpjZQ6U7LVW58i4+gAtkXbDaxXN8IJzuAqO86zrD9FiI9r/4BQA==
X-Gm-Gg: ASbGnct9capezK3WqzkKde0qzJdug51l1HJRMzD+amhhWHqHILomqXRmaknMQ9XuOPZ
	h3ApeTkECfYwJLRcJBfJn2rsNTrJMeKg1Qw/qSXmEEEroq6QDhodEeM4LdfcIXI5/aMrmM960yR
	V2AmY4uz9xD2lPeG4juOzikfO2jGCHh7okXbqfObkMFaguAeYfWxbo3/JsCE9jc0drPQBpmR6EZ
	U+b+7Rkryyz/XBiodcBjUsa9DNn/yrTgMi5jZAFBPNTelnVe8e5R5+DFISFXby1YmcwM+Tdnmp1
	nH+rozfdCnUKnG4uWXEmGu4TLLa/y5YCB8tNWdfhVQcu8une96bKVNxFWeD6UedkEZdyw6n6o7p
	3LmO0d56bdxlJkYDcI2+7iND2XArPf3+fNZ6BnzIuivOPBjUVFw==
X-Google-Smtp-Source: AGHT+IHy8YCk/qfMnyKOefto162rdksCO/pWGrBji3fdf/NhaCTAjlBczuM8W7NcWYabpNWuflWKow==
X-Received: by 2002:a05:6000:2902:b0:3e3:6b81:b482 with SMTP id ffacd0b85a97d-3ecdf9cb452mr6222209f8f.28.1758210097766;
        Thu, 18 Sep 2025 08:41:37 -0700 (PDT)
Message-ID: <0e1a6339-a4fb-4697-acfa-392168b391d4@suse.com>
Date: Thu, 18 Sep 2025 17:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916134114.2214104-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250916134114.2214104-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2025 15:41, Grygorii Strashko wrote:
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -62,6 +62,16 @@ config ALTP2M
>  
>  	  If unsure, stay with defaults.
>  
> +config HVM_VIRIDIAN

I may have said so already on v1: I'm not quite convinced of the need
or usefulness of the HVM_ part here. Viridian necessarily means HVM,
aiui.

> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
>  {
>      const struct domain *d = v->domain;
>      const struct viridian_domain *vd = d->arch.hvm.viridian;
> -    struct hvm_viridian_domain_context ctxt = {
> -        .hypercall_gpa = vd->hypercall_gpa.raw,
> -        .guest_os_id = vd->guest_os_id.raw,
> -    };
> +    struct hvm_viridian_domain_context ctxt = {};
>  
>      if ( !is_viridian_domain(d) )
>          return 0;

This check doesn't check for vd being non-NULL, so this still feels a little
fragile, even if it looks correct now.

> +    ctxt.hypercall_gpa = vd->hypercall_gpa.raw;
> +    ctxt.guest_os_id = vd->guest_os_id.raw,
> +
>      viridian_time_save_domain_ctxt(d, &ctxt);
>      viridian_synic_save_domain_ctxt(d, &ctxt);
>  

Just below here we have viridian_load_domain_ctxt(), which I'm pretty sure
now also needs to gain some check: Save records coming from user space, we
can't really rely on there being none of this type for a non-Viridian domain.

Jan

