Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C5AEVWFBGrVKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:06:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF3D534ACA
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308078.1579624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNADo-000172-SP; Wed, 13 May 2026 14:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308078.1579624; Wed, 13 May 2026 14:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNADo-00015L-Od; Wed, 13 May 2026 14:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1308078;
 Wed, 13 May 2026 14:05:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNADn-00015F-8l
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:05:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNADl-00CJAv-3v
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:05:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a048541-5cb7-0a2a0a5109dd-0a2a450aad26-12
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:05:58 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a048546-56b3-0a2a450a0019-d155dd32ac9b-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:05:58 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso4404839f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:05:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454913049ecsm39703682f8f.19.2026.05.13.07.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 07:05:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1778681158; x=1779285958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LGLDB1oLz7dytXJNDddp3ZiftmqYBvYmdivYW9ydtQI=;
        b=e1E79wOtISn7omuHm+TCiG2rFYn091hAQdWdXcikykJjdTPVmuEhhwT+fdyMV3ymJc
         CBj1AAcnjJERqmyGpBEnpHAzGUU6CwHotZ92C/oXrp4zBgrlwlO4/RzWS90v+ppJYo/1
         firjWvPU52WdcpFj7uHVmky519Jnd1Vgy+ds/jbiP3gpAM+fjyjE6vd0tBfWWatu9DgN
         hx4wODLMiWZ7kXFwbTdHZIgHpiyALJ8rqU4aarftx77nJq5ds72r86I+4ldh7G2Rtx9N
         /CmSVbjgppI2hEaasVN+cgT1sn7wWTf/20Yz8dthW6tiXcEPfwacwwwkp7hrtEcwYKa0
         j8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681158; x=1779285958;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGLDB1oLz7dytXJNDddp3ZiftmqYBvYmdivYW9ydtQI=;
        b=PuyE6+GashqrGawofs9xf6FU0mBOD+qB1zpc4FRO1oMSLumxlsf1yrCWCDgJs4Sbmi
         ElIvqBKU7eb9PEB4WnnDU5N1komrvlnA0Z9iDIlaDgXhajE3GtBXdZsJNEUwB7GVIpu1
         4I7acaIlVS4YaWK6fb61i1n8gVnz23wyuUO5PCGhGuM5f2l7KdFFjSgtFhUA+Qf9MW71
         6gqsRBLaKQoRfrbkYXJBvHAy1DuxZtDHgNOKKlE/ASd5ObKfxYiiEtM0nchXQwFW4uOK
         Nvm+A7rRr61w6KwxMAaGOP845zKjDK/o2/SU7+iSD7Ymy8h78Fwxz6SVumHDxKnMW5eI
         3WRQ==
X-Gm-Message-State: AOJu0YwiXiHph83VkgEVm0aSJADCPrcM5zaFiVrMEQxULyw4FDNE569b
	8Z9QghlM0ojHd2bX+CIqvgY7iA0TX4KsJkw2n5Pu3XV/GuAJbLQ+gmXLtcd2KVvs2FVW/fpZ2qW
	tJuQ=
X-Gm-Gg: Acq92OHcs2rf6PnLTI6wf9zawDIRhHEhSFWzddwt8v580xh2KGj8Yn6Q34KFN/1YcR+
	xdaDd7eJPFW95nV8D73xfpPVGGRghDiXA+ShZZvf4Wkjh+65AokVhcmjShMdmE+66WZ9lIbBzV/
	RO6QrX/RelNjE961f+MX2gyniTMzjlX8UkeRusi2sjbXEqBVn9cQBtLh5T/ZmSM0stg+NoyzENb
	gNlr7A8JB/H9seFxS6v/5mDDQPlYzNbisPbVpShQm3btQXZxjlDgIm03c8hz1tiLUDIB6zqS5/1
	LXgZnYArU4+wllKX81dJRXRwghYxLMcoVIFmJqtnRZfyGuu1XRke9TghL2Snp/CrQaFbzp8ZSHU
	gAdgbh1Q1CGwSnOHFIzSXR7PhSOIqc5HXL4VNgUuGaxAcpDeJRlGFK5NeRT0bZLTIVqjo85gY3v
	obnggxmcZbZ7hIIcKya7g14EbRsN3CyP5ou8QU7FC33h04ffRRRC2GwuFSXoBPNENu56L0hdqrb
	Ys6Sa7muaxv280=
X-Received: by 2002:a05:6000:18a5:b0:43d:50c:6f18 with SMTP id ffacd0b85a97d-45c58696122mr5641842f8f.11.1778681156869;
        Wed, 13 May 2026 07:05:56 -0700 (PDT)
Message-ID: <ddecaf67-a167-4a1e-8674-20284f6f02b3@suse.com>
Date: Wed, 13 May 2026 16:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/mm: address Misra C:2012 rule 16.2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <e3cdf68f-122a-4a41-a72c-8e6ed857b282@suse.com>
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
In-Reply-To: <e3cdf68f-122a-4a41-a72c-8e6ed857b282@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1778681158-731728B7-668B4DC0/0/0
X-purgate-type: clean
X-purgate-size: 1228
X-Rspamd-Queue-Id: 9EF3D534ACA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Action: no action

... ("A switch label shall only be used when the most closely-enclosing
compound statement is the body of a `switch' statement"). Use a form of
fall-through instead. No difference in generated code, except for some
line number changes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2663,15 +2663,17 @@ static int validate_page(struct page_inf
                  get_gpfn_from_mfn(mfn_x(page_to_mfn(page))),
                  type, page->count_info, page->u.inuse.type_info);
         if ( page != current->arch.old_guest_table )
-            page->u.inuse.type_info = 0;
-        else
         {
-            ASSERT((page->u.inuse.type_info &
-                    (PGT_count_mask | PGT_validated)) == 1);
-    case -ERESTART:
-            get_page_light(page);
-            page->u.inuse.type_info |= PGT_partial;
+            page->u.inuse.type_info = 0;
+            break;
         }
+
+        ASSERT((page->u.inuse.type_info &
+                (PGT_count_mask | PGT_validated)) == 1);
+        fallthrough;
+    case -ERESTART:
+        get_page_light(page);
+        page->u.inuse.type_info |= PGT_partial;
         break;
     }
 


