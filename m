Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S6AXA1ryH2o+tAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:22:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654FB6361D3
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:22:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=aUj9bRzT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325947.1591317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhnq-0002ev-WA; Wed, 03 Jun 2026 09:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325947.1591317; Wed, 03 Jun 2026 09:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhnq-0002dT-ST; Wed, 03 Jun 2026 09:22:22 +0000
Received: by outflank-mailman (input) for mailman id 1325947;
 Wed, 03 Jun 2026 09:22:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUhnp-0002dL-BR
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:22:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhno-00Epux-Kz
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:22:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff244-e002-0a2a0a5209dd-0a2a45088872-40
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:22:20 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff24c-63b5-0a2a45080019-d155802ce072-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:22:20 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49050ff7cbdso116026425e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:22:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b63e6720sm39633425e9.13.2026.06.03.02.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 02:22:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1780478540; x=1781083340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9PZ88yKPL17CnAdWKGgZHdi1Tvv4mWgCoZyTS6mTU0=;
        b=aUj9bRzTadgB5dyEDwv3pi0+YW6ddAFo8RcseQ0aciv6nLMuyTkUEVSPXLHdYdeFuy
         Tgp1C4lfDe4vJq6Brkguiw/0Pe7nO8u1fYRXvERpLvh0uQpR8DiRESyCTEuC3N24Ug87
         A1YxzbIOHdCQQSSUoASsiFFFyiUVGiemZ/Id04NuJljT9faP0qjwc2Bidwkcy/1V0ET+
         V1tYNLEtE8Maxe2tSPUMsnim4qLBPyHiURfWtDfwx5AnFzTKjCf9TcmCRkeWKvJBS0Gw
         eZwR4oCN9vZLeXSPkC29sV4PCNXZ7Xcpm9Xd53XP2wk6b52uEIenvmVI1m3RI7MSTvqk
         Io8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478540; x=1781083340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9PZ88yKPL17CnAdWKGgZHdi1Tvv4mWgCoZyTS6mTU0=;
        b=bQwSXtHJT3c7/29cJgkn5AKd+0yF3UygGD4xrRMUgi8dgH5YfqbOkoYpszuq3/YtbP
         t3MkofrguwyOgVn/k/k7ma9KELrACBjVL9faxd00VshWgWshUNduM37SukVGnb78naVo
         jVTOkPePg/Y8tSlTJGwyLQAVa9i08MjM/5a7Q71YUL53+uc+pE2JtHov7wtcFcu75I48
         CsldeG/sZ30gGjdfvWG9GCknyQIyuhWucsXuTWRrRo+RFELvodn8SGDHf2s2PqxCfteT
         FGFHzhfPITWTRQyI8zg6E3OEAMweGgGeBubsv3BMPnOmDCz97E+xkZ/vR+AwHxEdmuPw
         V+Fg==
X-Forwarded-Encrypted: i=1; AFNElJ8t5vCGqLduP6SlgrQJllox0rPCBnTxGuw4jetFxBmkhegpwpO5DYtZrKhLJ/qqC4LXv5szYBMgI1Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzT2g5eGVTRzFzGaAmaUNgO/yvFm9o+o3i6b07g2q1ZXQAwGDYx
	SYXG0NV/Q0/WvhNvuDF5k9t7/NO6ekX4TxCxa6G6ikF1we9LbT1RvVDehKJ/eArpCw==
X-Gm-Gg: Acq92OFlilJ00geirlbUB90JcntBs9wL/pXl8e8dGg6cJP2zZEDi5stHsXbQ57M4mjK
	z10BvhZB646vO70OdNIRjpjz7o1I4SdvZMr9a1cUIuHNwTKu5qySoOVwPbIyT0iEtepKwn162vc
	Wo319nLT0VpHptnVPakLqtmyb9zkGp9b/szjR1DDsM9rx3kc2jjoKQJVeXBiO3tetllgmjnSANE
	U58aAA592PjExyHd1dTeKfx51ZRKOv5Kj6eevCU21oHDWAazJbzQNi+b7qc6TXMVR/UJsuGL9iR
	2zplDhMRUxSZyYM4QLJvn6FFgbA0CuQafWfcx5ul9+lXPAa1k8H4i8GQTRTzcGBseJan6AoZdT7
	ZWweLBGHF5RYU+3XWVyOWj8sO3V/jMfqcG0wZDeBsmBlxfN6r/Tz1YhJwDL7Iv2xEjGizVS1Dr+
	dfGmTbw1t54NMcWvOTINF486ZPXjnFsMwoZ3bneMN5Aef/ReU15nQ2hNO3HaGXcV73R7J8IqDvL
	1CSqA4KvXu6YijUDzT3Y6l0ihDMIQCwLy36
X-Received: by 2002:a05:600c:8712:b0:490:b106:4fe8 with SMTP id 5b1f17b1804b1-490b5ed5d5cmr44758065e9.33.1780478539851;
        Wed, 03 Jun 2026 02:22:19 -0700 (PDT)
Message-ID: <00daf333-a1e7-4691-9dca-240ebf9dfcd2@suse.com>
Date: Wed, 3 Jun 2026 11:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
 <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
 <9df0b08e-6185-4d0e-bd06-32fe9d684ad0@gmail.com>
 <033aa467-ad86-48be-a59b-05315aa3cf4c@suse.com>
 <0e53e87e-df9f-4c30-a089-8c4e45babcab@gmail.com>
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
In-Reply-To: <0e53e87e-df9f-4c30-a089-8c4e45babcab@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780478540-C407FDB1-FD1734D0/0/0
X-purgate-type: clean
X-purgate-size: 2397
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 654FB6361D3

On 03.06.2026 11:01, Oleksii Kurochko wrote:
> On 6/3/26 10:18 AM, Jan Beulich wrote:
>> On 03.06.2026 10:07, Oleksii Kurochko wrote:
>>> On 6/3/26 7:54 AM, Jan Beulich wrote:
>>>> On 02.06.2026 18:11, Oleksii Kurochko wrote:
>>>>> On 6/2/26 1:19 PM, Jan Beulich wrote:
>>>>>> On 25.05.2026 15:20, Oleksii Kurochko wrote:
>>>>> --- a/xen/common/event_fifo.c
>>>>> +++ b/xen/common/event_fifo.c
>>>>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>>>>> int prev_evtchns)
>>>>>
>>>>>             evtchn = evtchn_from_port(d, port);
>>>>>
>>>>> -        if ( d->shared_info &&
>>>>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>>>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>>                 evtchn->pending = true;
>>>>> +#endif
>>>>
>>>> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
>>>> (in which case #ifdef may be unavoidable here), an alternative where
>>>> IS_ENABLED() could be used here may want at least considering. E.g.
>>>> causing a link-time failure when shared_info() is used (and not compiled
>>>> out).
>>
>> ... here. There are downsides to this, so which route to go needs settling
>> on.
> 
> For an alternative approach are you okay with the following introduction:
> 
> #ifdef CONFIG_HAS_SHARED_INFO
> #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
> #else
> void *__shared_info_unavailable(void);
> #define shared_info(d, field) \
>      (*(typeof(__shared_info(d, (d)->shared_info, field)) 
> *)__shared_info_unavailable())
> #endif
> 
> And then use IS_ENABLED(CONFIG_HAS_SHARED_INFO) everywhere where 
> shared_info() is used including the case above:
> 
> v->vcpu_info_area.map =
>      IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
>      ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>      : &dummy_vcpu_info;
> 
> Everything that in event_2l.c could go for now without 
> IS_ENABLED(CONFIG_HAS_SHARED_INFO) where shared_info() is used as that 
> code isn't expected to be called by arch which doesn't support 2L so no 
> linkage error will occur.

Yes, this roughly is what I was thinking of. I'd like to remind you though
of issues with identifiers with two leading underscores.

Jan

