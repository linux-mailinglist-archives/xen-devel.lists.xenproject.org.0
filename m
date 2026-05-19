Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE8lKT5/DGopigUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:18:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17175581451
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313148.1583372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMCF-0003mE-BC; Tue, 19 May 2026 15:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313148.1583372; Tue, 19 May 2026 15:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMCF-0003kk-7q; Tue, 19 May 2026 15:17:27 +0000
Received: by outflank-mailman (input) for mailman id 1313148;
 Tue, 19 May 2026 15:17:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPMCD-0003kb-EV
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:17:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPMCB-00CiuL-JB
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:17:23 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c7ef6-5cb7-0a2a0a5109dd-0a2a4508b0fe-36
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:17:23 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c7f03-63b5-0a2a45080019-d155da2fece0-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:17:23 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-bd22b2abaa4so655781366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 08:17:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68311670a00sm6448919a12.20.2026.05.19.08.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 08:17:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203843; x=1779808643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4Tad3+H1mBSyVcoyjsaiYAt1DwHQRehXSMzcDpaoRk=;
        b=iGsF2SOT+yvRKtYZNjpX0a+gXEiTrVTKzA47rA15gkDoFmF4WP9DCpKPeGl//lNCjg
         62sqZTta2J+J8T3SxEgA+uWv3UFiqJG01LZFyyHORAfjTKr6uEDkkg3+AFG55HSEaDQ3
         gjlNpcGWdegogjRwv0pYtZvoPk275QfiFqNvJ07ZHydnNq+Qn2aI4WVR7fA0eDI5XIFN
         SAeQ2ZU56wmZl57xB1gCOrAIXeQaGyb1HiEKAS8xAKnD9h1husoq89jJ77hniZjVDy44
         LKpDlrfyrnWaTvPhuV7l83UOcE0APTO6b20AnCBCv1T9CV8PpLP4EcEsfSPTln2Yux+A
         wT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203843; x=1779808643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4Tad3+H1mBSyVcoyjsaiYAt1DwHQRehXSMzcDpaoRk=;
        b=d55CbE0LKZkdBhxCnIKTqDtRnRLBG8x5OA8e1qUwlGR5n5NG/cp2xdWK3Lzn3PcvkR
         1JwnF1sjmnitNd0QHaNm/KOJDfkbh3bmHPUt49Y+ZsbmRjR4/sKN+YorPRcNAtTxH+2u
         f4P5SvIwwucR4r54jaIuVBp8cyBNmU53DfpCS6WzXImIq8JexbvhwsuuRkuY8nT+rWyX
         p7WLkVqcnXnQw3x5N1qzQ/7jsi0HLwB3/Bba5ZQJKHre2yp+kDhkCLYrxQDFB7gN7deO
         dPbre7DyRkzbSghCp+MnCZUVP3uEQYBSYx/989kjzoDDN1cvUSD/H6qIPW4vBdmLT8V7
         zp3g==
X-Forwarded-Encrypted: i=1; AFNElJ+0zwAVy/QriZ0MQkeyG0BCCOpfbhz7jPlQWxMaB1MdSTi8tQh2S2+PeUNWVLnAW2TnCqBENlTbkPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVXdUKYZxo6DBooWt6Y9MAzzvPBlY1+ehJV5mDaRo59DAXSzvz
	ZLjlAgOg2Q45SgfZ4oGTFyBdN7GJwRo+08YIY5XzikoTLVHyYXiVBO8w
X-Gm-Gg: Acq92OHgPuVLM69Vd4Yh/6w/qq48/utuT1CjvXqh3R7mhYy1GhMX7GDjDERcuqReuOd
	3reU274mLGgPu3xDwxtGbxBhLRI6Sv/a2VwyCKkt75205Z1W5NzTzGaFxpDo8YnkPzXo10L4Oxv
	vD0DqWKrbqnO4lo9+hshSUxspyFr3x341iYJUc/u0l5ElSoAGpvaeIUxtDzARZDGUPNR70eIj6v
	+Qr8LgTcT5iCaVnr0pfAnQ9/ms45p8Lch/m476RFbep22uZTbVCot2/bXUNAK+hrRLmXFyeqaDi
	FuAI4E7l9KZTVrwZooormsXpOxjXrpPm9/jhMkSE7u0wozR6Osfnx6Cu0Hx9DiFvOv3ZYgRyh7I
	jsfzFYZacl5J88Pd+VU+YYFAtZh5o2G9uX33q+dm/7e543YLQX9f/EWhHlE9nA6bCDCmYffsUVg
	gYkl8rJAdrifVr6HUNHhKr/fI0CdFItom/TDS4aTpytbb947YXAcxZFz70fafoAbpkoG7M4DvPY
	14=
X-Received: by 2002:a17:906:730b:b0:bd5:7c3:ac9e with SMTP id a640c23a62f3a-bd517aa8105mr1079972866b.46.1779203842663;
        Tue, 19 May 2026 08:17:22 -0700 (PDT)
Message-ID: <8472866e-49e6-45e8-8d86-3b6b09d2c177@gmail.com>
Date: Tue, 19 May 2026 17:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <b2d4f3f7f049837a25bc00bfb1d3da8b984a8b5a.1778250616.git.oleksii.kurochko@gmail.com>
 <364abd6e-4fff-437a-90c8-bb4489f0c51d@suse.com>
 <f032149e-aa99-4976-8012-39bd01d4a653@gmail.com>
 <23e8de1e-b792-4863-bd99-f529642fb963@suse.com>
 <fbd8b102-d495-4678-8226-a199554e266d@gmail.com>
 <3d9e2a3a-6839-4909-b60f-28b4c1a02cdd@suse.com>
 <fa617f4f-7057-4b59-8f28-5a014b0c423a@gmail.com>
 <3b5f681c-bda4-4c46-a96d-cd3da1658e28@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3b5f681c-bda4-4c46-a96d-cd3da1658e28@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779203843-BE368DB1-4CFEC29D/10/73395122804
X-purgate-type: spam
X-purgate-size: 4111
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 17175581451
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 4:53 PM, Jan Beulich wrote:
> On 19.05.2026 16:49, Oleksii Kurochko wrote:
>> On 5/19/26 3:40 PM, Jan Beulich wrote:
>>> On 19.05.2026 15:24, Oleksii Kurochko wrote:
>>>> I thought about two options as alternatives:
>>>>
>>>> 1. Take as a length host RISC-V ISA string but theoretically we can
>>>> emulate some extensions which aren't mentioned in host RISC-V ISA string
>>>> so it could be longer. So not a good option.
>>>>
>>>> 2. Having two walks in init_guest_isa():
>>>>       Introduce the following function:
>>>> static size_t guest_isa_str_len(const unsigned long *isa_bitmap)
>>>> {
>>>>        size_t len = 4; /* rvX prefix */
>>>>
>>>>        for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>>>>        {
>>>>            const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>>>>
>>>>            if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
>>>>                continue;
>>>>
>>>>            if ( ext->id >= RISCV_ISA_EXT_BASE )
>>>>                len++; /* '_' separator */
>>>>
>>>>            len += strlen(ext->name);
>>>>        }
>>>>
>>>>        return len + 1; /* NUL terminator */
>>>> }
>>>>
>>>>      and then:
>>>>
>>>> int init_guest_isa(struct domain *d)
>>>> {
>>>>        bitmap_andnot(d->arch.guest_isa, riscv_isa, guest_unsupp,
>>>>                      RISCV_ISA_EXT_MAX);
>>>>
>>>>        size_t len = guest_isa_str_len(d->arch.guest_isa);
>>>>        d->arch.guest_isa_str = xzalloc_array(char, len);
>>>>        if ( !d->arch.guest_isa_str )
>>>>            return -ENOMEM;
>>>>
>>>>        /* ... existing snprintf + strlcat loop unchanged ... */
>>>> }
>>>>
>>>> If approach 2 is a good one I can follow it.
>>>
>>> This might be yet better with only a single function. Otherwise the two are
>>> always at risk of going out of sync. After all you can use snprintf() to
>>> determine just the size needed; if you go look, there may even be an
>>> example or two in the tree.
>>
>> I will do than in the following way:
>>
>> static int build_guest_isa_str(char *buf, size_t size,
>>                                  const unsigned long *isa_bitmap)
>> {
>>       int total = 0;
>>       int ret;
>>
>> #if defined(CONFIG_RISCV_32)
>>       ret = snprintf(buf, size, "rv32");
>> #elif defined(CONFIG_RISCV_64)
>>       ret = snprintf(buf, size, "rv64");
>> #else
>> #   error "Unsupported RISC-V bitness"
>> #endif
>>       if ( ret < 0 )
>>           return ret;
> 
> You can use total here right away, and limit ...
> 
>>       total += ret;
>>
>>       for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>>       {
>>           const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
> 
> ... ret's scope to this loop. This then also justifies total to be of a
> signed type.
It makes sense.

> 
>>           if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
>>               continue;
>>
>>           ret = snprintf(buf ? buf + total : NULL,
>>                          buf ? size - total : 0, "%s%s",
>>                          ext->id >= RISCV_ISA_EXT_BASE ? "_" : "",
>>                          ext->name);
>>           if ( ret < 0 )
>>               return ret;
>>           total += ret;
>>       }
>>
>>       return total;
>> }
>>
>> int init_guest_isa(struct domain *d)
>> {
>>       int len;
>>
>>       bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
>>                     RISCV_ISA_EXT_MAX);
>>
>>       len = build_guest_isa_str(NULL, 0, d->arch.isa);
>>       if ( len < 0 )
>>           return len;
>>
>>       d->arch.isa_str = xmalloc_array(char, len + 1);
>>       if ( !d->arch.isa_str )
>>           return -ENOMEM;
>>
>>       build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa);
> 
> At least ASSERT() the success of this?

I will add:

ASSERT(build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa) == len);

but I expect that we won't be here if len is incorrect or 
d->arch.isa_str wasn't allocated properly.

Thanks.

~ Oleksii

