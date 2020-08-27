Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA59254C8B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 20:05:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBMGj-0000VP-Uj; Thu, 27 Aug 2020 18:05:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Y6=CF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kBMGj-0000VK-6S
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 18:05:01 +0000
X-Inumbo-ID: d3d95d20-c4e3-4e90-895b-664fca0a11f4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3d95d20-c4e3-4e90-895b-664fca0a11f4;
 Thu, 27 Aug 2020 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=0IOmSeruIBnimGB7WcjG0RZiBtNz9R9F+E/gzlAjHSw=; b=V8j2gDpGhxJmrUBjVplbHctGo4
 6umYzsDGTAY8MWUUkYMW2wyDdEui9pLAxvwSGv+6bjv2My8uaijfY3IM6cElWgpUyeWS98rY3AJPh
 2v0/3a3cYKFzBytrkVJgn5SxL5YKysKrleXSvIUQu2z+PLy6RKksaHrYm9OdvfVdFT5Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBMGi-0005KM-13; Thu, 27 Aug 2020 18:05:00 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBMGh-0003zc-Pn; Thu, 27 Aug 2020 18:04:59 +0000
Subject: Re: [PATCH v4 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Andre.Przywara@arm.com, Bertrand.Marquis@arm.com, Penny.Zheng@arm.com,
 Kaly.Xin@arm.com, nd@arm.com
References: <20200825160603.32388-1-wei.chen@arm.com>
 <20200825160603.32388-3-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <223cc698-5c8d-dcf3-a4c1-8dee5521af7b@xen.org>
Date: Thu, 27 Aug 2020 19:04:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825160603.32388-3-wei.chen@arm.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 25/08/2020 17:06, Wei Chen wrote:
> Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
> FP/SIMD implementations. Currently, we exactly know the meaning of
> 0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
> features presented. If there is a value 0x2 bumped in the future,
> Xen behaviors for value <= 0x1 can also take effect. But what Xen
> done for value <= 0x1 may not always cover new value 0x2 required.
> We throw these messages to break the silence when Xen detected
> unknown FP/SIMD IDs to notice user to check.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

