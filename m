Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7W6eALtTOWqWqgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:24:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73E6B0B0C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:24:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=d+4YicjE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343966.1603179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgVG-000294-Gr; Mon, 22 Jun 2026 15:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343966.1603179; Mon, 22 Jun 2026 15:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgVG-00026x-Da; Mon, 22 Jun 2026 15:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1343966;
 Mon, 22 Jun 2026 15:24:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbgVF-00026r-Hp
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:24:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgVE-00AdFU-N4
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:24:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a395381-5cb7-0a2a0a5109dd-0a2a4503ca94-26
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:24:00 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a395390-a3da-0a2a45030019-d1558029dcd6-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:24:00 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49258ac7294so3901055e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 08:24:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466643f4e9esm25732984f8f.1.2026.06.22.08.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 08:23:59 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782141840; x=1782746640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jv8Wzzt1gdML5qbf7GwUS+RqFEzUNwIZfLx7jcTzmZs=;
        b=d+4YicjEkVfZX0a/N3kHciBVh7kxCIfgHeMIS9zyiP2k4OwYCGioAbjBOXWpXOWabt
         heagpDAprr47G5JgccV/8lgYx6xRXjBvr3ZAGXheKenBCImdgWnSWFz5oR2KFBMbE71r
         uC7dxi7ZdOVsuumd6L5OwLlQYmOs2qRnQiAhHFbEcIZZ3yEEq+ju3WAdHucKPzKILQ1k
         YZTMvujNG6OzJ4UAglctNL5ERWp+ZZGozbYGbbOTBKvLcHNnYe+CTGL0cvTuQU4Nyvmd
         61P1OLPeye+47msdf6y1Lnq61pyqwrcL8SDlWdQSUsS9e5BFGKF8XIuL5GLL4K+XkVIs
         /+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141840; x=1782746640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jv8Wzzt1gdML5qbf7GwUS+RqFEzUNwIZfLx7jcTzmZs=;
        b=VNLCOlJLdvdHCfQGqmUlftVySDPj6UBD0+34go7a97Jc+JeUJlRsZhxGYZ2xkynw2c
         G5G1d6y3iGuWyVUh+3mQwUSGPu7rcMdcUyhec7JeQeZnJP3Miy8PclGHTMQipnM/qm16
         RXoBKe4sydZpZVS9iVkxs8FxG/BbVtSdwwzaxY6Hq91hov8c2Rfo7Hd3I3DTqaaMVZFC
         xpmZlEeI835H3s0I49xe2jwFxMSebHbAGEXgJqD725rIbBYGNc3d3QAlE2Mu3Iwb+mkU
         XJ8B8pTgy/REO3A89vDjLGNwQV1YYbBBAao1afsBma0a1FHKphpNcRfVspbiDpjURRf6
         d2Hw==
X-Forwarded-Encrypted: i=1; AFNElJ96rmTAV71ot3LZaKWIZlCEQYttW6zUlLNCm3LGZ0VUb1pgSt2AYh0myf5V/mbCAP4rS44JakEogQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnXYwCZCI3p3XblBllZbVh73HLOUUSk0kfuCH8RrDXt27NfuPE
	WG553UsKmnm61lycCvrzd7y22zPr5vAGmIQGHtSHv5ltxmUTZaDDz5agfEWUY/kkMg==
X-Gm-Gg: AfdE7cmIEW7Vq1HS/GaYaoHQO7W149Pyk+QOJanVsQIJjTfEz9a+VjmYlrY8OAAXdIk
	TnKlqPQJZGDDTqIzU7w/CXLGTbh5e6ZsDuNXDRUqTrD6BLbCP6XHHEHc5RoxVcjaE2wS4SPgq5v
	ZiJ/L19jpBUv5kGIpAK5mm9+6G25mi0LxptYqU5aYrFtADuiA5LNlISi7/C0wbrfwxxZLFl0tsE
	iyEqUtnn9rHPXNV0YKBSqcgj15xzT7elyPU/CMlwvcqe03ktpoy6ExM8Z/8C8Nf64HNjIVkMSds
	diqu+2QY9nxtYEMXjCc4ySQCSXVDQh8v1xXAckg9xTAiLG4K2v7fS03mqj4OY2QLEM3fQJXPfBR
	RNLkT4A5qv7B348tKZp60IAOT1vqjiXtpxpU7j3x33SZPVnIc+iMcCUol2iHWFnrSsQS1WY2mX2
	SkUNMStUexEpmURBjq2Plw1WbbYSr1E0LKCYlvohMurj2cvt2x0M8YqmJOncuCFi1JikMZM79dn
	utV
X-Received: by 2002:a05:600d:101:b0:492:4050:d495 with SMTP id 5b1f17b1804b1-49240ea31famr167454605e9.30.1782141839875;
        Mon, 22 Jun 2026 08:23:59 -0700 (PDT)
Message-ID: <74f4b96e-1084-4880-addf-8ce57a0dab5f@suse.com>
Date: Mon, 22 Jun 2026 17:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/23] xen/riscv: create APLIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <0b034d584b7aaec54b70e9e575c727b07930d2ed.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0b034d584b7aaec54b70e9e575c727b07930d2ed.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782141840-65DC7D84-CAEC1EB5/0/0
X-purgate-type: clean
X-purgate-size: 1533
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A73E6B0B0C

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -12,8 +12,10 @@
>  #include <xen/const.h>
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
> +#include <xen/fdt-kernel.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/mm.h>
>  #include <xen/sections.h>
>  #include <xen/spinlock.h>

Why's this needed all of the sudden?

> @@ -29,6 +36,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
>      return vcpu_imsic_deinit(v);
>  }
>  
> +static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
> +{
> +    struct domain *d = kinfo->bd.d;
> +    int res = 0;
> +    void *fdt = kinfo->fdt;
> +    unsigned int msi_parent_phandle;
> +    char vaplic_name[128];

Again an excessively large array?

> +static const struct vintc_init_ops __initdata init_ops = {

Like elsewhere, __initconst{,rel} with const.

> +    .make_domu_dt_node = vaplic_make_domu_dt_node,
> +};
> +
>  static const struct vintc_ops vintc_ops = {
>      .vcpu_init = vaplic_init,
>      .vcpu_deinit = vaplic_deinit,
> @@ -43,6 +118,7 @@ int domain_vaplic_init(struct domain *d)
>  
>      d->arch.vintc = &vaplic->vintc;
>      d->arch.vintc->ops = &vintc_ops;
> +    d->arch.vintc->init_ops = &init_ops;

The caller of ->init_ops->make_domu_dt_node() appeared in patch 11 already,
if I'm getting things right. That is, up here there's a NULL deref there.

Jan

