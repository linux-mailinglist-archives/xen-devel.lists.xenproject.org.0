Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P10G1QM+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:39:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D309C4D8BD3
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301442.1575727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYit-0000Jq-0H; Wed, 06 May 2026 09:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301442.1575727; Wed, 06 May 2026 09:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYis-0000HF-Tr; Wed, 06 May 2026 09:39:18 +0000
Received: by outflank-mailman (input) for mailman id 1301442;
 Wed, 06 May 2026 09:39:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKYir-0000H7-GX
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:39:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYip-006i3W-89
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:39:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0c3d-e002-0a2a0a5209dd-0a2a4503b96a-30
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:39:16 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0c44-672d-0a2a45030019-d155dd2ccc04-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:39:16 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-44ce78ab5feso3208057f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 02:39:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4505285e765sm10674542f8f.10.2026.05.06.02.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 02:39:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778060356; x=1778665156; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRUizBZBPM7JIs2noSMewmz96/l/sOpqrXyce+FBBmM=;
        b=KuKDMWkvSLFrEG/lS+3JMWYatXR9R3K/bHp1DpxL9Af+nsf/Az0OzsU4PVl2MOzFsQ
         N0/U7FsORoXA+FqlgWZXVq4qf+YRG12WN7BOzMPSZlJmsX8XhhLEhYBHhxv+tXnefUAx
         t94C7nXPICd6jBEmAgbS6oZd4B8NNk3WSboH0OJUTMdlu+/D6uDt6Zo1Ade6i5Z8Caxk
         /y1DQy2AZBVXryy02KPoY33yfrF9zj9Wd96q6igrg4cQB+F2cg34isOEZO2T/rO1S9sE
         v9cDFYUTCfu9+OqI2abjToVW+5R9JVEBJcYVXE0tm3RVfHQfGDi5ri1cQXt946rAVeGJ
         wOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060356; x=1778665156;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRUizBZBPM7JIs2noSMewmz96/l/sOpqrXyce+FBBmM=;
        b=daTtx04Wp9xRZKDMFL0IDChk1JNCXM2H+Yr9qw0vkGFYTohdqCW9VxhptoyrQFvaG4
         k5OxiO5KM2uvhQ3+GnyB0SqBwlNs/0jOYudLsP7x2SSXoBJy558pQz0rVavLOGXXiC8p
         Uo3sZHSxKdcJcW6dU0fgwWi4JL9yFHoaEoTRAdeCcbPZzy7y1rTkczxJ6K5knXrKOud0
         hDRLo+RdhwMNnLyc2jRxk8jE0ds5gqCbKdzrDeslBcfgYdmT9uC3GLSJEpVK+/Rnnb92
         /uDfCMR1y7QK3VzjC4YD2Lx5xaRfc33SM5sEcaFo/UwWCkY8UsP4JyiGVrdIqnlmV1+m
         RSYg==
X-Gm-Message-State: AOJu0YzQC1XhxG1eeFMB3dT0+YWvBTCo2bptITmrG9ZGcD2uOUMFydQP
	c4s/KLnlkqXPas4HMPysHlxj1b6RekWntxoF1kS0Oq8IBVwno0b4sRyP893qhcwk6cD10m9gxUz
	eISc=
X-Gm-Gg: AeBDievxodLDb2IZWdp4SyrIDFTrLd3/wIF9ezWdqJ7y04TpA2pTbj21tAH3yeEsw79
	CzG82OzDkbiqHAx1aORzJ85z/ZT8v/wc20Y4pJQhgAs8B+0ySl3FOxqpGU+ktsFWhoU2l3kQrYP
	ZxgMW0ukhIRnhZGNOR0qJB8rCsQkBFUUbn1GsWqwyasuRYdvrw74F17SkFXTPGuPPpI7eGjP8zo
	jV5GXRFUbJaKku6UO7NCQlPvSQste9dYQwTBREQNtIuUIuBplkkUEEVQWozKLEFP5Darx4uNqXP
	BpkT3rci7CAORTuishTus8HeT2O/mf0pm4dDkCqvhuhwRc3tci3omN6wnM4kkfP6ZnaYV39XJ6k
	057mF6Hr2rRKTXAyeep1t5/QfjdT4TJXJddgo8DxQvwzhiGW6IJHykmMgyJyE2pzjqq/AkItKJw
	MdjQHbjptlpIhq2lVbTv4vlUGHxsRyeFi4VB2Pn6tQLa9SALYXmnPXgeaEregVuDlMOViSYBcOe
	rPw5rRb9NYbX7Q7AZdDPxjbMw==
X-Received: by 2002:a5d:64e3:0:b0:449:cfea:ca91 with SMTP id ffacd0b85a97d-4515da96254mr4073067f8f.37.1778060355990;
        Wed, 06 May 2026 02:39:15 -0700 (PDT)
Message-ID: <1e23dd78-b246-4fc7-9e18-de8b0cd57721@suse.com>
Date: Wed, 6 May 2026 11:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] x86/time: set AP's TSC scale estimate earlier
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
X-purgate-ID: tlsNG-33051d/1778060356-3AB64938-CCE377A3/0/0
X-purgate-type: clean
X-purgate-size: 1998
X-Rspamd-Queue-Id: D309C4D8BD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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

NOW() (in particular) can be used ahead of init_percpu_time(). As the
initial scale value set is merely the BSP's, we can as well set it before
actually launching the AP. Don't introduce yet another notifier function
though; do this from smpboot.c's.

Setting the scale alone, however, doesn't work, so the entire struct
cpu_time is copied.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Copying the entire struct won't work very well when tsc_adjust[] is
     in use (and values there differ between sockets).

This in particular eliminates an anomaly with log messages issued early
while APs are coming up, when "boot" console timestamps are in use.

--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -21,6 +21,7 @@ mktime (unsigned int year, unsigned int
 int time_suspend(void);
 int time_resume(void);
 
+void preinit_percpu_time(unsigned int cpu);
 void init_percpu_time(void);
 void time_latch_stamps(void);
 
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1139,6 +1139,7 @@ static int cf_check cpu_smpboot_callback
     {
     case CPU_UP_PREPARE:
         rc = cpu_smpboot_alloc(cpu);
+        preinit_percpu_time(cpu);
         break;
     case CPU_UP_CANCELED:
     case CPU_DEAD:
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2346,6 +2346,12 @@ void time_latch_stamps(void)
     ap_bringup_ref.local_stime = get_s_time_fixed(ap_bringup_ref.local_tsc);
 }
 
+void preinit_percpu_time(unsigned int cpu)
+{
+    /* Initial estimate for TSC rate etc. */
+    per_cpu(cpu_time, cpu) = this_cpu(cpu_time);
+}
+
 void init_percpu_time(void)
 {
     struct cpu_time *t = &this_cpu(cpu_time);
@@ -2353,9 +2359,6 @@ void init_percpu_time(void)
     u64 tsc;
     s_time_t now;
 
-    /* Initial estimate for TSC rate. */
-    t->tsc_scale = per_cpu(cpu_time, 0).tsc_scale;
-
     if ( tsc_adjust )
     {
         unsigned int socket = cpu_to_socket(smp_processor_id());

