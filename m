Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCnvHUtSsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722D2555E1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250521.1548025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00iS-0003Ph-7v; Tue, 10 Mar 2026 17:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250521.1548025; Tue, 10 Mar 2026 17:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00iS-0003MB-2z; Tue, 10 Mar 2026 17:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1250521;
 Tue, 10 Mar 2026 17:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w00ag-0001Q4-5m
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:54 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f46f539d-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:53 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439c5b40f60so5923229f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dadb29fdsm37574422f8f.16.2026.03.10.10.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 10:09:52 -0700 (PDT)
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
X-Inumbo-ID: f46f539d-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773162593; x=1773767393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dZgPk3awh75bNJRkjsQOS3WuaDXX5ZqhTUv4DsGOP+k=;
        b=PwSRzWGSxxX9Ieq6OlN1OlYFfwLJ/mMpAt3hMlDhGL9wp1jogA/t6IBtxuRbYo5CeS
         rd7c+EXNKf9suMTAp1AW5sgCOJpS5Q6M5y8ruPC00l669YxDmry0tUupdMA5UGE3KCTm
         YpPIjgJCvqn4UfVS442VqP+QwmU6qn4C4z9sZiJhNkoTlgj1Fu1Av1fTmOHoOcTLJCV3
         l++LqqT5ZedtrOuMf+dslQORLIooA7W9F0axkH5O4QY7hu0fs8G2ii7TXC6x3QHdhPVt
         BblwGkx+r6La8o/eiXR3w3a3CkZbt7vDM3T9NayIuiQo8bHQSJlImcphdfTJaJnU2QyT
         t8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162593; x=1773767393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZgPk3awh75bNJRkjsQOS3WuaDXX5ZqhTUv4DsGOP+k=;
        b=lKtR4FxWecb/rSKlwifgC/Ssed2NsOd7cO4sk+tbyJq2tqSLCXcULnWxfTzMiayv51
         LOIbRtgoRDsIh2qMQifPQ50sO7CIEWgpql/mrdGnCJp1Vie1KU0NAehW8Yhbo7LEOCJZ
         ApAGZnIHA+AKgPX9GPtlZXM5SLw6A/Wjbq2eypBTiNWeYYvWWUIWfgmgyMoq5Mzmngg1
         Gwzm1YXo+RLDVqmMigy3c1IEMflUjOQUUfVTAM37bJDCTOjMtvTpUDY2ePgCQemx5S/1
         MFLxMKmiAXJC5Tfu852yZNI1OE9THY6gYTbEgG12IZu4yPPZddHzh0uf6fhEdzyAc2n+
         Y1UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkshh0IaH723wy5w8RFLOfyPFterh9/g1VaIf71Z5Iqgb62XZozP4/ZUTPeiYiu8OvVIoXt4DQn9w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNCBvHIK2EvhxRpAAzBei2gqVr2+TFFO/7Y/VZR+c4hBupZk1p
	dOMmQ1R/8MSh3Zi7TadFSmTePKRt1s2EljwxDi2H6bqJEi7ksVSW6khjbptUu20jDg==
X-Gm-Gg: ATEYQzzXX8E6kRBDmg+lH0uHvzjz2TNFMAwmbwB7XajmIz0ED20PjSzNXYYurvSiGwU
	4y/BwaXR0xQTxUNqElqJC7w1BSh6rNFslD7mMAa8J7YK1mc8frcvzOG0tZNHhRj1nl9IzieFv06
	mAtcgKfe47bTOaGmMGOkbM+IJWqAMwkrkP9CmX3lamNrl432mLFwSdA8gvr4fhJ5fooslCak2yH
	xwiWMBqeZGUyu9TUQZsq/8oyhHdqf8PGpS4o0CTuRgYoShzjlop5OaxqvmqTwkmr42celBXvbhC
	0Jusy1tRXl7Q5JuDqNAmWY3o135p5IFxp8Lx1Uhwn6CXMaZkQYngOCs7PuRqT5PgltBb/xZbbdh
	p7KWXqG8L6bKX3rGyGA9csoiG8LVA4+wxBTALnqyJAV2XXWBpmaW3WxH8Xcy9Kq3XQz2uqJqXXy
	GFDBZbdQMvD0j7HvcZUL2IKu3Z0EZUWU97VNdzSQo5ZVsgy9Qajge9ILNHl8E/PC2qM4kK2rMNh
	umRz2k1z84kzfY=
X-Received: by 2002:a05:6000:2404:b0:430:f985:a7b2 with SMTP id ffacd0b85a97d-439da86e9f5mr28965655f8f.51.1773162592593;
        Tue, 10 Mar 2026 10:09:52 -0700 (PDT)
Message-ID: <06ac2196-71a0-45ba-a9b5-b76f098381dc@suse.com>
Date: Tue, 10 Mar 2026 18:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] x86/msi: Define extended destination ID masks and
 IO-APIC RTE fields
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-2-julian.vetter@vates.tech>
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
In-Reply-To: <20260309123055.880050-2-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0722D2555E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 09.03.2026 13:31, Julian Vetter wrote:
> --- a/xen/arch/x86/include/asm/hvm/vioapic.h
> +++ b/xen/arch/x86/include/asm/hvm/vioapic.h
> @@ -32,6 +32,19 @@
>  #define VIOAPIC_EDGE_TRIG  0
>  #define VIOAPIC_LEVEL_TRIG 1
>  
> +/*
> + * Extract the destination ID from a 64-bit IO-APIC RTE, including the
> + * extended bits (55:49) used when XEN_HVM_CPUID_EXT_DEST_ID is advertised.
> + */
> +#define IO_APIC_REDIR_DEST_MASK         (0xffULL << 56)
> +#define IO_APIC_REDIR_EXT_DEST_MASK     (0x7fULL << 49)
> +
> +#define VIOAPIC_RTE_DEST_ID_UPPER_BITS  8

The name suggests this is the number of upper bits, which it isn't. You shouldn't
need this constant anyway, see below.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -615,12 +615,14 @@ struct xen_domctl_bind_pt_irq {
>          struct {
>              uint8_t gvec;
>              uint32_t gflags;
> -#define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK 0x0000ff
> -#define XEN_DOMCTL_VMSI_X86_RH_MASK      0x000100
> -#define XEN_DOMCTL_VMSI_X86_DM_MASK      0x000200
> -#define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
> -#define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
> -#define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
> +#define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK        0x0000ff
> +#define XEN_DOMCTL_VMSI_X86_DEST_ID_BITS        8

This constant is redundant with _MASK. It is generally helpful to avoid
such redundancies (especially in the public interface), and derive the wanted
value from the main (most generally usable) constant. IOW here maybe

#define XEN_DOMCTL_VMSI_X86_DEST_ID_BITS        8
#define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK        ((1U << XEN_DOMCTL_VMSI_X86_DEST_ID_BITS) - 1)

But of course it could also be done the other way around, albeit in a public
header this may end up more difficult. (Generally the mask wants to be the
main definition, as everything else can be derived from them.)

> @@ -630,6 +632,10 @@ struct xen_domctl_bind_pt_irq {
>      } u;
>  };
>  
> +#define XEN_DOMCTL_VMSI_X86_FULL_DEST(gflags) \
> +        (MASK_EXTR((gflags), XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) | \
> +        (MASK_EXTR((gflags), XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) << \
> +         XEN_DOMCTL_VMSI_X86_DEST_ID_BITS))

There's no MASK_EXTR() in the public interface.

Also, nit: No need to parenthesize gflags when used in macro invocations like
this one. Iirc there was a similar pattern elsewhere in the patch.

Jan

