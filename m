Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292A6A8B57
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 22:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505453.778247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXqwQ-0001ZG-Rz; Thu, 02 Mar 2023 21:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505453.778247; Thu, 02 Mar 2023 21:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXqwQ-0001Wg-PH; Thu, 02 Mar 2023 21:58:22 +0000
Received: by outflank-mailman (input) for mailman id 505453;
 Thu, 02 Mar 2023 21:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pWRm=62=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pXqwP-0001Wa-5p
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 21:58:21 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b51cfd-b945-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 22:58:18 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id j2so503146wrh.9
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 13:58:17 -0800 (PST)
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 v38-20020a05600c4da600b003eb68bb61c8sm379710wmp.3.2023.03.02.13.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 13:58:16 -0800 (PST)
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
X-Inumbo-ID: 56b51cfd-b945-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677794297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UDZswf4uEzany5QrvvRK53tLE5TnRjTJMGZStuNH0Pg=;
        b=c01Qm5CA9+skyR4wswaewku8HTJNl4WNaS20D2CpfxO8Uapb8pd235XipMTAOE02zw
         Cf4NYqj702NtkNau1gYU37Byl3EPPUAKBRw1uNCD81j5DgdZNqraJA/oFGGWMbclPFiV
         DYrrtY6VGcs2l8S7aa9xhojKYEh1kjIfhFUH9W4QLFbjVFcVenWwr5lmk7WlpqpTMyjp
         iLduF8H0R2/o+Rt2x2YFylbTqEkz2DCf4I0tA28QEeW6HPm1RJhXtrnLdV4rh14FyL4M
         YGDf3Z6clOtE5jjImbqk4OJ77rw93+m0J8x5rH3g3miRBOziwW3AasfpHoscXGq3br7h
         HPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677794297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UDZswf4uEzany5QrvvRK53tLE5TnRjTJMGZStuNH0Pg=;
        b=2jQhyLWH0dSRnkyNfhmxm1vbkqSiZuS/uG+rYmX5yGidTQ+hDC9eRDpqrblf+GllSy
         IiVVmNJAYcxBBHlV1rANzV09pcCD8xWmc0qeODQHg9jBNhFdPxkzl1Hwbhp6Ldedveac
         AjQ5E6ocLSpq8bcq6uiu3/mEqVElY+pOxKANQpu4Ez0geo4ytvvFpEB+vrWmyzVaVV+4
         EuGTsKun92yvuJYzdlgJlYiL7WYJi+vAWaQUkdELwubExxu5QaABukQVJRphf8yU3tma
         aGz6FMPxm2SjT+NEmnU4O8QFOooBO8OgoMR30bNbUafDTKS/Ow14tbHbLYDUwUMod8vj
         dYlg==
X-Gm-Message-State: AO0yUKWV8agYSlg7z+pt4/+ascP3F4Ae/AZDemV6977Zbqp8ps/vGp+Q
	4nFUS3A2Fe7yrJprV5HGsJ2GoA==
X-Google-Smtp-Source: AK7set9XlppTHh6P/NYuUA8627xDZx2JgibTevKCtg80T+5uYqzA7ofikej3nH5tro9swhHZf/7amg==
X-Received: by 2002:a5d:6e01:0:b0:2c7:1c36:3c6e with SMTP id h1-20020a5d6e01000000b002c71c363c6emr8454808wrz.64.1677794297289;
        Thu, 02 Mar 2023 13:58:17 -0800 (PST)
Message-ID: <7d696728-be96-c720-2db9-b93a5a352d1f@linaro.org>
Date: Thu, 2 Mar 2023 22:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm
 system emulation jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-7-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163106.465559-7-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/3/23 17:31, Thomas Huth wrote:
> Hardly anybody still uses 32-bit arm environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 14 --------------
>   1 file changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


