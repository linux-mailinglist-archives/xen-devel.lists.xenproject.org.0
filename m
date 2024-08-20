Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDEF958119
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780195.1189818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKLJ-0007gu-F5; Tue, 20 Aug 2024 08:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780195.1189818; Tue, 20 Aug 2024 08:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKLJ-0007dj-BX; Tue, 20 Aug 2024 08:35:53 +0000
Received: by outflank-mailman (input) for mailman id 780195;
 Tue, 20 Aug 2024 08:35:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgKLI-0007dd-Ji
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:35:52 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 345218a0-5ecf-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 10:35:50 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a8caef11fso615700266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 01:35:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383935600sm736331666b.111.2024.08.20.01.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:35:49 -0700 (PDT)
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
X-Inumbo-ID: 345218a0-5ecf-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724142950; x=1724747750; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4JRiL9QfRwrA91a43rlkba0LZJgJJT6qYuSKw8nxb4M=;
        b=cjwA1moR/KJIoce10jO3IbvD6vejS0lCsQUQE4QiHO9Q7a/xUBYQ6VSl+SrgLBsnvX
         RNSN93RQUx6YgJWJIKzGNxw9Y3wqe2JjCyBuEQH65n6b44GNymWrS5GbuAecZwyEiihf
         RfavaJCVPH5ZaZPv1gbbz0YKS9UCxc8Riww3XwyzMWeA2J+CHhICdH0NpRbnE1PP65az
         Bo+VhFELfaqmxPyMU6ftzwYQf4TN+yy35hihx82vjSaAgf57W/k6mQR0iAQpdeDNg9rv
         4dTtjirmTk3pQvbf3zcD3h+ZBwNVOvfdB9uc5tvU1rOzpEd/zntfyGxcfIDHxhcCyZGn
         1F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724142950; x=1724747750;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JRiL9QfRwrA91a43rlkba0LZJgJJT6qYuSKw8nxb4M=;
        b=bBb035OGPmIX2vPGTG+I7UJEsoBhXebWReJWDeUzxBBoAbIkx8owZ6zZnOTltmnQ+H
         uz1V4W+Umx8oBNKME9nwALjoQJ9m0aDj+NOSyNhiGloHhl9w7DY5iVhBoyrgbONVXZ7A
         i+ADKJ8nukQ6BrDQl2iL8LYMT863zFexKQu6Q6ppZ5mnBRDVHXq8s1IH2aa2sPjg5hhp
         mU8YPPLyO101vuP2Jck1MsnyHvL6MyJt+rze0ZlOHF7+u4yefkeSkSwoggcPKQ2ue94V
         U/eRHCD2VroSw5hcvvIeBoS5cvT92jZmdaCJtim8IvvOSDPpHc66LcPKXAHW0nUHRhEb
         3Q5g==
X-Forwarded-Encrypted: i=1; AJvYcCXhXjlCna+VYShW2pbaoCN041cxpzw5muXHmdycNVl/Qhi2syv2mMnHmEmxFUuKg4WVFbDrviX6gl1QokwFIoS4DT8g2KSh5rjrgHUd1F8=
X-Gm-Message-State: AOJu0YxeHFLK/pAs7DtdS6bCxvlkI9Y6/1Z7dVhjnj4GFD3a1xnTokz8
	knKx+C2+jAagFFNZ9dW32GizpSKNasVvEPPQxa0qVcAto0DzbUY9aONQPQcXVQ==
X-Google-Smtp-Source: AGHT+IFdaawlNtR3epLC2KfjMcGlx4S9voLmzaSlkj8QL7rvwRfouEdIYTrEhiOI34tqIlQtR+1i2A==
X-Received: by 2002:a17:907:d3c7:b0:a77:e1fb:7dec with SMTP id a640c23a62f3a-a839292dd54mr1022324966b.17.1724142949444;
        Tue, 20 Aug 2024 01:35:49 -0700 (PDT)
Message-ID: <22961690-14d0-4695-ba93-a68d2517059e@suse.com>
Date: Tue, 20 Aug 2024 10:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen: introduce generic helper checking for memory
 map conflicts
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-3-jgross@suse.com>
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
In-Reply-To: <20240820082012.31316-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2024 10:20, Juergen Gross wrote:
> When booting as a Xen PV dom0 the memory layout of the dom0 is
> modified to match that of the host, as this requires less changes in
> the kernel for supporting Xen.
> 
> There are some cases, though, which are problematic, as it is the Xen
> hypervisor selecting the kernel's load address plus some other data,
> which might conflict with the host's memory map.
> 
> These conflicts are detected at boot time and result in a boot error.
> In order to support handling at least some of these conflicts in
> future, introduce a generic helper function which will later gain the
> ability to adapt the memory layout when possible.
> 
> Add the missing check for the xen_start_info area.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, since you mention the start_info area it may be worth adding half
a sentence to the description also mentioning why the hypervisor allocated
stack page doesn't need checking. In fact this may want to extend to
initrd and phys-mach map as well, to cover everything Xen sets up on behalf
of the kernel.

Jan

