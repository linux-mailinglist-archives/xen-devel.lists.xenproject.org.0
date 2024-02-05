Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4A1849BC4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676043.1051825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz2R-0003xO-7N; Mon, 05 Feb 2024 13:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676043.1051825; Mon, 05 Feb 2024 13:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz2R-0003tn-4h; Mon, 05 Feb 2024 13:29:31 +0000
Received: by outflank-mailman (input) for mailman id 676043;
 Mon, 05 Feb 2024 13:29:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWz2Q-0003FY-2H
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:29:30 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96289b97-c42a-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 14:29:28 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3392b12dd21so2444406f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:29:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0033b3cf1ff09sm2278382wrw.29.2024.02.05.05.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:29:27 -0800 (PST)
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
X-Inumbo-ID: 96289b97-c42a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707139768; x=1707744568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YO3g36PvHebDUpK9/W9a6xU16xqzRXgrwigdPTnIuIA=;
        b=g2MbNanWmMBW1mXFwpf9WhmxUvOHR+Wxk305SNGPET7KdNPIXavA6/U0yaK+ixxMyI
         BO2lVLsZHc6Jr8/hOt2FNVxvzqZg8mO4rtRTm12lfARNqdoC0WGUQiq4t0d8xOaPydnY
         7zJbyM9ka2IgghQUeMuEveXsQQa+rkD2vIAITf3ONh0Bm/UAg31ueWdSKEg4gbNPMDnv
         OjDb4DPnjAdfNJI81zTN0thvU+A7YMiYQGk5wcqdOezfYl3a+R6qSL/ttmngxwPCQjSA
         E+4mRFYUpAYbRRLlT1jfpBppL30paHojevvLfnRF9sH5y2DQ8rOZtFkpwc4dtUwauGuw
         N9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139768; x=1707744568;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO3g36PvHebDUpK9/W9a6xU16xqzRXgrwigdPTnIuIA=;
        b=ZLWEOlnod+3fdGQWAHtbAwQnmJvZR7ugaYl1I7QuqsIlOO1YHe5qHwfvBPjfFB0MmM
         zKPzrAipg6vT/PQHuWAJOxQk7mZGCR+JziaGJ42itoAY6nasmdkBsOT8qrUTcC8MKnsd
         czn0BKNmpC4QyR185tria61M0Qv57rHt8btejYLFu7Mx1LZH7I6YRgK6zFtPL8poDYat
         cSgL0XTV83F4DhPgiyg5F7fx6uMIX4luCgXNAzyqklbrBqYZ01WLlo7s8ZlpDNk/PMGB
         +nTc4kysZS0rQy9X7rzx+fs4j1Qc4ReN5bZQQwe93hn7nzedJr6q38wUtBDhuX7gYinZ
         rekw==
X-Gm-Message-State: AOJu0Yx8OdFXzF7EcOA8JPtXt5JZtQT7ivS82nV4M7sEe0EFhdSTsTT5
	zYiyb5ySJ56eBJxG6okmAhVz8M+XKFZHx7Z7voIOCYw8oy3FjOftESnmZHqQPXRt17LJ5PuYfic
	=
X-Google-Smtp-Source: AGHT+IEh7yjmBHiIGhoxsC8ZOitxgl5YrK3VW6GD8r1s9VL9siV/a5Vfv15NM47eHWMWt7W38eHMcw==
X-Received: by 2002:adf:b184:0:b0:33a:e8be:51bd with SMTP id q4-20020adfb184000000b0033ae8be51bdmr5584809wra.51.1707139767744;
        Mon, 05 Feb 2024 05:29:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVm84qLJXYYsjwVfmXrUWyqek0PAuFuHurAmJQnD6G03zBzM1DV9CdKp+QdglcvAAEdXvl4KpbSm/pQgJqRT850IUT/n0tWwcVRmYkA+NjtHs9yoiVVh10RUl84tHg32oQTMEHBHyq82cimKpPvIjaG/vR3PYlvKGR5AGbzGUNlknWZyi74xvgGB+LoECbto2lL+A==
Message-ID: <5f76c01f-4cf0-4508-af94-81516b745d37@suse.com>
Date: Mon, 5 Feb 2024 14:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/8] PV-shim: drop pv_console_rx()'s regs parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
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
In-Reply-To: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It's not needed anymore. This is in preparation of dropping the register
parameters from IRQ handler functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -181,7 +181,7 @@ static void cf_check xen_evtchn_upcall(s
             port += l1 * BITS_PER_LONG;
 
             if ( pv_console && port == pv_console_evtchn() )
-                pv_console_rx(regs);
+                pv_console_rx();
             else if ( pv_shim )
                 pv_shim_inject_evtchn(port);
         }
--- a/xen/drivers/char/xen_pv_console.c
+++ b/xen/drivers/char/xen_pv_console.c
@@ -94,7 +94,7 @@ evtchn_port_t pv_console_evtchn(void)
     return cons_evtchn;
 }
 
-size_t pv_console_rx(struct cpu_user_regs *regs)
+size_t pv_console_rx(void)
 {
     char c;
     XENCONS_RING_IDX cons, prod;
--- a/xen/include/xen/pv_console.h
+++ b/xen/include/xen/pv_console.h
@@ -9,7 +9,7 @@ void pv_console_init(void);
 void pv_console_set_rx_handler(serial_rx_fn fn);
 void pv_console_init_postirq(void);
 void pv_console_puts(const char *buf, size_t nr);
-size_t pv_console_rx(struct cpu_user_regs *regs);
+size_t pv_console_rx(void);
 evtchn_port_t pv_console_evtchn(void);
 
 #else
@@ -18,7 +18,7 @@ static inline void pv_console_init(void)
 static inline void pv_console_set_rx_handler(serial_rx_fn fn) { }
 static inline void pv_console_init_postirq(void) { }
 static inline void pv_console_puts(const char *buf, size_t nr) { }
-static inline size_t pv_console_rx(struct cpu_user_regs *regs) { return 0; }
+static inline size_t pv_console_rx(void) { return 0; }
 
 #endif /* !CONFIG_XEN_GUEST */
 #endif /* __XEN_PV_CONSOLE_H__ */


