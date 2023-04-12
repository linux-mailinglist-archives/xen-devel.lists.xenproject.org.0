Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D36DF19E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 12:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520156.807475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmXNA-0006Hw-Kb; Wed, 12 Apr 2023 10:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520156.807475; Wed, 12 Apr 2023 10:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmXNA-0006F7-H2; Wed, 12 Apr 2023 10:06:40 +0000
Received: by outflank-mailman (input) for mailman id 520156;
 Wed, 12 Apr 2023 10:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=In0L=AD=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pmXN9-0006F1-1b
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 10:06:39 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3fc7726-d919-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 12:06:33 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 he11-20020a05600c540b00b003ef6d684102so4018103wmb.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Apr 2023 03:06:34 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.216.226])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b003f0652084b8sm1865060wms.20.2023.04.12.03.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:06:33 -0700 (PDT)
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
X-Inumbo-ID: b3fc7726-d919-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681293994; x=1683885994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nodu07HKidxKPxvOg7xbv/1Polhi/238wioQUMdq6YU=;
        b=Xk3y6DXBeCFFzJr+vithiTz5Beg0CXzofhffIWROJNMLkIZ7q26zdzFL4KJtA4YxyU
         Il4dRd58xoKO29XLYhdAiWdEM4huVsdPW7tera/P7GyqMzKKr5sQFUsTfalIJ40UoLt5
         RZNqZzfSgstPdGFJ4R0YX5dBPr8yhN791OWpFaBmqSRZApEh4jrE+bwym33YTPmGkOEI
         7gr68QxBAS8wdpi6KH/Bcx+0ZH++esjWqvsINZI9qV3ixkUf50FIyXp6LuCXItCKkmpu
         w95X1V7K9gFRCUDsJeIqJJ4IrgOgZWYJ5NN9Uve6hEwbGvxbD9cVhTlpHNiW7ruAt4Ob
         FUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681293994; x=1683885994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nodu07HKidxKPxvOg7xbv/1Polhi/238wioQUMdq6YU=;
        b=iYUBTFRUGLg1Zku10Ubx8cR5LhqjvanBrad2vEJyOaDsdyLbEOntJqBEUipfxTEMjo
         00HOu36Jit3yE9XLGfKfhJeWCrd7VUPkMN/MNmzVaVFhOKa4YYu0NVsJ3bS67oBQYR8r
         koDm6R+50iHggqptaLn0oLMVaHHvgWd4wc3MHwiG0CxlIl+eBh7KL82YrFR5eLb1XpRl
         eKTLwAu4MpSW7CC8n409IuhwmGqcGqHCPddG/WJWDiysame2jt/A5MMn2Zv0tO96MmiX
         IHkrF49ph9IaruKLkIxwBPKPq5XYYF2+SpObGWXzOwo6muuLeMiapWHi0ddkeZGh86vz
         /0FA==
X-Gm-Message-State: AAQBX9fr+qnLy6o7XooFpAnhj5NGi+D5t9JaIRdDrEqfQdYLmfQXRfZO
	PtqvNNY3oTGH5ZangPdTG4T/gA==
X-Google-Smtp-Source: AKy350a38QzxrOG40N/FCLtmNOZJ6NWu2hOiFQSQbZsWgPAmb1mo1As6jLt15bkoB1132d1qV+yodA==
X-Received: by 2002:a05:600c:b56:b0:3ee:7e12:f50 with SMTP id k22-20020a05600c0b5600b003ee7e120f50mr1516825wmr.8.1681293994158;
        Wed, 12 Apr 2023 03:06:34 -0700 (PDT)
Message-ID: <72ee7e72-5ec1-d53b-94fa-e88f68880c2f@linaro.org>
Date: Wed, 12 Apr 2023 12:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg'
 configuration for xen
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Vikram Garhwal <vikram.garhwal@amd.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230411210422.24255-1-vikram.garhwal@amd.com>
 <895bcdd3-350d-38e7-1982-899948072b93@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <895bcdd3-350d-38e7-1982-899948072b93@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/4/23 07:39, Thomas Huth wrote:
> On 11/04/2023 23.04, Vikram Garhwal wrote:
>> Xen is supported for aarch64 via xenpvh machine. disable-tcg option 
>> fails the
>> build for aarch64 target.
>>
>> Link for xen on arm patch series: 
>> https://mail.gnu.org/archive/html/qemu-devel/2023-02/msg03979.html
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   .gitlab-ci.d/crossbuilds.yml | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 61b8ac86ee..6867839248 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -186,7 +186,7 @@ cross-amd64-xen-only:
>>     variables:
>>       IMAGE: debian-amd64-cross
>>       ACCEL: xen
>> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
>>   cross-arm64-xen-only:
>>     extends: .cross_accel_build_job
>> @@ -195,4 +195,4 @@ cross-arm64-xen-only:
>>     variables:
>>       IMAGE: debian-arm64-cross
>>       ACCEL: xen
>> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
> 
> This patch looks wrong. I'm pretty sure we wanted to test the build 
> without TCG here. Building with TCG enabled is already done in other 
> jobs. So instead of removing "--disable-tcg" here the question is 
> rather: Why does it not build with this flag anymore? Can those problems 
> be fixed instead?

I concur, this used to work. Did this config bit-rotted?
The latest /master job succeeded:
https://gitlab.com/qemu-project/qemu/-/jobs/4094506462

