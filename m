Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF111EE7E9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 17:39:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgrxC-0005kF-A5; Thu, 04 Jun 2020 15:38:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZ5H=7R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jgrxA-0005kA-6Y
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 15:38:48 +0000
X-Inumbo-ID: 7afd8848-a679-11ea-aeb0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7afd8848-a679-11ea-aeb0-12813bfff9fa;
 Thu, 04 Jun 2020 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eyBkw7dJwBtByMaT7riuWQsouHwxln5MXJ2TYAmqFRE=; b=DDjCM/y/CGJDuVyBsNuVWdxW9o
 VJ87P1PgHFrJ5zWanRH9+qYjV220WXnMIHnHrm7nI9RKcQBgPxw2k9xjNaAthHqdobYe453fv9S5p
 VFpYYnahyyAEsVIihWdSaVa4jRB5ViLoxdx73VBkgY7qAo+5vo68Wm4u0Y2AYAj3V6CA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgrx8-00089H-D0; Thu, 04 Jun 2020 15:38:46 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgrx8-0008Vz-6X; Thu, 04 Jun 2020 15:38:46 +0000
Subject: Re: UEFI support in ARM DomUs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Peng Fan <peng.fan@nxp.com>, Roman Shaposhnik <roman@zededa.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dc3998f3-5fa1-9b97-12cd-a1e3bb29eee5@xen.org>
Date: Thu, 4 Jun 2020 16:38:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
 Nataliya Korovkina <malus.brandywine@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 04/06/2020 16:26, Oleksandr Andrushchenko wrote:
> On 6/4/20 4:57 AM, Peng Fan wrote:
>> Grall <julien@xen.org>;
>>> Nataliya Korovkina <malus.brandywine@gmail.com>
>>> Subject: UEFI support in ARM DomUs
>> We have made U-Boot run inside XEN DomU, but just only PV console part,
>> not implement other frontend drivers currently. Would this help for your
>> case if enable EFI in U-Boot?
> 
> Well, we have a working PV block implementation on top of that on iMX8

That's a nice work and will be a good addition. However...

> 
> platform, mostly ported from mini-os. Currently we are finalizing the work

... AFAICT mini-os is licensed using BSD-2 while U-boot is using GPLv2. 
So I would be careful with the licensing here.

It might be better to consider to port Linux PV driver instead or 
rewrite them completely.

Cheers,

-- 
Julien Grall

