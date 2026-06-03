Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4hq1MeoWIGqivgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:58:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5F637425
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:58:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aGKeSxec;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326119.1591569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUkEU-0008Gg-D8; Wed, 03 Jun 2026 11:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326119.1591569; Wed, 03 Jun 2026 11:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUkEU-0008Ds-9y; Wed, 03 Jun 2026 11:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1326119;
 Wed, 03 Jun 2026 11:58:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUkES-0008Dm-Gg
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:58:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUkER-003e51-SW
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:57:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2016c3-bab6-0a2a0a5309dd-0a2a450a9cd8-24
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:57:59 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2016c7-56b3-0a2a450a0019-d155da35d5f6-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:57:59 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-becfa735b9aso496569666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 04:57:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf054e0280asm137406466b.33.2026.06.03.04.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 04:57:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780487879; x=1781092679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHT+gruSkt+wu/6Q4fjjILgFPyipx27zBwtoDDnDwfY=;
        b=aGKeSxecNwFGpTFZBKk1lDGC/64UcyXQvujGYxsvzeX3BaGQbddpbwWFkrebyejou3
         wfI8DcjSNsPNWVH3jyMmdaR+OCD1/q2nBBnwfJxWrx+jwNCNYDloAXQ8YZi7H4f82YGS
         mQcM+ay8MricQvqYFngEaOt3JTXC6UkRh51qs8mYqBHbevMsExyb84DLB9WgnCXQEJYH
         RxfXQBW1EapFH2ulRoIdCV8qwR4D6nKxJs0SVSexPYC0HaykWeAYIju9CDnlBInpdh+b
         9uruALDJA3mv5DFECWgIKwzb07GzwH0gjCdxfjq+o2QkgcCYGgbI3a16FCveqm8wnUKS
         /fWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487879; x=1781092679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHT+gruSkt+wu/6Q4fjjILgFPyipx27zBwtoDDnDwfY=;
        b=VRYccwC4jKy2luKj3pMAKQ8yoZb+A45G5BgM9LOi65TAypu/GJeRuSdlhxzFEcDofT
         4iCwEN6gUm1PWFoGaPlyAreX7vHjpJfKFLzbpOPKqwPAF3iFiQmP3PbF+6GVk9lQJ3P5
         NkjQNy1fYQc0pxgRbzWt/1Be6NhtSlAQR4iia+LuegH5NQ3DEKL1obUMDkvPflrxSteq
         yqv2I01sS1NrjH9OkuvbnAryIWa2nqQtClEYeMJCCJMrB6MD1X0w/JwovFpUxbtq6yg+
         Azugfj3fBrFgmK36V/2oQJONdJiBrC+rRx/H0IHKwdychGaIOVBFjd1ckytkppG0nB2T
         tdQw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZHYS/I3t6CdUdpE2dy5t7p9+TFQhWlbxMd+gL6eQOBiqDu4Aao5CEZVn1rw3fFgeUGCOLdgqo59I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGDn0yO9IkujvKj7Pus0dUm18Z5YxcgnzfI6Gw58RzaaLnBCHf
	mmKHUBDP2Ljf0SkM8hzduet/xwK7uVi+NNdJLf+InUDR06oyjVSvnw4W
X-Gm-Gg: Acq92OG1hfJA4XvCDlDZzfC/0s0Up/02mYt1gZ3F7ak9q5A7Y1P7PaISBK6Z4Fgtyvv
	ZgrULVc4Gnqls8eymqDZWts6zVdEbN/2lOqcAsqdLg8ilZwH50nnsAsP7SbcUPksRKIKM59enki
	zcTU87v/8wONmJ5izq1lFNljX7Qk9qFf9Xf+Tpco5oNh2HpVJC0Dn9dtC60UtJwB71+jNxfGhqB
	27tKd108bWj9reVvwlka1lszwhGBADiuTwB5IcfMFo7ro81R8WY1ZGWcNJu9nDnZKUXiLXNwkGc
	WqqT3PH6AS68/zuXVMIXQAux4WmGGDudUU3qzEUXvsUQ+zBUGysjMx4wpZRsRMVRRquJlFAOS3s
	AADd1upDk6DPDv+dtpMLINDWQqdKYjFsLSzYQXz/7urHw477zWkZlcQEqagr6gZX5WdtztNPUCz
	DVaISo3U2XnRRJWYempZgIMZtMVV0UhDTzMn2TyL1q3sxuM3dij5d66FRpjpOHFi7798cFo4me+
	+VhZMEvP7If53en
X-Received: by 2002:a17:907:7216:b0:bd1:ba38:c724 with SMTP id a640c23a62f3a-bf0aec00855mr127769666b.32.1780487879021;
        Wed, 03 Jun 2026 04:57:59 -0700 (PDT)
Message-ID: <ab414833-4a3c-485b-91ce-7a0a91f25182@gmail.com>
Date: Wed, 3 Jun 2026 13:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
 <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
 <9ae22210-6dd5-43e3-918e-f68b1294448d@gmail.com>
 <dc622455-c20f-4b8a-8c80-1e4c0143e8e0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dc622455-c20f-4b8a-8c80-1e4c0143e8e0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1780487879-713638B7-0EA9703D/10/73395122804
X-purgate-type: spam
X-purgate-size: 5715
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25F5F637425



On 6/3/26 1:23 PM, Jan Beulich wrote:
> On 03.06.2026 13:05, Oleksii Kurochko wrote:
>>
>>
>> On 6/3/26 7:54 AM, Jan Beulich wrote:
>>>> --- a/xen/common/event_fifo.c
>>>> +++ b/xen/common/event_fifo.c
>>>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>>>> int prev_evtchns)
>>>>
>>>>             evtchn = evtchn_from_port(d, port);
>>>>
>>>> -        if ( d->shared_info &&
>>>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>                 evtchn->pending = true;
>>>> +#endif
>>> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
>>> (in which case #ifdef may be unavoidable here), an alternative where
>>> IS_ENABLED() could be used here may want at least considering. E.g.
>>> causing a link-time failure when shared_info() is used (and not compiled
>>> out).
>>
>> We still want here to have #ifdef instead of IS_ENABLED() as
>> shared_info() shouldn't exist for arch without 2L support so it will end
>> with linkage error.
> 
> I don't understand this part.

If the change will look like:

   if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) && guest_test_bit(d, port, 
&shared_info(d, evtchn_pending)) )
       evtchn->pending = true;

It will help to avoid NULL pointer dereference of shared info page in 
case of 2L isn't supported. But considering that shared_info() macros 
will be reworked in the way which will lead to linkage error in the case 
when it is used and arch doesn't have shared info page support usage of 
shared_info() in setup_ports() will lead to linkage error what is wanted 
to be avoid for arch without 2L support.

> 
>> Considering that setup_ports() will be called for
>> such arch we have to avoid this part from compilation.
>>
>> Alternative is that considering that I suggested in prev emails to
>> introduced stubs for arch which doesn't use 2L:
>>
>> +#ifndef CONFIG_HAS_SHARED_INFO
>> +static void cf_check evtchn_none_set_pending(
>> +    struct vcpu *v, struct evtchn *evtchn) {}
>> +static void cf_check evtchn_none_clear_pending(
>> +    struct domain *d, struct evtchn *evtchn) {}
>> +static void cf_check evtchn_none_unmask(
>> +    struct domain *d, struct evtchn *evtchn) {}
>> +static bool cf_check evtchn_none_is_pending(
>> +    const struct domain *d, const struct evtchn *evtchn) { return false; }
>> +static bool cf_check evtchn_none_is_masked(
>> +    const struct domain *d, const struct evtchn *evtchn) { return true; }
>> +static void cf_check evtchn_none_print_state(
>> +    struct domain *d, const struct evtchn *evtchn) {}
> 
> This set can be shrunk. For example, the same stub can be used for
> clear-pending and unmask. For is-pending and is-masked, considering
> that the precise return value shouldn't matter, a single function
> (returning false) would likely be good enough as well.
> 
>> +static const struct evtchn_port_ops evtchn_port_ops_none = {
>> +    .set_pending   = evtchn_none_set_pending,
>> +    .clear_pending = evtchn_none_clear_pending,
>> +    .unmask        = evtchn_none_unmask,
>> +    .is_pending    = evtchn_none_is_pending,
>> +    .is_masked     = evtchn_none_is_masked,
>> +    .print_state   = evtchn_none_print_state,
>> +};
>> +
>> +static void evtchn_none_init(struct domain *d)
>> +{
>> +    d->evtchn_port_ops = &evtchn_port_ops_none;
>> +}
>> +#endif
>>
>> For arch without 2L supports .is_pending() will return false we can just
>> do the following instead of ifdef:
>>
>> -#ifdef CONFIG_HAS_SHARED_INFO
>> -        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>> -            evtchn->pending = true;
>> -#endif
>> +        if ( evtchn_is_pending(d, evtchn) )
>> +             evtchn->pending = true;
>>
>> Would you be okay with this approach instead of ifdef?
> 
> I can't really say ahead of seeing the full result (and without it being
> made clear why FIFO ops can't be put in place right away, with perhaps a
> few small adjustments to the handlers). While this isn't going to be
> used for x86, introduction of new cf_check functions always worries me,
> at least some.

I looked at FIFO ops again and it looks like it would be enough just to 
do the following:

--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -62,6 +62,9 @@ static inline event_word_t 
*evtchn_fifo_word_from_port(const struct domain *d,
       */
      smp_rmb();

+    if ( unlikely(!d->evtchn_fifo) )
+        return NULL;
+
      if ( unlikely(port >= d->evtchn_fifo->num_evtchns) )
          return NULL;

as evtchn_fifo_word_from_port() is used at the begining of fifo ops and 
if its NULL then it will just return without execution of the rest of an 
operation so even something isn't allocated it is still safe.

The changes above are wrong as evtchn_is_pending(d, evtchn) will be 
called for FIFO's evtchn but the original check is checking if there is 
any pending interrupt in 2L before final switch to FIFO. So we still 
want to have:

+#ifdef CONFIG_HAS_SHARED_INFO
+        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
+            evtchn->pending = true;
+#endif

And then probably we can d->evtchn_port_op with FIFO ops in the way how 
it is done now instead of:

@@ -1660,7 +1629,7 @@ int evtchn_init(struct domain *d, unsigned int 
max_port)
  #ifdef CONFIG_HAS_SHARED_INFO
      evtchn_2l_init(d);
  #else
+    evtchn_fifo_init_ops(d);
  #endif
      d->max_evtchn_port = min_t(unsigned int, max_port, INT_MAX);

~ Oleksii

