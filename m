Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA7iBbCEBGrVKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:03:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0936F5349EE
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308062.1579602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNABB-0008WC-6u; Wed, 13 May 2026 14:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308062.1579602; Wed, 13 May 2026 14:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNABB-0008Tb-3v; Wed, 13 May 2026 14:03:17 +0000
Received: by outflank-mailman (input) for mailman id 1308062;
 Wed, 13 May 2026 14:03:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNAB9-0008TM-Fy
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:03:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNAB7-00ER8U-JN
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:03:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a048492-bab6-0a2a0a5309dd-0a2a4503c550-42
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:03:13 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0484a1-672d-0a2a45030019-d155dd33e4d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:03:13 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-44c4cc7c1cfso5649862f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:03:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491e94c0fsm43215896f8f.32.2026.05.13.07.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 07:03:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1778680993; x=1779285793; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTam2C7JN5eqbDP5Ol+DtfDVm/JvrFigtKiO7DH4+fk=;
        b=gWupDNpfggVAOKpOCct/kEPwk936b1o5Y2swnlJWL6AH65KEUrpDwjp/5t4F7Mvjk3
         cY7+AuqniXXmQz65COn0KNhIgaQd7mBNQgiX6/kMH21Y0NpHL/VjN9rlE9eakGoJoCoK
         IovOnVf0GW5dXhd1OH79pVAMUSLzFIFAmDymvCgHTY0Cr4LicNfaFwmgl71Dxp5OkMQ+
         53Ay3KTTPZ4SNFGn8nN8J1TFeXIy2WhQb+g5jeBX9Dkaie4z1JyF+EJByGSrfJdn30FL
         ypw+qgPjZkeyT6g+5PRN8ZQh31J89Vj+G+ZdxGACeghGCNqoOAmQgcNJm7FZLkBcpmWM
         CY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680993; x=1779285793;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTam2C7JN5eqbDP5Ol+DtfDVm/JvrFigtKiO7DH4+fk=;
        b=DmdgzCcFKUlmnexN+XsjSS6GYme+vJgYko8i+4AtNiXlUH91yc3Vl2DcHRt/mcf69Q
         HlhsYRaTr7IFFGhfpZSyhwSnHmxc/oBzqyclMS/2l4ZQrCscIyOayDzFdI4nKz6Dno8d
         /hTX3LO5Vy7BfRHZRMuPQ9DSeFJ+r48K+9b99WWFNRh+xD/Jm7z+UOKwqpVeczjEDSdR
         E9R8aXak+AQF6Pxo479A9v9w7QlNOSXJppyg/62zwIBMh2O15AELCsJehybj30qDaAjf
         L1r5wvg8iEx2Olo7t9Dx+RKrD8tmo8fRC+dBylIvB6U+xXCp0/h9aYEpKCp6B0myjIYc
         e6CA==
X-Gm-Message-State: AOJu0YzsSEBO7JZ7lLgu8WYZ+U7n0MG3pmwz+rp7Any73ZN3BYZVH6kT
	geXbfbq/oNVCis0sJ2wp3FbKC6QNm45tkBch3uuL8ehQbqGNS3pBPla6uuX2RjAQDzQVGknVIia
	Rrck=
X-Gm-Gg: Acq92OEnCwvXCH8olaarwP9CpMIeupPah2w6BguC8qdzup+qvy3mFbxijEtQ4qIsIZj
	SoAyv2DgbselJ9IiDZN/zYSWu6SubwSpwHrTtYkwQYGi1fC4QR4NR7whnXmrw2IV8CiUEC3ECyh
	UCIQh8nKp53n+/IvfttFu/CQ0sJCJdlmV9w3fZdqREd4v5PA3GWHa15+AyQRiQPcrOx8mdmxqJ/
	qnAIM795eFBeRywnUR8IAQvJanoCDvhRHcfa0clCEwz8mHYlWD/aZeNYZQLOs7fzsSQHVWjCwmk
	S78iXfGloddLbkexZvkbi/eCFJiRUPSlnzBebgdsErjuQGUMhVBS4WDmLJDGJ9RL0p1zMn51fU7
	l1x+nph6Nan0fxEFgXfCGSoYyf3SZwTKpyfXtJfPRUEnJS4T3vbe0imY1bhbdouMEpygrefjiGw
	vlrRsmh9wH34TwWYEs2SQWBNKmXPpVJfIWMvPeG5A8k74BTZULTvrofoieYiJyu3MhiMB3gCCvK
	fyngxDps+ziNyk=
X-Received: by 2002:a05:6000:220b:b0:43c:f583:126a with SMTP id ffacd0b85a97d-45c7843076emr5140692f8f.14.1778680992924;
        Wed, 13 May 2026 07:03:12 -0700 (PDT)
Message-ID: <bc6027ad-c8e8-4586-b165-d0f730cfa63c@suse.com>
Date: Wed, 13 May 2026 16:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: address Misra C:2012 rule 8.4
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
X-purgate-ID: tlsNG-33051d/1778680993-37B4C938-E3BB1213/0/0
X-purgate-type: clean
X-purgate-size: 1425
X-Rspamd-Queue-Id: 0936F5349EE
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

... ("A compatible declaration shall be visible when an object or function
with external linkage is defined"). Three variables lack asmlinkage
annotations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
(covering more than just this)

--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -22,7 +22,7 @@
 
 /* Initialised in head.S, before .bss is zeroed. */
 bool __initdata pvh_boot;
-uint32_t __initdata pvh_start_info_pa;
+uint32_t asmlinkage __initdata pvh_start_info_pa;
 
 static multiboot_info_t __initdata pvh_mbi;
 static module_t __initdata pvh_mbi_mods[8];
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -40,7 +40,7 @@ DEFINE_PER_CPU(struct vcpu_info *, vcpu_
  *     0 vmcall
  *   > 0 vmmcall
  */
-int8_t __initdata early_hypercall_insn = -1;
+int8_t asmlinkage __initdata early_hypercall_insn = -1;
 
 /*
  * Called once during the first hypercall to figure out which instruction to
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -180,7 +180,7 @@ void pv_ring1_init_hypercall_page(void *
     }
 }
 
-void do_entry_int82(struct cpu_user_regs *regs)
+void asmlinkage do_entry_int82(struct cpu_user_regs *regs)
 {
     if ( unlikely(untrusted_msi) )
         check_for_unexpected_msi((uint8_t)regs->entry_vector);

