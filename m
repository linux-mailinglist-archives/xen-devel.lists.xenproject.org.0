Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9760611B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426744.675395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVJD-0007JG-92; Thu, 20 Oct 2022 13:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426744.675395; Thu, 20 Oct 2022 13:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVJD-0007Fv-5s; Thu, 20 Oct 2022 13:10:03 +0000
Received: by outflank-mailman (input) for mailman id 426744;
 Thu, 20 Oct 2022 13:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2/78=2V=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olVJB-000716-BE
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:10:01 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80c52a4d-5078-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 15:10:00 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id a3so34292301wrt.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 06:10:00 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 q47-20020a05600c332f00b003c3a1d8c8e6sm2654065wmp.19.2022.10.20.06.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:09:59 -0700 (PDT)
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
X-Inumbo-ID: 80c52a4d-5078-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=112G7FXUBLWBLmsXv3bUPwIWqEcI9Lpi3IXFw2eDA10=;
        b=S1CHrYTn1E97XAKKQAM+0ly6EYOZqrrUaXHXp0+Z0tvcHE6JX0p0jddHHlR+V5t8lF
         q5w+V0ZvwhWgyL0qIxi9dAph+CXF/R76CeR1Npr4fie1L7SX4OAtCJMXYEbmGMl2kWI6
         qbUbTrm7kAQJwgRr5ZoI7l/jjyn5j0A6d++FPG0Q2Vrk2f1z9ua5aFPcHOumxCHMtZNc
         /MybkUUJokaPOHGtITyR/EggMwfgeqvw7mlv7IcTkX3e4f6mIPluukA+pSrJsh6wiTsv
         CPKirqJjiDSA8fm3EBP3X5NUS700aqVbsQkruT1ek1zF54eHesTTuSVPYegkFXc2hQsz
         KHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=112G7FXUBLWBLmsXv3bUPwIWqEcI9Lpi3IXFw2eDA10=;
        b=rud/teqGhHSWPs0fdPswy16WUKJ7cTwKKMV7ZcMvrywfjoQiLyD5MxwfiP0ldGtZD4
         erKQD0PRWzQDVIyEmTp0c+4/f6xOU2pYDIQeOw/UCJnpudsijL+8R4+KGP2IhW3bODwc
         vJbr/A3mSTErnyXCP4IAPJtpufWBQlvPSS6rX/obqfbsd3EKq0s+L3iWIK73m87e/VGv
         O1TQKQG/dYQXG/jAF0fnJ43JxfTOT8LDaDhD4BQEneWXsOxemGwZ/ZTvAuJZ9AhO4tRu
         yMcPc8F66YJ1QSyHxSxRCb92+nnRkmZ+mEaY3z8oz1onfVKmdEKTWFizxtYAtguys7fR
         iwhQ==
X-Gm-Message-State: ACrzQf3QMseVWz2Ifs9PpksijppIpIb71S67Dg6RYqJ8jCiLU0uxoWZ/
	Q1CdCTG+G9dtnDKFcyiK8oyZkA==
X-Google-Smtp-Source: AMsMyM6epb9tN4+sHmwu/vScpA0+w9QEBcSZ3ewUAKeg3HiQCQ/DmHk/XgG0KrzdX/a3bI+2jfIPHw==
X-Received: by 2002:a5d:52d0:0:b0:21e:4923:fa09 with SMTP id r16-20020a5d52d0000000b0021e4923fa09mr8773973wrv.244.1666271400221;
        Thu, 20 Oct 2022 06:10:00 -0700 (PDT)
Message-ID: <3c1d85f0-521b-7ea8-2138-c2b93cd39c15@linaro.org>
Date: Thu, 20 Oct 2022 15:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 15/17] net: stream: move to QIO to enable additional
 parameters
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-16-lvivier@redhat.com>
 <86d3bbf2-375c-801c-1576-60eeddad6178@linaro.org>
In-Reply-To: <86d3bbf2-375c-801c-1576-60eeddad6178@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/22 13:05, Philippe Mathieu-Daudé wrote:
> On 20/10/22 11:16, Laurent Vivier wrote:
>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>> This allows net/stream to use all the available parameters provided by
>> SocketAddress.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   meson           |   2 +-
>>   net/stream.c    | 493 +++++++++++++++++-------------------------------
>>   qemu-options.hx |   4 +-
>>   3 files changed, 180 insertions(+), 319 deletions(-)
>>
>> diff --git a/meson b/meson
>> index 3a9b285a55b9..12f9f04ba0de 160000
>> --- a/meson
>> +++ b/meson
>> @@ -1 +1 @@
>> -Subproject commit 3a9b285a55b91b53b2acda987192274352ecb5be
>> +Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
> 
> Probably unrelated submodule update?

Likely because I'm getting:

../../meson.build:1:0: ERROR: Meson version is 0.59.3 but project 
requires >=0.61.3



