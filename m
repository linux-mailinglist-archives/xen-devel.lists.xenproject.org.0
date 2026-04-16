Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKuyJHb54GnZnwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:00:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29684100D9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283636.1565806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOC9-0005nv-79; Thu, 16 Apr 2026 14:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283636.1565806; Thu, 16 Apr 2026 14:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOC9-0005lU-43; Thu, 16 Apr 2026 14:59:53 +0000
Received: by outflank-mailman (input) for mailman id 1283636;
 Thu, 16 Apr 2026 14:59:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDOC7-0005lO-JQ
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:59:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDOC6-00DhQc-Gp
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:59:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0f94a-2eae-0a2a0a5409dd-0a2a450acf44-40
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:59:50 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0f966-56b3-0a2a450a0019-d1558031dc29-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:59:50 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488ba6366a7so97261205e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 07:59:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f0e72980sm66716285e9.5.2026.04.16.07.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 07:59:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1776351590; x=1776956390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kWuZs9deFqGhJC2mLEXvW5ndzqhjdRuMgNXB7yQ+2KY=;
        b=auGrutbd28AR2q7Xwecy4WpFxkZMvBSPmKRX0ATE6CNyw5mCEWHYk4hfbsYBqUnIgo
         6CzDBCFNEG7xImIKlwv5KGL12KDYUECszy6mxt/nNYfdIQ6PRMhgu1mHCr+aHMXPCVnk
         +opF1/MXxREN1irijz39MwFdFXsifl96LnshpAqLoxCtOAhPFKepqWAFLrkTUWTcIYgY
         qp6s3n8WFweMGosyB3GmR9D4W3K3JNwJhm6CFZLHfw1K0EjPse9jVFk01yp/P+SCdW8K
         N0RDat9p4qX2QPR6G59tj8TNXDvbF/SMlN/ywg+b6bFqx5R2Q/czznajDqdsHeMiplYV
         6Agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776351590; x=1776956390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWuZs9deFqGhJC2mLEXvW5ndzqhjdRuMgNXB7yQ+2KY=;
        b=qtdJ2wNvnKbPQj9kh0ol9crsFBqZG2ZFgNxCNV/cL1WALcZJ+j/W0dd0Yy53hSc0Tt
         NPbIz5M0K+eQ+wFfx1TzDZMkL5QvWNsUwpllEIUXkCWh1E/HU1CVwW8+VmTEuTh1H/qr
         XMr/tJ70xnFv0mheZxN5lUj+KKCKzYyQ29TpSto4B4ezsaqE8zbem3itb7tpDxgdjtws
         4LYhqug3TKV/2trWGrNJ6pNQN5w7lxn+tRr0DNJWzhR86afaSSYGeVn7zo5IERReTbYt
         Ppssq6NPdujg6dUdZZVC36fHXNL3GXWfNgLPfGP8DjBhDzR/oP9ULFiu3HfXaMk47uW7
         tSDA==
X-Forwarded-Encrypted: i=1; AFNElJ965IIGEmBwMN3KaZjux22TIxQlJp0CxoxGQ78Of+086gH9wEjavoBBaRGU5/ADPwIxlbt9PvTsNvM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywp4HcBKQvBK9M/IUUK6OFpcWdo+hrrr+AX8nLgmpv4b9of9cLr
	fjCfjXVBUUTXYkMPmiFYeifXbfMp/RpYN7yQBHW8U2r8HlczEbZK36u6URMqBHAkfw==
X-Gm-Gg: AeBDies0hr11oGW16EgDqRgy/EgvW9MUejhJExhN3LDY12ZJ7NEGfuzijKMXIAN2fZx
	q2R7wOe8sU63rZC+vVh2hxgnrNDsv3Xujb+P1/YaX2s9cGLLDKW2h90AXKsOpOA8rOLUuWs8FnZ
	msEda9qxVoZ5uBqgzlu0VBIRKqA6KFl9sIqFZ/qlzyfKCR2CnOLIppW4M5KcdwQ7fy8marx1nHg
	bfbQmeLTp+QlIlIJDaLi/G+LVhEiuph2Tb18D3gaf8ZNgE8XSx/MePQc/TaZAvhmfGn1Ggu5k9N
	S22477YNzaK7Iw+8WTyMPSSp+1u/3l0P1NYAwajJ0ZIxoE9AklwQ81V0baM8FJRra5kYLXpnAzr
	XB6U8S+IYMvMpkQNN3h9pk6PQCr7x3wXzqbkBzZ41igE+0V4WJg49tXAXiZLWJVCEoXCIYaNAc0
	BNxwE2CRygW/M97SfNRRGvBaK32aNeZly7va0KpsE0Yc+KCQum5EG6tm7X+4AB9Wz/bkvdk6m/R
	knlUS8uFXeFhBwYp3FrsOFiSw==
X-Received: by 2002:a05:600c:8883:b0:488:a82f:bb95 with SMTP id 5b1f17b1804b1-488d689c18fmr273836605e9.29.1776351589769;
        Thu, 16 Apr 2026 07:59:49 -0700 (PDT)
Message-ID: <efad3732-243a-4cac-8a92-13b8d9169d54@suse.com>
Date: Thu, 16 Apr 2026 16:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] vpci: allow queueing of mapping operations
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>, xen-devel@lists.xenproject.org
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
 <20260406191203.97662-3-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260406191203.97662-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776351590-CF3738B7-2D1D27E1/0/0
X-purgate-type: clean
X-purgate-size: 2205
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F29684100D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 06.04.2026 21:11, Stewart Hildebrand wrote:
> Introduce vPCI BAR mapping task queue. Store information needed to
> map/unmap BARs in struct vpci_map_task. Allow queueing of BAR map/unmap
> operations in a list, thus making it possible to perform multiple p2m
> operations associated with single PCI device.
> 
> This is preparatory work for further changes that need to perform
> multiple unmap/map operations before returning to guest.
> 
> At the moment, only a single operation will be queued. However, when
> multiple operations are queued, there is a check in modify_bars() to
> skip BARs already in the requested state that will no longer be
> accurate. Remove this check in preparation of upcoming changes.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> apply_map() and vpci_process_map_task() are very similar. Should we try
> to combine them into a single function?
> 
> I concede that the dynamic allocation/deallocation of struct
> vpci_map_task is not ideal. However, to support SR-IOV, there will be a
> need to queue many mapping operations (one per VF), and statically
> pre-allocating that much would seem wasteful. Only the hardware and/or
> control domain would need to queue many operations, and only when
> configuring SR-IOV.

The address ranges are pretty regular though across the VFs, so I wonder
whether getting away with less than one instance per VF (perhaps one per
PF) wouldn't be possible by adjusting what data is being put into the
"task" structure.

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -19,8 +19,7 @@
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> -void vpci_vcpu_destroy(struct vcpu *v);
> -int vpci_vcpu_init(struct vcpu *v);
> +void vpci_vcpu_init(struct vcpu *v);
>  
>  /* Assign vPCI to device by adding handlers. */
>  int __must_check vpci_assign_device(struct pci_dev *pdev);
> @@ -155,14 +154,23 @@ struct vpci {
>  };
>  
>  #ifdef __XEN__
> -struct vpci_vcpu {
> +struct vpci_map_task {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */

This comment needs adjusting then, too, doesn't it?

Jan

