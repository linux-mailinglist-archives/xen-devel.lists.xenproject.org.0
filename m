Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHNfB3gA4Wk7oQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:30:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D6410CDB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283691.1565841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOel-0003D7-09; Thu, 16 Apr 2026 15:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283691.1565841; Thu, 16 Apr 2026 15:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOek-0003B7-T9; Thu, 16 Apr 2026 15:29:26 +0000
Received: by outflank-mailman (input) for mailman id 1283691;
 Thu, 16 Apr 2026 15:29:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDOej-0003B1-LT
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:29:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDOej-006Y9f-2A
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 17:29:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e10048-2eae-0a2a0a5409dd-0a2a45038ef4-28
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:29:24 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e10054-672d-0a2a45030019-d155802ba96e-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:29:24 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso7701785e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 08:29:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f095e68dsm82230165e9.2.2026.04.16.08.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 08:29:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1776353364; x=1776958164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o22nfqFVQsUXbuBU9HRN8aQ3+e+e/qm+I8FKaMe0zSU=;
        b=T0YR+ekYOoLT0NSvVOKDH5JJ9aNeql/qponHolsS3SOimmFW9NSAsiUI+7z3E5Osxi
         G7+3rE/r8xMBpcJ34B/n9hIj5gb5BoRyuVa7iN7pCiWpnT7OmhKxKNZquLowDqJEhDBU
         wBeQ8NY/4YtCpdWlTD5rz8xY6kPfe5VY5Ca1IMEokh1yCWI29UZzsGKtq0oxgrdGEwf+
         ypVr6+LDFVptGw0EcV9ZVep3Q0SG0hslCXe86ngE4ew1Ym+FkBXkH47wzH+PblVz2MTQ
         fjmteFWVfzLCwq3uT0mPQrY555NQc2EGY5VQQ3HdQR2HnLzdAIejci9InQNcpmiG+1AU
         XclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776353364; x=1776958164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o22nfqFVQsUXbuBU9HRN8aQ3+e+e/qm+I8FKaMe0zSU=;
        b=C6XMe/rJeBeb5nUjNvjnFxMc/n0qYmQf7EUb0ewV3LdDraswTujGiRkirPVXooerJx
         qWbo/lx8r9neVW+EASIKbdiL9XLq+hV4C/4+qh9CJTzgEqXWBQizL5AtfklYBl6+SIV6
         dcLDleDZeOrBfYePCFH5ZvqzkqAMbuiOQSe3hSul59zEhx5yLAda2yIQMeakPsrF0UIL
         5NUv2rf0+oHYrL4V6/wPir6NfGCwW16V48h1rWTj42FT6BjMmSLXqz7ya3UJ0VsZ1/U+
         xJH6wJC72kF7KSfgz4/5NyuYPWCFZTgl96PD2F6YvNu9AAUBSWbxTqzPhMUlXzt1bjy8
         cfcg==
X-Forwarded-Encrypted: i=1; AFNElJ9voph6J0WWcpgEnK05PoUfOkdVA5rp9m7HRpcC8gz0KDe0skQ669w6P+VHyOLmJgnhDJXi1rSVdGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhDEsVMQTDPcRwElB+qDnZnNhbpDNIntaqTggQUAG1JPWVRDeK
	TbcxgXiyDDpHP7rNxXlPzVi72yW3/pCpE8hj9fgBafiF/ed/BoTIdA36hRHc5smbKw==
X-Gm-Gg: AeBDietkkZrFa4zQfjQNxkCx7Hgo0Iy+AC5r4PYGGcVKsk3WDkZ+CaCFKHeJLpg7bBR
	B7dR+SUheZ5ASyfDq3RzBcD1PtLm4TLEu0oLlGkk5w404fkrj9O/Usv5zSPn9c0pbQzjflrYI/N
	CBriD1PwhzucbTDMAw6COQj9874mcuz3XfeuRBP558uLMvXmcxl2TbsJb0aixW3eCuxtbCUCxed
	QwwH9VIZaLyrbzA5uPALpZIzBqLbhEag5UfhSzzdq/KL88hqot1KNtXgqt8j1iLQsICZtP6VQm3
	orNBGKQoeHBScOUl/3CEmgqZpjOz6YxujmSAp9Aeaj93aZ9YaxYmva4lW8KrlkKuS7dNnZs0Vsy
	MCV5y/OZO7Z1M2eSRUVn78yvBDq+PwJ7VR0uAdJRRYS4hTn3Blckv9lo2h+TKpiluPE01Z4BkTC
	T8z0bsU2XYCEw46n6Toa4FGE560h8UsWexl8S8dlwHxBVrcedPxj2xog/3fRqgrKlHz6HNiN2Pv
	/xenNysJNRIkS0ruly/GR+lz6hPohCU6wO7
X-Received: by 2002:a05:600c:8881:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-488f4826074mr42009095e9.14.1776353364247;
        Thu, 16 Apr 2026 08:29:24 -0700 (PDT)
Message-ID: <90f66a3a-4811-4f83-a4df-204b121118c2@suse.com>
Date: Thu, 16 Apr 2026 17:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] vpci: Use pervcpu ranges for BAR mapping
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
 <20260406191203.97662-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260406191203.97662-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776353364-A177E938-74D125C5/0/0
X-purgate-type: clean
X-purgate-size: 1944
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:dkim,suse.com:mid,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 709D6410CDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 06.04.2026 21:11, Stewart Hildebrand wrote:
> From: Mykyta Poturai <Mykyta_Poturai@epam.com>
> 
> There is no need to store ranges for each PCI device, as they are only
> used during the mapping/unmapping process and can be reused for each
> device. This also allows to avoid the need to allocate and destroy
> rangesets for each device.
> 
> Move the rangesets from struct vpci_bar to struct vpci_vcpu and perform
> (de-)allocation with vcpu (de-)allocation. Introduce RANGESET_DESTROY()
> macro to free a rangeset and set the pointer to NULL.
> 
> Amends: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> It seems a bit awkward to introduce various vpci vcpu alloc/dealloc
> functions here only to undo most of it in the next patch. Thoughts on
> folding the next patch into this one?
> 
> v3->v4:
> * no change

There are some complexities here due to the patch being part of two series.
Once Mykyta re-submits the SR-IOV series, we'll have two (likely diverging)
v4-s. Already here ...

> v2->v3:
> * new patch in this series, borrowed from [1]
> * add Amends tag
> * remove unused variable i due to rebasing over 998060dd9101 ("vPCI:
>   move vpci_init_capabilities() to a separate file")
> * enclose entire struct vpci_vcpu inside #ifdef __XEN__
> * s/bar_mem/mem/
> * use ARRAY_SIZE
> * put init/destroy in functions
> * only allocate for domains with vPCI and idle domain
> * replace 'if ( !mem ) continue;' with ASSERT

... the v3 there has one more item on this ChangeLog list ("* synced with
BAR write with memory decoding enabled series[1]"), albeit maybe (now that I
read it again) this merely is the counterpart of the first bullet point here.
It would be clearer if there the other series' title was supplied verbatim
and in quotes.

Jan

