Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL46KsdkDGpXggUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:25:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82457F944
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313003.1583153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKRA-0004mf-4J; Tue, 19 May 2026 13:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313003.1583153; Tue, 19 May 2026 13:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKRA-0004kp-1W; Tue, 19 May 2026 13:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1313003;
 Tue, 19 May 2026 13:24:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPKR8-0004kj-Jt
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:24:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKR7-00CAlK-Hm
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:24:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c6498-2eae-0a2a0a5409dd-0a2a4505abb8-2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:24:41 +0200
Received: from [209.85.208.181] (helo=mail-lj1-f181.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c6499-aaa8-0a2a45050019-d155d0b5b54e-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:24:41 +0200
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-393da8f389bso35100251fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 06:24:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-395882d28f4sm20195451fa.17.2026.05.19.06.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 06:24:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779197080; x=1779801880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Puyl1fu8qBuC/HyQpOHS6LGvvV3IplxhRqkYs2KFTQk=;
        b=TtgpPlN72adVYHNonNg7kaq6aIS7NDWlYeSLCJkuhHPfiJ633r+l30sdnr/DHU8S04
         L3BgCDiCRp4mA8rxMqGU3VzmwgiMSDpUzIiJGCD+gC8lhKBeJ5qqI1+F0/YrNZbpK/pA
         FVaVpYQL8uAMt3Cna53lAc4Y13H3mauxQVm85BqzPC3eoy8p+Eo5mICrHJM+vNjWYmlV
         gux4WAwRolz+i5M1xA99gKSzSjqZlatJDOKgqhY9FaXitOxyyOS/tAsaVNysCAIW6GLB
         CizoWqVnjC4w7JdvSZ2OSOQAh+DFn+wfFMzrgpaGqyq386ePbbDxIaUAu0EAgiXoq+oa
         cvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197080; x=1779801880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Puyl1fu8qBuC/HyQpOHS6LGvvV3IplxhRqkYs2KFTQk=;
        b=XfbLoJkyX5iMt9UfgcmMx0G6BaRoCSjCeJvFmtluG+jbjr49x87yxBxZyOEVOMOcOs
         ntVfmiNTUYO9kJf9GbgHotGl0XY7IZnSNbJR/WuxXNnyYCoPpv81wA8b/jhVU0oO7H45
         4gMnOyDjxvZPLIGHEm/e4S9UqfKca0cvnnMkVK/CoY4Se6m5vf/Cxa6BgiUVRl364wkE
         i6wThUouCx4iANpRmcdNXteaS6qtoXXyH08UbSFKa7pfpRhFFh1XywaNtlpbJcsAtyZ5
         jptuMFnfxzJhbwCtnOO5roQqjDDEn2IWC7wEXsoz76Sl+4QgKG+bgvXvDfgUMQg1b3kk
         fcTw==
X-Forwarded-Encrypted: i=1; AFNElJ9lCpmRdLOcylwRRSXGUHSc/8Igt3nXwZfbKpzSJtByDhk6PYkwcepNszTIteFmSuIXayRWVhbUD2o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRnljAk7l6zZQf6Rak5G0wyG3wcw9L/i9ZlmzK6HZQjpKeKsiu
	GE+XhARjEHjf32Ng0INLWBxrK81mxJeKj8woe6z0bA2jWtmoD5a/xc+y
X-Gm-Gg: Acq92OGZ9euLupr918Ha5A3C+kmip94dgrvSdmeAVW9ORRSM9IjmtEMNCfJazn2r58n
	TMm3XBkH3ZMXUB9uKOukDovwkEEkQoCMPTHVLdGdrAC4jWCXvaMGFonoCiXshu8aV8ntWuSeXgr
	ACLMnLZ2aRSrJ44JWHRgaTiVDIKacOKUVG5sBeCbo/zvPu99wWTvmpk3o9Fe+Rym6zXDxMFapHX
	oo4zk3NDk8+PgvH/R7Rv8YXz3XETkp00ABngi5BSrCE142KaDkR953Plo2Ovqz13XM2WZGyum7L
	6wCZYbdra3/V/4tsQVZ9e5Tu2tBipJbAM7TAuNQBivLsW45gKsG+YuN7+C79Lu2nQAUcSO3OH5/
	ZGe58bRr6Yxzyb7NPTAkWiJSDIcX9MIe3s82Frb7fm6DXzmBtQAovaXkc50g7SDQrOniB1NKFj+
	/ppzBnzaray94f1W9UdzIb8hDWLHWtuQEhFTfJS2rq/V/R6/zHcGIKodUJxBs/quoSHglVkYqSN
	Vs=
X-Received: by 2002:a05:651c:515:b0:393:975b:5634 with SMTP id 38308e7fff4ca-39561c8b784mr58984671fa.11.1779197080367;
        Tue, 19 May 2026 06:24:40 -0700 (PDT)
Message-ID: <fbd8b102-d495-4678-8226-a199554e266d@gmail.com>
Date: Tue, 19 May 2026 15:24:38 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <23e8de1e-b792-4863-bd99-f529642fb963@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1779197081-D9F76443-7A740563/10/73395122804
X-purgate-type: spam
X-purgate-size: 2964
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
X-Rspamd-Queue-Id: 0D82457F944
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 2:12 PM, Jan Beulich wrote:
> On 19.05.2026 13:59, Oleksii Kurochko wrote:
>> On 5/18/26 5:51 PM, Jan Beulich wrote:
>>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/cpufeature.h
>>>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>>>> @@ -17,6 +17,8 @@
>>>>     */
>>>>    #define RISCV_ISA_EXT_BASE  26
>>>>    
>>>> +#define RISCV_GUEST_ISA_STR_MAX 256
>>>
>>> This looks like it won't be good for very long, seeing how long ISA strings can
>>> get. I wonder anyway whether ...
>>>
>>>> @@ -94,6 +95,9 @@ struct arch_domain {
>>>>        struct p2m_domain p2m;
>>>>    
>>>>        struct paging_domain paging;
>>>> +
>>>> +    DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);
>>>> +    char guest_isa_str[RISCV_GUEST_ISA_STR_MAX];
>>>
>>> ... a compile-time sized buffer is suitable here. Can't you allocate a buffer
>>> just large enough to hold the string?
>>
>> It could be allocated dynamically.
>>
>> Does it make sense to evaluate in run-time what should be a buffer size?
>> For this case I can't find analogue of realloc() in Xen.
> 
> Hmm, I see xrealloc_array(), and surely we could gain xvrealloc_array()
> which we'll need anyway once xrealloc_array() uses get converted. (I also
> see x{,v}realloc_flex_struct(), but that's of no use here as it looks.)

Oh, I missed to turned off "full match" during search...

> 
>> Or it would be
>> fine just to take something bigger as a const (lets say 2048) and use it
>> for dynamic allocation?
> 
> I'd rather not. Can't you determine how much space the string is going to
> occupy?

I thought about two options as alternatives:

1. Take as a length host RISC-V ISA string but theoretically we can 
emulate some extensions which aren't mentioned in host RISC-V ISA string 
so it could be longer. So not a good option.

2. Having two walks in init_guest_isa():
    Introduce the following function:
static size_t guest_isa_str_len(const unsigned long *isa_bitmap)
{
     size_t len = 4; /* rvX prefix */

     for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
     {
         const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];

         if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
             continue;

         if ( ext->id >= RISCV_ISA_EXT_BASE )
             len++; /* '_' separator */

         len += strlen(ext->name);
     }

     return len + 1; /* NUL terminator */
}

   and then:

int init_guest_isa(struct domain *d)
{
     bitmap_andnot(d->arch.guest_isa, riscv_isa, guest_unsupp,
                   RISCV_ISA_EXT_MAX);

     size_t len = guest_isa_str_len(d->arch.guest_isa);
     d->arch.guest_isa_str = xzalloc_array(char, len);
     if ( !d->arch.guest_isa_str )
         return -ENOMEM;

     /* ... existing snprintf + strlcat loop unchanged ... */
}

If approach 2 is a good one I can follow it.

~ Oleksii


