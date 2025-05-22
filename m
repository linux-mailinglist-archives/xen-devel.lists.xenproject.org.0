Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7625AC0529
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992974.1376434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzwB-0001TS-5J; Thu, 22 May 2025 07:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992974.1376434; Thu, 22 May 2025 07:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzwB-0001QM-1S; Thu, 22 May 2025 07:01:55 +0000
Received: by outflank-mailman (input) for mailman id 992974;
 Thu, 22 May 2025 07:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHzw9-0001QG-VL
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:01:53 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3d36789-36da-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 09:01:53 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad5394be625so436954466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:01:52 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4466e2sm1041436666b.93.2025.05.22.00.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:01:52 -0700 (PDT)
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
X-Inumbo-ID: a3d36789-36da-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747897312; x=1748502112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ZnCMNOK19g2beZgIpWstHoa0tVgsbyzm96lOgGrbXI=;
        b=FG6z1BJcvhmblUKq8Q7J/y40/yE2DFl6anp6qnkitloEAK63NwRVq6aylpUeUGLgTM
         g2J9QhyiKZ8dvcxHgfcz9ZTCfBhhVZgGkZw5wuPGRzDdNVNdAYSzc4ICeL2fPfY4xqoZ
         kwwTab/mZGp6Q953234RKDKrFiUxBNMt+YHU1YE/hgSyxmEzf3S4DSwgiLlVgR2gSAA/
         RcnR6fsoWXSEJK6AtQMyUr381HPZG5Tg/fxcI1+Mmn3JMYMMMQauAf+KZxiXvlruVSW5
         nP4e2LXRELPxNdsPAGg4DSER2zKvZXNpVqah2IZ0RIFr+N3/Gg56VH9L2zkwrWk4+EYx
         avbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747897312; x=1748502112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZnCMNOK19g2beZgIpWstHoa0tVgsbyzm96lOgGrbXI=;
        b=NvpAHy+ItVMfeASb9vVtfvuVY1PHWMHmnTgEKKj3GI35iovrp0GhwmStbkVmfHZX3z
         SlSNRSzvqkU0hfIMIqD2mQ3suHjgez2rpZmVko7TQGOdmrAj+OujycIZ5iAqNoqS3P7u
         OadS+urtjaYN0sagQTblmTvw/5eaDJEQBQNUaNz0HDA2R0C0YsvF9fdy6Sy43MoRXykN
         /nG7zz+3nv6ivjFuqmLlBaTIZojHTpcQs7iYN0VtNv1U3OJHEwRLqG6FulVUqi5REwh0
         rI/9Y8j2PMIztVXM7SROEbd8VhJEV97faFlKkxAPZgKyQsVDtmUeOqeefytDVVP31hH0
         f+HA==
X-Forwarded-Encrypted: i=1; AJvYcCWqAJxiDr6nBLaxhfKQQv+4/YU++F77RbxSeIiekWIhqyl5pgJGKYNxOIE7uMhluSCDJv8+Cao2HAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyH+gnaMRU/Of19XHbxX9/rPDiSTsDJma5d4WZpzRDyX07sUcpX
	HmAn32YJIJv8yE9Q4AfYEDYggV9fBTWnQB9JRoXWaZcq5YrjYzrCc3wcixYolOtVJw==
X-Gm-Gg: ASbGnctTS3MRK8sfrdIdkFqDjfPF5kf2PgtaVYDgrCsfwJHg1FzVtiDNbTc5L8nIFDL
	/t90o1/dg0CmItTidpGldbmY4NkNP7NXkFkr7XNTDNyzn7VsUNh0dvGssmD79f+udRkiX8Kf8fI
	t6R0DMb2Xrolz4GeeAKInQsbFY+/h3b0FFkPrJWTlpBuGMNCaUpt6eUGESaIakl63fbh/vOQbPt
	CsEhp/268+nd8oz0bQZRGDf2yWbou+M5dAZoMv18bQePH5HYd9Gg8/aCCIXTBtVnsv1vmyuneyw
	gavtmAHGV3NKZKJeb1K4ddMq8bpLA0Wh5F5ONVQJ53oaNlisjPXfML6PoRPMog==
X-Google-Smtp-Source: AGHT+IEQ/74AfjRJ6TW0pew9ePplx5Dv9HINyckz/rk26fCEm3x0bI/ZN0/cnbUvYLpVS2SlQsRX5g==
X-Received: by 2002:a17:906:2515:b0:ad5:4822:b7a2 with SMTP id a640c23a62f3a-ad54822c4c7mr1518313166b.45.1747897312313;
        Thu, 22 May 2025 00:01:52 -0700 (PDT)
Message-ID: <3b203f39-756b-4fb3-b0e5-0f790701c23a@suse.com>
Date: Thu, 22 May 2025 09:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] xen/domain: introduce CONFIG_MAX_DOMID
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250521000024.2944685-1-dmukhin@ford.com>
 <20250521000024.2944685-4-dmukhin@ford.com>
 <54945bd5-333e-4ffd-8ff1-bb89d22c7ef4@suse.com> <aC5rRwyN51pdRRCM@kraken>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aC5rRwyN51pdRRCM@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2025 02:09, dmkhn@proton.me wrote:
> On Wed, May 21, 2025 at 09:31:34AM +0200, Jan Beulich wrote:
>> On 21.05.2025 02:00, dmkhn@proton.me wrote:
>>> --- a/xen/arch/arm/tee/ffa.c
>>> +++ b/xen/arch/arm/tee/ffa.c
>>> @@ -331,10 +331,9 @@ static int ffa_domain_init(struct domain *d)
>>>       * reserved for the hypervisor and we only support secure endpoints using
>>>       * FF-A IDs with BIT 15 set to 1 so make sure those are not used by Xen.
>>>       */
>>> -    BUILD_BUG_ON(DOMID_FIRST_RESERVED >= UINT16_MAX);
>>
>> Why's this being moved to common code? It certainly may have a purpose here
>> (which I'm simply unaware of); I don't see what purpose it has in common
>> code.
> 
> My understanding having DOMID_FIRST_RESERVED compile-time checks in one place
> is good for testability: the check in question also applies to x86.
> 
> I will drop that hunk.

And also the other one, unless you can explain what exactly you're checking.
The connection between DOMID_FIRST_RESERVED and UINT16_MAX is at best
indirect, through domid_t. Yet if domid_t was widened (possible in principle,
but breaking the ABI) that check would end up wrong without the compiler
noticing (unless DOMID_FIRST_RESERVED was also bumped, which however is an
independent thing).

>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -576,4 +576,11 @@ config BUDDY_ALLOCATOR_SIZE
>>>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>>>  	  working alongside the colored one.
>>>
>>> +config MAX_DOMID
>>> +	int "Maximum number of user domains"
>>> +	range 1 32752
>>> +	default 32752
>>> +	help
>>> +	  Specifies the maximum number of domains a user can create.
>>
>> My prior comment remains: The description and help needs to be accurate, in
>> order to not cause any confusion. In a true dom0less environment I'm not
>> sure the "user" can create any domains (post boot, that is). And when there
>> is Dom0 (or late hwdom), the number specified already isn't the number of
>> domains one can create (again, post boot, which is how I understand "user
>> domains"). If someone picked 1 as the value here, it's unclear to me how
>> late hwdom or dom0less would work in the first place.
> 
> Do you think something like the following will be more accurate?
> 
>     config MAX_DOMID
>        int "Maximum number of domains"
>        range 1 32752
>        default 32752
>        help
>          Specifies the maximum number of domains: dom0 or late hwdom,
>          predefined domains, post-boot domains, excluding Xen system domains
>          (domid >= DOMID_FIRST_RESERVED).

Especially the mention of DOMID_FIRST_RESERVED is too much of an implementation
detail here, imo. Beyond that - maybe, but I'm not overly happy this way either.

As an aside - MAX_DOMID and "Maximum number of domains" are conflicting
with one another, too: Do you mean "maximum ID" or "maximum number of"? The two
are different by 1.

Jan

