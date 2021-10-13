Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25242BA89
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 10:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208089.364117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZiB-0002Ga-0w; Wed, 13 Oct 2021 08:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208089.364117; Wed, 13 Oct 2021 08:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZiA-0002En-U1; Wed, 13 Oct 2021 08:34:06 +0000
Received: by outflank-mailman (input) for mailman id 208089;
 Wed, 13 Oct 2021 08:34:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K823=PB=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1maZi9-0002Eh-Gp
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 08:34:05 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 526148ef-2c00-11ec-8165-12813bfff9fa;
 Wed, 13 Oct 2021 08:34:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 431D71FB;
 Wed, 13 Oct 2021 01:34:03 -0700 (PDT)
Received: from [10.57.25.166] (unknown [10.57.25.166])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A51F3F66F;
 Wed, 13 Oct 2021 01:34:00 -0700 (PDT)
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
X-Inumbo-ID: 526148ef-2c00-11ec-8165-12813bfff9fa
Subject: Re: [PATCH v6] xen: Expose the PMU to the guests
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 bertrand.marquis@arm.com
References: <20211013074528.1396-1-michal.orzel@arm.com>
 <75e19429-49d2-c075-acb8-797c01364771@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <a0618ea7-3c66-bfca-20fb-62855c8791e4@arm.com>
Date: Wed, 13 Oct 2021 10:33:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <75e19429-49d2-c075-acb8-797c01364771@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 13.10.2021 10:29, Julien Grall wrote:
> Hi Michal,
> 
> On 13/10/2021 08:45, Michal Orzel wrote:
>> Add parameter vpmu to xl domain configuration syntax
>> to enable the access to PMU registers by disabling
>> the PMU traps(currently only for ARM).
>>
>> The current status is that the PMU registers are not
>> virtualized and the physical registers are directly
>> accessible when this parameter is enabled. There is no
>> interrupt support and Xen will not save/restore the
>> register values on context switches.
>>
>> According to Arm Arm, section D7.1:
>> "The Performance Monitors Extension is common
>> to AArch64 operation and AArch32 operation."
>> That means we have an ensurance that if PMU is
>> present in one exception state, it must also be
>> present in the other.
>>
>> Please note that this feature is experimental.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> Signed-off-by: Julien Grall <julien@xen.org>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>> ---
>> Changes since v5:
>> -extracted from the series as other patches have been merged
>> -fold ARM vPMU feature status in SUPPORT.md into existing section for x86
>> -fix coding style in libxl
>> Changes since v4:
>> -update SUPPORT.md
>> -move vpmu_is_available assignment after the secondary
>> CPUs have been brought up
>> -introduce masks for flags that need to be set and
>> for flags that are optional
>> Changes since v3:
>> -fail if vpmu is set but not supported
>> Changes since v2:
>> -remove redundant check from x86 code
>> -do not define bit position and mask separately
>> Changes since v1:
>> -modify vpmu parameter to be common rather than arch specific
>> ---
>>   SUPPORT.md                           | 12 ++++++++++--
>>   docs/man/xl.cfg.5.pod.in             | 17 +++++++++++++++++
>>   tools/golang/xenlight/helpers.gen.go |  6 ++++++
>>   tools/golang/xenlight/types.gen.go   |  1 +
>>   tools/include/libxl.h                |  6 ++++++
>>   tools/libs/light/libxl_create.c      | 10 ++++++++++
>>   tools/libs/light/libxl_types.idl     |  2 ++
>>   tools/ocaml/libs/xc/xenctrl.ml       |  1 +
>>   tools/ocaml/libs/xc/xenctrl.mli      |  1 +
>>   tools/xl/xl_parse.c                  |  2 ++
>>   xen/arch/arm/domain.c                | 13 ++++++++++---
>>   xen/arch/arm/setup.c                 |  3 +++
>>   xen/common/domain.c                  | 10 +++++++++-
>>   xen/include/asm-arm/domain.h         |  1 +
>>   xen/include/public/domctl.h          |  4 +++-
>>   15 files changed, 82 insertions(+), 7 deletions(-)
>>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index 317392d8f3..d0305abc0b 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -671,11 +671,19 @@ such as KVM, Hyper-V, Bromium, and so on as guests.
>>     ### vPMU
>>   -Virtual Performance Management Unit for HVM guests
>> +Virtual Performance Management Unit
> While I agree that "HVM guests" doesn't make any sense on Arm, you are not adding back for x86. So this is changing the statement support to both HVM and PV guest.
> 
> I don't know why only HVM guests was previously mentionned. Jan, Andrew? Anyway, for this patch, I think we should add...
> 
>>         Status, x86: Supported, Not security supported
> 
> ... add HVM here. Looking at other section, we seem to use:
> 
> Status, x86 HVM: ...
> 
> One can send a follow-up patch if we want to mention the support status for PV guests.
> 
> Cheers,
> 
Ok so it is the matter of adding "HVM" word into status for x86.
Is this something that can be done while committing?

Cheers,
Michal

