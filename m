Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028FFAD2E2B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 08:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010516.1388628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsu6-0000Ys-LN; Tue, 10 Jun 2025 06:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010516.1388628; Tue, 10 Jun 2025 06:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsu6-0000XG-IL; Tue, 10 Jun 2025 06:56:14 +0000
Received: by outflank-mailman (input) for mailman id 1010516;
 Tue, 10 Jun 2025 06:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOsu5-0000XA-Qc
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 06:56:13 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff0cc77c-45c7-11f0-a305-13f23c93f187;
 Tue, 10 Jun 2025 08:56:13 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso3272358f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jun 2025 23:56:13 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df34sm11567746f8f.71.2025.06.09.23.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 23:56:12 -0700 (PDT)
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
X-Inumbo-ID: ff0cc77c-45c7-11f0-a305-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749538572; x=1750143372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=897J7jDLs92ieMJFM2XGqS8hZldTET+6U7XnxbOkPpE=;
        b=bMXE8uTYA1BBEx30t1FpCGGB5z86oW5fDH2oAFjCpYGY6ipglTlLRBYWAIBq9Gnci9
         BpZd096qXdAhDaS1oeNBwASyWUCJPWXLr6WqYIfrWo+k5xHcFJNql5coUuOKJHzyzjwz
         nLcvFHq2hfqv3zbQE6s9nAf4BJbTGeivANPfSkI5E0loBxfpy0DcFqzRSTJt8TOrPtgm
         VFFTW3wOu1cZF5n975XsjMFHAZyqL6xnhK0eDh41aOKCG1Yon1v5NDEmWoc30AqGTg+j
         te75rA6SLGBIcxG0zTQ20KbkauN6foiBzI5xyRtTFiO/US8Nqrn90G/9MTquZzIgZ4fD
         3cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538572; x=1750143372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=897J7jDLs92ieMJFM2XGqS8hZldTET+6U7XnxbOkPpE=;
        b=PNu/P+lU0kmKOjR9es30k6eHPF5u+H1EkmQCG4Ltob2mkHDO1ed3d+Bz+nEBFH1Z4d
         Lsb84l6TYwidp4q5yOKF9AOKCVn6+xTPy9tSFKS9rt8MYhKirFLDsOzoa5fyCiMNdwXl
         bkXsI97A4CP8WCLK3n5X7skRuDq7nXICoTExWKoSQrddkFmBc9VxcDOZQLSbTKCrW/x2
         ZRD2pD6coIFpoOjCykQ17JH6xWqm/JUE5V4382FrK8GFs0T0qmUXcAN0iIhqdO7U/w7R
         ODbm64WqEi5NmUCooTg5/joA9e2DUyFJBrcabSoI8V0Hl7ziaI+XxBrc5sqo1b+k8NwH
         oFIA==
X-Forwarded-Encrypted: i=1; AJvYcCVCgIKMv1qyNa+Jkm7A/hSyOVIfb1BDXc/HOoHCXPjxbCEC0o/Ivv6/K/ErXrkT5VxCKgv0aP2jamE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxmlg6MY607VhOKiMZ5cl2XOoH4hpUs0wRfTzMCMjgDzSmig+Kh
	gP73+lmuvI60SxlitkdOuSIXeQcgOjnnZycLop2GFSBJIGXfJXotblmXef3pTMqtuA==
X-Gm-Gg: ASbGnct7vT07YioddWYFohIaCgl7eptSd5/ZINkTlFxnkJDG+artA3opRxyjmLNsTt8
	i1vkblz5Yvi8B9yZizYWox0ro8J3i130ASVrftNME/2rMV+5XP50WNIrOi8XkKuug484hHO/e7Q
	j68XePThqXaUfn5FR4Jv922kgzn5Vv23fpqzO3kwTxhj6+Dz9qywFcUfAucnOGM/qpupofQzNrb
	FHddD+x9uJLAePt/HQYx5o+DB/wVjNP+92f55JbbPpo+7KCrO7xjmwLUWooL73fQM9TWOmHzpFy
	mNLD0PT3nlMtpIH0PwSYOVOIGDHhgieEltM4b4RS7/YjWsBoHMsaBQFTrt+3zGXx0IeazlF660M
	WxrokDGVseo6BRaHjnnSjbQKWEarkJqMvg4S60dRqDTg6cOIlvjnQ31T8tqnyiGisxA02UDBnw2
	Uo64RLd3TfRb6jXRbimKyn
X-Google-Smtp-Source: AGHT+IEQ4lLW9lzQsSdVtn4yNpxUQXAV0U93zKFJNvUmtvxoLfECYZ+zliTA9fdLVw28g0lCt9sGaA==
X-Received: by 2002:a05:6000:220d:b0:3a1:f5c4:b81b with SMTP id ffacd0b85a97d-3a5522786acmr1165699f8f.23.1749538572405;
        Mon, 09 Jun 2025 23:56:12 -0700 (PDT)
Message-ID: <02ffa9cf-b5cd-431a-834a-a11bbf310196@suse.com>
Date: Tue, 10 Jun 2025 08:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] x86/hyperlaunch: obtain cmdline from device tree
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Denis Mukhin
 <dmukhin@ford.com>, Alejandro Vallejo <agarciav@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-7-agarciav@amd.com>
 <59f37fcc-9226-46c5-8dc8-7bd2100d8f59@amd.com>
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
In-Reply-To: <59f37fcc-9226-46c5-8dc8-7bd2100d8f59@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.06.2025 19:07, Jason Andryuk wrote:
> On 2025-04-29 08:36, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>
>> Add support to read the command line from the hyperlaunch device tree.
>> The device tree command line is located in the "bootargs" property of the
>> "multiboot,kernel" node.
>>
>> A boot loader command line, e.g. a grub module string field, takes
>> precendence over the device tree one since it is easier to modify.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
>> ---
> 
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
>> index cbb0ed30a2..dabe201b04 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -219,6 +219,12 @@ static int __init fdt_process_domain_node(
>>               printk(XENLOG_INFO "  kernel: multiboot-index=%d\n", idx);
>>               bi->mods[idx].type = BOOTMOD_KERNEL;
>>               bd->kernel = &bi->mods[idx];
>> +
>> +            /* If bootloader didn't set cmdline, see if FDT provides one. */
>> +            if ( bd->kernel->cmdline_pa &&
>> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
> 
> The logic is incorrect - it should be:
> 
>             if ( !bd->kernel->cmdline_pa ||
>                  !((char *)__va(bd->kernel->cmdline_pa))[0] )
> 
> If there is no cmdline_pa (which happens with the "reg" property) or the if there is a 0-length string, then check the DT for bootargs.

Even that sounds bogus to me: There's a difference between "no command line"
and "empty command line".

Jan

