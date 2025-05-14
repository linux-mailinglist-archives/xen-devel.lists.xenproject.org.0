Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DCCAB6450
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983928.1370103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Xh-0001CY-Or; Wed, 14 May 2025 07:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983928.1370103; Wed, 14 May 2025 07:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Xh-0001As-Le; Wed, 14 May 2025 07:28:41 +0000
Received: by outflank-mailman (input) for mailman id 983928;
 Wed, 14 May 2025 07:28:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF6Xg-00018z-GW
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:28:40 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e41cb6e-3095-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 09:28:39 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad257009e81so479877766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 00:28:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197be6d7sm886207066b.157.2025.05.14.00.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 00:28:38 -0700 (PDT)
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
X-Inumbo-ID: 0e41cb6e-3095-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747207719; x=1747812519; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BLBSZT9jCqo5EgJyDOHLa06HyInJkTH3Ca+Zk5y857Q=;
        b=UkqrtX/En8QfEp6YXqxJQQBzNgJLhrMOkwzNvJksNHYEEdckam3x50Bv95bxkzYFF0
         RCGK8d5wiSr6D5DNyoNe4k4AAdMnp2XPxi5zNDLXlp2Ncu5scoSgnHB4Ax395fakGHc7
         DRTMnurRif7ygY5liJTqztNyMMCG5ge6LLRnRxp13S8wrPKv/YN4bC2ajCvwbTLw8L8U
         rpkNkxcRJs0HxTGkV5sOqu4Pm0s1nkVk3bSEd5zFDg7x9L9D+qLLTRJQicKyrpchVPcw
         w6n81rB5X6V9bQlvuhxKsmkJtXBonq6tUGWrYG3znB3d99na//SHQGjjhfGsFlDpUpqt
         IoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747207719; x=1747812519;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLBSZT9jCqo5EgJyDOHLa06HyInJkTH3Ca+Zk5y857Q=;
        b=T58SUpST3sp8v27jPd4ENU2ElHVihdF/whcn1V1u7FA/a7D9+X2d6Y8TBNLPJ+1Yet
         yYthjPLDR3I98luMQWNj6XidP6rNEZxf3Non1YQ+pjkjy/X39VM08igmNnQTWxN25G/o
         IxSvcFiba8ggMMeIhKJw9VBQSAKA/u78d8y+uDfQyB4eQ05cDoMPBJe58ua3Ol62hWit
         a1b1jNj2MxmjuT8pNX0NcIHWXkHpTWhRyr5Wy1FL4cQEzT5G2H11Y8HjiAY89X6V9boq
         NRFmZ5f1DVq9GdH/Sxo7wFVGT0H1mX9OuukAUmYXDbuhBH9DwRBN3p+qbg+uOuBmG7Hg
         sqGw==
X-Forwarded-Encrypted: i=1; AJvYcCXze0vit/ud7zSb8nldzn2RRjQTacUi6MI6CgvNu1lymwrw8+93cdw45pbwExpjfqp+wSDXepSXFm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyt1jiRsX+EmZiOoSkCED4kUs1/sx2qj/GYtTZDjfBvUJGK0AcP
	oGLEX4INJxL47JvNS5KLHxAbpbxcgo/A6zXC6wWDRN5shwPfcet606pXesppVQ==
X-Gm-Gg: ASbGncsa5zZMnqCLAEqpkdCKvsnBr1XKGeO/7tTpDThfnWIPaXgYliIQeMd1X0IxkIx
	CL6S7dlcPVFAfDjmPNEtEsplcK13MybbboBV5WHaABKnYAwivkOa7WKaYcdaYCvY1ngZhmt3ztb
	lJdfQpOYxTOTPhYw7DfMp7+GDQw+F3tAhRx6J+wszBMP4IuxwXTO6fOAbwfFQhXMcPWmwaVizvP
	syaK46GK2jV/W1BWr14m25lhjKW0hPSq40x4tFqaVNdhNDH0akOBPeYoXHj6zKack8N/s0Dl7Lu
	PpoJbd1rc+GFOOHecqZNZ+unofpeAUW7Dz4nUeNRKMErftU+m0GKDuRZtrp7A5O3Ai8+8JAbvAt
	iOZ7hjhdx9F7JPEuexVbRnLXONafmShryLxGC
X-Google-Smtp-Source: AGHT+IGzmkelpaqvEeUelEP3FN6dSpznyCK03uamJsA9TOJbs4I9e6LKjkdQdqviX3aLC2IOmSq8hA==
X-Received: by 2002:a17:907:940a:b0:ad2:3fa9:751f with SMTP id a640c23a62f3a-ad4f72706efmr206013166b.38.1747207718887;
        Wed, 14 May 2025 00:28:38 -0700 (PDT)
Message-ID: <c4c19f45-1976-466a-909f-e7bd4fb2e771@suse.com>
Date: Wed, 14 May 2025 09:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] add document minimal_xen_tools.pandoc
To: Sookyung Ahn <sookyung.ahn@boeing.com>
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
 Anderson.Choi@boeing.com, brian.j.wood2@boeing.com, haesun.kim@boeing.com,
 xen-devel@lists.xenproject.org
References: <cover.1747205627.git.sookyung.ahn@boeing.com>
 <0267d6a430a11b9387d56514f963b6a5c6033450.1747205627.git.sookyung.ahn@boeing.com>
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
In-Reply-To: <0267d6a430a11b9387d56514f963b6a5c6033450.1747205627.git.sookyung.ahn@boeing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 09:12, Sookyung Ahn wrote:
> --- /dev/null
> +++ b/docs/designs/minimal_xen_tools.pandoc
> @@ -0,0 +1,147 @@
> +- [Minimal Xen-tools](#minimal-xen-tools)
> +  - [`xen-tools` : full vs minimal](#xen-tools--full-vs-minimal)
> +  - [Components of minimal `xen-tools`](#components-of-minimal-xen-tools)
> +  - [How to enable minimal `xen-tools`](#how-to-enable-minimal-xen-tools)
> +  - [How to include a component which is excluded](#how-to-include-a-component-which-is-excluded)
> +    - [Library](#library)
> +    - [Tool](#tool)
> +
> +# Minimal Xen-tools
> +
> +Purpose : To enhance `xen-tools` for users who require only a minimal subset of its functionality, particularly in safety-critical domains such as aerospace. 
> +
> +## `xen-tools` : full vs minimal
> +
> +- total size of **full** `xen-tools` and **minimal** `xen-tools`
> +
> +|      | full         | minimal        |
> +|------| ------------ | ------------ |
> +|ipks  | 8.1M (8216K) | **1.3M** (1276K) |
> +|image | 26M (25944K) | **4.6M** (4664)K |
> +
> +## Components of minimal `xen-tools`
> +
> +| `xen-tools-`        | included | Rationale                                                    | remark  |
> +|---------------------| -------- | ------------------------------------------------------------ | ------- |
> +| libxencall          | yes      | library to provide hypercall interface                       |         |
> +| libxenctrl          | yes      | library to provide interface for the ARINC 653 scheduler     | partially included |
> +| libxendevicemodel   | no       | library to support device model. Not needed                  |         |
> +| libxenevtchn        | no       | library to support event channel. Not needed with static event channel | |
> +| libxenforeignmemory | yes      | library to support  memory management for hypercall buffer                       |         |
> +| libxengnttab        | no       | library to support grant table. We are plainning to use static shared memory instaed of grant table to avoid dynamic memory allocation. | |
> +| libxenguest         | no       | library to support control and manage the domUs. Not required with dom0less | |
> +| libxenhypfs         | no       | library to provide interface for hypervisor fs. We don't access hypervisor fs. | |
> +| libxenlight         | no       | library to support `xl`. We don't use `xl` at all            | |
> +| libxenstat          | no       | library to monitor statistic data of domUs with `xentop`. We don't use it | |
> +| libxenstore         | no       | library to access `XenStore`. We don't use `XenStore`. | |
> +| libxenutil          | no       | library to provide common utilities. | |
> +| libxenvchan         | no       | library to provide interface for vchan(vitual channel). We don't use vchan | |
> +| libxentoolcore      | yes      | managing libraries' handlers                                 |         |
> +| libxentoollog       | yes      | library to provide logging interface                         | can be removed |
> +| 9pfsd               | no       | network file system protocol.                                | had dependency on `XenStore` |
> +| consold             | no       | `ctrl-a` ×3 replaces it                                        |         |
> +| dev                 | yes      | header files                                                 |         |
> +| flask               | yes      | Xen security policy framework (XSM/FLASK)                    | disabled |
> +| flask-tools         | yes      | tools to manage FLASK policy                                 | disabled |
> +| fuzz                | no       | FUZZ test tool                                               |         |
> +| fsimage             | yes      | file system image generator for domUs; depends on `pygrub`   |         |
> +| hvmloader           | no       | legacy BIOS loader for HVM guests                            |         |
> +| libacpi             | no       | Advanced Configuration and Power Interface                   | disabled |
> +| pygrub              | yes      | bootloader parser for domU kernels                           | enabled |
> +| reums               | yes      | tool for failover of domUs via periodic backup; requires `libnl3` | need to check dependency with `libxenlight` (xl) |
> +| scripts-block       | yes      | scripts for block device                                     |         |
> +| scripts-common      | yes      | scripts for common utilities                                 |         |
> +| scripts-network     | yes      | scripts for domU network setup                               |         |
> +| shim                | yes      | EFI loader to launch Xen as a bootloader                     | disabled  |
> +| xenpaging           | no       | domain paging tools not used                                 |           |
> +| xenpmd              | no       | xen power management daemon                                  | had dependency on `XenStore` |
> +| xenstored           | no       | Xen Store Daemon providing simple tree-like database         | had dependency on `XenStore`, and event channel |
> +| xenwatchdogd        | no       | watchdog daemon. Not needed                                  |           |
> +| volatiles           | yes      | runtime files (e.g. sockets, pid) for Xen tools              |           |
> +| xencommons          | yes      | startup script for Xen toolstack                             |           |
> +| xendomains          | yes      | init scirpt to autostart and shutdown domUs at boot/shutdown |           |
> +| xentrace            | no       | trace Xen internal events. kind of debugging and monitoring tool. Not needed |  |
> +| xenmon              | no       | live trace monitor                                           | requires `xentrace` |

While I trust you that this properly summarizes what patch 1 does, I wonder
whether this simple "full" vs "minimal" can really cover everyone's needs.
Furthermore, is it really a requirement to limit what's being _built_? I.e.
isn't what you care about what ends up on the target system(s)? In e.g. the
RPM world that would be controlled by the .spec file, not by changes to the
build infrastructure.

Jan

