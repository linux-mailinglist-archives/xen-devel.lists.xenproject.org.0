Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF24ACBD7A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 00:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003862.1383477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDwP-0003NZ-M5; Mon, 02 Jun 2025 22:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003862.1383477; Mon, 02 Jun 2025 22:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDwP-0003LD-Im; Mon, 02 Jun 2025 22:47:37 +0000
Received: by outflank-mailman (input) for mailman id 1003862;
 Mon, 02 Jun 2025 22:47:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMDwO-0003L7-Dh
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 22:47:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMDwN-00GKke-0O;
 Mon, 02 Jun 2025 22:47:35 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMDwN-00Dau7-1E;
 Mon, 02 Jun 2025 22:47:35 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=WpmjVpFGmSIUU9UyeyfbfMjpD78oyCRvKA8bsOznw80=; b=5xsW7h9yStRnvgrdIgpBohKqZy
	2BweO6OHJf+lFkOUh3qPOQw8nVgQzjkRW272VygWVBzScislqWUWs2jz06yCO28Tc7nvBEic+drvH
	CCufWrR35IC1gaX4RCaTsGO8+SdH22B21PUXG4TzP6TSQUi+aisBfN8hMfVn2H+71Fz0=;
Message-ID: <f62020d9-1cd5-4afa-ace3-98902526e58b@xen.org>
Date: Mon, 2 Jun 2025 23:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/arm: dom0less: Add trap-unmapped-accesses
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
 <20250530134559.1434255-3-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2506021535490.1147082@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2506021535490.1147082@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2025 23:36, Stefano Stabellini wrote:
> On Fri, 30 May 2025, Edgar E. Iglesias wrote:
>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>
>> Add the trap-unmapped-accesses per-domain fdt property.
>>
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>> ---
>>   docs/misc/arm/device-tree/booting.txt | 10 ++++++++++
>>   xen/arch/arm/dom0less-build.c         |  9 ++++++++-
>>   2 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
>> index 59fa96a82e..9add6440de 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -225,6 +225,16 @@ with the following properties:
>>       option is provided with a non zero value, but the platform doesn't support
>>       SVE.
>>   
>> +- trap-unmapped-accesses
>> +
>> +    Optional. An integer that configures handling of accesses to unmapped
>> +    address ranges.
>> +    If set to 0, guest accesses will read all bits as ones, e.g 0xFFFFFFFF
>> +    for a 32bit access and writes will be ignored.
>> +    If set to 1, guest accesses will trap.
>> +
>> +    This option is only implemented for ARM where the default is 1.
> 
> Please expand it to: "This option is only implemented for ARM where the
> default is 1 when trap-unmapped-accesses is absent."

I am confused. The document is part of "docs/misc/arm" and some options 
like "sve" are Arm specific. We don't mention this is Arm only because 
the documention is Arm specific.

I know that RISC-V is starting to share the bindings. So really (part 
of) the documentation should be moved to common. Until then, I think it 
is misleading to add "is only implemented for ARM".

BTW, the spelling for should be "Arm" ;).

Cheers,

-- 
Julien Grall


