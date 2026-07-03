Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id divSOpOQR2odbQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 12:36:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E2701452
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 12:36:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Cm3MqSGJ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353121.1609258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfbEY-0003b6-As; Fri, 03 Jul 2026 10:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353121.1609258; Fri, 03 Jul 2026 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfbEY-0003ZA-7h; Fri, 03 Jul 2026 10:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1353121;
 Fri, 03 Jul 2026 10:34:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfbEV-0003Yy-NM
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 10:34:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfbEV-00GptB-3t
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 12:34:55 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a47903e-5cb7-0a2a0a5109dd-0a2a450ab3c0-16
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 12:34:55 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a47904e-e40e-0a2a450a0019-d155d0b1a9f0-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 12:34:55 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3995e22ef81so13776451fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 03:34:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aed136f8c6sm377488e87.17.2026.07.03.03.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 03:34:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783074894; x=1783679694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVVSDVvGSqDjS8eedHXV2NuXXVvLPdFwplVOOg+Moow=;
        b=Cm3MqSGJUl1BOxXd5ebJK3IVB4plyVYdHWVq55kGvXFbqx+19JhWDqb/AOP4M52Hvy
         rYjTD0yR8YPncViFbJRgxg3UZmzeusEdqSEeDG4JksPh1I1KwEOwbXsVe44AjWSmlrYC
         bMe1gJTOj+zE65kF5w3pHL3VhzPdVdzzFmGij0RL0rX79WV56Yuf7VIaYnNbOEkxABE6
         iVULKdEK22Vm5P62zJMSMabCiAFCQGzaiciKI4ve6Pizw9kQ5Yq3h36vsiwwioaPggA+
         Zk57JFICkcNpLEJ0rcXH2Erpc5HKjxUcOmZxrGy424yv256nghcfNs7Vx6O1Wmvunng3
         v7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074894; x=1783679694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVVSDVvGSqDjS8eedHXV2NuXXVvLPdFwplVOOg+Moow=;
        b=KX2co7Y67zxT5C03bUc22GZCgeRYOF8RUY29zx9UReJsmDXG6kjWTD5fhCOiNBgNaP
         T6zjILRn3pC870sGUddlANlak23qKuODexheUcGJDPnus3UkKuZW9DH9IH7KowmDIAX6
         3G1vL1ELLUNENwx2oa7/EjtjGpV64XEPlawweRpFm7jWrlD/wvbYA24oT60F6ePfxuWO
         5I1sFdpn1Nmp2Rhph9JsYv7f48QdeSVH0hsWb9FgzjPEoprw3yctnzultgvW83qRX6II
         Px3OqZSQWZHArqnX2is++eXei/ZJ4yoOaBQ7AKqI3GpYMyP+Hwa6pSUk3PgjZuGayZiQ
         PUjQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3RILp9IqAfY7sG2DP6vCvYGYlNriPvVFUOQ4ykPbt9/5ZShGdwKQEk+VXfqaZjk2frCuUYRCrcSA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOIBI5IesAspz1vZg3OpHY60R3YvIHOkmiXH25mZg1CeLvd8oM
	eu4SqAJ1Tt1ab8v6u5a6NXKxiLGOEujZAo58tjCE+azsdeXF3sG/UEflPVFotQ==
X-Gm-Gg: AfdE7cmH3yQ2W1GC5BbIX/4ZGrAhv+oxPS/O1X+Ou7iMXvuzIYkgiHA8OQWt3ej4sS4
	9HYXuWL0o4GbjBBMAU3DiqtIRPRJLFtGaNTFg0jhXfe+7paQVQAS18ujxeukNP7iy8FjZnuBgRB
	ebFunoRAf/JMo9ShvG9G0EkvXMWgu9gmPZ+FXDLI0sKnUA9eMlPad0WC6QA9tNmTGknp6E2C7Nw
	RZ4oHoQ+dC2QjxrLpgE+6JTNMRs7q/r4NsTo1JwnUCKRMoi9hWC8Irly06uNnDLykb1Z5QDry1C
	s3RFQOhljt2YljeOX/x+lxfIJ+CpeFLdQGdTrxd6tza+DV01bTBXLUcwhUwGwbF5xYc+OtlQj12
	+DzsZFoiTEoBN+w8v6TqrT9CFSWcxjpsinPkgT4sc7rViaTlDlltLEJSIcKXhes9+LBhEkzLXrG
	hj/lOpcm2uQNfg/b2WL4z59//uKCkzsO/voP17XHzLibivvfd9kiCzcVV6JJHWLftDEO4LqUVW3
	CLhsA==
X-Received: by 2002:a05:6512:8393:b0:5ae:b7c1:f7a with SMTP id 2adb3069b0e04-5aecf506c4fmr601997e87.30.1783074894038;
        Fri, 03 Jul 2026 03:34:54 -0700 (PDT)
Message-ID: <ad7056c5-e378-4bf7-aee9-8420aef38b35@gmail.com>
Date: Fri, 3 Jul 2026 12:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/25] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <472a77604d35a0bc2a75b71f250fd67b63afde4c.1782487661.git.oleksii.kurochko@gmail.com>
 <ac1a3a08-dc39-4794-ba96-dab4b88c27a3@suse.com>
 <6aafbeb5-2f33-49f4-9d14-937b0bc4d15d@gmail.com>
 <40bcf6b7-306a-419a-bf12-1855f9e589fe@suse.com>
 <91ffc1b2-7648-4185-a2f1-12b30181c8a9@gmail.com>
 <e7d430c1-fe57-4b28-a5a2-1c8bfcd54ac4@suse.com>
 <d25c4b45-c3db-4a48-bc18-da9037a858d0@gmail.com>
 <9a8c4ef2-ae6d-48bc-bd41-6c3147acaff8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9a8c4ef2-ae6d-48bc-bd41-6c3147acaff8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1783074895-3DC0CDDE-162FCA1B/10/73395122804
X-purgate-type: spam
X-purgate-size: 6865
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 448E2701452



On 7/3/26 9:21 AM, Jan Beulich wrote:
> On 02.07.2026 18:04, Oleksii Kurochko wrote:
>> On 7/2/26 4:32 PM, Jan Beulich wrote:
>>> On 02.07.2026 11:33, Oleksii Kurochko wrote:
>>>> On 7/2/26 8:38 AM, Jan Beulich wrote:
>>>>>>>> +    spin_unlock_irqrestore(&desc->lock, flags);
>>>>>>>> +
>>>>>>>> +    release_irq(desc->irq, info);
>>>>>>>> +    xvfree(info);
>>>>>>>
>>>>>>> If, in release_irq(), action isn't freed, it's ->dev_id field will now have
>>>>>>> a dangling pointer. (I think I did point this out before.)
> 
> We'll be back to this if ...
> 
>>>>>> It should freed in release_irq() as route_irq_to_guest() always set
>>>>>> action->free_on_release = true;
>>>>>
>>>>> Well, "free_on_release" must exits for a purpose. I.e. there must be, now
>>>>> or soon, cases where it's set to false. Else simply drop the field.
>>>>
>>>> I can't simply remove this field because it is part of the common
>>>> `struct irqaction` and is used by other arc-s. (I assume that it is not
>>>> what you fully meant...)
>>>>
>>>> IIUC, this field is used to determine whether an irqaction is
>>>> heap-allocated (and therefore should be freed) or statically allocated
>>>> (and therefore should not be freed).
>>>
>>> Yes. However, all uses of the field are in arch-specific code. So in
>>> principle it could be #ifdef-ed out for RISC-V. There may be a better
>>> option, though:
>>>
>>>> At the moment, all IRQ actions are heap-allocated (on RISC-V), so
>>>> free_on_release should always be set to true. In particular, the code
>>>> snippet you asked about releases a guest interrupt, and guest interrupt
>>>> actions are always heap-allocated. As a result, when release_guest_irq()
>>>> calls release_irq(), the associated irqaction will be freed.
>>>>
>>>> So, from what I can see, the current behavior is correct and I think it
>>>> should be left as it is. Do you have any concerns about this?
>>>
>>> If you only ever have the field set to true, use ASSERT() in place of
>>> if().
>>>
>>
>> It looks like that if we want an `ASSERT()`, it should be in
>> `release_guest_irq()`. However, that would require duplicating part of
>> `release_irq()` to locate the corresponding `irqaction` and verify
>> `free_on_release`. Since guest IRQs are created through
>> `route_irq_to_guest()`, which always sets `action->free_on_release =
>> true`, we are already safe.
>>
>> I don't see much benefit in replacing the `if` statement with an
>> `ASSERT()` in `release_irq()`. The current implementation is generic and
>> would also work for Xen-owned, statically allocated interrupts (even
>> though there are none today). If we replace the `if` with an `ASSERT()`
>> now, anyone introducing a Xen-owned, statically allocated interrupt in
>> the future would simply have to revert the change and restore the `if`
>> statement, bringing us back to the current implementation.
> 
> ... such a change was made. Imo you have two choices: Deal with the issue
> properly right away, keeping the if().

So then my fix will look like as embed struct irqaction as the first 
member of struct irq_guest and allocate them as one block. Then 
xvfree(action) inside release_irq() (gated by the still-meaningful if 
(action->free_on_release)) frees the whole thing - no separate 
xvfree(info) needed anywhere, so the dangling pointer can't happen 
regardless of what free_on_release is:

$ git diff
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 830f8d5d5997..146156f1caae 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -19,9 +19,18 @@
  #include <asm/hardirq.h>
  #include <asm/intc.h>

-/* Describe an IRQ assigned to a guest */
+/*
+ * Describe an IRQ assigned to a guest.
+ *
+ * The irqaction is embedded here (rather than allocated separately with
+ * its dev_id pointing at a standalone struct irq_guest) so that freeing
+ * the action in release_irq() also frees this whole structure in one go.
+ * That avoids the alternative of release_irq()'s caller having to free
+ * dev_id itself (something like in Arm release_guest_irq()).
+ */
  struct irq_guest
  {
+    struct irqaction action;
      struct domain *d;
      unsigned int virq;
  };
@@ -345,7 +354,6 @@ int release_guest_irq(struct domain *d, unsigned int 
virq)
      spin_unlock_irqrestore(&desc->lock, flags);

      release_irq(desc->irq, info);
-    xvfree(info);

      return 0;

@@ -369,20 +377,23 @@ int route_irq_to_guest(struct domain *d, unsigned 
int virq,

      desc = irq_to_desc(irq);

-    action = xvmalloc(struct irqaction);
-    if ( !action )
-        return -ENOMEM;
+    /*
+     * release_irq() frees this action via xvfree(), relying on action
+     * being the first member of struct irq_guest so that &info->action
+     * coincides with info itself. Guard the layout so a future field
+     * reorder can't silently turn that into a free() of a mid-allocation
+     * pointer.
+     */
+    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);

      info = xvmalloc(struct irq_guest);
      if ( !info )
-    {
-        xvfree(action);
          return -ENOMEM;
-    }

      info->d = d;
      info->virq = virq;

+    action = &info->action;
      action->dev_id = info;
      action->name = devname;
      action->free_on_release = true;
@@ -436,15 +447,13 @@ int route_irq_to_guest(struct domain *d, unsigned 
int virq,
      if ( retval )
      {
          release_irq(desc->irq, info);
-        goto free_info;
+        return retval;
      }

      return 0;

   out:
      spin_unlock_irqrestore(&desc->lock, flags);
-    xvfree(action);
- free_info:
      xvfree(info);

      return retval;

Also, with such approach release_guest_irq() could be dropped at all, at 
least for now.

Does this approach look good?

  Or assume "free_on_release" is only
> ever true, and add an assertion to this effect (indicating that code needs
> auditing if that assumption is broken).

I think I'm okay with using ASSERT() instead of the changes suggested above.

What I don't understand is why you think it would be better to put the 
ASSERT() in release_irq() instead of keeping the if():

```
...
     if ( action->free_on_release )
         xvfree(action);
}
```

As I understand it, the dangling pointer problem would only occur if 
someone started statically allocating guest interrupts, right? At least 
for now, all guest interrupts are heap-allocated by route_irq_to_guest().

So my understanding is that we want to ensure that nobody starts 
statically allocating guest interrupts in the future. If that's the 
case, wouldn't it make more sense to add the ASSERT() to 
release_guest_irq(), somewhere before xvfree(info); rather than to 
release_irq()?

~ Oleksii

