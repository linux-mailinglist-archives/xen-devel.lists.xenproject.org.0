Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCD0F6UolGk9AQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 09:36:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B517214A059
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 09:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234647.1537811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsGYt-0004Z9-Lu; Tue, 17 Feb 2026 08:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234647.1537811; Tue, 17 Feb 2026 08:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsGYt-0004W6-In; Tue, 17 Feb 2026 08:36:03 +0000
Received: by outflank-mailman (input) for mailman id 1234647;
 Tue, 17 Feb 2026 08:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsGYr-0004W0-CV
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 08:36:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adca50b2-0bdb-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 09:35:56 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48371119eacso36649945e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 00:35:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfafcdsm763099535e9.9.2026.02.17.00.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 00:35:55 -0800 (PST)
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
X-Inumbo-ID: adca50b2-0bdb-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771317356; x=1771922156; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xKobcVtpVZTNFXX6JxRuUg+rlKVsovkwcEHAt6TEKk=;
        b=FOTXJDepIUTs47Ql5nphL50n+1FsfVQMEOiCEZPpBAz5Js14xU+kFiytaix59rpjnA
         iZYwMAezpAjrVc6snJbOtVty5bvA4EARUqKc8Kp2nQTowcpDQjVR2dDGth9dXnwALqS/
         29I9Ngq00aKBhy0ayfqJsEWfQTUy+2eYfxuUpgtOv3Ugtm89TCW5mUDvtt1N87jvLTca
         lZr0nIvYkNJp+8Y0wsXN9DGtOhBTY0lmSNgJNg4U8WKHDRq2jH7bejpIzOMZnKiC+f+J
         X1Y4rvDs6RMACEyHMwzeE+SGf4wgG45yjQlSAyvsctS4BlQ5bkMpFPvrhuPj2TNbnekh
         bI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771317356; x=1771922156;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xKobcVtpVZTNFXX6JxRuUg+rlKVsovkwcEHAt6TEKk=;
        b=ezkLybjhBnlYQ8v893/1mFqho5m8JNo+/FvbcAUSRc3uWrOw/aEV5VWJbkjGhRvRd9
         +AFg6FO1QkIhdL+5wWJZunBiFYgIC59dhlta9BSz3/lDzANY4OS85JDZBKPYLKPFIJMk
         F8VXlG+xHo4TrSLR7NkJI8trJ9YpAFrai9Y9vCskpFvmTmNuDugctv7Bpkm8y54MD1SI
         MjOW7HHoyiVsJ44b/xqQKd1RdP0IvHEGPdIJikIAr0qiO9Okl25TjGGLDGgX7Iont9IB
         JDT/ouSEAVQ5Xax/OEgQGDLC9an5Zor8sg5w2FHnBiOwhxjeXKQtf2y6vJUAzh8POVAQ
         xMKw==
X-Gm-Message-State: AOJu0YxcVT+fQ2knXZH22okKzTCGA4tFaGAI+tBV123U+u37BgPak6/5
	0tyECleNBX3lLGjIcccB0Z5of+YUjWxchMiuegMK9Y2F7ZMdGO3pv3cLsDDSPX3a2L0OXtbUvq+
	NoQA=
X-Gm-Gg: AZuq6aIjkYUuZQ04oOvqIBDn9WZUYRqaorSXHCU8FnokcWGTuc6lr/+fvCs20eGMEVG
	AVxivLl2LbbXrOiwsWHaRwBNJcaXU4Shp4PC6ymosTtzoBJmnIIF8jm6AL/NMGvP5sL9kbh5n3K
	G38oqii4DghCt6pDEOMFjTSzrD02w9TVnJ2kwT8SzwEhYoufe37+nT7lefKECg2HIqQtf6MvVT6
	yN4r3OEvWr/KgDzkp+CKNorZcdsLVA7edCVpE/lED8Az/eot66a13otAMyFXeBi+Nba9NzsA5xT
	+oFKeVJqukYfRWeWUDN8HLm+MLhCC2AKHqv33xubVmFpRUD7Yzd3eWW+3FPPmpu8GYzt11Vbwp/
	GWPkELfTje9pZUnFdl7viLAMr8z8FW7MzfKmFbnXU5ipY8GlclH5Z8f/z/CRSH8OZfp1OyszJBt
	K5CaoLt15g7/5PzybktLYwa55Q/X+iYX/tKnvzBHMgqIfYXynB3EhRcN7iqgIqSFVk8uku0GzMa
	jDiSZLtKqOmufjl4JUNCSKnEA==
X-Received: by 2002:a05:600c:a09:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-48373a0809fmr220599515e9.7.1771317356109;
        Tue, 17 Feb 2026 00:35:56 -0800 (PST)
Message-ID: <3f1fb7a3-0abd-4df0-92b6-2bb6d78c6422@suse.com>
Date: Tue, 17 Feb 2026 09:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] wait: drop wake_up_{all,one}()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B517214A059
X-Rspamd-Action: no action

wake_up_one() isn't used at all, so violates Misra rule 2.1 (unreachable
code). wake_up_all() is only used locally, yet rather than making it
static its sole user can invoke wake_up_nr() in the intended way directly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -85,11 +85,6 @@ void init_waitqueue_head(struct waitqueu
     INIT_LIST_HEAD(&wq->list);
 }
 
-void destroy_waitqueue_head(struct waitqueue_head *wq)
-{
-    wake_up_all(wq);
-}
-
 void wake_up_nr(struct waitqueue_head *wq, unsigned int nr)
 {
     struct waitqueue_vcpu *wqv;
@@ -107,12 +102,7 @@ void wake_up_nr(struct waitqueue_head *w
     spin_unlock(&wq->lock);
 }
 
-void wake_up_one(struct waitqueue_head *wq)
-{
-    wake_up_nr(wq, 1);
-}
-
-void wake_up_all(struct waitqueue_head *wq)
+void destroy_waitqueue_head(struct waitqueue_head *wq)
 {
     wake_up_nr(wq, UINT_MAX);
 }
--- a/xen/include/xen/wait.h
+++ b/xen/include/xen/wait.h
@@ -31,8 +31,6 @@ void destroy_waitqueue_head(struct waitq
 
 /* Wake VCPU(s) waiting on specified waitqueue. */
 void wake_up_nr(struct waitqueue_head *wq, unsigned int nr);
-void wake_up_one(struct waitqueue_head *wq);
-void wake_up_all(struct waitqueue_head *wq);
 
 /* Wait on specified waitqueue until @condition is true. */
 #define wait_event(wq, condition)               \

