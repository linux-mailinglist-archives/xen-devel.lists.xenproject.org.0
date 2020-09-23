Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B81A275F9F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 20:18:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL9Ku-0003hM-2N; Wed, 23 Sep 2020 18:17:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Zf1=DA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kL9Ks-0003hH-LU
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 18:17:46 +0000
X-Inumbo-ID: 9e8d6943-64b0-49dc-945d-2d87179b0006
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e8d6943-64b0-49dc-945d-2d87179b0006;
 Wed, 23 Sep 2020 18:17:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v23so477015ljd.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2020 11:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=xn98UKlScqAj1XUZr+ctQsuDmfaJqqsHsFGbM8Xnaw0=;
 b=p23RuNUZ2ebI8jzHLJenMajT0oheHIqPtxm+jTfpXh1DNUOlNXkiAUzbSsdbNzyKbu
 4I2G1id3q/cPGDJx0fdPHkKi6yzlCQSe8WRgVzEHC+MGpDL+nOme1fI+sBG3ZDOwBjCj
 xn0GITwc+iAZK1gJvXQStrrgmTGKnPtmPoaKVjhqNx6gDrj0hu7n8Sg9hxQmfXbQIl0O
 5fa4ZfgdrMGfSJ/BIBQGelisRX2X4QSESQDRcWptDm9LHyg05qJc6YiglyiwG8/+3l28
 7dmEKim9Hgb++bK5pi1p/ydKkTcJRZiSFYdplkSGf4QAb0c3xKc/aDKaT7u4t5OY0cj4
 +HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xn98UKlScqAj1XUZr+ctQsuDmfaJqqsHsFGbM8Xnaw0=;
 b=jwi/wlz3Dwpf0TuxSjiecVqixm0hwRQ4/UY5pdVWVTsX8aZTRGuLmthJtqudpG6uhE
 LaaCrQwwrK4f+VobUJB5yZIpEcWpvVomS2wmgo56hgH+dnon96o3eC9QpZF0f/1kO5My
 zHFtkYuACNeaXzFzdDx6yoJ7jmM++2V6x2m6RXlNdHi959YjHh/NjjCWpqvRNt33+IS2
 Vam10SPqMaKDMC/LA0+zEyKCJwyJ22EPOx5AbFmTn/8W/KC3+89a0dAo7C1YviqET1/k
 9K5ZoTs/TuibNbLr4dQWBpNFavYXpxN/FWU+O7A6U+A2z9LhBh05Ra3ax8wpNtUSuUnX
 56yQ==
X-Gm-Message-State: AOAM532dIE2RVRPfxevxQKlliqZsNDh2AcxX5x4MH9x3LMbfbR0jmT8M
 N3ExlIKi4K+BGpsnb5Ofp+s=
X-Google-Smtp-Source: ABdhPJyGxdUXR2Nbw44+4LgtfiVr5iz0c7+atvi4NDpSNkAYQHJRuEqJxiGv9EZ6qV37I0fCTs7p1A==
X-Received: by 2002:a2e:b8c8:: with SMTP id s8mr386222ljp.127.1600885064579;
 Wed, 23 Sep 2020 11:17:44 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j20sm278664lfe.181.2020.09.23.11.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 11:17:44 -0700 (PDT)
Subject: Re: [PATCH V1 04/16] xen/ioreq: Provide alias for the handle_mmio()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-5-git-send-email-olekstysh@gmail.com>
 <2987ed77-cd8b-52af-5221-c780c82668ba@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3ef49b73-ea59-2818-1fdf-1157cd79fcbb@gmail.com>
Date: Wed, 23 Sep 2020 21:17:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2987ed77-cd8b-52af-5221-c780c82668ba@xen.org>
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


On 23.09.20 20:28, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>
> On 10/09/2020 21:21, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The IOREQ is a common feature now and Arm will have its own
>> implementation.
>>
>> But the name of the function is pretty generic and can be confusing
>> on Arm (we already have a try_handle_mmio()).
>>
>> In order not to rename the function (which is used for a varying
>> set of purposes on x86) globally and get non-confusing variant on Arm
>> provide an alias ioreq_handle_complete_mmio() to be used on common and
>> Arm code.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>
> This doesn't  look like a code I wrote... Can you make sure I am only 
> credited on what I wrote?

I am sorry, for the next series I will re-check all patches.


-- 
Regards,

Oleksandr Tyshchenko


