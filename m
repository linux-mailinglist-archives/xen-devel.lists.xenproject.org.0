Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDRGMzjb1GlxyAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:23:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371153ACC24
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274828.1560806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3aV-0005C1-Sf; Tue, 07 Apr 2026 10:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274828.1560806; Tue, 07 Apr 2026 10:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3aV-00059b-Pa; Tue, 07 Apr 2026 10:23:15 +0000
Received: by outflank-mailman (input) for mailman id 1274828;
 Tue, 07 Apr 2026 10:23:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA3aU-00059V-LL
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:23:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3aU-00BZBi-14
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:23:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4db11-bab6-0a2a0a5309dd-0a2a450588ea-2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:23:13 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4db10-3760-0a2a45050019-d155dd2ce9cf-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:23:12 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43b95e5b3afso2664464f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 03:23:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e221bsm46894874f8f.29.2026.04.07.03.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 03:23:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775557392; x=1776162192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bHSig4Hoxd+ZX3I0CuB/SjgWOVwWBZL8gCIn3vdZqYQ=;
        b=S1ke6x6/TihEquWZ0ZBBUay6EntJPWTSckw4HqMDHIHk5gzCHsuYHhpSsbWOQdeyLx
         Tu657XSN/gJ8iPjNcbbWkjuZ41i3W5pEl4/uE+OUV3lDAyWUDMbXCnHp9PPkYIKtNVi6
         iIjhDsEAl0hpDCjjX6uY9/e+32jPgVjeoDzVCpKjfbFSBOVkKJtwGhDO5Gb8MrQn+3h/
         P1tUhjRIa1gh8ZkroJDWH+MbLuU5itfIAVkvTO5qLp4lZaAzHSvdOX3wXl38tf4ygp5E
         /XHZyDhWYEIN22fLIen0YzEYw45vzp1PLbltGDi9HDKkcXU8U4vi6lKvjQQ9z9MaOwEh
         fDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557392; x=1776162192;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHSig4Hoxd+ZX3I0CuB/SjgWOVwWBZL8gCIn3vdZqYQ=;
        b=c6C7OUhF/oFJ/yWg7OWojD7T/ylxADxScqbyAbEAZnhpxRjRiMrPdDcyFk1JrZCMQ7
         uWR9lVl8AhyAPRO1J6ytkDOpWNHQjxi6EEkstEdkfn6ukSn7s11aDNTEUAuzTQk4Od2f
         vq5d7B5+qRN4uTAMeoh1YnFxzuKPdGU2mQQUujbZ107FZd9W3ovsoVOymJ1okmo8WEIj
         k0k+YtVgPSmJeers8/2b1bi+5YgPMjgTFfqBBL/tTDQ5InKLsVimvNtjb0Q667lkCz/6
         A9kgOh0TM9GaPa18u+xfpVnZvTey9SdDlhhd6DMuLt8EsHM7hDBRw9C8CMStybVEirxi
         EWng==
X-Gm-Message-State: AOJu0YzfDQzT3XFyoVORbYjkFFgz5Lxeok927yhPm4g4PNeeZC8xukka
	p5IxewOhO/GVDepsZA9/qS4ZQEOfUvkkYKUAJ+JPD1/prhim2cRsKz1W7chg6seREUDPUH1TXbL
	FdNxCdg==
X-Gm-Gg: AeBDietWZF0AJdbGErIHruk8nnwQjEnFreKueGVu98FMkHHMOgXegQmyX6uKnIAKRDM
	RXyumUz3b123OmVGwmP64KgXb//zUIGlKEdJrIW/JnpoJyFuTr7Kh9yRCzhRNqjtwllkNZk+cmA
	9+nD5rsmbEHL4rSumdGhjKIaVcRk9GzBvxJEVEDLTbN3lElWmq3ONqt6cLvMZxbEEGoVCBESNXy
	hBJrb+gYaZqq15iQ7tQqeZ3sxNTOOXNo6GFIrSANv1UiNc/VT+87FMiX0KWGs/omB3p4k5LFhW7
	alEL6KBKGnktGXxlTHHjEE6JAztjHUQ9vl9b1PgKruv5C9fUn0lO45wWEzO0QI1yKU5Cje49kr8
	XMXJTe2L1xr2WUy0kAh86Ani1uaOLTBs7GlGkt3JhPT621HJDTsxbYN84QNmofUblZjAfeWqpFg
	bWBOKGJL/JHAG8kzQEn53DeLwn3rklz/JpMsJ0wUf2858Bk0G69M0TfvDXOlsGb96alhHR97fgR
	huHeM7ysWDeGc4=
X-Received: by 2002:a05:6000:2485:b0:43d:1c49:ce35 with SMTP id ffacd0b85a97d-43d29269f62mr22747594f8f.3.1775557392319;
        Tue, 07 Apr 2026 03:23:12 -0700 (PDT)
Message-ID: <8c9e5404-24bf-410d-a2e8-551cb87c6400@suse.com>
Date: Tue, 7 Apr 2026 12:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com> <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com> <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com> <ac44SVW1cPhKYFKU@mail-itl>
 <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com> <ac6Bg21hMLBRDNdm@mail-itl>
 <92e0151b-3fb1-4108-9788-f0fbac43512b@suse.com> <ac72dp3yEHikJzw2@mail-itl>
 <47b140b2-596b-47db-9c0c-43672f445036@suse.com>
Content-Language: en-US
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
In-Reply-To: <47b140b2-596b-47db-9c0c-43672f445036@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775557392-2272296F-229F0C6D/0/0
X-purgate-type: clean
X-purgate-size: 4004
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 371153ACC24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 08:29, Jan Beulich wrote:
> On 03.04.2026 01:06, Marek Marczykowski-Górecki wrote:
>> On Thu, Apr 02, 2026 at 04:53:31PM +0200, Jan Beulich wrote:
>>> Sadly you now log the low halves of HPET_Tn_ROUTE twice, while you don't log
>>> the high halves at all.
>>
>> I was missing hpet_read32 there...
>>
>> Updated:
>> (XEN) [  116.921573] Entering ACPI S3 state.
>> (XEN) [18446743895.088893] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>> (XEN) [18446743895.088907] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
>> (XEN) [18446743895.088918] _disable_pit_irq:2662: init: 0
>> (XEN) [18446743895.088928] hpet_broadcast_resume:662: hpet_events: ffff83046bc1f080
>> (XEN) [18446743895.089072] hpet_broadcast_resume:673: num_hpets_used: 8
>> (XEN) [18446743895.089081] hpet_broadcast_resume:691: cfg: 0x1
>> (XEN) [18446743895.089092] hpet_broadcast_resume:696: i:0, hpet_events[i].msi.irq: 122, hpet_events[i].flags: 0
>> (XEN) [18446743895.089122] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
>> (XEN) [18446743895.089132] hpet_broadcast_resume:700: i:0, __hpet_setup_msi_irq ret: 0
>> (XEN) [18446743895.089168] hpet_broadcast_resume:710: i:0, cfg: 0xc134, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xf18
> 
> Okay, this would appear to clarify that the address really isn't correct. Yet I'm
> confused now by the low half values: In your earlier log there was
> 
> hpet_broadcast_resume:710: i:0, cfg: 0xc134, HPET_Tn_ROUTE(hpet_events[i].idx): 0x110
> 
> and alike, i.e. clearly a non-zero value. Now all low halves are zero. I'll try
> to figure how the logged values here could result, but consistent data (or an
> explantation for the apparent inconsistency) would help.

Could you give the patch below a try?

Jan

x86/HPET: channel handling in hpet_broadcast_resume()

The per-channel ENABLE bit is to solely be driven by hpet_enable_channel()
and hpet_msi_{,un}mask(). It doesn't need setting immediately. Except for
the (possible) channel put in legacy mode we don't do so during boot
either.

Instead reset ->arch.cpu_mask, to avoid msi_compose_msg() yielding an
all-zero message (when the passed in CPU mask has no online CPUs). Nothing
would later call msi_compose_msg() / hpet_msi_write(), and hence nothing
would later produce a well-formed message template in
hpet_events[].msi.msg.

Fixes: 15aa6c67486c ("amd iommu: use base platform MSI implementation")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As to the Fixes: tag: The issue for the HPET resume case is the
cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) check in
msi_compose_msg(). The earlier cpumask_empty() wasn't a problem, as
cpu_mask_to_apicid() returning a bogus (offline) value didn't have any bad
effect: Before use, a valid destination would have been put in place, but
other parts of .msg were properly set up. Furthermore we also didn't clear
the entire message prior to that change.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -685,12 +685,18 @@ void hpet_broadcast_resume(void)
     for ( i = 0; i < n; i++ )
     {
         if ( hpet_events[i].msi.irq >= 0 )
+        {
+            struct irq_desc *desc = irq_to_desc(hpet_events[i].msi.irq);
+
+            cpumask_copy(desc->arch.cpu_mask, cpumask_of(smp_processor_id()));
+
             __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].msi.irq));
+        }
 
         /* set HPET Tn as oneshot */
         cfg = hpet_read32(HPET_Tn_CFG(hpet_events[i].idx));
         cfg &= ~(HPET_TN_LEVEL | HPET_TN_PERIODIC);
-        cfg |= HPET_TN_ENABLE | HPET_TN_32BIT;
+        cfg |= HPET_TN_32BIT;
         if ( !(hpet_events[i].flags & HPET_EVT_LEGACY) )
             cfg |= HPET_TN_FSB;
         hpet_write32(cfg, HPET_Tn_CFG(hpet_events[i].idx));


