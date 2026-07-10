Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rbGxN7nzUGrz8wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:29:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD1673B41A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:29:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UJ0jhAUi;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359329.1612943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBHI-00070M-UO; Fri, 10 Jul 2026 13:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359329.1612943; Fri, 10 Jul 2026 13:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBHI-0006xv-Qq; Fri, 10 Jul 2026 13:28:28 +0000
Received: by outflank-mailman (input) for mailman id 1359329;
 Fri, 10 Jul 2026 13:28:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wiBHH-0006xp-CW
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:28:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBHG-00FK04-Jn
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:28:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50f35e-5cb7-0a2a0a5109dd-0a2a4502d900-8
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:28:26 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50f37a-64c6-0a2a45020019-d155d0b2b8ea-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:28:26 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-39c7ce122c7so8392421fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 06:28:26 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b01ca4a08esm602296e87.12.2026.07.10.06.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 06:28:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783690106; x=1784294906; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=18/M2yIKj8yEVoMcBtD6RNIOCQd8MO4v0+nXwR/BLDE=;
        b=UJ0jhAUic5ddrdredczuFzRlWxrhtpFTrU4YG5KDxmgD1NHDT6GSM5ZDriWUTsafWi
         MqPm/eSrHJwXMX99FZA9uVXigKJhDKg7OLxb3jkjynIS9q6meXjugH0/+5gQH53zYIix
         sRGnP2eacBRkP/pw8oXwQjPViVitEGNUyQ6+xMxOTVNAgi0q7FgAI58cjz9MRxl1DWeU
         /kgENsX5oNZpgPdZ91r91PZH3ELEoNfFIoqv+P1DZWeJox6+cp1jneB6LOqh/efdcs0+
         z+segFefxIQLlggDrONRgaSov+VD7CVk4qR2MAuzSorVnrAHRKz2Jba3Wt3nF5h7Qh6V
         a+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783690106; x=1784294906;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18/M2yIKj8yEVoMcBtD6RNIOCQd8MO4v0+nXwR/BLDE=;
        b=oHMt5PlOJT3P6FdJzH7zLbaYFB1r7kra7OB3bjLhitREQXPakVhZS+1pIWCDE7e5bC
         Mfw26BOBOM2cY+u6Li1W57AWYSVC/ts62RuXY8EtazvVQ/Lw5FbQF9U8DrE/bdbtj7Xz
         /qqFs4g9IdbYWZb8ng+3Cluc4KoZFJg7M8C8UR03Tejx9cuM2cyXgVwLKwCO30yzKiTI
         3ZMHA8TFP64wi2fmq2NK9H9tFlFMMUD1468ZIcnLAlUVDNVEKLFRwqDBQVrxCKCjp65X
         DMrGk7Ecuiy05TerFB2MeZvq43QO56y6ylC39fBoVmZsNp5SYMumdtH+lj1NmovqaMS6
         8rvA==
X-Forwarded-Encrypted: i=1; AHgh+RpdQeNQjpPaT8aXQAdO3Ja9nFEtdxeyR9uTJ8DVft5ANrH9KY46vEt6NHSN6CUrGOa21OxvR41Vu2A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+pDDceuo0Al9oKw2BO2f/7teLn5OSiDLw4HdGZPqkx/OXqgLf
	QyngZF3M5/Q0YYhWW2DlzBQZWDovzp1gPtjoukP7iOXsFMcC9SzTeJ35
X-Gm-Gg: AfdE7cl4OLrhkjXcbgbHXVNajyx+34A53DhGvp75d1b1iPTz4IDrxh63B4icOPh++pf
	LS8StPzvLVGj4OP7KO6HDZIsm11UoM8eqI9UmosdBm4yeDYWrq5FzE4o4+SpnOBsuNaCp6B8b/P
	SMp5lTEVpJeqH7GmyFbobr7CtSiMR7Ocnkw+H0INBoh6/8FnMvT2cxXq6Zz3qxSYnW2Snb2NMBe
	LGhYgLCWBqjRe8jEyTpXwNPjUrYg7xHUabrB76T0If5+DJRfGKEbvem5jPSBUHCoCCjIc2olbKX
	M7hprUtS/xC1nTz/faF7OjTrZcbfjeQXz4gbmDWiLGxw564vOiDTn5hxhrcsGzB7ybLDk8Nm3fi
	oAFe7LjJWuG70YuQvorc2T4/OH1Y/R3uxFeBjyBbmMKK2yz5o53C0lh4QI1ILp+37xf/JRdAFKQ
	35yORWKupiEsGsMIwkraUtc9qwIt6AIwQ20AZh6DMal+3Oo4jZDtrCvomc2TQXn73vO/I=
X-Received: by 2002:a05:6512:2581:b0:5ae:c454:373b with SMTP id 2adb3069b0e04-5b01141fcbcmr2665965e87.1.1783690105390;
        Fri, 10 Jul 2026 06:28:25 -0700 (PDT)
Message-ID: <fd82fdba-9acd-4576-84cc-f6513c557956@gmail.com>
Date: Fri, 10 Jul 2026 15:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v5] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <6948fb2823ffa41cf2eabbd87952b236e4f379bf.1783085655.git.oleksii.kurochko@gmail.com>
 <2853c8c1-ea7f-46ba-ac65-a7473e9d3689@suse.com>
Content-Language: en-US
In-Reply-To: <2853c8c1-ea7f-46ba-ac65-a7473e9d3689@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783690106-3C954A87-1449483C/10/73395122804
X-purgate-type: spam
X-purgate-size: 5510
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AD1673B41A



On 7/8/26 12:52 PM, Jan Beulich wrote:
> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -40,6 +40,9 @@
>>   
>>   #define consumer_is_xen(e) (!!(e)->xen_consumer)
>>   
>> +/* Defined below when !CONFIG_HAS_SHARED_INFO; call is DCE'd otherwise. */
>> +void evtchn_none_init(struct domain *d);
> 
> The definition wants to be static, so this declaration needs to become
> conditional. Assuming the evtchn_port_ops_none block can move up in the file,
> it could be put in an #else there.

I will move  evtchn_port_ops_none block up and add #else to it.

>> @@ -1323,9 +1326,13 @@ int evtchn_reset(struct domain *d, bool resuming)
>>           rc = -EAGAIN;
>>       else if ( d->evtchn_fifo )
>>       {
>> -        /* Switching back to 2-level ABI. */
>>           evtchn_fifo_destroy(d);
>> -        evtchn_2l_init(d);
>> +
>> +        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>> +            /* Switching back to 2-level ABI. */
>> +            evtchn_2l_init(d);
>> +        else
>> +            evtchn_none_init(d);
>>       }
> 
> Do we really need to call evtchn_none_init() here when FIFO is available?

Agree, when FIFO is available there is no need to call 
evtchn_none_init() so it seems like it would be better to have the 
similar to what we have in evtchn_init():

@@ -1331,6 +1361,8 @@ int evtchn_reset(struct domain *d, bool resuming)
          if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
              /* Switching back to 2-level ABI. */
              evtchn_2l_init(d);
+        else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
+            evtchn_fifo_init_ops(d);
          else
              evtchn_none_init(d);
      }

> This is connected to ...
> 
>> @@ -1622,9 +1629,45 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
>>       }
>>   }
>>   
>> +#ifndef CONFIG_HAS_SHARED_INFO
>> +/*
>> + * Placeholder ops for domains with neither a shared_info page nor (yet)
>> + * a FIFO control block.  None of these are ever reachable in practice;
>> + * they only exist to keep d->evtchn_port_ops non-NULL.
>> + */
>> +static void cf_check evtchn_none_set_pending(
>> +    struct vcpu *v, struct evtchn *evtchn) {}
>> +static void cf_check evtchn_none_noop(
>> +    struct domain *d, struct evtchn *evtchn) {}
>> +static bool cf_check evtchn_none_false(
>> +    const struct domain *d, const struct evtchn *evtchn) { return false; }
>> +static void cf_check evtchn_none_print_state(
>> +    struct domain *d, const struct evtchn *evtchn) {}
>> +
>> +static const struct evtchn_port_ops evtchn_port_ops_none = {
>> +    .set_pending   = evtchn_none_set_pending,
>> +    .clear_pending = evtchn_none_noop,
>> +    .unmask        = evtchn_none_noop,
>> +    .is_pending    = evtchn_none_false,
>> +    .is_masked     = evtchn_none_false,
>> +    .print_state   = evtchn_none_print_state,
>> +};
>> +
>> +void evtchn_none_init(struct domain *d)
>> +{
>> +    d->evtchn_port_ops = &evtchn_port_ops_none;
>> +}
>> +#endif /* !CONFIG_HAS_SHARED_INFO */
> 
> ... we wondering whether any of this is needed when FIFO is available. In
> v4 all that was noticed was that SHARED_INFO=n together with EVTCHN_FIFO=n
> is a problem. And having fewer cf_check functions in the build is always a
> win (I think).

I will update #ifndef to:

#if !defined(CONFIG_HAS_SHARED_INFO) && !defined(CONFIG_EVTCHN_FIFO)


> 
> As to the comment saying "None of these are ever reachable in practice":
> What do you base this on? In the SHARED_INFO=n + EVTCHN_FIFO=n case they
> look reachable to me.

I thought about that it is unlikely that both of the configs will be =n. 
I will reword the comment to:

/*
  * Placeholder ops for domains with neither a shared_info page nor a FIFO
  * control block (CONFIG_HAS_SHARED_INFO=n and CONFIG_EVTCHN_FIFO=n). Such
  * a domain has no ABI to record event state in, so these are reachable
  * whenever an event is delivered to (or queried on) one of its ports; they
  * just discard/no-op it.  They exist to keep d->evtchn_port_ops non-NULL.
  */

> 
>>   int evtchn_init(struct domain *d, unsigned int max_port)
>>   {
>> -    evtchn_2l_init(d);
>> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>> +        evtchn_2l_init(d);
>> +    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
>> +        evtchn_fifo_init_ops(d);
>> +    else
>> +        evtchn_none_init(d);
> 
> Note how here you actually call evtchn_none_init() only in the one special
> case. Imo this model should be followed also in evtchn_reset().
> 
>> --- a/xen/common/event_channel.h
>> +++ b/xen/common/event_channel.h
>> @@ -55,6 +55,7 @@ struct evtchn_expand_array;
>>   int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
>>   int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
>>   void evtchn_fifo_destroy(struct domain *d);
>> +void evtchn_fifo_init_ops(struct domain *d);
>>   #else
>>   static inline int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
>>   {
>> @@ -68,6 +69,7 @@ static inline void evtchn_fifo_destroy(struct domain *d)
>>   {
>>       return;
>>   }
>> +static inline void evtchn_fifo_init_ops(struct domain *d) {}
> 
> Why would this be needed? You (again) only need a declaration, just that it
> needs to live outside of the #ifdef.
> 
Agree. I will drop that.

Thanks.

~ Oleksii

