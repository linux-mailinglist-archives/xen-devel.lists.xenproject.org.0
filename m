Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B43C1579B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 16:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152238.1482755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDli0-0000fd-Hz; Tue, 28 Oct 2025 15:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152238.1482755; Tue, 28 Oct 2025 15:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDli0-0000eC-EQ; Tue, 28 Oct 2025 15:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1152238;
 Tue, 28 Oct 2025 15:34:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDlhz-0008I1-1A
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 15:34:03 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87c019ca-b413-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 16:34:02 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4298b49f103so2146268f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 08:34:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4e30f5sm201840855e9.17.2025.10.28.08.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 08:34:01 -0700 (PDT)
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
X-Inumbo-ID: 87c019ca-b413-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761665642; x=1762270442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OIqrBm27xeex8ooYRBuiIqavGVudqwN/SmgOkYYu3Ts=;
        b=NaYeYGunXgDfr3+Ne5G6In8xta7cbk9hBcqiXSKQGrmTQJHrX+GO2qlRbc+we93QUo
         oCo7A2keuNZjDnaAaCQVZ++rGHjIZSSPBFcokA8X+0jc3C6NvVI2jUdQMDkYggFcOnyF
         NwVhuZsW7Y0Hq7XDPpG2ESlSdWnvXECy0y+kwJsCmroEXn7Rxxh2oUTPgJo9hD2+vjF8
         fSu67NE1TFFJ0V4x8+7Y/ofVjcDzc1b6QCpe+Zqep1cHCQqfazrkoCSqEhTgbGV5PHZs
         LsKzL044ytZuG5H3yhkBkkYME4TqgUUp2lPEgCKkwZiYXPgxsysF99VZjPB6e8tarPkf
         mPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665642; x=1762270442;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIqrBm27xeex8ooYRBuiIqavGVudqwN/SmgOkYYu3Ts=;
        b=jNRjeesL3iiv16wbZt0PCsui59hRBBwdRP45uuiyulGxZKrruc68VZ0fR9KRHOWmxJ
         QIzL1/FQtChQ/jKyQyrzJ9fwzSIexrAm08y9XtlbP/la/rMR1Dcv2vN9yvSLbI+vdKxm
         thygt2vaN1IhmZyJmiOLccv8mUZJ0W37s4Wgpq4cKt3gttebOVJmMG5SU/bygtw3hGjF
         EkoraqOmixih4rjz2OgtC16b0UyY6BxeQJh+KEqoigSWFxrokmbJG6wbVB9hPchBcxKM
         FaNsu2HjEF+/toPb/koalBNJ7YMb+Xl4V+M8EALoZKjq7W7DBsLe68gLIUaAeQNQ6832
         wq6g==
X-Gm-Message-State: AOJu0YwkG2tXR6rimA/bbDIoCrog328veYj1Lry5OLZOEJv443ow6sPk
	zlI8D5/8ntzpU4SLPw3OJjwh7nk9mz7ReqQ6vC2SWbnK9N4evod8G4Cn9xNCowcwyt7ygUEinAf
	FS20=
X-Gm-Gg: ASbGncuwadARc/1fmAPhA7OmTzI1fxAE2oGK6cxI1JoI5odXLM6urFPpYdujNMUY+9z
	c9W+Ex6VsyV6jABB1MeZXPHIvZm4QyAnmO8SH0UdbO1wRuXr1pPta45apVgVTzn5XFGJXDbklzU
	n0rd6Q6Bwl88sNKK4pH2k6V+5oeZH7K67/D1Bz/sZeqV4JMpmI/6DMRbEvBz3LpE2nXYc4QmxVr
	4Z6PVC6LP1Wt7qNM4fTyFQCxlj9D5EnjMAvEdm0nTqHj30fwjXqEfSqDQ2pQ+xReTisNRD1o/Rm
	ci3KcZ+Ke6H7bqICUo9CF7TimhQEFYKewrhYou016tGqRO4wb99wqhpnhcn5vYLly6g6Kk8OO0A
	CWXCMwZm1iMSQC5uDfGH7f13ItD0Zy18iY4Ytk7rmqpX8muSSTul4095ACpaXRggEkNTbyidj7X
	BEy0Mvz6hZ24GxpZWcCR2uL0MSasKmAr6w5Mnz8xDMNcDZStlx0b8QpLjHRfU9
X-Google-Smtp-Source: AGHT+IFYEazjJ/v0HnSQIZ8qWJP5wA9Pfi9cw8+vS/ZTcK8m25C9N6v5mJHN8z4uCKhlrX0rSjyotQ==
X-Received: by 2002:a05:6000:40c9:b0:428:57b8:926f with SMTP id ffacd0b85a97d-429a7e99859mr3393438f8f.58.1761665641875;
        Tue, 28 Oct 2025 08:34:01 -0700 (PDT)
Message-ID: <954766c0-04e3-4087-a578-cd88ea7e1c40@suse.com>
Date: Tue, 28 Oct 2025 16:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.21 2/2] x86/AMD: disable RDSEED on most of Zen5
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
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
In-Reply-To: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This particular variant has an error that causes 16- and 32-bit forms of
RDSEED to frequently return 0 while still signaling success (CF=1). Refer
to AMD-SB-7055 / CVE-2025-62626.

Relevant data taken from Linux commit <TBD, see [1]>
("x86/CPU/AMD: Add RDSEED fix for Zen5").

As for the other RDSEED issue, the same command line override can be used
to keep RDSEED enabled.

[1] https://lore.kernel.org/lkml/176165291198.2601451.3074910014537130674.tip-bot2@tip-bot2/T/#u

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
See "x86/AMD: disable RDSEED on Fam17 model 47 stepping 0" for pending
opens.
---
v2: New.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1246,6 +1246,43 @@ static void cf_check init_amd(struct cpu
 		if (!cpu_has_hypervisor && !cpu_has(c, X86_FEATURE_BTC_NO))
 			__set_bit(X86_FEATURE_BTC_NO, c->x86_capability);
 		break;
+
+	case 0x1a:
+		/*
+		 * Zen5 have an error that causes the 16- and 32-bit forms of
+		 * RDSEED to frequently return 0 while signaling success (CF=1).
+		 * Sadly at the time of writing the fixed microcode revision is
+		 * known for only two of the models.
+		 */
+		if (c == &boot_cpu_data &&
+		    cpu_has(c, X86_FEATURE_RDSEED) &&
+		    !is_forced_cpu_cap(X86_FEATURE_RDSEED)) {
+			static const char __initconst text[] =
+				"RDSEED32 is unreliable on this hardware; disabling its exposure\n";
+			bool good = false;
+
+			switch (c->model) {
+			case 0x02:
+				if (c->stepping == 1 &&
+				    this_cpu(cpu_sig).rev >= 0x0b00215a)
+					good = true;
+				break;
+
+			case 0x11:
+				if (c->stepping == 0 &&
+				    this_cpu(cpu_sig).rev >= 0x0b101054)
+					good = true;
+				break;
+			}
+
+			if (good)
+				break;
+
+			setup_clear_cpu_cap(X86_FEATURE_RDSEED);
+			cpuidmask_defaults._7ab0 &= ~cpufeat_mask(X86_FEATURE_RDSEED);
+			warning_add(text);
+		}
+		break;
 	}
 
 	display_cacheinfo(c);


