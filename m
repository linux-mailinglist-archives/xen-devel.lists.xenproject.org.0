Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMAtINa0O2p8bggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:43:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD196BD74E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:43:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="m/SO2Ciw";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344779.1603814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcL4j-0004Vn-M8; Wed, 24 Jun 2026 10:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344779.1603814; Wed, 24 Jun 2026 10:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcL4j-0004UP-JN; Wed, 24 Jun 2026 10:43:21 +0000
Received: by outflank-mailman (input) for mailman id 1344779;
 Wed, 24 Jun 2026 10:43:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcL4i-0004UJ-0n
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:43:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcL4g-00FFLv-Ng
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:43:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bb4c1-e002-0a2a0a5209dd-0a2a45028404-20
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:43:18 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bb4c6-fdf1-0a2a45020019-d155a72aa9bf-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:43:18 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5ad4f1cf3cdso1853892e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 03:43:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad6957a694sm1618204e87.49.2026.06.24.03.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 03:43:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782297798; x=1782902598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0C1a8vdF0Udkj7mz1RPZkhj1vjPEd2W0bCVgL0JyvA=;
        b=m/SO2Ciw4zO4Rt4vGCnmjzA0m4g2znU9XRk//3dT/33KqpZOyiK4yx2MPKsNGJ1/+M
         wuFoFpPPGPzeGnCYAfoQJVoM0nW948UMDpJXE21HYce/GrdQQQME+cqQE5st3uPyirzh
         C/F19TGm+rGeCZvmW6bp2+Iw1JfGmqdbF/ld3JwF9JEYILkTWj30oTQBaF771MOYQ+aa
         6n9hOjZieGmK0UTq8rQXw5TVOuu5AW0zUmdMwjy7l4GaRI+MVql3Cj0h6mg4AQRTyAGf
         nDiLEHxNXaZSRCiKe34wftUPFWmGxZ4WY9Obhy5dZp0Ir6nCT66kMRh5HUBE5zuu2UqV
         PObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782297798; x=1782902598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0C1a8vdF0Udkj7mz1RPZkhj1vjPEd2W0bCVgL0JyvA=;
        b=nxFCXdFAJ+1pzj/aA4yqxpyOoF6tHtbKNVqtFrj4m8A4yScHY3jT8qr15zgDFqdVfZ
         d6a585V5gGVwEu+JlEvhMeZT8VFEf5+J5AA0wQgJVMssFvD26d3NMx1bhThaGeseSLt2
         rH/f3NAAqjkHvCXIaj6tbH+MYm9X36/NLDehYrXToBRZyHFJaC8R9KYWZdabVrk7myIU
         n5vw5qQ5sMhImaZzrVq2vQebruxlr8z0Iy7aqYqj/DjlgncsYi/yTyvXzzhc3Z4CvV+s
         N1TOOBA0ToAM04S/3MYidz9HtGq0mpSaBUrIThFC8kFRmTwscmrj2rbgGL5J+9/1psON
         /0UQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF45L7gFN+HWx2BMEHWXAiMW56pd424RyeaXxlBBkn6PQ3T/0CDcHEs1HPxsFRTSRnMIK1cpRe2v8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTnSuiI20mVOVTZ+2knajby3u76OM1R5R9W7i9ByPmWc6bzHbf
	A9eWyEmtPm4bBIPJvbU68wIzrr3DsNcPpMLlV3z8PP70mnn+ZdCYJkkW
X-Gm-Gg: AfdE7clzoPwrab/nfrIxQnZcBlLowW/b08zrx2CCjA6n/h3SZIMewD2KIHYNm8SyJZO
	0equ0nVUgRXFN7FSVj9Go60qB70zwYdUgBOo63n6LqKlRHhlj3knynecTvOQJyregf/TDrYJZJe
	DXMD32oDGPxtvUI9wkUhlBo9tnE4sTN6EeMj+2FvNEONFagiYeRxrzkPG1wNo9R++gfmqgZfiWG
	dlyuJfTfsLHCQJgl7yNaLVcsySI+v0TYQS1URVqZRRYhKAZYEW2B323By3iTgPmScHeZiSOUbzV
	5QxHGkwekjxUHitv+IPJPnNF3uQBiVSDVOw8ZV3fK67qg+FvBlzfjj+zhsPNQRX9AqfJzynMCow
	uMnmwM7TTMXrPjrtv3T3/Ml1ozQFQg/QnGuBYZ8wbjJBPjTs4I5zB16TBzzXi5fBTr5dRSEd8wo
	GAt8/UG/mpYJlLy9ZG36QJhyWW+FxJ8YGm1hGWus7ZPDZ1SqnfHaTpVx/nsNpqVVvwQNM=
X-Received: by 2002:a05:6512:ba3:b0:5ad:5daa:9c79 with SMTP id 2adb3069b0e04-5ad695add15mr2293979e87.25.1782297797685;
        Wed, 24 Jun 2026 03:43:17 -0700 (PDT)
Message-ID: <29fbbfe2-579c-4506-96d8-930c03a65c61@gmail.com>
Date: Wed, 24 Jun 2026 12:43:16 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aa19d6b0-9407-423b-a786-a43a72b50df5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1782297798-4767B3F3-3E17A8B6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2793
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFD196BD74E



On 6/22/26 4:09 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> Introduce generation of the riscv,isa string passed to the guest via the
>> Device Tree riscv,isa property.
>>
>> Introduce the per-domain isa string and guest isa bitmap, populated
>> during domain creation by calling init_guest_isa().
>>
>> Introduce guest_unsupp to filter out ISA extensions that should not be
>> exposed to guests:
>>
>> - f/d/q/v: FPU and vector context save/restore are not yet implemented
>>    for guests.
> 
> I may have asked before - what about Zfinx, Zdinx (and the supposed Zqinx)?
> They aren't in riscv_isa_ext[], yes, but perhaps wrongly so? And hence they
> may want at least mentioning?

They are not supported by Xen so they aren't in riscv_isa_ext so it 
looks fine for me.

They are not in guest_unsupp as they aren't present in riscv_isa_ext and 
so it won't be propagated to guest anyway because of:
   +    bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
   +                  RISCV_ISA_EXT_MAX);

While it isn't in riscv_isa_ext[] I think it is fine not to add them to 
guest_unsupp, so I will add to the commit message that:
```
- Zfinx, Zdinx and Zqinx are not implemented for guests either; as they 
are not present in the riscv_isa_ext[] array, they can never be set in 
riscv_isa and thus are never exposed to a guest, so there is no need to 
list them explicitly in guest_unsupp.
```

I think it is fine for now but probably it will need to be reworked in 
future.


> 
>> @@ -480,6 +489,78 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>>       return test_bit(id, isa_bitmap);
>>   }
>>   
>> +static int build_guest_isa_str(char *buf, size_t size,
>> +                               const unsigned long *isa_bitmap)
>> +{
>> +    int total;
>> +
>> +#if defined(CONFIG_RISCV_32)
>> +    total = snprintf(buf, size, "rv32");
>> +#elif defined(CONFIG_RISCV_64)
>> +    total = snprintf(buf, size, "rv64");
>> +#else
>> +#   error "Unsupported RISC-V bitness"
>> +#endif
>> +
>> +    if ( total < 0 )
>> +        return total;
>> +
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>> +    {
>> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>> +        int ret;
>> +
>> +        if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
>> +            continue;
>> +
>> +        ret = snprintf(buf ? buf + total : NULL,
>> +                       buf ? size - total : 0, "%s%s",
> 
> If total > size this subtraction will underflow and a huge value will be
> passed to snprintf().

I will add the check before for():

if ( buf && ((size_t)total >= size) )
     return -ENOSPC;

Thanks.

~ Oleksii

