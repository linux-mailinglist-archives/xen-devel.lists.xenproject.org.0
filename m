Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2963FA50E
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 12:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174268.317889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJvq7-0006TC-3l; Sat, 28 Aug 2021 10:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174268.317889; Sat, 28 Aug 2021 10:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJvq7-0006QX-0M; Sat, 28 Aug 2021 10:45:31 +0000
Received: by outflank-mailman (input) for mailman id 174268;
 Sat, 28 Aug 2021 10:45:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJvq4-0006QR-Qw
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 10:45:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJvq4-0003xg-Ai; Sat, 28 Aug 2021 10:45:28 +0000
Received: from home.octic.net ([81.187.162.82]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJvq4-0003c2-5D; Sat, 28 Aug 2021 10:45:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=/ShJP79KuCy/+Q/0kLzqsW30wss3MuIgVPUwmdfEVBE=; b=GBKTikBWD9aiUTRqs5VDEsS4O6
	FqcLTIh+UDxLB+qinstbqtoMJfJ7Hl5Dpsrwg3AkRcRaMAxSmJKuX84wS0xJuoKb1JzBUZyJWjcl4
	GScsZwrWk7SbHtnTQUktIcwD3KM/Bd9s8AdPBiLrl8kzpXTHsL/HA+Ilk9woAdinA7cU=;
Subject: Re: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in
 system init
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-39-wei.chen@arm.com>
 <86469c72-68d0-2a30-66ef-497884125437@xen.org>
 <DB9PR08MB68570138E19683934DA86B1B9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0b4ac394-03c4-9ed7-29cd-339090ae5768@xen.org>
Date: Sat, 28 Aug 2021 11:45:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB68570138E19683934DA86B1B9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 28/08/2021 04:17, Wei Chen wrote:
> Hi Julien,

Hi Wei,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月27日 22:33
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA
>> in system init
>>
>> Hi Wei,
>>
>> On 11/08/2021 11:24, Wei Chen wrote:
>>> Everything is ready, we can remove the fake NUMA node and
>>> depends on device tree to create NUMA system.
>>
>> So you just added code a few patches before that are now completely
>> rewritten. Can you please re-order this series so it doesn't happen?
>>
>> This may mean that CONFIG_NUMA is only selected until late in this series.
>>
> 
> Why I did like this is because my original concerns are:
> 1. When I introduced the CONFIG_NUMA. Users will be using a code base on
>     this commit by accident.
> 2. If users select CONFIG_NUMA, but not all NUMA data are not initialized
>     properly. The system may not work properly.

We have to make sure we don't break any existing use case when writing a 
new feature. However, a user should not expect a new feature to work it 
is using a random commit in the middle of the series.

This is also why I suggested that maybe CONFIG_NUMA is only selected for 
Arm towards the end of the series. So you reduce the risk of someone 
selecting it.

> 3. So I created the fake node to initialize the NUMA data, before we parser
>     real data from DTB.
> 4. In this case, user can work well with CONFIG_NUMA is enabled, without
>     this series is completed.

The flip side is you are adding more load on the reviewers because there 
are extra code. The series is already quite big (40 patches), any way to 
ease the review will definitely be appreciated.

Another possible way to ease the review is to move the patch that 
rework/move code at the beginning of the series and leave the Arm part 
for the second part of the series. This way, we can start to merge the 
series without waiting for the Arm bits to be completed.

Cheers,

-- 
Julien Grall

