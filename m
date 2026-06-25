Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8b7IAnPbPGqztQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 09:40:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAE66C36F7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 09:40:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HrooN2+Q;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345313.1604214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wceh1-0003SE-Dq; Thu, 25 Jun 2026 07:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345313.1604214; Thu, 25 Jun 2026 07:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wceh1-0003Pe-Ay; Thu, 25 Jun 2026 07:40:11 +0000
Received: by outflank-mailman (input) for mailman id 1345313;
 Thu, 25 Jun 2026 07:40:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcegz-0003OR-Mm
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 07:40:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcegy-00CbV2-Tt
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 09:40:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3cdb50-bab6-0a2a0a5309dd-0a2a4509ca2c-28
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 09:40:08 +0200
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3cdb58-97e6-0a2a45090019-d155a72dd911-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 09:40:08 +0200
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5ad4a5647e5so1805976e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 00:40:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3999afd3ee9sm42327671fa.17.2026.06.25.00.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 00:40:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782373208; x=1782978008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ah0BLetU9nOhFauhFQa1xwuEARHueCAlyFA66N6wmg4=;
        b=HrooN2+Q8+mI/kwrJSEHMOsLQVlHRutZVA5DaE1KHRbE/SVSuSEXm4WQV9R6J0dNVo
         zcNIKgjwjan+WM7HLC59Ll6vX7U2n3VaKZ5xngWgEzf7fWXK+AjlHpPRxu5E/re0zpUi
         6AOG0RlN8I6jD80dLfsTYo9E0AWLEx+mE/4rFcyGnQZ4q9c2D/opLUc01Vv9XFz8y36p
         uLjfbzIHY5lgBRQGe5ZKN2hXB2Nw88zjFCYrhoQCTBAf3lmgkW5VThy77qUuCtZe5M7o
         yu6QvzAa0//19l+sz8V5bsD2glphBSzVxsfFYDdcYGGdX2unGDbJhjiCBjw5niCxUXgO
         dkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373208; x=1782978008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ah0BLetU9nOhFauhFQa1xwuEARHueCAlyFA66N6wmg4=;
        b=rJEo1eKGB4XACJETFmxncUyRkQ4GCz0ZsqrZfFv7yX+qZrWw91+hxodjlCgNW1BPu2
         xWoOPfWEfOpQpDlW0rn+xnjBH4SRwjFwrXc3e6DWIsFaNF42IlhH+nhaedBHXQwzldNe
         eGS+IYkGMiPTXNozU0XSuLo386PnQr/Xe4SbA6iBfq9RgztJe0GTpsDvBNVblofaUF4A
         nqYma/e5d1oyD7toEcBOq+VQF3/eTjextxsJyYHaunf9zhECjFpPeBaIPt1cHmJYNw22
         +PSErds0ENs+si6pn3GG6IRGQs682D5w6UuP4UtNHbgrjFarQy5Db7KT6OgfzQYRv+qL
         J9gg==
X-Forwarded-Encrypted: i=1; AHgh+RqUzEX5E/JwHENaeIiWGL5hF2a8kYDBT2OdjzEQzIRgaW6JSAegjSy/fdOAGzMswLPGzdEYGVmIe6s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk1/gCAtFGSOUuQnYh/1Vv0upYGX+cMDbprEk25HxLuVMQzMcl
	GwyWDeuXMriYD+hD5/7hDN/a2XuHKso7LpWrWsk5Hxa/9huJNnkbCfiL
X-Gm-Gg: AfdE7clqVIpPpdafAu48tDPmWlYcfhnXbQ4AkgxqkLOiRlJOK0k99AA88bB018fgoOa
	ky4lC+osA4MUJFzt9f1z+Rzz6jSruQkj4VZjd/4bJ3KolntK/6cquybN4ilXsdI7NY+7gDYrLe+
	/Unn8V4wul2jFn2pIe50zeDImKuxT44deKzl3Q9kby9Tzf3D0VuFfoVat+nr/q/TCW+PJV1MXRN
	nkz+KaU8xYYCn90WWDIoJ6JArZbscE6r/Smo5mHYxSEAaSpsAfGIX5YaBwi4okwqJW5ARZJGIAe
	2CMDBWuLlEFnxXlyaBhbRfk8cWKkX8wlABitBX9NGpOnlb8LQX2HTLl3rhUdG8NGpzvQpyqGgfo
	KDVSbeSiPKg09ZG3CYuU/qgieznG6V6GLbk4YoSN3QQY3MYlsTuYo2KL1uPaUuAsJHDrSQK5VR3
	q5/2LTM407f46nWKoIjE8GslUEqx6zTBgyi3zODTdiY6CNt2T6rwyA9L4hU17LZSqrUfA=
X-Received: by 2002:a05:6512:b9d:b0:5ae:9c16:c164 with SMTP id 2adb3069b0e04-5aea1f4b92fmr423649e87.26.1782373207849;
        Thu, 25 Jun 2026 00:40:07 -0700 (PDT)
Message-ID: <34172643-fbc7-4fa4-8ace-a5753e0b6b30@gmail.com>
Date: Thu, 25 Jun 2026 09:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/23] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <3fb06376e057fa99b0df78e97761b8cff56ca9eb.1781693963.git.oleksii.kurochko@gmail.com>
 <aa19d6b0-9407-423b-a786-a43a72b50df5@suse.com>
 <29fbbfe2-579c-4506-96d8-930c03a65c61@gmail.com>
 <f649bec4-c603-4ad0-8269-33a9c9d2d8fa@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f649bec4-c603-4ad0-8269-33a9c9d2d8fa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782373208-5559C986-F5D194B8/10/73395122804
X-purgate-type: spam
X-purgate-size: 3070
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FAE66C36F7



On 6/24/26 2:40 PM, Jan Beulich wrote:
> On 24.06.2026 12:43, Oleksii Kurochko wrote:
>>
>>
>> On 6/22/26 4:09 PM, Jan Beulich wrote:
>>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>>>> Introduce generation of the riscv,isa string passed to the guest via the
>>>> Device Tree riscv,isa property.
>>>>
>>>> Introduce the per-domain isa string and guest isa bitmap, populated
>>>> during domain creation by calling init_guest_isa().
>>>>
>>>> Introduce guest_unsupp to filter out ISA extensions that should not be
>>>> exposed to guests:
>>>>
>>>> - f/d/q/v: FPU and vector context save/restore are not yet implemented
>>>>     for guests.
>>>
>>> I may have asked before - what about Zfinx, Zdinx (and the supposed Zqinx)?
>>> They aren't in riscv_isa_ext[], yes, but perhaps wrongly so? And hence they
>>> may want at least mentioning?
>>
>> They are not supported by Xen so they aren't in riscv_isa_ext so it
>> looks fine for me.
>>
>> They are not in guest_unsupp as they aren't present in riscv_isa_ext and
>> so it won't be propagated to guest anyway because of:
>>     +    bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
>>     +                  RISCV_ISA_EXT_MAX);
>>
>> While it isn't in riscv_isa_ext[] I think it is fine not to add them to
>> guest_unsupp, so I will add to the commit message that:
>> ```
>> - Zfinx, Zdinx and Zqinx are not implemented for guests either; as they
>> are not present in the riscv_isa_ext[] array, they can never be set in
>> riscv_isa and thus are never exposed to a guest, so there is no need to
>> list them explicitly in guest_unsupp.
>> ```
>>
>> I think it is fine for now but probably it will need to be reworked in
>> future.
> 
> Especially as long as F/D/Q aren't supported by Xen, I would consider it
> pretty desirable to allow the (cheaper to implement on the Xen side) Z*inx.
> Provided of course there's actual hardware offering any of Z*inx in place
> of F/D (not so much Q).

I agree Z*inx would be cheaper for Xen to support, precisely because it 
keeps FP values in the integer registers that Xen already saves and 
restores on context switch, so there's no extra state to manage (unlike 
F/D/Q).

That said, I'd prefer to leave it as future work rather than handle it 
in this series:

Z*inx aren't in riscv_isa_ext[], so they can never be set in riscv_isa 
and are never exposed to a guest today. Nothing here blocks adding them 
later; it would be a separate enablement step.
I couldn't find any board (with or without H) advertising Zinx in its DT 
— manufacturers seem to ship F/D instead.
To my knowledge Linux mainline has no Z*inx support, so a Linux guest 
expects F/D anyway. And per the unprivileged spec, software assuming F 
is incompatible with software assuming Zfinx and vice versa, so the two 
can't be transparently substituted.
So for now it doesn't make much sense to enable Z*inx for Xen and/or 
guests, but it's a reasonable future enhancement once hardware and 
guest-OS support materialize.

~ Oleksii

