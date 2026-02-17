Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5Y2pJihMlGkNCQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:08:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071FE14B2A6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234823.1537935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIw9-0003kC-Pc; Tue, 17 Feb 2026 11:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234823.1537935; Tue, 17 Feb 2026 11:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIw9-0003hW-Ma; Tue, 17 Feb 2026 11:08:13 +0000
Received: by outflank-mailman (input) for mailman id 1234823;
 Tue, 17 Feb 2026 11:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsIw8-0003hQ-Fl
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 11:08:12 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f18d5494-0bf0-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 12:08:09 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so3097116f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 03:08:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a4ffafsm108460955e9.5.2026.02.17.03.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:08:08 -0800 (PST)
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
X-Inumbo-ID: f18d5494-0bf0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771326489; x=1771931289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IAcz+Nt3TH6iW9R1B04xsSV0sjAXwdALGFwbxZ/4NR8=;
        b=JB088CvDwRlcOrkHT+2iu9q7sl0b89rLORaNQrK6FQMY1ymv10fTAKFpy+f0aBcGgz
         19j0CQz21At2B3DOwCuwwyyjusq4hCijGXtcoBwIBuIvnvAJz1879ngVhA8NIZhQ+zk9
         524uP44aIEbFzNR8aS965Vrr3HkZ1wTmz+EJ2Ezi2AOEiP156woIXxs1WIGN239K/j4I
         jfP0ASrDmfJrQfVPmZONRuTgpyyLZu31vbJ6QdrJ0+1AZ4Uw7qBQTJHEB2v//ZsFLcnz
         Lj78Kv+fq8jkryxfwFHi1OiU3bppJXZf9FA4HJPHOjCVnrD0w6GFFOe3fB5X1ka57VLo
         /GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326489; x=1771931289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAcz+Nt3TH6iW9R1B04xsSV0sjAXwdALGFwbxZ/4NR8=;
        b=DIA9ZNlZdKjI5UyG9XxCR61O3M9v7QNZ3edMEhJTyyMJarYpQkGga7fyKOmU7MbKFS
         PIV1jRLDPNbal6OOa3cQmruV73gGLd7GM3uIY4RaFl/PHmUcwzN5/+Sk7p2wSwe49mDf
         6INzQyMM0leALIN7sDzJa0pPhqzIrVd2MbR6g0f1o8OaUckeBNA0VTq4fVt3EtiLUT53
         07+JcFubf57yAGfOH28RtAMLEVtt/V9cmwa5dei75T0oSTiccD3OoQ0dY1qmHjQEeoCg
         EI3hn25rd+N86NZL61XQk8F/rh2mjbHl/324iniJehOXOAPc4vLigGoc6ADMHx3nUqo8
         yQQg==
X-Forwarded-Encrypted: i=1; AJvYcCUA/HtNeY4LKfac4YHlC2yYERbz1HXp0hG0LVwad/Z4UWe3Jhd/cVJLyLWRRCHx2BK/sOnCLScIWJU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyb854rQU1uLbKtHBn5m1khXiLzFy0/4BDnvBpESL5kDl+pwxYs
	JNIp6IlJoTTDoOJ7ECI+horsqOimxJrR/aZuafwMV4maBGb5TUlo1h96hSaDqTQcpA==
X-Gm-Gg: AZuq6aLc+QQzPhT9c8IvnaXjX9L8iStEbJT09LGgP649wiiE8uwh3gBhKjTUsaEhOzx
	nWnhUAjYZHSd49tN+e+POTiprZIOOTTykIPKD8+l9O0W+RVxQhD8kU0HrwSI2a5BMFsnCE1laQK
	mOEVVqtDCUUZwYDrwQSeWb5VniRB0qL27MteX6/wW3YJwT1geJVMvJ2vV1MmRMO6ZzAQCTMtlwE
	CH6BSkKAsF3tfHx+4OMmYim07b6m3S287p3Rb8i0A5TEwJYMKCoJOIJ8mJCpwYDysEVwlY1hBCf
	S6Cn5fRBhQDYfjZ0J9gu/ltw5YczCY+foeINmsmAl0Qn9CTZQ0POyn+QV1urdSDjNdZAaoV4NI/
	dNwb36zbphw4ZajRBQJWH4pRERYZ6GzZtTnxKuymmU4q16Z9ARC5XzK5uyXgy3pl3FVzo4Rem1g
	uX0LC68hAfKPT9fQA3wbcK6JY9cJXfIJhguAB6Cd0zyVh/u2iKSdZruaDGxuMy0aIYozQ/Rsz1q
	Lq0b1pMUrmbj/I=
X-Received: by 2002:a05:600c:8708:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-48379bd7313mr183588135e9.22.1771326489240;
        Tue, 17 Feb 2026 03:08:09 -0800 (PST)
Message-ID: <59a0dcb0-235f-4eb9-847b-1d0ed72c89ce@suse.com>
Date: Tue, 17 Feb 2026 12:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] xen/include: customize headers for host builds
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260213024952.3270112-1-dmukhin@ford.com>
 <20260213024952.3270112-4-dmukhin@ford.com>
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
In-Reply-To: <20260213024952.3270112-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 071FE14B2A6
X-Rspamd-Action: no action

On 13.02.2026 03:49, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Update hypervisor headers to allow vpci.c to compile in a host build
> environment, as required for the vPCI unit test.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - new patch

I'm firmly against such scattering around of "#ifdef __XEN__". It should be
the harnesses to carry the burden of re-using hypervisor headers.

Jan

> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -1,5 +1,6 @@
>  #ifndef __XEN_IRQ_H__
>  #define __XEN_IRQ_H__
> +#ifdef __XEN__
>  
>  #include <xen/cpumask.h>
>  #include <xen/rcupdate.h>
> @@ -208,4 +209,5 @@ unsigned int arch_hwdom_irqs(const struct domain *d);
>  void arch_evtchn_bind_pirq(struct domain *d, int pirq);
>  #endif
>  
> +#endif /* __XEN__ */
>  #endif /* __XEN_IRQ_H__ */
> diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
> index 98d8482daba1..06d2fa3aed15 100644
> --- a/xen/include/xen/list.h
> +++ b/xen/include/xen/list.h
> @@ -7,8 +7,10 @@
>  #ifndef __XEN_LIST_H__
>  #define __XEN_LIST_H__
>  
> +#ifdef __XEN__
>  #include <xen/bug.h>
>  #include <asm/system.h>
> +#endif
>  
>  /*
>   * These are non-NULL pointers that will result in faults under normal
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index f6c1f27ca105..80d60fd49178 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -1,5 +1,6 @@
>  #ifndef _XEN_NUMA_H
>  #define _XEN_NUMA_H
> +#ifdef __XEN__
>  
>  #include <xen/mm-frame.h>
>  
> @@ -152,4 +153,5 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
>  
>  #define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
>  
> +#endif /* __XEN__ */
>  #endif /* _XEN_NUMA_H */
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index afb6bbf50d05..f52dc7875e16 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -14,7 +14,9 @@
>  #include <xen/numa.h>
>  #include <xen/pci_regs.h>
>  #include <xen/pfn.h>
> +#ifdef __XEN__
>  #include <asm/device.h>
> +#endif
>  
>  /*
>   * The PCI interface treats multi-function devices as independent
> diff --git a/xen/include/xen/pfn.h b/xen/include/xen/pfn.h
> index 1ca9b095e0df..98ff669d7def 100644
> --- a/xen/include/xen/pfn.h
> +++ b/xen/include/xen/pfn.h
> @@ -1,7 +1,9 @@
>  #ifndef __XEN_PFN_H__
>  #define __XEN_PFN_H__
>  
> +#ifdef __XEN__
>  #include <xen/page-size.h>
> +#endif
>  
>  #define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
>  #define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index ca9d8c7ec0a1..ad5094c4eb92 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -1,5 +1,6 @@
>  #ifndef __SPINLOCK_H__
>  #define __SPINLOCK_H__
> +#ifdef __XEN__
>  
>  #include <xen/nospec.h>
>  #include <xen/time.h>
> @@ -360,4 +361,5 @@ static always_inline void nrspin_lock_irq(rspinlock_t *l)
>  #define nrspin_unlock_irqrestore(l, f) _nrspin_unlock_irqrestore(l, f)
>  #define nrspin_unlock_irq(l)           _nrspin_unlock_irq(l)
>  
> +#endif /* __XEN__ */
>  #endif /* __SPINLOCK_H__ */
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index 73ddccbbd5dc..e5d702b48ac0 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -4,6 +4,7 @@
>  #include <xen/stdbool.h>
>  #include <xen/stdint.h>
>  
> +#ifdef __XEN__
>  /* Linux inherited types which are being phased out */
>  typedef uint8_t u8;
>  typedef uint16_t u16;
> @@ -15,6 +16,7 @@ typedef uint64_t u64;
>  typedef __SIZE_TYPE__ size_t;
>  
>  typedef signed long ssize_t;
> +#endif /* __XEN__ */
>  
>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
>  typedef __UINTPTR_TYPE__ uintptr_t;
> @@ -33,6 +35,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
>  #define NULL ((void*)0)
>  #endif
>  
> +#ifdef __XEN__
>  #define INT8_MIN        (-127-1)
>  #define INT16_MIN       (-32767-1)
>  #define INT32_MIN       (-2147483647-1)
> @@ -52,6 +55,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
>  #define LONG_MAX        ((long)(~0UL>>1))
>  #define LONG_MIN        (-LONG_MAX - 1)
>  #define ULONG_MAX       (~0UL)
> +#endif /* __XEN__ */
>  
>  typedef uint16_t __le16;
>  typedef uint16_t __be16;


