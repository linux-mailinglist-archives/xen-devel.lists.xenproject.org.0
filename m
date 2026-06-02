Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dvxVDK8rH2qGiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:14:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A463155A
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:14:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aegj3+uY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325376.1590862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUZK-00016o-B9; Tue, 02 Jun 2026 19:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325376.1590862; Tue, 02 Jun 2026 19:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUZK-00014d-86; Tue, 02 Jun 2026 19:14:30 +0000
Received: by outflank-mailman (input) for mailman id 1325376;
 Tue, 02 Jun 2026 19:14:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUUZI-00014X-M0
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:14:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUUZH-004D8u-IV
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 21:14:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f2b8c-2eae-0a2a0a5409dd-0a2a4506bfec-6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:14:27 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f2b93-7371-0a2a45060019-d1558036b542-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:14:27 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso112200695e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:14:27 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344541sm1179447f8f.22.2026.06.02.12.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 12:14:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780427667; x=1781032467; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dSIr93Nit88CgmFo+FQCaDv+E0MBYSBdW114dphcJdE=;
        b=aegj3+uY0x3SN3+2jBaJH1AbKA1ijv6JeTkxqL3F9pql6Ws9cvFoVEHyU50x2I7uTs
         SoEeEWJu720z3PIC54wxJvMH+3JJBV3QfUPTo97wk3sP+oGFsVpIvu7Q7rzSkg3QS8XK
         nT/+7TwTQCXGDKJaMEk26qgNL06Xg4EuswJWIYFhDJFw5xovqZAV2fZARj3HyU/xY4/s
         L301DWHT1nEKmxbVJJ43+BJhRwVtRC3A6ZuzHiEwdjOCm9VAauBLG1hCkQSSiQIDYFXy
         3es/lvtib6qw/1lNVGX+kv0OWWw8d3GFhkgVf7OrYySryONOTrTL02hCiCWRYYGEP0ON
         CFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780427667; x=1781032467;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSIr93Nit88CgmFo+FQCaDv+E0MBYSBdW114dphcJdE=;
        b=WJJGcK4sGaBvyuxdllhESimYIvwpAAxeFhDR+pazJ3SN/2u6zUbHEUQ/BJCPW0FVCT
         UCplMsN+sbcHmb+h7/B/860mQOx3AlgH2GhqVFYVG8YWSIYJoj7Vvfx66Q6WjGN+c6QM
         k9exfgzCMhw6iDjVI/loA3gQChEsT27jgHGw18Gca32aQ6cbEJvQnBwtSzD9XLdmt721
         hF+2Ppwjo1pEM8LfNLogq1B/PkEO1OKC/qsm8usww4mXS7IYsze1lZqybgp7Z6WoP3ab
         Zt+uGRU51LPnmxByG3ZA5lwZPsChLSEFknh+CrmMAIER/CtuhftDm1Rn9WRon8DD1F3X
         Sb3g==
X-Forwarded-Encrypted: i=1; AFNElJ9fyHtQvpTb/0fSsD39AD9tWZPcMtFcDx74vDCWff79kDeQZVmg7PdbYNs9IQd4FSHG6QCoD0r5RV0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnIDoT4I8WEkCgCOqQ//ycrREOYbe7WtATxmcv4pGn3ihPTU4n
	mwPk10ym/SIDnUVf+OISjBFDSj7mYk/S9BJuwDZ5V27ueWeTJdGWez8k
X-Gm-Gg: Acq92OE1mqpff/GKvwiilagR0DnDVY6E4gP0IAn1DXIOWmb2g02lm9EvboT4AdXkbNE
	D16d/fkHqcS60Gvmch39KyihZ2jeIXqd5CiLt/bHPYlfe9tttgE0Ua9GPwkXbVcnlcXtKJ2xtzg
	V4ugnnI2YjjEfitRKAT9+NW9Z0cuz/ogkx6kYJl21Z9hU6MhdB0gWtg/8NUywVNRsk0yWk7k3k+
	maKUouKxLG/zDG0D2axCcsogmPMt3kxR5YBfOIt2dMZjBaGz5/kOazjqJCS7LXtc8Suibjee2Ex
	hFxncw+TnRLlgf5VuVuTOO6JxekuMAh97bLSnNEN1eTo4K7hFfkxFkv+MNx/U4Cn2iOH0aMP5Ez
	3jRAgA0s+dFzLYLQqK0QOzsPjNMHFuk2f/ClnXaOrW0eqEngb0PSDyzaUTwqSsXwzcPzqmFmog6
	fAMmdskGtGkrJM8PxiejdCqZmO5lGwBtrORtFZD1CXyUy7qyj+oMejegXkVSdQHUGwzyqh5T1Wa
	GmUBhq84YkQSxGx
X-Received: by 2002:a05:600c:8184:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490b5eb64c9mr2515745e9.7.1780427666737;
        Tue, 02 Jun 2026 12:14:26 -0700 (PDT)
Message-ID: <2bc872ab-3623-48c0-8bf0-14ee9fa82d2a@gmail.com>
Date: Tue, 2 Jun 2026 21:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
In-Reply-To: <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780427667-8C87AD75-7F8596EA/10/73395122804
X-purgate-type: spam
X-purgate-size: 4121
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
X-Rspamd-Queue-Id: 7B5A463155A



On 6/2/26 6:11 PM, Oleksii Kurochko wrote:
>>
>>>   - Update the commit message.
>>>   - Protect some other places in common code from NULL pointer deref of
>>>     d->shared_info.
>>
>> What I'm still missing is the description clarifying why other uses don't
>> need guarding (or that there simply are no other uses, which - however -
>> I doubt).
> 
> I will add an explicit paragraph mentioning that the 2L ops in 
> event_2l.c are unreachable for a domain with no shared_info.
> 
> The only place which isn't covered now is  domctl.c:108 (virt_to_mfn(d- 
>  >shared_info)) is only reached via the XEN_DOMCTL_getdomaininfo path and
> as RISC-V doesn't use it now it could be left as it is what also could 
> be added to commit message.

For that part could be considered ...

> 
>>
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -320,7 +320,7 @@ void vcpu_info_reset(struct vcpu *v)
>>>       struct domain *d = v->domain;
>>>       v->vcpu_info_area.map =
>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>> +        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>>>            ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>            : &dummy_vcpu_info);
>>>   }
>>
>> At the example of this: The extra conditionals are dead code on x86 and
>> Arm. While the status of the respective Misra rule is still uncertain
>> for Xen, imo we'd be better off avoiding the introduction of new dead
>> code. Which in turn means we may need some kind of abstraction to have
>> these extra conditionals in place only for arch-es not supporting
>> shared-info at all.
> 
> What about then add config HAS_SHARED_INFO to xen/common/Kconfig and then:
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index e64b7df9b704..58442ce1f952 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -319,10 +319,14 @@ void vcpu_info_reset(struct vcpu *v)
>   {
>       struct domain *d = v->domain;
> 
> +#ifdef CONFIG_HAS_SHARED_INFO
>       v->vcpu_info_area.map =
> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
> -         : &dummy_vcpu_info);
> +        (v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
> +        : &dummy_vcpu_info;
> +#else
> +    v->vcpu_info_area.map = &dummy_vcpu_info;
> +#endif
>   }
> 
>   static struct domain *alloc_domain_struct(void)
> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
> index 59d9bf4c7ec0..3d7104100f0b 100644
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned 
> int prev_evtchns)
> 
>           evtchn = evtchn_from_port(d, port);
> 
> -        if ( d->shared_info &&
> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
> +#ifdef CONFIG_HAS_SHARED_INFO
> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>               evtchn->pending = true;
> +#endif
> 
>           evtchn_fifo_set_priority(d, evtchn, 
> EVTCHN_FIFO_PRIORITY_DEFAULT);
>       }
> diff --git a/xen/common/time.c b/xen/common/time.c
> index 1ee49a8b0d13..da8403949102 100644
> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -94,8 +94,9 @@ void update_domain_wallclock_time(struct domain *d)
>       uint32_t *wc_version;
>       uint64_t sec;
> 
> -    if ( !d->shared_info )
> -        return;
> +#ifndef CONFIG_HAS_SHARED_INFO
> +    return;
> +#endif
> 
>       spin_lock(&wc_lock);

...

+#ifdef CONFIG_HAS_SHARED_INFO
      info->shared_info_frame =
          gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
      BUG_ON(SHARED_M2P(info->shared_info_frame));
+#else
+    info->shared_info_frame = INVALID_GFN_RAW;
+#endif

~ Oleksii


