Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGmzMy37CmqA+wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 13:42:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77056BCA4
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 13:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311789.1581932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOwMI-0002n6-Fu; Mon, 18 May 2026 11:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311789.1581932; Mon, 18 May 2026 11:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOwMI-0002l0-Cf; Mon, 18 May 2026 11:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1311789;
 Mon, 18 May 2026 11:42:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOwMG-0002ks-0s
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 11:42:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOwME-008VEC-TM
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:42:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0afb02-2eae-0a2a0a5409dd-0a2a4503b51c-28
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 13:42:02 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0afb0a-672d-0a2a45030019-d1558035cc35-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 13:42:02 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so23672315e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 04:42:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53804aesm236781965e9.15.2026.05.18.04.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 04:42:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1779104522; x=1779709322; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=afaoHU/DPN5WsAbVYCRxyMGiBQjaLY/Vjl2H5nHyoCk=;
        b=O4BN9AJPWKL+fcBKSVztZ+0zRNOv+2vcDHpR1ZwNGk/chve5yuyu0GIJWA314k7twR
         Cz8j6tryZUyQ1uLibQdlSDnh4TOXKgWOgiqnAihkOhLBmgf+Jpi+otp3nEI/TX+pRKWM
         /bwd2oaDjCMaf0AhDim+R5LT5xx8ZjAw5Zfyp1Ex5N4Si9G9hTkXBaWHq1LqfefI07A+
         Vv9Yimn1yPWLmLL7Glg2dYAjMIL0PK+shMAcwZigpOsJBWMm80yJ6Joj7ZkrE47vXdUX
         VU4jDL/FplKcnS9FsB2SQqVPZl5gpq+qNbn5nbau9K0GgkwNxpPlrHQA/2CyKDqQJR/B
         coiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104522; x=1779709322;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afaoHU/DPN5WsAbVYCRxyMGiBQjaLY/Vjl2H5nHyoCk=;
        b=D75psy/TtqDE1rloSnm34NRXa++tb8APwUzhPNzi6/PcwoZJgK7CruCM/OxyRkP9h9
         w6Eng+zFZyVYMiqV/YE1jbQsg4xt/U+7KGTh7IUBXJzAS/qNRndLIHACyZXyZF1nWFRh
         W6h5mfQHK1VrDG1t47lY4GKMIRJlrstX5Q5yiTIfJWJL8IPcoOLjfZ399AaFzcvOBG1l
         pGl0gg/vHyPGZ3Kd3UDmQ+iOfV6HY5hxLbKJTYQi6f0T5Eb3vcGRkQGznxdi/6XgnC/C
         McC+RaOwNpSlQLJNaTC/LkHbzS1GPKHxqNn7KIt+GZvNO7lSLPzQ9fdfqrjHt45CpD/u
         bSFQ==
X-Gm-Message-State: AOJu0YxOquO41UkN+tb5CMqpLyi+pxHAyIJgiXxP/V2LofcsyfxiLRoz
	uW9vDcEbnTOGqpil5DN26knESklcPw7+xaiX3lq5APK9bDcsXvToZhXmbQ21DMTiWwHvMkD6aLy
	LJGw=
X-Gm-Gg: Acq92OEGSgMzyc+UltjLCDj8qmoj1Lz1WQ6rsC9E/o2Wt6zPQSUHO4OCcIMItlu9Thm
	2eayCwnlf8TvqdCRvqZvUVwpSdGefMWMN+634IbdxplBmkNLJdC1N29bJu327cymj/L8p05V+IN
	CSFpuOt2KmhJMQiIqZYF4crnap2lQiye4eSAOPqftGy3io+FRijkGke41v2wXmpcitZZQ++UGSG
	+AaFTkkZIX7GISCZPTe95C4QGHMfng1Pjlr83utn8W57GzzahbLO8IrkiwRPdgNvSxHciiJgf/x
	fmKvtV9gn8myLkA/0Djc98eMkVdcVAMciZlMoMi8ll/5YA8o02Q8Flqvh8yLQAmBdwCqcPjp0FS
	ev4ryi1JoNb2mADtQSGDWQLmXdpBK/J6ROYpujWLngjLqpawPq/kLEutfOMLhdoVHObBW9CkK+R
	hYJFAeL4PyW8xr0r7vhobB0x6g/XX2Wk5JpqPpogffuEYrVuEWrTX1hfkpk5baiHAloFfK198Hz
	rXis+BUZryTeJ4=
X-Received: by 2002:a05:600c:c167:b0:48f:d410:6065 with SMTP id 5b1f17b1804b1-48fe66138dfmr229118335e9.29.1779104522262;
        Mon, 18 May 2026 04:42:02 -0700 (PDT)
Message-ID: <fddf4e43-8b8b-4b89-97b9-24deb46e2c9c@suse.com>
Date: Mon, 18 May 2026 13:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/shim: adjust for Misra C:2012 rule 20.12
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
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
X-purgate-ID: tlsNG-33051d/1779104522-3A378938-AD65FABC/0/0
X-purgate-type: clean
X-purgate-size: 1955
X-Rspamd-Queue-Id: 3A77056BCA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Action: no action

... ("A macro parameter used as an operand to the `#' or `##' operators,
which is itself subject to further macro replacement, shall only be used
as an operand to these operators"). Leverage the SAF-6 annotation we have
available.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As per the placement in arm/tee/ffa.c two instances of the SAF comment
(ahead of the macro definitions) should suffice. Eclair demands one
instance per macro use here, however (much like we have it in
x86/dom{ain,ctl}.c).
---
v2: Use SAF-6 annotations.

--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -124,8 +124,10 @@ void __init pv_shim_fixup_e820(void)
     ASSERT(i < ARRAY_SIZE(reserved_pages));     \
     reserved_pages[i++].mfn = pfn;              \
 })
+    /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
     MARK_PARAM_RAM(HVM_PARAM_STORE_PFN);
     if ( !pv_console )
+        /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
         MARK_PARAM_RAM(HVM_PARAM_CONSOLE_PFN);
 #undef MARK_PARAM_RAM
 }
@@ -207,10 +209,14 @@ void __init pv_shim_setup_dom(struct dom
         evtchn_reserve(d, param);                                              \
     }                                                                          \
 })
+    /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
     SET_AND_MAP_PARAM(HVM_PARAM_STORE_PFN, si->store_mfn, store_va);
+    /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
     SET_AND_MAP_PARAM(HVM_PARAM_STORE_EVTCHN, si->store_evtchn, 0);
+    /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
     SET_AND_MAP_PARAM(HVM_PARAM_CONSOLE_EVTCHN, si->console.domU.evtchn, 0);
     if ( !pv_console )
+        /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
         SET_AND_MAP_PARAM(HVM_PARAM_CONSOLE_PFN, si->console.domU.mfn,
                           console_va);
 #undef SET_AND_MAP_PARAM

