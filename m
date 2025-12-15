Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A85CBF0E6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 17:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187477.1508866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVBqn-0002gm-BQ; Mon, 15 Dec 2025 16:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187477.1508866; Mon, 15 Dec 2025 16:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVBqn-0002fC-8Y; Mon, 15 Dec 2025 16:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1187477;
 Mon, 15 Dec 2025 16:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVBql-0002ee-Pw
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 16:55:07 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca82eb5a-d9d6-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 17:54:59 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47755de027eso25695695e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 08:54:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f718279sm69921395e9.19.2025.12.15.08.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 08:54:58 -0800 (PST)
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
X-Inumbo-ID: ca82eb5a-d9d6-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765817699; x=1766422499; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lDZKaTx1zWUxx3w8S0Bvlet6BEaZTayv8riYm07q4pE=;
        b=TfHHTWwXzIxKdufWuJTSjWYj7IoPMZSBHz1qBE7xjJ1cIbgNL5n4Fl70d+/cLaCw+Q
         PQ4BB1Lfw/G+XldtsmoxCobWrSvux/+11204Od2YwaMB0O8ugaPtCWs0E8zVig48FB8I
         MFSRvCyDEQ9MJxvoZssmGBlmaasOYJ1PGZAsU8oH0DiTcgTYULC2xOOkVpKyjDdH0Vs5
         el0cZo4ea5uIBCNUT5Kv4iqVn8DFUTINp9JbFzcpuuBcOomuCRKqozjK86ShI/hsCWKB
         rVF2j2CEFOPyWrOjs6F9wC8tW93BL3QK1X8Cbqjui3QGMRITIxRXflQEISDRlOYmYuUi
         50jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817699; x=1766422499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDZKaTx1zWUxx3w8S0Bvlet6BEaZTayv8riYm07q4pE=;
        b=k1kwp1YQeZBRKaeaOcfNzqlRchQppkNLZlbrCHx7Am84GNp+P5fkyQ3M6k9fPwhde6
         UBWmvNVc4T7EAbhXlEzmQle9Gw63eybzd4whMZEj+V7Gj5RNUYYakrvsA5ZJxpewXecr
         EXqjJ3mDRn/EKd4XRVcdLoqahUkCV1oK1px9JtQZBk1za972PK/eW6JyMU2AjNRJYyes
         +ZMCUdILyE+OrlcA9WEgzh5iw4UREmYwTtGclace5KwWQWfCpd4j87XUGmWmWJI+EIOZ
         tdTWOtgJx1YxSsXkGA4Kf0Ao4LSv8f18g9SiF2c3/I15SRjhqJRdAtwTwh3bKGZ/8o3v
         Z1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFyJ5aP6T4qlTP9e6CDCpbD5Re3Rh7dzj8uJclEZk+hx6148meZMjyYet2UohcxtFB6isSz2gc1OM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaVAtKZDyWa8kjpYFGI7etfYTduCH2ZN2chSQ4b/0NFOakAoap
	uYwUrIFm154mODKMpjTQT+DBuN7Sp7HdOUfmIrWFzYlRZHOtPt0cSZYloFFciFo1fw==
X-Gm-Gg: AY/fxX6iBTzgBVXh3V/v9MPvp2jx9TOjybIJuOXYgycdWSqNs6Xg4dsgEsvXndQA6yT
	KSCp+QIsgsebMwEkcoIbN7xD/ZFH9HgdsGRMo0JeFfd8R2SKmlcvtUME4hMv7yw8wFGZOv9njTT
	p+mRhauisIl8+mKyx7xIlOLQunJLBpSLrGHZ1hWvL0ukc1QJokGwwDBlLVESOX4xU5eoCn+v/Yy
	9k4OyZhcho2aK0WBqLokTWF6Nz5Ol8za2IxE9JytxU4wrlR9cumELDY/8G7xt/7oOys8LZ/UtfB
	2qosUApEbfMl3k+vmuO2XRQTA/f764dm07zMluLCd+ntsZM7zUg+OMexqIEsHx4YRATXLtGIGEz
	m2wcCGHItuxDu8a6weftt9HZFCyOlhBRhvRWVEvaIPmI40w77oauAzohPFJu1wnKS4Flr0+Zo/7
	kBP9C0quP0VhaEALQLp4mPB36Sgtw8hr4x5SJfGuPOxPEGqhBS9kg1zg4Uy+/GgDslY4ecSTbDY
	K8=
X-Google-Smtp-Source: AGHT+IEAGCtyC9+i9cDXcpF59QG8txdDD4ECMiy3kXemRCCyH+aqI3u12iQQyjFLrLl58kPVauy4SA==
X-Received: by 2002:a05:600c:3491:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-47a96a2e1f8mr77485165e9.11.1765817698785;
        Mon, 15 Dec 2025 08:54:58 -0800 (PST)
Message-ID: <737b4297-2844-4fc8-99c4-a3c1cf206580@suse.com>
Date: Mon, 15 Dec 2025 17:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: enable VCPUOP_register_runstate_phys_area
 hypercall
To: torsten.oehlenschlager@tutanota.de
Cc: Andrew Cooper3 <andrew.cooper3@citrix.com>,
 Sstabellini <sstabellini@kernel.org>, Julien <julien@xen.org>,
 Xen Devel <xen-devel@lists.xenproject.org>
References: <OgJMhRT--F-9@tutanota.de>
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
In-Reply-To: <OgJMhRT--F-9@tutanota.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.2025 22:01, torsten.oehlenschlager@tutanota.de wrote:
> ice@blossom ..............................................................................................................................................................................…/xen 🌸 enable-runstate-phys-area ?
> ❯ cat 0001-xen-domain-enable-VCPUOP_register_runstate_phys_area.patch

I don't quite understand what this is.

> From 416992b30258d34b7cc7bc4f7875719f47618147 Mon Sep 17 00:00:00 2001
> From: melanie <torsten.oehlenschlager@tutanota.de>
> Date: Fri, 12 Dec 2025 20:55:50 +0000
> Subject: [PATCH] xen/domain: enable VCPUOP_register_runstate_phys_area
> hypercall
> 
> The XENFEAT_runstate_phys_area feature is unconditionally advertised to
> guests via XENVER_get_features ( see xen/common/kernel.c ),  but the
> corresponding VCPUOP_register_runstate_phys_area hypercall was disabled
> with a placeholder check that always returned -ENOSYS!

Well, no. The check you remove ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2284,10 +2284,6 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>          struct vcpu_register_runstate_memory_area area;
> 
> -        rc = -ENOSYS;
> -        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
> -            break;

... is dead code, yes, but it certainly didn't cause the function to
return -ENOSYS. See commit 48a3fd14327f ("domain: expose newly introduced
hypercalls as XENFEAT"), which in a change like this the description surely
should have referenced.

Jan

