Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MPMOs/wsmlaRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:58:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A727631F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252822.1549381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jN3-0003gm-6j; Thu, 12 Mar 2026 16:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252822.1549381; Thu, 12 Mar 2026 16:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jN3-0003eY-3W; Thu, 12 Mar 2026 16:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1252822;
 Thu, 12 Mar 2026 16:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0jKn-0000EC-KQ
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:56:29 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69d59ee0-1e34-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 17:56:28 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso14833185e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:56:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48556404816sm1338845e9.5.2026.03.12.09.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:56:26 -0700 (PDT)
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
X-Inumbo-ID: 69d59ee0-1e34-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773334588; x=1773939388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RnDXh0w+MBk68hIH+3zSVNLZToon9goIJ9Tbk6Ty0ts=;
        b=RB4J0TxoDLh/Z4N0wxOPqeEgmu5X23KqamBAxE0hlbl80fGLv32EonezrZpLahdT4Y
         HJ9Al4IcGpnsUURAykMvYTdv5Ieu4C8GODtt5tWkxAPk7jlmgCbK6UHJJTvDLEYjroc6
         b1mSntfLghobuA7sxnFq74qvHXQ86/K4Vw8h0TfsynJjIWsTb6ONPLPcrlx1aisRNP3m
         lbF3Y/u8gqP3u/6P8mR4Sbelh0UuulU5/1+dgISM/w6aEg0MlqdKFfrTAP2FImSFiOQ1
         By40xI/o/JqGGFYDcX6TAEn8msr3WrnWaDMjlYn7pLXk0qlEoUZOCG+Me1bC1Q8w26Et
         RSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334588; x=1773939388;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnDXh0w+MBk68hIH+3zSVNLZToon9goIJ9Tbk6Ty0ts=;
        b=NhzyLDN3h1/wdF+1Qn0/xd8Z9POLCX5dbhpt8qyWL/OGEUuEJkw5ne8VLv4J9ONnZP
         TkeuKrgB6dhpQ/ohzPVdrXHBBGgdArG+POxY0l9rXdNciLcbw5itiHI8U6URk/tstnaP
         3zR8frc7XtTLMXnLJxhAGWIiCm6FreAsoG0yR9qNIsjUyhK8PLTng0lk0qKJUZ0tus6d
         XcLPCE33JKN3sWzeTRiVRqUQPWXHSbQyNE7vNNXPheHkCFZde996S+6kEVdY6QSiOk6h
         qRdZx45z4pI0NWXJ9hhB0iUFmkRT001mKNhhnH4K+Pw25TDI8hDt6M5DRCHD8ofJdPpl
         sJlg==
X-Gm-Message-State: AOJu0Yw5THFJF04C1dt4tj/xKrGv+4AuqD0afQE3ijQI2hLTmutO5E+w
	+LntvUObp4UC9cq4baGeHGLbM5aD2widLo+aVN+qZXY5owpsNVu9qGdMu+BdIV03CRg59pU2HN8
	eDqE=
X-Gm-Gg: ATEYQzz71ODKRJK4BhdpgRlFhBWQruuTXE03EIo1+LYT3j6NaGSyz2Locs4GpF+aghu
	tcy8g1jiank6ptlU5zFZmV9bGua5aYt23yiw//hX+23CAZXrItArSUrkum9TYrk/mVdfK8aD8PE
	JY/w5NO+ATe5eo3zVDDTBon32S7J8YyKA2FMUUTTwpFwyRriY32CrVPhavBI3WE4VKI+4byy0hY
	zaDMgNptr3eFoYEWFMd8LoezkwfiNlP8V2VhgmIk/3XZQ3OYDmGsYwrsxRPwrmLH/bhDFAzjH4V
	u3t+ciGkpgmw/l82wpQiQhCSnCIyX/QjVxBBqnC2GWQvvExD41XtqNdl/KG3f6SoZdoyWK6VWLG
	LjvlZ8ByrnwUTB48kAUiXjvH4Q876+guIjEHw/4i8CDROMP9r+WdEGIVAWiThIosLLWiO002JSL
	I3Rp93+D0AwIrOAYRIpz2pdwt3zOLx3Ux0tTjUAxM9prlb7GnhEuae5BteBjqEROZOlqOqJYnkN
	jQr6ainhzxBbLk=
X-Received: by 2002:a05:600c:8b65:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-4854b10f1ffmr122762335e9.23.1773334588272;
        Thu, 12 Mar 2026 09:56:28 -0700 (PDT)
Message-ID: <d9c97191-853b-470c-9ef1-25eab98c08ba@suse.com>
Date: Thu, 12 Mar 2026 17:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/9] x86/mwait-idle: Remove unused driver version constant
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
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
In-Reply-To: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,msgid.link:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 994A727631F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The MWAIT_IDLE_VERSION constant has not been updated since 2016 and serves
no useful purpose. The driver version is implicitly defined by the
hypervisor version, making this constant redundant.

Remove the constant to eliminate potential confusion about version
tracking.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Link: https://patch.msgid.link/20251215111229.132705-1-dedekind1@gmail.com
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 25ff69011ddf

Adjust description to fit our code base.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -58,7 +58,6 @@
 
 #include <acpi/cpufreq/cpufreq.h>
 
-#define MWAIT_IDLE_VERSION "0.4.1"
 #undef PREFIX
 #define PREFIX "mwait-idle: "
 
@@ -1632,9 +1631,6 @@ static int __init mwait_idle_probe(void)
 	if (boot_cpu_has(X86_FEATURE_XEN_ARAT))
 		lapic_timer_reliable_states = LAPIC_TIMER_ALWAYS_RELIABLE;
 
-	pr_debug(PREFIX "v" MWAIT_IDLE_VERSION " model %#x\n",
-		 boot_cpu_data.x86_model);
-
 	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
 		 lapic_timer_reliable_states);
 


