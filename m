Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4655B83651F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 15:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669958.1042525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuyQ-0001PJ-6N; Mon, 22 Jan 2024 14:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669958.1042525; Mon, 22 Jan 2024 14:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuyQ-0001Nl-3E; Mon, 22 Jan 2024 14:08:26 +0000
Received: by outflank-mailman (input) for mailman id 669958;
 Mon, 22 Jan 2024 14:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRuh6-0007Lx-R9
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:50:32 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 352ead07-b92d-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 14:50:31 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cdeb80fdfdso34057841fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:50:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a05663849cd00b0046e627dbc4csm3035114jab.121.2024.01.22.05.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 05:50:30 -0800 (PST)
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
X-Inumbo-ID: 352ead07-b92d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705931431; x=1706536231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YO3g36PvHebDUpK9/W9a6xU16xqzRXgrwigdPTnIuIA=;
        b=HOMvVrCr86rjfwSJ9F53Aa4gr7n7Q3jgMH7hioghRIWohIc++9d7k02CXAVptry/n1
         bDmsBfl/LF8aww6gbyKBnDM6is9sRspcm+7xNd4IfZ3ovkdrtLw1ZBMDwdSDI12codRO
         Y0xyZOiadsPuM50bkAnyBbzbOBKDi8RMIxQmUZt4Y8pw/Lcv0489S2AwvxMnQIc5vLIA
         e8DVPm5RT65AFa7ncjRuS/U9mK6TfAVSsy5iMjWFHLin44QCPLu1yK1WoDPV+s+VTleQ
         czZtIr55fcBZYSYOOxz6zUihpZX4AKDs1Q8r8WUKgYcF/kU/R57h/jt0PlJH2fwz2iHG
         T4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931431; x=1706536231;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO3g36PvHebDUpK9/W9a6xU16xqzRXgrwigdPTnIuIA=;
        b=v6+J7b4uO/usdmMSElFXDu1FovvPOFybarEsWhlwPT0qyG9Nh7UbCBQUBE6akFUaHQ
         krIq6+mrnn+IWEHjB102VoJst7DLChB5W2oOtRAjE+t2Ob1rF2GQ8FDN2cuOkykyvkCq
         1HyE70cl0SP3kCnFtFx9+GH7YwS2wzh9NBLt2u2SlGS4mW6cLceAqlMXCPBXLGTyevX7
         x7TiiFiFpdvfESrXbKao/he+KQRL7K2OEBRYWBs/KAfJ5SJh6NX3YnszmKSJ9IxMZCSA
         1oogwwLaplzAwB3svyKxw9gbcKyHQ1qTLBHX41voYck4gJxQFV/bl4rEIE940LXn+8Tp
         fFTQ==
X-Gm-Message-State: AOJu0Ywgh9H+xJSEx51WzBPzUr/vl++cC+/MjeynAtZZCagdt5D25uCn
	zJhzsRVgwm+/uS8xforqryWgZx0TlICG22Od5TCQV3bRFOkoVkRiYlR+t5A0hdOsHpXb4mNJMyc
	=
X-Google-Smtp-Source: AGHT+IEkacxUKb+IkyqWLFq78R4UAKR5nr2WMQlZsMaoUnVrnsDn4Vy1CTXya62jS+ergCB6GpyiRA==
X-Received: by 2002:a2e:a485:0:b0:2cc:dda6:44fa with SMTP id h5-20020a2ea485000000b002ccdda644famr588581lji.92.1705931430843;
        Mon, 22 Jan 2024 05:50:30 -0800 (PST)
Message-ID: <befdfad9-d807-4d6e-960f-54b7a4c2799a@suse.com>
Date: Mon, 22 Jan 2024 14:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/8] PV-shim: drop pv_console_rx()'s regs parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com>
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
In-Reply-To: <33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com>
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


