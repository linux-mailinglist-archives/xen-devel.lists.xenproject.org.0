Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FEdHu7ormlRKAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 16:36:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE03F23BC98
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 16:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249565.1547039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzcds-00013y-AB; Mon, 09 Mar 2026 15:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249565.1547039; Mon, 09 Mar 2026 15:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzcds-00011C-6x; Mon, 09 Mar 2026 15:35:36 +0000
Received: by outflank-mailman (input) for mailman id 1249565;
 Mon, 09 Mar 2026 15:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TKtW=BJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzcdr-000116-3Y
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 15:35:35 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c889f56-1bcd-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 16:35:33 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439c4a93841so4220712f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 08:35:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae36785sm25279038f8f.27.2026.03.09.08.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 08:35:32 -0700 (PDT)
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
X-Inumbo-ID: 9c889f56-1bcd-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773070533; x=1773675333; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gN3OIK4zpzgpwDwkcYY8kl1S/ufLAnvzjD11ofjDojc=;
        b=bNXOTkw0jIfWDdkUoVoQkOHwEZJ/1QuAr4OyjotoVKBw875Xy2XanLaQ3DR+Um6ceA
         yQEg0m2CXkmqeapaCRu96DSNhLhRP4U/ivwjGwnED8GiTyiYlXQHWb5CuLK7sK3EZmUu
         ES+hl4CHtTPYUJrxeDpESZLTbo/S/61Pwr1DEBgrytioRGfdmftUEscadPYQlFNRuK6w
         BCXv7jD+u3iJuxwdolKWARInNuOUYIP+eWETOVCN8zI4QfNPmWgZpaWn7DbxRMZ9Cw34
         184p5CIDTrbR+JaTmPC7K6vQZWvIZWRB36vKTZM7CI3nPnNaZbwHQW7t1o+MGBGxY4HU
         xbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070533; x=1773675333;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gN3OIK4zpzgpwDwkcYY8kl1S/ufLAnvzjD11ofjDojc=;
        b=Gaz0WkM73KtFolFcN0NZURTEJS/crANp2ah5cE2eEdiwGSFuPd6Tb3Wz+FQwZC4eM1
         zNyMa44Uh6pRN5ACucvTeRTaCMuA+6US/X90C2mbEdDoj/07fnR8ylUqiGIIg1hdwPa1
         Kk5VvM+nvUhcu+QH0IQDSWhpilo5Cg3KyQeiSlU52OqsPsjPLxA6UXJpt/AGEb1xk99L
         KPkwtDdMwadd9mer7JhUJGjgqV2vc9trt16GBGz99Oa2J1XCIMsP7V4av10pARz9QnHV
         6NBoIkhkn9dAsDhOKVQhYB5mCmtbvlfFVjY/7pkbkOEkLjh1m8aYtqYOYzMCuFrs691p
         E3Ng==
X-Gm-Message-State: AOJu0YyeerNzCaOuej+ieE7qk4ReW5QQu0V1v3CYjto6VO9F/IuoGkeV
	sNO7pULmAirwlaJmz4EgImlCKVb/7MiGzYswAYpB+9mqWG264Bq6s1L+6naDfivAASXYKkF8AGL
	/3Dg=
X-Gm-Gg: ATEYQzwBmDPhJjGRjEJr6kp67WTxeeSEVjqESeQ/XGW34sCLB4IrMcp1FEKCrmLWvNo
	9ZMsvD3B3G3fW2amqRsBVBVD49Q3+tCOPukuKG5ZOLRb5Mklds8meYrfVHv5kWUieWDfJA0VAvd
	O9xi3YekivWXaihrcUyUadNTsMc4B36o7q8PYR56BZgokt8QiBWL+mtvxneh3bXEYfWi1Ie49YR
	39EiFuCHq4tCI6oe4OvUEZUeGn9teTrkROz7lgoZ/KG4DikqR8wsRgW0ApXuBI5T0YO9K3edXfw
	nkOxGmwI3/C8fCkR+K7HfjkonjfORnFTvJcc6ek+InoD370YTVnmeJ7Fw9k8Whf8jULaLatnjvJ
	xLvFkMCc8Hd22EMWySc7vUjcaNVBAzYyUKACHVYqay3PSNGQVtTWIIq5K0RgSi0N5R1NlKrCtrL
	8eq/oLhD/aeSkU7GZ/rieqZC8FmuBWrjPqhEIdsnjDMg9Dkc2wPtLSMHdhRH0IrCXCrcqy9r7ij
	HPj8pE8KRGT2gXlLwSwFuci5w==
X-Received: by 2002:a05:6000:1845:b0:439:b506:e430 with SMTP id ffacd0b85a97d-439da351debmr20253337f8f.17.1773070532813;
        Mon, 09 Mar 2026 08:35:32 -0700 (PDT)
Message-ID: <29922662-8b95-4a69-9401-11480df59cdf@suse.com>
Date: Mon, 9 Mar 2026 16:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] core-parking: shrink core_parking_cpunum[]
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
X-Rspamd-Queue-Id: CE03F23BC98
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

This NR_CPUS-dimensioned array is likely unused on most installations.
Therefore it is especially wasteful for it to consume more space than
really needed. Allocate it dynamically ahead of registering the hooks.

Further the array having all fields set to -1 is actually useless. Nothing
relies on it, and core_parking_remove() doesn't restore the sentinel for
vacated slots. Drop the initializers altogether, rather than replacing
them.

Also take the opportunity and update an adjacent variable's type, where
a fixed-width type was pretty clearly inappropriate to use.

Finally drop the redundant initializer from core_parking_init().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I assume there is a reason this is acting (mostly) as a LIFO. Else a
simple cpumask_t would suffice.

num_possible_cpus() would be the more correct thing to use as array
dimension, yet we don't maintain cpu_possible_map on x86.
---
v2: Use dynamic allocation.

--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -20,6 +20,7 @@
 #include <xen/cpumask.h>
 #include <xen/init.h>
 #include <xen/param.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/smp.h>
 
@@ -27,8 +28,8 @@
 #define CORE_PARKING_DECREMENT 2
 
 static DEFINE_SPINLOCK(accounting_lock);
-static uint32_t cur_idle_nums;
-static unsigned int core_parking_cpunum[NR_CPUS] = {[0 ... NR_CPUS-1] = -1};
+static unsigned int cur_idle_nums;
+static unsigned int *__ro_after_init core_parking_cpunum;
 
 struct cp_policy {
     char name[30];
@@ -188,7 +189,7 @@ long cf_check core_parking_helper(void *
             return ret;
 
         spin_lock(&accounting_lock);
-        BUG_ON(cur_idle_nums >= ARRAY_SIZE(core_parking_cpunum));
+        BUG_ON(cur_idle_nums >= nr_cpu_ids);
         core_parking_cpunum[cur_idle_nums++] = cpu;
         spin_unlock(&accounting_lock);
     }
@@ -263,9 +264,12 @@ static int __init register_core_parking_
 
 static int __init cf_check core_parking_init(void)
 {
-    int ret = 0;
+    int ret;
 
-    if ( core_parking_controller == PERFORMANCE_FIRST )
+    core_parking_cpunum = xvzalloc_array(unsigned int, nr_cpu_ids);
+    if ( !core_parking_cpunum )
+        ret = -ENOMEM;
+    else if ( core_parking_controller == PERFORMANCE_FIRST )
         ret = register_core_parking_policy(&performance_first);
     else
         ret = register_core_parking_policy(&power_first);

