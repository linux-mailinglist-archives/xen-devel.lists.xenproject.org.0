Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q0VDDqS7ImqPcwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 14:05:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785F647EF9
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 14:05:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="araHZlQ/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1329417.1593551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTJ0-0005Uy-22; Fri, 05 Jun 2026 12:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329417.1593551; Fri, 05 Jun 2026 12:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTIz-0005Sl-VX; Fri, 05 Jun 2026 12:05:41 +0000
Received: by outflank-mailman (input) for mailman id 1329417;
 Fri, 05 Jun 2026 12:05:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVTIz-0005Sf-5M
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 12:05:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVTIy-00664B-E1
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:05:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a22bb90-bab6-0a2a0a5309dd-0a2a450cbade-16
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 14:05:40 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a22bb93-62f1-0a2a450c0019-d1558032c9bb-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 14:05:40 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so14967595e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 05:05:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc4082c3sm144487075e9.13.2026.06.05.05.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 05:05:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1780661139; x=1781265939; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DrItdZBOFahsUEB510Z29KG8BB5YtjsoL5D4StZRNpA=;
        b=araHZlQ/mZraO9eqmlYXlzAoAc3debBQDHREqU8pMGh6urEeG+2TisiqCC7BbTNOny
         Cvm5vdZ01DVaVRFiJkJyl5fl9GmX52ue1e7gae4yh8KQ2+W3Mpj2wmgVRacdGgz3p5Q0
         aVkzub3sebCK3/sqYYtAMLWLQqq7VIJSOtjzehzbh0Ifvmz3wdbsUAIDcFe6/+fu1ZMk
         PRSs4O962eX327Rxt4l1QCvtf//L1WV0l6UBiJrXJ7KvFAzo2WMB5yOUTj4FHi9YUEn+
         ifzMRF2NCrKfEROo5cGrPu56hxS9UdefdZ7tOw3B9OOndpreILCf3l6SaihvVartvOr2
         dYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780661139; x=1781265939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrItdZBOFahsUEB510Z29KG8BB5YtjsoL5D4StZRNpA=;
        b=bRXAgrE+W2eHVKNEvsF4ijT3jxg9Y55ybFhEY12sogXqsSjI4keytCwrT9Un9mHKw2
         fsXjumG9B5u2tx7nMlqDs1h1FVX6CVM2QA5PcmPHZT2Zg8Kgc6Ae3Iq037QGmbtPJdi5
         U2TiM8bAgxD3kPyARnx7s1YcTdJ/2G6+HI1N5ptaKljPJa3Acow5sO8oPScxWIgqYuPE
         wAyufxvuBFx6aLcYje5yqpVwpuFFBkzZK6caeP7+qe6y+95ICHeUWSvrg13QKB5v1t+q
         0LtBp8nML3YtwZp4zN8lVBIfrvgYLw4caczlAFi49z8b+Bxnq2FYHzWPmB43gNRalGyl
         Ti6w==
X-Forwarded-Encrypted: i=1; AFNElJ/AY5oD2V2/1SnlbdbcnaiRwdfW/cWWPadKSMnjckVgWhWJatU8vTXm9T/ilS6l3XnRezUhqNXO5PM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwW6juNLSxz/FxdattrojYL6e1v1YNpuxv3mO3RXM3EYvVPT0cJ
	hv+rd2Wh5CoPmzKGuwVZp7DFIbLqzSrW/8AbeN54sobq6csuA1sNGTiXiw8EtjZ3iA==
X-Gm-Gg: Acq92OEK1nKUwUdgqhwkjhY3KBZlxNxG4vwYReR3ua/LRbpqzmV8X4waLXyEHlIv6dT
	KoSgKSuYlXue+67S5iLZl8rwgzngXayp1043HBCVBoWCjaJPLZi4hX4kIDej0tFLW/eM82OmERp
	bueQumw+Ss2p8rn53HFp2E0HoExhY0qNNsHdXzSPuPUo4VlBLXVTrB2oNuFL4WcziV7hP2t6eVn
	k0aHKJIVwchncaGfIyqRC3I/gspXtlUrXvizYmKdgTjP9JZR251bhIM4gHUVn7ezTdzrWhA31X+
	FGcZC+f468jVbHTIaaCiZWBxxn2h0Fi1RhhHYMvCRne2p655Psajia0Pz1MjC+nL27lz3TL5IbM
	bnJ3tvQO5naQxJsk9L/tm7qUPcS6jl+p2DEousOu41EPg4MgzqXUVEY5ZtGmIoLKahklsrepI0r
	8v6ZHU6vb59SVmAG41Fpmi0ZkXbymhUel1G2Hm3kryPtDW7yzKEkxFEqO3l5b/Mb0uQuHCoPOTk
	HjbHs58CeLCiB0okT24qynxCA==
X-Received: by 2002:a05:600c:3492:b0:490:aeae:1eea with SMTP id 5b1f17b1804b1-490c2597362mr51849125e9.7.1780661139611;
        Fri, 05 Jun 2026 05:05:39 -0700 (PDT)
Message-ID: <69311087-ff1c-4b30-b8e5-2eacaf099756@suse.com>
Date: Fri, 5 Jun 2026 14:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/26] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <220cf09814744b8b8136b1e3c35ab982226d3f6f.1778250616.git.oleksii.kurochko@gmail.com>
 <6ec9620d-7224-49d4-860c-6e447e0534e3@suse.com>
 <702af594-17ce-4e64-8f02-37ad5785c6a4@gmail.com>
 <8803731b-ae65-4ff9-a94a-d0670cb8b132@gmail.com>
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
In-Reply-To: <8803731b-ae65-4ff9-a94a-d0670cb8b132@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1780661140-DA368CF5-B6653E2B/0/0
X-purgate-type: clean
X-purgate-size: 1243
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
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
X-Rspamd-Queue-Id: 8785F647EF9

On 05.06.2026 13:59, Oleksii Kurochko wrote:
> On 6/4/26 1:29 PM, Oleksii Kurochko wrote:
> @@ -105,29 +111,18 @@ int intc_route_irq_to_guest(struct irq_desc *desc,
> 
>   int __init make_intc_domU_node(struct kernel_info *kinfo)
>   {
> -    struct vintc *vintc = kinfo->bd.d->arch.vintc;
> -
> -    ASSERT(vintc->init_ops && vintc->init_ops->make_domu_dt_node);
> 
> -    return vintc->init_ops->make_domu_dt_node(kinfo);
> +    return vintc_init_ops->make_domu_dt_node(kinfo);
>   }
> 
>   int domain_vintc_init(struct domain *d)
>   {
> -    int ret = -EOPNOTSUPP;
> -    const enum intc_version ver = intc_hw_ops->info->hw_version;
> -
> -    switch ( ver )
> -    {
> -    case INTC_APLIC:
> -        ret = domain_vaplic_init(d);
> -        break;
> +    int ret;
> 
> -    default:
> -        printk("vintc (ver:%d) isn't implemented\n", ver);
> -        break;
> -    }
> 
> +    ret = vintc_init_ops->init(d);
>       if ( !ret )
>       {
>           d->arch.vintc->allocated_irqs =

Thinking about it some more, in particular the longer term case of domains
not inheriting HW properties may end up better without this change, i.e.
keeping the switch() that you had (and a direct call).

Jan

