Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2333040DE52
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 17:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188586.337798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQtYP-0005aj-MS; Thu, 16 Sep 2021 15:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188586.337798; Thu, 16 Sep 2021 15:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQtYP-0005YM-J7; Thu, 16 Sep 2021 15:44:01 +0000
Received: by outflank-mailman (input) for mailman id 188586;
 Thu, 16 Sep 2021 15:44:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Js+i=OG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mQtYO-0005YG-9B
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 15:44:00 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9c1c681-16b6-49bb-b6f4-a4497e299896;
 Thu, 16 Sep 2021 15:43:59 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id h16so19944872lfk.10
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 08:43:59 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id bt38sm288648lfb.269.2021.09.16.08.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 08:43:53 -0700 (PDT)
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
X-Inumbo-ID: d9c1c681-16b6-49bb-b6f4-a4497e299896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1HZG8pKuU4LzdX28wFwGbG7vSzzx3Nkf7FVz0NUnbzI=;
        b=i31nNwlE+/pBQHd4grJUqb1KYMA2e5jpfRtlXmUd4i+vasnAtRSI9acC4hWecitz9B
         bREmI20Mt8QGD6DSw3SjrtH6wkM0sxlbZZJVD9jvYaM4ROunN0+3vuMQqvXDcfelWb2+
         n06pmOmVmHgQwhYZu0gl/N8OjOBhZzn1hvXf332vU9h8WbtoXMC+7CNURfc+8udP9l+u
         jSWKSNMi28yMwex9yq9lJ333I0NVYMCAQsOQcwq++Tn/z4Ie9ZFiYxHz/tshBUP0R1+D
         MtevEXXNx+gUpTkp/5KU8lk1FyzY8cJcWG+op2G8MmbSHkDh/TxiEQxXAi24YuIFrsjT
         r/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1HZG8pKuU4LzdX28wFwGbG7vSzzx3Nkf7FVz0NUnbzI=;
        b=JYdkPfa8hk2rrt5FKEd8njReXmmBfljyU5QG2Kx5CCmxiJys9PGYH8MGTnmi8m6l9h
         4HLcDUhXSOVrtf58KqwPhZislbha+OdNSFj/7ePaAwVky5Dyz8JlmLlFH4usNj7tsknX
         NdcVVwWGFVWpuPOwcqVFO/pS+uwkOXGwS9kNBDPybBPDkouzKw66RQuSCOJpAHNPXgtN
         +W+di+M8CGt6R2MUMS2PEMNGzgEK+B4aJy5J+Z1sXfMOHxEvYfR43zxCe3VdCFiqdH4F
         NmMyAochIWYS0k6Q7bi5UCuWgq2K/PPi2cAY54FWPXSPBJi6TZJQHel0SwKO8h6UiylC
         KIag==
X-Gm-Message-State: AOAM531IEQOzjC9NT0mCOXiIL5mcPX1VvMedZDTj9oXmFzYMgsvFkDXS
	Y+JW9Rk3tmfpmPs60nINg8sn13m8Mnc6qXtb
X-Google-Smtp-Source: ABdhPJyO5pUDjuV3+yyLfujA1izuJPFWJfhJxVD+8NQNhPnSkN7u9nBkKHqTUKyhKzDrsmfpnIgFfg==
X-Received: by 2002:a05:6512:228f:: with SMTP id f15mr2606198lfu.253.1631807033285;
        Thu, 16 Sep 2021 08:43:53 -0700 (PDT)
Subject: Re: [PATCH V2 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-2-git-send-email-olekstysh@gmail.com>
 <03b1a1bd-2630-0ee7-b995-114632f527aa@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6b1c715f-e71e-718e-3cde-b298a5a38807@gmail.com>
Date: Thu, 16 Sep 2021 18:43:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <03b1a1bd-2630-0ee7-b995-114632f527aa@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 16.09.21 17:49, Jan Beulich wrote:

Hi Jan

> On 10.09.2021 20:18, Oleksandr Tyshchenko wrote:
>> --- a/tools/include/libxl.h
>> +++ b/tools/include/libxl.h
>> @@ -855,6 +855,13 @@ typedef struct libxl__ctx libxl_ctx;
>>    */
>>   #define LIBXL_HAVE_PHYSINFO_MAX_POSSIBLE_MFN 1
>>   
>> + /*
>> +  * LIBXL_HAVE_PHYSINFO_GPADDR_BITS
>> +  *
>> +  * If this is defined, libxl_physinfo has a "gpaddr_bits" field.
>> +  */
>> + #define LIBXL_HAVE_PHYSINFO_GPADDR_BITS 1
> Nit: I don't think you mean to have leading blanks here?

Yes, will remove.


>
>> @@ -120,6 +120,7 @@ struct xen_sysctl_physinfo {
>>       uint64_aligned_t outstanding_pages;
>>       uint64_aligned_t max_mfn; /* Largest possible MFN on this host */
>>       uint32_t hw_cap[8];
>> +    uint32_t gpaddr_bits;
>>   };
> Please make trailing padding explicit. I wonder whether this needs
> to be a 32-bit field: I expect we would need a full new ABI by the
> time we might reach 256 address bits. Otoh e.g. threads_per_core is
> pretty certainly oversized as well ...

I take it, this is a suggestion to make the field uint8_t and add 
uint8_t pad[7] after?


Please note, these are still unaddressed review comments for the last 
version [1], with a suggestion to use domctl (new?).
Also it is not entirely clear to me regarding whether this field will 
even remain gpaddr_bits or became maxphysaddr for example.

[1] 
https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


