Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNPfMDLwy2m5MgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 18:02:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A7336C4CD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 18:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269172.1558286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bY5-0003ft-4m; Tue, 31 Mar 2026 16:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269172.1558286; Tue, 31 Mar 2026 16:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bY5-0003dY-1x; Tue, 31 Mar 2026 16:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1269172;
 Tue, 31 Mar 2026 16:02:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7bY3-0003dS-QV
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 16:02:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7bY1-00FzNB-Dg
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 18:02:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cbf019-5cb7-0a2a0a5109dd-0a2a4502b806-2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 18:02:34 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cbf01a-63bb-0a2a45020019-d155dd2de858-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 18:02:34 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so1624051f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:02:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf245e4b9sm25824049f8f.20.2026.03.31.09.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 09:02:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774972954; x=1775577754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L12RIOKI8R/ThdZxIl5YMFmzWEDMenCoifj+Nuz7cjY=;
        b=F1A+usEHG3DEb4voulIxzsNjXdassTqQoWn5Ye9om22gzRkNZ+OPHEE2auj+rF+GVH
         M21dwbEg5CRfSjPJjp+rUOmnzUpe5bkwnVhDXcoi0RVxMuVEWFB1ShjelDU3q68XUVWN
         eDGbKqjnOx+4VFLxb1BEWTFoOx5zmh3C3lI5L7qdD0e0Iz3o3ivwtZmsZ01Dy3vhkz4F
         bxRsLQsZkzEMBYLmb+7s0GHFv16ShYQdfmC/HpwZX7X+uV4cjhejPe3Mi8+B39YZ8lmY
         iEWH40q4FYCmru+GX+GcC2HfXi872ExKR8r0foXcUPNi0WU8e49iaU8f3ZI1fc1UtIiV
         ZMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972954; x=1775577754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L12RIOKI8R/ThdZxIl5YMFmzWEDMenCoifj+Nuz7cjY=;
        b=AUWqX/FjFiKGg69amSNQcmsOLy+QdC6EwdRrdxXqLnOduhArh8fwZTCkTIGJwV3Hau
         0A33NzwQ9fE5J21cLUwK8wa/tfN094tTd+/PiDg1IGGFAgYKdoGK6QYU+eWQcLo2u/1l
         5QIs7mEvJGwZ9vtkw1r+lyJU6MxKiyBdFK9macUaV6Dk5W00dT4/h64d+Ojho6MO5697
         f5i+RHaOhLfbcrX237Y49XOc9qD+RofP0oXcDKG6gdCSBwx0JX8dnwDQFpVRne82/oSk
         OupsWjUxEBBCPeNPW/m42hd5lqUjbl120wkgIL5G+VOJmAe1yxverOd6+ZZ1LPqSThhX
         JYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBiu5RkNaCSACaMip3smNo/oHU78faYjvtUorXIsNqT86ecQWC/VtrBwWXLPFMvZDeCG9ohwCEcSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg4w5mOKaC0UjXxVL9EFb73VBLFs7gz2zuW2RW43m9eghZFHqY
	NiEEulT7r1JGEtgJI+lWUKOydfEnHODETX/gGCNtEjaXQTG8EAtviTOG
X-Gm-Gg: ATEYQzy410Ie91nMBMWSjY5gHdYYysOy+ElwEFoW8nYy49oIkhEfXJZ+NbH6D/fT7So
	QItz72Ara5xsEeHiOeCeiFN5zrw64q1Z6aNg8po7EdrCIU9P5HrTdBNk2eqNUshSlr8Sn/LR8kH
	qyrVVbSMTd9GBNFOI4R9q+BLflep2wdIHBfrb0Lw96qAn+GCtzN9ejnWZZ99eZcnAPKzkHyb62D
	Iqc3gMXsw1YyADf9YFMedOouGaZYa684j7OqSsAiLBVdHuKhehnaOIRTDkPWS1CJ1oKdskhO2xS
	I61WxfV/dI51ssRAm/TgL/q4x2sPYKPcOuhjR+nShL++eY2rcdPuziD7+MFOdXbrKFDB7UWnb+y
	c9fh0shXDfxnpcWWLaiEHl/5HayQdyTknzqo+LfQuaogx/L6U9BMwSm5l2OnPlS6+AO1AQKAIu1
	9d2KtDZy5wwHLUj/k8KcyHxoKAQRGFY12mBaGsG+fjg4nvpXYPHVobC12tczuuoyVODsjoSTEoF
	VI=
X-Received: by 2002:a05:6000:40dd:b0:43c:fd92:f432 with SMTP id ffacd0b85a97d-43d1504cef0mr418510f8f.2.1774972953612;
        Tue, 31 Mar 2026 09:02:33 -0700 (PDT)
Message-ID: <c87ef4d3-abad-4e46-ae86-f078eb4a5f0e@gmail.com>
Date: Tue, 31 Mar 2026 18:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] xen/riscv: introduce p2m_gpa_bits
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <775374eab7b9868b7cabe6c76fa1b7ac2f8466d8.1774281309.git.oleksii.kurochko@gmail.com>
 <4a0f4313-2694-4986-810c-0f4eac191cef@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4a0f4313-2694-4986-810c-0f4eac191cef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1774972954-42298DB8-2D82D557/10/73395122804
X-purgate-type: spam
X-purgate-size: 3420
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
X-Rspamd-Queue-Id: 37A7336C4CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/26 5:34 PM, Jan Beulich wrote:
> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>> p2m_gpa_bits is used by common/device-tree/domain-build.c thereby when
>> CONFIG_DOMAIN_BUILD_HELPERS=y it is necessary to have p2m_gpa_bits properly
>> defined as it is going to be used to find unused regions.
>>
>> Introduce default_gstage_mode to have ability to limit p2m_gpa_bits before
>> p2m_init() is being called as it will be too late.
> 
> This is a somewhat strange way of describing things. Of course you want to
> establish globals before doing any per-domain setup.

Then I will drop that sentence now and avoid similar in the future.

> 
>> Limit p2m_gpa_bits in guest_mm_init() as it could be that default G-stage
>> MMU mode uses less VA wide bits than IOMMU,
> 
> How does a VA come into play here?

It is what spec uses, for example:
  Figure 108. Sv39x4 virtual address (guest physical address).

I can just use GPA.

> And what is "less VA wide bits"?

They could be configured to different modes: IOMMU lets say Sv39 and MMU 
- Sv48, so IOMMU could work with 39-bit GPA, but MMU - with 48-bit GPAs.


> 
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -51,6 +51,24 @@ static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
>>       .name = "Bare",
>>   };
>>   
>> +static struct gstage_mode_desc __ro_after_init default_gstage_mode = {
>> +    .mode = HGATP_MODE_SV39X4,
>> +    .paging_levels = 2,
>> +    .name = "Sv39x4",
>> +};
>> +
>> +/*
>> + * Set to the maximum configured support for GPA bits, so the number of GPA
>> + * bits can be restricted by an external entity (e.g. IOMMU) and the
>> + * restriction must happen before the call of guest_mm_init().
> 
> DYM before p2m_init()? Because you do the calculation in the named
> function.

Yes, before p2m_init(). Probably, as you made a note in the commit 
message, this part could be dropped too.

> 
>> + * The widest G-stage mode defined by the RISC-V specification is Sv57x4,
>> + * which yields 59-bit GPAs: Sv57 maps 57-bit VAs onto 56-bit PAs (PADDR_BITS),
>> + * and the G-stage "x4" extension widens the address space by a further 2 bits,
>> + * hence PADDR_BITS + 1 + P2M_ROOT_EXTRA_BITS.
>> + */
> 
> I fear I don't follow. I can't explain the +1 at all.

Agree, +1 should be dropped. I think I mistakenly interpret PADDR_BITS 
as highest possible bit set, so 55 intead of 56.

  And adding in
> P2M_ROOT_EXTRA_BITS seems wrong too: Whatever the width of output of
> guest paging _is_ the width of input to stage-2 paging. There's no way
> for a guest to encode 2 extra bits.

Agree, PADDR_BITS should be enough here to be used as initializer.


> 
>> @@ -191,8 +209,13 @@ static void __init gstage_mode_detect(void)
>>   
>>   void __init guest_mm_init(void)
>>   {
>> +    unsigned int gpa_bits;
>> +    unsigned int paging_levels = default_gstage_mode.paging_levels;
> 
> Deriving a global from a default, when ...
> 
>>       gstage_mode_detect();
>>   
>> +    ASSERT(default_gstage_mode.paging_levels <= max_gstage_mode.paging_levels);
> 
> ... the default isn't the maximum possible, isn't going to fly.

I didn't get you here.

If we want Xen uses Sv39 for G-stage, we want to limit guest's 56-bit 
GPA to 39-bit GPA, but not the maximum supported by h/w mode for G-stage 
mode.

~ Oleksii




