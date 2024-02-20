Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD8285B608
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:54:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683278.1062741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLt2-0004On-6L; Tue, 20 Feb 2024 08:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683278.1062741; Tue, 20 Feb 2024 08:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLt2-0004Lb-3e; Tue, 20 Feb 2024 08:54:00 +0000
Received: by outflank-mailman (input) for mailman id 683278;
 Tue, 20 Feb 2024 08:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLt0-0002dz-CL
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:53:58 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95764024-cfcd-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 09:53:57 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d375993f4so1288961f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:53:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfcd0e000000b0033d14c96ec1sm12607957wrm.45.2024.02.20.00.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:53:57 -0800 (PST)
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
X-Inumbo-ID: 95764024-cfcd-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708419237; x=1709024037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YO3g36PvHebDUpK9/W9a6xU16xqzRXgrwigdPTnIuIA=;
        b=MRCDNx/jzxK3ryhZdl7QLnVevdcK5YROT9z2EVNCy9KGgKmXCkICJByY4NpgtiGAog
         bU9XdOdYS7f6r0PHqsI0d4D68FKBjMf0T5u0WmP1FTD5Jj9Uh35QQ15A2H5I+pvyUcex
         0mvXpMunu3a9I7upZcjYS6TaAsLOI21N6Lvl5Vg9oTvqdTaIE2Lzbzb2u2bBEHKd92dy
         nqeRGcJbCN6MbeogPgM5Pftu6ifpx8sgTtNUoFbHy+C42pqpeuna97Hkb3HBqEZAFvPP
         AR1yN+MuPXI7gb9WqjqQ9afSykTHGYfCnxxUayRtgeV2siFadMrsJjyMLy3yRDb6Z8OD
         0YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419237; x=1709024037;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO3g36PvHebDUpK9/W9a6xU16xqzRXgrwigdPTnIuIA=;
        b=ZfNDLxGGIYfk3LxP8XsVPMsLq87MqT3SND3Cw84B4xNKB26TiL9ZInx6kZ4PJKXYkr
         0jNvnrPHOYkmDYPNSEzsEJeBGQfycpeZ3F+2MgspX86z+dmeTJaZDsCvzcTHP3G722QE
         Iii/Jc3yJIOWEp385xD7mrB8vJE5jJ8UwSR0srfRP8Z5067EWSdUxsljA983G0dFP3Dy
         OokJrovhEEOMqcEzKu7U1u0jDtcA2HUjcnpj4tRE+92SyGknssJftnw3S4CPVCq5EjS0
         21Q4+FcCTK8UZJbr3Nfs6fwvCElWCuUtc/jABZx8rwPKuCZ3BuCyyblDI9SQfne+f0Hz
         fq/A==
X-Gm-Message-State: AOJu0YzslzT7PZmAjOmp/ck7MbihhJaOBtApjnpgNk/ekEfYhO5AEH1I
	xEj0pFl7q67G0hOhjxqixmFdZPV8h+5AxUefdxVaoTesjUneTwN2gTX0Qd0KQD9Kz1ViDX8MNPY
	=
X-Google-Smtp-Source: AGHT+IFFQxNe9Z1KKGyLsocntV93gLhIIqAJrcaLAmuQLTKz+j0cxjaKOyV0sNxP743pK6/Rw7kOIw==
X-Received: by 2002:a5d:5f51:0:b0:33d:6a83:1a61 with SMTP id cm17-20020a5d5f51000000b0033d6a831a61mr1116259wrb.37.1708419237433;
        Tue, 20 Feb 2024 00:53:57 -0800 (PST)
Message-ID: <f0fde2e9-fd19-4489-b795-1115a3a8136e@suse.com>
Date: Tue, 20 Feb 2024 09:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 4/8] PV-shim: drop pv_console_rx()'s regs parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
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
In-Reply-To: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
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


