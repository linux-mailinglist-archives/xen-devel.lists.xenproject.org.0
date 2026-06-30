Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jN5jG7TaQ2oZkQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 17:03:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B376E5AFA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 17:03:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qpeSIKLw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1349082.1606903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZyl-0002nE-Ea; Tue, 30 Jun 2026 15:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349082.1606903; Tue, 30 Jun 2026 15:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZyl-0002kT-BI; Tue, 30 Jun 2026 15:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1349082;
 Tue, 30 Jun 2026 15:02:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weZyk-0002kN-1k
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:02:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weZyi-0008PV-OT
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:02:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a43da79-bab6-0a2a0a5309dd-0a2a450b9788-20
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:02:24 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a43da80-ac48-0a2a450b0019-d155d035dd50-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:02:24 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-697de23bd7dso6662642a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 08:02:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c93cbf8sm1409445a12.17.2026.06.30.08.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 08:02:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782831744; x=1783436544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNOl9B9oWCKTnZ8/Bn3weNo3vlLLQEPDaOkyOhiaC3k=;
        b=qpeSIKLwNmynkPDf1WWOBsxFqukOvXy41hIe0rHp10Vd/xe6bTqhMKz510/cIJTK8m
         mC0Px5oVbYka3qaKyCGW2zmeOzwVD9dbK3lQ9GsGf21U1nWn1f86I3wq0AVwZBvBGKLg
         kyyMNEQNBLAk5/1lgX2tlaSk5xZ3+/4xyN2fegAH3g2T8OVxSnUgL5e2QfwislchChFt
         VAZhWhXMHXkETfgsASP/WGmJZQR7Xsl5tl1BellLyelSXIIhEXVHt1acIgD+RJCeiFnm
         VotKZ+fE8FtUyNhXow85z8MIfdbA7K0l8o3IhRVqmxPzmNOsp+TXEHlsoNV/1MQoFjJN
         jlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831744; x=1783436544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNOl9B9oWCKTnZ8/Bn3weNo3vlLLQEPDaOkyOhiaC3k=;
        b=AChu8l0Gx4GiALBpbSy2HN54zYvAh0dxFn3Az3cKQ1n+njx9f7iCcVjCpzNOQd8oJ1
         NiODdMcYEb4KNmMGSUW0jqd+V8dvQ8DJLzWLrbuwoveO+uppULvbaP01tBK7h00vOAY2
         WIDQqn8NFpEpdA7JPpCWheI/xmRGv+dPnD97phMdcL9lr0ZwGPhUup5POGwlDVUxgr5c
         xEUl8luzVh5JvUVPcI4R7XvOluevGJ+wQNdIwfGP5iFf4LuQd8Ojt5rjGvR9LROaRZpD
         IM6hiUMWZLxFpiYOgwpJ2EcqZQzF4o4nx3Ph4y4PHGChwYoYzVR97Hf15WpbviPT1qbK
         4WAw==
X-Forwarded-Encrypted: i=1; AHgh+RqfrucN6m77TIkUeW/6TUWFRVmZ7BhV+yjRIn8vtgadlvjxAwE3ZSeerIguDr5QKyX8uhTzlbJKRXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxj0Ids7haz1wL7HFjM8EEGWo2MiUCbrY9F6gsJzHbmtRfvnOO8
	Os8km3ouEyV67p3SP9v6Q2zuQeg2KDB+rY+ONhWFZXtT/DonjjoQQFEP
X-Gm-Gg: AfdE7cmAZbFFVWnDEU8KO5aUUFh3UXBVqQT00BS+N3wenNTMNTAdX+0xodOx1GYxZRU
	oMdq3FPN8umrpNURiUKS4LRa8E0REsI7HN9judC8pMCcqhOwDPkpUiqo6/3iljhOns0WOnKwRXK
	NaD2iUbfM6M42GLMeIJrzvYR7wYmobTMTyHig1ZuPkb/KV6Jjy8H1qkqq6rRxtOcxK46pO1ADa5
	m0acuFMFa9tw3Mo0gXq149TdDxrSQCH+5clTsfM+fvEYr68J5IaKEUP3vhj+I7pteHQhWFGeNs5
	AdrubLe9T29u6o2/Z/Slc22qGwh6uLec5WGC2goMPwYfTENAib92/F0QbPnbq5znsDn3JxiB+pX
	G5bpPsTA9aJcnIW2YG2rztQI4CPM8fDEIZDVBlnoLimGoAp0nIWNhUqSeWVkZMRvfA7dVg8KbHx
	jnAVALtQqG1LxH3EkE1junzgosQPOrc+UtH8Jmvf/RcmUop/yQF6Yv4KrdqFDTCUGGqpU=
X-Received: by 2002:a05:6402:348a:b0:695:572a:7abb with SMTP id 4fb4d7f45d1cf-69879e267e5mr1878855a12.22.1782831742186;
        Tue, 30 Jun 2026 08:02:22 -0700 (PDT)
Message-ID: <0e2a8eab-366f-4384-a467-43f051d047ec@gmail.com>
Date: Tue, 30 Jun 2026 17:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <775c88457e5ec7fc7889002c6f9829669f9bce97.1782388193.git.oleksii.kurochko@gmail.com>
 <5d344cec-bb97-4d3b-87ff-e7175772fd45@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5d344cec-bb97-4d3b-87ff-e7175772fd45@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782831744-4074F220-86A99756/10/73395122804
X-purgate-type: spam
X-purgate-size: 6383
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2B376E5AFA



On 6/29/26 4:26 PM, Jan Beulich wrote:
> On 25.06.2026 18:02, Oleksii Kurochko wrote:
>> On architectures that run guests in dom0less mode without the PV ABI
>> (currently RISC-V), no shared_info page is allocated and d->shared_info
>> remains NULL throughout the domain lifetime.  Several places in common
>> code access d->shared_info through the shared_info() macro or directly,
>> causing UBSAN null-pointer errors on such architectures.
>>
>> Rather than adding runtime NULL guards that are logically unreachable
>> on x86 and Arm (where shared_info is always allocated), introduce a new
>> Kconfig symbol CONFIG_HAS_SHARED_INFO selected by x86 and Arm.
>>
>> On !HAS_SHARED_INFO the shared_info() macro expands to a dereference
>> of a pointer returned by shared_info_absent(), which is declared but
>> intentionally never defined.
> 
> This looks to need updating.

I will update it to:

On !HAS_SHARED_INFO the shared_info() macro expands to a dereference of 
shared_info_absent, an extern pointer that is declared but intentionally 
never defined.

> 
>>   Any use of shared_info() that is not
>> dead-code-eliminated will therefore cause a link-time failure, making
>> missed guards impossible to overlook.
>>
>> The 2L event-channel ops call shared_info() and must not be compiled on
>> architectures without a shared_info page, so event_2l.o is gated on
>> CONFIG_HAS_SHARED_INFO.  On such architectures evtchn_init() installs
>> the FIFO ops as a placeholder instead; evtchn_fifo_word_from_port() is
>> guarded against uninitialised d->evtchn_fifo so the FIFO ops are safe
>> before evtchn_fifo_init_control() is called by the guest.
>>
>> With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
>> dummy_vcpu_info, so writes through vcpu_info() could leak data between
>> vCPUs. Reviewing the write paths in common code: the write in
>> map_guest_area() stores the constant ~0 so nothing serious would happen
>> if it were leaked; the event_2l.c paths are unreachable because the
>> preceding shared_info() call would trap first;
> 
> Why "trap"? You can't build an image that way, can you?

"trap" was shorthand for the link-time failure.

I will changed that part to:
... leaked; the event_2l.c paths are not compiled on !HAS_SHARED_INFO, 
as event_2l.o is gated on CONFIG_HAS_SHARED_INFO; ...

> 
>> @@ -1624,7 +1626,11 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
>>   
>>   int evtchn_init(struct domain *d, unsigned int max_port)
>>   {
>> -    evtchn_2l_init(d);
>> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>> +        evtchn_2l_init(d);
> 
> For this to build when !HAS_SHARED_INFO, all you need is a declaration of
> the function. The compiler will DCE the call. Hence ...
> 
>> --- a/xen/common/event_channel.h
>> +++ b/xen/common/event_channel.h
>> @@ -44,7 +44,11 @@ static inline void evtchn_port_print_state(struct domain *d,
>>   
>>   /* 2-level */
>>   
>> +#ifdef CONFIG_HAS_SHARED_INFO
>>   void evtchn_2l_init(struct domain *d);
>> +#else
>> +static inline void evtchn_2l_init(struct domain *d) {}
>> +#endif
>>   
>>   /* FIFO */
>>   
> 
> ... this hunk should be unnecessary?

Looks like you are right, I will double-check that.

> 
>> @@ -55,6 +59,7 @@ struct evtchn_expand_array;
>>   int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
>>   int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
>>   void evtchn_fifo_destroy(struct domain *d);
>> +void evtchn_fifo_init_ops(struct domain *d);
>>   #else
>>   static inline int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
>>   {
>> @@ -68,6 +73,7 @@ static inline void evtchn_fifo_destroy(struct domain *d)
>>   {
>>       return;
>>   }
>> +static inline void evtchn_fifo_init_ops(struct domain *d) {}
>>   #endif /* CONFIG_EVTCHN_FIFO */
> 
> Unlike these two. Which raise a different question though: What will be the
> behavior when EVTCHN_FIFO=n and HAS_SHARED_INFO=n? Taking
> evtchn_alloc_unbound() as example, afaict evtchn_port_init() will stumble
> over a NULL pointer. Looks like for that (and only that) case we still need
> your earlier dummy fallback.

I will introduce dummy fallback (I will shrunk some stubs in final version):

+#ifndef CONFIG_HAS_SHARED_INFO
+static void cf_check evtchn_none_set_pending(
+    struct vcpu *v, struct evtchn *evtchn) {}
+static void cf_check evtchn_none_clear_pending(
+    struct domain *d, struct evtchn *evtchn) {}
+static void cf_check evtchn_none_unmask(
+    struct domain *d, struct evtchn *evtchn) {}
+static bool cf_check evtchn_none_is_pending(
+    const struct domain *d, const struct evtchn *evtchn) { return false; }
+static bool cf_check evtchn_none_is_masked(
+    const struct domain *d, const struct evtchn *evtchn) { return true; }
+static void cf_check evtchn_none_print_state(
+    struct domain *d, const struct evtchn *evtchn) {}
+
+static const struct evtchn_port_ops evtchn_port_ops_none = {
+    .set_pending   = evtchn_none_set_pending,
+    .clear_pending = evtchn_none_clear_pending,
+    .unmask        = evtchn_none_unmask,
+    .is_pending    = evtchn_none_is_pending,
+    .is_masked     = evtchn_none_is_masked,
+    .print_state   = evtchn_none_print_state,
+};
+
+static void evtchn_none_init(struct domain *d)
+{
+    d->evtchn_port_ops = &evtchn_port_ops_none;
+}
+#endif

> 
>> @@ -420,6 +423,11 @@ static const struct evtchn_port_ops evtchn_port_ops_fifo =
>>       .print_state   = evtchn_fifo_print_state,
>>   };
>>   
>> +void evtchn_fifo_init_ops(struct domain *d)
>> +{
>> +    d->evtchn_port_ops = &evtchn_port_ops_fifo;
>> +}
> 
> Isn't this unreachable code when HAS_SHARED_INFO=y, violating Misra rule 2.1?
I think if we are going to return back to dummy fallback I think that we 
could drop evtchn_fifo_init_ops() as  d->evtchn_port_ops will be 
initialized later for FIFO. And then in evtchn_init:

int evtchn_init(struct domain *d, unsigned int max_port)
{
     if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
         evtchn_2l_init(d);
     else
         evtchn_none_init(d);

(and I expect evtchn_none_init() will be just dropped by compiler if 
CONFIG_HAS_SHARED_INFO=y so nothing extra should be done)

Thanks.

~ Oleksii

