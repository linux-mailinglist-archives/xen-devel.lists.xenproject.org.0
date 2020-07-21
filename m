Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ACB22880E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 20:17:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxwoZ-0007qV-Gw; Tue, 21 Jul 2020 18:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhFK=BA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jxwoX-0007qQ-VR
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:16:30 +0000
X-Inumbo-ID: 4bafde9b-cb7e-11ea-859b-bc764e2007e4
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bafde9b-cb7e-11ea-859b-bc764e2007e4;
 Tue, 21 Jul 2020 18:16:29 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h22so25091909lji.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ghgcnfJ7kfPCIJeWCLlLLzJzBObkZ6CFvEmgHiR5fpU=;
 b=FHoj2GBFieqignXTbxCB+0wkPeEL+vka6roLWyC0UrwI8So9NsftB0Se9hWh45v88a
 nOKYri7Zbv9iBdKl2tXG6Upyl411svPay1tgDHPw7ZpcQYerdF13++lqVgn+0ccqrX4h
 6aScQGJeeozOJsX7eU1XgfTQ+SLYHWwLYGYxcB8VIfTj4wgxwf+h+4/Yb/oa95lrm8ih
 vYqcTyLk/sLtfmJiSeguhame9/gwDGNhP0PpT89D53pacjbWhQAdKxSf9MacNnlX0X7K
 q3C7z/6c7050lwKeVNXvOIAhIiAI6P+ERmNsbQTMOr7P7xbTsTRrwyvs218ptHYpT41i
 ucGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ghgcnfJ7kfPCIJeWCLlLLzJzBObkZ6CFvEmgHiR5fpU=;
 b=IRcprdl5a0yfWOD8oDqOpd6J4JjMmXQDj+jn3aifkmBjAwknovmc/AdqEC/lbuy2Z8
 hY3jraCFFcr38fu+BkGO7fhr0wPja5kPWkqUBISqUw2hwDmje9eRRQsQguXMg1TWuGN0
 R7smI9kIurlJnLD1BJSHNRXiiXReN5QSr6OJKjG3+usF+tb2DPuiZViUkphnCMTgjAbj
 pljpPJJdovxIiYOkMoI+pXo3KJZdd2AbcxsbrI21TOfkNw8ncgFpUoijzjDGJ4Y6uM1+
 ptuj5czzj/e8l/554kQTKldeEpxbQIaQ6Ki61Q3vI93qN+9suMNIeYcFOJxS67T7R1GG
 1Xqg==
X-Gm-Message-State: AOAM533d/dXNr0HI+ooIVewXgpCtd81wJFdLmsu9fUw4PkNk/8Gq9mC2
 DjnXblSYPeDpjjOZRH639eU=
X-Google-Smtp-Source: ABdhPJz36GWHMGv84VN14p7ikCiTsMkejxPKOC8xAHrfxJX8r9Dbh3AIonidQGZz3pK6x6YM78OICA==
X-Received: by 2002:a2e:50b:: with SMTP id 11mr13921574ljf.458.1595355387971; 
 Tue, 21 Jul 2020 11:16:27 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r14sm2074466lfe.29.2020.07.21.11.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 11:16:27 -0700 (PDT)
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: Julien Grall <julien@xen.org>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b6cf0931-c31e-b03b-3995-688536de391a@gmail.com>
Date: Tue, 21 Jul 2020 21:16:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 21.07.20 17:27, Julien Grall wrote:
> Hi,

Hello


>
> On a similar topic, I am a bit surprised you didn't encounter memory 
> exhaustion when trying to use virtio. Because on how Linux currently 
> works (see XSA-300), the backend domain as to have a least as much RAM 
> as the domain it serves. For instance, you have serve two domains with 
> 1GB of RAM each, then your backend would need at least 2GB + some for 
> its own purpose.
>
> This probably wants to be resolved by allowing foreign mapping to be 
> "paging" out as you would for memory assigned to a userspace. 

Didn't notice the last sentence initially. Could you please explain your 
idea in detail if possible. Does it mean if implemented it would be 
feasible to map all guest memory regardless of how much memory the guest 
has? Avoiding map/unmap memory each guest request would allow us to have 
better performance (of course with taking care of the fact that guest 
memory layout could be changed)... Actually what I understand looking at 
kvmtool is the fact it does not map/unmap memory dynamically, just 
calculate virt addresses according to the gfn provided.


-- 
Regards,

Oleksandr Tyshchenko


