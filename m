Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ylm2BoZWMWpShAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:58:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696AA690299
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:58:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=COZlyMrs;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339278.1600459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUIu-0000ne-80; Tue, 16 Jun 2026 13:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339278.1600459; Tue, 16 Jun 2026 13:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUIu-0000lB-54; Tue, 16 Jun 2026 13:58:12 +0000
Received: by outflank-mailman (input) for mailman id 1339278;
 Tue, 16 Jun 2026 13:58:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZUIs-0000l4-2H
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:58:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUIr-004xfV-7Z
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:58:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a315666-bab6-0a2a0a5309dd-0a2a4506d3e0-40
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:58:08 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a315670-7371-0a2a45060019-d155802bc45a-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:58:08 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490cdae130cso22700495e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 06:58:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa8b423sm80652815e9.11.2026.06.16.06.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 06:58:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1781618288; x=1782223088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d+5CB+J1pjN9PgJGoFqYkJy3rWAogyHWzNI6LK9uwcM=;
        b=COZlyMrsxtH0EihuEEjAL/ZXhmZv4532ATqVXqFn9wqkAZxr1QsTlih/VNciwsD/yw
         Y1WgMPPl84zdT3+FDWAffI8njSlCVQwVODKe4SDMdCDauHxdSpxNYxo3v7I6Vp/8du2/
         zWwzlZ9Qkx9xNKwAfquL3o7oEoVugmU/sFq/fsmBI+8qddf0YiF/1SNP3uxxydJ6PYoN
         px1FfAjANpiH+EK2L65/KAFCA66ovRR8FYmDaUoILvgE/tzzvhgcv48hl9JcMtc292nP
         yd5YBKrNq7cN566/ODw7v3HkC8rUmR+4XCH4Zb+z434VCmaeAdryB2qd9eUpdyLw+JN+
         6vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618288; x=1782223088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+5CB+J1pjN9PgJGoFqYkJy3rWAogyHWzNI6LK9uwcM=;
        b=g1caLmFRmVhqGTdXfVo+z/zkk07EO01kVFL30/sxfyTvvQ2W9nu096xRaPA4rhTaQe
         atyRkLC5zKIKZdTpXGzufFV3MZPFzx/wJAd8znHaWrccoz+kiCF5KTlrUq0dL9ZcAxwe
         LDfcMvILEbzNKshWAIbCGL/1xjmVIZRfTNR3pZxmKhSe95f+JF/xtDpF12aSRxi+MEJI
         DHjbP/gsFZk5dO85hgRq8RS2/wf1E9csPA8N6JYUALdZ9UhudzpA4nhJwWB733C35l60
         gokvLXH4VdKmgLGkVA6gKjHSZU+6EbIDSkIlw11xj3T5iEbSRLY8FHH1xbv6o3+d3wY5
         zmUA==
X-Forwarded-Encrypted: i=1; AFNElJ83YrZUCgsH+oEzrpwWcXQ3JtuTNIYvM7DmwIvQIXSmah9o2eKa0eNcm/NKjTrBTKqIDEu00jKGnUk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9Vir31JtBVGvJos6oiFlTPtMJkjZnYslmFTYKD3GrVlJYoyhU
	3B4mCRNIs8/VV2Pf88ygTaEnkdPZrbISSgG3r/hyyyjRG1gxGGdE0DABOTUatMRNew==
X-Gm-Gg: Acq92OETPp1Js/lKMVDxnOq5F8Iczf1DD1QZrlomYHDit9XBD9pyKMS9IHxOSshBq8k
	NfsPXvzGgQGhEKV/cYiraJRx9O8/eRnBqCfGd39FIP9UmYkXlWOllx0zTCbb9m6bYBorZ+jtPQJ
	Izu6ESXF/ysfRWPjdKW58R6uMEM36k8z33MR67Xzg7NJPW9gCVxAcdEu2uK6RFixsjr449Pce4o
	Li5UzFQIk997j1lb8n/Gf8DBMzAKDUsRY2c1O7rHpPmOEcq3sxGrMcf+hCz0lX1UX8iihy2yuqR
	h0HmEFVSQGu+ab1y1kBe4lsoP7zd+s/Plb8Ppsr0V1i/NSG9A2w+lts9ll8Gz6MNPbvF2+X/hiy
	WHWN/aEDVeYKzQR4pKA4Ui2XS91Z3IIONej8wNpkQ8FXxZyGLpTqzVDdLRiB365NUhoSv8sMvrj
	yKkE3T0jUYx7rnYmvdI1dzfltSHS6X7efL6MQ9D3i/xHTX3tO/wBXT4i0RoH8w9wQVU8R+YChky
	4S+McZGo7IMGzc=
X-Received: by 2002:a05:600c:47d1:b0:490:e170:b7ee with SMTP id 5b1f17b1804b1-492200c04c0mr133213055e9.17.1781618288204;
        Tue, 16 Jun 2026 06:58:08 -0700 (PDT)
Message-ID: <7c618dca-18e2-4c9c-8bb3-02452099623e@suse.com>
Date: Tue, 16 Jun 2026 15:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] common: Track latest pCPU that ran the vCPU
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1776259594.git.teddy.astie@vates.tech>
 <f127344e083d224d2203b83c701375ca15e6368b.1776259594.git.teddy.astie@vates.tech>
 <a191bebd-aa7a-46e4-b3f2-a7a93c389480@suse.com>
 <1777976230.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373@vates.tech>
 <0b311682-9633-4aa0-8067-534456c7b848@suse.com>
 <1781617584.8631fc262581453bbf619ec5b2062170.19ed0aee98a000701b@vates.tech>
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
In-Reply-To: <1781617584.8631fc262581453bbf619ec5b2062170.19ed0aee98a000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781618288-8576FD75-65153D46/0/0
X-purgate-type: clean
X-purgate-size: 3108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 696AA690299

On 16.06.2026 15:46, Teddy Astie wrote:
> Le 05/05/2026 à 12:32, Jan Beulich a écrit :
>> On 05.05.2026 12:17, Teddy Astie wrote:
>>> Le 04/05/2026 à 17:51, Jan Beulich a écrit :
>>>> On 15.04.2026 15:32, Teddy Astie wrote:
>>>>> Track on which pCPU each vCPU of a domain ran. This will
>>>>> be used to know whether a TLB flush is required or not
>>>>> when the vCPU is migrated on another pCPU.
>>>>
>>>> Somewhat related tracking already exists - see the dirty_cpumask field.
>>>
>>> I've seen it, but I'm not sure how it can be leveraged here.
>>>
>>> I will try to take a closer look if that could be used instead.
>>>
>>>> But what title and description say doesn't match ...
>>>>
>>>>> @@ -977,6 +978,8 @@ void asmlinkage svm_vmenter_helper(void)
>>>>>    
>>>>>        svm_sync_vmcb(curr, vmcb_needs_vmsave);
>>>>>    
>>>>> +    curr->domain->latest_vcpu[cpu] = curr->vcpu_id;
>>>>
>>>> ... the implementation anyway: You track which vCPU last ran on a given
>>>> pCPU. Since the same pCPU may have run multiple vCPU-s which then weren't
>>>> scheduled again, you lose data afaict.
>>>>
>>>
>>> I mixed up the wording. But the implementation is the proper intent.
>>>
>>> It's more
>>>
>>>     Track which vCPU of the domain each pCPU ran.
>>
>> Okay, yet then (as already pointed out) how do you know vCPU0 ran last on
>> a given pCPU if after its de-scheduling vCPU1 (of the same domain) was
>> put there. Your track record (after de-scheduling vCPU1) will say only
>> vCPU1; information on vCPU0 will be lost. Yet then, as also indicated,
>> it's not quite clear to me how exactly you mean to leverage this tracking.
> 
> The idea is to know which vCPU of the domain the pCPU ASID is holding. 

I fear don't understand this, in particular since you also say ...

> Hence, we need to know which was the latest running vCPU of the domain 
> on a per pCPU basis (now that each domain has it's own unique ASID, and 
> each pCPU has its own TLB).
> 
> Intermediate vCPUs are not useful, given that the TLB is expected to be 
> flushed when switching vCPUs of a same domain (as they share the same ASID).

... this: If they all use the same ASID, why would any tracking be needed?

> So overall, we flush the TLB when either :
> - switching betweens vCPU of a same domain on a single pCPU
> - the vCPU was previously ran elsewhere (this is dealt in patch 3 
> through old_cpu != new_cpu check in sched_unit_migrate_finish())

Luckily this is better understandable.

> I think the commit description is lacking the "last vCPU" idea.
> 
> Would this be better ? :
> 
> Introduce last_vcpu which maps each pCPU to the latest vCPU that ran on 
> it. This will be used to know whether a TLB flush is required or not
> when the pCPU TLB doesn't hold this vCPU state anymore.

Before we settle on any wording, I think it needs to become clear why /
whether such tracking is really needed. It feels fragile to say the
least. Might be best to start with flushing in too many cases, and only
later see about optimizing things.

Jan

