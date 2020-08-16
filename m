Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C4D24595E
	for <lists+xen-devel@lfdr.de>; Sun, 16 Aug 2020 21:37:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7OSu-0000qT-Ad; Sun, 16 Aug 2020 19:37:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehYN=B2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k7OSt-0000qK-5f
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2020 19:37:11 +0000
X-Inumbo-ID: 658c48f7-8806-4acc-8487-11783fa0ceb9
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 658c48f7-8806-4acc-8487-11783fa0ceb9;
 Sun, 16 Aug 2020 19:37:10 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s9so7301731lfs.4
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2020 12:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HP9iIT8LlNo26mkqxuzBQ8hTPN52OjgMnGuT0ZTnYDc=;
 b=bBEHRhRCZfQfh3n1qzbHmyII8dY7FHeLfY1oAHjTXEeD5L9HJ3Rf1C+usS+t4ShWG7
 IWwyBYU4bEW1Pa9T2hMNB+R+IuWKrAr+ZkYbpSLsYNjmMgUAHd9rej1otjKwFw+MM2J2
 Y0+QaThqUg+Z5jmwBdUk1cKN2BCGkTXfWGk8BbeSAuuEZCq8YaiIasM2Onby40kckjhU
 9MYFBOTeFKpDOCo34IckfoAVOUahynAMPM29BvfmSXnEhjdzYQdiNX1AfT55dHoj8871
 t+EdodDce0N8vZpYpgX1uUGZlmE3HD8wlRBusVaJ83llQact9vk+JVUSubYqRN6aBk29
 ikGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HP9iIT8LlNo26mkqxuzBQ8hTPN52OjgMnGuT0ZTnYDc=;
 b=eZtdz1adxlVcN2j7EspOESc4S1DBgCX5RaiiCV6sSaPhgDsrzxezR4n7CBfsI6cGXq
 zizUklhqem1qDUb68L9H0Ept5lqFDiuv43E3kn+4ZBItmRnmnDBiYdy/ytm8rgj5i2lC
 NFZ/kwV+urWP0KyDaXiCakcIP6zp59ZVp5V3QisxxjTzbvrZYI6EKYKAs9FMM4zY+ZG8
 h61i7fsTchhDJ2Pd53zdflzgc1IRkkgs6hBbhL/tVecSdIeLK/vijD/JFBOchIAsmnMF
 3FHfcSinoagBSixymhQ8/4LFSlR17zyJ4wWm/eVGlIWhFGEvEsO2hgzkUPBq1OYWetW1
 kRmQ==
X-Gm-Message-State: AOAM53019yQWkIiYgp0+XakHCGJs0TG1PfC5xPjwqFbgRqwXWpWty6MU
 JqwriXuoa+K82CPrYrm2QC8=
X-Google-Smtp-Source: ABdhPJzFEPhVfndo+EsiV5vok0PjIBAEb3Usc3BGE94rYR3Pak6OOpFpn8miXYyfEr95onK52vCRig==
X-Received: by 2002:a19:4844:: with SMTP id v65mr5967561lfa.184.1597606629337; 
 Sun, 16 Aug 2020 12:37:09 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l24sm4042819ljb.43.2020.08.16.12.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2020 12:37:08 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <73ab810e-f7c0-14cd-c400-24ddeb79eda5@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ebf09fc6-2710-1f32-9385-0b0a7b9c6a37@gmail.com>
Date: Sun, 16 Aug 2020 22:37:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <73ab810e-f7c0-14cd-c400-24ddeb79eda5@xen.org>
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


On 15.08.20 20:30, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien.


>
> On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
>> +static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, 
>> ioreq_t *p)
>> +{
>
> [...]
>
>> +    /* Canonicalize read/write pointers to prevent their overflow. */
>> +    while ( (s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_ATOMIC) &&
>> +            qw++ < IOREQ_BUFFER_SLOT_NUM &&
>> +            pg->ptrs.read_pointer >= IOREQ_BUFFER_SLOT_NUM )
>> +    {
>> +        union bufioreq_pointers old = pg->ptrs, new;
>> +        unsigned int n = old.read_pointer / IOREQ_BUFFER_SLOT_NUM;
>> +
>> +        new.read_pointer = old.read_pointer - n * 
>> IOREQ_BUFFER_SLOT_NUM;
>> +        new.write_pointer = old.write_pointer - n * 
>> IOREQ_BUFFER_SLOT_NUM;
>> +        cmpxchg(&pg->ptrs.full, old.full, new.full);
>
> While working on the implementation of cmpxchg(), I realized the 
> operation will happen on memory shared with a the emulator.
>
> This will need to be switched to guest_cmpxchg64() to prevent a domain 
> to DoS Xen on Arm.

Got it. I will create a separate patch for that purpose.

-- 
Regards,

Oleksandr Tyshchenko


