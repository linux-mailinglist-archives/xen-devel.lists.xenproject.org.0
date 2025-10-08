Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C04BC5476
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 15:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139698.1474951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UYp-0003Ws-DV; Wed, 08 Oct 2025 13:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139698.1474951; Wed, 08 Oct 2025 13:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UYp-0003Uq-At; Wed, 08 Oct 2025 13:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1139698;
 Wed, 08 Oct 2025 13:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6UYn-0003Uk-Iu
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 13:50:29 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf9deba2-a44d-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 15:50:28 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-63963066fb0so864793a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 06:50:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970a786sm1720060266b.46.2025.10.08.06.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 06:50:27 -0700 (PDT)
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
X-Inumbo-ID: bf9deba2-a44d-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759931428; x=1760536228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TxbVZTEFl2L6cu2TWWmUm5qVISbtOH3h2nacdRtr2BU=;
        b=XpRtZrNU2uB6rGT+zX7AC0jvCE1Rb4PLR3aW34UPB5ZNMx+gBajX9X7e0837QZAYhl
         Y/kY7sTFo8aKmZ+l4+ptWCCpAcwbHAXMvdE+ZaltzTPiMAQ4lminj04aIDIP0TA+P7/F
         YOBLv6Z+MhMDcl6A7kQc6JUNynt9mqokrJiN4MLmrkGpAaCi7/JA4wJupWfZOmHVaiCR
         kQiJ4AazSiBh66MF+TeI70ke85gNl2JiyBAlTiw7N4iNtJDvvdRISFyjS1Awl4l7osPC
         jZwAS9HdlD6pIrjt/J+rEEa7Ugda24oDauOWwnIBnOzRBRF1gmI/rokrab+MmeSqyXB2
         VANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759931428; x=1760536228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxbVZTEFl2L6cu2TWWmUm5qVISbtOH3h2nacdRtr2BU=;
        b=gd1ZOURVdRkd9UZZ0OD+csF04aHGLlr+v863VdRI20WBump35E8VRjYjiyFLScMUEU
         aVcOa7Qcp2CAku5FK7u3G+Smgafk4p97TaQ7h0I60nXaWA2iLa/68MCLvl8lhHg0RDgg
         axvpZlUlQUQthfMWSq1HNHRgGTY+nraYKiq38OH/uhiDZI3daiaIpB5GgQmvq7cm8UZX
         vdAtlbXApHMsy5c4o751/qxaDScBEFK90hSmxpTfPzks7+PHOqPSKXHb3N/pKjF42o8u
         tBXDpUGMdg/U7WruuC4TBG78PeQ610uH5ewWTxTVrEv4dnsflHVnLkqxbkgXdghQuo4B
         XFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc9PlZKadeaT7NvQvn/ITFUpF3EyCj+luieZK2FV1DmyxfLh71O/RW/hPvxQso/7qyDwHqzeOyvhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4aCG+1eP+vz0ZqywSpMgAPOXcc9EQa5yMBMtqmk4ChXGrbdLm
	ZWoiDVI1wT8tNc8MiKdSAdyeW1WWrVKvYI4JIgXf2qBDievchBSrewb6WImIwNvYmxcFYS4q3Uk
	Bmy4=
X-Gm-Gg: ASbGncv7mRKocsahgEIzGOPcAms6PgFa0YWwDJuWfqjhHrNfxLk72zCeo7STb8Mssc6
	BU0tuDZThYtZ6ll2nM/HyCdZNynyrmllEJZZ4yE2R67Owtl1R44XiFDpXW7vRFipPzG+fEVqgKp
	m5VBCjcQ6ilZni4Qxe8UrPMuvyLhwooxq89w5FrWA+AdaJ5X9x6crP4v35yzlNZQQkjuUAXv6cB
	gumGBQl6D47NRTeUniCX9SOot+fvGka7U4dCBkLntseNrbEeBhCv5zr9nkjFXZ7FdrU4FHq1EZa
	c3qo/0y8xUE/sAnUE23kkLd/SQEkRZ7nC6ggTlcBqr1huAnN4CunZtMQM4hx475aibHxwIG7ZQ6
	WHrBhst7L8EVY6Io24/BsI0mxmUUuFZ6iq1hnGgjdyO9ge2sayGDlJmgNJb0C79sTrduCrmUUdT
	+ee2qaiP0tA2eYXEn2xOWz8Acla/VlDkM77OlB1cn5Fw==
X-Google-Smtp-Source: AGHT+IESUEFG2pUs76Y14tjfTsPc09Jl6HNAwDPQ3U1rwjc1UCqvgJSMCSmRKAUeFuiE1xVOd9KM6w==
X-Received: by 2002:a17:907:1c0c:b0:b24:6396:c643 with SMTP id a640c23a62f3a-b50aaa98194mr395797466b.23.1759931427767;
        Wed, 08 Oct 2025 06:50:27 -0700 (PDT)
Message-ID: <a3698cf9-c0c0-4bd5-85bb-bf8b982e55d0@suse.com>
Date: Wed, 8 Oct 2025 15:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/22] x86: Clamp reserved bits in eflags more
 aggressively
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-23-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-23-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> ERETU, unlike IRET, requires the sticky-1 bit (bit 2) be set, and reserved
> bits to be clear.  Notably this means that dom0_construct() must set
> X86_EFLAGS_MBS it in order for a PV dom0 to start.

Nit: Seemingly stray "it".

> Xen has been overly lax with reserved bit handling.  Adjust
> arch_set_info_guest*() and hypercall_iret() which consume flags to clamp the
> reserved bits for all guest types.
> 
> This is a minor ABI change, but by the same argument as commit
> 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()"), the reserved
> bits would get clamped naturally by hardware when the vCPU is run.
> 
> This allows PV guests to start when Xen is using FRED mode.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> v3:
>  * Rewrite the commit message.
> v2:
>  * New
> 
> The handling of VM is complicated.
> 
> It turns out that it's simply ignored by IRET in Long Mode (i.e. clearing it
> commit 0e47f92b0725 ("x86: force EFLAGS.IF on when exiting to PV guests")
> wasn't actually necessary) but ERETU does care.
> 
> But, it's unclear how to handle this in in arch_set_info().  We must preserve
> it for HVM guests (which can use vm86 mode).  PV32 has special handling but
> only in hypercall_iret(), not in arch_set_info().

And what's wrong with adding special handling? (Apart from this the patch looks
good to me.)

Jan

