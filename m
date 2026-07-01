Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3kw9LYUxRWry8QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:25:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1346EF39B
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:25:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="rmxzl/zz";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1350153.1607711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewou-0003Ps-Ij; Wed, 01 Jul 2026 15:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350153.1607711; Wed, 01 Jul 2026 15:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewou-0003N8-FB; Wed, 01 Jul 2026 15:25:48 +0000
Received: by outflank-mailman (input) for mailman id 1350153;
 Wed, 01 Jul 2026 15:25:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wewot-0003N2-LM
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:25:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wewot-003rfm-2C
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 17:25:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a453176-2eae-0a2a0a5409dd-0a2a450ab4a4-26
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:25:46 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a45317a-e40e-0a2a450a0019-d155802fdc23-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:25:46 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493a97fad2fso6933105e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 08:25:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4540aesm85628905e9.0.2026.07.01.08.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 08:25:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782919546; x=1783524346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Uiv/so1XThRNUVtMm9zvCb2kbxp7wSDqrL4nXO2GtM=;
        b=rmxzl/zzMx6Ok5x6ag6T3OqE7Mia388mtheh2CwYclO0SeBVljTM+66H9xvy0EpfYH
         XTQyWTNoVHPv1VspIM0aTMFcbIWDZjObQphz8hC8LCEVj/SB+adf0M8Z0Yd1WjLkKPht
         dsOwERX1DaScBlb0RseKSisr2bWt/heyquudTeGG3MMTS2swqXSDpAKt1thyECnJrnt+
         emlmUkE3Qciu/xRMjNpIuWGfo9OEsAkpe5cyd7GUTF3BXTpLQCxogsPfgqmLDr10703Z
         EaOmuiEfvsp+bdYpJ0Fj0p2W7dADrW/U9iXSA0+9eWhJnPMAxxE4umefcHJU2PZLBc7w
         vRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919546; x=1783524346;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Uiv/so1XThRNUVtMm9zvCb2kbxp7wSDqrL4nXO2GtM=;
        b=UbzPmd+Jq3rVBH/ouVgEh0j8LahxXdm/9JcsU5B+kYjyhfngx5U2GYK/5nLz5QowQI
         ttCkZBkd3Xo2nrSOVJGnlN012QIMCmEtSUVtdJpuDFqJ6lqWNi9ycOzM2kgOmjgbcnbm
         HBvtp0yfZKyYMHJhnUqczSncSyQCRJLFdNhoEoWqrAsUNtdWyWw4F0GsOb4HNC2Unoyi
         XnTJ5sAh3siduFpEEJVNBoMrQI+YX7C5w/xFIsie/qvp1sIAyf3t4fmmwXh9fsW4wCBr
         TjJTOIPe3l2adQcZvQ700xvDeGU8d/Udcb9wmTs0EWPa9ljV+AbdXb8bcA21a7VKdN8b
         weLg==
X-Forwarded-Encrypted: i=1; AFNElJ/QT5sEVjIbLz6VM7Qf8aVbc8oQoF/otW66ssg4S+PbLmKB8tsO3QtyQ2PFy39Ru5zl3Dppcy475yE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCbKuFMCv0+sdRFq8l97DCGGTYdH8JsxTElJi3n6lBgqMXMX7w
	wvyg8WtYGWkyXFnbgK74puul3BcKs3pfP6W2abmtFPsXEuGirB9ZH528
X-Gm-Gg: AfdE7cmWpkrs1lGrlCcza7JMfU2VPA6R27TSr9Xv3p3H+n/8ZduG31CX8iAltqioIpp
	zWcDCucx4R9JaeeEIb6MvOhr8rU8MWFIV1SIOfHqGTonRG21gq0ABvrrScQCnpTvVXj4n/1AjeD
	XF8rzq8PGbnZmeNQgKCjmJfNXtxtjpxfR/5l2OVxlpiyltkNKzHOtwZaBuGXMpjMZAtzOljMMJ5
	Thb7ZV1VgodelBbIE7TLsrpnF9B1L8qqsCvufWpznUDkcfu0ONedNbGYWOoK8yz9KlQIa3hna1i
	io2o8GE20iXbn1bElKt9jOVo9X+qweEMzOqcL0FtGfMqnMx8qiV3M/AEf2WeiGnamhT8HBzZpFm
	7cp//grGF3BjEjPnDhBju3GpfafiRpRAIbsrUyaXCIt5BreCZbB1cB7U8DJk4iuTEbS99/j+7OT
	qqhD1UwPsA+ghOIxRlvsOd6NGLD9E5UVsHx4obFUnG2dX007Go7Kyj10cgf5UvlDx8e60=
X-Received: by 2002:a05:600d:844f:20b0:492:5bb6:6d4b with SMTP id 5b1f17b1804b1-493c3df77eamr14662535e9.34.1782919546278;
        Wed, 01 Jul 2026 08:25:46 -0700 (PDT)
Message-ID: <2093dd4c-c80d-4b65-998f-c90796dc4a88@gmail.com>
Date: Wed, 1 Jul 2026 17:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <775c88457e5ec7fc7889002c6f9829669f9bce97.1782388193.git.oleksii.kurochko@gmail.com>
 <5d344cec-bb97-4d3b-87ff-e7175772fd45@suse.com>
Content-Language: en-US
In-Reply-To: <5d344cec-bb97-4d3b-87ff-e7175772fd45@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782919546-3C07ADDE-910CBC35/10/73395122804
X-purgate-type: spam
X-purgate-size: 6251
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A1346EF39B



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

Thanks.

~ Oleksii

