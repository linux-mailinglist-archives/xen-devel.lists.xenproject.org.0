Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4690383C47B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 15:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671544.1044944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0UK-0007Or-S0; Thu, 25 Jan 2024 14:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671544.1044944; Thu, 25 Jan 2024 14:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0UK-0007Ls-PL; Thu, 25 Jan 2024 14:13:52 +0000
Received: by outflank-mailman (input) for mailman id 671544;
 Thu, 25 Jan 2024 14:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT0UK-0007Lm-0m
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 14:13:52 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6a2b520-bb8b-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 15:13:50 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cf108d8dbeso35930861fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 06:13:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h9-20020a0566380f0900b0046e3bcd98eesm4625016jas.172.2024.01.25.06.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 06:13:50 -0800 (PST)
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
X-Inumbo-ID: f6a2b520-bb8b-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706192030; x=1706796830; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fte/AGoa1OQ1snzZ1FbmIm+pebnFcv8JkyWs6so/7+k=;
        b=MpjttVWqbJYVCGCI1frqyRVL+onJg9js62OV31rX6j6JaIQJhoywAfuVYSuRX52nik
         OM+tYy0tFehZ2NM6ewhDM7C9EZALT3DYpPmXSO2/GWXB/kukyuIUctDz7Ez93gkXAodC
         eRk25seK5BJTij/grX2oJl3+Phagv+JZTpWsUfTpRHd1CV9MDNTsJhdcBmBeV2A817tN
         npP4j9Poch0gMcfHLw9jxWaeIXMU3v9fB1p1jcUxrDfF1wRscdhN5zWqB0lIpsaTh4QC
         S+VhanSqlGybAQ1NYyQgP85ISb4ZWdhAJEIDbjxnjRAXnJ5Zccx+wLFOkrFzpKJ6kUPM
         eftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706192030; x=1706796830;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fte/AGoa1OQ1snzZ1FbmIm+pebnFcv8JkyWs6so/7+k=;
        b=JaMhaCo8V1gR8p2Y0gkTb7BIDO+OBicIeHQkemie28YvjyuZY9xFohrsf52hAOAi0j
         1RZowkexlR/VeHe568IPi0l52xknc9W5D3hksmE0LC1CXrdfcKz3yNtX6sFj1ZRfMegF
         s6m1ZP0mqo7bibvgXOIWrNDPxC/1VL2PDFxIQT1kNDzFVuB54wl6WGNnKDKgfSJ5H7VG
         X5TQfQ78S9tnKpYo9ckEqbsULnvLDxBVzn/WkwncNmLJ2deT4sMNKDmj7LQqRC/DuMM8
         IJg9eUawhWXTGbG3fLnb6kV+SBp3b3Vu38Zgr3KdrxU2BO2dHgKFo0Rdwete7gwEFSxG
         zmhw==
X-Gm-Message-State: AOJu0YzAzkCak2wBjUZEejXkIFAeCylFCbB59oYbwKVLRdZkOA5BHOV6
	73eexdp/ciw9I17P6wStERD8z1JCIWFzKQ4CScEq59ZAtDg/Pb8DLGUCt1Plag1JEVKzU5LSlBY
	=
X-Google-Smtp-Source: AGHT+IFr/NLG6YrzJ/iL57m1TN8wG7bOWM1Kl/ylxE1Z+SLzwGZAMiI+3RKpZpkvCk3gABYGpR7TOw==
X-Received: by 2002:a2e:a984:0:b0:2cf:3fd3:507a with SMTP id x4-20020a2ea984000000b002cf3fd3507amr281642ljq.99.1706192030399;
        Thu, 25 Jan 2024 06:13:50 -0800 (PST)
Message-ID: <fd1e8ff0-0d85-47bd-85d6-6cfbfdd8813a@suse.com>
Date: Thu, 25 Jan 2024 15:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: purge NMI_IO_APIC
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

Even going back to 3.2 source code, I can't spot how this watchdog mode
could ever have been enabled in Xen. The only effect its presence had
for all the years was the retaining of a dead string literal.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -186,7 +186,6 @@ extern void check_nmi_watchdog(void);
 
 extern unsigned int nmi_watchdog;
 #define NMI_NONE	0
-#define NMI_IO_APIC	1
-#define NMI_LOCAL_APIC	2
+#define NMI_LOCAL_APIC	1
 
 #endif /* __ASM_APIC_H */
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2004,11 +2004,6 @@ static void __init check_timer(void)
     }
     printk(" failed.\n");
 
-    if (nmi_watchdog == NMI_IO_APIC) {
-        printk(KERN_WARNING "timer doesn't work through the IO-APIC - disabling NMI Watchdog!\n");
-        nmi_watchdog = 0;
-    }
-
     printk(KERN_INFO "...trying to set up timer as Virtual Wire IRQ...");
 
     disable_8259A_irq(irq_to_desc(0));

