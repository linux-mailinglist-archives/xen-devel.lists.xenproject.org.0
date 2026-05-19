Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OssDtNQDGqTewUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:00:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B9257E355
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312917.1583099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJ7A-0005nX-OT; Tue, 19 May 2026 12:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312917.1583099; Tue, 19 May 2026 12:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJ7A-0005l2-LU; Tue, 19 May 2026 12:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1312917;
 Tue, 19 May 2026 11:59:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPJ78-0005kw-QZ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:59:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPJ78-001xhr-6O
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:59:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c50b3-bab6-0a2a0a5309dd-0a2a45099b62-26
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:59:58 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c50be-2497-0a2a45090019-d155dd2ac1af-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:59:58 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43eb05b1875so1911312f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 04:59:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768072sm44537304f8f.5.2026.05.19.04.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 04:59:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779191998; x=1779796798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCrYbrBOqFhxqmffg86YlHWIqubtSdqBS4IzDOhc9WU=;
        b=puEv+FbbO2w3wKtsZB/5qUzMd9ut9xMogn3/IxU0WkK8SCZPaTpuG2rzkh1vMDtPEh
         awFiogSy+MA+bmkNPB+/wC+MME6YHsUTQtl7L9yzWOxAu5ekiPCA2QgPH0S08qnvfbFh
         Inbk1ZktrwhPSAAC73Uzl5YUXLqj/cy0cAh+vXw8d4mNhK0efatN43QImdoCbWgzyr63
         UKYW/lL/4Ql5xUpfiiB8TCy/yfMHvsUttUhgQ7no7vHOP4gT1PcX4us7I9dGnH0GBX6F
         ugCICIn39yRb1DihCCxi49wFQ2gxT9dMqR0/kJmqdHhWsxqAlPbLb2GPAlIiKepnJD8/
         5kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191998; x=1779796798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCrYbrBOqFhxqmffg86YlHWIqubtSdqBS4IzDOhc9WU=;
        b=haPj/wrxw+iTaowM3apOk4ahZpkTt1zWhMcW5rPMOdksAgmb0Bg620Wk5i7HwbtsUW
         EHVVV4LmVZ2Y4kcOJ8cC44oxjYEZRhz/CD8zpq8kENOgQXfhP3tDZ/EI0OhWjaS0jH11
         dCCXPQnZ5uV4g1VvPVy9/rpTaCXqrzJsn42b9x2aNxiD6+ZnzczpFxhZ6YTpvUPzYU4B
         V/Nbaxn/f/pDTcmstsmdhQq/sqteIVILQKJVhmChM1tZbQhiVqfZxB8zqD6j6QsVstQL
         AM31nqEB53O5YX3DEMZDBjhZqRkgL02x8dyhiPLxHhkX4nkVqiJXtsIySkp4Vj8Ab9n0
         h1Xw==
X-Forwarded-Encrypted: i=1; AFNElJ/y12LhT1ulOyEb/l189OSbFT0pVLfLXT8AqlYlmBhiM/grG0ev2lF7qsmGH4JihlJYyShhiaHyJ7s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhCBl3AX8un19ABp/Z7dK6pJXSDyi8eboW1OweQv0d1T2k9EEx
	UUC4NH1YhdqYO2JKpnyRdyu9Y//Ld+lVVVFAUTbiTI4Lftkr1Yk2NFOv
X-Gm-Gg: Acq92OEdEVCI9lEDFKjF3RuddUrfR2SsRe7bcfxAY4Aak/uyzkcHCSvqOSY50hBl4w0
	xnDjka8roQjrWkGjgso6yqaRT5eTXFpc9MZ5IGBrBLanhuN0NA2+bYieRuMgL/+BON0HEIfaiTR
	N3UeJ7Fry6QAWIDziDt01O9jWk7180rrnBj6P2t/roB84NKl7XdhRAl8eqIszYacRiUyOc9bqun
	YVGgBtyfSwzHA3xrQFuyVNhmh9nUl4/IbEbQiltF3+mhhhrRPS5BC8fM7weD2GkA7ioWxd4ciat
	a8sNWVK5tO26ThDOG5Fa/DDsk3iWZv0VbNAsqefkfkfIxhfkexXTnNrQxf37o1p9wMPbRIJrr5J
	yMCHlOECe/zDKx0BGcg2VX5aB3sKWaTr3p84Uk7IxnaaXvPPKFNlbQdfZYpJ1nm5on6f7zfinSS
	MXKzNjXYV0wrodb64R80DTjWbygQI8paC1QCma69oFrGPXBG3DDTdDZWHVQ+HEzZUSF3UVn+rf2
	pWLiRy6348kzga3iPfArhRS
X-Received: by 2002:a05:6000:4007:b0:456:ba09:3e64 with SMTP id ffacd0b85a97d-45e5c5b3669mr30505870f8f.1.1779191997531;
        Tue, 19 May 2026 04:59:57 -0700 (PDT)
Message-ID: <f032149e-aa99-4976-8012-39bd01d4a653@gmail.com>
Date: Tue, 19 May 2026 13:59:56 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <364abd6e-4fff-437a-90c8-bb4489f0c51d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779191998-8A38AA53-ECC27105/10/73395122804
X-purgate-type: spam
X-purgate-size: 3128
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
X-Rspamd-Queue-Id: 87B9257E355
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 5:51 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> @@ -480,6 +488,53 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>>       return test_bit(id, isa_bitmap);
>>   }
>>   
>> +int init_guest_isa(struct domain *d)
>> +{
>> +    char *buf = d->arch.guest_isa_str;
>> +    size_t len = sizeof(d->arch.guest_isa_str);
> 
> Seeing these uses: Is the "guest" prefix really of much use here?
> 
>> +    bitmap_andnot(d->arch.guest_isa, riscv_isa, guest_unsupp,
>> +                  RISCV_ISA_EXT_MAX);
> 
> Same question here, clearly.

I will drop "guest" prefix for "d->arch.guest_isa_str".


> 
>> +#if defined(CONFIG_RISCV_32)
>> +    if ( snprintf(buf, len, "rv32") >= len )
>> +        return -ENOBUFS;
>> +#elif defined(CONFIG_RISCV_64)
>> +    if ( snprintf(buf, len, "rv64") >= len )
>> +        return -ENOBUFS;
>> +#else
>> +#   error "Unsupported RISC-V bitness"
>> +#endif
>> +
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>> +    {
>> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>> +
>> +        if ( !riscv_isa_extension_available(d->arch.guest_isa, ext->id) )
>> +            continue;
>> +
>> +        if ( ext->id >= RISCV_ISA_EXT_BASE && strlcat(buf, "_", len) >= len )
>> +            return -ENOBUFS;
>> +
>> +        if ( strlcat(buf, ext->name, len) >= len )
>> +            return -ENOBUFS;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void __init init_guest_unsupp(void)
>> +{
>> +    set_bit(RISCV_ISA_EXT_f, guest_unsupp);
>> +    set_bit(RISCV_ISA_EXT_d, guest_unsupp);
>> +    set_bit(RISCV_ISA_EXT_q, guest_unsupp);
>> +    set_bit(RISCV_ISA_EXT_v, guest_unsupp);
>> +    set_bit(RISCV_ISA_EXT_h, guest_unsupp);
>> +    set_bit(RISCV_ISA_EXT_sstc, guest_unsupp);
>> +    set_bit(RISCV_ISA_EXT_svade, guest_unsupp);
>> +    set_bit(RISCV_ISA_EXT_svpbmt, guest_unsupp);
>> +}
> 
> These don't need to be atomic, do they? I.e. __set_bit() would suffice.

Agree, __set_bit() would be enough.


> 
>> --- a/xen/arch/riscv/include/asm/cpufeature.h
>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>> @@ -17,6 +17,8 @@
>>    */
>>   #define RISCV_ISA_EXT_BASE  26
>>   
>> +#define RISCV_GUEST_ISA_STR_MAX 256
> 
> This looks like it won't be good for very long, seeing how long ISA strings can
> get. I wonder anyway whether ...
> 
>> @@ -94,6 +95,9 @@ struct arch_domain {
>>       struct p2m_domain p2m;
>>   
>>       struct paging_domain paging;
>> +
>> +    DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);
>> +    char guest_isa_str[RISCV_GUEST_ISA_STR_MAX];
> 
> ... a compile-time sized buffer is suitable here. Can't you allocate a buffer
> just large enough to hold the string?

It could be allocated dynamically.

Does it make sense to evaluate in run-time what should be a buffer size? 
For this case I can't find analogue of realloc() in Xen. Or it would be 
fine just to take something bigger as a const (lets say 2048) and use it 
for dynamic allocation?

Thanks.

~ Oleksii

