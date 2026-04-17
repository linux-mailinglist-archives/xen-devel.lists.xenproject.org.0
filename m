Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULsYGOE/4mmB3wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:12:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F207E41BEAC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284430.1566224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjvi-0007Ch-M5; Fri, 17 Apr 2026 14:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284430.1566224; Fri, 17 Apr 2026 14:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjvi-0007BC-In; Fri, 17 Apr 2026 14:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1284430;
 Fri, 17 Apr 2026 14:12:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDjvh-0007Al-2z
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 14:12:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjvg-009qSb-CV
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 16:12:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e23fbb-2eae-0a2a0a5409dd-0a2a4504e340-18
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:12:20 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e23f4b-1dec-0a2a45040019-d155dd2dec04-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:10:20 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43d74086e5bso668191f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 07:10:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc09b1sm5078025f8f.9.2026.04.17.07.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 07:10:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776435019; x=1777039819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MFFEGI8VYCxnUE2yW/8395iN1Ft1KukcQx5aYWm+TK8=;
        b=YktmXzGzbtTjH83oelz+l2X3N05SY7S/r5ne7wsySrMkVxHU0yfiCLHE4yzAHv9YxB
         OZNdEWBdKHbhhQAENlGSzC4m2c/fEzOym9HbmUTi44mDHxXrJev2WjIEfPCG8epBh0Do
         vaKMOWHMS+gBkYJ341YXSsNj42mtpD9tbFusBFTyyY8HGJBvGdpdqBtPpAibYDiteh6Z
         e6qJ70Eilzc+gZoBMR3VBE10rxOWCjk3Y3hxf84PfjForKe1mA2Q4JXErbxOouSJBP8Y
         5pYB6ITNqyl4SSp/CngtHCkV1uLtJVwseEvYVs7lKmoJLTuydqIittfW2ppdTY+ALSFo
         /nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776435019; x=1777039819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFFEGI8VYCxnUE2yW/8395iN1Ft1KukcQx5aYWm+TK8=;
        b=r72JrlDXwhK0SQgog80SL6Rs4P05NHKiRsdl3v/AM3aKlORbBhoKmtotUzkq2iq5pZ
         vJQfcxbaBP0jkvaNhFtFCo3OuST5a7kWfe2IdkVwU80kW0mSB0+Z0qQcr14V+0NAS03o
         bqUCO1t6J+yG3FipEHEY4ugQttVffFnzWCSa3I7MJSK260BUmFStVpjhLa8/56sT8APt
         stMxmJaEvxzr1nnpJ3pqL1BGprLtF6rXnTgn64tGz07+xboWkl14L4OgZ/IXQFwPr07Z
         k09GdgOb8kS2aoEnYHWiw9bpbtNZnFkH56EJ3MGWI3UV+RJRTJ75yf/w3k8nrENsW/Lk
         aVjA==
X-Forwarded-Encrypted: i=1; AFNElJ/RFg0ayCmbw6zbmvUYNdywnotQbucqtJvatYTdspQUw+TRcsDTtzatUG+JcohHnlkPjU2/R3zAaAw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUh3PzDJMDELAp3LvtfRKTnyZ1uqfzDjxIJrnQ8/sDxai8t32w
	miRHxL2VceMWjFLFBDA95lwkNrKzAo8MvPSU75SunTHJZY8GuRapmKlgMrF0ueAp+g==
X-Gm-Gg: AeBDieuyQiaNHik58rwVP88MQhuFwD346B6N2AuiY7C4kn7tHt5lcn/4Bc0/9a48tZl
	w44XCXWoDOhuSEtUfxpsWSqPUmADZUEukGyLyuBt+Kvpje8vLAGn6Jx2iLHNlumSBxLv06mz1lj
	MQD7BbAr8RtlnVzD3RjYox2fIFgVxXJJAVSPNm4IMUf3tpVaO711kxOVP5mbsoAmbc7dI8CrWKe
	KNrt7ImOTC249vLfHZ/d0j2+ZuhEoYOLc7BYsIPJU1ZKmDphaY9pOLwrmNWuVqyrHsRCCYbN1Tl
	MOe/B0zrpoPZWK77I+LuVj7NUxhTSxYmi0o20SaSDLDzeR2EvWR2e2na3OVWMcaCO7mDsD7Efsp
	4jkW1kRztYMAOlWCWh2BO0Hp2DEmV3gmOvVUGLaGtpELFLsVwfSrzJcOfqTEQVXDwuEkSp+rPqG
	aOiW4MTHHAooC/kHiCp1RCmuOnx1gLZAmlTS7c4CiNoTpcQCquF9hdzlDxsZX1iZm5WfdmWqUSO
	AIdr3zad9W9Sej7b+POvwTPsVBgsbQQpfcy
X-Received: by 2002:a5d:5f82:0:b0:437:711c:8754 with SMTP id ffacd0b85a97d-43fe3dc842bmr4559607f8f.7.1776435019415;
        Fri, 17 Apr 2026 07:10:19 -0700 (PDT)
Message-ID: <e8cc0135-2f34-44bd-94d1-63ad5dd40592@suse.com>
Date: Fri, 17 Apr 2026 16:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/27] xen/riscv: generate IMSIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <8154eae081d14da89f27bad581270cc5bba6ccfc.1773157782.git.oleksii.kurochko@gmail.com>
 <93e8407e-cff0-42cc-8cfd-2d82f536a886@suse.com>
 <b2c8e859-a91a-469f-b674-0942d240f0d9@gmail.com>
 <953a4d7a-95a0-4a11-b236-efdf21eb125c@suse.com>
 <ca52ad3b-d14d-478b-bf6d-2835f79fa257@gmail.com>
 <747744f8-44e8-4d87-871f-1c2f49a0fcc0@suse.com>
 <a46589de-e2d8-42bc-bdf9-8ac4fcbdcd7b@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <a46589de-e2d8-42bc-bdf9-8ac4fcbdcd7b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776435020-2997A3FF-ED467573/0/0
X-purgate-type: clean
X-purgate-size: 4600
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F207E41BEAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17.04.2026 16:01, Oleksii Kurochko wrote:
> 
> 
> On 4/17/26 3:50 PM, Jan Beulich wrote:
>> On 17.04.2026 10:10, Oleksii Kurochko wrote:
>>> On 4/16/26 1:42 PM, Jan Beulich wrote:
>>>> On 10.04.2026 17:40, Oleksii Kurochko wrote:
>>>>> On 4/1/26 5:05 PM, Jan Beulich wrote:
>>>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>>>> Guests using the IMSIC interrupt controller require a corresponding
>>>>>>> Device Tree description. Add support for generating an IMSIC node when
>>>>>>> building the guest DT.
>>>>>>>
>>>>>>> Keep a reference to the host IMSIC DT node and reuse its compatible
>>>>>>> property while constructing the guest-visible node.
>>>>>>
>>>>>> Again raises a migration concern. Presumably a guest would then be able
>>>>>> to migrate only to other hosts with the same compatible property.
>>>>>
>>>>> Right, but I don't think we can do too much and it is the simplest
>>>>> approach just to migrate to hosts with the same compatible property.
>>>>>
>>>>> If you concern is about DTS property then for IMSIC it will be always
>>>>> riscv,imsics according to the RISC-V DT spec. (IIRC, the only other
>>>>> option could be qemu,riscv). Actually, I can just hard code
>>>>> "riscv,imsic" explicitly instead of re-using of host name.
>>>>>
>>>>> If your concern is that we will migrate to a host which doesn't support
>>>>> IMSIC at all then we should or (a) don't migrate to such host or (b)
>>>>> provide an emulation of IMSIC. And option (b) would be terrible from at
>>>>> least performance point of view.
>>>>
>>>> That would all be only a secondary concern - in an IMSIC is needed right
>>>> now, so be it. My primary concern is with inheriting the host IMSIC's
>>>> properties.
>>> Could we do really something better?
>>>
>>> At the moment, the following properties are inhereted:
>>> node name -> not an issue at all, it is just a name of the node and
>>> generally doesn't matter what it is in the matter of DTB generation as
>>> phandle number of this node will be used as pointer to this node, not
>>> the name. If it would be better I can hard code just "imsic".
>>>
>>> compatible -> also, not a big issue. According to current DT RISC-V
>>> bindings it could be just "riscv,imsic". But then I have the question
>>> what if one day someone will come up with own implementation of IMSIC
>>> then "riscv,own-imsic" will be in host DTB and so I expect that guest
>>> DTB should have it as this h/w expects to use specifically OWN-IMSIC
>>> driver. So it seems okay to copy compatible from host DTB. Yes, if
>>> migration will happen where just "riscv,imsic" is supported then it
>>> can't be easily migrated to such h/w and its okay. But generally I
>>> expect that compatible will always riscv,imsic.
>>>
>>> riscv,num-ids -> generally, it could be any number from [63, 2047], but
>>> it seems like there is no any sense if put a value bigger then
>>> guest-num-ids=min(riscv,num-ids, riscv,num-guest-ids) for guest as h/w
>>> can't support more then that. At the same time I don't see too much
>>> sense to tell a guest that it supports less then guest-num-ids. What is
>>> the problem to give a guest a maximum that IMSIC could provide? With
>>> migration, of course, it will be an issue if new host will support
>>> different number of riscv,num-ids but I don't know what we can do better
>>> then just avoid migration to such hosts if old-num-ids > new-num-ids
>>> without significant performance drop.
>>
>> This is exactly why an admin may want to limit what a guest gets to
>> see / use.
> 
> Would it be better then provide a separate define for riscv, num-ids and 
> use it here? Maybe here it makes sense to re-use already provided by DT 
> binding property:
>    riscv,num-guest-ids:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      minimum: 63
>      maximum: 2047
>      description:
>        Number of interrupt identities are supported by IMSIC guest 
> interrupt
>        file. When not specified it is assumed to be same as specified by the
>        riscv,num-ids property.
> And if riscv,num-guest-ids the use some predefined in define value?
> 
> Does it make sense then provide the similar defines for compatible and 
> node name or for that properties it would be okay to re-use what host 
> DTB IMSIC node provides?

I fear I can't answer this. I'm not knowledgeable enough on DT. To me,
guest properties are (originally) specified by a guest config file.
How that maps to DT (in particular in the dom0less case) I don't really
know.

Jan

