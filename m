Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43BDA1A1D4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 11:30:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876123.1286486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tauSZ-0006K0-1L; Thu, 23 Jan 2025 10:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876123.1286486; Thu, 23 Jan 2025 10:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tauSY-0006Gv-T8; Thu, 23 Jan 2025 10:29:14 +0000
Received: by outflank-mailman (input) for mailman id 876123;
 Thu, 23 Jan 2025 10:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tauSX-0006Gp-LK
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 10:29:13 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e21233f6-d974-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 11:29:10 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso4893215e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 02:29:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31a2f1csm56269805e9.16.2025.01.23.02.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 02:29:09 -0800 (PST)
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
X-Inumbo-ID: e21233f6-d974-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737628150; x=1738232950; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oGEr3K/NMquYqgIavb4yV6pdTbdvdJ2f1hsdj+0wTMY=;
        b=dZotmasu9orpN2mdcM0GisPIaRuKtbURwFEn/Z9kV6qOQtqdnWmz5N/WeGklwDUPno
         BM3fXQwn/m63AxR5x5fCtldgtOZJHP6KqzIyKVZhHWtux1rCpBPAw+Bhetb8+yWBIzxi
         yvxy9DW/3kC4Rm0HyHR+AdYjoeLnhKBSqZyiVaBEXRr1QD3glVeSFK9580+usDC3sX3H
         1PslBbUrqlDjWmsSC+drSwz15epQhGgxiALBg3up11+nWua1p6K7zX+pH+CgcjEPLHLP
         R4VRrUSS4UfJpIXWWAzwhgwaAdDmFN/HrvP4hHhk83h1/K1mOCi7w8T/R0ed1jHSCNhr
         cxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628150; x=1738232950;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGEr3K/NMquYqgIavb4yV6pdTbdvdJ2f1hsdj+0wTMY=;
        b=sYJ4k8CaDpG/rPfr9G40R87EcbaBvky2gEsGjYSvRzHCCUUzSHwYopchsQbxgJxbvk
         CvebFC8Y/4N7VwK+wF1c1/zHPN49pqSwsSCd50WgVyi24Z+cTVWHl23ppKH30OQQvqBE
         CRlVwt+VJ+e8Rd+bAeP2rzkJKsPvWetHAwG3m/kS3hDIpT5zNoGTwVtuAzV3n4f7k4uw
         RjDG19q6ekJRK4yNgW4ZpqM3vKxA+fqZylWkiy/LFadIqPRpwN4YcqM89Txsjpcfiigu
         HSoGk48HRo5brN05wha3XuK8TBm7BrfO61MgIjC7ki2kNAuEMZTU+BC+mGiYxfZkXLxd
         ae3w==
X-Gm-Message-State: AOJu0YwOrOdolsi17WCAKW8V6dcTJE1UVCba4MsdAyDL2fkh60yyioAB
	IJwg6svxlqhmdzyBImBEelLc3zSKRW2FqbSFANrHkJfnnywhKeyqnQP0O8fjodwDqKQsrFPSjxc
	=
X-Gm-Gg: ASbGnctLqFmhHhUoHrEELEIH4fneJzWmVRp+uOpV2d7PoJJL2IwPKZ6RkJ24Ft4ChwP
	UPy0x48eolQNZ3TbFejyVfsRZEKUOsoRBAbffoASgPejh0RbKLSY8m8EqueNwnceq9mtEB2DG66
	bW/K8ZsruKCVj/8SPbon0G6FdBg3oOgl+5hoaJGdMUIHKSCgclYCZRxI/IKqQcOs4qJg2JUaa6F
	CDaVMM6udPNOQ/urk0gmZsNOTRwMS2spvnmfnLd6jwoQAtKh9gbH3lKqc94qc5Hhu1dnTLD7LN6
	KFyp2J1KpYc9JZ86dLrbj0VD179qxyQxWBgUZsyrHj12y1+a1bFPquO5jPoHJLHGew==
X-Google-Smtp-Source: AGHT+IEgtTcmiKl60UpMd2W1xasleROL44TM3ovPnClsMMq8VupTMqxcN31MVznsWj/2RdS2KtPZDA==
X-Received: by 2002:a7b:c8c9:0:b0:436:fb02:e68 with SMTP id 5b1f17b1804b1-438913bdd6cmr229021215e9.2.1737628149981;
        Thu, 23 Jan 2025 02:29:09 -0800 (PST)
Message-ID: <729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com>
Date: Thu, 23 Jan 2025 11:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH partly-for-4.20 v3 0/4] x86/HVM: emulation (MMIO) improvements
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Language: en-US
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

The main fix is patch 2, with the earlier patch setting the stage and
the latter ones simplifying other things at least a little in exchange.

1: allocate emulation cache entries dynamically
2: correct read/write split at page boundaries
3: slightly improve CMPXCHG16B emulation
4: drop redundant access splitting

Oleksii - the first two patches (plus the simple one from v2 that I just
committed) are backporting material, and hence I'd like to ask for a
release ack for at least those two.

Jan

