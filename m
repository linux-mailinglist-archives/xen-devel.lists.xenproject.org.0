Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BM3AisGk2nF0wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:57:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B861432D8
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234080.1537441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrxDb-0000yS-Px; Mon, 16 Feb 2026 11:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234080.1537441; Mon, 16 Feb 2026 11:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrxDb-0000wH-Lg; Mon, 16 Feb 2026 11:56:47 +0000
Received: by outflank-mailman (input) for mailman id 1234080;
 Mon, 16 Feb 2026 11:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrxDa-0000wB-DD
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 11:56:46 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 903e6b83-0b2e-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 12:56:44 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43638a3330dso2494746f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 03:56:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc21dsm27827177f8f.20.2026.02.16.03.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 03:56:43 -0800 (PST)
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
X-Inumbo-ID: 903e6b83-0b2e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771243004; x=1771847804; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkBZHCXHDWfa/mwLq/NPNSw/aFhuWKNOPFhHTkERpfs=;
        b=MywWOw7Ygpe+c/huM2iq1NL07kQZhpYjxifSAQM5HY3KcPJXTsW0e4efTeGWtsIZ2j
         0GKFMLXjxsFemolq99Bff2Ju0Sp3VTSLwDl3vaGHXKsCQlt1V+fJ0aJ2IJqmGhj7jsIk
         73+40m1uQtumu0C1+l8wvOkS9sjLJbLneKQcds7EKP+t87Q6ipxfNQsRABGxsRlYOmac
         lK/CwCkVLGvGe2Eb4dvFujRr+uQ/zY0YK/uqrTYUEpI/fgH0MnyElGUKAVYtyWRtpY0z
         ucS0pYvPgCP5w+4K/rsfVUNTlEq5zjzt8naG/cNxKpR2Sm8uqG8CAXFRXnOb6Iim4M3s
         qbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771243004; x=1771847804;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkBZHCXHDWfa/mwLq/NPNSw/aFhuWKNOPFhHTkERpfs=;
        b=he9J7Bl1Wa2McfRlYWyYXWYtsgiNKfTaR1JG+sFcu6JXSheiN2AUmkeKynsmfghf9P
         tUPIOYTtownZt0QjW9ppskT/XVDF/7Gv7L33TR1QrcdxuKZv4ditUMl/xktOCp78rUzL
         uSBOC1ypibIoF7PjhCriLpAJHiD6K6eGl35xcN2kD5A6BLreH0/qXaIFDnr5xYg0qQq5
         ixWToIZGsYjlv5+NYogLdM5SvTYa41iQ/FUm8CJ6LyMbxDhu4MTTvNxp/jR9pta+a/aT
         nL4USb5qBkWe89ImDB3yxFEkoPFsUFn05eyW0O6PblNNuI5w4nAkir7G/KnEh/VRETzF
         LTLg==
X-Gm-Message-State: AOJu0YxaeugAUqih6mT8mkW+bbyEvJSWHytkhRkZsW5aZwYJ7VXpouxL
	HGUVDDPDdaAXAQppuO/E/UAGVFJNIBBzsbDIS0WzcR7Orie0VN7DkxgybbAMhQlwzD55LNldS8S
	+AOQ=
X-Gm-Gg: AZuq6aKPd7drUSiW6vst5tubuBokh7vG0tCJgwgXMNavq+i93MnTBvOxDymKD+YdtPM
	sc52Zr8dJS6kQBmsfvWW3QoieRHu7eP86BHHpnjVUFnZ9Zfb0p9CYPt+LHL2nJA6pAE5yh9Yx+b
	fRAHcD6bFE2i1RT/fzKxc6afxYO1YLNQCoC6Em70MufBil/QisF9k5E+mgLRXC4gR0TwTbQD0sA
	HctV8tyRcxeIieRsz1O92JrnuFo2clHpKfVBuM7YVKWaj6l9bxz8nKOfQzt0oYrwHMFPvCVVwq7
	FYbKiN610mlaHTbJLe2EnqOmMxrNaT0A9ZMKNIibVcZJCpt33qbfKHkYU3JZfotpn6aE+C6OkFm
	OMWA6K47hRY7emMAOeKB6kXalDhjUEI1VfT/Gwxbt6r0CQxhExCQIcMDCHN4F/lP2nxQ8p/DALr
	Tu9RqWXO+JeN+z8y79HHj0ujCKwNWfdo91at0pYXW1tSIDDb9ClOPGWHAvtplImS0k/DooHWoWh
	+Yu3wMbWmm0QL0=
X-Received: by 2002:a05:6000:1a8a:b0:437:9ced:d04c with SMTP id ffacd0b85a97d-4379db93492mr14371395f8f.35.1771243003634;
        Mon, 16 Feb 2026 03:56:43 -0800 (PST)
Message-ID: <561865f9-cd0f-40c9-86b8-98a3ac070b65@suse.com>
Date: Mon, 16 Feb 2026 12:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MCE: restore CPU vendor reporting to the outside world
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 69B861432D8
X-Rspamd-Action: no action

The records reported used to contain Linux enumerators. We first broke
that connection when purging unused ones, and then again when switching to
the bit mask forms.

Fixes: 408413051144 ("x86/cpu: Drop unused X86_VENDOR_* values")
Fixes: 0cd074144cbb ("x86/cpu: Renumber X86_VENDOR_* to form a bitmap")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -858,6 +858,22 @@ void *x86_mcinfo_reserve(struct mc_info
     return mic_index;
 }
 
+/* Linux values need using when reporting CPU vendors to the outside. */
+static unsigned int xen2linux_vendor(unsigned int vendor)
+{
+    switch ( vendor )
+    {
+    case X86_VENDOR_INTEL:    return 0;
+    case X86_VENDOR_AMD:      return 2;
+    case X86_VENDOR_CENTAUR:  return 5;
+    case X86_VENDOR_HYGON:    return 9;
+    case X86_VENDOR_SHANGHAI: return 10; /* X86_VENDOR_ZHAOXIN */
+    default: break;
+    }
+
+    return 0xff; /* X86_VENDOR_UNKNOWN */
+}
+
 static void x86_mcinfo_apei_save(
     struct mcinfo_global *mc_global, struct mcinfo_bank *mc_bank)
 {
@@ -866,7 +882,7 @@ static void x86_mcinfo_apei_save(
     memset(&m, 0, sizeof(struct mce));
 
     m.cpu = mc_global->mc_coreid;
-    m.cpuvendor = boot_cpu_data.x86_vendor;
+    m.cpuvendor = xen2linux_vendor(boot_cpu_data.x86_vendor);
     m.cpuid = cpuid_eax(1);
     m.socketid = mc_global->mc_socketid;
     m.apicid = mc_global->mc_apicid;
@@ -968,7 +984,7 @@ static void cf_check __maybe_unused do_m
                         &xcp->mc_ncores_active, &xcp->mc_nthreads);
     xcp->mc_cpuid_level = c->cpuid_level;
     xcp->mc_family = c->x86;
-    xcp->mc_vendor = c->x86_vendor;
+    xcp->mc_vendor = xen2linux_vendor(c->x86_vendor);
     xcp->mc_model = c->x86_model;
     xcp->mc_step = c->x86_mask;
     xcp->mc_cache_size = c->x86_cache_size;

