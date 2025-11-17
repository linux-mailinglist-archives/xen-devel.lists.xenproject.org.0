Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43FC64ABD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164093.1491107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0Nm-0007bP-7J; Mon, 17 Nov 2025 14:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164093.1491107; Mon, 17 Nov 2025 14:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0Nm-0007ZT-4U; Mon, 17 Nov 2025 14:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1164093;
 Mon, 17 Nov 2025 14:39:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL0Nk-0007Pr-9T
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:39:04 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29a8dfb7-c3c3-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 15:39:03 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so689584666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:39:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed9e9fsm1088716766b.69.2025.11.17.06.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:39:02 -0800 (PST)
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
X-Inumbo-ID: 29a8dfb7-c3c3-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763390343; x=1763995143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PS7ucokoN9+hEjFZSIghu/GmWjPiHcD6tMlnYOR0lq8=;
        b=bJZVdFIbSZ6PRmtK8h9XLY+dB/peLqr02IeKedxGLXKUdeaNLsp+QRvF+pdwrACxeK
         9khvSodbpdqYMHCcsvasUDtayCrjoqwyawb60Gzf9Tz/H1PX9OpUC3Kp5cj+xn2a5FxD
         9TBU0t+bgb8/Ep0G+crLAi5OoJl4UZMoCov8CALYp2SsvkguodZIcNGnsEYqAqEyOJzo
         ONgejAP7p5vj8NOiftC4BGQ6ZI7WhYmb3gZwsjCzzP1Vym5Rb6hwksH07AdXSoz2C1yY
         AXrDJCeW1eiGszQuvg51yKLEt8eL0ZMZEDIYY2hokSK4evSt5JMgrjyqn4R5Hff1Z64g
         fPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390343; x=1763995143;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS7ucokoN9+hEjFZSIghu/GmWjPiHcD6tMlnYOR0lq8=;
        b=BBMX2RanCnCpvA82Z91ECGr0Q6Rvjl+NjU1NwnPH0sp8DLmmXhJQ9sRl2US/ZLqHF6
         fsr7GDwJva/IPONpWNNMpmqJlZw+ZB997uOCYMiuO+oM3onSBanrVXPB9Fqmak/Zt/rh
         KrEWqhPWVgbPFY0vc9RPm5mX9ol1ckhwqTiDeR+fTF7PwNEHL8T/ra2rbmxVylCHxKa8
         TQ4WWGSI9o1fJRTMFCnltAKbC4bsC702ADXaS0jGFENNUqs2yqG5aVede6MztLPPnu2l
         rW5ngX1MapTEI+hM/wognl3sRa33B8gtoS1EBhkjvhVqPq+2VPaZ1DLKEAFRgA7BBKuV
         JFBw==
X-Gm-Message-State: AOJu0YyMMHDu1M9PItZTQWWOZ30/E+7DtSBr3Pq4sztDWlvaGJQZQ1sM
	C2EJT9dqPBX0cAf8U35Cqg7HZ/d34udq8VdqYZSwCzf3gBysp0nj7DXrfiEe+XP5z12+Gd09HOS
	tnmM=
X-Gm-Gg: ASbGncv8vSxCZhHRokOCHFzyXUfJMTr2F0SObXFhzzHXW67IA1hD0sLkQnY5KhPzJ63
	/4mkfQ7DhR42h44w9TmPvwmqY4RmZuqCcD5SDWHemxR4cccMj+y9HsJ/GJCs5HNVuG+/rynoQYr
	wPeFWQmKjGfcPV36Mx6qum+AoChEG9ANd1q5CqPmP1kHOhAGUHIXcVDt/GikxzIPJe3SeKPZjDd
	kISVI8I3tFskexoRRPvw7pLuWl2Hj+B+hxhN298yw2lu3QXAzlYOfmUu9NWcnRXOK91Eh3QsyTW
	qR5sRoWpO3DfzOL04SmGUNvbIs6uSflJDpdb767FNmAmqROxFyFrc4tXhvS6+YpljXvpbIH6VGd
	iK6VB/LwN3M4FhyH83mrk5Pl/q8JEVyYaxfp5ioL+sFSGgY+KPBmi76bAchM7oEGbjoC7V1Voeb
	BqMT/pMFzO9d3ZgQMb3yVkgZX7mlUwI/4aJhTyT9WnWC1PvHRRRSPYsuk4hoNHf2rujoreZakzh
	RmH1xfbtQIeGQ==
X-Google-Smtp-Source: AGHT+IFOmUSm8/z5jcH9NKrpV6ugry7nIt6vZyPsNVAxgbB2504wXZXC4U9rOEjTlGUoPaq/8BRDDA==
X-Received: by 2002:a17:907:940f:b0:b73:826a:9102 with SMTP id a640c23a62f3a-b73826a9b7emr889787466b.49.1763390342750;
        Mon, 17 Nov 2025 06:39:02 -0800 (PST)
Message-ID: <54dbc592-93a6-47bb-9304-14addd41610f@suse.com>
Date: Mon, 17 Nov 2025 15:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 5/8] x86/HPET: drop "long timeout" handling from
 reprogram_hpet_evt_channel()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
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
In-Reply-To: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Neither caller passes STIME_MAX, so (bogusly) handling the case isn't
necessary.

"Bogusly" because with 32-bit counters, writing 0 means on average half
the wrapping period until an interrupt would be raised, while of course
in extreme cases an interrupt would be raised almost right away.

Amends: aa42fc0e9cd9 ("cpuidle: remove hpet access in hpet_broadcast_exit")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Drop the code instead of adjusting it.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -162,13 +162,6 @@ static int reprogram_hpet_evt_channel(
 
     ch->next_event = expire;
 
-    if ( expire == STIME_MAX )
-    {
-        /* We assume it will take a long time for the timer to wrap. */
-        hpet_write32(0, HPET_Tn_CMP(ch->idx));
-        return 0;
-    }
-
     delta = min_t(int64_t, delta, MAX_DELTA_NS);
     delta = max_t(int64_t, delta, MIN_DELTA_NS);
     delta = ns2ticks(delta, ch->shift, ch->mult);


