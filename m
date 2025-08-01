Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF9EB17D8F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 09:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066915.1431939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhkE3-0008Pa-Bd; Fri, 01 Aug 2025 07:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066915.1431939; Fri, 01 Aug 2025 07:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhkE3-0008Mx-8U; Fri, 01 Aug 2025 07:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1066915;
 Fri, 01 Aug 2025 07:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhkE1-0008Mo-Rq
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 07:30:45 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f4ddb52-6ea9-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 09:30:44 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b79bddd604so935044f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Aug 2025 00:30:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3210286bee5sm334038a91.0.2025.08.01.00.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 00:30:43 -0700 (PDT)
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
X-Inumbo-ID: 6f4ddb52-6ea9-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754033444; x=1754638244; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/e+JhRH2lcZDBUew+aru8b82UlqGQVqS+S/t091hyw=;
        b=BljF9eDKAS981XuzgBQ75ktjecJbYjKk+M/K7aOhilPbBn3u+fs26LjoWfnmmOM/AG
         sFwiOqLkrxKDToZ3UDqVGV0G/QflgxyHZ3AjAzsrB73MNA1kzwvS6U9Hl00SuisIgcRC
         ifZyTrLMI2HPwiv7sHkaBMpISx8IaaFB1cD6Uq8I1Mgt6t1vr2osooOh+zl8bovmKpBR
         rnMMlZBsVGIkfDCCuCQ8psWNYYDEZQxFzoeVaPEFPTPcIRvcVoMeeAVnkUDGfLT7/Ay2
         p6BOGvQpq9zzHOvdrYsyHat+nVJ+8GmrA3uTLXa1sjWfoMnNtzPZzkFvi5y0w32pT7w0
         Xpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754033444; x=1754638244;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/e+JhRH2lcZDBUew+aru8b82UlqGQVqS+S/t091hyw=;
        b=LGXq0DRlBo6K9mDIcLM3qJCIbOCtO8f/imwqNhqIcfgBri1/R2RwL+5YZUG9trv6pm
         gFkeiw+gnZ6Jjdv9LkCueQ7vrIrSMk6UFHCxTJ5vqlVzQLIo+jKGL+1dqoavp7+76Y/z
         Di2Nfv+OWOupsLbWqbhtsOeq8C2FL37GlpqO9EjTJS7aRUfY79uSjsFD6frN+ZQVRKyJ
         eNWK+d6/8gTYxGJH6ECtqAnTpNWrUXfLrOaLeqf0sSJPMj0AW8xkl1j000ykUxKQVX7N
         7JJ0Uq314bq3b8kd0jtn2bxrD4S5SLIL5+wjp7Yr0wIIBaGpcw1V8d6EHktASdweYI8z
         5RgQ==
X-Gm-Message-State: AOJu0YzXwjODnh13V6YF4b6K+sUNMXhwkVdXJ5KBadiYmwEcyib7bS45
	nnTyxp78zJin8Yf9/l6dNIfkXkD8dxvL2bDA77vrhAlGWVtm8APKlVMVlQgEBt/WzDKN2Sy9dww
	yi+M=
X-Gm-Gg: ASbGncuTsetgrroR7yMPuk/lqMI74XwifncNERyIb/gHK/yGoprBHbFMrSYvfKp0MY6
	E3VUTRtycL27DwccT4RZ0fpWc/O756mJNYolWS0fXwAoU7n2WIFVKz0ou6Lob2K1Ku8pHU/s5Y9
	pvHVFQ2kOAoOgFCTMtDPvFxUqvW8yBpGdpQOHZHmPLif/g70XL/LAYgeCWj3yLBVRo7sVweDmUP
	jLlT3lhNTlf6v728+NBX94bEM/EJFKQemNaFMQWK75vOMVF36JRACqMUM39hQPW1mMFPZZZ7AUU
	e3WBbdnrQ7dq8VcBHL3GiEFiLhq1hqAYUZCylbgRi4UueHQYuYPfKSXtWiwbOzF99aqZZxr04nK
	PLMu7T9Oe70Pnh/2G8CDcGsz4YanKnn4lUyZi9QB3JxXCvYhELeR5+xGJHKVLe3vvk0fK2l9NLs
	HuYIvBw6g=
X-Google-Smtp-Source: AGHT+IH0SXmqR8Rp/remuIe9n3I7KGR2Y4sHgVwuogGDb7z55jgVtjRvAaBCopm7VQV73KoniDUL4w==
X-Received: by 2002:adf:a297:0:b0:3b7:970d:a565 with SMTP id ffacd0b85a97d-3b7970da81bmr6002061f8f.46.1754033443892;
        Fri, 01 Aug 2025 00:30:43 -0700 (PDT)
Message-ID: <5fcd1c68-6c18-4a1d-8a1d-f056bdb6cde9@suse.com>
Date: Fri, 1 Aug 2025 09:30:34 +0200
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
Subject: [PATCH] console: make printk_ratelimit_{burst,ms} const
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

Them not being altered by any means, their __read_mostly attribute is
actually counter-productive: It causes the compiler to instantiate the
variables, when already with just the attributes dropped the compiler
can constant-propagate the values into the sole use site. Make the
situation yet more explicit by adding const.

Also switch the variables away from being plain int, and have the
parameters of __printk_ratelimit() follow suit. While there also
similarly adjust the type of "missed" and "lost", and - while touching
the adjacent line - increase lost_str[] to accommodate any unsigned
32-bit number.

Fixes: a8b1845a7845 ("Miscellaneous data placement adjustments")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle {__,}printk_ratelimit() may also want to have their return
type changed to bool, but I think doing so would go too far here: This
would have knock-on effects elsewhere, and it would want considering to
actually flip polarity.

Despite the Fixes: tag I wouldn't consider this for backport.

--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1268,12 +1268,12 @@ void console_end_sync(void)
  * This enforces a rate limit: not more than one kernel message
  * every printk_ratelimit_ms (millisecs).
  */
-int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst)
+int __printk_ratelimit(unsigned int ratelimit_ms, unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
     static unsigned long toks = 10 * 5 * 1000;
     static unsigned long last_msg;
-    static int missed;
+    static unsigned int missed;
     unsigned long flags;
     unsigned long long now = NOW(); /* ns */
     unsigned long ms;
@@ -1288,14 +1288,16 @@ int __printk_ratelimit(int ratelimit_ms,
         toks = ratelimit_burst * ratelimit_ms;
     if ( toks >= ratelimit_ms )
     {
-        int lost = missed;
+        unsigned int lost = missed;
+
         missed = 0;
         toks -= ratelimit_ms;
         spin_unlock(&ratelimit_lock);
         if ( lost )
         {
-            char lost_str[8];
-            snprintf(lost_str, sizeof(lost_str), "%d", lost);
+            char lost_str[10];
+
+            snprintf(lost_str, sizeof(lost_str), "%u", lost);
             /* console_lock may already be acquired by printk(). */
             rspin_lock(&console_lock);
             printk_start_of_line(CONSOLE_PREFIX);
@@ -1312,11 +1314,11 @@ int __printk_ratelimit(int ratelimit_ms,
     return 0;
 }
 
-/* minimum time in ms between messages */
-static int __read_mostly printk_ratelimit_ms = 5 * 1000;
+/* Minimum time in ms between messages */
+static const unsigned int printk_ratelimit_ms = 5 * 1000;
 
-/* number of messages we send before ratelimiting */
-static int __read_mostly printk_ratelimit_burst = 10;
+/* Number of messages we send before ratelimiting */
+static const unsigned int printk_ratelimit_burst = 10;
 
 int printk_ratelimit(void)
 {
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -80,7 +80,8 @@ extern void guest_printk(const struct do
     __attribute__ ((format (printf, 2, 3)));
 extern void noreturn panic(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2)));
-extern int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst);
+extern int __printk_ratelimit(unsigned int ratelimit_ms,
+                              unsigned int ratelimit_burst);
 extern int printk_ratelimit(void);
 
 #define gprintk(lvl, fmt, args...) \

