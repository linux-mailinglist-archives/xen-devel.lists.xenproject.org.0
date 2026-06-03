Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bl63DcrgH2qprgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:07:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E7635850
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:07:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XqgKLrzM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325843.1591184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgdA-0001xR-Db; Wed, 03 Jun 2026 08:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325843.1591184; Wed, 03 Jun 2026 08:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgdA-0001vj-Aj; Wed, 03 Jun 2026 08:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1325843;
 Wed, 03 Jun 2026 08:07:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUgd9-0001vd-Di
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:07:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUgd8-00HQz6-Ho
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:07:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1fe0a8-bab6-0a2a0a5309dd-0a2a4509e8fa-28
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:07:14 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1fe0b2-2497-0a2a45090019-d155d029a819-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:07:14 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-68b482888c3so582628a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:07:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf05176fd14sm107040966b.11.2026.06.03.01.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 01:07:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780474034; x=1781078834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sVBueSz+M+/JDHV0VyvLGnJb38sUg9hwfqEI6OlbhA=;
        b=XqgKLrzMzxzG5HtJaRSw/FKacRG5GBkVpTH27fjb8C0XIkjcQ+/yBfNoHTFrbxG2Br
         1icc9oCEt4NFia/eFwdkdBGQRVUr0mCZ29V6cVMxtnWiF42L1OUK4vIuZSAYD+SZTg/b
         SCZOQR2Mz/uJq+pXM9Qr9zGVaFboKzjMcwaFhN99ZEAZuIRtLo4e3GgQcLqnBHQpA7vr
         aMRU2pKcF7tH2VQYXG6cp5sOQrQGRz5sIi1413YHbyE4Jtu/dE6+RAu31pJ67to6ntka
         RSZS0zljNfNJfEvGs6FeeY2+PDgCDQc7JAS6QvYloIaOIVIV/FoGbAF2lorBnZyx7Bc4
         9//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474034; x=1781078834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sVBueSz+M+/JDHV0VyvLGnJb38sUg9hwfqEI6OlbhA=;
        b=B8jcnGvuRd/qlo+D1HlKtgNrvXKMH1tdw6ZU1SES7xH7qwSEBEbJlGN309jGAFQ0Md
         LQnQMIZBlE2+Un3lvV3n1HY9iGHYwyNygp3Y1w1O89IblfJatJBR+S+5q5NoCdWpeuxh
         tj0JFkd3WwBponO+hrQw25ZVGUB6DHYMMatNsDW040D1Me3iALS6NhGsQNO2ykmBPW7z
         llmHOowciVQTiSGAOL8ckYRny2lv39IWW4GpZcoOOW/nuVF4yW3p8278hKz3McnbNGfP
         TwPOiRO24l7/VY/4wBd0CkvwWPWkEMpZNLrQAunL92sza4/RwQY2v7Mb5cU5ztNToTsf
         Bpwg==
X-Forwarded-Encrypted: i=1; AFNElJ+GZz70sLL6fqAe4Yk+ADDdnlA3Gulk4HPoOqvG8Pak17YDd3VrEWOO34en6469zqqbbsbueBDwACk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZdk97CU23sfuudukfPCD4Hq08l7uuiNDA81R+lSB+AyOFqzwA
	j/k7YESEKMU/eg3QKTdTquxYRXDap9HxNKRTz703L1I1HhYdX2iU6NBJE+KrTw==
X-Gm-Gg: Acq92OFDb2jRew1AzaxkTlEJG6KwrlEraOJGhAl+djugRuKhb+gnpLfAkmjvEe1IRIp
	c0fhZ6QScCMqQLGY01doHlEbo87vFNijx9Jp3MabyxLt8pOIQ/3Uj+UIiHGr89ohStQBrK8lRj2
	sElWSn+4LiCd/aOLD8xSjJu3lM/zOK05Ewtk2gYybxz1Qi/3i4bFLE759w0RwVwNJJpKK1J2J7F
	YaJ4EDJv81HOgABkQTfURGIPVBiSKNzFvOHjFb5LPMpilBa7F48uxRpFMcwqmv+++zdrjwhEhWH
	1RekS9F6DrUkv3X8dPtHKl9XfCfZ9HkqjZTt12xFEasjLKg1BVnriwhWUNm2PHG5v5zu+6s9a5J
	IBxYt8+qfwFvq7Igf0YQNrGd+/4twipSAD2T/fpEFzU6vdvd9lhhNfvBPWS0uc//vCbWhvUWG3D
	GsHr95q/C/BkjXfoEDIzkxTIP0b+oCMNXOeCOIuc4Aps6zk//5s7h9dPUiLHlIl3PXkXiF0GtQg
	eWzIFlW1Y0rAT6k
X-Received: by 2002:a17:907:3d03:b0:bee:9809:3cd1 with SMTP id a640c23a62f3a-bf09ea65288mr90734966b.17.1780474033450;
        Wed, 03 Jun 2026 01:07:13 -0700 (PDT)
Message-ID: <9df0b08e-6185-4d0e-bd06-32fe9d684ad0@gmail.com>
Date: Wed, 3 Jun 2026 10:07:11 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780474034-8816CA53-5B81C175/10/73395122804
X-purgate-type: spam
X-purgate-size: 8893
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
X-Rspamd-Queue-Id: 8E8E7635850



On 6/3/26 7:54 AM, Jan Beulich wrote:
> On 02.06.2026 18:11, Oleksii Kurochko wrote:
>> On 6/2/26 1:19 PM, Jan Beulich wrote:
>>> On 25.05.2026 15:20, Oleksii Kurochko wrote:
>>>> It is legal to have d->shared_info equal to NULL for architectures which
>>>> support only the FIFO ABI for event channel management.
>>>>
>>>> Having d->shared_info == NULL leads to a UBSAN issue on such architectures:
>>>>     UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>            member access within null pointer of type 'struct shared_info_t'
>>>>
>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>> Extend the existing fallback condition to also cover the case where no
>>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>
>>>> Additionally, if an architecture supports only the FIFO ABI, setup_ports()
>>>> should be updated to avoid a NULL pointer dereference of d->shared_info,
>>>> since in that case there will be no pending events in
>>>> shared_info->evtchn_pending and the pending flag of the FIFO event channel
>>>> does not need to be set to true.
>>>> update_domain_wallclock_time() accesses d->shared_info via shared_info()
>>>> macro. On architectures that do not allocate a shared_info page (currently
>>>> RISC-V, which runs guests in dom0less mode without the PV ABI), this causes
>>>> a NULL dereference. The early return is safe: if there is no shared_info
>>>> page, there is nothing to update. For all existing architectures (x86, ARM)
>>>> that do allocate it, the guard is never taken and behavior is unchanged.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>>    - Update commit message + subject.
>>>>    - Drop Fixes tag.
>>>>    - Handle migration of pending events from 2L and FIFO ABIs when arch
>>>>      support only FIFO ABI.
>>>
>>> What does this item describe? On an arch supporting only FIFO, how could
>>> evtchn need migrating from 2L?
>>
>> Agree this item is inaccurate.
>>
>> evtchn_init() always calls evtchn_2l_init(d) first
>> (event_channel.c:1627), so every domain starts with 2L regardless of
>> arch (of course, it is just initialization of evtchn_port_ops which
>> aren't really used when only FIFO is supported).
>>
>> setup_ports() is called during the guest-initiated 2L→FIFO transition
>> (event_fifo.c:637), not at arch init time. There is no arch that
>> supports "only FIFO" as a starting state and that is why it is needed to
>> guard setup_ports() against NULL d->shared_info when migrating 2L
>> pending state to FIFO even 2L wasn't really used by an arch with only
>> FIFO support.
> 
> Imo on arch-es not supporting 2L, domains shouldn't start in 2L mode.

Agree but will it be easy to achieve now with the current code base?

The best what could be done it is avoid calling evtchn_2l_init() now in 
event_channel.c and:
1. Add a new Kconfig symbol, CONFIG_HAS_EVTCHN_2L (or re-use 
HAS_SHARED_INFO suggested before), selected by x86 and ARM.
2. In evtchn_init() (event_channel.c:1627), guard the call:
    #ifdef CONFIG_HAS_EVTCHN_2L
       evtchn_2l_init(d);
    #else
       evtchn_none_init(d);
    #endif
3. Add a small stub ops table (probably in event_fifo.c or a new 
event_none.c) with no-op set_pending/clear_pending/unmask, is_pending 
returning false, is_masked returning true (valid until 
evtchn_fifo_init_control() replaces them).

Does it make sense?

> 
>>>>    - Update the commit message.
>>>>    - Protect some other places in common code from NULL pointer deref of
>>>>      d->shared_info.
>>>
>>> What I'm still missing is the description clarifying why other uses don't
>>> need guarding (or that there simply are no other uses, which - however -
>>> I doubt).
>>
>> I will add an explicit paragraph mentioning that the 2L ops in
>> event_2l.c are unreachable for a domain with no shared_info.
>>
>> The only place which isn't covered now is  domctl.c:108
>> (virt_to_mfn(d->shared_info)) is only reached via the
>> XEN_DOMCTL_getdomaininfo path and
>> as RISC-V doesn't use it now it could be left as it is what also could
>> be added to commit message.
> 
> Or, better yet, deal with that as well. But see also below.
> 
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -320,7 +320,7 @@ void vcpu_info_reset(struct vcpu *v)
>>>>        struct domain *d = v->domain;
>>>>    
>>>>        v->vcpu_info_area.map =
>>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>>> +        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>>>>             ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>>             : &dummy_vcpu_info);
>>>>    }
>>>
>>> At the example of this: The extra conditionals are dead code on x86 and
>>> Arm. While the status of the respective Misra rule is still uncertain
>>> for Xen, imo we'd be better off avoiding the introduction of new dead
>>> code. Which in turn means we may need some kind of abstraction to have
>>> these extra conditionals in place only for arch-es not supporting
>>> shared-info at all.
>>
>> What about then add config HAS_SHARED_INFO to xen/common/Kconfig and then:
> 
> We're getting closer. Imo we want to go farther, though: shared_info() as a
> construct should be unavailable when !HAS_SHARED_INFO. _That_ then will
> make obvious (by causing build failures) that all respective use sites were
> properly dealt with.

I will add then:

+#ifdef CONFIG_HAS_SHARED_INFO
  #define shared_info(d, field)      __shared_info(d, (d)->shared_info, 
field)
+#endif

But with doing that we have only option of using #ifdef HAS_SHARED_INFO 
in the place where shared_info() is used. If it is fine then I will be 
happy to do in this way.

> 
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -319,10 +319,14 @@ void vcpu_info_reset(struct vcpu *v)
>>    {
>>        struct domain *d = v->domain;
>>
>> +#ifdef CONFIG_HAS_SHARED_INFO
>>        v->vcpu_info_area.map =
>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>> -         : &dummy_vcpu_info);
>> +        (v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>> +        : &dummy_vcpu_info;
>> +#else
>> +    v->vcpu_info_area.map = &dummy_vcpu_info;
>> +#endif
>>    }
> 
> I agree with #ifdef here.
> 
>> --- a/xen/common/event_fifo.c
>> +++ b/xen/common/event_fifo.c
>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>> int prev_evtchns)
>>
>>            evtchn = evtchn_from_port(d, port);
>>
>> -        if ( d->shared_info &&
>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>> +#ifdef CONFIG_HAS_SHARED_INFO
>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>                evtchn->pending = true;
>> +#endif
> 
> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
> (in which case #ifdef may be unavoidable here), an alternative where
> IS_ENABLED() could be used here may want at least considering. E.g.
> causing a link-time failure when shared_info() is used (and not compiled
> out).
> 
>> --- a/xen/common/time.c
>> +++ b/xen/common/time.c
>> @@ -94,8 +94,9 @@ void update_domain_wallclock_time(struct domain *d)
>>        uint32_t *wc_version;
>>        uint64_t sec;
>>
>> -    if ( !d->shared_info )
>> -        return;
>> +#ifndef CONFIG_HAS_SHARED_INFO
>> +    return;
>> +#endif
>>
>>        spin_lock(&wc_lock);
> 
> Constructs like this are imo somewhat ugly. Using IS_ENABLED() instead
> would make things at least a little better (again imo).

Considering mentioned above it would be better to #ifdef the whole buddy 
of the function:

void update_domain_wallclock_time(struct domain *d)
  {
+#ifdef CONFIG_HAS_SHARED_INFO
+
      uint32_t *wc_version;
      uint64_t sec;

-#ifndef CONFIG_HAS_SHARED_INFO
-    return;
-#endif
-
      spin_lock(&wc_lock);

      wc_version = &shared_info(d, wc_version);
@@ -120,6 +118,8 @@ void update_domain_wallclock_time(struct domain *d)
      *wc_version = version_update_end(*wc_version);

      spin_unlock(&wc_lock);
+
+#endif /* CONFIG_HAS_SHARED_INFO */
  }

Considering also that shared_info is expected to be used only for 2L 
then it would be better to introduce CONFIG_HAS_EVTCHN_2L instead.

~ Oleksii

