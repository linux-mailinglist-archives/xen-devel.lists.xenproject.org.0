Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMQAJELbw2lwuQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:55:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF03325456
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262250.1554838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5NlY-0003as-4b; Wed, 25 Mar 2026 12:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262250.1554838; Wed, 25 Mar 2026 12:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5NlY-0003YI-1b; Wed, 25 Mar 2026 12:55:20 +0000
Received: by outflank-mailman (input) for mailman id 1262250;
 Wed, 25 Mar 2026 12:55:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5NlW-0003Xd-Of
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:55:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5NlW-004tIQ-4X
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:55:18 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3db2d-5cb7-0a2a0a5109dd-0a2a45049b9c-28
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:55:18 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3db35-c823-0a2a45040019-d1558034e97e-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:55:18 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-486fba7ce4cso23780265e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 05:55:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116f17f3sm123754005e9.1.2026.03.25.05.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 05:55:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1774443317; x=1775048117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oR28QN8+Eegb6HhdyO3GVPROtcEHLWwVpemo8dhr310=;
        b=ULvoizBodET5YDqgan504+BSaiIamkGn1+4QRcnkIoRHA8fRjuiL5M2qS1olyMnbOr
         jNgXJFJJ8pxmwpM8+gfZUiJMOngQinzsTWeo1hFkReOzDAz8A30CDJwWI+gd3LKOfJpv
         +tL66KOcmKEQqtkgoOfL+F9/Lf8RMXprzznSwGCgtuNVttnz41h1goHOZXIybi29k1wQ
         McEdEJcSlfGlZD84psZf3c4MSzrvpHg0INt3MlT9mkWdaTc9lGS4ipQvsumqtu1SBVFS
         vEmqvnLSDXcYySuTq2b8whxkopOP5dJ7S2SPpKdwTyz26skTq80/StD+Q9zoW/WcCi/I
         vrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443317; x=1775048117;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR28QN8+Eegb6HhdyO3GVPROtcEHLWwVpemo8dhr310=;
        b=Tx9e1qCWNq3NobCDmy+9eGv3Jh/rqHZ5jOBalyjVslgfWcd+p4rv5phPIoUsrYHeS6
         a9l27cAIW3zxNz7B5Xm2hE4XxqHyUtIzVTuCio1BZ83aMcb+cUpGeJYonx22kOA9TUwu
         SkKVqTTcaVgC/nHaCES3XtdeGB3qoQ1MRdrUYWIGyWvm4wDz0mo7tzqliF19RpldXlWi
         nYxhvNWwItJAqpXdbAugoKC/pNF61QPsmzWRPs6/l38iA0k4bpvzb+sKV5eq35WO1DWp
         sxaQSBvD467IzN1NSJTIA737O32B2bLkC2Rsp9Cwl09yuBLbRV+LP91n/yC6KElL5XSS
         NDMQ==
X-Gm-Message-State: AOJu0YxqOTbfUqWSIckIfTgf28dgDAoHvLFM4L4w4YElNr71FAbEGwEq
	mWED1Q1Osl356RG+UE852YnIiFa00/ei1no8OqpXTHcrlAQVWfr71/c4WnxCf91HVCrEZWj7xdf
	GZO/k3Q==
X-Gm-Gg: ATEYQzwLAXNl6mES3iQxO5carzsWU47GSSPRNhmM+w8G3BTOrcHSqUjrrNa6GOMS3Ou
	VlfSuPQ9Ro6Smk4ZtSIFKVEOtdi1M6qUgJyZYPHA0wxXQl0zXb3PoCxlGVMrvL0jt3bnNnuxwVX
	ITHW4Q0kUoaTnjedVC/1hvHDThqSC3nw4JdlF5ufhFnWDmlfrA/0tzcOoOp+coB2kmMsAGDyWWD
	f4sdFkwA9cB73CB8hYMNF8cSKS5D6yzGkEAt1GhAXx7b/Xi4uc8jlqHfyCMLNR6Sryd7XL3KAA2
	tKZN4RIyaBazQNCQSTaOYMwYdV5/+PzyM9p6zPjsde5I8kAAwGvmFTW6kG5LawB4CDtHP+LwswH
	+krxmioKhE2NiwXHNk/llDSQ9NWBx10lW3oC91yu4BXHSj0cuw9LXhbhq19ibhN2jHn/h+1gwNk
	dPlruDZ9ITz0MNEjEla3Xa+O8Dbz5PdkcgFyv8Wf3unsJ5lknxiQi8AlD7NSmZtk5pM8aLg7dev
	2QV0AqAFtA79QtrxYBt7R9LNQ==
X-Received: by 2002:a05:600c:3b12:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4871607a3c5mr56024565e9.25.1774443317484;
        Wed, 25 Mar 2026 05:55:17 -0700 (PDT)
Message-ID: <7829c799-64b2-4686-8895-6ec73231c5d8@suse.com>
Date: Wed, 25 Mar 2026 13:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] arinc653: avoid array overrun
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 Kamil Frankowicz <kamil.frankowicz@cert.pl>, Juergen Gross <jgross@suse.com>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
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
In-Reply-To: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774443318-1227B9D1-2EB0B1F5/0/0
X-purgate-type: clean
X-purgate-size: 1659
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:kamil.frankowicz@cert.pl,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ECF03325456
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Incrementing ->sched_index between bounds check and array access may
result in accessing one past the array when that is fully filled
(->num_schedule_entries == ARINC653_MAX_DOMAINS_PER_SCHEDULE).

Fixes: 22787f2e107c ("ARINC 653 scheduler")
Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Jürgen, provided I understood him correctly, suggests that something like

    while ( now >= sched_priv->next_switch_time )
    {
        sched_priv->sched_index++;
        ASSERT(sched_priv->sched_index < sched_priv->num_schedule_entries);
        sched_priv->next_switch_time +=
            sched_priv->schedule[sched_priv->sched_index].runtime;
    }

should also be valid to move to, due to constraints applied by
arinc653_sched_set(). I'm hesitant to make such a change though, not
really knowing the scheduler; the change here looks more obviously correct
to me. Albeit the Fixes: tag may thus want dropping.
---
v2: New.

--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -552,12 +552,9 @@ a653sched_do_schedule(
 
     /* Switch minor frame or find correct minor frame after a miss */
     while ( (now >= sched_priv->next_switch_time) &&
-        (sched_priv->sched_index < sched_priv->num_schedule_entries) )
-    {
-        sched_priv->sched_index++;
+            (++sched_priv->sched_index < sched_priv->num_schedule_entries) )
         sched_priv->next_switch_time +=
             sched_priv->schedule[sched_priv->sched_index].runtime;
-    }
 
     /*
      * If we exhausted the domains in the schedule and still have time left


