Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884119F341A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 16:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858267.1270520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCkl-0000hc-Cs; Mon, 16 Dec 2024 15:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858267.1270520; Mon, 16 Dec 2024 15:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCkl-0000fX-8g; Mon, 16 Dec 2024 15:11:23 +0000
Received: by outflank-mailman (input) for mailman id 858267;
 Mon, 16 Dec 2024 15:11:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNCkk-0000fP-IG
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 15:11:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 018a2bdc-bbc0-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 16:11:20 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43622354a3eso29272345e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 07:11:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361e33ffb1sm137663445e9.0.2024.12.16.07.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 07:11:19 -0800 (PST)
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
X-Inumbo-ID: 018a2bdc-bbc0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734361880; x=1734966680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i9CWzlJ9qZYcDH5GaUG+z8oZvJxLFdOdvvlTmb/5Knk=;
        b=Xy0GogeTHkVjHW7Y/hbWgzUEPGHhxYvFffB127/JCbrF7cqfkkePC2YAUYpzAalET1
         sAuzwrJgH+RCZ1gHfUERrU4fbrexVSqN1/cJ/QvWGZFXnt/4HXUwMflIzoQyzKc0kREw
         ZITqa1EY9x9mvac9uYlH0DP/B5XOPvuNetY4n8WSBgbs6xlL8lK/7SrTF0Db+kGqePlk
         AMnlfN7M6SvNlXLnwYaawHkCk30AN6xe286eEfdqqmt8LBwuJNBzfe5QNmdbn8BkSlP0
         2crea01HUprIGmOHsn8tM+SvlY5OWxugSxITHPkMvx9Iod1eYy5At9dgMBy1xA/N30sE
         pgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361880; x=1734966680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9CWzlJ9qZYcDH5GaUG+z8oZvJxLFdOdvvlTmb/5Knk=;
        b=kj2JDygfa2l39pSs84L/Ejt+pDZbZP0vckhevINsLYtfCh0tEoToFQ8gTIKsARTjQ0
         f05nwSP17BJ9E4iqJmGuFqAH6NkmI/sgvhfnVGsWmYqGh2nLHNJUYT/CANCX23DBRgZp
         k1D6Ir60AhxCRI89zRC+fp6zWvkY5HfzktKMW/wSCHb7aS3OvqIOwZ6ZnASEHt/OJQs3
         pb8n8wilB6v4PUwAagrLWkjiKpAZh0iPq089Su4E4di3F7P7gVpRUICo9cNzfWZ9gLiw
         AepSa4XkFJARuJuQ2rlqtuqjlQ9NB7iD0iW87OdcgYX3MFm45YlHcpVNtkdZNb7o9Chf
         XoTg==
X-Forwarded-Encrypted: i=1; AJvYcCUE88OyGjsHJ3tZRpMs2J0BKo48KDIpJ204SmwITGHgdFxLjzaojptKT+ztTxwUIXyg8/0+pr+V7SE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoKvk5UJq4gP8BnD35PffQuLxjwA/QOa7vPfYoCO7S/mYWrFhY
	qejExOwnXMLnULMhr/LE6Zysr6oznuoBikf1ZR8CJcJsH5l06OHydr3pe3KbbQ==
X-Gm-Gg: ASbGnctZ3wzSoPMD3BRaSVe/l84APnqmytmeEYwaWgwjpP1MFFta1SRFPVckLcOVN+A
	PweTtRuJBEVshJzAb5qtbFoyqehuSlXFMqiyMnK70C1sVPim+N+IDWgsH8PmrSIrlwXTSM6Es+2
	W1bLKsrjzENwPeDma0ZL6upkjjOjM6Zf4cDxGBuxinsdG+QbuvYm900AdYGOczHeKZxJHwipID7
	xFXa0K+D+gP9kYyzPTuRoe8gZbYhLDU/hwKykTDkfHH88ThqjffwI7+xHYKpcj2RMkIgA8tZukt
	EzOA5h8jHaIhWwf3XhuiJ6E1bOYvqfZqrdHZVV4Olg==
X-Google-Smtp-Source: AGHT+IGwBocIKtpzFzSh6D7wvrUBm4tjNNLeZp8UdG/ztYhbY4o277U48k1Pzg5W48Th0iLGNSQaIw==
X-Received: by 2002:a05:600c:3496:b0:434:a07d:b709 with SMTP id 5b1f17b1804b1-4362aab4896mr111154315e9.29.1734361880158;
        Mon, 16 Dec 2024 07:11:20 -0800 (PST)
Message-ID: <e344d00e-4cd5-4a11-9d6a-046fa135fd80@suse.com>
Date: Mon, 16 Dec 2024 16:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:42, Denis Mukhin via B4 Relay wrote:
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -8,7 +8,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  {
>      switch(d_config->c_info.type) {
>      case LIBXL_DOMAIN_TYPE_HVM:
> -        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> +        config->arch.emulation_flags = XEN_X86_EMU_ALL;
> +        config->arch.emulation_flags &= ~XEN_X86_EMU_VPCI;
> +        /* Virtual UART is selected at Xen build time */
> +        config->arch.emulation_flags &= ~XEN_X86_EMU_VUART;

That is all domains, even post-boot created ones, only ever get the same
setting?

Jan

