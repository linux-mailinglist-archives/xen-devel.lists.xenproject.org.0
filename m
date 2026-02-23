Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGv3KshtnGmcGAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:10:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21815178818
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239103.1540536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXZ9-0005PU-Qe; Mon, 23 Feb 2026 15:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239103.1540536; Mon, 23 Feb 2026 15:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXZ9-0005Mj-No; Mon, 23 Feb 2026 15:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1239103;
 Mon, 23 Feb 2026 15:09:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuXZ8-0005Md-Dz
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 15:09:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad920836-10c9-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 16:09:41 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso35275405e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 07:09:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4bf89sm18715016f8f.29.2026.02.23.07.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 07:09:39 -0800 (PST)
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
X-Inumbo-ID: ad920836-10c9-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771859381; x=1772464181; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1lQVC/zsWXNjKSP/W5pxacMKKm1VeCK3EuGDHKNxR00=;
        b=Tb6G8Y8uul3bnHKMvgAaFvvPXcxIAnS/aNPsUILOfvCF35ne5rgfkEmy0vbbqEuyg3
         rU4996GxfuRytVYmS2uhm6aKAh5wOiN/N3aQOyCexPlDOBNGL3WDXnJMOq3qEpu/KYwX
         PzylCLhFh/bIeuqMJMF2iNue0I04pbTnrYLrDD9tDt0VwwOg/uGld2DXbPK4zvUgjHYM
         xLgK1VrbN5AqUVbDOk/lavrbwgQV6EkxtEBWDkcJadh8+0aZ6LzpxIUjEj8g6mtK/MUQ
         b8oZkkPdEy+s1do9mdSq0Zk3yB3Znz/Yc8v8xKvFlJYuYQSQdYITazRH4L2Z70R+7c1Q
         oG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859381; x=1772464181;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lQVC/zsWXNjKSP/W5pxacMKKm1VeCK3EuGDHKNxR00=;
        b=xATi9FvVT1BhQF/plcQQXieAEBzwsZH3IhYpE9sjA1djoaF8NgFKofwH0gtOlU8sii
         Qr4Y9EMzRYZNCnCW3ckQG9gChJ1jl77eTubI98AgWpKKHn5Qmsa7udNIZZeN45TSuwhc
         UxR4zLNEXlk5UUYOYqyPL9lgyf8YgmySstZqa+TjV+D7xb5QDowbA6Gb2e+LZmp9E/34
         jiHRQKtuAVnKZm/mNORgYS6OVqNgWN7qPHdgawoJLLpitpqvR48EswwZgB0YPXuayc5m
         aOaLSIbAhniiLk5urC1TzP3PI2NY3OsNPLDXl14QrDx40cx0LFq0zSdnUX/pzo8KjRKk
         eAUA==
X-Gm-Message-State: AOJu0YyYdqzhKGRSC+RKAHmgQrU5w4esdc5mfMbO/7QAdU47El1ZRein
	AtNPvdu//G+2LYWsTbuB5lp917Ze2jUPDkvLkAeQdezk+9I/FecdTrCNN/cQACXtwn9XNrlWXrX
	QpKo=
X-Gm-Gg: AZuq6aJs+RZkhh/8TO1ln7/haHYehbVT3GEf6FgmUgWmY2QmAQXwfpxNPHb8LJYYLkD
	OEDs0/K0C4ecJcNPwKLgjch7wb8HB2Mn5wPFapDG3yQok0thNo6o0Law+iL7VUmkvDuxQyECU7G
	wrp0bdkbDoieVsb5G1HbKkqY+uyNEin1lOM8zkZXKjMRrOpaBCB6uj2FhEnqBD6O98JgUcEwbhB
	n7KZfVEIe2yFmVbWnjQGOsquULvkD7ta/8nsjTYeqjz4gAqV5JUb/T1Xs1pdy4ghaZdmFC8EIO5
	A6Yzlhi1QialUGC6Y0r6LSfDu6SZb0FF/hRovGAd95aKn0gjTouWjmKJv0G4R2RFDTCS2jhHPOj
	/SFKRwRu+ZV5PHW+JfnDgeCCa7jfx15pKmcUFnxzVmahRdBoMbFOobrBO42R7zUm5VJZM7+A2n5
	s77In2hGNlMtB6MOiV2SsuNCYiXyX2nTidqiah5MZanH5eQgshVuqAwyDNXFY9oD2maIS8Zeny6
	6l1xJfwMFmnEOE=
X-Received: by 2002:a05:600c:8805:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-483aaa17361mr72390545e9.3.1771859380663;
        Mon, 23 Feb 2026 07:09:40 -0800 (PST)
Message-ID: <be4a2b14-2217-49a2-a65a-237852bd5296@suse.com>
Date: Mon, 23 Feb 2026 16:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] wait: drop wake_up_{all,one}()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 21815178818
X-Rspamd-Action: no action

wake_up_one() isn't used at all, so violates Misra rule 2.1 (unreachable
code). wake_up_all() is only used locally, yet rather than making it
static its sole user can invoke wake_up_nr() in the intended way directly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Keep destroy_waitqueue_head() at its old position.

--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -87,7 +87,7 @@ void init_waitqueue_head(struct waitqueu
 
 void destroy_waitqueue_head(struct waitqueue_head *wq)
 {
-    wake_up_all(wq);
+    wake_up_nr(wq, UINT_MAX);
 }
 
 void wake_up_nr(struct waitqueue_head *wq, unsigned int nr)
@@ -107,16 +107,6 @@ void wake_up_nr(struct waitqueue_head *w
     spin_unlock(&wq->lock);
 }
 
-void wake_up_one(struct waitqueue_head *wq)
-{
-    wake_up_nr(wq, 1);
-}
-
-void wake_up_all(struct waitqueue_head *wq)
-{
-    wake_up_nr(wq, UINT_MAX);
-}
-
 #ifdef CONFIG_X86
 
 static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
--- a/xen/include/xen/wait.h
+++ b/xen/include/xen/wait.h
@@ -31,8 +31,6 @@ void destroy_waitqueue_head(struct waitq
 
 /* Wake VCPU(s) waiting on specified waitqueue. */
 void wake_up_nr(struct waitqueue_head *wq, unsigned int nr);
-void wake_up_one(struct waitqueue_head *wq);
-void wake_up_all(struct waitqueue_head *wq);
 
 /* Wait on specified waitqueue until @condition is true. */
 #define wait_event(wq, condition)               \

