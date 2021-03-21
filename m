Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B3343376
	for <lists+xen-devel@lfdr.de>; Sun, 21 Mar 2021 17:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99765.189698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lO0z4-0003co-O7; Sun, 21 Mar 2021 16:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99765.189698; Sun, 21 Mar 2021 16:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lO0z4-0003cJ-JG; Sun, 21 Mar 2021 16:31:22 +0000
Received: by outflank-mailman (input) for mailman id 99765;
 Sun, 21 Mar 2021 16:31:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6VPd=IT=amazon.com=prvs=7076807ca=andyhsu@srs-us1.protection.inumbo.net>)
 id 1lO0z3-0003cD-29
 for xen-devel@lists.xenproject.org; Sun, 21 Mar 2021 16:31:21 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0f2a1a4-bfed-44b9-9ab1-c3bd123db180;
 Sun, 21 Mar 2021 16:31:19 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 21 Mar 2021 16:31:13 +0000
Received: from EX13D12EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id AB7991A01BD; Sun, 21 Mar 2021 16:31:11 +0000 (UTC)
Received: from 147dda3ee008.ant.amazon.com (10.43.165.62) by
 EX13D12EUA002.ant.amazon.com (10.43.165.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Sun, 21 Mar 2021 16:31:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d0f2a1a4-bfed-44b9-9ab1-c3bd123db180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616344280; x=1647880280;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=/YenUM5sZuq/Q41I5eoUqo3Fp3T8FhBehiqwfNkqKUY=;
  b=RKGyQ5NwT7DdP6Eq+Mi5YMGOKn2VZV4nVVttiSmCHHGPmF5cfTAlS3Rt
   MSfIaQvUlPc/phImK7c57CG0zV2f+4y9D1a9jDtiobIgvf93G9uv4RvEx
   oxIP2kRfWbe+d+kYf5BNWrHz9HFG+fNQe8+lxE1XE3N0JfYaFtlGc6TbV
   8=;
X-IronPort-AV: E=Sophos;i="5.81,266,1610409600"; 
   d="scan'208";a="96528257"
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable ctrl-ring
To: Leon Romanovsky <leon@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, <netdev@vger.kernel.org>,
	<wei.liu@kernel.org>, <paul@xen.org>, <davem@davemloft.net>,
	<kuba@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch> <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
 <YEvQ6z5WFf+F4mdc@lunn.ch> <YE3foiFJ4sfiFex2@unreal>
 <64f5c7a8-cc09-3a7f-b33b-a64d373aed60@amazon.com> <YFI676dumSDJvTlV@unreal>
From: "Hsu, Chiahao" <andyhsu@amazon.com>
Message-ID: <f3b76d9b-7c82-d3bd-7858-9e831198e33c@amazon.com>
Date: Sun, 21 Mar 2021 17:31:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFI676dumSDJvTlV@unreal>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.43.165.62]
X-ClientProxiedBy: EX13D08EUB004.ant.amazon.com (10.43.166.158) To
 EX13D12EUA002.ant.amazon.com (10.43.165.103)
Precedence: Bulk



Leon Romanovsky 於 2021/3/17 18:22 寫道:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
> On Tue, Mar 16, 2021 at 04:22:21PM +0100, Hsu, Chiahao wrote:
>>
>> Leon Romanovsky 於 2021/3/14 11:04 寫道:
>>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>>>
>>>
>>>
>>> On Fri, Mar 12, 2021 at 09:36:59PM +0100, Andrew Lunn wrote:
>>>> On Fri, Mar 12, 2021 at 04:18:02PM +0100, Hsu, Chiahao wrote:
>>>>> Andrew Lunn 於 2021/3/12 15:52 寫道:
>>>>>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>>>>>>
>>>>>>
>>>>>>
>>>>>> On Thu, Mar 11, 2021 at 10:59:44PM +0000, ChiaHao Hsu wrote:
>>>>>>> In order to support live migration of guests between kernels
>>>>>>> that do and do not support 'feature-ctrl-ring', we add a
>>>>>>> module parameter that allows the feature to be disabled
>>>>>>> at run time, instead of using hardcode value.
>>>>>>> The default value is enable.
>>>>>> Hi ChiaHao
>>>>>>
>>>>>> There is a general dislike for module parameters. What other mechanisms
>>>>>> have you looked at? Would an ethtool private flag work?
>>>>>>
>>>>>>         Andrew
>>>>> Hi Andrew,
>>>>>
>>>>> I can survey other mechanisms, however before I start doing that,
>>>>>
>>>>> could you share more details about what the problem is with using module
>>>>> parameters? thanks.
>>>> It is not very user friendly. No two kernel modules use the same
>>>> module parameters. Often you see the same name, but different
>>>> meaning. There is poor documentation, you often need to read the
>>>> kernel sources it figure out what it does, etc.
>>> +1, It is also global parameter to whole system/devices that use this
>>> module, which is rarely what users want.
>>>
>>> Thanks
>> Hi,
>> I think I would say the current implementation(modparams) isappropriate
>> after reviewing it again.
>>
>> We are talking about 'feature leveling', a way to support live migrationof
>> guest
>> between kernels that do and do not support the features. So we want to
>> refrain
>> fromadding the features if guest would be migrated to the kernel which does
>> not support the feature. Everythingshould be done (in probe function) before
>> frontend connects, and this is why ethtool is not appropriate for this.
> It wouldn't be a surprise to you that feature discovery is not supposed
> to be done through module parameters. Instead of asking from user to
> randomly disable some feature, the system is expected to be backward
> compatible and robust enough to query the list of supported/needed
> features.
>
> Thanks
>
>> Thanks
>>
>>
Typically there should be one VM running netback on each host,
and having control over what interfaces or features it exposes is also 
important for stability.
How about we create a 'feature flags' modparam, each bits is specified 
for different new features?


