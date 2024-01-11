Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC482A866
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665944.1036296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpZD-0008P9-Pb; Thu, 11 Jan 2024 07:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665944.1036296; Thu, 11 Jan 2024 07:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpZD-0008Mu-MB; Thu, 11 Jan 2024 07:33:31 +0000
Received: by outflank-mailman (input) for mailman id 665944;
 Thu, 11 Jan 2024 07:33:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpZC-0008BU-F0
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:33:30 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b721da82-b053-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:33:29 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e60e13581so1644855e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:33:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003366a9cb0d1sm444087wrx.92.2024.01.10.23.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:33:29 -0800 (PST)
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
X-Inumbo-ID: b721da82-b053-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704958409; x=1705563209; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zoKC8ochUFPTshQ5L/IkWmgj0imM/XqiSRmWYZZF9pU=;
        b=b8cIvKacQ6v3ddGkl7jW7lW/Hf6aABTV9kBdI3Fuxg0r3GGRkpDykFYWjiAYdiYUXV
         cbxxFc3/FMP0utm9kS/Z8F5F+usw7T+z5EaTA43AvKvF6bvgFsbCi+yG0r+hIiEE2e/y
         xcfwA14pJjMRc2ZoSfWSOvk+UZRrQkdSfUqGtAUJgeBppEnd6jhpuDfg9dUu9KU6axFX
         4/VExv32NTZwtpqofvGnummRpn+YFHuTq1d9eVgiuKjsYlPuktce163932CD3XZUigPx
         1lceiaaOI82RiA72UsKNBrJvtXXQrmbVPcJ8DMdh/fJ4RwA2plz8n6yyZ81vvamDMnGo
         m+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958409; x=1705563209;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoKC8ochUFPTshQ5L/IkWmgj0imM/XqiSRmWYZZF9pU=;
        b=Yndq0IIeE7Vb09cbfQ82tlE7VdmSsOMrlKsGt8cCY2r4/g7/zB3UvjI3XRfvHpt2+a
         PYXn+j/eWL+GFXtwnnVaRiy9q9jal/aWsmVZbyo1/6wOhNL4Bagqm4zL073UY7JAUfgr
         4cAWMi7QpNonhiYJwp6/wZ0IqHBbpe0dSN4hHDNZcznahE/3ZYPWkWUkBYzmGPaErtig
         WTMQxwmdUrSiA1mhMpM+Kdj+cUPnE7zwKlO/NGN7mXPJU7o6noG5Cc35X7TC87D3vbFF
         q/Puw+tdV5yT4tDI3TCERRPbJw+2X/UStTQs2eiktgA67GtoMlRVTnrDMJGr5bzbNcGk
         44Eg==
X-Gm-Message-State: AOJu0YwWAYAuHQLd8tLFTHtHHCUn6ZD8NFYW4piLWfmJ2t0xKCLf8ygd
	YEabZ3kMXjtJDxUfa9MC+O91wr63Rufq4pL8YLTAAI1auw==
X-Google-Smtp-Source: AGHT+IHyTbTJlMfyu1Skg6ua3LsV/wsiVNoYjRHuZms4oBZQdS7LsfVCbB1nUCObOrSCjMPgo+R/ZA==
X-Received: by 2002:a05:600c:a002:b0:40d:3e8b:855e with SMTP id jg2-20020a05600ca00200b0040d3e8b855emr90591wmb.142.1704958409333;
        Wed, 10 Jan 2024 23:33:29 -0800 (PST)
Message-ID: <a770f13f-ee71-4fb1-b8d4-62e25584dd39@suse.com>
Date: Thu, 11 Jan 2024 08:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/8] PV-shim: drop pv_console_rx()'s regs parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
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
In-Reply-To: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It's not needed anymore. This is in preparation of dropping the register
parameters from IRQ handler functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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


