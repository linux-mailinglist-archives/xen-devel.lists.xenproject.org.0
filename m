Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D51E251D26
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 18:24:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAbjk-00062y-Qi; Tue, 25 Aug 2020 16:23:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzwT=CD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kAbji-00062t-Ss
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 16:23:51 +0000
X-Inumbo-ID: e7c6df65-7104-45a4-ad91-45c27331ab94
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7c6df65-7104-45a4-ad91-45c27331ab94;
 Tue, 25 Aug 2020 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Gj/tEjEN0x2QUfDb7Yo1pkeQW5Y3Xp6ebILsaf0khGk=; b=XxREGWhxhHUq+7MSYwvFQUMXrA
 qWuiAoO9nmc91LlmBLd34zI2bfAGsi/QUicimRHEuTqbaQ6aTHg+Ga13hVhAVtSf/W5h5N9oPq0uG
 DfBzK16HdYSDyxtAGaWKPJu4Kyit1i6DctI3PN6Ycn4rUpy6F9i4wJs74kJvux8m5krQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAbjh-0002vT-7F; Tue, 25 Aug 2020 16:23:49 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAbjg-0007U5-St; Tue, 25 Aug 2020 16:23:49 +0000
Subject: Re: [PATCH v3 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Andre Przywara <Andre.Przywara@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 nd <nd@arm.com>
References: <20200825100847.27988-1-wei.chen@arm.com>
 <20200825100847.27988-3-wei.chen@arm.com>
 <232c39d0-cae6-3b5b-1046-c5bc9f6b448e@xen.org>
 <AM0PR08MB37478E45D6FE9C76ED69A4A89E570@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0f841b29-75b0-0544-1d06-487aea17231c@xen.org>
Date: Tue, 25 Aug 2020 17:23:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB37478E45D6FE9C76ED69A4A89E570@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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



On 25/08/2020 15:29, Wei Chen wrote:
> Hi Julien,
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2020年8月25日 19:18
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Andre Przywara <Andre.Przywara@arm.com>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Penny Zheng <Penny.Zheng@arm.com>; Kaly
>> Xin <Kaly.Xin@arm.com>; nd <nd@arm.com>
>> Subject: Re: [PATCH v3 2/2] xen/arm: Throw messages for unknown FP/SIMD
>> implement ID
>>
>> Hi,
>>
>> On 25/08/2020 11:08, Wei Chen wrote:
>>> Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
>>> FP/SIMD implementations. Currently, we exactly know the meaning of
>>> 0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
>>> features presented. If there is a value 0x2 bumped in the future,
>>> Xen behaviors for value <= 0x1 can also take effect. But what Xen
>>> done for value <= 0x1 may not always cover new value 0x2 required.
>>> We throw these messages to break the silence when Xen detected
>>> unknown FP/SIMD IDs to notice user to check.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> OOI, is this reviewed-by coming from internal review?
> 
> Ahh. No, I remember Bertrand gave me a reviewed-by in v2, so I picked it.
> I had left OSS for a while, and forgot something. If I can't pick it directly, could
> you please tell me how can I handle such reviewed-by?

In general reviewed-by implies the code was reviewed carefully. They 
should only be carried to a new version if they changes are very trivial.

You can also ask the reviewer if he/she is happy with the changes you 
will make so you can carry the tag.

Cheers,

-- 
Julien Grall

