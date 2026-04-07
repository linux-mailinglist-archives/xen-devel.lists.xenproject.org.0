Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M5VECoK1WnMzgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:44:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D86D3AF607
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:44:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275017.1560991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6ih-0006Hw-Sd; Tue, 07 Apr 2026 13:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275017.1560991; Tue, 07 Apr 2026 13:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6ih-0006Fj-Pc; Tue, 07 Apr 2026 13:43:55 +0000
Received: by outflank-mailman (input) for mailman id 1275017;
 Tue, 07 Apr 2026 13:43:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA6ig-0006Fb-6z
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:43:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA6if-00CG6c-4b
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 15:43:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d50a14-5cb7-0a2a0a5109dd-0a2a4508da10-42
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:43:53 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d50a18-fab6-0a2a45080019-d155802ad563-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:43:52 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488ba840146so11599475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 06:43:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f08sm53240039f8f.6.2026.04.07.06.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 06:43:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1775569432; x=1776174232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dn+QGR8q2OQit7mFrGiIYJbd7Ql1aeYq31bZ0tF9Pxk=;
        b=G95nATMdN7d8G+cF8d1AFKylxRBmhLjfW/hZSiXbSmHNR3vL5ARhOcWxWzb00xFa2S
         h18TS9bMN5M1wUN1ngLcnfkDaUbOv+qTNKjU/fU0zz/w9GP0/5W2Xbmr6qW/A4TH9+Sk
         B28u5UWn2UEBgB1vFrQG8h3l/tMrIeecDgbHuCMhtXnWs12CkaGQOJS3uFWwqvzJLV/Y
         gl3+9mtR+oBJvjPnkvGdqE+l7l0/1OuJUWfLAQvA++OM8CvQNP4kVNzSqFST+m9M2aGZ
         xpmcOfDz+3QvgH2i02gtQYAbO9j2tnEH4Y5n6HtjNqzCQVFDg6srQfuE3k4Qi8M7j8bj
         W4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569432; x=1776174232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn+QGR8q2OQit7mFrGiIYJbd7Ql1aeYq31bZ0tF9Pxk=;
        b=tQboO0K2XsVgJBETxGpacJhSY8Wn7qA/NwB4Lr9F3ap7T3SLYCcE4DH/m2ZPOhHzYh
         iLgUke7A8KV8N2E4OawUErDfRFbhwFy8uZL7RsBP4vAdf8rE0l4X57S18hbKUb9RehW7
         YTmy9cJvwNHXYCvqxOLXSq5cCV3PIAcB+b0MGk5kNVl5dZrmBqaEuBjGuoBN9SAwnPUS
         GR585vl61q7I505z7hruyOAp29K2e8p9U4KHw0A6AeZVkdWWD182gejn5aV8Y4MC6kEe
         +98l4e5EF6vfXdE4THxRjRHku0+nyMAAR2AZ8TukVS0l8MHBhGM82ryHYPoqDYifFPR+
         MFfA==
X-Forwarded-Encrypted: i=1; AJvYcCVJhSk8rP3mxQkEGQIlvogGnWn9vcu94E9rDvnk1BTE5e4TrOWe4jqCmt65UYFi2THNdwCXlLYmrqQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfLy2MuDbn3OJXdBPFezEU50jwii62gCNVGFgLAgO+t2ILq5tV
	sGhP9zDEfA20w1bDU/+nJlRLmhSvu+PmzW82pnoEjpcJcLw7OTuIEifJakD/p1mqAA==
X-Gm-Gg: AeBDieuMex6AIjgXkZlI7aJGD7dpJkWVvHzohebqC7+wGAUEF4VcSIynvy0cRLeiS4h
	K2EBrdBEoDr4bHmG09UTGtHSChzyhPGqgBagOvXitu2Y5myDe5z+KoCFhQb223r89L25TYt72CZ
	AyZw1JsYoTrZ0wZiJu3oOHbUeM1ImlRjcKlxsrppDHihd+Z8ECuEyDYF1j01EaM4x+2Ky7yb1xd
	lIt/KBuCit5aiPKuBndaWF+BCbt55KV1RB8jedqfXKdfDn8Qus1n6me1t5FhHP5RKTZMFhq3wXn
	RIIlJZ1tkM9VkLM6HDxSbAPOxC1AdA9AJnVpZSek53NDTveje6I1+pOnd6XjSrCQ9Q7KOPsuZzd
	kjW35biick822rARWw05erXG6ESAuM5oTqaW9UZiTQZV6Zg5vd5BeXobeo/kL9hl8GkkvBHWHiC
	xem8sIPBvYDeShJCHTRRCruzGivUWGPWNIRfZ8Lxj/T8kQTUwl2KcxthkKJNtRx3xeRqvOAEXJi
	GFitdoISuvrNdbpQFmVHIR5MA==
X-Received: by 2002:a05:600c:a311:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-488bfc316c6mr26320535e9.0.1775569431824;
        Tue, 07 Apr 2026 06:43:51 -0700 (PDT)
Message-ID: <24afc38b-9790-44f1-8a8f-b4e4b8bd6fc8@suse.com>
Date: Tue, 7 Apr 2026 15:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/27] xen/riscv: rework G-stage mode handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <2c8f1ea25b8d3ec78b00510fbe604a87e759e194.1773157782.git.oleksii.kurochko@gmail.com>
 <fb4a8f75-d3f8-4e8c-9b45-1194c78659f5@suse.com>
 <30c95ac5-bc1e-4cbd-9a8a-bb1c5ec53922@gmail.com>
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
In-Reply-To: <30c95ac5-bc1e-4cbd-9a8a-bb1c5ec53922@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775569432-F6F4A497-28181E2B/0/0
X-purgate-type: clean
X-purgate-size: 2740
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D86D3AF607
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 12:47, Oleksii Kurochko wrote:
> On 4/1/26 3:19 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -45,18 +45,32 @@ struct p2m_pte_ctx {
>>>       unsigned int level;          /* Paging level at which the PTE resides. */
>>>   };
>>>   
>>> -static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
>>> -    .mode = HGATP_MODE_OFF,
>>> -    .paging_levels = 0,
>>> -    .name = "Bare",
>>> -};
>>> -
>>>   /*
>>>    * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
>>>    * restricted by external entity (e.g. IOMMU).
>>>    */
>>>   unsigned int __read_mostly p2m_ipa_bits = PADDR_BITS;
>>>   
>>> +static const struct gstage_mode_desc modes[] = {
>>
>> As a function scope static this was a fine identifier. Please consider whether
>> with the wider scope gstage_modes[] might not be better.
>>
>>> +    /*
>>> +     * Based on the RISC-V spec:
>>> +     *   Bare mode is always supported, regardless of SXLEN.
>>> +     *   When SXLEN=32, the only other valid setting for MODE is Sv32.
>>> +     *   When SXLEN=64, three paged virtual-memory schemes are defined:
>>> +     *   Sv39, Sv48, and Sv57.
>>> +     */
>>> +    [0] = { HGATP_MODE_OFF,    0, "none" },
>>> +#ifdef CONFIG_RISCV_32
>>> +    [1] = { HGATP_MODE_SV32X4, 1, "sv32" }
>>> +#else
>>> +    [2] = { HGATP_MODE_SV39X4, 2, "sv39" },
>>> +    [3] = { HGATP_MODE_SV48X4, 3, "sv48" },
>>> +    [4] = { HGATP_MODE_SV57X4, 4, "sv57" },
>>> +#endif
>>> +};
>>
>> The dedicated initializer form isn't adding any value here (whereas it slightly
>> hampers readability). You really don't want the array to be sparsely populated,
>> so perhaps better to leave as it was before?
> 
> I need modes[] to be outside of gstage_mode_detect() as it then could be 
> re-used.

Sure, and I didn't say "where it was before". I said "as it was before", i.e.
without dedicated initializers.

Jan

> For example, if expected G-stage mode should be passed by DTS 
> property then in DTS property we'll have something like:
> 	chosen {
>              ...
>              DOMU1 {
>                  mmu-type="riscv,sv48";
>                  ...
>              }
>              ...
>          }
> 
> And I will need to have another functions something like:
>    static unsigned int find_gstage_mode(const char *mmu_type) {...}
> which will re-use modes[] to find a correspondent mode and return an 
> index (or return just correspondent mode) for that mode to then re-use 
> it to initialize p2m->mode:
>      p2m->mode = &modes[find_gstage_mode(mmu_type)];
> 
> ~ Oleksii


