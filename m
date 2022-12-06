Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7B6448CF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 17:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455320.712773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2aVF-0006fI-9m; Tue, 06 Dec 2022 16:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455320.712773; Tue, 06 Dec 2022 16:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2aVF-0006cE-6b; Tue, 06 Dec 2022 16:09:05 +0000
Received: by outflank-mailman (input) for mailman id 455320;
 Tue, 06 Dec 2022 16:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d2tL=4E=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p2aVE-0006bO-CP
 for xen-devel@lists.xen.org; Tue, 06 Dec 2022 16:09:04 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d5bb5d5-7580-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 17:09:03 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id bs21so24166732wrb.4
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 08:09:03 -0800 (PST)
Received: from [10.17.77.118] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfec46000000b0022efc4322a9sm17417250wrn.10.2022.12.06.08.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 08:09:02 -0800 (PST)
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
X-Inumbo-ID: 4d5bb5d5-7580-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROAHbu9VIU8NX8eYeMy/eJdQkrp6evWVJFWXmDsaG2Q=;
        b=Uaad/ff4HgftQ9QbYZQ+VyY4d5Ccc1gMRbLYP2nw9eQqYyrdYbLYsAnmARlWqMCLby
         D12Cf31Ajv8CxPIXSvxRbuPRhEND3fSB02POJ3sUUrc3FF9UXGHAEyUacw7ASbd14XM/
         SCyCSd2WEMxb371E1HGgL0882reJZ0dpX1AoADJlT9v4baiK+fIVYZq5Oty9pmhYFlWV
         saIBgDnnpuWMJ0kfBjS/gPDuLEYbO4f93G7UjcnwuUZDqB7qblxOh4t3j4BRkriUbhHI
         nIieMN8gTYH2/qxAwnPHRvByQ362zivBMd9sUdUlfApmtvtubfUY8a42qQzGzD2kPFHL
         VoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROAHbu9VIU8NX8eYeMy/eJdQkrp6evWVJFWXmDsaG2Q=;
        b=FfzCuGNEVRa+/7p0Mwjd0Jiv9KM1WwPXkjhuUrfe6HKIyXom80u8rJDWk0aIITGvAI
         TpEC0jys3XC35268a+JBJ2vUVGl/s1eOSP/wcisYCdVkBMANmCarL+ANUJONQ5pSpPa1
         /T9mOwxaSuSylt6JR5n7vmirFH0K5UyE0yM4y99l0VTGvK9FXFdHiVCe/cwphn7GAv2G
         g2a+z96PGTdlh/ORU/kP2HVC293mJGPqGfNJGryGTdUsahTsSaVavLLWYmf42J3SM8nn
         JMzLvGZYMoGcyBsWxyGzgGfeZNHuOcfElXxCbPm1ZEA6EfjpyG+dU0aFNkgx8tce2t6r
         1KQw==
X-Gm-Message-State: ANoB5pnZqS03tvXBKY3eXhzrfoN3TrriZK+fLEvk4EJI5c7CKJOnXhMs
	tjFbhXmj2Q/T7R3Ofu0j98A=
X-Google-Smtp-Source: AA0mqf6AGvo+JkSbOf7URA85tWL7l6N40y55elCGK71s569G01+h6HbT1OXzuGRRHHvO3VHsYZuPVg==
X-Received: by 2002:adf:db01:0:b0:242:3ddc:2b36 with SMTP id s1-20020adfdb01000000b002423ddc2b36mr13513734wri.288.1670342942988;
        Tue, 06 Dec 2022 08:09:02 -0800 (PST)
Message-ID: <2555ed5c-4576-7c73-588b-181d1f98bb4d@gmail.com>
Date: Tue, 6 Dec 2022 18:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 1/3] libxl: Add support for generic virtio device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xen.org, Julien Grall
 <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <f1dc91669df27705c25a1f3018427c2db77b32a6.1667906228.git.viresh.kumar@linaro.org>
 <6a546552-d71d-a262-5981-8058dc37ae26@gmail.com>
 <20221205061518.l2i4kqkzcivpxaxl@vireshk-i7>
 <20221205112946.qwa647k35uv7eyqr@vireshk-i7>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20221205112946.qwa647k35uv7eyqr@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.12.22 13:29, Viresh Kumar wrote:

Hello Viresh

> On 05-12-22, 11:45, Viresh Kumar wrote:
>>>> +    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_domid);
>>>> +    if (rc) goto out;
>>>> +
>>>> +    rc = libxl__parse_backend_path(gc, be_path, &dev);
>>>> +    if (rc) goto out;
>>>
>>> The same question for dev variable.
>>
>> Hmm, this we aren't using at all, which KBD does use it. Maybe we
>> should even call libxl__parse_backend_path() ?
> 
> Removing it works just fine for me.


Perfect. We will be able to add it when it is *really* needed.

> 

