Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF481C57178
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160973.1489003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVAD-0005zG-7v; Thu, 13 Nov 2025 11:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160973.1489003; Thu, 13 Nov 2025 11:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVAD-0005wV-3F; Thu, 13 Nov 2025 11:06:53 +0000
Received: by outflank-mailman (input) for mailman id 1160973;
 Thu, 13 Nov 2025 11:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVAB-0005wP-KT
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:06:51 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da598ad3-c080-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 12:06:50 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64162c04f90so1196830a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:06:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81296sm145339066b.6.2025.11.13.03.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:06:49 -0800 (PST)
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
X-Inumbo-ID: da598ad3-c080-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763032009; x=1763636809; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMiMMNuk/Xb6CdxzNNI9lynPChI9V/SnNm4r0SBAisU=;
        b=CA+meWIt4ZOIf6gOJyoFW1IYBLe0O5cmdMHLDrbeMXenX3GYV+n3dMQygejBnz2JG/
         bvaiD/I2IT9Q0oGeSuA3XY10Ta3chb9ZJHboWF8wNM5tuKCJSFVT2nOPn1DLf1DoIiqu
         2TR3pV9d/l1Zb+KIu0gp5JEDXN99gQnPQ/nN4v/TnSztzV8SEDUiRHEd8ef30gh/LAIG
         t2LIbbgG3K2h1Ral1FSG1FKMah34/6mgcnoczd9in0sONLeD4uhoP6k/DfT+sbMDGYGK
         dwtJxkp1zpIR4YVkNPHJ3ID9gGrNoDYrEa6IxpgOSit1v9res3kEeerCh/6Ks05o20me
         cH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763032009; x=1763636809;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMiMMNuk/Xb6CdxzNNI9lynPChI9V/SnNm4r0SBAisU=;
        b=XVAGWQdSJ1uKulpjBQTIvTEKJuLgkwuKiBTD4Fj62BjTAFe6Vhx3ND0V0vMipugmMM
         lHm0opDKD7XSPO26tgZbuGpWokngzD1OLA/2eIqZy8/zxH9LafmAiWYsU4mIyQMK4rUh
         McCPOO8DaCg4I2ClnZc/FUdmEeWbVZC8UCxnEWrUg6EnhJfrlogrCp3urBkPk6og+dyu
         nvHsCwIJwCyLLdBbk7HFalt4E3cgsWV4LsIN/NsQXVTblw9QFHd1sKxGqFV9hOh5JhQF
         csI59iAV6qmEi9+csYZvzvpLwRxlStG79NXsFRUPYepZ4E5nwIKvC2bFDYleklZWpKve
         B8Ag==
X-Gm-Message-State: AOJu0Ywj9mcdDYGeemVr8sLGl3SJRAYTjlb0OqSaA/hEtZWJDSDipCCB
	1TbOSqpgFRCeflV9sxVJV9eWKZKrc3QbmrcyeaLityqfR2fjPZzSPxoVPvCpg/uK70Iv9cxYAtP
	b6AI=
X-Gm-Gg: ASbGnct8doW7JNWEr32s/Jh2G6g/x073p66H/v8aNcH/jsfhbgOhDLSxHgRba/mE1og
	OFvAtgGm9yKj0Pw628K0/VPKJ0vHj3mZZv3HXxb6bxVKsCocG00Qp4gdAeFpbI8/PPjMetoYzjb
	X66lB67nK/lZUA+i2jmUJM05eeN5sYbXvpAdAvr0k1CHmEC23jHFg1WTt8lNUO+07uRc56Hssfw
	uOpQTxxEfbJ8bWJHlTMT4MjpuuMg55v6ExVtmDPBAnPFbbEE1+eNHjJMU69DKvzi3YnwYWE1k8M
	+WIO62dfuJJL+W9vyEjO2UBAd8OJnSu7OSYJYA2r8qY4EgogxMQz20vzOEa7u9C8lplCortTdIa
	4QUOeBWompJFOKJOui5HXxQSCifTimkutaE2IVG4OHhfdaxtFjMUoaJqJdpUISMA9Yk81rBCIet
	B/ar9KSk/xLfTxyT+imdQZq2j18Sm/FdJbE2WHsrn1QFWHED3+kI9cRrmGDBZqz9SiZcV59Fzlt
	K0=
X-Google-Smtp-Source: AGHT+IF6gIgVJC9b4afCrtu8/vX+KmbglXbj7M86DBTwummJBbG3XMTLtBnxW9iKLJC651ujjDrFAQ==
X-Received: by 2002:a17:906:dc8a:b0:aff:c306:de51 with SMTP id a640c23a62f3a-b7331970801mr702571766b.4.1763032009542;
        Thu, 13 Nov 2025 03:06:49 -0800 (PST)
Message-ID: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
Date: Thu, 13 Nov 2025 12:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86: "brk" allocator
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Derive for our purposes something similar to what Linux has been having for
a long while.

1: x86: introduce "brk" allocator
2: x86/EFI: replace ebmalloc()
3: xhci-dbc: use brk_alloc()

To reduce padding holes, .bss.page_aligned and per-CPU data may want moving
immediately ahead of __brk_start[]. Albeit then the tail of per-CPU data will
all be padding space; sadly the TSS wants/needs page-aligning for XPTI
purposes.

Jan

