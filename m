Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG+kOqyg+GkgxQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:35:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB034BDF12
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299927.1574487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtSD-0002sS-PG; Mon, 04 May 2026 13:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299927.1574487; Mon, 04 May 2026 13:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtSD-0002qP-MV; Mon, 04 May 2026 13:35:21 +0000
Received: by outflank-mailman (input) for mailman id 1299927;
 Mon, 04 May 2026 13:35:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJtSC-0002qJ-NM
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 13:35:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJtSB-00993s-Ro
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:35:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8a090-2eae-0a2a0a5409dd-0a2a450b9c14-46
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:35:19 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8a097-212f-0a2a450b0019-d155dd31c069-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:35:19 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43d7badbd7dso1844507f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 06:35:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a981ded99sm26669965f8f.18.2026.05.04.06.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 06:35:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1777901719; x=1778506519; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7gSJuGpSdqYwflAgAB1ocz08ydzzTqCwQ7xCeAzakzw=;
        b=PJD4VzPFuAoLQZCmN9IZoS0wcK/WFRUqBKd+aHRBHRFipUvJIYXHAGL+dyY6mCBCar
         eP2nPJxFV9bR7TeZLvcKK5AXB5aF017RDEdLFspTVWV5m78tMbAOae3/qNDLU05U/osw
         bFd0DTRhQr3NMK7hkaoutB+eXnrug3T3ax9NWnyR4mV4M5ygZUyE25TsNmh3qudNUi3Y
         xT1K/kIuod+V/XriOzSh7mywLofknxBMr5RdvNui/I9oNqdXxMvSrX2cM6vkKHmuPMJw
         NhpvZoVYTsVLup0gaNC3dcasoMoouwoPZVSh6Wx2ICzjnwTGpallC1TtmzAyV02pyXkz
         tBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901719; x=1778506519;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gSJuGpSdqYwflAgAB1ocz08ydzzTqCwQ7xCeAzakzw=;
        b=UegSDvmiC+UtMvEWLNVDaPhJfIJtgJX5l8TdqRoE6QS5z7sOMT4sbOXYX/NKTK571m
         qCHi55r1ajpRdVqm0AIiwwBbGtWA1UIc4mETbovdKdFO1EFTu/n6O3GSDGN1zKB+IbIB
         q6kH8tiyaFX+RQ+u2Gr7IGXK+mOi5NnobgQsH0qfhfdoKgq39XF7SVi213OxFliD8G4t
         lXk+Y4zpBJwrQTKTJSWQ4PK8QW4CxkZtWPJ0GitnYCN422GGPdxMwx8QBOddDTJ/BPN5
         jpHH77woROoNT5oChP4ubHPFwI4ibUJgSskOxZS4ezB4OndzRJTQKxfbIUKFZWY7v4h+
         xHOA==
X-Forwarded-Encrypted: i=1; AFNElJ/vV5x/8dWP7IW+OArHNxZAA0BL+AG0jxhDorG1wBSaIeqMevXJoflmaoZAgzJ+DKd97yXVjTe0YQQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGa8eGBOOSaYLxGLph0XZZ9QQuXzq8veB8apS2pgjNM/uySE0i
	ayrFFrVvNnhp49pB+k57fHavMEMSHpXybuVuPBgAAEeDnmzJSZXrJeRCwDCrpwPwfQ==
X-Gm-Gg: AeBDievZrE5a0v2g77s9VYNNmm4laR0m4yl8EpD/NM1DYrTZp60BR3fJaQdakfv0up5
	pjiI7icRR2iUVW3RT8GSMcjxi6h0DR+/GuCt0AXWy78zJzNrQZufs8C6rDBTbLE0Uj7VnMvULFI
	U5w0gGbSpuqGo5k2kpwcak5AbwnQc8g7Oo2GfrnYwrHhmRjcEjzhdmfmsTwJOH+/apdtnPe5d/k
	eojCREkVS+rr+Vip1LQ4E1hsPHBsO27uHy4XOFP6+/PatcoE6+oGF0aA+c2MHfA9fh4brcaq1J6
	Q4zNRCoMxJoYcHxJB2bbXR/emZKuYwBJD9/s7jquFzDrr9/ki9BCWVUjFGvst3lJvB6DTknVuQo
	X4z4VgVRGNWxR10Bgwu73ijptdkVngN5m2rL6gTN8CSC8W4ry0HBtigVAFMbvQ2A7ZNlypwRJZt
	XjyeLA2Q6H0oxXYfNMEHNLycc2jk7f1Dry7ZqMy7spkLq20HTm4YfQyEEA9J/4B9wZ05HBIU3G8
	DgKpi3xkMJXEM5Ebq9m6hpJeA==
X-Received: by 2002:a05:6000:24c9:b0:43d:21a:9a3e with SMTP id ffacd0b85a97d-44bb65dfc18mr15115451f8f.32.1777901717935;
        Mon, 04 May 2026 06:35:17 -0700 (PDT)
Message-ID: <23c6c675-70fd-415d-9b3e-6af68258f32d@suse.com>
Date: Mon, 4 May 2026 15:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] hvm/ioreq: Negotiate extended destination ID
 support per ioreq server
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373@vates.tech>
 <1777394145.8631fc262581453bbf619ec5b2062170.19dd4f256ec000f373@vates.tech>
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
In-Reply-To: <1777394145.8631fc262581453bbf619ec5b2062170.19dd4f256ec000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1777901719-246B7F3B-6C0DFED6/0/0
X-purgate-type: clean
X-purgate-size: 3236
X-Rspamd-Queue-Id: 4CB034BDF12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 28.04.2026 18:35, Teddy Astie wrote:
> Le 27/04/2026 à 15:57, Julian Vetter a écrit :
>> Add a per-server capability flag in XEN_DMOP_create_ioreq_server to
>> signal extended destination ID support. Repurpose the first byte of the
>> existing pad[3] as a flags field, and define
>> XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID (bit 0) for a server to signal it will
>> use XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings.
>>
>> Track the flag in struct ioreq_server ext_dest_id.
>> hvm_ext_dest_id_enabled() returns true only if all registered ioreq
>> servers have opted in and at least one server is present. A single
>> server without the flag is sufficient to suppress the feature.
>>
>> Lock the feature at domain creation time:
>> arch_domain_creation_finished() computes the levelled result into struct
>> hvm_domain.ext_dest_id using OR to preserve any value previously
>> restored from an HVM save record. After creation_finished,
>> arch_ioreq_server_create_check() rejects new servers that lack
>> XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID if the feature was already advertised
>> to the guest.
>>
>> Persist the locked state in a new HVM_SAVE_TYPE(EXT_DEST_ID) record so
>> that migration preserves the guest-visible CPUID bit independently of
>> when the device model re-registers its ioreq servers on the destination
>> host.
>>
>> On restore, ioapic_check() uses d->arch.hvm.ext_dest_id (restored from
>> the EXT_DEST_ID record) rather than the per-server dynamic check, since
>> the DM has not yet re-registered its servers at that point.
>>
>> Update xendevicemodel_create_ioreq_server() in libxendevicemodel to
>> accept the new flags parameter, remove
>> xendevicemodel_enable_ext_dest_id(), and fix the
>> xc_hvm_create_ioreq_server() compat wrapper to pass zero flags.
>>
>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> 
> That has somewhat already being discussed previously, but AFAIU, 
> extended destination ID is only meaningful when guest APIC IDs cannot be 
> represented with the "non-extended" model which can only happen in 
> practice when having more than 128 vCPUs in the guest.

As Andrew has been pointing out many times, we need to stop thinking in
terms of 128 vCPU-s being the limit because of the vCPU ID times 2
calculation for the APIC IDs. With a non-HT topology, more than 128
vCPU-s would already be possible from an APIC ID perspective. Hence
tying "extended dest ID" to the vCPU count is unlikely to be viable.

Jan

> I don't think we need to check for device model support unless the guest 
> can have more than 128 vCPUs, where in such case it becomes mandatory 
> (unless some form of interrupt remapping is implemented).
> 
> So I would rather check if domain->max_vcpus is more than 128 and 
> require device models to implement support for extended destination ID 
> in these cases.
> 
> In some way, that would imply that extended destination ID is only 
> exposed to guests with domain->max_vcpus > 128.
> 
> Overall, what I propose would be to keep the new 
> XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID flag, and if d->max_vcpus > 128, we 
> require the device model to support XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID.

