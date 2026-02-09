Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGWvAaSriWmXAgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:40:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BB810DA98
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225075.1531530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNkv-00085g-IO; Mon, 09 Feb 2026 09:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225075.1531530; Mon, 09 Feb 2026 09:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNkv-00084E-FI; Mon, 09 Feb 2026 09:40:33 +0000
Received: by outflank-mailman (input) for mailman id 1225075;
 Mon, 09 Feb 2026 09:40:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpNkt-000844-Gk
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:40:31 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e9e2732-059b-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 10:40:29 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso39920215e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:40:29 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320410b78sm136213835e9.2.2026.02.09.01.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 01:40:28 -0800 (PST)
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
X-Inumbo-ID: 5e9e2732-059b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770630028; x=1771234828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hL5ylKQQZwhy5EKQP6ncYf+9DocqDBHr6X+tFP4oOY8=;
        b=g2s5WqatTXTJKCReZqCZdfkMNNqMzd80ZOnXIMTqAWA1NUQCUZnJ6URIJ5RBbN2sRo
         czsInJKoxC1O2i5gAga9UprwNu/eFpSOflGmroTQn/ObJhGesbXQ2nOJ+HyuO51lFc+r
         2zdrTG+6EGkMBfJIokH/IXZv3Pw27lHSVNi+yo3C3j7WpjYTk4YxbGoHDvj7s/he4Ye5
         f+wbUki56nDcYhplkL56aoG/v2fhQYtI9kyymz6IZjc0G+BMnvH/2PEQLMuO8WxPVFpx
         6yhbbnG/scob6AL+Jpip812SPLJiCLW/GnQiObz2LNNniuQoD4M+7lTqpzMds2BBqqv6
         gHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630029; x=1771234829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hL5ylKQQZwhy5EKQP6ncYf+9DocqDBHr6X+tFP4oOY8=;
        b=vbuO5MY9cCvgRcoajrScilmmY+rp6Egc6duxdvz7WYlzLaVtihRWEJ8QezRW9Q2erh
         TfxPIZr2kKw9FNyAW8tkWXDgLBG2jG4BJtD6Ug012WGjZ6LIckVKjJwh4ziaEKc+Qe47
         YzQlZ69OhFbRkpWGVfY3JxRia+fKLQehi8/48waMaJB4/4rJqiZGo6cSbhOWbofKkDkh
         7w+4vTJMNCNP92dV+BpguvHsQqazaSalaiLnXmkXhiWiSKG7Uj+WUfdR8LO8iPOfh7pw
         fQRHCU0/bcKq26asbinBFPhDX0sGT380/1zyrfcA2UUCBFfExwCmhTS54bnxFjPyUVc5
         tcAw==
X-Forwarded-Encrypted: i=1; AJvYcCVDzHQk2XGTxa3Q69iyoFjw0vm3FowVd2RzcTBFEYt4q6qxVZJxWEPp7jepQfNbQ8HDLLa0lyjfm38=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMTbT3gd6D+jZrUjSEBQ+4NAOd4muG1Fg++ytcknzU+OLt8wH4
	hAINvs/xlb4qDBjcOrbeOyt1N5dmU5QQy4DzFHDyZBHwnj8P4jP1jaOK
X-Gm-Gg: AZuq6aIHhhOgDbf8kkhug2RF6nVLD8/a4rR6i4/XTIjhCl9J5sdWpiNg82mljZtJNfe
	WpJvhFnnOvYJELDpwCX8XBCdqEGKzSFTkdWORzqm14c4HVPYIgeziC2k3DRnnr9rZf6mthGaTSH
	XkCWXTWiLMTI4s8oHCwB9OpnVC7V8x/Xd8JzN8Vy5GG8Yu2xwir9xA7m7bXmPqEDZKIpQU/GynK
	2ekvq76DrVlnnNTi+BKtFoD69ufrsy4R0ec4WnNknQw2FfWpboNNHIUnWvqwCXCin4gQ9kryQLw
	zAdbweEM+brJO7Um0zqwrct4lWWUsKfo9pgcJv9UaylZn/KbapEMZmHxs9geE2euVQXAuRf6d48
	1Ly0a7Qy3ZhtOGKTEniAN/i0czx4qYBTPvJM2Qo6wKcul+1epjZzXWddBOHQ4aXLOM8h+n+YppA
	yGkWXY78WKkF3Bg/EsSRmWVR1bEypx1QbEyxg+2MfqpFEs4CzumEbXl82a2LB3deJgy0B4rRqVB
	A==
X-Received: by 2002:a05:600c:d8:b0:47e:e452:ec12 with SMTP id 5b1f17b1804b1-48317921817mr145153785e9.15.1770630028315;
        Mon, 09 Feb 2026 01:40:28 -0800 (PST)
Message-ID: <29006d8a-e003-4451-99af-0eef8f7d1c08@gmail.com>
Date: Mon, 9 Feb 2026 10:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] xen/riscv: introduce vcpu_kick() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <0335a7db0343d81ce4256482a464e7ba5df1c204.1769099885.git.oleksii.kurochko@gmail.com>
 <14d19350-0de8-4496-99e5-0ba76e421684@gmail.com>
 <4a12e652-5b53-40d0-b701-d1f5b749dfa7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4a12e652-5b53-40d0-b701-d1f5b749dfa7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 52BB810DA98
X-Rspamd-Action: no action


On 2/9/26 10:07 AM, Jan Beulich wrote:
> On 06.02.2026 17:36, Oleksii Kurochko wrote:
>> On 1/22/26 5:47 PM, Oleksii Kurochko wrote:
>>> Add a RISC-V implementation of vcpu_kick(), which unblocks the target
>>> vCPU and sends an event check IPI if the vCPU was running on another
>>> processor. This mirrors the behavior of Arm and enables proper vCPU
>>> wakeup handling on RISC-V.
>>>
>>> Remove the stub implementation from stubs.c, as it is now provided by
>>> arch/riscv/domain.c.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Changes in v2:
>>>    - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
>>> ---
>>>    xen/arch/riscv/domain.c | 14 ++++++++++++++
>>>    xen/arch/riscv/stubs.c  |  5 -----
>>>    2 files changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>>> index e38c0db62cac..13ac384c4b76 100644
>>> --- a/xen/arch/riscv/domain.c
>>> +++ b/xen/arch/riscv/domain.c
>>> @@ -1,8 +1,10 @@
>>>    /* SPDX-License-Identifier: GPL-2.0-only */
>>>    
>>> +#include <xen/cpumask.h>
>>>    #include <xen/init.h>
>>>    #include <xen/mm.h>
>>>    #include <xen/sched.h>
>>> +#include <xen/smp.h>
>>>    #include <xen/vmap.h>
>>>    
>>>    #include <asm/bitops.h>
>>> @@ -240,3 +242,15 @@ void vcpu_sync_interrupts(struct vcpu *v)
>>>    #   error "Update vsieh"
>>>    #endif
>>>    }
>>> +
>>> +void vcpu_kick(struct vcpu *v)
>>> +{
>>> +    bool running = v->is_running;
>>> +
>>> +    vcpu_unblock(v);
>>> +    if ( running && v != current )
>>> +    {
>>> +        perfc_incr(vcpu_kick);
>> Because of this it is needed to introduce:
>>     PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
>> Otherwise randconfig build will fail when CONFIG_PERF_COUNTERS=y.
>>
>> I would like to ask if it would be okay to add it xen/include/xen/perfc_defn.h
>> just after PERFCOUNTER(need_flush_tlb_flush,...) or would it be better to have
>> it in arch specific perfc_defn.h?
> Arch-specific please - it's not used by x86 nor ppc.

Then I will do the following changes:

diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index 3824f31c395c..86c56251d5d7 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -7,7 +7,6 @@ generic-y += hypercall.h
  generic-y += iocap.h
  generic-y += irq-dt.h
  generic-y += percpu.h
-generic-y += perfc_defn.h
  generic-y += random.h
  generic-y += softirq.h
  generic-y += vm_event.h
diff --git a/xen/arch/riscv/include/asm/perfc_defn.h b/xen/arch/riscv/include/asm/perfc_defn.h
new file mode 100644
index 000000000000..4fc161f1abad
--- /dev/null
+++ b/xen/arch/riscv/include/asm/perfc_defn.h
@@ -0,0 +1,7 @@
+/* This file is intended to be included multiple times. */
+/*#ifndef __XEN_PERFC_DEFN_H__*/
+/*#define __XEN_PERFC_DEFN_H__*/
+
+PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
+
+/*#endif*/ /* __XEN_PERFC_DEFN_H__ */

and add the following to commit message:
     Since vcpu_kick() calls perfc_incr(vcpu_kick), add perfcounter for
     vcpu_kick to handle the case when CONFIG_PERF_COUNTERS=y. Although
     CONFIG_PERF_COUNTERS is not enabled by default, it can be enabled,
     for example, by randconfig what will lead to CI build issues.

Note that I keep __XEN_PERFC_DEFN_H__ as other archictectures use the same,
not something like ASM__<arch>__PERFC_DEFN_H.

Let me know if these changes are okay for you and if I can keep your
Acked-by for this patch.

~ Oleksii


