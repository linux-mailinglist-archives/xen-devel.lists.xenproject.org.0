Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E154538F32
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 12:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339460.564345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzPO-0002au-QQ; Tue, 31 May 2022 10:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339460.564345; Tue, 31 May 2022 10:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzPO-0002Yn-NJ; Tue, 31 May 2022 10:47:30 +0000
Received: by outflank-mailman (input) for mailman id 339460;
 Tue, 31 May 2022 10:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvzPN-0002Yh-Ed
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 10:47:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e40817d-e0cf-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 12:47:28 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653994041443155.03033999045203;
 Tue, 31 May 2022 03:47:21 -0700 (PDT)
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
X-Inumbo-ID: 0e40817d-e0cf-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653994042; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=INq2fM7GewiNjQuC5y5cwtvzv+bz9MosgVRkUp/ExScKFhhSimSSIQRJLHHHF/sSP1Yd0fTrdO0wlL6FfWmA40wH/Ju4EJU4/UYDikbyxpZIjOz3OwSWlh3wqJgEdBAwZbiLubLb7QqkUvy9mu8royy/1N7jq1QvSnal7urRGI0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653994042; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=3sdYTeR7TY3vKJj6+W2HbHp6SQVoGgEhQXZr7L1Q75w=; 
	b=QVPAXOFcROLixvlFp70FkBs2Y9XQvXtuDK4fRyZGcoCy2xiLd1ovcjznos2Wuzym0KlM3SpFHZs8KFmVAga7IPljUgkLAi/h5UMH0Jy1vJHo8VsrIC30onueM1k60NeZJBKdUQgrJM4IY2z04+cvUu6lvwNYIo/yuJ2PsCDm+Kk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653994042;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3sdYTeR7TY3vKJj6+W2HbHp6SQVoGgEhQXZr7L1Q75w=;
	b=SFkr7mdY9duxEeK7QZglXJOZfPGZtdWZ8kA3Kik7rNoZYI5r02NEpQNckMgSqflT
	3LSc9KFD7VmKWcaws0qwYh/Isg1RDtCrbGqWTNy6jjyyMF76UVKpVIPm810tv7Eh8l7
	tN56+ehmoWWjj4pz3JPQSv3xGqhWJlVMiF3iVo+Q=
Message-ID: <4ebbb465-00ec-f4ba-8555-711cd76517ed@apertussolutions.com>
Date: Tue, 31 May 2022 06:45:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <2F13F24D-0A55-4BC3-9AC6-606C7E1626E8@arm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2F13F24D-0A55-4BC3-9AC6-606C7E1626E8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/31/22 05:07, Bertrand Marquis wrote:
> Hi Daniel,

Greetings Bertrand.

>> On 31 May 2022, at 03:41, Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
>>
>> For x86 the number of allowable multiboot modules varies between the different
>> entry points, non-efi boot, pvh boot, and efi boot. In the case of both Arm and
>> x86 this value is fixed to values based on generalized assumptions. With
>> hyperlaunch for x86 and dom0less on Arm, use of static sizes results in large
>> allocations compiled into the hypervisor that will go unused by many use cases.
>>
>> This commit introduces a Kconfig variable that is set with sane defaults based
>> on configuration selection. This variable is in turned used as the array size
>> for the cases where a static allocated array of boot modules is declared.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> xen/arch/Kconfig                  | 12 ++++++++++++
>> xen/arch/arm/include/asm/setup.h  |  5 +++--
>> xen/arch/x86/efi/efi-boot.h       |  2 +-
>> xen/arch/x86/guest/xen/pvh-boot.c |  2 +-
>> xen/arch/x86/setup.c              |  4 ++--
>> 5 files changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>> index f16eb0df43..57b14e22c9 100644
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -17,3 +17,15 @@ config NR_CPUS
>> 	  For CPU cores which support Simultaneous Multi-Threading or similar
>> 	  technologies, this the number of logical threads which Xen will
>> 	  support.
>> +
>> +config NR_BOOTMODS
>> +	int "Maximum number of boot modules that a loader can pass"
>> +	range 1 64
>> +	default "8" if X86
>> +	default "32" if ARM
>> +	help
>> +	  Controls the build-time size of various arrays allocated for
>> +	  parsing the boot modules passed by a loader when starting Xen.
>> +
>> +	  This is of particular interest when using Xen's hypervisor domain
>> +	  capabilities such as dom0less.
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index 2bb01ecfa8..312a3e4209 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -10,7 +10,8 @@
>>
>> #define NR_MEM_BANKS 256
>>
>> -#define MAX_MODULES 32 /* Current maximum useful modules */
>> +/* Current maximum useful modules */
>> +#define MAX_MODULES CONFIG_NR_BOOTMODS
>>
>> typedef enum {
>>     BOOTMOD_XEN,
>> @@ -38,7 +39,7 @@ struct meminfo {
>>  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
>>  * The purpose of the domU flag is to avoid getting confused in
>>  * kernel_probe, where we try to guess which is the dom0 kernel and
>> - * initrd to be compatible with all versions of the multiboot spec. 
>> + * initrd to be compatible with all versions of the multiboot spec.
> 
> This seems to be a spurious change.

I have been trying to clean up trailing white space when I see it
nearby. I can drop this one if that is desired.

> With that fixed, for the arm part:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thank you, will add it in when I respin it for submission.

v/r,
dps

