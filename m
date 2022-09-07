Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56D05AFF3A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400945.642610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqYX-0003O2-1W; Wed, 07 Sep 2022 08:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400945.642610; Wed, 07 Sep 2022 08:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqYW-0003L0-Rs; Wed, 07 Sep 2022 08:37:08 +0000
Received: by outflank-mailman (input) for mailman id 400945;
 Wed, 07 Sep 2022 08:37:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVqYV-0003GF-46
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:37:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqYS-0000gH-Ar; Wed, 07 Sep 2022 08:37:04 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqYS-0005l8-34; Wed, 07 Sep 2022 08:37:04 +0000
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
	bh=k9B4coASMmrd0YSag7YYJthd88IeeWe+L/qb7wXUl/8=; b=4m1vNC5JdgBxTtJZBThuKAasiv
	CdOPOXI2L+ml40itvm0eWr1znNPQI2Hh2abvz0UpL/cqcPxGAtDvHA0ckqqaUdHd55ECeDTFKa/1N
	G39fH1WSvgJUfqh4/zrVmXlnTLSLr4+USGHOyGyq1pw/Xj38zY3nrgoZc+L3Hy8sghL4=;
Message-ID: <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
Date: Wed, 7 Sep 2022 09:37:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "leo.yan@linaro.org" <leo.yan@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
 <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2022 09:30, Bertrand Marquis wrote:
>> On 7 Sep 2022, at 09:26, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Leo,
>>
>> On 06/09/2022 12:31, Leo Yan wrote:
>>> On Arm64 Linux kernel prints log for Xen version number:
>>>    [    0.000000] Xen XEN_VERSION.XEN_SUBVERSION support found
>>> Because the header file "xen/compile.h" is missed, XEN_VERSION and
>>> XEN_SUBVERSION are not defined, thus compiler directly uses the
>>> string "XEN_VERSION" and "XEN_SUBVERSION" in the compatible string.
>>> This patch includes the header "xen/compile.h" which defines macros for
>>> XEN_VERSION and XEN_SUBVERSION, thus Xen can pass the version number via
>>> hypervisor node.
>>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>>
>> AFAICT, the problem was introduced when we split the ACPI code from arch/domain_build.c. So I would add the following tag:
>>
>> Fixes: 5d797ee199b3 ("xen/arm: split domain_build.c")
>>
>> Now, this means we shipped Xen for ~4 years with the wrong compatible. The compatible is meant to indicate the Xen version. However, I don't think this is used for anything other than printing the version on the console.
>>
>> Also, the problem occurs only when using ACPI. This is still in tech preview, so I think we don't need to document the issue in the documentation (we can easily break ABI).
>>
>>> ---
>>>   xen/arch/arm/acpi/domain_build.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
>>> index bbdc90f92c..2649e11fd4 100644
>>> --- a/xen/arch/arm/acpi/domain_build.c
>>> +++ b/xen/arch/arm/acpi/domain_build.c
>>> @@ -9,6 +9,7 @@
>>>    * GNU General Public License for more details.
>>>    */
>>>   +#include <xen/compile.h>
>>
>> So this is fixing the immediate problem. Given the subtlety of the bug, I think it would be good to also harden the code at the same time.
> 
> I think we should commit the patch as is and harden the code in a subsequent patch.

I thought about this. However, if we do the hardening in the same patch, 
then it makes a lot easier to confirm that the patch works when ingested 
in downstream code or backported.

> 
>>
>> I can see two way to do that:
>>   1) Dropping the use of __stringify
>>   2) Check if XEN_VERSION and XEN_SUBVERSION are defined
>>
>> The latter is probably lightweight. This could be added right next to acpi_make_hypervisor_node() for clarify.
>>
>> Something like:
>>
>> #ifndef XEN_VERSION
>> # error "XEN_VERSION is not defined"
>> #endif
>>
>> #ifndef XEN_SUBVERSION
>> # error "XEN_SUBVERSION is not defined"
>> #endif
>>
>> Could you have a look?
> 
> There are actually several places in the code where we use the stringify system.
> Would it make sense to actually have a string version provided in compile.h and use it instead ?

I think so.

> 
> Otherwise if we start adding those kinds of checks, we will have to add them in at least 3 places in xen code.

The solution I proposed above is easy to implement right now. My gut 
feeling is tweaking __stringify (or else) will take a bit more time.

If you (or Leo) can come up with a solution quickly then fine. 
Otherwise, I think we still want some hardening for backporting purpose.

Cheers,

-- 
Julien Grall

