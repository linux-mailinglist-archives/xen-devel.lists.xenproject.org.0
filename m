Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73041B388
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 18:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198116.351443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVFcH-0002gz-QH; Tue, 28 Sep 2021 16:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198116.351443; Tue, 28 Sep 2021 16:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVFcH-0002e8-MX; Tue, 28 Sep 2021 16:06:01 +0000
Received: by outflank-mailman (input) for mailman id 198116;
 Tue, 28 Sep 2021 16:06:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7JL=OS=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mVFcG-0002e2-Au
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 16:06:00 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dda31691-6ecd-440a-8d4c-91a535e1f221;
 Tue, 28 Sep 2021 16:05:59 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b15so92973603lfe.7
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 09:05:59 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n11sm2610772ljg.72.2021.09.28.09.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 09:05:42 -0700 (PDT)
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
X-Inumbo-ID: dda31691-6ecd-440a-8d4c-91a535e1f221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lHlbLzNTI/p4hTFJf4CQRi5qwBbxQpaCQ9ivmAzEE7o=;
        b=ozvajN56jjIgkSwzidW4QNgqyR0ZKWwTJd3UTZeCvLSdnqQmpgeT8y6XwSW4QDfKQk
         hGfYNeWNrxEvVvXarqDosC2PLXhrbR13vAH3NEVZKtDTImnkxwZidn8gDlwO894GY9vv
         qmnkqneLOwemDBG+PKZ+B0sD0KSl9HpgqNiRfflSLdxGJVRt+NPN9lpShq9MIdCYwoDF
         DJBmxj2O/0t5SIVQea3FSV6gs3YH5Ep//RDt0sRbYcygbKpX66o0o9upht9Ew+4XzHmR
         rblqV+tv+7tTU9Aq/40KsIQneTwrMGUUJx+VWZ0TSjY/0HSMpdGYERbCQfCl87V/WUR4
         btaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lHlbLzNTI/p4hTFJf4CQRi5qwBbxQpaCQ9ivmAzEE7o=;
        b=puLGt6OwAXv1l22iSbBHorD8sGNcYB8AsISzXrk0N4+Oj4qryQhOdGYFI1eBU+Uzol
         9FiqijDPBWmU/eqAW2FAGBLcGPsPxxfSeMlow4AwNHm6EPHAqPwecabKThiZzBrSf9XZ
         qL5P7YTjO89U/0Py8+BAXF/Fm6RU6Qza1N9779o9/B8anq4saVuTVw6XEfV1xen5eOlB
         wic0qjGqXHdEu21TvZz9yvmXhGpgQa3THiocolRYQeb2jZ5fDn2TONKg3nErxnzL1Se0
         hyPMELllHmCZ+/rPZIUFv1QGMzU10g9gOdejJWx1b9S8uTR2aSUwIgXlZZtbKWaeUn/P
         XYCA==
X-Gm-Message-State: AOAM530DVrpXCJVNtuOwzLeJQ5kaq2GHJBVlcNj3+wU+nWVJss8st7Xy
	H6u8s/GhnpyyyW9bIOfQsZ0=
X-Google-Smtp-Source: ABdhPJw+/QCpKYDfoocPbq97sFjnXHE+gY6imh8HYgUJC8dR1++oYlYQPU4Ooqquz69ksQkSNbuxlw==
X-Received: by 2002:a05:651c:549:: with SMTP id q9mr51627ljp.238.1632845143236;
        Tue, 28 Sep 2021 09:05:43 -0700 (PDT)
Subject: Re: [PATCH V3 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1632437334-12015-1-git-send-email-olekstysh@gmail.com>
 <1632437334-12015-2-git-send-email-olekstysh@gmail.com>
 <27840222-d5be-3df6-88bf-fb41c978791e@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <95aa98bf-f372-9893-ecc8-bc114af841cd@gmail.com>
Date: Tue, 28 Sep 2021 19:05:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <27840222-d5be-3df6-88bf-fb41c978791e@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 28.09.21 09:28, Michal Orzel wrote:
> Hi Oleksandr,

Hi Michal



>
> On 24.09.2021 00:48, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> We need to pass info about maximum supported guest address
>> space size to the toolstack on Arm in order to properly
>> calculate the base and size of the extended region (safe range)
>> for the guest. The extended region is unused address space which
>> could be safely used by domain for foreign/grant mappings on Arm.
>> The extended region itself will be handled by the subsequents
>> patch.
>>
>> Use p2m_ipa_bits variable on Arm, the x86 equivalent is
>> hap_paddr_bits.
>>
>> As we change the size of structure bump the interface version.
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Please note, that review comments for the RFC version [1] haven't been addressed yet.
>> It is not forgotten, some clarification is needed. It will be addressed for the next version.
>>
>> [1] https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/
>>
>> Changes RFC -> V2:
>>     - update patch subject/description
>>     - replace arch-specific sub-struct with common gpaddr_bits
>>       field and update code to reflect that
>>
>> Changes V2 -> V3:
>>     - make the field uint8_t and add uint8_t pad[7] after
>>     - remove leading blanks in libxl.h
>> ---
>>   tools/include/libxl.h            | 7 +++++++
>>   tools/libs/light/libxl.c         | 2 ++
>>   tools/libs/light/libxl_types.idl | 2 ++
>>   xen/arch/arm/sysctl.c            | 2 ++
>>   xen/arch/x86/sysctl.c            | 2 ++
>>   xen/include/public/sysctl.h      | 4 +++-
>>   6 files changed, 18 insertions(+), 1 deletion(-)
>>
> Don't you want to print gpaddr_bits field of xen_sysctl_physinfo from output_physinfo (xl_info.c)?

Good point, will do, thank you.


>
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Thanks


>
> Cheers

-- 
Regards,

Oleksandr Tyshchenko


