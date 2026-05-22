Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHFmNKJqEGrnXAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 16:39:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED15B64AE
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 16:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316928.1586269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQR12-0002nX-LL; Fri, 22 May 2026 14:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316928.1586269; Fri, 22 May 2026 14:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQR12-0002l8-I3; Fri, 22 May 2026 14:38:20 +0000
Received: by outflank-mailman (input) for mailman id 1316928;
 Fri, 22 May 2026 14:38:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQR11-0002l2-0w
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 14:38:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQR10-00F4u5-5V
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 16:38:18 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a106a4c-bab6-0a2a0a5309dd-0a2a4508a598-16
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:38:18 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a106a59-63b5-0a2a45080019-d155dd30c4c2-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:38:18 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-45e7c636e74so4103798f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 07:38:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d71688sm4824656f8f.33.2026.05.22.07.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 07:38:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779460697; x=1780065497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/pRn9LZJwgy+bbz37lqQwUBSagf9USWQAtm+xtRkCw=;
        b=UnZ2FM5zveq2NI3yixVKdq2z4AFRLASETzl0n4FCBH3LnIK1JBoE+SdGNrf2dEymN3
         axzq+EK287V+5HPCO8DRZAEbuhsqJLBitK8f9sEjKlTry3pifi7BLi+qeBiGdWe9X7OP
         0Bhek6PK5lqlpbHoSIkmKjLt16I+5FEAG31D+Ka/D8lmhV5RlMSKM9gXhDPLJSs17xUT
         Z0tSFuiq9SaVfjXUM68hfCWrzofbEMwtcJn/+lU9CAmeIDWI1U0a8OCAnwrLaCpMOvVg
         fBCi0TEDB0oWnpA1A8btbQI6SvKviwlL9P/Ox3rlIy6PaqLKleQui4AzVuDQBvh1nMPN
         62lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460697; x=1780065497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/pRn9LZJwgy+bbz37lqQwUBSagf9USWQAtm+xtRkCw=;
        b=qbE3YwUaSt78aQ2NiprFFg+osZkSLveHikJbHPfTvmF3wBoFTF7Cio4hEe9WERA4fx
         /wuTElTjJjesMQavggHJo3hqizvzt81Q3uOQU5eislTYeis6KGbPLIS4ILMgu4vwwQ3r
         G3yEh1kT6/rDbyZgMEwW7JP8Vw7uOUKOtCokwtljwu2J4ZZ96JLarZfDZ2Yy1vRiP/nn
         ecblsQijpH1mVn+Tso4DpSsHVL9j5Bz9TbFi8xT9sFleP0lOt6sdI+tSb3ckg2QnRWHX
         +0wv5lk1e2e/x9Qou4qNGMB5zITBWVZ0wBUP92qhTt5K0J9UGiHyMziUh+ur4YHwra+a
         +DqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Zt5lxbVbNbl2o0wITENbrNo+NBp/nPaZEt9Ewd2nXwmzkp4wplgu7rNEBYrMjsJrJOCt9ZCXH+8o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJQ921Dwe2vUAazdpKGU4SeOKxCJ1sMvOKwYZLDgJY3d1tVE3W
	BrPCni0AdFB2/zHlBXFLY/GgVXIrWQW2WDk9dZkTDefsWpq+0piVXB00
X-Gm-Gg: Acq92OFGqkMaA3YkKFn0LmFiowipRLa8Mxh/RGYHFZo3pjMekbDXDDryJzzUJYup9dk
	aOUJuJh3xiaf+wFbgo92EaA/YuLcB7+ERD+lIw6f6/JeWKaXfNRN6mWDpxYrghme/nHT1g2h25P
	qcb5TslnbcMxg2WOrX3kaKzTFd0o0CuAChMFY7YwyTbtSqCv1c+rF9/JnqPbAyZYB6h26TYKTnP
	LkG27Y1JzTJuUznzvy4Ap991hhWmybrwTtQBRKCWUL9RY41FvauzyKwxo1kNHuu18sAhdbgduEB
	RF2ZhnQbKCzJdc8Eembl46ffL0OB7Ph/5obH1zT5DATCQgO4kyhEj6MPd+WKliZJk1lemwQm2oe
	Y527poPtUB9zXZArGuFSxFlXwD6A7CFq07WU4xEUTfhYEo9X/ucJMH+5bOziS0d1Le64D6IHsuR
	672vwwq08t5ypJ9oQzmbst6uRCdFFulQA7iihkPaiU/2SJxjzxCnxZqZ3uxB6dWeb68LPz/1cRm
	vw=
X-Received: by 2002:a05:6000:461b:b0:45e:73b3:4515 with SMTP id ffacd0b85a97d-45eb38b7a8bmr5508596f8f.35.1779460697355;
        Fri, 22 May 2026 07:38:17 -0700 (PDT)
Message-ID: <40fa9628-73ab-48cf-9ff4-c87f0595065f@gmail.com>
Date: Fri, 22 May 2026 16:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/26] xen/riscv: introduce init interrupt controller
 operations
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <286a8b99ad7c107fc46c346f7c075617740fa194.1778250616.git.oleksii.kurochko@gmail.com>
 <a94a55e0-b6c7-45ed-bc9f-76022f02b1fa@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a94a55e0-b6c7-45ed-bc9f-76022f02b1fa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779460698-C487BDB1-3ACCDBFD/10/73395122804
X-purgate-type: spam
X-purgate-size: 4016
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 31ED15B64AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 3:25 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> Introduce intc_hw_init_ops structure to avoid risky mix of init
>> function and non-init function.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - New patch.
>> ---
>>   xen/arch/riscv/aplic.c            |  7 +++++--
>>   xen/arch/riscv/include/asm/intc.h | 10 +++++++---
>>   xen/arch/riscv/intc.c             | 10 ++++++++--
>>   3 files changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
>> index 739e8dab3498..97dc0ef731f0 100644
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -306,12 +306,15 @@ static const hw_irq_controller aplic_xen_irq_type = {
>>   
>>   static const struct intc_hw_operations aplic_ops = {
>>       .info                = &aplic_info,
>> -    .init                = aplic_init,
>>       .host_irq_type       = &aplic_xen_irq_type,
>>       .handle_interrupt    = aplic_handle_interrupt,
>>       .set_irq_type        = aplic_set_irq_type,
>>   };
>>   
>> +static const struct intc_hw_init_ops __initdata aplic_init_ops = {
>> +    .init                = aplic_init,
>> +};
> 
> const wants to pair with __initconst. Then:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
Thanks.

> However, I have another comment for consideration:
> 
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -12,9 +12,13 @@
>>   
>>   static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
>>   
>> -void __init register_intc_ops(const struct intc_hw_operations *ops)
>> +static const struct intc_hw_init_ops *__initdata intc_hw_init_ops;
>> +
>> +void __init register_intc_ops(const struct intc_hw_operations *ops,
>> +                              const struct intc_hw_init_ops *init_ops)
>>   {
>>       intc_hw_ops = ops;
>> +    intc_hw_init_ops = init_ops;
>>   }
> 
> Again following what we do e.g. in x86'es IOMMU code, instead of passing
> two pointers to the function, have struct intc_hw_init_ops have a
> const struct intc_hw_operations * member which then can be used to
> set intc_hw_ops here? Both will always come in pairs anyway.

It makes sense to me.

So I will do the following:

@@ -350,7 +351,7 @@ static int __init aplic_preinit(struct 
dt_device_node *node, const void *dat)

      dt_irq_xlate = aplic_irq_xlate;

-    register_intc_ops(&aplic_ops, &aplic_init_ops);
+    register_intc_ops(&aplic_init_ops);

      /* Enable supervisor external interrupt */
      csr_set(CSR_SIE, BIT(IRQ_S_EXT, UL));
diff --git a/xen/arch/riscv/include/asm/intc.h 
b/xen/arch/riscv/include/asm/intc.h
index 8b498e43b33f..3d84fcc51d1a 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -42,14 +42,14 @@ struct intc_hw_operations {
  };

  struct intc_hw_init_ops {
+    const struct intc_hw_operations *ops;
      /* Initialize the intc and the boot CPU */
      int (*init)(void);
  };

  void intc_preinit(void);

-void register_intc_ops(const struct intc_hw_operations *ops,
-                       const struct intc_hw_init_ops *init_ops);
+void register_intc_ops(const struct intc_hw_init_ops *init_ops);

  void intc_init(void);

diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 8649160403f7..3600d23bdb5b 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -14,10 +14,9 @@ static const struct intc_hw_operations 
*__ro_after_init intc_hw_ops;

  static const struct intc_hw_init_ops *__initdata intc_hw_init_ops;

-void __init register_intc_ops(const struct intc_hw_operations *ops,
-                              const struct intc_hw_init_ops *init_ops)
+void __init register_intc_ops(const struct intc_hw_init_ops *init_ops)
  {
-    intc_hw_ops = ops;
+    intc_hw_ops = init_ops->ops;
      intc_hw_init_ops = init_ops;
  }

Thanks.

~ Oleksii


