Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NlNF7UH1WnMzgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:33:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877E83AF368
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274987.1560952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6YK-0003Pw-Bi; Tue, 07 Apr 2026 13:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274987.1560952; Tue, 07 Apr 2026 13:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6YK-0003NL-8d; Tue, 07 Apr 2026 13:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1274987;
 Tue, 07 Apr 2026 13:33:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA6YJ-0003Mx-0d
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:33:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA6YH-00CKk5-Ur
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 15:33:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d50789-bab6-0a2a0a5309dd-0a2a4506eacc-40
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:33:09 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d50795-0df0-0a2a45060019-d1558030c9b1-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:33:09 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so9694925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 06:33:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48899d1c148sm190756985e9.5.2026.04.07.06.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 06:33:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775568789; x=1776173589; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6KILfXyu71AeLqztPUAP/p5CdHQuV7gOW/9jCvRHJI=;
        b=RWqyg7Ba+NTYIrqGw9ulCP5Ka8qJGB4qlysIdS6ZvCkbLNYERmobWEWhU3blMMPFzk
         mgAX0YAR3e7+t3IqKjwuz5JzLond3B2ODmskzDYUwiV8DhJZogPLoE/dKFy8/ZDPA4ZH
         Y8FyLYP0wlRuNwJIdoOUSJklRUWH5Hy+dDo4RK53d/XL3tiwOISJmbAqh89WMYfsw+ra
         B6H0kkpE/zFvtr3S52jg8I0L9lyS08H/wdtwNIOqPgKANA5U9dD3Ec6+J9dF3Pis5Whe
         6i2TpfDfDIrgRbpe/yR2C+vnsglpVN2pYkRVWjAgT7ScWMd1PF1Q2NWAPoiADWypUUZ5
         u/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568789; x=1776173589;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6KILfXyu71AeLqztPUAP/p5CdHQuV7gOW/9jCvRHJI=;
        b=K/tcWyl21p8dq5bBQk1whMStQYYEkIqEAJXH+DBA+n2giVzgiZgJ2I8gZ3P65IObdG
         4e/hIgle14nZWEIhPwfxJLfsQTd9hedpnrCKXnIsha6UduzZgKGODWFgBUfOpxJnTqOT
         c85KR1AISR8rqq86vWnwscJQGiqDQ/cPQALe32d58TzhH7avc5NyScPhwzNVoT5edlbz
         CAW+HBtZDlE1f90uL7meGwWZtejgAK3M/2KTnyT5sJMO64dpfOo6p0J3Txwp1vgVCYvl
         Oj53fl89fYFhkpGXVbGtDnMlBt6bcvpByt+LOpOhKHStTDt9zAnV4KcIEsgMh/9FcZkj
         WJYQ==
X-Gm-Message-State: AOJu0Yzd79nk/YVsRmfhj8UGLXSgAvu8K+1zfTYVDDS6aWFVESjyV62m
	ZLWKYSkZ4UOCH+xl2Pa1doub/B0XTzvm45+aFBMy080QHkTBtxzBbZ1W5fQkY1TgXKy3b2XN3K9
	f2hy1qQ==
X-Gm-Gg: AeBDietm6Ok4qeG0ytQmFpssldgjqRQ5XO8Q2VUAB1H+Tq4BDl6jensXqx5OI8XzdZj
	YDwQRYwUsHs6ztKSfO6R/ExyS141e0L89+tpfoc+dgjallcUKfpAhU09HsROQd71dbcJA+5YaRw
	8371C1vNhu5FyTUbKsB/OR8V5oQe7RdsuJZK7AT8CH/n6Gy91ZGXt034ACYInGGJrQ5Kus/U7T1
	P3Z7UCw6NLuFqoqLJ5Y4zm8G35cLKB7hwryV6vmyjP7K8m7eP2w49qXja8cfLhjm705CY1LOOEp
	2gUwAXnMQ44hTN8bh9aqwU33VC3N/6tECKa7Dn8FQCQE/kdPbUECctdLxMH+bCAUd3utAvS8FFG
	XDckkyoHoCU0N/ZPUHycIYeDLPXfetn21IlDxNZFPNc5JaHn14AqUVFJIEyv3Bmr4rim7bEvm2x
	c5J4HeH3I9bqLcOC08sXUXErbUTFp4ijHrEnK9PXnW+D1yoQazHqAoXgRlY5zNcVstVMQA1d4KM
	mFOW5DgvA/BrUstpwfQC8oVoQ==
X-Received: by 2002:a05:600c:c8d:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-488997a6883mr230791565e9.23.1775568789016;
        Tue, 07 Apr 2026 06:33:09 -0700 (PDT)
Message-ID: <a77822d8-08f4-4c4f-b291-cc44a213cf9f@suse.com>
Date: Tue, 7 Apr 2026 15:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HPET: channel handling in hpet_broadcast_resume()
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1775568789-AF7393D8-EAABA65A/0/0
X-purgate-type: clean
X-purgate-size: 2216
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 877E83AF368
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The per-channel ENABLE bit is to solely be driven by hpet_enable_channel()
and hpet_msi_{,un}mask(). It doesn't need setting immediately. Except for
the (possible) channel put in legacy mode we don't do so during boot
either.

Instead reset ->arch.cpu_mask, to avoid msi_compose_msg() yielding an
all-zero message (when the passed in CPU mask has no online CPUs). Nothing
would later call msi_compose_msg() / hpet_msi_write(), and hence nothing
would later produce a well-formed message template in
hpet_events[].msi.msg.

Fixes: 15aa6c67486c ("amd iommu: use base platform MSI implementation")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
As to the Fixes: tag: The issue for the HPET resume case is the
cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) check in
msi_compose_msg(). The earlier cpumask_empty() wasn't a problem, as
cpu_mask_to_apicid() returning a bogus (offline) value didn't have any bad
effect: Before use, a valid destination would have been put in place, but
other parts of .msg were properly set up. Furthermore we also didn't clear
the entire message prior to that change.

Many thanks got to Marek for tirelessly trying out various debugging
suggestions.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -685,12 +685,18 @@ void hpet_broadcast_resume(void)
     for ( i = 0; i < n; i++ )
     {
         if ( hpet_events[i].msi.irq >= 0 )
+        {
+            struct irq_desc *desc = irq_to_desc(hpet_events[i].msi.irq);
+
+            cpumask_copy(desc->arch.cpu_mask, cpumask_of(smp_processor_id()));
+
             __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].msi.irq));
+        }
 
         /* set HPET Tn as oneshot */
         cfg = hpet_read32(HPET_Tn_CFG(hpet_events[i].idx));
         cfg &= ~(HPET_TN_LEVEL | HPET_TN_PERIODIC);
-        cfg |= HPET_TN_ENABLE | HPET_TN_32BIT;
+        cfg |= HPET_TN_32BIT;
         if ( !(hpet_events[i].flags & HPET_EVT_LEGACY) )
             cfg |= HPET_TN_FSB;
         hpet_write32(cfg, HPET_Tn_CFG(hpet_events[i].idx));

