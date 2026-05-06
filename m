Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKOINBoL+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:34:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091644D8AB8
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301415.1575700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYdl-0006qs-UX; Wed, 06 May 2026 09:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301415.1575700; Wed, 06 May 2026 09:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYdl-0006p9-Rh; Wed, 06 May 2026 09:34:01 +0000
Received: by outflank-mailman (input) for mailman id 1301415;
 Wed, 06 May 2026 09:34:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKYdk-0006p3-3Y
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:34:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYdh-006gnA-BA
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:33:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0b00-e002-0a2a0a5209dd-0a2a4502a5d4-20
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:33:58 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0b06-af86-0a2a45020019-d1558036f09f-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:33:58 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488d2079582so64398205e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 02:33:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e530c5dfcsm12453875e9.14.2026.05.06.02.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 02:33:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1778060038; x=1778664838; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXWNMrUVa51sas0XdmNTrZim2kn1qfg9gibF1kA5Jxo=;
        b=GGBhialxe+IXQrfh1nPzkX5U/hlmlRX/SarraT/IJpYxJCcYiX5XObT0Nu4Z5RFnVt
         How1ElnPnhGHtAtay6bcNCy16xTSVwA3T2a7skzcLw0yjh+1WuXmd6dXkS3C43sJMZnT
         q2nt48fDB+GRCeewQ6OYYdiwe/NRZCncRiB2XfS3wBfzTsF9kCKRPSdh6Hm5wzwvA+cb
         jLYQ4LuDhJVCrFd7l5DUfNXIcFDCXYheOhY3POEq7C89rt+9V5SQ3q9pr1TXWlKXU6HF
         +mTtkNlpiwcx4b8XeXiMI37IyS+dvNSHW32/ZTVSP8TGRMEoJETiPuN6ut0EYYCpagog
         j0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060038; x=1778664838;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXWNMrUVa51sas0XdmNTrZim2kn1qfg9gibF1kA5Jxo=;
        b=jQNn1s1/mZxLb/tKkwLVUzSitIkVJzN24yuYgUFvzfXPZX9C87x19JMFyjYyn4Fien
         Oqea7+MsXfxPwTaQ8AJDQtQn8CtpTkV5gJjZVIZ+KjNGjisl/jT5vsT3zXpOc/mGxPiW
         DoBVN5SUIfspLQ00XK/IX3wUdMqLK/gz5lwQaGPdCaxv6xYVDyMJKCHwx13t115DnxuK
         eD9yhX2uIrlGD03lXtudUDjKpovGR10lO/xEN9SV3g4YfI4LbdK0royXWSTLkGFqA5vC
         c0oDIUpopFweadIxdtQ3oVUortxhZMktoReVOFrx3XtDZYKp8SRyT3CyaoP3GC7Ou+1d
         XlPA==
X-Gm-Message-State: AOJu0Yx5GXz8LQ7r/WSPPy+ZGE778stsg4jTZr+cmXxQPro3TSTfPo2v
	3UW30wLl9AO2twujLqNx9bzohIkxQRTWHM1AIvCKhtcMdyop9wBhm1y35v8209yToes5NGVkxuj
	8buE=
X-Gm-Gg: AeBDieu1nvkbbl31Vc/Yh2VxMboO3tT1cwWY1H8/LMdt7ZYgNToMGgIs1+OBAATXhvq
	eOMuJ2ZB9V54o4t4tYq8U13zwZY1vaGpl9qvzGoTto8VB7dC/SgrSd8h25RQjdb0/dcG5qbj5H/
	WHxDVEOwLlfVElygHFyJoThOpnwOe0QWWiXsbuBcDlY0FyAM4go2pRyPhV0uC5rZpHDbaSq3jrq
	zxPpleIErXQtOA0jELMlWbZAcDBGpX7DAQN0lgnekuPiUU5be2gbqKU31f/8mS02S+BZ8APSmdS
	wHk68PiImuvtRjgXf1f3ZMngPGpvZ0olPRsTj8WdTUxp8qG2BU1aDtLexG5i4itSoiiJsFj+QZR
	mj20RRm8L9rkitKRHSuA8cP5CCPeOOj6sKPe2OGWWxlc0uWXhvjW9PEdTk5YZtuckGboW1BKgyo
	ZxKTKpN3TF3xrRL+Ot2oQw2swDrTprXXFXIPX1YFiYXKry/y/rDvifVF8RRdjEaqpHJFJjmsPnR
	nf7oZlmDxU8fO+ysxBkR6aIYg==
X-Received: by 2002:a05:600c:8011:b0:48a:80cb:1bb4 with SMTP id 5b1f17b1804b1-48e51f3b00emr41895225e9.22.1778060037832;
        Wed, 06 May 2026 02:33:57 -0700 (PDT)
Message-ID: <95a2bc5d-c551-42f1-8f65-9f8db4100fe6@suse.com>
Date: Wed, 6 May 2026 11:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/time: make early NOW() uses slightly more precise
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
X-purgate-ID: tlsNG-720697/1778060038-82F6E161-CD531B69/0/0
X-purgate-type: clean
X-purgate-size: 1437
X-Rspamd-Queue-Id: 091644D8AB8
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

For early NOW() uses to yield sufficiently precise results (scaling incurs
some error, which grows with the delta being scaled), init_percpu_time()
wants to have run as early as possible. With 93340297802b ("x86/time:
calibrate TSC against platform timer") having moved the invocation of
init_platform_timer() from init_xen_time() to early_time_init(), this
other call could be moved as well.

Moving, however, has the unwanted effect of then growing the gap until
time calibration runs for the 1st time. Therefore keep the present
invocation, and add another from early_time_init().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2597,6 +2597,11 @@ int __init init_xen_time(void)
     /* Finish platform timer initialization. */
     try_platform_timer_tail();
 
+    /*
+     * While early_time_init() called this already, call it again here to
+     * reduce the gap until local_time_calibration() gets to run for the
+     * first time.
+     */
     init_percpu_time();
 
     init_timer(&calibration_timer, time_calibration, NULL, 0);
@@ -2642,6 +2647,8 @@ void __init early_time_init(void)
     set_time_scale(&t->tsc_scale, tmp);
     t->stamp.local_tsc = boot_tsc_stamp;
 
+    init_percpu_time();
+
     cpu_khz = DIV_ROUND(tmp, 1000);
     printk("Detected %lu.%03lu MHz processor.\n", 
            cpu_khz / 1000, cpu_khz % 1000);

