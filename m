Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7FB070B5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 10:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044957.1415002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxcn-0004Ex-69; Wed, 16 Jul 2025 08:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044957.1415002; Wed, 16 Jul 2025 08:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxcn-0004D7-1V; Wed, 16 Jul 2025 08:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1044957;
 Wed, 16 Jul 2025 08:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubxcl-0004Cu-OD
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 08:36:23 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f40b55de-621f-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 10:36:22 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso4723104f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 01:36:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e075e2sm13988720b3a.52.2025.07.16.01.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 01:36:21 -0700 (PDT)
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
X-Inumbo-ID: f40b55de-621f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752654982; x=1753259782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=khOvqm/sZV0KW+7bqczmDmyaiOo//EmbeqKrtDwECxg=;
        b=ITYSDxRy+JiTnuON5YeUlWRd4NwXhj45r5S4gLxO8cnHY++x1wg4zBzVOJmrqMPjaE
         lRTmYFqZ6Nyc7KQORUh8GB+2HNuTO0Bh2wWWh0bko3nSYeOcK0zqwvbaNpz0Ft7LRMMf
         XRcYDzqbWzaH2onZHHj369xyxn+N0wgkjbSv/NwXge4NVw0FZ/cWbg2TTBk4dnpK+fmu
         JAlOhhj9OdYSQmL1h1fEw27edAW8I5N7cQ2Mrkmm+V7F11ZCGqQsGrU126sq+y4iv7ki
         mkCG8JmLUax8Tk3MV/CO54wODaPrZGknUBH5dYf/8feVJL34YwNKDZ6VWDrqtcoTIzC2
         j5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752654982; x=1753259782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khOvqm/sZV0KW+7bqczmDmyaiOo//EmbeqKrtDwECxg=;
        b=IOigFRYEkjrOJUKs7C6RSxC0Aky9Q7xTEofhFWsVBWKFN2UrgNf2ky/cSCLZnz2pY/
         1Pw2w8hWReDCFBUqbgex1MIZK9Ymt+cc4jLYGJnP4rKC0EKkiBews1CSqr5jbHcU2fWo
         ftVjvS4NqMuAy1peS9qiV0YCx3A4woyLWdznr+TbuhuhjM1zvQHPGsC+iJcPvhCCQZZv
         lN7VVNs/R/BqW/4iLYfvGWikk5nSdisaRXKJ21lq2B/P6WSfnU+3rN1RZdTbnsCtedPs
         WF3HkHL8XD8fq9gMBWOt+xZ8i1Vzl1rjxJiJ4m1yuAfGxOj1qcAVDkwmKKSoxZitjHgr
         unaw==
X-Forwarded-Encrypted: i=1; AJvYcCX2bLRfeWX8VEcBRhfId1c4DXY+hGJ14Rp1I3XRDLeMyXN+OaE0D9SR2sxdHJh8h1UpFQNwZmCYp98=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6LRYwQpDNP4zHL+8bYvLx2Rww3BGhHq0S3H0WM8H3hM9SRgNt
	oZB8V5B4oY0Unw7GuyI6sVDD6tVppxoKxKeUIyu+AVoDNhGJ2sLmjsHBWNC+C/+ryg==
X-Gm-Gg: ASbGncvxYPhpPpP1RO/Ysjs3WFf5jKXFdJmz8bc9sIo7GBXbkd0dFoaLKz4JlHDtSt2
	DOrshPp200vIMSb2bHGxXVmE1tapKv01hrBCOuq4j+nmZ+C1zuAr44HHDMOfLJemiBP/W+lrQe5
	+bUExVB0sGpCyEeD5VCDVDs44gm7drE/MDihYM/LmHk7EnX8okNhgrJk1fdppiYjVYNYoCg6ob+
	hxciP4j/3q4YucYrasCfE6TTEEOpIpOEVGg2lzC4jG+2mpmmcsVxmpABEG+M1q2TXYcFZXfmBbx
	G9EH25PsbUztKd8mo46i40rol19mqPLEywOCCuSm0TNrMqB6gGi0bV9r2wNRDbAnTuuGOwKto6W
	Bp7CEzAbkPyz5kMtOwePjUwBGB7y2TaqcYaXkzdnwahZiy+TC61InNhmHgICoXw6GrW+34mHTUR
	dhTYXVsrM=
X-Google-Smtp-Source: AGHT+IEyClXzRES47IZslWOhhUesI8+r8l9NWQPBke9AH5B4gzUYCu6ZZshGtG/WGBGYtd4ML4Fr+g==
X-Received: by 2002:a05:6000:1a85:b0:3a4:f744:e00e with SMTP id ffacd0b85a97d-3b60e4be7aemr1241475f8f.4.1752654982171;
        Wed, 16 Jul 2025 01:36:22 -0700 (PDT)
Message-ID: <82575b1a-970a-4d70-8fdd-5615cd3f3195@suse.com>
Date: Wed, 16 Jul 2025 10:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] arm/pci: add pci_passhtrough_enabled check to
 pci_device_reset
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1752649797.git.mykyta_poturai@epam.com>
 <daa6b4a6f1e0d90ddf5fd4c25cd941e3fb0d4774.1752649797.git.mykyta_poturai@epam.com>
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
In-Reply-To: <daa6b4a6f1e0d90ddf5fd4c25cd941e3fb0d4774.1752649797.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 09:43, Mykyta Poturai wrote:
> Without pci-passthrough=on Xen does not know anything about present PCI
> devices due to PHYSDEVOP_pci_device_add not executing.

While the latter half of the sentence is true, Xen may know of PCI devices
be other means. It scans the bus itself after all on x86, under certain
conditions. Furthermore "pci-passthrough" is an Arm-only option, when the
change here affects x86 as much. The description therefore will need some
improvement; the code change itself is okay (on the assumption that it can
be justified properly).

Jan

