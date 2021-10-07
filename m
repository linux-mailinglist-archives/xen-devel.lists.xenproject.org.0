Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0497425D20
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 22:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203965.359148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYZs4-0006p5-LY; Thu, 07 Oct 2021 20:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203965.359148; Thu, 07 Oct 2021 20:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYZs4-0006k9-Hr; Thu, 07 Oct 2021 20:20:04 +0000
Received: by outflank-mailman (input) for mailman id 203965;
 Thu, 07 Oct 2021 20:20:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYZs2-0006SE-Ua
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 20:20:03 +0000
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ce3e596-fdb0-4b96-810f-5106e3c532f7;
 Thu, 07 Oct 2021 20:20:01 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id p13so28185188edw.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 13:20:01 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w2sm182203edj.44.2021.10.07.13.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 13:20:00 -0700 (PDT)
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
X-Inumbo-ID: 7ce3e596-fdb0-4b96-810f-5106e3c532f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=x2ugqiSsbh4NHZ4hAN2CzfLqUHMfH4oPfpea4xYsiwQ=;
        b=RAglGAyPEgEXPF4oYNY26Ur9R/TaeQ0HE0MXX7GZOhYgcVLsi2uE+rzhnOTCc1MOja
         +hYyd8n88lVOsRIGdKZcB0iPDlroietW8/zOzCVA+td2OPLn/GiPlO7DQG6cyn0v7uxP
         fRQ8fZhailjDvPRnCtpv75qgaIHYg2aze6CCx2Svp8Pqb+V+M+bhdh9BrOcKy9QcwkXv
         sz6YF7TS/pFB6PsM0lCKbV/8DYO5y99c1ljWDnVrCZQfWsQ3Z4G+JbRkDvHoHmGtazg/
         7qkeTFOsYS9S4KTWpHJqyECcGrW3njY2u0wBlUPXcki+czan/6M8WLTtjNVDR5lXG9C3
         drKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=x2ugqiSsbh4NHZ4hAN2CzfLqUHMfH4oPfpea4xYsiwQ=;
        b=sHs97XpW/UUYmIPLtAVNH2elfKlpIXxlxM/F9+hYN8lBqtFmzdTr7h0Q4GpbeB4H92
         cybMjh2QFKbyU2ozZ6LsIZlN5ggalWz3Cl8tXxRCIx8Q2Xhz+tDHN4+Z5Hot33d5EhwC
         H9isTuOegDPaztQiGgHJSQaTyMidVv41R1y5RT36MKw0gAVyTavYCh/cRuxP3vW/ELZ7
         u4gvGWoS5FBmehWwCS+gl9/Vrtjg4AghPB59h6YctZFXnBuQzGvnShl5ZGbiWi4vh7U6
         MtoQSCd3pyWpV4rtLoI3EAXppzA0E5QafvqSwkpTWb2lercn9QyoBhGwuMSb6iM/dNLK
         K/Uw==
X-Gm-Message-State: AOAM530Uqm05WbGxvr6DV+WuqSFbuhxYErwYCO0r18sQ6wL1nLnfCBdb
	gOGK+8pzLYzWNpWYcg5G+6E=
X-Google-Smtp-Source: ABdhPJxnj2qOw3jF2XFSJLwGFp+PP7nHbvOTPMggNgyv65kNQIAxavd/EdeVikhVxIIMUS8fKvhq/w==
X-Received: by 2002:a50:da49:: with SMTP id a9mr9212057edk.281.1633638000676;
        Thu, 07 Oct 2021 13:20:00 -0700 (PDT)
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110061743300.3209@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <080c8438-e24e-a557-5cbb-362e41029c4b@gmail.com>
Date: Thu, 7 Oct 2021 23:19:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110061743300.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.10.21 03:49, Stefano Stabellini wrote:


Hi Stefano

> On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> We need to pass info about maximum supported guest physical
>> address space size to the toolstack on Arm in order to properly
>> calculate the base and size of the extended region (safe range)
>> for the guest. The extended region is unused address space which
>> could be safely used by domain for foreign/grant mappings on Arm.
>> The extended region itself will be handled by the subsequent
>> patch.
>>
>> Currently the same guest physical address space size is used
>> for all guests.
>>
>> As we add new field to the structure bump the interface version.
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Changes RFC -> V2:
>>     - update patch subject/description
>>     - replace arch-specific sub-struct with common gpaddr_bits
>>       field and update code to reflect that
>>
>> Changes V2 -> V3:
>>     - make the field uint8_t and add uint8_t pad[7] after
>>     - remove leading blanks in libxl.h
>>
>> Changes V3 -> V4:
>>     - also print gpaddr_bits from output_physinfo()
>>     - add Michal's R-b
>>
>> Changes V4 -> V5:
>>     - update patch subject and description
>>     - drop Michal's R-b
>>     - pass gpaddr_bits via createdomain domctl
>>       (struct xen_arch_domainconfig)
>> ---
>>   tools/include/libxl.h            | 5 +++++
>>   tools/libs/light/libxl_arm.c     | 2 ++
>>   tools/libs/light/libxl_types.idl | 1 +
>>   xen/arch/arm/domain.c            | 6 ++++++
>>   xen/include/public/arch-arm.h    | 5 +++++
>>   xen/include/public/domctl.h      | 2 +-
>>   6 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
>> index b9ba16d..33b4bfb 100644
>> --- a/tools/include/libxl.h
>> +++ b/tools/include/libxl.h
>> @@ -279,6 +279,11 @@
>>   #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
>>   
>>   /*
>> + * libxl_domain_build_info has the gpaddr_bits field.
>> + */
>> +#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_GPADDR_BITS 1
>> +
>> +/*
>>    * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
>>    * 'soft reset' for domains and there is 'soft_reset' shutdown reason
>>    * in enum libxl_shutdown_reason.
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index e3140a6..45e0386 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -123,6 +123,8 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>>   
>>       state->clock_frequency = config->arch.clock_frequency;
>>   
>> +    d_config->b_info.arch_arm.gpaddr_bits = config->arch.gpaddr_bits;
>> +
>>       return 0;
>>   }
>>   
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>> index 3f9fff6..39482db 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>>   
>>       ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>                                  ("vuart", libxl_vuart_type),
>> +                               ("gpaddr_bits", uint8),
>>                                 ])),
>>       ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>>                                 ])),
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 19c756a..dfecc45 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -767,6 +767,12 @@ int arch_domain_create(struct domain *d,
>>       if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
>>           goto fail;
>>   
>> +    /*
>> +     * Pass maximum IPA bits to the toolstack, currently the same guest
>> +     * physical address space size is used for all guests.
>> +     */
>> +    config->arch.gpaddr_bits = p2m_ipa_bits;
> This could also be set in arch_sanitise_domain_config together with
> config->arch.gic_version. I prefer if it was done in
> arch_sanitise_domain_config but also here is OK I think.

I don't mind, being honest I had an idea to place this in 
arch_sanitise_domain_config(), but couldn't convince myself.


>
> Given that everything else looks fine:
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!

Sadly, according to the recent discussion most likely this version is 
also no-go.


[snip]

-- 
Regards,

Oleksandr Tyshchenko


