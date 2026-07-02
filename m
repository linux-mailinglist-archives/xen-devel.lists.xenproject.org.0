Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ktPnNtAvRmpmLQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:30:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6106F543C
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:30:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Q4s5MUdw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351475.1608647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDkt-00087C-ID; Thu, 02 Jul 2026 09:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351475.1608647; Thu, 02 Jul 2026 09:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDkt-000855-FZ; Thu, 02 Jul 2026 09:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1351475;
 Thu, 02 Jul 2026 09:30:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfDks-00083f-3u
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:30:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfDkr-007LhY-Cd
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:30:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462fc1-bab6-0a2a0a5309dd-0a2a4502b084-16
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:30:45 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462fc5-5a27-0a2a45020019-d1558032adc5-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:30:45 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso8774945e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:30:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dba3csm7260779f8f.3.2026.07.02.02.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 02:30:44 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782984645; x=1783589445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ8woLo45Zcyjbsvy9U/vb99ZvZrS30qykRl4pv4VUo=;
        b=Q4s5MUdwPvZbit11Oh/C7jQJ3+6m/gTLzOdJffKS7a8n2/PW6GAIdgb9Rr/NLoGjlf
         dXqTN2ne+UGxxkJNoAWSj4Z63AZJqhjdcaf4FusnalTgLwNhBwRxm5HfQoJQTroVkyZi
         UMRW29BTNChWQ9JH73WLCK8q7JPIcZrdUuK6GBxkV4Q5kZonHWJHQDtS3XWjWveQ6bal
         Xq9wMDru9EDoDALfd4zD8GfQnPbZfGbavqMkb5HwYqaqCFKBPIAfhDk2Ocryw7N3vNoO
         U+ywn5AVaQX/2gHTNWv1XJE71TFsyGVMCH//ftqqos8cH60xDVj84vziMloLwb85sm+B
         9sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984645; x=1783589445;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ8woLo45Zcyjbsvy9U/vb99ZvZrS30qykRl4pv4VUo=;
        b=fUspJIK95nB5LEBp2zlcIyTv1fCzE21GwwhewORGEEtHzdW3iWLlCW4xYKtJFvNM0p
         TPPyAUFEw8BqyLmRZe034tIpFxVImUGSCrw/lXH33mcWJ6uA5uHaFob+O7zFLvzE8a2q
         O3Py5NrMV4onefAYJNGgTV8SCeOGWKpNBgjxBBcXUWLxeWy8iHmyzxTriZBL8/fKqZ2O
         QWoAvaGQt7X/l28l4cV2oF1vXeGM0Y2EoK6H2ceThN1zsA3Uq4qFMdaoOFSQMuc6yIAm
         A4eItt3D3eDJyqvNxKuAnGpmlVuXR6ac09ryboP96bclhRHNHegNViGwqj5dEWC7eAy0
         3kjQ==
X-Gm-Message-State: AOJu0YxYuC+q01aM/HcW7P4zOrxaijUT0+NGQNjVVxYW5Uecq0F51PHm
	+Zwyy71G1PkIrADda0xHEecr4W4RVZze3Cmebd05Sw7MXJehR3iSQNTBYeV1lb20uG90Eph0Bf/
	wVAS4Nw==
X-Gm-Gg: AfdE7ck7825InuIJNxMkUjkMy0eU0mmsR5Yc9oH4JsU/RlGwrNSTgXnSXfAoS+g9LZ3
	1Gb2sKWMgg/+UmRtoFOSlgvLisKrA1dC0guBrNYfF4wgUcT4lxgIVO1n7Qac3Tn6GBv0Xltk913
	71P1hYvmeuOKAONbfr55wL8jivxViQ12bmDoJtp0TJTaDTsHWBGW866f5tQ388bmoe3wrSrjLFJ
	7BYk5qPJzx7rSbU8MD8yvKzABjrDq8Hwk8GPo8Q3aIaS2+u9uor7rZksyHx9HUyVgUK1rvTHPhH
	MswHyTIgTFiVnJXuhh58r8UW5J0hZBK6FGG2J/WybfmTe2ErUw3TFAE44D12zrR2sXJLFj1esOc
	WK9Fhry5dOJGRwC9z/BCIvrWnF0nDAR0pxSQPqeEsV/OSXgEy2ufEZkTc0TDruGIjveqRVe3ZBH
	X5cfKTiDM1N6Wa2+bbbeof6Qw7esELRBoTI+XY+EMrXwLuTaF1C+nIROm8M0AuVZQJl0iJs/pfa
	Pz7Xs87UVGuw/g=
X-Received: by 2002:a05:600d:8649:10b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-493c2b905d3mr60498205e9.24.1782984644789;
        Thu, 02 Jul 2026 02:30:44 -0700 (PDT)
Message-ID: <f8c7271e-db76-4dd0-af5f-6ed11f9be8aa@suse.com>
Date: Thu, 2 Jul 2026 11:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/4] x86/vRTC: the use_timer field is a boolean one
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
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
In-Reply-To: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1782984645-545187C5-63C8DB66/0/0
X-purgate-type: clean
X-purgate-size: 1382
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B6106F543C

... and hence wants to be of bool type.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -186,7 +186,7 @@ static void check_update_timer(RTCState
     if (!(s->hw.cmos_data[RTC_REG_C] & RTC_UF) &&
             !(s->hw.cmos_data[RTC_REG_B] & RTC_SET))
     {
-        s->use_timer = 1;
+        s->use_timer = true;
         guest_usec = get_localtime_us(d) % USEC_PER_SEC;
         if (guest_usec >= (USEC_PER_SEC - 244))
         {
@@ -214,7 +214,7 @@ static void check_update_timer(RTCState
         }
     }
     else
-        s->use_timer = 0;
+        s->use_timer = false;
 }
 
 static void cf_check rtc_update_timer(void *opaque)
@@ -673,7 +673,7 @@ static uint32_t rtc_ioport_read(RTCState
         break;
     case RTC_REG_A:
         ret = s->hw.cmos_data[s->hw.cmos_index];
-        if ((s->use_timer == 0) && update_in_progress(s))
+        if ( !s->use_timer && update_in_progress(s) )
             ret |= RTC_UIP;
         break;
     case RTC_REG_C:
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -106,7 +106,9 @@ typedef struct RTCState {
     s_time_t check_ticks_since;
     int period;
     uint8_t pt_dead_ticks;
-    uint32_t use_timer;
+
+    bool use_timer;
+
     spinlock_t lock;
 } RTCState;
 


