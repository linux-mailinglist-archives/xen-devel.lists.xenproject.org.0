Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ojWCJ5XpQ2rhlQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:06:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241C6E6416
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H3XQMrnY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1349203.1607092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weayq-0001bz-0u; Tue, 30 Jun 2026 16:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349203.1607092; Tue, 30 Jun 2026 16:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weayp-0001Z6-UK; Tue, 30 Jun 2026 16:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1349203;
 Tue, 30 Jun 2026 16:06:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weayo-0001Yy-AR
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:06:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weayn-007kZK-N2
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 18:06:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a43e956-2eae-0a2a0a5409dd-0a2a4508968a-44
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:06:33 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a43e989-edec-0a2a45080019-d1558032c8a5-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:06:33 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493a285ff0cso15501135e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:06:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636cde2sm9131987f8f.20.2026.06.30.09.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 09:06:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782835593; x=1783440393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFETf2n2gcAkaDan5xewsbtG4eIqBDodSDzJqWch+3c=;
        b=H3XQMrnYH74v9vchVO3m+N1NRJfLLGBEOlBl0axNJWPWRUkESvAbJW3CX94K+B4h/O
         6QpRFn1qU5CN46ZPGrCKFS/gGTkhqJ5mLNdwvaiMFIO5HKu6A4U+TUTUkDyn6PkgIGHJ
         +Mt0EXWWz9RXOWhgS7YymqRdmfbp/dTE/5Zz+48LH6H0HEhGiFMiuoHykzvu3hfUxtYh
         DlwC607FwaETGTK8DAwY5bCAYGhTw9N3lUq74oTqmn2n3CcEcm2tbCxZoqUvTTj8+lyx
         Vs2bORxSbLUKZ6PQ4oIQxjePL2lHM8P3IzFxfxOfztM1fqRm0ERKcdlOs8/8E/digDy3
         AnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835593; x=1783440393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFETf2n2gcAkaDan5xewsbtG4eIqBDodSDzJqWch+3c=;
        b=l9/Gq5HI/FwqsHLX2wxlIkm5hSt83ouMVFMrDr+jiI2tmH0coUqqsFSRAeH1riAyFE
         5z5GFJQ1zM/TRStPbYPJvIfMfxbkVEm/K2pcJAwfquzyGzsB5odehnc6sZFxZt1myvZY
         wSZwbujpKzuanApfKr/rUMl1FJTJAPpCdVAfpUlGCfEcgpc0hUd/FX/yaXCrB9d7rFJ6
         XrFeZgh+ePunrsiY3dNGbyTWcMagTL4LRYr37Y5MDG/JNh/YeDH6qb6inrmppqHwrbXO
         o+RROQ9iQKpNICTg1sgqEiOhvtmPvfGpUZqqISeJkU6mUhJyB1NkqeIzkEUhKu6J39mN
         765w==
X-Forwarded-Encrypted: i=1; AFNElJ82CTsJTwK5ILl6cEizUh45zfwmZIkTU1WV3E54F9grGa35AYztwMQQotviKLShZum6/TCjI+Zgz1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0d8oGdRO6QGOO5pZyBf5BZf9RY5P00AqI5TA/+zN+oJMq6AnH
	tjmUlB3aise9LuDtVYavlIX/9P9UfWrmjI/2xGD8lWfOHlCvKzZENLTG
X-Gm-Gg: AfdE7clYytcSUySSd/6YSRzDizD6+mlE3S72bAxr9wETiSiSj4kqy0IJG4Y6o5ClOmW
	ylCAjV2xpVSjA4z5LChiJr87AcZfJMa21VhrKdWobo/MsR1QwcL8VUhnfMGilW/YSJWt1FH7pWw
	f2qGHC4R1qQs64uAkeQa3Ai1SCPOMLtTfdFGHpTFwu4cPjr9yyuFbbfCIT5hGMnKSTS6B+w+60A
	dyAWWYaFRE9+zKLBClwEA8jQZCzhH0QeLj+VOP1ANZvez5PDRxr0xAri7IB8kvgnqKHonfQxqUt
	D2tUIG8NdrmbbBE3p8uatngEc4iiYIIRIRcjo/tIXTdqiv+OKT9DeWQsZAi5HO51BsmzQGbYf1A
	EekLXQyK5pKnZwSWCm1dv0s9f3hAnv82Px2w707pByydW0Vb4mYcfvZBPgvr9B+rZcZaD0SiW90
	lqVT2ghu9h9Z7deUmAPxHoKVWx4IheqVGMXEEPT/jZTo/19BNrHRsrGywAotFcolMGHE8=
X-Received: by 2002:a05:600c:3e17:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-493bda381f4mr18623955e9.2.1782835592757;
        Tue, 30 Jun 2026 09:06:32 -0700 (PDT)
Message-ID: <20740b98-bdc0-4098-afda-45b09dc07ca3@gmail.com>
Date: Tue, 30 Jun 2026 18:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/25] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <b2678a5697112d3ac16a98b86433da22374324b2.1782487661.git.oleksii.kurochko@gmail.com>
 <9d082182-394d-40cd-9afe-35369d7bc4bc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9d082182-394d-40cd-9afe-35369d7bc4bc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1782835593-42B3C3FC-3E339A94/10/73395122804
X-purgate-type: spam
X-purgate-size: 5046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
X-Rspamd-Queue-Id: 0241C6E6416



On 6/29/26 4:46 PM, Jan Beulich wrote:
> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>> Changes in v4:
>>   - Add an explicit overflow guard in build_guest_isa_str(): return
>>     -ENOSPC when buf is non-NULL and total >= size, to avoid the
>>     size - total underflow being passed to snprintf().
> 
> How does ...
> 
>> @@ -480,6 +489,81 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
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
>> +    if ( buf && ((size_t)total >= size) )
>> +        return -ENOSPC;
> 
> ... this help an underflow ...
> 
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
> ... on any but the first iteration here?

Agree, overflow still could happen. I will update that part to:

char *p = buf;
size_t left = size;

...

            ret = snprintf(p, left, ...);

            if ( ret < 0 )
                return ret;

            total += ret;

            if ( buf )
            {
                if ( (size_t)ret >= left )
                    return -ENOSPC;

                p += ret;
                left -= ret;
            }

Then size - total never compute, so unsigned underflow simply cannot occur.

> 
>> +static void __init init_guest_unsupp(void)
>> +{
>> +    __set_bit(RISCV_ISA_EXT_f, guest_unsupp);
>> +    __set_bit(RISCV_ISA_EXT_d, guest_unsupp);
>> +    __set_bit(RISCV_ISA_EXT_q, guest_unsupp);
>> +    __set_bit(RISCV_ISA_EXT_v, guest_unsupp);
>> +    __set_bit(RISCV_ISA_EXT_h, guest_unsupp);
>> +    __set_bit(RISCV_ISA_EXT_sstc, guest_unsupp);
>> +    __set_bit(RISCV_ISA_EXT_svade, guest_unsupp);
>> +    __set_bit(RISCV_ISA_EXT_svpbmt, guest_unsupp);
>> +}
> 
> Wouldn't riscv_isa_ext[] better get a prominent reminder that additions there
> may need mirroring here (unless guest support is implemented at the same time)?
> (As before, yet better would of course be to make sure this is consistent
> right from build time, i.e. without the need to have this separate function.
> Or minimally have the info right in that array, so that while adding one needs
> to think how to set that separate field.)

How about making the field mandatory at the call site instead, so it 
can't be silently forgotten:

#define RISCV_ISA_EXT_DATA(ext_name, guest_supp)    \
{                                                    \
     .id = RISCV_ISA_EXT_ ## ext_name,                \
     .name = #ext_name,                               \
     .guest_supported = guest_supp,                   \
}

Every entry in riscv_isa_ext[] would then need an explicit true/false 
argument, e.g. RISCV_ISA_EXT_DATA(f, false). That forces whoever adds a 
new extension to make the decision right there, rather than relying on a 
separate init_guest_unsupp() to be remembered. We'd drop guest_unsupp 
and init_guest_unsupp(), and build d->arch.isa directly from the array 
in init_guest_isa().

Maybe it would be better to introduce separate structure which will 
embed .guest_supported + struct riscv_isa_ext_data.

> 
>> --- a/xen/arch/riscv/include/asm/cpufeature.h
>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>> @@ -17,6 +17,7 @@
>>    */
>>   #define RISCV_ISA_EXT_BASE  26
>>   
>> +
>>   enum riscv_isa_ext_id {
>>       RISCV_ISA_EXT_a,
>>       RISCV_ISA_EXT_c,
> 
> ???

I will drop unnecessary empty line.

> 
>> @@ -94,6 +95,9 @@ struct arch_domain {
>>       struct p2m_domain p2m;
>>   
>>       struct paging_domain paging;
>> +
>> +    DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
>> +    char *isa_str;
>>   };
> 
> Why is it again that both the bitmap and its string representation need
> storing? In the end they provide two different sources of truth, as there's
> no guarantee that they'll remain in sync.

isa_str is needed to guest device tree to tell which extensions are 
supported.

isa bitmap is needed to check in runtime if extension is available and 
it will be faster then search in a string. It could be a cases when code 
is generic enough and some things shouldn't be touched when some 
extension is available or not.

Considering the way how they are built they should be always in sync.

Thanks.

~ Oleksii

