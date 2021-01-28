Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E71307CE0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 18:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77348.140055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5BM1-0005fF-UM; Thu, 28 Jan 2021 17:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77348.140055; Thu, 28 Jan 2021 17:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5BM1-0005eq-Pu; Thu, 28 Jan 2021 17:45:13 +0000
Received: by outflank-mailman (input) for mailman id 77348;
 Thu, 28 Jan 2021 17:45:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5BM0-0005ed-AJ
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 17:45:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5BLz-00032G-H5; Thu, 28 Jan 2021 17:45:11 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5BLz-0001Ah-BQ; Thu, 28 Jan 2021 17:45:11 +0000
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
	bh=gaAINdbvOgoDRdmXkqkFC5hMaMoAR18E/s4ucvizwtY=; b=xL4mqXFZb2FHS50J2u7jlZ9DRJ
	t50V3fAAEh6BaXnMlU5L3sKACczuCBJSZbIVNs/O2uVMAVHnGVhVQp7xUOLzAL1tpSk0S5tk+qcvC
	gvUJeckjMAT9WqA/9IylzJecyblqO0Y9zCDE+p5e6m9A8+v8nPbIeLeFFqFawDXs95e4=;
Subject: Re: more randconfig failures
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Doug Goldstein <cardoe@cardoe.com>, "fam@euphon.net" <fam@euphon.net>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "famzheng@amazon.com" <famzheng@amazon.com>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.21.2101271311470.9684@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1_33h+jQrtoWnpH7hhkYjHaKLrh+s-5H+W0r1R=jWO8Q@mail.gmail.com>
 <DD7ECA11-D48F-435C-A731-8007E9785F62@arm.com>
 <89f34355-2c93-6081-e057-2dd98e76f908@xen.org>
 <51cd6fab-3bdb-6f85-f936-96e4ba9f708a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <680340a9-2586-21f6-23bd-d66a3a5c34db@xen.org>
Date: Thu, 28 Jan 2021 17:45:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <51cd6fab-3bdb-6f85-f936-96e4ba9f708a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 28/01/2021 16:46, Jan Beulich wrote:
> On 28.01.2021 17:34, Julien Grall wrote:
>> On 27/01/2021 23:11, Rahul Singh wrote:
>>> Hello Julien,
>>
>> Hi Rahul,
>>
>>>> On 27 Jan 2021, at 9:25 pm, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On Wed, 27 Jan 2021 at 21:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>
>>>>> Hi all,
>>>>>
>>>>> These are two recent randconfig build failures reported by gitlab (the
>>>>> two patches that triggered the CI-loop are two patches to the
>>>>> MAINTAINERS file -- certainly not the cause of the build issues):
>>>>>
>>>>> x86 randconfig failure:
>>>>> https://gitlab.com/xen-project/patchew/xen/-/jobs/990347647
>>>>>
>>>>> arm randconfig failure:
>>>>> https://gitlab.com/xen-project/patchew/xen/-/jobs/990335472
>>>>
>>>> make[5]: Leaving directory '/builds/xen-project/patchew/xen/xen/common/libfdt'
>>>> smmu-v3.c: In function 'acpi_smmu_get_options':
>>>> smmu-v3.c:3017:7: error: 'ACPI_IORT_SMMU_V3_CAVIUM_CN99XX' undeclared
>>>> (first use in this function)
>>>> 3017 |  case ACPI_IORT_SMMU_V3_CAVIUM_CN99XX:
>>>>        |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> smmu-v3.c:3017:7: note: each undeclared identifier is reported only
>>>> once for each function it appears in
>>>> smmu-v3.c:3020:7: error: 'ACPI_IORT_SMMU_V3_HISILICON_HI161X'
>>>> undeclared (first use in this function)
>>>> 3020 |  case ACPI_IORT_SMMU_V3_HISILICON_HI161X:
>>>>        |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>    INIT_O  efi-dom0.init.o
>>>> smmu-v3.c: In function 'arm_smmu_device_acpi_probe':
>>>> smmu-v3.c:3035:36: error: implicit declaration of function
>>>> 'dev_get_platdata' [-Werror=implicit-function-declaration]
>>>> 3035 |  node = *(struct acpi_iort_node **)dev_get_platdata(dev);
>>>>        |                                    ^~~~~~~~~~~~~~~~
>>>> smmu-v3.c:3035:36: error: nested extern declaration of
>>>> 'dev_get_platdata' [-Werror=nested-externs]
>>>> smmu-v3.c:3035:10: error: cast to pointer from integer of different
>>>> size [-Werror=int-to-pointer-cast]
>>>> 3035 |  node = *(struct acpi_iort_node **)dev_get_platdata(dev);
>>>>        |          ^
>>>> ld    -EL  -r -o built_in.o memcpy.o memcmp.o memmove.o memset.o
>>>> memchr.o clear_page.o bitops.o find_next_bit.o strchr.o strcmp.o
>>>> strlen.o strncmp.o strnlen.o strrchr.o
>>>> cc1: all warnings being treated as errors
>>>>
>>>> It looks like the SMMUv3 driver has not been built tested with
>>>> CONFIG_ACPI=y.  Bertrand, Rahul, can you take a look?
>>>
>>> Sorry my mistake I didn’t enable the ARM_SMMU_V3 with ACPI and tested the compilation.
>>>
>>> There are two option to fix this:
>>>
>>> 1. #undef-ining the CONFIG_ACPI in the smmu-v3.c file and fix the compilation. In this case once we have ACPI IORT table code ported to XEN smmu-v3 code can be used at that time.
>>> 2.  Remove the arm_smmu_device_acpi_probe() from the smmu-v3.c now and once we have  ACPI IORT table code ported to XEN we can add it back.
>>
>> How about the following?
>>
>> 3. Only allow the user to build the SMMUv3 when !CONFIG_ACPI.
> 
> And then perhaps as "depends on !ACPI || BROKEN" in Kconfig?

I am fine with that.

Cheers,

-- 
Julien Grall

