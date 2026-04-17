Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCgJMqo+4mmB3wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:07:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EE941BDE7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284419.1566214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjqn-0005QC-3b; Fri, 17 Apr 2026 14:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284419.1566214; Fri, 17 Apr 2026 14:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjqn-0005OO-0t; Fri, 17 Apr 2026 14:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1284419;
 Fri, 17 Apr 2026 14:07:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDjql-0005NW-Nx
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 14:07:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjql-00DUuq-07
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 16:07:15 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e23e8f-bab6-0a2a0a5309dd-0a2a4503da90-30
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:07:14 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e23e92-672d-0a2a45030019-d155dd2db8a2-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:07:14 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43d76dd4ee8so636988f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 07:07:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a7b4sm4684437f8f.22.2026.04.17.07.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 07:07:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1776434834; x=1777039634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o62sIjnurrZPZ1zQSnb1b5ri/ZMZKs88sNx5pHNIScQ=;
        b=gaEjTFGk4WeNVeZchaSMuL8yzABkBYamssptTLSKHAlQIAfRS/YF9uzlqhqsm84+rj
         wpJ3Nfba75MSjt7bmKlhQ8mtVZ7OKhTCmNKcfIgbPOE70zbse+M1SecOJYvfqQ2rkRoK
         4fMNUiuVdpCDhxyeKBIddYExd5gbX+KHAzw5zVK7GFSy4AnHI7UhvfJ/rKA2IjtTOVHP
         6xxBQBBzfhLkcY+JvLoLpbNFAMy7+krBl3rlpT7AwYf/aEYFAHLB/4Dli7frgjm4Emu4
         u9B3mzNfTsheIdwDYh5/yl5n2xI7kVHPz4Xko3EPtqcBTFrTv2aFnCVPRs/nOjNaJoqH
         339Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434834; x=1777039634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o62sIjnurrZPZ1zQSnb1b5ri/ZMZKs88sNx5pHNIScQ=;
        b=mlU1QIXkQ99x/myuxUgbTpFIgJof17/zgPTaUeGcxQOvxNxhw7q29TdNHveZ+ovaC4
         Nhimr+sTXSFvUofU5wOgx4Fjs2Bu2fiiYerGIeDygMb38eL82D1dv/gjLPh3F3d84FtI
         KHFZ3RqZ0KFWRUaZERkhq+SlLBVPwqlV+szTNrp6oWiN7GbUrMO9W1uL/dVxBgfeZID3
         SK4EaPwo45ItDtz9UQem9WRXnpPYLaXf5TfF0wAxSFXVyEQkXCxgA9bWu/TI4WGePHaD
         xKWtPkOLN2emuPVdr4GeDBqDWoFXRkEVcEYGrE7auganL+ucS0f/5AD9W720veL3EkPS
         ZITA==
X-Forwarded-Encrypted: i=1; AFNElJ+0oQx/amTr6o2zV85/pFrDoLM8DS1q8GVnx4C2bNbfYj6FOYl/NqIQSQZ+dT2/Hwbo8zUFuabHEDQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwB2akb5+DtngQsvLid6qHfpHWlTSMA0o48b6ZcEQZvQY50gGAV
	wSosyczMxzEI0yxznhDxBuUVxwsyv7dA8WviIqMT5UIuW20BWNwoIQn+phqt1Fqtpw==
X-Gm-Gg: AeBDies2NtH10ceqiscJjSgdKZVU8D/t2Z9O3QWaNYS2pXZhL0RmjTs3r9i6GT+8hl0
	b8gyi6pGeu33GxrEgaTIsp/MB/3j3RwaAZzPVM4Fq7AqOE72SHxfmNHckRpDc8nHtbs0n9suPyL
	faETacub35CV5Vhr9pxeEC59dOYuQEUkt7BFwg+ss/cYZ0M/7reii6y7yTPVGFaMKZb2pEHG9x+
	aOonynKWskDqTGKtyM7yDHQW1dNfiUNvqsht1Caiypa1JMsZfN+2gU68nmQb9R/uFhBL4OC5ygo
	EFoD3x9mhrFrodNHm+FNMuqMEmvyaUInWovlirSjfPQ7QUA6VIppJY55OIxbjk4KAVhcFl8se0z
	/rgeIk/fzfdo/3FkbvDiC5fLDI3MhtgzwLdzroTGoOsrdkv7oRk0HAFcHLio3QJ/NrR0QrfwSwW
	gKe0Vu8idpxgnI0CK8Bjaptkz1NN1pX+BejEZft4gDH2750pBbTnNoEW1PgLBUG3+orbBOcM74T
	btvv82eGIdknGyfYscNmzAWFA==
X-Received: by 2002:a05:6000:2508:b0:43d:7e6f:3816 with SMTP id ffacd0b85a97d-43fe3e14ecbmr4536636f8f.40.1776434834081;
        Fri, 17 Apr 2026 07:07:14 -0700 (PDT)
Message-ID: <718fe598-884c-4723-938f-7f783445771f@suse.com>
Date: Fri, 17 Apr 2026 16:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/27] xen/riscv: add basic VGEIN management for AIA
 guests
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
 <f358325514c91c540e0edf992ca51414a1964fe0.1773157782.git.oleksii.kurochko@gmail.com>
 <09fed304-685c-46a9-9159-72baa1721224@suse.com>
 <4b977410-8d24-41c3-9c83-7d95637ddea3@gmail.com>
 <314c064b-88eb-497a-9022-2013125d63a9@suse.com>
 <a0fe3904-7fb9-474c-9a97-6aca2c2dc50b@gmail.com>
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
In-Reply-To: <a0fe3904-7fb9-474c-9a97-6aca2c2dc50b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776434834-2BF6A938-EBD60914/0/0
X-purgate-type: clean
X-purgate-size: 4282
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 53EE941BDE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17.04.2026 13:34, Oleksii Kurochko wrote:
> On 4/16/26 2:21 PM, Jan Beulich wrote:
>> On 13.04.2026 16:42, Oleksii Kurochko wrote:
>>> On 4/2/26 12:03 PM, Jan Beulich wrote:
>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>> @@ -14,12 +27,109 @@ bool aia_available(void)
>>>>>        return is_aia_available;
>>>>>    }
>>>>>    
>>>>> +int __init vgein_init(unsigned int cpu)
>>>>
>>>> If this needs invoking once per CPU being brought up, it can't be __init.
>>>
>>> Yes, it is going to be called inside the secondary CPU bring-up function.
>>>
>>> __init sections are removed much later, after all CPUs are brought up,
>>> so it looks like that at the moment when secondary CPUs are being
>>> brought up, __init still exists and can be called.
>>
>> No. And I said so before. See XEN_SYSCTL_cpu_hotplug (and ignore it having
>> "hotplug" in the name, but merely consider that you can take CPUs offline
>> at runtime, and later bring them online again).
> 
> Thanks, now it makes sense to drop __init.
> 
>>>> Also - static?
>>>
>>> It isn't static because it will be called inside the secondary CPU
>>> bring-up function.
>>
>> As it doesn't need calling from the outside for the boot CPU, it's not
>> obvious why it would need calling from the outside for secondary ones.
> 
> I think I am confused here by what do you mean by "calling from the 
> outside".

As in "from another translation unit".

> It should be called during boot or secondary CPU initialization (if AIA 
> is used), right?
> Then considering that VGEIN-related stuff is connected to AIA then 
> vgein_init() is expected to live in aia.c and considering that it wants 
> to be called by secondary CPU boot code it can't be static.

Putting my question differently: Why is there a difference here between
boot CPU and secondary CPUs. My (general) expectation would be that either
the function wants calling from outside of aia.c in all cases, or it could
be static (now and later).

>>>>> +{
>>>>> +    struct vgein_bmp *vgein = &per_cpu(vgein_bmp, cpu);
>>>>> +
>>>>> +    csr_write(CSR_HGEIE, -1UL);
>>>>> +    vgein->geilen = flsl(csr_read(CSR_HGEIE));
>>>>> +    csr_write(CSR_HGEIE, 0);
>>>>> +    if ( vgein->geilen )
>>>>> +        vgein->geilen--;
>>>>
>>>> I don't understand this. The "len" in "geilen" stands for "length", I suppose,
>>>> i.e. the number of bits. Hmm, the spec itself is inconsistent: "The number of
>>>> bits implemented in hgeip and hgeie for guest external interrupts is UNSPECIFIED
>>>> and may be zero. This number is known as GEILEN." This may or may not include
>>>> bit 0 (which is implemented, but r/o zero). Then saying "Hence, if GEILEN is
>>>> nonzero, bits GEILEN:1 shall be writable in ..." suggests 0 isn't included, but
>>>> that's not unambiguous.
>>>
>>> But they explicitly wrote that: The least-significant bits are
>>> implemented first, apart from bit 0. So bit 0 is explicitly excluded.
>>
>> Fine, but not including it in anything named *LEN feels - as said - ambiguous.
> 
> Agree, it is. I just tried to follow the spec naming here. But I am okay 
> to rename it to max_gein, for example.

Perhaps better stick to spec naming, but consider adding a clarifying comment.

>>>>> +    /*
>>>>> +     * All vCPU guest interrupt files are used and we don't support a case
>>>>> +     * when number of vCPU on 1 pCPU is bigger then geilen.
>>>>> +     */
>>>>
>>>> This wants checking in vgein_init() then. CPUs (beyond the boot one)
>>>> violating this should not be brought online.
>>>
>>> It'll be nice. But we can't know how many vCPUs will be ran on pCPU when
>>> vgein_init() is executed.
>>
>> I don't understand: How does it matter how many vCPU-s will exist later on
>> (and will run wherever)?
> 
> IIUC, you want to check what is mentioned in the comment in vcpu_init(). 
> The comment says that it is checking that number of vCPU on one pCPU 
> isn't bigger then geilen. To check that we have to know an amount of 
> vCPU potentially will be ran on pCPU.

Well, not quite. I don't understand at all why the number of vCPU-s in
a system would be limited by any pCPU property. I don't think we have
any such constraint on x86, for example.

Jan

