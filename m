Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I05qILHRHmrRVQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:50:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D662E2AE
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:50:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=RCnazoGU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324942.1590448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOZw-00082h-Eo; Tue, 02 Jun 2026 12:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324942.1590448; Tue, 02 Jun 2026 12:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOZw-00080H-Bq; Tue, 02 Jun 2026 12:50:44 +0000
Received: by outflank-mailman (input) for mailman id 1324942;
 Tue, 02 Jun 2026 12:50:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUOZv-00080B-PP
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:50:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOZv-00HHXe-2F
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:50:43 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed1a0-e002-0a2a0a5209dd-0a2a45089f60-10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:50:42 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed1a2-63b5-0a2a45080019-d155dd2ed822-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:50:42 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-460166910e6so943182f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:50:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354b7edsm32863588f8f.22.2026.06.02.05.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:50:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1780404642; x=1781009442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G6ctf22auH4IDt0bPbc2QgNjftV6+zjC9Kr805mMPDc=;
        b=RCnazoGU1C28+OCXV45lEZPOGNQ0Tz6Ul5m1olrnMXSVqaFbRzlOq1T4+AT3DSokHj
         iEjMMkaPiZZcSdS9C1rPvEbyX19tvg0tkzPReJiAZv7eW0v3V9usy4Gwe7ZyqA+lIlL2
         zetp9qKDtUPqNguxCCYccYRtyfH89xHSc6LFGm6+fpO436jnz9bXqfbflu0i75udr9xM
         pKprF5uw9fc23N2+YpAa78N4j+WBkqVXf9qlHhyHHrqlKfVYTAAWB+vqOhc8iaikOMKR
         oj5wbOyM45w4IVGmA3ic62m8/fa+fiC1FnkPV27ouM8qPMLeqaoeB97k6Ff8pd/Br1id
         cvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780404642; x=1781009442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6ctf22auH4IDt0bPbc2QgNjftV6+zjC9Kr805mMPDc=;
        b=XjOJpkzRfFsTEbCforAv8hPhAmUPM3TKp3QJPp2lK/7oa/545VMq5gY7g8taKDV+85
         vRSTh6veJZoHpWujWnjuxB0xpqG+JpCme5t+7DQ4NSq/XvsXXibjWhcWF5anugmMQVEb
         y/nqQudoYkUAy4me27F7rspEJl3sgx2WF/L2oUaRsuvF4fhlupBfdqXUcz+UeFdyokCk
         8ArdzGPq4fzl3r6TtyxvPnupcUjOwDttkuaz0rstIvJgtHAryH+vkXe6WiIKpJSn4zQS
         gLWCNOnKbMiiZpVCcUidAyQpIImupERsoaUeFSThbPdvyjRWK0s62bFeBNrKMaysUyyl
         2DAw==
X-Forwarded-Encrypted: i=1; AFNElJ/lypAeAnd1tnoFfLOIt60rf5HmSX9LGoVUU2fbR/+OLTnrF1Bl9aXB2CoyiUQOP8PemelQ3Mk9cWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQlu/T52IoB2OS/hTcvcnqDkafOA1gNj36iKNBNGQd8aZFr9pT
	GJlOg++vqAyaRrIYcZw63TAugS/BppOHwaV99FRWzih85eN26gtG9T+BV7XJ62kk3g==
X-Gm-Gg: Acq92OFtxClyytK5JVU6xi9p5IZfIxIjht2NAF4XqAjcqEOxh7qaoQkw1w3DYNj1y1u
	bgFP31psPx3hfKskJB255cOidb2xCnNzr/iMvN5kIVlU13fq9qO6OX0HaSjP66ctoETpXL5yq4q
	X9aT9psnoQ55ZD4nNtLIPey4nzYLVu3B5B2w0cWoGX6NFTB6i9yM9ytboBnT2AmMdjORb/2/ty1
	QPswvNJWm9oatub9ZBTcec5mjbPSPsUatGSYUounQdvfnNKMEZaaa2+jqXvAP7JgCRx4H/WcfRJ
	jZTiFHn+b5VDHYmMthOO3LpRWuu8YvuVxVp3G+kn7aWisIGtFBsqPc2r7d1Jt6NG+VgczGrB1We
	ZOS2MPT/YHDZ1Dt+CY40D7TuuYCq2juaYJ+1IA3cFtMc8Mod0i2vs3ECMq/Pe0N/ST6p/CBjSy6
	7rmV6H7tadUfSc5m4rgIUp7yERbybpL0m2NTQQpGpzBHu5maScb4caMPip+gTS15mK/2qOpQ76a
	j4U2oHs3Q5lfM40n42KIKtrVg==
X-Received: by 2002:a05:6000:c11:b0:446:96b1:f5f with SMTP id ffacd0b85a97d-45ef6b028ecmr23460523f8f.8.1780404642266;
        Tue, 02 Jun 2026 05:50:42 -0700 (PDT)
Message-ID: <cc4c4f50-2351-4a80-88d4-f9d2b54d03b2@suse.com>
Date: Tue, 2 Jun 2026 14:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/mm: Normalize X86 per-domain page counters to
 unsigned long
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
 <21fa13ba303f59f14ace46cd0715b07f8ae99468.1780058608.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <21fa13ba303f59f14ace46cd0715b07f8ae99468.1780058608.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780404642-BC567DB1-9272B1FC/0/0
X-purgate-type: clean
X-purgate-size: 1963
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:tim@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D89D662E2AE

On 29.05.2026 14:43, Bernhard Kaindl wrote:
> Prepare x86 for >16 TiB domains by normalizing the per-domain page counts
> in paging_domain (total_pages, free_pages, p2m_pages) to unsigned long
> and widen page counts in related x86 allocation functions accordingly:
> 
> - paging_domain.{total,free,p2m}_pages: unsigned int -> unsigned long
> - x86/mm/shadow/common.c:
>   - unsigned long sh_min_allocation(d)
>   - unsigned long shadow_min_acceptable_pages(d)
>   - unsigned long shadow_get_allocation(d)
>   - shadow_set_allocation(unsigned long pages)
>   - shadow_enable(): fix narrowing from d->arch.paging.total_pages to
>     unsigned int
> - x86/mm/hap/hap.c:
>   - unsigned long hap_get_allocation(d)
>   - hap_set_allocation(unsigned long pages)
>   - hap_enable(): fix narrowing from d->arch.paging.total_pages to
>     unsigned int
> - x86/mm/paging.c:
>   - paging_set_allocation(unsigned long pages)
>   - arch_set_paging_mempool_size() don't truncate pages
> 
> Note: pages in _shadow_prealloc(), shadow_alloc(), shadow_free() and
> shadow_prealloc() is intentionally kept as unsigned int.  It carries
> the per-shadow-entry page count from shadow_size() (uint8_t-backed,
> max 4), not the pool allocation count.
> 
> Note: xen_domctl_shadow_op.mb stays uint32_t, and the domctl ABI remains
> MB-based and caps at 4 PiB, replacing the 16 TiB per-domain limit.
> Casts widen the mb-to-pages arithmetic to unsigned long where needed.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

I don't think I suggested this, and yet more than for parts of the earlier
patch I wonder if this isn't going too far, at least right now. Certainly
a 32 TiB guest (i.e. one having 64G pages assigned) isn't going to need a
P2M pool of more than 4G pages. As per code you alter in patch 1 and here,
the internal ratio is rather 256, i.e. the widening would be needed when
we meant to have guests of about 256 TiB size.

Jan

