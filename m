Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D98948956
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 08:26:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772483.1182922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbDdu-0004x6-KZ; Tue, 06 Aug 2024 06:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772483.1182922; Tue, 06 Aug 2024 06:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbDdu-0004v6-Hz; Tue, 06 Aug 2024 06:25:58 +0000
Received: by outflank-mailman (input) for mailman id 772483;
 Tue, 06 Aug 2024 06:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFQN=PF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbDdt-0004v0-9v
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 06:25:57 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcc9338d-53bc-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 08:25:56 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7ad02501c3so15303166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 23:25:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d43065sm519356866b.98.2024.08.05.23.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 23:25:54 -0700 (PDT)
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
X-Inumbo-ID: bcc9338d-53bc-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722925555; x=1723530355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fPXs82CIu9qIA00V7IsOlmsbygJW8qXAzf+BDJDLt6I=;
        b=d+LvXnCU56JlolFLsAG98o8nE3ZjfyXXfXNbSJS4UpI7sLJtuzmSB5wuFkjJqXJuyW
         kUpJ3T3Msh+a9di9Z6vqx02V3CaSN92mX/G/L56bigisPtb/YcgQ9Dbv7xPAar9wI0Tb
         oyB7Ajdq7OYK3drZr1lNRYDe9hvZok47pcCfM2MdgmQogbIjwYJQ+dt8XO+fYBeJKsoU
         3/OgjPKI3TMQvnE2ZpwaUkeb0IOFq1DD1VLKismR1eHpKyUahbbFaUFqzLaw0JoPZ5vA
         jwiySQJPEuUsj3ORZPIZZ7E2sheUWd5l79CItZ5OhL0PQVQjOYrtuXw7/27gylVRFUoh
         KJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722925555; x=1723530355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPXs82CIu9qIA00V7IsOlmsbygJW8qXAzf+BDJDLt6I=;
        b=ITipDbX9oFBFQondPxbCN4R/u2J4R6S0sjk1TEP1L/MTvNyBfKxYAyU/vWVPPfCpEh
         bdOHaamISiAYJwq3i398n5FPoSkl5sgjn6sNaoavbJDgPHdfmciDnhr23h/BlDAGzhAM
         aGv6Q2SvfZBkNKklmggtdovWTchAYIiD1iQJzpowELg15i4lqToUJTG9Ud0IQg/xCXQH
         n5aCS1zkqhJAUhSOU5fTJNH3N1ODgqB2uBgV/iYW01i3ABD+r7MGUuJMCzNYFznpRYTv
         9ERyWgY6mffkMxBf12Edbu3sLABf57NtyYl3eZU8LYM500Qv9zxaQr2kUg86mQ7UzV05
         VJTA==
X-Forwarded-Encrypted: i=1; AJvYcCWDNGTqJJlfqTiT+VHx1K4mMyDESuga4Vw4lxcjzR2vS8l4CwlVCjczDFMErqY/o2NwRfHi/Ays+NjBCVZCk+8MAB57OMhuWAiCks+3qfY=
X-Gm-Message-State: AOJu0YzyVlBNVv+GMlW3O8bK9YhG8I2Y9wDoWqlPcSWwIZyVkpGqbjsP
	WXeXIbtrrIGI8DE6niOoB2dqjQ6ma5AChDMRb/sl4mOpUkahfpY09T1vs6BkJOPv/3tX+Vp5HqE
	=
X-Google-Smtp-Source: AGHT+IEtFihKaip9pJbqKpHzM+npRuRnKbixYNaDsvMrm1dEq1NG94STVcn7bzU6xSk67qn6uFnAnQ==
X-Received: by 2002:a17:907:2daa:b0:a7a:ab1a:2d71 with SMTP id a640c23a62f3a-a7dc51bd5cbmr1017321066b.59.1722925555212;
        Mon, 05 Aug 2024 23:25:55 -0700 (PDT)
Message-ID: <38836a27-951f-49c8-a10e-e19b910a8444@suse.com>
Date: Tue, 6 Aug 2024 08:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msi: fix locking for SRIOV devices
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20240805210956.364624-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240805210956.364624-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2024 23:09, Stewart Hildebrand wrote:
> In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
> structure") a lock moved from allocate_and_map_msi_pirq() to the caller
> and changed from pcidevs_lock() to read_lock(&d->pci_lock). However, one
> call path wasn't updated to reflect the change, leading to a failed
> assertion observed on debug builds of Xen when an SRIOV device is
> present with one or more VFs enabled:
> 
> (XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:535
> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----

There must be more to this than just "SR-IOV with VFs enabled"? The
locking change has been there for quite a while, yet the issue was
noticed only know.

> @@ -829,7 +829,8 @@ static int msix_capability_init(struct pci_dev *dev,
>              vf = dev->sbdf.bdf;
>          }
>  
> -        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
> +        table_paddr = read_pci_mem_bar(dev->domain, seg, pbus, pslot, pfunc,
> +                                       bir, vf);

While dev->domain is the owner of dev (seg:bus:slot.func), it may not be
the owner of seg:pbus:pslot.pfunc. Or if it (reliably) is, I'd expect the
guarantees towards that to be spelled out in the description. (Dependency
on ordering of toolstack operations likely wouldn't count as a guarantee
to me. Yet if I'm not mistaken there's a problem in all cases if the VF
was already moved to DomIO, before the DomU is started.)

Further to this, until realizing that the code path leading here is
accessible only for Dom0, I suspected a security angle to this, and hence
didn't respond publicly on Matrix. I noticed, however, that apparently
there's another instance of the same issue (via the other call site of
allocate_and_map_msi_pirq(), i.e. from vpci_msix_arch_enable_entry()
through vpci_msi_enable()). Imo that wants dealing with at the same time
(potentially requiring a different overall approach).

The code path leading here being accessible only for Dom0 likely is also
a mistake (read: overly strict). In principle it ought to be possible to
move a PF to a driver domain, for the VFs to then be assigned to
individual DomU-s. In such a case I expect it shouldn't be Dom0 to invoke
PHYSDEVOP_prepare_msix.

Jan

