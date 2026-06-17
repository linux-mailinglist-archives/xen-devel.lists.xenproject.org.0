Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AntdKkGpMmqG3QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 16:03:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7C69A640
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 16:03:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oPbVtuQv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340467.1601486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZqr9-0004GL-Bx; Wed, 17 Jun 2026 14:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340467.1601486; Wed, 17 Jun 2026 14:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZqr9-0004Dn-9B; Wed, 17 Jun 2026 14:03:03 +0000
Received: by outflank-mailman (input) for mailman id 1340467;
 Wed, 17 Jun 2026 14:03:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZqr8-0004Dh-Ha
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 14:03:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZqr6-007phg-8R
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 16:03:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32a911-5cb7-0a2a0a5109dd-0a2a450c9636-14
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 16:03:00 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32a913-62f1-0a2a450c0019-d155d0b1cdee-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 16:03:00 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-39677242021so48745511fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 07:03:00 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3995c04d6afsm15815001fa.8.2026.06.17.07.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 07:02:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781704979; x=1782309779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wtEvE7ItCMp/RWf5xZfBNYbtwILVn79qr24l20dJbs=;
        b=oPbVtuQvjqbzuPmPifXYa+vhpogyXBAQ+oY/Pcz/fdhasd76eNF7gv9xTjNvpKpiCl
         eFn6pGjvst573sh8RteWt9x2VLC5Jpw8r0geAYVb26OwIoZj6d2kqP6xNWHhTfNbBybi
         koH9zgSTSM3vNGSGBqYAIw9HgT8pPEj9QrahyV3R0FNGan/eYHUM4oM0MfDUZ0JlysAa
         nJ1cr5WaAFiCmksHg30Vfxz8X65edZ6ZydjPezt2QSmCzncFhvlSLUuxJM6Cl0uG+tq3
         JBXFhmVueFRP6bhqtC5rdhns7lRWPIgWPvWgl5v4vesA6kaRnoB3XYbgrqQDq6C8eFty
         JEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781704979; x=1782309779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wtEvE7ItCMp/RWf5xZfBNYbtwILVn79qr24l20dJbs=;
        b=DnbVG42lCA00Uo0mwt3fZFsNMmyhSj6b3fbzjW7zQ3YiuMOkiwNQ4WKu5pAs50q4nG
         EJg5gPv1gozJw4VlPDLAxKNHTJMY/k/4TUXqCqSlWj5bmxnoffXJDca9O6w285xB4bj5
         j8MmYF8RcO+7mrtB1HXxL//uvTopZxSuEu3zcAGFZOHCDRBgZmaGoFUTlUUMhZM5Ziwp
         62Ma1JrHOZA5b0L9NBTERuMXcIhPLmu3Ow5pZ/lozseZHgkduVGNnbwb2qH4jbiWBGNx
         rBgMw0Q/FXT1YV93UcMn7EJL7nAXVp1cNDjFisMS7glDjUwNW71nLy2HkR+8klxvkJEw
         vQ3A==
X-Forwarded-Encrypted: i=1; AFNElJ+Wn8WxDIqWf+q+Eu8YTvUhQnzAH73KXOsU09FXXkQ+Ep1o2cNj+WPCqdlaBxYmQs6RBlTZzGxmBiM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUXlQAqrKwGx2Aqms7iPxxdaBumJ3EuwutPheg2mD3VGlRXARb
	b+3u/STzzh/KPpEsN63lb0QEWlIBszn3/996cVcqDXTc7smhGsH8Kravo4unMw==
X-Gm-Gg: AfdE7clJ5ZwEuhNZsbBIFGLorbbVV50DozhQOBpvaCZm22dcR+jXmrDpT7L/UmX/m0f
	ZdGvliAbal0wHEY/OBFEjHNEe9fCqeby4/y2tuuFaFai1ce0xLIDiF6XXLmTPeaqDMs5WoEubFf
	GiX9SCy9k9G1AHsnsNOy6/aeWS8cm7o9q9FQZWthpXjqj16KlLkJgHXPnDKcEGjaWNqhpS/c+jE
	vp8NXZ6TBL9xQzLrII4U90sLyq80k3YZta3BB+8N98JiD4MeURtrwKU8Txldp0khTCPHJdk9aAJ
	RPwePjW4LoA2fKKvWqVB2kExb0V77xZzQRiH7UiUgO71Jb581SAO+eaUGRvM9ysJcNmcIktlaGE
	beTF7YssP5abbBAwwE/9AN/yLI8MnxlZTyKzlEE0GdIZS1kbkhRvJEMpHEvv5h2CPXZTGigNuxu
	5pyy5MsAfGKlTTl4YAVtufojlXaGuNeCp2BQO15cMU89ykU0vlBVNwgrHdpxd981Iimf4=
X-Received: by 2002:a2e:a107:0:b0:396:8588:d5a9 with SMTP id 38308e7fff4ca-39969b65ed1mr9749081fa.11.1781704978845;
        Wed, 17 Jun 2026 07:02:58 -0700 (PDT)
Message-ID: <5ca82079-4f94-4f2c-87ea-0ba54236ff72@gmail.com>
Date: Wed, 17 Jun 2026 16:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
 <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781704980-DA776CF5-ACB70334/10/73395122804
X-purgate-type: spam
X-purgate-size: 3772
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FD7C69A640



On 6/17/26 3:26 PM, Jan Beulich wrote:
> On 03.06.2026 16:25, Oleksii Kurochko wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -320,9 +320,9 @@ void vcpu_info_reset(struct vcpu *v)
>>       struct domain *d = v->domain;
>>   
>>       v->vcpu_info_area.map =
>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>> -         : &dummy_vcpu_info);
>> +        IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
>> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>> +        : &dummy_vcpu_info;
>>   }
> 
> While the change here is likely okay, it points at possible further omissions.
> You've dealt with all uses of shared_info(), but you've left alone all uses of
> vcpu_info() (and __vcpu_info()). Reads are presumably okay, but writes to
> dummy_vcpu_info open a side channel for possible info leaks. Looking over uses
> in common code, no code changes may be needed; extending the description may
> be all that's wanted here.

Isn't there already a side channel that could allow leaks, even without 
this change? The change here just made it worsen because now info leak 
will happen for all vCPUs when  CONFIG_HAS_SHARED_INFO=n.

I will add to the description the following:
```
With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
dummy_vcpu_info, so writes through vcpu_info() could leak data between
vCPUs.  Reviewing the write paths in common code: the write in
map_guest_area() stores the constant ~0 so nothing serious will happen 
if it will be leaked; the event_2l.c paths are unreachable because the 
preceding shared_info() call would trap first; the write in 
vcpu_info_populate() targets the new mapping buffer, not 
dummy_vcpu_info; all remaining writes are x86 PV-specific for which 
CONFIG_HAS_SHARED_INFO=y.  No code changes are needed.
```

> 
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -1323,9 +1323,13 @@ int evtchn_reset(struct domain *d, bool resuming)
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
>> +            evtchn_fifo_init_ops(d);
>>       }
> 
> The "else" part isn't needed, is it? evtchn_fifo_destroy() doesn't undo
> what ...

Agree, it isn't really needed. I will drop "else" part.

> 
>> @@ -1624,7 +1628,11 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
>>   
>>   int evtchn_init(struct domain *d, unsigned int max_port)
>>   {
>> -    evtchn_2l_init(d);
>> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>> +        evtchn_2l_init(d);
>> +    else
>> +        evtchn_fifo_init_ops(d);
> 
> ... was done here.
> 
>> --- a/xen/include/xen/shared.h
>> +++ b/xen/include/xen/shared.h
>> @@ -43,7 +43,14 @@ typedef struct vcpu_info vcpu_info_t;
>>   
>>   extern vcpu_info_t dummy_vcpu_info;
>>   
>> +#ifdef CONFIG_HAS_SHARED_INFO
>>   #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
>> +#else
>> +void * shared_info_absent(void);
> 
> Nit: Stray blank after '*'.
> 
>> +#define shared_info(d, field) \
>> +    (*(typeof(__shared_info(d, (d)->shared_info, field)) *)shared_info_absent())
> 
> How about the simpler
> 
> extern struct shared_info *shared_info_absent;
> #define shared_info(d, field) (shared_info_absent->field)
> 
> ?

It would be better. I will apply that.

Thanks.

~ Oleksii


