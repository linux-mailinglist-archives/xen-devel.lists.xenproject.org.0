Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC02D1A81
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 21:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46993.83204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmN78-0002qe-Ob; Mon, 07 Dec 2020 20:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46993.83204; Mon, 07 Dec 2020 20:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmN78-0002qF-LR; Mon, 07 Dec 2020 20:28:06 +0000
Received: by outflank-mailman (input) for mailman id 46993;
 Mon, 07 Dec 2020 20:28:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmN76-0002qA-T5
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 20:28:04 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c9ac47d-5a38-4fee-9d5c-be253467f0fc;
 Mon, 07 Dec 2020 20:28:04 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id f11so4275035ljm.8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 12:28:04 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z20sm3102567ljh.86.2020.12.07.12.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 12:28:02 -0800 (PST)
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
X-Inumbo-ID: 0c9ac47d-5a38-4fee-9d5c-be253467f0fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=71qlpQ3/OFvfHBS/kNYeBBOEh5LTxZRYxfVwm9MDmn8=;
        b=KnpLS7LLeNsCUY6gDiyVFj/qP4tI7z25+YaxkskJK/opwl2IKB7gxkLQLPhXbFagsz
         F+W+VDri0ZmoUwJMB3VX/w2O1nb+G8GAWTKDbt4PhJpXU7ywPM4YcQ3DTY8L80mTM0R0
         RZpzn3UFKL6SewkD2o4vSdrtJZJryAMMYN+O488z2q4NBdcRbuAqykxZNuXcVMH0ocmH
         2XVcl5kUgcLWZ/SFgRL0P5sduxdU8iJuteIT2f1J05m9yraEabyZ/UMv2nBokLI2bytc
         etRfeInwctpIx23bDZ1Cf48CJsHczDOPyWpLlik+wOy1tgBGL4ibxVjQxRGhcASET2HE
         0Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=71qlpQ3/OFvfHBS/kNYeBBOEh5LTxZRYxfVwm9MDmn8=;
        b=qQ3KCtF93gb75cW1yOJKBssC8s/KS0SrTLem1uw5JwYDnD3860NulBcMjg5/0XvwSi
         EEXS74mOUpDvENHHFPtoBpnpFyhPPaHm1szpKnZ+tfF0ry/7cbejE8kH5HFqkuffNzE0
         9sVRmkzZzaP4eoRvcJQEsixVSEJR/i7y6Fxo8vyiAoG43yCJqtdmvM9TOMgRY//vsj3o
         pO5iFie7Em6UBwI+GUJBA4gKFr9Br8MZpEzLThA9xVN4pRmMEJSGlKmxddgh+ck+6+oS
         3LKEyqDp/vqkteGuxEodndR2T27FUZP4VEwhIjH7qzLNJLJ9gprOVPqAJ+NKU5g+204+
         bZjg==
X-Gm-Message-State: AOAM532ELMGsqv0V02Ub3X03b2cwgMk3g0PxeOTAF6q6+O58JPnpVxPn
	NDmoB40uEoNMg2AZh4lkQLXJ5PqB619BBw==
X-Google-Smtp-Source: ABdhPJwEOfJpowfNuKAuPffb6VyiGPsgqcZ999KU8X4kBZyEWO6KramY9dmkoCFIEoyO+z9sGrontA==
X-Received: by 2002:a05:651c:1b6:: with SMTP id c22mr9687723ljn.365.1607372882977;
        Mon, 07 Dec 2020 12:28:02 -0800 (PST)
Subject: Re: [PATCH V3 12/23] xen/ioreq: Remove "hvm" prefixes from involved
 function names
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-13-git-send-email-olekstysh@gmail.com>
 <8b185227-3eae-de79-3af9-db39fed44459@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <cb35481d-1e21-3223-90b8-28d5c55f197b@gmail.com>
Date: Mon, 7 Dec 2020 22:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8b185227-3eae-de79-3af9-db39fed44459@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.12.20 14:45, Jan Beulich wrote:

Hi Jan

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> @@ -301,8 +301,8 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
>>       return found;
>>   }
>>   
>> -static void hvm_update_ioreq_evtchn(struct ioreq_server *s,
>> -                                    struct ioreq_vcpu *sv)
>> +static void ioreq_update_evtchn(struct ioreq_server *s,
>> +                                struct ioreq_vcpu *sv)
>>   {
>>       ASSERT(spin_is_locked(&s->lock));
> This looks to be an ioreq server function, which hence wants to be
> named ioreq_server_update_evtchn()? Then

Will rename


>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Thank you

-- 
Regards,

Oleksandr Tyshchenko


