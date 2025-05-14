Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A07AB633C
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 08:36:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983790.1369965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF5jQ-0003gj-2u; Wed, 14 May 2025 06:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983790.1369965; Wed, 14 May 2025 06:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF5jQ-0003db-00; Wed, 14 May 2025 06:36:44 +0000
Received: by outflank-mailman (input) for mailman id 983790;
 Wed, 14 May 2025 06:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF5jP-0003dV-3S
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 06:36:43 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbe556ab-308d-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 08:36:42 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad2414a412dso585056866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 23:36:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cc3f5c9sm8354337a12.28.2025.05.13.23.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 23:36:41 -0700 (PDT)
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
X-Inumbo-ID: cbe556ab-308d-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747204601; x=1747809401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3C4kAv9UftGohtooO1z/TpM9mhqQF5D44PsfKJ889fU=;
        b=FQSW16pNscuK5k3Ur+DyQ7/bVOzBlOVEE0+t69oeV4ZPcDgWBkDJQfYINjzKRBHfwY
         xy5Au9LE3s225k50/oaHHeKQX0CTXIzZOfZNHkuCZeWklFkJznr7VMLpSB77G4vn10gB
         Zplvex37vGp6yHnzGu7FqhmidHd7xaKZ2TYz90daHkWmL6hGqB3UAMPK5iRzqwiZYrjm
         Kpsea3P79xoimjZ1R+uiCOwW2ePqPDRBJgafywDGOYPlvS/l60GvV8dH/bncoDleWRvf
         UMchMCdJHNeRy9wEEKgBMSDAL/1yLTPmOZXO62b5DuBfT8GWRaLmAX8BCa0YrLPJD79R
         4tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204601; x=1747809401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C4kAv9UftGohtooO1z/TpM9mhqQF5D44PsfKJ889fU=;
        b=tAPRsQc+zUlOJ4aGUDHlxA7GhHWXMXutsJn20s+M6Ea3iOg54YHHok4qfF6YoqA5MQ
         bPv355nbVtQfatYUBNW6HZPBnYQYbjfrFnQkGn8RRj9J82vaBi2LSnPfsgCBZ2fNnQxu
         1XRvRcdjNT6fmBtkbJSjfF6XmN8YTg0dxkV2aP/skGA/HAdQp5gk0fjcAQlS95wg/eAa
         92RtEek+0V4XE8HasdbBzbzi7wqSQsjAd3fzMpNJLphxNSsezVzpfkFKvdLITVmQCI2s
         Bz7PQ+FmyucrXwhC0uLXYLTQ3/CKpaOq6tFioIJaxXHrbd0E6VvqR0KGAVD8jyaNwPOQ
         pwQw==
X-Forwarded-Encrypted: i=1; AJvYcCVRBZ3Okmx1jVFPjBhL78VhDu0c71w0Jef2wJaGIqjZmYpyJuI5Qa20MMi5iRlIaAzeqTfv1vuZyfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJz5jISZthSpL6s50KI6/34O1Qxlpi7kP8q7e7DNmeKd37TwbD
	J23fI2I+C7eANmayZt0qp/2CV9K42f0GvG8zvxvfgvpc+iahQzBB5ggLT0RuaQ==
X-Gm-Gg: ASbGncvIbYRSdvzoVG+E3bhninnwBwNl9frh0XepgZA6VVIRkWjtxeiFef60am6mISr
	p7FvvMjexEUFqP8e4WrgvYii5W931oR7Q+waSIwBRF+sd8uXXSA95qkBulcHkGqVZahidwm0rT5
	LsrF7coSVLq/xnKymSOOd4MeGDdpIasZ++h9COTWgs5xF67EY4lVTdvcwk0UtsIYgWEXU4MKMl2
	3rWK7Rd5EvgYxOB+cS29/RLMsuXiZXlPd+TKbDJwU96Mj1SYG8KvRezh9wZqDlK9FU3T4ve5xng
	eBIQ7k8NVEV61mtzR+/v9skSTOXwD/hZdujl4YL++UYX+mehD7yXBsMv7FknCrHsNVfnpGeUMbO
	Wbhabg0nDTkjht9pWjZ2Fe9wknOW5q09YRk7l
X-Google-Smtp-Source: AGHT+IHpPdP6mcXYZQAJtUcl9LmdENtXoAe9fiSNzFEIHyVr/pnIMgrDCiNicG4lxms0ZwrMwPWRcg==
X-Received: by 2002:a17:907:2ce4:b0:ad4:d133:1771 with SMTP id a640c23a62f3a-ad4f7113e60mr217629766b.13.1747204601314;
        Tue, 13 May 2025 23:36:41 -0700 (PDT)
Message-ID: <17e575bc-2248-471f-9f64-e48ef6481180@suse.com>
Date: Wed, 14 May 2025 08:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/22] MAINTAINERS: add a section for TrenchBoot
 Slaunch
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <98bb81298fc94f38ea79975937e7a5aa81157493.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <98bb81298fc94f38ea79975937e7a5aa81157493.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2025 19:05, Sergii Dmytruk wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -542,6 +542,21 @@ F:	*/configure
>  F:	*/*.ac
>  F:	tools/
>  
> +TRENCHBOOT SECURE LAUNCH
> +M:	Daniel P. Smith <dpsmith@apertussolutions.com>
> +R:	Ross Philipson <ross.philipson@oracle.com>
> +R:	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> +S:	Supported
> +F:	xen/include/xen/slr-table.h

Nit: This wants to move ...

> +F:	xen/arch/x86/boot/slaunch-early.c
> +F:	xen/arch/x86/efi/fixmlehdr.c
> +F:	xen/arch/x86/include/asm/intel-txt.h
> +F:	xen/arch/x86/include/asm/slaunch.h
> +F:	xen/arch/x86/include/asm/tpm.h
> +F:	xen/arch/x86/intel-txt.c
> +F:	xen/arch/x86/slaunch.c
> +F:	xen/arch/x86/tpm.c
> +

... to the bottom, for proper sorting.

Jan

