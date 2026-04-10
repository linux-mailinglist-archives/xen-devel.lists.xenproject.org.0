Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIQOIy7Q2GngiQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:25:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D03D5A52
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278684.1563456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB92p-0002n2-VO; Fri, 10 Apr 2026 10:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278684.1563456; Fri, 10 Apr 2026 10:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB92p-0002kg-Sj; Fri, 10 Apr 2026 10:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1278684;
 Fri, 10 Apr 2026 10:24:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wB92o-0002kV-3H
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:24:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB92l-00C3lZ-9e
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:24:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8cff8-2eae-0a2a0a5409dd-0a2a4507bc3a-2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:24:56 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8cff8-ba2d-0a2a45070019-d155d02ab92e-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:24:56 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-66bb7e098b1so1955185a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 03:24:56 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-670703f5b31sm467810a12.11.2026.04.10.03.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 03:24:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775816696; x=1776421496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWuwwGgF+Mk5wStqMS+vVyWcPiF3DIKXvNy746Pcy2Y=;
        b=mIZcXG4TpFeHh4p7muHbP7eUugzqKNgheDDa76C86vO1M7IRPmkE8q9UYd/MeWFz6W
         egE/xqTFhBRBQ49gO3gD9AMSLDXxE8SzOPqOCBprSWAKsjTkYryp1LuGA8dnHnGWCmBd
         IOgYTqNYNJ4vUiVDAXkxE8liM75V7qkzHrDNknBl4pZ6IRkI5gZdZYBWpVg0l1SZ8b5s
         PAy4IyTdE7JoqedTuO5IErz9QRjoSC9u8GL0Dcp7orGwuwUXKaDq+bA3qBER9NxGZLST
         0jVd9ghHG9MHfIAajetuyxFkKN6rp+S/Rxd9MrNo0rHKKZ52axBeEcbLkNIKrxP1AUe2
         PArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816696; x=1776421496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWuwwGgF+Mk5wStqMS+vVyWcPiF3DIKXvNy746Pcy2Y=;
        b=X/dsIF90E3YzrZpz6mIas+FgKEUKdxIRKLgCy7DYkM4ZkLcNBd9EfY0vfzBe2XNbJh
         MAPx3esfyf1KM9Q1ZTEbKAh89l+8VZ95/FRSWHodXShGlpfziU+LBu///RVFzj8mI/g2
         dvNIAWezE48tAoLOxAYbz8NT3vLmjLdgIEhc+199ZyJd3NbPaV1A9IY7vnaL3cgUZsC/
         S1BZCkdOfDWfetLrbEijGZe9kU5YTehTu1Z+2tgTUjodq4v1a6ekM3puJt0iqY19c+SV
         bkF/ad1pFwly7SDZsqs30bszDaa4VrTj6FoXktfeDkf2kThM+E6tWa/nQZwf1mbT2+ML
         xbyA==
X-Forwarded-Encrypted: i=1; AJvYcCWK2Hq31IvZKHmZZhbeolPRafawYdQJGTbdjo0XYE+iNe/H0hVLDfzPTeQuXudgE63M8tB4TFTdqng=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3Wt2/pwZfK5fnrWp2S0evrjX2VzO2IcNKEUc8DRsQw9DNtgnr
	8ezp6GHkR5maH6veRfhgaYCf41E4CIW7et1ehtk105bjaXIv1RfhBE5o
X-Gm-Gg: AeBDievr0Hoe+7YDsKgiBA0Dp5qnxVZUy3PEAiAEH/LyEPAuKsWF7se1JEtZd0i8uSM
	GMgtNmI4z3rTzhAzT91U4r2T2yjJ8tm3kKOIZmXi+js+LBN2EfoK//xpHTSvqjNuzE/zp8qxlV8
	5iJ/Pk5KSDInKo8NwPCs5ABwaFitF7gx8sUOMytlIXaHYB/Rw5++fH+GZO19SiZs/mTJsHKqV52
	XRKu+3NdFx5evAw7AbLYg0ftXMvSJjEuLs+4fvzwKbhnnylARz/BCGrPz9IpVIz2WPDlHruwYIt
	EA94dc8Ui98uli5XiGZiir/zx24USC7oESUoPttbmoou7IrojX7RctD+3nA6ulFpMNhcWO8riEv
	iTbWF9h6524t6SAYJqE7V8YSff9zEUd8pcF3g1qX7ZHXSBoRRFxF3kk1rGOoArJklZLKQzSt+2r
	OgNpER4zlXpAgfoKcWzjVt0urz/m/o2rBWIAVj6dcb32bTq2ZFcEiE8CxFl7f2EMZ/xa+29h4JE
	Nc=
X-Received: by 2002:a05:6402:505c:b0:66b:b6e2:66e1 with SMTP id 4fb4d7f45d1cf-6707a47e6a3mr895460a12.18.1775816695928;
        Fri, 10 Apr 2026 03:24:55 -0700 (PDT)
Message-ID: <d66424c9-f156-4bd8-9547-46d181aa95f3@gmail.com>
Date: Fri, 10 Apr 2026 12:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/27] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <007c0a0243ac7ff1d1ab3faa4ebcdd6fcd14e485.1773157782.git.oleksii.kurochko@gmail.com>
 <efe5b1f5-29a0-43a8-92f8-cc20bd922e62@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <efe5b1f5-29a0-43a8-92f8-cc20bd922e62@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1775816696-8B14D41E-6D76B9D9/10/73395122804
X-purgate-type: spam
X-purgate-size: 6460
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF2D03D5A52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 3:49 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> Introduce generation of the riscv,isa string passed to the guest via the
>> Device Tree riscv,isa property.
> 
> Title as well as this suggest this is all about guest properties. Then ...
> 
>> The following changes are introduced:
>>
>> - According to the RISC-V privileged specification, M-mode software controls
>>    the XLEN value used by S-mode and U-mode. For RV64 harts, the SXL and UXL
>>    fields of the mstatus register are WARL fields that define the XLEN for
>>    S-mode and U-mode.
>>
>>    The XLEN value is provided by M-mode software (OpenSBI in the case of Xen)
>>    via the riscv,isa DT property. Introduce and initialize an xlen variable
>>    when parsing the host riscv,isa string in riscv_isa_parse_string().
> 
> ... suddenly talk is of host aspects? (See below as to what "xlen" really
> is meant to hold.)

I just used it to show that xlen could be different and based on what 
prev. mode put into one of it register to encode xlen. And the same is 
applied for guest domains. I will rephrase it in more proper way.

> 
>> --- a/xen/arch/riscv/cpufeature.c
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -38,6 +38,8 @@ struct riscv_isa_ext_data {
>>   /* Host ISA bitmap */
>>   static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
>>   
>> +static __ro_after_init unsigned int xlen;
> 
> Nit: Attribute between type and identifier please, whenever possible (it
> isn't neatly possible in riscv_isa above, due to DECLARE_BITMAP()).
> 
>> @@ -160,6 +162,19 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>>       RISCV_ISA_EXT_DATA(svpbmt),
>>   };
>>   
>> +static const unsigned int __initconst guest_unsupp_exts[] = {
>> +    RISCV_ISA_EXT_f,
>> +    RISCV_ISA_EXT_d,
>> +    RISCV_ISA_EXT_h,
>> +    RISCV_ISA_EXT_q,
>> +    RISCV_ISA_EXT_v,
>> +};
> 
> This could do with a comment clarifying what needs (and what doesn't need)
> putting here. My expectation would have been that everything in
> riscv_isa_ext[] which shouldn't be exposed to guests should appear here.
> Yet then there is V (which riscv_isa_ext[] doesn't have), while e.g. Svade
> and Svpbmt (which iirc won't be available to guests right away) aren't
> there.
> 
>> +static __ro_after_init DECLARE_BITMAP(guest_unsupp_bmp, RISCV_ISA_EXT_MAX);
> 
> Is the _bmp suffix really needed? riscv_isa, for example, doesn't have it.

It makes sense to drop.

> 
>> +#define MAX_GUEST_ISA_STR_LEN 256
>> +char guest_isa_str[MAX_GUEST_ISA_STR_LEN];
> 
> __ro_after_init?
> 
> Yet then - can this really be a global? Isn't the set of extensions
> available to a guest a per-guest property, i.e. a global could at best
> represent an upper bound on features?

At least, for now I think it is okay just to use global guest riscv,isa 
for all the domains. From my point of view if Xen doesn't support some 
extension to be used by guest so then should be responsible to generate 
proper riscv,isa.

It probably make sense to have riscv,isa per guest but then we still 
will want to parse this passed riscv,isa and check what Xen supports and 
what not, what looks like a double work a little bit. Probably it is the 
best one option and if riscv,isa isn't provided then just use that one 
generated by Xen.

> 
>> @@ -193,6 +208,15 @@ static void __init match_isa_ext(const char *name, const char *name_end,
>>                !memcmp(name, ext->name, name_end - name) )
>>           {
>>               __set_bit(ext->id, bitmap);
>> +
>> +            if ( riscv_isa_extension_available(guest_unsupp_bmp, ext->id) )
>> +                break;
>> +
>> +            if ( ext->id >= RISCV_ISA_EXT_BASE )
>> +                safe_strcat(guest_isa_str, "_");
>> +
>> +            safe_strcat(guest_isa_str, ext->name);
> 
> Shouldn't you check the (kind-of-)return value? (Yet better would be a build-
> time check, but I can't think of a way to achieve that.)

Yes, it would be nice. But it doesn't clear what should be reaction - 
just panic() with the message that we don't have enough space to cover 
all extenstion in riscv,isa or just continue with what was put to 
guest_isa_str. I think the second option could be fine.


> 
>> @@ -207,13 +231,17 @@ static int __init riscv_isa_parse_string(const char *isa,
>>   #if defined(CONFIG_RISCV_32)
>>       if ( isa[2] != '3' && isa[3] != '2' )
>>           return -EINVAL;
>> +    xlen = 32;
>>   #elif defined(CONFIG_RISCV_64)
>>       if ( isa[2] != '6' && isa[3] != '4' )
>>           return -EINVAL;
>> +    xlen = 64;
>>   #else
>>   # error "unsupported RISC-V bitness"
>>   #endif
> 
> This can be had with an initializer of "xlen". Then the (kind-of-)variable
> could be const unsigned int. Seeing the use below, is the variable
> correctly named, though? I.e. shouldn't it be guest_xlen or some such?

guest_xlen would be better.

> 
> Independently I expect you will want to support 32-bit guests on 64-bit Xen
> at some point, in which case encoding this value into a global string won't
> work very well.

Yes, then it will be needed to move it to domain-specific structure.
I don't know if it makes sense to do now. (depends on what we will 
decide to do with per-domain riscv,isa or it is fine to go with global one)

Btw, it isn't always be possible to have 32-bit guest on 64-bit Xen as 
when HSXLEN=64, VSXL is a WARL field that is encoded the same as the MXL 
field of misa. In particular, an implementation may make VSXL be a 
read-only field whose value always ensures that VSXLEN=HSXLEN.

> 
>> +    snprintf(guest_isa_str, sizeof(guest_isa_str), "rv%d", xlen);
> 
> %u please with unsigned int.
> 
> This being the only use of the variable (afaics), why is it not function-
> scope?

With the current implmentation, yes, it should be in function-scope.

> 
>> @@ -487,6 +515,11 @@ void __init riscv_fill_hwcap(void)
>>       bool all_extns_available = true;
>>       struct trap_info trap;
>>   
>> +    for ( i = 0; i < ARRAY_SIZE(guest_unsupp_exts); i++ )
>> +    {
>> +        __set_bit(guest_unsupp_exts[i], guest_unsupp_bmp);
>> +    }
> 
> Nit: No need for braces here. And anyway - can't this be had with an
> initializer for guest_unsupp_bmp?

It could be. I will use an initializer.

~ Oleksii

