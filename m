Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B854D66CC16
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 18:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478905.742404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTAo-0000dC-IF; Mon, 16 Jan 2023 17:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478905.742404; Mon, 16 Jan 2023 17:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTAo-0000bS-FF; Mon, 16 Jan 2023 17:21:30 +0000
Received: by outflank-mailman (input) for mailman id 478905;
 Mon, 16 Jan 2023 17:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHTAn-0000bM-9W
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 17:21:29 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 360ffad7-95c2-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 18:21:28 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id bk15so12142991ejb.9
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 09:21:28 -0800 (PST)
Received: from [192.168.1.93] (adsl-115.37.6.0.tellas.gr. [37.6.0.115])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906311200b0084b89c66eb5sm12016582ejx.4.2023.01.16.09.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:21:27 -0800 (PST)
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
X-Inumbo-ID: 360ffad7-95c2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VK2WSwwO3wem8lG8VumfhfaOUBXDe0sbdIex9VQG+7I=;
        b=kzqXBzvJIHOAX+eehaTHL7GpInXwkBd1FLV4/EncafC4YmdwTWZ4pNOt3R6ieK1B54
         Wn7iqcdV2AnJKdno2ThBiK8ugIgENq+RZtEvt3rHEanUa5FXgjX7LNh+YdhJATuwDLDu
         hGF2N3IpCsvHhytZarl8mMogUCdS8IYcgxFbDVdMVXrFF1E8vzOeD60DTT/DnJm0o1Uo
         XvpzLgHvAjcFnq+97j+TTukzRRHEynxv5/tJtYqIwuGYSjQwLAUdmkJ/8CPrviTx7DAD
         BRlI2Y92AJ/kiC+izoSgTCDIfBquwm+gzPupa/y9w4pgOG5/gmNLMfQ6gBCXs6VWcYR+
         SXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VK2WSwwO3wem8lG8VumfhfaOUBXDe0sbdIex9VQG+7I=;
        b=T1Zph99xWmKeetGrkJd6XTcHqhcnCLET+VNnC2tCGC6hdbEoqbBmjku5krjKKrVX81
         VGbohrg+HqXRo0rXKJ5DOBY9H97diSuus2EMovF9niUzQ7NKgsEHcKV8PH3pk1J8k1xP
         b86geDDBjyH7JRr1Q3bdCNDbulpfxOg0ejFEcshNZN3wHLI8O6Pj74zv/tJ091vI/7sB
         XEQgoD+8pxI7rDuVKlsIQIXjHx6ynQ676dZe1UFbduZ8BLX0nJDDM5O07va5M9dk7/cU
         IHiyy2dY+H6oJAI1Va4GwQ0S+yRktQRzaz+mMlDdI/2wmpULhHcZsGmy1I7nFtPYmlGT
         oQvw==
X-Gm-Message-State: AFqh2kpTjKxqG+OEfSclH88Z+q4lAwUvgB8JQcZ+Ez86v4i0r+71wG5I
	ZaknKGQgEeN5a86c3sG7psg=
X-Google-Smtp-Source: AMrXdXvM3rTJg5z2BYuhOmRearVq7EK4JblcBceMIJufsOn9c9Ku7yjkYk/Q7ZY4toIgnsCkTNjpjw==
X-Received: by 2002:a17:906:a0c3:b0:872:5c57:4a32 with SMTP id bh3-20020a170906a0c300b008725c574a32mr86452ejb.51.1673889687861;
        Mon, 16 Jan 2023 09:21:27 -0800 (PST)
Message-ID: <fac90343-840c-8110-6a00-c438bff9f53b@gmail.com>
Date: Mon, 16 Jan 2023 19:21:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/8] x86/iommu: make code addressing CVE-2011-1898 no
 VT-d specific
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230116070431.905594-1-burzalodowa@gmail.com>
 <20230116070431.905594-6-burzalodowa@gmail.com>
 <f620f8ee-e852-de62-53ef-5cd243e4cc09@gmail.com>
 <37367eb9-7700-27f8-1871-b84224f0c63c@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <37367eb9-7700-27f8-1871-b84224f0c63c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/16/23 18:49, Jan Beulich wrote:
> On 16.01.2023 08:21, Xenia Ragiadakou wrote:
>> On 1/16/23 09:04, Xenia Ragiadakou wrote:
>>> The variable untrusted_msi indicates whether the system is vulnerable to
>>> CVE-2011-1898 due to the absence of interrupt remapping  support.
>>> AMD iommus with interrupt remapping disabled are also exposed.
> 
> It would probably help if you mentioned here explicitly that, while affected,
> we don't handle that yet (the code setting the flag would either need to
> move out of VT-d specific space, or be cloned accordingly).

Sure. I will update the comment.

> 
>>> Therefore move the definition of the variable to the common x86 iommu code.
>>>
>>> Also, since the current implementation assumes that only PV guests are prone
>>> to this attack, take the opportunity to define untrusted_msi only when PV is
>>> enabled.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> [...]
>>
>> Here, somehow I missed the part:
>> diff --git a/xen/drivers/passthrough/vtd/iommu.c
>> b/xen/drivers/passthrough/vtd/iommu.c
>> index dae2426cb9..e97b1fe8cd 100644
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -2767,6 +2767,7 @@ static int cf_check reassign_device_ownership(
>>            if ( !has_arch_pdevs(target) )
>>                vmx_pi_hooks_assign(target);
>>
>> +#ifdef CONFIG_PV
>>            /*
>>             * Devices assigned to untrusted domains (here assumed to be
>> any domU)
>>             * can attempt to send arbitrary LAPIC/MSI messages. We are
>> unprotected
>> @@ -2775,6 +2776,7 @@ static int cf_check reassign_device_ownership(
>>            if ( !iommu_intremap && !is_hardware_domain(target) &&
>>                 !is_system_domain(target) )
>>                untrusted_msi = true;
>> +#endif
>>
>>            ret = domain_context_mapping(target, devfn, pdev);
>>
>> I will fix it in the next version.
>>
> 
> With that added (and preferably the description clarified)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

-- 
Xenia

