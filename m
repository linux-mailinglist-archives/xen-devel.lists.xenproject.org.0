Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBwVEPHaw2lwuQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:54:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC8B3253E3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262232.1554819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5NkD-0002XP-IU; Wed, 25 Mar 2026 12:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262232.1554819; Wed, 25 Mar 2026 12:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5NkD-0002Ut-Fk; Wed, 25 Mar 2026 12:53:57 +0000
Received: by outflank-mailman (input) for mailman id 1262232;
 Wed, 25 Mar 2026 12:53:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5NkC-0002Un-SO
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:53:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5NkC-005qMb-7v
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:53:56 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3dadf-5cb7-0a2a0a5109dd-0a2a45088cb2-34
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:53:56 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3dae4-1950-0a2a45080019-d155802cb1e4-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:53:56 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4870206f73bso28899325e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 05:53:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871169384dsm140463055e9.1.2026.03.25.05.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 05:53:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1774443236; x=1775048036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LmSd5qruvs0NXHmpFxUrztIz9TUvxd6siuRZ84L3jZ8=;
        b=Gv2S208KLi9dGKlFw8T1N55diCBU9RD85H0Gd84pb2/eg21VGQkfZlaUOI06maGTao
         jffGlUQBBTH0dv7RM8Z0p06N+cOAoerPvozWTFzBy7Me3E7otudFhEixUnxLX1CakCNe
         Nh5seKr5UEMu7uBLXj0KCQe4a4rIyUklv9QSap6UvFas2FZzCTPWQaCaLlw0mnghDZVu
         nFTX3/fZaf7kFWfL5wTQGaP/Re8WvZh3vAMhb0RNZF5ynha+tvPhKvqOizinHGfGN6/g
         yIIGo4YH/RmiOWAQNZR/0ihaltO4Fjf0TWRfDG4ZH3xwyLpeo0Ium96B8pCTR535XHOR
         ip3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443236; x=1775048036;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmSd5qruvs0NXHmpFxUrztIz9TUvxd6siuRZ84L3jZ8=;
        b=A6p5Sz4nFwUYi+ipAoOT5uSbQOvOH4ZCTdIw1LAv60w3aiMJ03vOsqV2ezvzTfXXvk
         KqgQxpyaSBG/AWVYYEEChvOkfcqhr7FpNd7zN5oDXhMK5hpXI4p7tUSys48uknrClgJa
         DgccAmBb5g0fr36AdHf7vO392q8VhYw6zNBjb2MxeqieI0aUt6PAFEVHUXptpt6QDOTc
         N4n9bhGl0zMjdoBu4uG5U1a/6mJaNItLTNpMXrLteh5J9faPDYTb2vDfWBGqm6RIU4HU
         7SkgGxuyNSkjTZzOUnVO3Im6myaXY/mwGZgRlhaZgtIL+xjvO/+hkUYPvCJVU/gq1xyV
         Qbpw==
X-Gm-Message-State: AOJu0YyieiT4FoJrqq0ke/O/YP2KWnrqipRZVM2AIYpdS1GJzlSPil/d
	zyDaIRWqCNTphRqa+qnTrZdmk1Ag74lvneLmER2Ppp4DYLmU/XDS/BQvy/2vAVpHwUFib32j2oB
	gfn2SCQ==
X-Gm-Gg: ATEYQzyhRMKFmi2V+YGvFKuehJUal8r1U++mBl8Hks+a92TfAR7PwOFSkujKD59R1MT
	fMre/HEbYSYM9j4znxhfEji+XfLB47fb7NTx6cAUFBFBrxqa/w8FDFcAnrCha3n+l1VTwF+JRzC
	IG8AkiWNZ97sm8cypykJ/K0geBpZs5CWY19ARl/kHTSH4Gdp+j5QnQzihU7x7uVdQKzIGPbz0Bo
	xDzEDVXzKp82nBWFsMRWJtczq6+AdAj3eqTMTO4vC5qOvk5dakZrKhEvlm4bP2Ra3/qxO1lBoVz
	7CzgT6R0qEXrqKXziVP0F0XeMYqo/cwU/0GTGHWAuXYHrxTqRAiFNu37Fw2WmBrUuKUUOJSNx99
	NjbwhxDzupwVoZLtxukRQZxsMV8zGnmTGftrA8p8r+havi0bI7qN3UZngGS5VW8WK6uEj3VGUHp
	nCnOtANYrCv8QISZIfSbQuE2PfvEhYFJmrSDjNiU9L9TWFb7O4deMLQXEhIK64CShUCGkdhEAf+
	DlsY54XRzQ1uEo=
X-Received: by 2002:a05:600c:1394:b0:485:3fe6:21f5 with SMTP id 5b1f17b1804b1-48715fd9fe7mr51133765e9.10.1774443235603;
        Wed, 25 Mar 2026 05:53:55 -0700 (PDT)
Message-ID: <1b73213f-90ec-436f-821e-b9998be9a9b1@suse.com>
Date: Wed, 25 Mar 2026 13:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] arinc653: overwrite entire .dom_handle[] for Dom0
 slots
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774443236-EBE9D726-E5CBFCB5/0/0
X-purgate-type: clean
X-purgate-size: 1086
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8CC8B3253E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When that code still lived in a653sched_init(), it was redundant with the
earlier memset() / xzalloc(). Once moved, the full structure field needs
setting, as dom_handle_cmp() uses memcmp(). Rather than implying the
handle to be all zero, copy the handle out of the domain structure.

Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Copy handle rather than clearing it.

--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -420,7 +420,9 @@ a653sched_alloc_udata(const struct sched
 
         if ( entry < ARINC653_MAX_DOMAINS_PER_SCHEDULE )
         {
-            sched_priv->schedule[entry].dom_handle[0] = '\0';
+            memcpy(sched_priv->schedule[entry].dom_handle,
+                   unit->domain->handle,
+                   sizeof(sched_priv->schedule->dom_handle));
             sched_priv->schedule[entry].unit_id = unit->unit_id;
             sched_priv->schedule[entry].runtime = DEFAULT_TIMESLICE;
             sched_priv->schedule[entry].unit = unit;


