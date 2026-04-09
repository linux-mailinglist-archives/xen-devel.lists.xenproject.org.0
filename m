Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBUQLge/12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:00:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285EE3CC4FA
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277662.1562801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqqn-0005W3-Fj; Thu, 09 Apr 2026 14:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277662.1562801; Thu, 09 Apr 2026 14:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqqn-0005TN-CF; Thu, 09 Apr 2026 14:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1277662;
 Thu, 09 Apr 2026 14:59:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqqm-0005TH-7A
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:59:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqql-005ubM-JD
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:59:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7beb3-bab6-0a2a0a5309dd-0a2a45099d8c-18
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:59:19 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7bec7-bf79-0a2a45090019-d1558029d13d-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:59:19 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488b00ed86fso11048545e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 07:59:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d534584esm3024965e9.13.2026.04.09.07.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 07:59:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1775746759; x=1776351559; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZR40jtet6aM47EDHmtok5wYq1P2LKIbeh207Bt0xsU=;
        b=X1tl5bg1OlkysMuPxgKMLTOOsUCfq56Wpl3Zvwa1N6RPiew/nIG1nle+BSsGkSdIR9
         rYi0g4PwRebEdAIS5g8y7L/jZiXpeMYz/iBGLC3J10s+QKtu3wWacMF+24GU/YMDzjf2
         /hYD+FyqwXq0AZhlvop/QqnmkPjBEDdOf9sS9KeYe1rF48IerCerkhiYpxwtF5Xg4m3V
         PusgInharZzxH2F6RCJ18sIZYblb5d3fgDywQgPw5ODO6URwhpo0OB7Vm3xW/OtgP4JF
         JrHfM2gHkk7ca2nrwlCFfDEx4ph28BDkcjN9/QSMKP7JlwjmDhhXELFKNfsMnA2gBut7
         27PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746759; x=1776351559;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZR40jtet6aM47EDHmtok5wYq1P2LKIbeh207Bt0xsU=;
        b=Bm5RFwNyApxm5R0dLYC/GdPryPghde41kmInB+pqPnvOyAtGPVs+7jYYTroRX6dwzf
         xyHDeG8nOligWFDNZHjutudHWZWcfY6Tu9NqsTqad8i82GRe7lijCEeKgI2eac+Xdjla
         kL08V6SnDkfq2/npdHhAjq+ZRwCrwU1dyhU1V3qxt+NuCmZJu5FI1flVuVl6FeVBXa66
         4BVYcqdksOT1lS88zcBzGc1BDgt4ObBvn37XzEoq2V+/fV84L1DIaQ89Z2Q7sbAu67SM
         PnSIIVzVjD1iBApx55EXaEWjFZe31hw4I4eOZNvZbSjjeQfpQdr5Chj+2pf6e6eWs/PK
         swwA==
X-Gm-Message-State: AOJu0YwOxjntd8on8TWGOvmvLQD50qpDyrgfEnfRGP8pW+tODL/qzP6w
	w4UWecvYO9SGlatKkXAXtVPffeDnBVbpefNauH65f/2hA8JYgOihWz0eKaJydkgd51EleOYdd+F
	IDYfK6g==
X-Gm-Gg: AeBDiet5v6r7D761j25yQjgw5//ANrb7/ZakJxUYWwb34TLzYAL+2UHkUFFfnww1uTN
	HS+uxPV5oceqxv//YvjzJJZSLnBjOsRLoYhW/EAQjtUfJCfL6JJqJsnn8ULYBCNS4ehLdu54SEm
	teVScGDGCbpUiL2o4Tft43MsA4XCnepmGMInZE6+1BRszlKzjzX1tstWkxjf3c2JWgfTwRWPkO1
	J1khaQrKTTXOYdxinxaiY7Ko0dh8mSVHwSm1mR3Gdt+ZyNAmItM8yMVUJ4QNrlPYTa4V2wANcQA
	AcQq+yNtkqHMDiCKTBJXJ3JGnguILdGLhnpHCjowkkeFMCpBL9gwGn0HuUOP0MFRFRrJfKg/5j8
	glD9jvbe3dg6qm5drrX/jIEMJl6uTxWqy/To1E9Nl540TjjFRUDRVXlLVW36xwxDyjR/jy5Qx3i
	/Ziqo2Ad/Aa20ocGhSsIxUsshxZw3G7ddutSdTpbaRFqHzYxK1OEg1twXZhnnNpv4jljBdU2YiV
	XTvnDQn9G2Gu3s=
X-Received: by 2002:a05:600c:548d:b0:485:3423:727d with SMTP id 5b1f17b1804b1-488cd068ce8mr49324645e9.26.1775746758723;
        Thu, 09 Apr 2026 07:59:18 -0700 (PDT)
Message-ID: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
Date: Thu, 9 Apr 2026 16:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 00/16] x86: support AVX10
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
X-purgate-ID: tlsNG-bad1c0/1775746759-2F34C152-A3EF381A/0/0
X-purgate-type: clean
X-purgate-size: 1598
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 285EE3CC4FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AVX10.1 is just a re-branding of certain AVX512 (sub)features, i.e.
adds no new instructions. Therefore it's mostly relaxation that needs
doing. Luckily the 256-bit-only case and an unnecessary restriction on
the mask register insns was taken out again, simplifying the actual
emulator adjustments quite a bit.

AVX10.2 is adding quite a few new insns, support for which is roughly
added chapter-wise as the spec has them (perhaps not in the order of
the chapters there).

While it probably could be re-based ahead, the series in this form
depends on the previously submitted "[PATCH v5 0/3] x86/CPUID: leaf
pruning" and parts of whatever is left of "[PATCH v9 00/10] x86emul:
misc additions".

I've tried to be very careful in rebasing ahead of other emulator
patches I've been carrying, but almost all testing I've done is with
all of those collectively in place.

01: x86/CPUID: enable AVX10 leaf
02: x86emul: support SIMD MOVRS
03: x86emul: support AVX10.2 forms of SM4 insns
04: x86emul: support AVX10.1
05: x86emul/test: use simd_check_avx512*() in main()
06: x86emul/test: drop cpu_has_avx512vl
07: x86emul: AVX10.1 testing
08: x86emul/test: engage AVX512VL via command line option
09: x86/CPUID: enable AVX10.2 sub-leaf
10: x86emul: support AVX10.2 scalar compare insns
11: x86emul: support AVX10.2 partial copy insns
12: x86emul: support AVX10.2 media insns
13: x86emul: support AVX10.2 minmax insns
14: x86emul: support AVX10.2 BFloat16 insns
15: x86emul: support AVX10.2 saturating convert insns
16: x86emul: support other AVX10.2 convert insns

Jan

