Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E04ACB0E9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003460.1383017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5uD-00079b-4n; Mon, 02 Jun 2025 14:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003460.1383017; Mon, 02 Jun 2025 14:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5uD-00076r-1i; Mon, 02 Jun 2025 14:12:49 +0000
Received: by outflank-mailman (input) for mailman id 1003460;
 Mon, 02 Jun 2025 14:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM5uB-00076g-OF
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:12:47 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8567cbc-3fbb-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 16:12:46 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-450caff6336so26079545e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 07:12:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506d14ca5sm71123705ad.242.2025.06.02.07.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 07:12:45 -0700 (PDT)
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
X-Inumbo-ID: a8567cbc-3fbb-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748873566; x=1749478366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4eeQLARWxeYLzy5WyPLj5L3+9dsulMwlYB+Z9BmlGMs=;
        b=TwqzU+WUKxQ0G6MgIr/2whdjwYxdtRlMXFsBG0yTo7mfcHJ47tWsjTLUaGa1hU1G4l
         xQ3v9I1JcjAOJ6OfwMZjejiaOZ6hvRYgWwxmxukgP3AU2TxN15+vlgtYlsZoeDK9C6HZ
         wz2Ydvq9fUCwFzG4RNnhj2VOgmOYFe1uYIZru+9Cp86hqdt2a3nSjWVt5sW+wyvXaWVG
         qbWpAWV2Q/5EJs21c/jtW57iNOnxcwtjgEFLLHg9++bW0sWHySryta0atXKI3Yhls1q0
         IOhVVjPS/w737YQtHdctsM8NROJ/OgeT5x8aUsH3tW3Uk1kzrFairLZBXXY6s/CEv/4t
         Rfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748873566; x=1749478366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eeQLARWxeYLzy5WyPLj5L3+9dsulMwlYB+Z9BmlGMs=;
        b=e4zPcbTYtFOG7TUkcjYihkUQULW5U6ip/yUK0NW9rReau3X01wB3otmDBOQYTJQ/Iv
         9eW9EbYBEMaFCPzkxpyX65h8g459Yi13vlYt6aqekXVBsekrst38vKiCSB8x7qYC4LWp
         MGpCqdaRRx28fEy6SwILd1kZFLowa3+zcMZkOSLkM7sQDefXjFd4kjbpI5dxRptF2UcM
         aYXa5j3q3LzLV2pRR7uLvmZ6s7Jk/XJM3CXhtCHhSWOJz33UyUAZpxYhPG6LlX1RQmgC
         sjeci+kE04Iq+X5yzux4CQ+kLd14Hq2QB9N1325a4+Hw7GYg4oCVzcXuhLkk+yYAP9AO
         TYUw==
X-Gm-Message-State: AOJu0YwENFvFOZZesZpCcYIdancardaC/QyGJN3uftjDQRO/SQzoNIub
	vTY14B/wMvP/fuqZ47AVgaZSLU4pysMWWLkXO0pl/n2WhsaPpd9entxA2aI/JSv46g==
X-Gm-Gg: ASbGncsE0vdg3H5F+eBJerX09lfdoenF0RZNw+MGYEa775BtVepHU1GUnvlO/CUPkSx
	Z4VQmU7j1LNYYUEpJd4pN0OaimIlctFvWdYKVu2SLhe7WS8G1mj5SCxXpOtXjsvz/LJSbvw7KSz
	fLQ9yD/WWgsGU1Q0jDaQ3vfN6p3UC/JVLT9RD74ej0SOuiy1JtWzPItq7I89m5T0hnSwFVoxOLI
	8xD1RsAr/9TFQZ96PBwg7LTlFHaQI8TSqPxtgMsTtzWVkIz6JFjrDLY97nrJR7vgm8CoiaAKC5h
	wbUl12EYYHMKjx1OJekoxXvi58ak/+9jvzzgMim3hO+dqnUdQbMgOARU2iXLK3RqehF+pjPt+YM
	vnRgtuHEn6QsD87CzljYRhe4HE3V0sqpgOfFM
X-Google-Smtp-Source: AGHT+IEcxG4to/eMfwQM4ClD9gY+6KCLVgw7JmWvADhDrXWMBFRmX5Y8VhhgPB7SvGvT9m9ftWb5oQ==
X-Received: by 2002:a05:6000:288b:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3a4f89a892bmr9892282f8f.21.1748873565837;
        Mon, 02 Jun 2025 07:12:45 -0700 (PDT)
Message-ID: <21dcca4d-1c51-42f1-b73b-65702451de13@suse.com>
Date: Mon, 2 Jun 2025 16:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Nullptr dereference in nested VMX when shadow VMCS support is
 available
To: Manuel Andreas <manuel.andreas@tum.de>
References: <5f258e25-a4ed-4f9a-8ca6-9ea3400e2369@tum.de>
 <6d28eb0c-caed-4c58-a6ac-cbf8da357d22@tum.de>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <6d28eb0c-caed-4c58-a6ac-cbf8da357d22@tum.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.06.2025 15:39, Manuel Andreas wrote:
> I've discovered an issue in the nested VMX implementation, where an 
> unprivileged domain is able to force Xen to dereference a NULL pointer, 
> resulting in a panic.

Sadly you provide no details on this NULL deref.

> This is possible when:
> 
>  1. The malicious domain has nested HVM capabilities.
>  2. The CPU is running on top of VMX and supports shadow VMCS.
> 
> To trigger the bug, the domain must first enable VMX operation for 
> itself, execute VMXON and then finally execute VMPTRLD on a guest 
> physical address that is backed by a non-writable p2m mapping.
> In `nvmx_handle_vmptrld`, after attempting to map the nested VMCS, Xen 
> will check whether or not this mapping is suitable for writing and if 
> not immediately unmap the nested VMCS again and abort the setup of 
> `nvcpu->nv_vvmcx`. However, Xen at this point erroneously continues 
> emulation of the VMPTRLD. In particular, if VMCS shadowing is available, 
> Xen will nonetheless attempt to link up the nested VMCS to its own VMCS 
> in `nvmx_set_vmcs_pointer`. Importantly, Xen here attempts to 
> dereference the presumably mapped nested VMCS (which now is merely a 
> NULL pointer) in order to mark it as a shadow VMCS by applying the 
> `VMCS_RID_TYPE_MASK` to its revision identifier. Following, the page 
> fault handler will panic Xen.
> 
> I've attached an XTF reproducer that triggers the bug. To setup such a 
> non-writable p2m mapping for the malicious VMCS, I first setup an 
> appropriate grant table entry. I've tested it on Xen version 4.20.0.

I expect this to not work anymore on current staging or 4.20.1-pre.
See a8325f981ce4 ("x86/P2M: synchronize fast and slow paths of
p2m_get_page_from_gfn()").

> To fix the issue I believe the following patch should be suitable:
> 
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -1817,7 +1817,9 @@ static int nvmx_handle_vmptrld(struct 
> cpu_user_regs *regs)
>               else
>               {
>                   hvm_unmap_guest_frame(vvmcx, 1);
> -                vvmcx = NULL;
> +                vmfail(regs, VMX_INSN_VMPTRLD_INVALID_PHYADDR);
> +
> +                return X86EMUL_OKAY;
>               }
>           }
>           else
> 
> The VMX error AFAICT does not strictly adhere to the Intel SDM, but 
> providing the guest some indication on what went wrong is likely more 
> sensible than silently failing.

Giving the guest some indication is certainly right. If we want to follow
the above route, I think the change would want doing a little differently,
to take the path that presently is the "else" at the bottom of the hunk
above. However, I can't presently see how invoking vmfail() would make a
difference as to the subsequent NULL deref: The guest could continue the
same irrespective of the failure. Hence why I'd like to understand what
NULL deref you did observe. (We may hence need two patches - one along
the above lines, and another one dealing with the NULL issue.)

Jan

