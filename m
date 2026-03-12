Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOAwFgqhsmkOOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:18:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C276B270C43
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:18:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252061.1548843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e3V-0004yx-QH; Thu, 12 Mar 2026 11:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252061.1548843; Thu, 12 Mar 2026 11:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e3V-0004vz-Nb; Thu, 12 Mar 2026 11:18:17 +0000
Received: by outflank-mailman (input) for mailman id 1252061;
 Thu, 12 Mar 2026 11:18:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0e3U-0004vt-FU
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:18:16 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27513701-1e05-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 12:18:11 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4853aec185aso7840505e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:18:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f708sm311706855e9.11.2026.03.12.04.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 04:18:10 -0700 (PDT)
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
X-Inumbo-ID: 27513701-1e05-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773314290; x=1773919090; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rKNfadOFeIlBU9K3iYL1zTP3YSOV3hGO2ddaUbUR1yo=;
        b=XnqUYaQCFOUOgUlIJVOUE9H93seVeqwgt6PJ10gziQtje2YWTPHTM5uaYvEzXyKi24
         1jBrOx/L1o6QDx8Vazig4xww2n40qXb89YA4Ce8gVrmflkkMURMxIKHNpdrYB7DIhiSU
         74dLj/vBHuX+kl8rNI4wP1in8BfkxW6lB3CpAKDZBhS1LbBykRvrgqLpM/TfukSmbI9T
         5dD3Qe9os+m4koKPXIr47n9IfQga53KCHIrh/pivRGw6Pen5ilhAAjCisPOGnyMRAjgw
         ups4xeETPA0PiILh4aGqmhGPoj5m5D2FJiE1DF3KTWHdlY5Up42rMQFCMOxG2YybSvd3
         LLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314290; x=1773919090;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKNfadOFeIlBU9K3iYL1zTP3YSOV3hGO2ddaUbUR1yo=;
        b=n3wx/NxtNVrnftmM4LuatnQFw5K2cwMPKRnpo4P/bDINPqm1sfpCiYEt00i+SiX0vp
         Jtuxhn2dgDc/f+vSoI4yR92b/DSkgj/M2sVoi0Ve2HRf2cScYpLoLZ5Z5Ed/QJBkc3gl
         498q1nj9ES+ehZqkq+LiATscTaGaAfe22G4byMed1eongPQU4eC1to5ayy0r02XhA62X
         mLi76g14VPNGp2K/xaLdYB3mz7Ir2HC9x30HYbVHJxwbDu36AKc4sp1HGSTcZSf6ESPB
         2z0X2NReJT1WvDFc9YzvQHXdG6Gx7XaOEX4EYS4v2azkENJk+exnYq049pMZNPb1UAmL
         k32w==
X-Forwarded-Encrypted: i=1; AJvYcCVuvZoDbYnIcR3xdNmYiQfnFFNkPa57hVtQGANZonfnvjYJ/vvydbXyRJb6Ql48UYznFgcqqpVWdS4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1EfzB5ci25E4YyiGS1eoOWMSUoR0lxiI7qD6HO2cf0UvoCCqI
	adcwoowCAHm6jedpLso717ZsycdoloLGiAlzyzRhTQoRcaMRTQILQbA2s2tib6SPbw==
X-Gm-Gg: ATEYQzw4avq6Y/Wo18ValNOrVf5Q+JV/Z0yKdTmo2KSp92SeEAj/3wIu40kMmMm99G8
	Y+w4ILYj+4SfL3MHLireTt7VaIoE6k8lklB1X9ReOjir4pv/fa342EeqwQguI84yluDG/IeUjCo
	RObS5qWpPtcwndh3HlU3QCWmwicGOpujmdFaRWWiT0SsLG2SUEudUgdsxiQUEZVWmMl0xE6LrU4
	PZwhv6I5l8XJqLc9n02WilLAV9Vbv9ykgGF4PRFTzC8WQMnb8CxwDtU31lvJf31QuQS0IeUANLO
	Mv0faeWkCb3t3UxMHz68EJzv9Dg8xaV08P8aviHzupX+MHnElw9MyO5ub1Gmt8ti5/p9W2Zp/32
	HMfQPN5WdOITLkonjHmNF9tqwpe7oXbSjKSkEw7xMs7KzeWTFmz6FgTx6YPv4C3fcW4N1bAk/bq
	kaWUpae6J47RRn7l0ALXexQbiIj44K3OD2N1qz3HQBy2Reoq63X1oXwAT6bUItZJ8DsuyOIs6Qs
	isaLc/Mv7l+ATmFhVqSPGFiMg==
X-Received: by 2002:a05:600c:1f87:b0:485:42ba:fc8 with SMTP id 5b1f17b1804b1-4854b0a547cmr100873325e9.4.1773314290366;
        Thu, 12 Mar 2026 04:18:10 -0700 (PDT)
Message-ID: <f5bd7530-8a1d-4219-bbe2-fc6720482d3b@suse.com>
Date: Thu, 12 Mar 2026 12:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] x86/dmop: Add XEN_DMOP_enable_ext_dest_id DM op
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-6-julian.vetter@vates.tech>
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
In-Reply-To: <20260309123055.880050-6-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: C276B270C43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.03.2026 13:31, Julian Vetter wrote:
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -447,6 +447,15 @@ typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>  #define XEN_DMOP_bind_pt_msi_irq   21
>  #define XEN_DMOP_unbind_pt_msi_irq 22
>  
> +/*
> + * XEN_DMOP_enable_ext_dest_id: Signal to Xen that this device model will use
> + * XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings, passing raw MSI
> + * address/data fields. Once called, Xen will advertise
> + * XEN_HVM_CPUID_EXT_DEST_ID to the guest. Must be called before the guest
> + * starts.
> + */
> +#define XEN_DMOP_enable_ext_dest_id 23
> +
>  struct xen_dm_op_bind_pt_msi_irq {
>      /* IN - physical IRQ (pirq) */
>      uint32_t machine_irq;

How come this is put between #define-s and their corresponding struct?

Jan

