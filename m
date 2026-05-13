Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKa8LShkBGq6HgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:44:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F4F532780
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307873.1579439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN80t-0005LS-82; Wed, 13 May 2026 11:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307873.1579439; Wed, 13 May 2026 11:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN80t-0005Ju-4q; Wed, 13 May 2026 11:44:31 +0000
Received: by outflank-mailman (input) for mailman id 1307873;
 Wed, 13 May 2026 11:44:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN80r-0005Jl-Ut
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:44:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN80r-00A1it-7v
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:44:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a046419-bab6-0a2a0a5309dd-0a2a450adfe8-14
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:44:29 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04641c-56b3-0a2a450a0019-d155802dd47c-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:44:29 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48e6db3ff7eso26500785e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 04:44:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f43de84sm40207105e9.26.2026.05.13.04.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 04:44:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1778672668; x=1779277468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GQE8DFe4DRPLmoSnOwxaRoHlZT5zD9oiU41YpusLj+w=;
        b=U0lHgAKtbkIlrK7ISAWjxe49o5Xpp/07bM2hyHm/dfd9KV3XyvRhBkqwjrOwQzliR+
         57wtf6SkaFnpXmxnXDjDTBRLxXBSYb8drbXuvoKUfR7iV/0EoQLwSFGOaKcDxqtnCukx
         cHOI1/nYaFt/iujcC1kPp3jMlM3lCVfssIQW5OMRoZni9L30Bhx7WDvQ8jpYqhKlm5sl
         EbsWql5WJOBEWwhAFpy1tA7UZIF6tkQzk+fq94SGdUM7572jHiY1T3lcr2wy/1kpMQ0q
         av8rv1Bm8XfHqRmKJVh1Oj/zSxbLH5caYKwNlQsaAmoY16jmeQULkxRxnhuwtUxu5D/d
         vfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672668; x=1779277468;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQE8DFe4DRPLmoSnOwxaRoHlZT5zD9oiU41YpusLj+w=;
        b=P8gIt9YThTS28cfwcg1itS8PvRQYWd+HgiHyjtq69D1yFrDbeGwgJvP8vCy25nof8m
         d1oLXmCFzNlygZEYzMCiujvna3dW+EsCAbImb21HqAgNyb8tYvw3r+y6PYxpx+OL2MR9
         fSZpWUXuaPvl9EREZyxhiMTc/a5Ycy/XPdotaG8xoQCn+rlV5fASEp4UjPIhPa1COES3
         hH3CbeJ8ZjBfLNAApcO2bpmqPkHSTrx2ALuFWpvTYjlQkRF2+acmGBDIyatXVxkkZJ+b
         VqLLFkJy0VR9ifB76GHlzanSKU7VpGIlcwM50CLrCBHYuY5b8t02ogI0adsjtVg8ALeY
         RKpw==
X-Gm-Message-State: AOJu0YwZSYRc9QZbnmwQUOawZyEwL3bdkP1ClGCA3pql0Awj3N2sBVqj
	fh0TMabK+3WG2rbQc594H+ansKRsSqLQ3argSltk3/iu5ad9hEVYGvsYl3IquMGTH8LgxwTtm2x
	9xfk=
X-Gm-Gg: Acq92OEDzzXZmAuuO0leqm2y+/hSFkop4saL6KwqPFL42KjEXMYUo3ohTW88Kfjkn0Y
	M1Y+E6gqMsmZlV6u6rop9fmUnJrxdcuIPIbXGWbdxw/Oe+ha6eQ8Z7GklgEJK1WdxanoiQOF9pq
	kewd3rqi1BQvh6pB/wprbTjqtY9wSWQNFABwtZCgkZRW64Ve0Bu/2VtwTR2ALAaQibizSwb3sIB
	AtcsY2xfZc5QRxgj6B1SktWhYx6oB5EJnEONT0wdXzF9bHFyfNi09c6XwkpDCv0G5Kz27a40Y4l
	DxwmvSNOwxvb4FOton5r7/s7I71/6V3LTLYKTLwj7P3nopTatLfgKKzkxWIGTIoik2npTUjVphY
	pnhOYeRKaVoozS6okZZL04VAXu7cqxajC4psOlItgKQdm/TgRjI0ySbViYuU8cDfBCTTusuWePZ
	AW8eQKKeG50kQolNLz4wp0Ht1GOxyD/xSGFpHRyR/2gz+084zjlnaKJNYn71KyNqDEgy8zR/Tnp
	IAL6Jir3d50psY=
X-Received: by 2002:a05:600c:a318:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-48fc9a371e4mr30342855e9.19.1778672668631;
        Wed, 13 May 2026 04:44:28 -0700 (PDT)
Message-ID: <ea005773-792a-4db8-a8d9-a88049006870@suse.com>
Date: Wed, 13 May 2026 13:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/5] x86/guest: rename a local variable
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
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
In-Reply-To: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1778672669-7176D8B7-06DFC93F/0/0
X-purgate-type: clean
X-purgate-size: 810
X-Rspamd-Queue-Id: 43F4F532780
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Action: no action

... shadowing a file scope one, thuis violating Misra C:2012 rule 5.3
("An identifier declared in an inner scope shall not hide an identifier
declared in an outer scope"). No difference in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -203,11 +203,11 @@ static void __init init_memmap(void)
 
 static void cf_check xen_evtchn_upcall(void)
 {
-    struct vcpu_info *vcpu_info = this_cpu(vcpu_info);
+    struct vcpu_info *vi = this_cpu(vcpu_info);
     unsigned long pending;
 
-    vcpu_info->evtchn_upcall_pending = 0;
-    pending = xchg(&vcpu_info->evtchn_pending_sel, 0);
+    vi->evtchn_upcall_pending = 0;
+    pending = xchg(&vi->evtchn_pending_sel, 0);
 
     while ( pending )
     {


