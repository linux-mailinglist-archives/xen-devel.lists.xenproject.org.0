Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D05275701
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 13:18:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL2mH-0004wu-El; Wed, 23 Sep 2020 11:17:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL2mF-0004wp-Np
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 11:17:35 +0000
X-Inumbo-ID: deb1f2ff-5d67-46ca-9e39-1863d028a88d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id deb1f2ff-5d67-46ca-9e39-1863d028a88d;
 Wed, 23 Sep 2020 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=gyzusQ892ae2saBCoPdnHHzEGuSl73uRrJAuYOXohMs=; b=jPg9NhgKspzNt67Q4+uODFzg7l
 eCRwkk8FjKFXaFxgCVkRSfgsN4vcemauv3CsEoJNVNXjG0CaWN9mFTlK2JBuV1KRQWp+p5Fu2KNLB
 y681wqGcCS91q7ZHV8XnCvhACm6yxgLxG3DSj01wjOryoKF9M8Vr9g2/wHPT8M0cEiEU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL2mA-0008SB-EU; Wed, 23 Sep 2020 11:17:30 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL2mA-0003Ot-4i; Wed, 23 Sep 2020 11:17:30 +0000
Subject: Re: [PATCH] SUPPORT.MD: Clarify the support state for the Arm
 SMMUv{1, 2} drivers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200923082832.20038-1-julien@xen.org>
 <1D6392F2-F4EC-4025-A793-22EABF85AA0E@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3c64f36f-6b43-6f73-e344-70b084f1f505@xen.org>
Date: Wed, 23 Sep 2020 12:17:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1D6392F2-F4EC-4025-A793-22EABF85AA0E@arm.com>
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



On 23/09/2020 11:50, Bertrand Marquis wrote:
> Hi,
> 
>> On 23 Sep 2020, at 09:28, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> SMMUv{1, 2} are both marked as security supported, so we would
>> technically have to issue an XSA for any IOMMU security bug.
>>
>> However, at the moment, device passthrough is not security supported
>> on Arm and there is no plan to change that in the next few months.
>>
>> Therefore, mark Arm SMMUv{1, 2} as supported but not security supported.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks!

> We will publish in the next week a first implementation of SMMUv3 support which might make sense to have fully Supported.

I am not sure whether you include security supported in your "fully 
supported"

However, I would consider to follow the same model as we did with the 
IPMMU. The driver would first be marked as a technical preview to allow 
more testing in the community.

Cheers,

-- 
Julien Grall

