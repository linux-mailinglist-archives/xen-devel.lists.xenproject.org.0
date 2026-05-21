Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP6XCY8hD2rPGAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:15:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C544B5A8193
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315342.1585144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ56n-00006d-5v; Thu, 21 May 2026 15:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315342.1585144; Thu, 21 May 2026 15:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ56n-000055-2D; Thu, 21 May 2026 15:14:49 +0000
Received: by outflank-mailman (input) for mailman id 1315342;
 Thu, 21 May 2026 15:14:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ56l-00004y-Cv
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:14:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ56k-003VwC-PF
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:14:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f215b-bab6-0a2a0a5309dd-0a2a4508b2d6-24
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:14:46 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f2166-63b5-0a2a45080019-d1558031a567-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:14:46 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so35865385e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:14:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903cadc125sm25992875e9.10.2026.05.21.08.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:14:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779376486; x=1779981286; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y1hFnFgf39MFXzRWVK0pT7fdnx6SUfADoHfPkVaztN4=;
        b=BPmVe9O+Z+l0zvrJLbvsBpSZ7XJk60KC2Nlk/MK2UxNtymz+LEIAXnmbg1Gkcb/eHk
         nAeSMF3IwN9nJ8m3/jNItByqW2IsEcitVoCWmwyl5/U7bKMSPR0akG0/Ue3c1HJ0ojFZ
         /cqGUSFoPgAJRWIvWZ7GK4M1WYVBtxSjJ++0TpXA+AT0FzyoKiUI0a9OtzCZc9i0AMa5
         GnvQAjrxEDCXrzA5sGP//CJ+Dr3OgcPYJRrtU7sdNe0474G++Q279oy+EWoVUhcwFUEB
         33IVoM55IgQzmIKCQ3DJw8vUX3dCcRRPULLyz45yguIswe8XX+4UDZyAFiMSzWkAXlEF
         dLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376486; x=1779981286;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1hFnFgf39MFXzRWVK0pT7fdnx6SUfADoHfPkVaztN4=;
        b=Z+TX3d0k3WTNiqRnuHNO2oD9BM0Sqr1BCqnCoMLGN2moLAZu/AdBNkWaqXuvAnV+Ei
         bgp9X6TWGoowtl2XV5ynTnv09Do83EpMlXM8PtUKlOFrWI+pXI+XiR8hEgQZMHWwhWqL
         8SLO27y6y8Iu7lRnlCLfzDzHGDhUrXxW9LlOr8L1qIJ8sUa0UYLr5jg1BHrtzRN0X3L+
         cTR4PLZkuy+bHFVZ11MEBSyG1IDz2Bev1GRv4x67VvE0LFt9rVWAiGbq1jepsgmfIfzT
         YQrsrRj8qefNXwG07x91vh59eBnbiZRbubIcp7oiEI+H3bL7PUsveqEgEyXT08L99Bmn
         1liw==
X-Gm-Message-State: AOJu0Yze1BLMeiNjybOu9auHk3O+ICQ/vQBoW3g0iNu+8PNmfCCyaDAi
	4gdh8a0ixSImd11R1zafEdbHFg0A4QPzZtKzWTbypg+ooHXFri1lknV28V1w1pE9aUt8ZrPSWD7
	JAJQ=
X-Gm-Gg: Acq92OGlEAYU2uZUwbVYq8ul+Q0lKCuubGpN2vyeAOPytOGYcG+EBFCAruh921VuXub
	tb40zB5MBIYaRqoMWMMe5AwXhrUafH8iATcQ1joowQqcCAWdpv1kzte53LEs+lD773lMiFSplVW
	NpzmjcXDqQGibUW/nutKuha2/qryToEeFXUIfYRh1ngchLsOgH8G6fl6Mcc6AoK6iBKYq+fzXef
	EuNEn2Gj0AGgRLfegEpprncxwXbuV0/JbZnHPtK353IihXSFr/2PMdlHqAOQe5AegvJ06XGKMvV
	DC8ut0fjbCyuRsOJGxIxuliK1lpxh+RZhnZQ70uJiJo39xmXNsOP3NCFDZWLOQKt2H8VtYBkP7K
	uOpu6rdDJamEQiWcGeHDFTJQz4NojFwXUmr1rrsQC0Q8cJHT/nMg552Yn1zofrZmIgKItK9mBoh
	vYlE1pFjinZK4Lv1wqv1sGt5tskVXSUI8T0Gc2hi/8kRadjQufa4/BOtJk58B/qLrp5bsXYaubI
	K7Rjcbv9k+yUEE=
X-Received: by 2002:a05:600c:1f87:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-4903cf08f14mr21717005e9.13.1779376486045;
        Thu, 21 May 2026 08:14:46 -0700 (PDT)
Message-ID: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
Date: Thu, 21 May 2026 17:14:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86: Misra rule 13.6
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779376486-BC766DB1-ED520447/0/0
X-purgate-type: clean
X-purgate-size: 319
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,gitlab.com:url];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C544B5A8193
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

1: shadow: split get_unsafe() invocations
2: shadow: avoid sizeof(this_cpu(...))
3: P2M: split a read_atomic() invocation
4: PV: split a get_unsafe() invocation

This takes care of all 77(?) violations of this rule, according to
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2543797752.

Jan

