Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F047278457
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 11:48:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLkK1-0000LH-MT; Fri, 25 Sep 2020 09:47:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T0XI=DC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kLkJz-0000LC-KQ
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 09:47:19 +0000
X-Inumbo-ID: a9f00d16-0025-4e9b-8596-115b0a811616
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9f00d16-0025-4e9b-8596-115b0a811616;
 Fri, 25 Sep 2020 09:47:18 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x69so2116131lff.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2020 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rPeNi6wc4sYC4rvN3x/D23k6Ku3vvzTSn6EM9ZrekB8=;
 b=POgpd9pu+UeaTwT3V0atNp4U2Cfv5/BqDTh/LRlOwMXblL0tW0j8T/XDcZbiKGoFqJ
 hgm6ej7drkjcBHzTfkIxD+LTol+/6cf5dU/c5zIDdFMfAYVFxj9SA0eEXn3lybv77gW1
 YOtKwpxdOIn0NvyoeK2eNRRftq7UQ0QZ43uoNU3L7ge54mtW0h1ym/sTt5gZO74rgfHP
 7VXooCw7hcep5DDZCc0nBjCRhNftt3/swOvh7kt4LJoRxSPi99L3sBEcQ0ApiyEfdLlD
 jb0eRPR0uJTwq79Qtw9n0SUn4sMWFV7eAVM8gwtvhc8tSfqW0NdAlqZ7oNpVgnoVovgT
 sbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rPeNi6wc4sYC4rvN3x/D23k6Ku3vvzTSn6EM9ZrekB8=;
 b=LaFfQO1HOPmXFbnu9riniW7Fr/cEubjVUl+kvazIl2cFSsB2/IpBeEjju71QZq2pqa
 h20CWmfK7WT8clyQAUTSaMryhAKdEF4LJy3y8WTFJo+5QEnGRcZqz04USIFMcxIb96eP
 4FFh1sGbm2NENsFFVnGaFDeXMQncnLn5viQhHTZOvwPxrik91sBDrQwv3ajzFLq8HNdw
 v3hpiojdymKV4Lm66PDb3p4ba46FcIwSo3hCevGqPDi1BS7Ogtxa8anNMdAjCuytZGnm
 NdgUWXyJJZ4Nc2A6Ho0te9fbUzyIGheI5mYGUtfVBgTIVeXSkF6otQtR/jvBltN+SHQ+
 vQeA==
X-Gm-Message-State: AOAM5304PIALeF6XMRVb/bjeu9OvYrcGMGds30N6YmMOjqfRHKDPcp13
 umitbR65V9kdMfFv3Nme5DM=
X-Google-Smtp-Source: ABdhPJxQYtw9o2VugmZPNXQA5MMNpdpu0zhMBbvz5rrtjXfWSp1YwpbgRQFXUPPdlH17IEHTFFT2hA==
X-Received: by 2002:a19:f00e:: with SMTP id p14mr1009993lfc.69.1601027237543; 
 Fri, 25 Sep 2020 02:47:17 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 64sm1848492lfk.227.2020.09.25.02.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 02:47:16 -0700 (PDT)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
 <af29723b-8ed6-ca8f-8848-29aa65f42b74@suse.com>
 <ffe5148a-e366-d1f1-0a32-2e385ac1934e@gmail.com>
 <a039e213-d25b-1819-3a37-8ed858fa17b8@gmail.com>
 <42aea418-a8f4-e2c0-fc08-b0c504da31bb@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <895ab16e-7713-ff15-137e-ee9bb7f831b9@gmail.com>
Date: Fri, 25 Sep 2020 12:47:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <42aea418-a8f4-e2c0-fc08-b0c504da31bb@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 25.09.20 09:51, Jan Beulich wrote:

Hi Jan

> On 24.09.2020 20:02, Oleksandr wrote:
>> On 24.09.20 19:02, Oleksandr wrote:
>> Julien, I noticed that three fields mmio* are not used within current
>> series on Arm. Do we expect them to be used later on?
>> I would rather not add fields which are not used. We could add them when
>> needed.
>>
>> Would be the following acceptable?
>> 1. Both fields "io_completion" and "io_req" (which seems to be the only
>> fields used in common/ioreq.c) are moved to common struct vcpu as part
>> of struct vcpu_io,
>>       enum hvm_io_completion is also moved (and renamed).
>> 2. We remove everything related to hvm_vcpu* from the Arm header.
>> 3. x86's struct hvm_vcpu_io stays as it is (but without two fields
>> "io_completion" and "io_req").
>>       I think, this way we separate a common part and reduce Xen changes
>> (which are getting bigger).
> If this works, it would be my preference too.

Thanks. I will wait for Julien's input on that and if he doesn't have 
any objections I will go this direction.


-- 
Regards,

Oleksandr Tyshchenko


