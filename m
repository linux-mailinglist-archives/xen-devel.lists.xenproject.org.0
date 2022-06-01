Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C54C53AB44
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 18:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340573.565636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRVj-0006kE-4j; Wed, 01 Jun 2022 16:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340573.565636; Wed, 01 Jun 2022 16:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRVj-0006hm-1a; Wed, 01 Jun 2022 16:47:55 +0000
Received: by outflank-mailman (input) for mailman id 340573;
 Wed, 01 Jun 2022 16:47:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Edd5=WI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwRVh-0006hg-Cy
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 16:47:53 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93e2cb62-e1ca-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 18:47:52 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id c19so3717447lfv.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jun 2022 09:47:52 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a056512051800b00479039f3a7fsm464409lfb.107.2022.06.01.09.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 09:47:51 -0700 (PDT)
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
X-Inumbo-ID: 93e2cb62-e1ca-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5ysxTQwFCS3GVEBRkfwuqA9tewg5aHhB76j7ktEmfGg=;
        b=L6FimHJy5ITfh5gfMmINRQzz96RRLbml0sApFN8Z4wkmrHYUfO3A4c6FvETODLbhCs
         ijRxNNKPa6tHGktbPIBOGZDXxvbeC9jzha1lSjTkn9uKY3I9ozuHghaV/JWXBXRL/mKN
         ipffNDCoKNSjdPLqYQoagvM3CbTqvyqOPhS+H6svrp8RGj98Ovs4HwzFprknXRn8seA/
         UDiv9AK1CFlFEW8y87MsynBUnwV1ds081o0SBMBLKkWSa6Y64YFny+oIC7zQPBZVUHcG
         GXEvSYQFt8R5C3skusvqMPQbtsPlOutKJ5LT4JvwKoDfDLnyp3xSWdb8sn2GS9NBAOTS
         O6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5ysxTQwFCS3GVEBRkfwuqA9tewg5aHhB76j7ktEmfGg=;
        b=yU6a66R3WA2YMBm+5cc33WA8kuBynSkFtQWHGC4T7Q5kyNO/p+EDosNs7hN0hK5LaU
         4jVQkFLZ12jzmEXkeiAsXgxUhXUsnXLzYHeL3d8j2+86JgWHEpPwqlo6uFeCC+FADq1l
         Mtqy3bIvr+HxPQwlVH6we9e28xGVp41F9JyaXbXyduYWnAQCWDEXnvkdZp3OWhbhvPup
         aaeVEmoK2UGDUr3fEZntQaLap3qP7yIDU17hV3vOC2kxVpYpjVS42BTZhEXzryhLY5PP
         LFhsm0pvs5Lkm3lRaIf8WOeRtXkEsbBUOjw5l8FTJYi2hCLXAmUQ6bQXtz96xAsTMtqW
         9aFw==
X-Gm-Message-State: AOAM532r8rqMhcndUqhHHB59vc19PIlLilGX1ipowXYpbWJATsBtjELE
	bi6TwwE4rJOuevTZCNEjSGc=
X-Google-Smtp-Source: ABdhPJwKNFicLIC5mwu7lt+zKuQXf++lAQwUeQal6wex/+NKo02XLGh2/OKF90jLQYjQaQ622TY+0g==
X-Received: by 2002:a05:6512:c08:b0:478:6a03:220d with SMTP id z8-20020a0565120c0800b004786a03220dmr37710106lfu.479.1654102071716;
        Wed, 01 Jun 2022 09:47:51 -0700 (PDT)
Subject: Re: [PATCH V2] libxl/arm: Create specific IOMMU node to be referred
 by virtio-mmio device
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1653944813-17970-1-git-send-email-olekstysh@gmail.com>
 <847647f6-8583-ca22-3cec-90cebe36896d@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c2119161-8b94-d1f0-81bf-bac024087940@gmail.com>
Date: Wed, 1 Jun 2022 19:47:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <847647f6-8583-ca22-3cec-90cebe36896d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 01.06.22 19:43, Julien Grall wrote:
> Hi Oleksandr,


Hello Julien



>
> On 30/05/2022 22:06, Oleksandr Tyshchenko wrote:
>> diff --git a/xen/include/public/device_tree_defs.h 
>> b/xen/include/public/device_tree_defs.h
>> index 209d43d..df58944 100644
>> --- a/xen/include/public/device_tree_defs.h
>> +++ b/xen/include/public/device_tree_defs.h
>> @@ -7,6 +7,7 @@
>>    * onwards. Reserve a high value for the GIC phandle.
>
> This comment need to be updated.


Indeed, will do


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


