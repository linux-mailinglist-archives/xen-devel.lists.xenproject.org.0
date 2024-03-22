Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6724A886728
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 07:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696658.1087750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnYm8-0001w2-Pu; Fri, 22 Mar 2024 06:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696658.1087750; Fri, 22 Mar 2024 06:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnYm8-0001uG-NH; Fri, 22 Mar 2024 06:53:12 +0000
Received: by outflank-mailman (input) for mailman id 696658;
 Fri, 22 Mar 2024 06:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rnYm7-0001sK-Pi
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 06:53:11 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8b83d58-e818-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 07:53:10 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4707502aafso308521966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 23:53:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a1709060f4a00b00a472c4b9486sm460730ejj.84.2024.03.21.23.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 23:53:10 -0700 (PDT)
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
X-Inumbo-ID: d8b83d58-e818-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711090390; x=1711695190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqvOkYG7PGR/60T9a+vecv0YvaykQSrN8+SAoBmbKLY=;
        b=S1eNbyIDUJ6bbi9xHsp0pT+QF3ZZ7M7Ib7It7VSQNk6mHvNlXvW0NgjnN++ziqp3P0
         P+2RjmmYR1s2w0hbjBHRf5flSHHMOLuM92KDBlM3UvIELQUDcLvWukoEqIyU9pe3c11Y
         bo+qeGiLXqkTdeAn+KnC0RIEYPNLugF2vR+jDTwoXuo6VEAboIqDZWRR9RJqeRwg4HyD
         tAZF6a7dgbKnN/grKa9uQgu0acB1tUWeZYY/2dTk/bF7gxTtiG04B0EFVLurqPHMgcZ7
         3Cli4uZQKRH8Oeke/fHp/7nkmibBHhUI7m8A/s3LC1XAPud8lNxU+2YfoRTDYyMJ7cCb
         KSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711090390; x=1711695190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqvOkYG7PGR/60T9a+vecv0YvaykQSrN8+SAoBmbKLY=;
        b=eg2HGmiPX89weUDKyjrXnWv0IjFQekJ2Kq/JeCJaIuatlRlVI1qzny52T0Z9ccJM1t
         HaHkugOgUK6sPZJWCNKZlfBmJNhH/fH5YIvudaQHypGgLxg1Pf00f+PJAGVV89EYeZ/3
         qu8KS2cRc9+L3QxhuCaSNVOL52DltUC+2d4TrV3xL3OeLwGlIPqRu8O10Ig7wV7ebi4j
         z/2xuaRgL6YJADVZfH4giPnorfju2mFCeNAiodgUFmBQNHJ1PpoAcnCz4rlpWaSckOC4
         gVoBsZwiGW4H4Ckq5EbRePIJWMJxJ0S9T0zD9BOCzyVd41Nu66S5g8N7QYKHIEIk2vyz
         Hctw==
X-Forwarded-Encrypted: i=1; AJvYcCUcO44kSiztfx0Bu+q/A9QjZhWYK3AWJRDzYB/kSc6WzG2qXvASy72MUAPC2IxtnfZ81Iz2p3RBGDRHLahznr0Zrz9xGo3CRcCR0mfXKQ8=
X-Gm-Message-State: AOJu0YyYg6vDt6YvuE+u6MbfOgA+zmluCYvLGzQg9NqZr6yIN7BRP9SM
	RZTDu6RVw5TeZ65rkLrG2CDLwiHUkVsfV8HxjivUEZOveYtfIvr3466BmM1n4kc=
X-Google-Smtp-Source: AGHT+IFlkBu7bgRCcPm1ksy6ar+oWKKLT0QxCo9cXoRVYuAvIvMat/Nwchd03Pt+Yo+xx4szyR3oHw==
X-Received: by 2002:a17:907:940f:b0:a46:75d3:dd46 with SMTP id dk15-20020a170907940f00b00a4675d3dd46mr1107120ejc.17.1711090390380;
        Thu, 21 Mar 2024 23:53:10 -0700 (PDT)
Message-ID: <51389495-4b99-430b-9ae8-7f938af34bec@suse.com>
Date: Fri, 22 Mar 2024 07:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Remove duplicate include
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20240322063957.94159-1-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240322063957.94159-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.03.24 07:39, Jiapeng Chong wrote:
> ./arch/x86/xen/enlighten.c: linux/memblock.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8610
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


