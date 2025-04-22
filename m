Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE8A95FC8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 09:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961738.1353073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78Jk-0005zO-LD; Tue, 22 Apr 2025 07:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961738.1353073; Tue, 22 Apr 2025 07:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78Jk-0005xa-IG; Tue, 22 Apr 2025 07:45:20 +0000
Received: by outflank-mailman (input) for mailman id 961738;
 Tue, 22 Apr 2025 07:45:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u78Jj-0005xU-3N
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 07:45:19 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6d6284c-1f4d-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 09:45:09 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so4858487f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 00:45:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43ce6bsm14381132f8f.55.2025.04.22.00.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:45:08 -0700 (PDT)
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
X-Inumbo-ID: b6d6284c-1f4d-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745307908; x=1745912708; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fomW9Lvj35WiPEFxePjwNyha006EBTUk9gLqMS9nX3A=;
        b=KL6M19wYe65Bx8McDhfVVXkXOG6zKp7ZqWso/NAZ/VdUN0ypyGE+F2ViryhsjIgHXg
         9K8HtJGfP50C9EPuupGYyVOBHiZwqnJ4FiwnE+WMhMQKwAifLH8sCUClwMt2T9kY6UhL
         wNZRMsqOWDPXRAxKULbtF+PcqN3dponm6aaymZQWBqTHB+0mgtkJ/tnWftMGzW7RYUGU
         IJqeOT6KXmkR9pjh9IVrTHZ8OCpWijaP/vEXKJNVO7Tj4T0cxDhSextTTSIDwk1g4Uzd
         qootT76T5utDO7FpCIvOZCmNp8k1XeCoQKhDfrFV7ye59VunfcKs7+xNeNx/f36an21Q
         PKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307908; x=1745912708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fomW9Lvj35WiPEFxePjwNyha006EBTUk9gLqMS9nX3A=;
        b=dgcXMjqbj52ljod/BzdbFpclXW1ssdjRdMw1F510yFiT82xuW6v7+qCrZjfPATWE2o
         UKE9LWBK8LIwCgK8mrn8j+XtB4jKcniFk/qf1su6SA9KeH/JW4upKJYEVxwex+Je6YJZ
         JjlmdDyimkE6FFP6cBH40emT+WzOz8chgK5T4ISALUlSTuwwan2mCuOlrSm+gsUjKpNk
         0UsPaiR9e0s70c8UOq9/9QvzvPPIaqU04OX5x4Z7Ninec9FlHLSeQiwgroZfJ6XWKDaO
         wYNeXjTfYNI4iaXlc5KUr4pf5r0dacTxUfLWAqGg6FQrUrhkJeuKq3UEfTC/50pxGnfS
         8RkA==
X-Forwarded-Encrypted: i=1; AJvYcCUvM/4NwOu8JkcRJG/XfWj+63QeYqDZseeHAZOUHtt6I1sTWU87PU8dGhpo5A/5WkNkjswNkZjBwlU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKNr5osiiK/Ib8zx2XjNTVuz+EOJoW6LSNemzx0vbGYwNVRqXi
	42qwCjRdKbPNfSE1QfOQwuTcByFsTH7NdxaUewtK4k/4KZyUJY4yLEMr/09Tlw==
X-Gm-Gg: ASbGnctm81JkHmOXPMyuEXo6UhN+Fbuo245ubWh96Ufyo2WMsdnzQZDAeL7hitL4LIU
	JTJk4Vyptga43S9zO5uKagq/57aORMfcLcVZPaStWtiVvEuFKugu27+JLe6n3oCYaNNiORrDDfb
	a44FWYICVZZaCvODnIqB+xzP+78aCiL7ntwjP4qmx5SJAYNOe03GLEUDwujLIVHF0/ymhPha7VQ
	C9JXMosKh/2xlhKtj5yGOqG/pFiv+E6fwl5YEJThjvXQx0dimBSTShQSiDtz0olZx7ppF14QWJE
	BtiZwOegkFTeDRJJhTlpu+jqrIjCTtogF4NWPlNmq40SSoo1MpWd2W4Zi2g/9D2U7iuGdWhTCC7
	okOr+1ThwPtsG+nvCwjjiTLaIVg==
X-Google-Smtp-Source: AGHT+IHBPoFkeHg6ZaAuhnufDSPLFJPqNlS6d5+rh5uDfnK8JLMsRkccLam/lUV9Hi1GQn8FQSQL7w==
X-Received: by 2002:a5d:6d88:0:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-39efbad7d40mr10854107f8f.43.1745307908448;
        Tue, 22 Apr 2025 00:45:08 -0700 (PDT)
Message-ID: <b73ca490-921b-4151-ad81-16d531634846@suse.com>
Date: Tue, 22 Apr 2025 09:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] Physical address hypercall ABI ("HVMv2")
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1744981654.git.teddy.astie@vates.tech>
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
In-Reply-To: <cover.1744981654.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2025 16:18, Teddy Astie wrote:
> In current HVM mode, when a hypercall references a structure in guest memory,
> it is passed to the hypervisor as its "linear address" (e.g virtual address for
> the x86 long mode).
> One of the caveats is that this linear address (GVA) is generally not directly
> usable by the Xen and needs to be translated from GVA to GPA then HPA. This
> implies a complex and potentially expensive lookup of the pagetables inside the
> guest. This can be significant, especially if the P2M cannot use efficiently
> superpages (or with e.g XSA-304).
> 
> This proposal introduce a new mode where all addresses used for hypercalls are
> GPADDR instead of GVADDR, therefore, looking up the HPA related to this GPA
> only needs a P2M lookup and not looking through the inside-guest pagetables.
> 
> This mode is opt-in and must be enabled explicitely by the toolstack.

Which I view as a severe downside (leaving aside the PVH Dom0 aspect): This way
a guest needs to be converted all in one go. While doable, it'll be increasingly
risky with the size of the guest kernel code base.

A prior proposal of mine was to add an indicator to hypercall numbers (e.g. to
set the top bit there), to indicate which of the two models a particular
hypercall invocation uses.

Aiui Andrew had yet different (albeit also never spelled out) plans.

Jan


