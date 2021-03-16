Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5433D740
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 16:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98367.186582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBWl-00062o-Gf; Tue, 16 Mar 2021 15:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98367.186582; Tue, 16 Mar 2021 15:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBWl-00062P-D3; Tue, 16 Mar 2021 15:22:35 +0000
Received: by outflank-mailman (input) for mailman id 98367;
 Tue, 16 Mar 2021 15:22:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UiAx=IO=amazon.com=prvs=702ce7336=andyhsu@srs-us1.protection.inumbo.net>)
 id 1lMBWk-00062K-Ot
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 15:22:34 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7eb9bcfe-b68c-4075-9c1e-b7ae4c5f17c2;
 Tue, 16 Mar 2021 15:22:33 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-456ef9c9.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 16 Mar 2021 15:22:25 +0000
Received: from EX13D12EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-456ef9c9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0861EA7AF9; Tue, 16 Mar 2021 15:22:23 +0000 (UTC)
Received: from 147dda3ee008.ant.amazon.com (10.43.165.192) by
 EX13D12EUA002.ant.amazon.com (10.43.165.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 16 Mar 2021 15:22:22 +0000
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
X-Inumbo-ID: 7eb9bcfe-b68c-4075-9c1e-b7ae4c5f17c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615908154; x=1647444154;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=q5kbSbegqpzzJVt427pixcj7nixefER90+FzIpRlpB8=;
  b=CnKppP079/z2Mt9hxlBR9CqwHY3XruWxwHY0AtgGduZV0PpRNij5zl/X
   gaPC5e5zWyPjOpIiQFhJDuR92t9nZ6zEe/iOAR5jkZoiIGxhPaPQN0hHV
   lFXpyQbec/pEtR4ZHHjFeBOr/ciz3vUXIDHxqf4Y2bMDOD2JK+mEFq0nm
   I=;
X-IronPort-AV: E=Sophos;i="5.81,251,1610409600"; 
   d="scan'208";a="94984210"
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable ctrl-ring
To: Leon Romanovsky <leon@kernel.org>, Andrew Lunn <andrew@lunn.ch>
CC: <netdev@vger.kernel.org>, <wei.liu@kernel.org>, <paul@xen.org>,
	<davem@davemloft.net>, <kuba@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch> <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
 <YEvQ6z5WFf+F4mdc@lunn.ch> <YE3foiFJ4sfiFex2@unreal>
From: "Hsu, Chiahao" <andyhsu@amazon.com>
Message-ID: <64f5c7a8-cc09-3a7f-b33b-a64d373aed60@amazon.com>
Date: Tue, 16 Mar 2021 16:22:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YE3foiFJ4sfiFex2@unreal>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.43.165.192]
X-ClientProxiedBy: EX13D01EUA004.ant.amazon.com (10.43.165.123) To
 EX13D12EUA002.ant.amazon.com (10.43.165.103)
Precedence: Bulk



Leon Romanovsky 於 2021/3/14 11:04 寫道:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
> On Fri, Mar 12, 2021 at 09:36:59PM +0100, Andrew Lunn wrote:
>> On Fri, Mar 12, 2021 at 04:18:02PM +0100, Hsu, Chiahao wrote:
>>> Andrew Lunn 於 2021/3/12 15:52 寫道:
>>>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>>>>
>>>>
>>>>
>>>> On Thu, Mar 11, 2021 at 10:59:44PM +0000, ChiaHao Hsu wrote:
>>>>> In order to support live migration of guests between kernels
>>>>> that do and do not support 'feature-ctrl-ring', we add a
>>>>> module parameter that allows the feature to be disabled
>>>>> at run time, instead of using hardcode value.
>>>>> The default value is enable.
>>>> Hi ChiaHao
>>>>
>>>> There is a general dislike for module parameters. What other mechanisms
>>>> have you looked at? Would an ethtool private flag work?
>>>>
>>>>        Andrew
>>>
>>> Hi Andrew,
>>>
>>> I can survey other mechanisms, however before I start doing that,
>>>
>>> could you share more details about what the problem is with using module
>>> parameters? thanks.
>> It is not very user friendly. No two kernel modules use the same
>> module parameters. Often you see the same name, but different
>> meaning. There is poor documentation, you often need to read the
>> kernel sources it figure out what it does, etc.
> +1, It is also global parameter to whole system/devices that use this
> module, which is rarely what users want.
>
> Thanks

Hi,
I think I would say the current implementation(modparams) isappropriate
after reviewing it again.

We are talking about 'feature leveling', a way to support live 
migrationof guest
between kernels that do and do not support the features. So we want to 
refrain
fromadding the features if guest would be migrated to the kernel which does
not support the feature. Everythingshould be done (in probe function) before
frontend connects, and this is why ethtool is not appropriate for this.

Thanks



