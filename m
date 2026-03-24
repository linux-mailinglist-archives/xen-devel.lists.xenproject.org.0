Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGXpAe9MwmnvbAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:35:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B108304B9F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260127.1553487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xEj-0008Vd-Fo; Tue, 24 Mar 2026 08:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260127.1553487; Tue, 24 Mar 2026 08:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xEj-0008TF-Cs; Tue, 24 Mar 2026 08:35:41 +0000
Received: by outflank-mailman (input) for mailman id 1260127;
 Tue, 24 Mar 2026 08:35:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4xEi-0008T9-5n
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 08:35:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4xEh-009gFr-4F
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 09:35:39 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c24cda-2eae-0a2a0a5409dd-0a2a4501d5fc-12
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:35:39 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c24cda-6400-0a2a45010019-d1558029dc83-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:35:38 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48557c8ad47so6704645e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 01:35:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4870f6c0fb1sm16875955e9.2.2026.03.24.01.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 01:35:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774341338; x=1774946138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FR9xS40wB79JHr7ks3FohMw5v1CeULFRL12IUJNh22Q=;
        b=ba/Nj+Li3xgdHLZAbDfgINHYx8c1jnGdtHyXDe8dz2za2mC+dliNur8/mXqRrmSAPV
         fsdRHvNixph7MXtsaArMq/zc26acIqEiIp5H3IY+w/rRhCm81MgUgffZrsfWWsmjkd8A
         Cn1MKPAnhEQjcRl2RS3xIO+nU3tcnV0QWkM5VtopxKu/RMxIqhHLiwPPAiAzygYrmQWw
         8BSRaNcYUrOaoX/nwW8+B/O9Q0SgEHjilAHq9cQ/htJLOo525ly6GbLG1FDUVGe509bb
         mpcbqcKeKshvaeElyrLSKjPUHI9Nom5xncH8G99mo8VMqb1qp6B0BwVD1mn8v7EPHT6d
         c6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774341338; x=1774946138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FR9xS40wB79JHr7ks3FohMw5v1CeULFRL12IUJNh22Q=;
        b=f7a15utX/7mFLyptobObfAVlqj/qHXQf3dwfRIqo42AerlKC+uI86VtK8RCrlDYe2C
         L1Jg49WnpmyEACvj55K1odBIBtx+fEMoUjHVVpjDflYqe4WbGj/GXjmtgjGq3UQgoePP
         SqYDjzk1AbR+6gft+3SeAxRsQ1MumALDXsJDPdxswhZXRasPdW6yoicSQvsE0QicY3Kv
         3Z4drKEPx1tNFfkVncdBacZRdsd1shMdx8aOSX9l0lKv97rn4z3rXbJid0qaiCEv6zug
         8RjZHKnX37uSHWNbOZdPH4vwQCZ/0ijilA5+tqH/E7Zo1xl8hNKe/qYpEp89d21vEXGk
         D1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUBgMDEfHB7SMPaahjNRn+y22nJE4DaAnaZKFszl4K3/mwW8nljuGJpc/NnjlACDr87C0AHC2Y8isk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw22/ZqL/1jhRuTZopCTgtVLo5yzd/2Yy1dA05A3Qe/99X/RSU2
	5nxjXq3XBcDX5UZ4/tGu5a3Owp6wz1P848fQGusuEOCTRLJfu8c85CFWJwvd/mEmXg==
X-Gm-Gg: ATEYQzzS/asi1MNNj34x5/UWxbdCSsLInkc3r3velDv3dCYAaLwLShOxngkCk5zgCzz
	Q+D54JyxueXqv6k9w/QebdEppredyOgTtubEK/yJq5ZLZ2ZvYRpeApVA/eKOjpaRhQURemwnugH
	QZgm7VBXBM50M92L8/a3HVayUsEK1hvxYE6D0bXOsfUfl3+s6hoVRrMezQ60PNYenJVJWfk1lG1
	3Rjzo0lSsIlnnvzdHauJbCOEHg66/A7YmLN50agsXi/xv9rlAPvuNbta2PPeQy7uY4PtuW+mWRr
	iMjckhZfWx8twFYAtZ5eAOdnq5KgUL5HWn6XRTUwXfxZJfTEIgrBelzGf9JCpHf1n9SO1IYtDMk
	H20dexjkI3JyuEYL6Q8LxGgIFIcWu7oyxAwLtUj3TVGCFYr2151jMXVbDZFfUPYIzEgCfMwXRs/
	cqxuILIe6/S6ZiYNWO+KBJ9Eg5A9ChuFFkAPlHrzgQjEuHAqXqNbMIV0WaEU7XyamxvJi/AKTSQ
	xKGNUzCIJE1UHk=
X-Received: by 2002:a05:600c:3b07:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-486fedab1e5mr202109025e9.5.1774341338294;
        Tue, 24 Mar 2026 01:35:38 -0700 (PDT)
Message-ID: <20a55ead-8ac2-4c2d-a898-0856c6a46cd4@suse.com>
Date: Tue, 24 Mar 2026 09:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
To: Milan Djokic <milan_djokic@epam.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <364e3781c041e12343d15ca7a17a420463281e57.1774305918.git.milan_djokic@epam.com>
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
In-Reply-To: <364e3781c041e12343d15ca7a17a420463281e57.1774305918.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1774341338-8DCFBDF3-61F148A3/0/0
X-purgate-type: clean
X-purgate-size: 1325
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6B108304B9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 23:51, Milan Djokic wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -311,6 +311,10 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>  
>  #endif /* HAS_DEVICE_TREE_DISCOVERY */
>  
> +#if defined(CONFIG_HAS_PASSTHROUGH) || defined(CONFIG_ARM)
> +#include <asm/iommu.h>
> +#endif
> +
>  struct page_info;

Why would this change be needed here?

> @@ -387,6 +391,11 @@ struct iommu_ops {
>  #endif
>      /* Inhibit all interrupt generation, to be used at shutdown. */
>      void (*quiesce)(void);
> +
> +#ifdef CONFIG_ARM
> +    int (*attach_guest_config)(struct domain *d, u32 sid,
> +                               struct iommu_guest_config *cfg);
> +#endif
>  };

Nothing here requires anything to be pulled in, so ...

> @@ -407,10 +416,6 @@ extern int iommu_add_extra_reserved_device_memory(unsigned long start,
>  extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>                                                    void *ctxt);
>  
> -#ifdef CONFIG_HAS_PASSTHROUGH
> -#include <asm/iommu.h>
> -#endif
> -
>  #ifndef iommu_call
>  # define iommu_call(ops, fn, args...) ((ops)->fn(args))
>  # define iommu_vcall iommu_call

... keeping the #include untouched looks entirely possible.

Jan

