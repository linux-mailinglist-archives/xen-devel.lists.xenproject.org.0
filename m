Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21B8280E9A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 10:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1737.5284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOGGi-0007HY-Mw; Fri, 02 Oct 2020 08:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1737.5284; Fri, 02 Oct 2020 08:18:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOGGi-0007H9-JX; Fri, 02 Oct 2020 08:18:20 +0000
Received: by outflank-mailman (input) for mailman id 1737;
 Fri, 02 Oct 2020 08:18:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7zU=DJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kOGGh-0007H3-34
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:18:19 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 725f5fcb-cdd3-42de-b267-2f279bb9d6dc;
 Fri, 02 Oct 2020 08:18:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kOGGe-0001Yu-5p; Fri, 02 Oct 2020 08:18:16 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kOGGd-0002CI-Tw; Fri, 02 Oct 2020 08:18:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=r7zU=DJ=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kOGGh-0007H3-34
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:18:19 +0000
X-Inumbo-ID: 725f5fcb-cdd3-42de-b267-2f279bb9d6dc
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 725f5fcb-cdd3-42de-b267-2f279bb9d6dc;
	Fri, 02 Oct 2020 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Vgixw/CeBnwxRzcUqOB3iBR+0hSx4I1dY4tAddWw+3A=; b=ksH7FnUKdAOJJ8UA5vc0NvWUYc
	gwQXCP9nqQskafeVdiw1jpBDkrfBx+xvYk+RpKpJ06omQV+3xilWsPwLEDbUIayhOjLarVSCNnnFO
	aS9o5QGABGyZptp8uGekzQ48x2HsHAZniSLrJEe+nlhZdKUopibA5g5OQ8EilfRJB+Sk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kOGGe-0001Yu-5p; Fri, 02 Oct 2020 08:18:16 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kOGGd-0002CI-Tw; Fri, 02 Oct 2020 08:18:16 +0000
Subject: Re: [PATCH] arm,smmu: match start level of page table walk with P2M
To: Stefano Stabellini <sstabellini@kernel.org>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 will@kernel.org, diana.craciun@nxp.com, anda-alexandra.dorneanu@nxp.com
References: <20200928135157.3170-1-laurentiu.tudor@nxp.com>
 <alpine.DEB.2.21.2010011647020.10908@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <41f7c87b-0db9-5366-b25f-775bf3d6e3ce@xen.org>
Date: Fri, 2 Oct 2020 09:18:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010011647020.10908@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 02/10/2020 00:52, Stefano Stabellini wrote:
> On Mon, 28 Sep 2020, laurentiu.tudor@nxp.com wrote:
>> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>>
>> Don't hardcode the lookup start level of the page table walk to 1
>> and instead match the one used in P2M. This should fix scenarios
>> involving SMMU where the start level is different than 1.
>>
>> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Thank you for the patch, I think it is correct, except that smmu.c today
> can be enabled even on arm32 builds, where p2m_root_level would be
> uninitialized.
> 
> We need to initialize p2m_root_level at the beginning of
> setup_virt_paging under the #ifdef CONFIG_ARM_32. We can statically
> initialize it to 1 in that case. Or...
> 
> 
>> ---
>>   xen/arch/arm/p2m.c                 | 2 +-
>>   xen/drivers/passthrough/arm/smmu.c | 2 +-
>>   xen/include/asm-arm/p2m.h          | 1 +
>>   3 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index ce59f2b503..0181b09dc0 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -18,7 +18,6 @@
>>   
>>   #ifdef CONFIG_ARM_64
>>   static unsigned int __read_mostly p2m_root_order;
>> -static unsigned int __read_mostly p2m_root_level;
>>   #define P2M_ROOT_ORDER    p2m_root_order
>>   #define P2M_ROOT_LEVEL p2m_root_level
>>   static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>> @@ -39,6 +38,7 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>>    * restricted by external entity (e.g. IOMMU).
>>    */
>>   unsigned int __read_mostly p2m_ipa_bits = 64;
>> +unsigned int __read_mostly p2m_root_level;
> 
> ... we could p2m_root_level = 1; here

IMHO, this is going to make the code quite confusing given that only the 
SMMU would use this variable for arm32.

The P2M root level also cannot be changed by the SMMU (at least for 
now). So I would suggest to introduce a helper (maybe 
p2m_get_root_level()) and use it in the SMMU code.

An alternative would be to move the definition of P2M_ROOT_{ORDER, 
LEVEL} in p2m.h

Cheers,

-- 
Julien Grall

