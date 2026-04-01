Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMv3OjnTzGlFWwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:11:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924D376871
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269858.1558732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qfV-0004EO-JH; Wed, 01 Apr 2026 08:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269858.1558732; Wed, 01 Apr 2026 08:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qfV-0004CV-GX; Wed, 01 Apr 2026 08:11:17 +0000
Received: by outflank-mailman (input) for mailman id 1269858;
 Wed, 01 Apr 2026 08:11:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7qfT-0004CP-Ps
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:11:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7qfR-000WZI-5y
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 10:11:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccd2f8-2eae-0a2a0a5409dd-0a2a45088496-46
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:11:14 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ccd322-fab6-0a2a45080019-d1558033d156-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:11:14 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so80899885e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:11:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c7510d3sm49049345e9.5.2026.04.01.01.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 01:11:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1775031074; x=1775635874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5w+WmLob+2xlITweK4A5efrKFyu7+9IJMRP/UeTyNVI=;
        b=IO6cLc4ym/G66/j04oM0fsyNBVONBmND/OZ2/DgPTptubqM/5tIIhcFC/qj+VCBe3v
         1CZiQidVy+pNuVaFP+NquwNE88YYDXSDnoSOiJVVls6UpdKZFwIU1bc7L4nDNbVjyz37
         COFh4nblJkiP6IBFt0EHKmA91d2ZZlxEskVdfKVIXw8/i1jVVf+k8ztZqZcooU81qcai
         c6Ho+qRa7AsvuEiDF7nXAtsy0TOYNUxpvl7l279WV3i3nGFZDRX5KB1gjEqOQn9bKRcn
         tiyTpfMuU5TVGgrEhnL1w34/LfaGhAEvvPWQ+H2oaYLRzDsIHta3QKu8oDZYuz9YoPNa
         IyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775031074; x=1775635874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w+WmLob+2xlITweK4A5efrKFyu7+9IJMRP/UeTyNVI=;
        b=Svk5YLIRAKyYtNLCu0TIbHh4roNrYXCXQFP30+x95aL14kigHUse/Aeu5a+bTyQXOG
         WoJ2NYCgHDYZ7BXheY8iakon3qpKJxyyZVNHLlpUEx/BdaJNEt1I9SlxlS3qrTqC3JM1
         iA1w2AvujIvPUlDhgNipB1a0tj3Ewoyukjexyr1xYO/J+Uw6tuZPc0cp3q2VX5ZTghmq
         YkPmbtWCG1CCw3x6sacaoySU441HNVAl+kfJ1PtduC6izUhwZkA9BbKcpPUYk5ioe2Jj
         zJk4of8KX4XlJOX6gpJ8d5rY4jKEIGSfJbKF7aMCTbBSMidQ4H+rP8b+5CAPocr2YZH7
         WNgg==
X-Gm-Message-State: AOJu0Yz9fs+sKPFOYqGG2eN6yKwjK9ErNwtbk4R79G53dBQtBxXxG0UX
	6XaXR8TFplWD1QwIOeucw2e6OfXd4bvCViJG5n1g5GKc2+xxw546HONklWUi9cXwcg==
X-Gm-Gg: ATEYQzz6wtdLOFrXj7z+KNBhqf6F1V9dJnqKPoUEVb37oiHTh3UmgtbXFz58OboAAKn
	hAicqIYOO8f+YrLj8T9XzFvO5QzcdIEcTDXN6af+JPRjslg3gWyt8JRAe35KxnWizAvIW7Lsyvq
	i74keqWmxJ24Kby5DkOFbAgM3CU+MPuu4FhNx5cOw2oyoHSs57btltVvJVfEWmvQlKwb8JAvk1t
	lnlTXETZ3UrAnvk+TMGo/JI50B2LtS97fOcOWXEeUWKyoohdqP3gTE7QQVduDFdTk4wiSf0sTmn
	AJjsR8cu6SORKU6UUGyPC+KbQZkw9oeLqVsji8M0EgiKAY68RNENvAs8n7nhYSiPKsWI6KMO1VB
	DCWEdnqvDiTgjc8VZG2K3ywNBBpEDnQ3oxVWvhXdP6jsMVbsAw5OePmBil7CDLOoctrsRIWhUGn
	hHU+V2U23XVSgupY1jTJehXtKCJp5GoBa0Ir4WlBq5ilKdCy16Nu6Edb4xlhwLv9AEJ3YI/Ecwo
	NuT2BYT5aaGmXp2+QCvOj/PSA==
X-Received: by 2002:a05:600c:5303:b0:488:7f69:4abf with SMTP id 5b1f17b1804b1-488835675a6mr41681585e9.12.1775031073982;
        Wed, 01 Apr 2026 01:11:13 -0700 (PDT)
Message-ID: <6020226f-5e38-42f5-923e-2692d17bc4e9@suse.com>
Date: Wed, 1 Apr 2026 10:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <913f75e3-0039-4a7e-9884-7564c329557f@citrix.com>
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
In-Reply-To: <913f75e3-0039-4a7e-9884-7564c329557f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775031074-77348497-3A991F04/0/0
X-purgate-type: clean
X-purgate-size: 2559
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4924D376871
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 09:20, Andrew Cooper wrote:
> On 01/04/2026 9:14 am, Jan Beulich wrote:
>> On 27.03.2026 11:19, Marek Marczykowski-Górecki wrote:
>>> I noticed that on some systems, there are a lot of IOMMU faults after
>>> S3. I can see it also on a laptop with MTL, but it affects also the ADL
>>> gitlab runner:
>>>
>>>     https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
>>>     (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>>     (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>>     (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>>     (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>>
>>> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
>>>
>>> The issue is present only on staging, not staging-4.21.
>>>
>>> Bisect says:
>>>
>>> 5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
>>> commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
>>> Author: Jan Beulich <jbeulich@suse.com>
>>> Date:   Thu Jan 22 14:13:35 2026 +0100
>>>
>>>     x86/HPET: drop .set_affinity hook
>> Looking into this, I find several things I can't quite understand (yet).
>> First there is
>>
>> (XEN) [000000456c0fe39f] Disabling HPET for being unreliable
>>
>> which looks to only affect clocksource selection, but not use as
>> broadcast source for CPU-idle management. (This may be an independent
>> issue.)
>>
>> Then there is
>>
>> (XEN) [    2.760248] HPET: 8 timers usable for broadcast (8 total)
>>
>> which should only occur on ARAT-incapable systems. That should only be
>> older hardware.
> 
> I'm not sure that's a reasonable assertion to draw.  The number of HPET
> channels is down to the HPET alone, not anything to do with the CPU
> capabilities.

My statement was about the mere presence of that message, not the number
of channels that are reported.

>>  (On my much older Skylake I don't see this line, for
>> example.) What does CPUID leaf 6 have on this system? Sadly xen-cpuid
>> is purely featureset based, and hence doesn't expose info about that
>> leaf.
> 
> xen-cpuid -p
> 
> That will get you leaf 6, but there's no human-readable decode of it.

Raw numbers is good enough here. How did I miss that option when looking
at --help output? Oh, simply because it isn't shown there.

Marek, that'll be better than bare metal kernel data, as it gives us both
raw and host policies.

Jan

