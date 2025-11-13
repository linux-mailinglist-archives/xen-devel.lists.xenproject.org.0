Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C5C56C99
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 11:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160890.1488943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUNL-00049G-9N; Thu, 13 Nov 2025 10:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160890.1488943; Thu, 13 Nov 2025 10:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUNL-00046O-6M; Thu, 13 Nov 2025 10:16:23 +0000
Received: by outflank-mailman (input) for mailman id 1160890;
 Thu, 13 Nov 2025 10:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJUNK-00046I-8K
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 10:16:22 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca8cf30e-c079-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 11:16:17 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b7277324054so79838066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 02:16:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad800dsm136057766b.29.2025.11.13.02.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 02:16:16 -0800 (PST)
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
X-Inumbo-ID: ca8cf30e-c079-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763028976; x=1763633776; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gPEYLCwfTCc+w39ymAHJHeVUMUfjvXkqi2G7RerLYFg=;
        b=eTNdRLOn62ndFrRkHpxO8Fsm1sALPjvu2uiMVQzHinWO36aPOntI6uevvTZj5/VSnR
         ecpEEVbedzg91+CcBhrxrlZ4FJrBov/W23CQE4OqmodvakVI/cas/5FEx0FvD3DpiALT
         KP1KACqZIZtkg8D2WijwAMs4EJ8fOI69iVYwaMJrgcwaiZqzp63oAc+K0e5x+jCtusZ3
         EGStQNy0R1eZaK9J2GXNiHMtR0qfzZ428eCmN13/0J3ILH4XKZcPNL78OzqKJ3RcaBat
         hdxxeVvPPKxyRgdpM9sDjYC4tCl4kYtZ0PLU4haI1R2ERfwGmOzn5aVvKDuzZWVJ7X7Z
         Nw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763028976; x=1763633776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPEYLCwfTCc+w39ymAHJHeVUMUfjvXkqi2G7RerLYFg=;
        b=lzmfIzsvR5pO9NS8WQYBXAUx4wJdszQe88y2qvqHos/dS2w3VdqE0IUo/EdGbgAvi3
         xx8AekQV3iI38a23CsXHLaJvnLmdD1Lfpofd+jDdKgX464fKHw+AgvLFdGCthgNXjmer
         RGPDCLRUtG/vyFMn91PXEp/eKuaMPUTQC9YLIP5oWftrrbSq1X82cn/BTtvmpX1DmjOy
         XLenD7RPn3Y31ynQJQtBIOF/nZD4aHO8AD5zDY6jj9ncMkzNTf+mJLxA1PxQpWZ3O7vc
         DolJ/LqtYBrqx61SQCGgBOSJwFpkMTISJS0RvqiUoCtDAYVMpnK4AZwyJsMNQZyFCSwx
         +49Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcz03qVbpiEKEYjy5tpPyNDFzaXlw28/2a5meBXnc9Jzk1oxR4LrjSQ9GM7AEXr9A4AbE/0P+19RY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKQ3+LnTqIwN6cmpE+XE2HK/cr0jaT2zl1jmysK+/vKnrfGk2z
	opOFn7u040sBb5Eb1Oi20yKfJaMN4SHAcyw5lqYu7ONtCcehA8abclBmnFNYGcy0Zg==
X-Gm-Gg: ASbGncsjs0lGA1YHlADHlsePUGT/DY+UCmqZpx6lvx/7EOxVi8ReYbGL6lz9n/ZZDJd
	Wrj7RfUdeInJkaPmxKlWfeTK/P9watmr5xEmiR5pmcBxjj29BruOeLfSe+LB8mGg3gJM2lbdydR
	eGkwwx+ZZ2funtqYm0n5tTtVmLWtK/YU4bLnWHzX0hk/4VWVyB7OZ3T/0oCVsCgDq8PtVEs0yzf
	uJU6DzYY1Azph7WF7goRhWoKiufp2QYOegBLXbIzSwzVUkL9J6MSgZC4ltfp+JdSXht+cuj204+
	xQb1wkgOq7C1EHPFFRo1h23V/546y1iAZjXVvqu+iXV4SJcFqewXsI77JJoSkmKFLg3lMoFut9K
	Kub4EyENKZ9rbnJrfecyZmp8DL2x5wWo8qSHDQlHDkA3yXGYk8vmffYlgkOBex7gbYvkeyc98SD
	354SFuhFkfK4ScwiJJzCRYm8VkB8oVnlBiVE6I8zpdDuai4L6AkPtIbouPClZPkS17s4Em06R3f
	YM=
X-Google-Smtp-Source: AGHT+IEFoe6aGHoiYxLhHZB+kolAewuWbWSR4NrtheCvnIxj/uQFhKlUQnHHiM1Et5bXR7uTSfVcSQ==
X-Received: by 2002:a17:907:7290:b0:b73:53ab:cfa1 with SMTP id a640c23a62f3a-b7353abdf18mr173771166b.17.1763028976531;
        Thu, 13 Nov 2025 02:16:16 -0800 (PST)
Message-ID: <9ca0d80e-2566-4874-b4b3-914d8b99f33d@suse.com>
Date: Thu, 13 Nov 2025 11:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] xen/vm_event: consolidate CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20251113031630.1465599-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 04:16, Penny Zheng wrote:
> File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
> routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
> 
> Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via
> MEM_ACCESS_ALWAYS_ON, we could disable it through disabling
> CONFIG_MGMT_HYPERCALLS later. So we remove MEM_ACCESS_ALWAYS_ON and
> make VM_EVENT=y on default only on x86 to retain the same.
> 
> The following functions are developed on the basis of vm event framework, or
> only invoked by vm_event.c, so they all shall be wrapped with CONFIG_VM_EVENT
> (otherwise they will become unreachable and
> violate Misra rule 2.1 when VM_EVENT=n):
> - hvm_toggle_singlestep
> - hvm_fast_singlestep
> - hvm_emulate_one_vm_event
>     - hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
> And Function vm_event_check_ring() needs stub to pass compilation when
> VM_EVENT=n.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - split out XSM changes

Isn't that split out patch also needed as a prereq to the one here? The one
here on its own:
Acked-by: Jan Beulich <jbeulich@suse.com>

But the possibly missing dependency question needs addressing before this may
go in.

> - remove unnecessary stubs
> - move "struct p2m_domain" declaration ahead of the #ifdef
> ---
> v2 -> v3:
> - move .enable_msr_interception and .set_descriptor_access_exiting together
> - with the introduction of "vm_event_is_enabled()", all hvm_monitor_xxx()
> stubs are no longer needed
> - change to use in-place stubs in do_altp2m_op()
> - no need to add stub for monitor_traps(), __vm_event_claim_slot(),
> vm_event_put_request() and vm_event_vcpu_pause()
> - remove MEM_ACCESS_ALWAYS_ON
> - return default p2m_access_rwx for xenmem_access_to_p2m_access() when
> VM_EVENT=n
> - add wrapping for hvm_emulate_one_vm_event/
> hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
> ---

No changes at all in this version? The v3 patch was much larger, after all.

Jan

