Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66601BE1F2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 17:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jToFf-0002uN-U8; Wed, 29 Apr 2020 15:03:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2IrC=6N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jToFe-0002uI-Gn
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 15:03:54 +0000
X-Inumbo-ID: a44f7d52-8a2a-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a44f7d52-8a2a-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xcbd0ibdT6Qilva0QIS3QsLb+OTzX7FjV7RwU7OlFgM=; b=YOqxTH17sT9mU9q1Wb/X28jBkC
 VO0X6lDp6n2rsKyYo7iUsysCNQgs8aMo4p6p1NM89FQ936xwWdNnVHG48QXCoK3wWx5GzNUj7gNxo
 ehR6unvfUPHx43JYPJvbmp2NP6XiMIc8ST9VTkyLmv/ihJujXiGkqptX4RSCi8OfIbos=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jToFa-0003pI-AM; Wed, 29 Apr 2020 15:03:50 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jToFa-0002bm-30; Wed, 29 Apr 2020 15:03:50 +0000
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
To: Jan Beulich <jbeulich@suse.com>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
 <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
 <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
 <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
 <c8e66108-7ac1-fb51-841f-21886b731f04@xen.org>
 <f02f09ec-b643-8321-e235-ce0ee5526ab3@suse.com>
 <69deb8f4-bafe-734c-f6fa-de41ecf539d2@xen.org>
 <c38f4581-42a6-bb4a-1f84-066528edd3ee@xen.org>
 <48d591a8-ce4f-2952-19f8-983637c9cfa5@suse.com>
 <208798a2-e0e5-916f-cf8d-31a976fa3e39@xen.org>
 <a3e48e70-0fff-c4dc-1e46-4e436e8b84e2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a5c64ae8-5a32-1616-df34-30efb0dfb8de@xen.org>
Date: Wed, 29 Apr 2020 16:03:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a3e48e70-0fff-c4dc-1e46-4e436e8b84e2@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 29/04/2020 15:54, Jan Beulich wrote:
> On 29.04.2020 16:13, Julien Grall wrote:
>> So can you please have another and explain how the line can be drawn with just two architectures in place.
> 
> There are abstract considerations that can be used to draw the
> line, as well as knowledge of people on architectures Xen doesn't
> run on, but where one can - with such knowledge - extrapolate how
> it would want to be implemented.
 >
> I don't think the question at this point is where to draw the
> line, but whether to have asm-generic/ in the first place.

Well the two come together. You can't add a new directory with no clear 
view how this is going to be used.

At the moment, this would result at best bikeshedding because 
developpers may have a different opinion on how a new architecture would 
be implemented in Xen.

If you have a 3rd architectures then it would be easier to argue the 
header should be added in asm-generic/ or xen/:
    - asm-generic/ should be used if 2 of the architectures are using 
the same interface
    - xen/ should be if the 3 architectures are using the same interface

Cheers,

-- 
Julien Grall

