Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D21F538F58
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 12:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339516.564378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzXA-0005RO-A3; Tue, 31 May 2022 10:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339516.564378; Tue, 31 May 2022 10:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzXA-0005O3-75; Tue, 31 May 2022 10:55:32 +0000
Received: by outflank-mailman (input) for mailman id 339516;
 Tue, 31 May 2022 10:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvzX8-0005Nx-Oy
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 10:55:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e7d0d70-e0d0-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 12:55:29 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653994524615896.5098825753747;
 Tue, 31 May 2022 03:55:24 -0700 (PDT)
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
X-Inumbo-ID: 2e7d0d70-e0d0-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653994526; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q5hYiaNQ+seHpdqU9T8mf6eg3pXyLU0qo/XN5Oz3QhbhKDbOCceLTOXjNBlgTo+/yh7E0ZhYBfxlRMIcbX+p0At3BFVHu/XFQTCoMpMHsiNmjSGHnZFEbV1kGWlL1chccO9fCr6C/U5cvk/u+5iql/4YfPX8Cf5Omh4gygy3M2A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653994526; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=aPB5Bo/TIfYepxMvaIZKO/gBg5lzxObijRmyeLGPZZA=; 
	b=gWtaM8NMzp/X7ea5kTSQJpRf46wq3XD0CxGgIH0C/ILoJ8R+PCG1s2s9iYJuOLFiMPjFtohiL+p6FDUVUA3Fby5RDE0k2YEHuX361N+m7eGsXQLx3QS9ZhfyJk9bjEDaVcxk7slFmU5F2jdtJGtDQAZ2FOroeU5Eqz8Ktj2PQJU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653994526;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aPB5Bo/TIfYepxMvaIZKO/gBg5lzxObijRmyeLGPZZA=;
	b=HOOl6DtiX6zWL3DAT0L5gNLV4PkTmfnl6tHpZWMlR4SZEqF8dmZZTK8LygqeN3LW
	psQvr0eHJqfu7Eay/g9ql7EHbg/JTEgvuQI4ZQDe5A+mQjOYMHgHKLviTcVuUCTtNxp
	ZP81N191IRzixEc0YXC/3ck3kLM7lpHKLPKxQAH8=
Message-ID: <be06db4d-43c4-7d24-db0d-349c0a1e4999@apertussolutions.com>
Date: Tue, 31 May 2022 06:53:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <ab531f8b-a602-22e0-dabf-c7d073c88236@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
In-Reply-To: <ab531f8b-a602-22e0-dabf-c7d073c88236@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/31/22 05:25, Julien Grall wrote:
> Hi,
> 
> On 31/05/2022 03:41, Daniel P. Smith wrote:
>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>> index f16eb0df43..57b14e22c9 100644
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -17,3 +17,15 @@ config NR_CPUS
>>         For CPU cores which support Simultaneous Multi-Threading or
>> similar
>>         technologies, this the number of logical threads which Xen will
>>         support.
>> +
>> +config NR_BOOTMODS
>> +    int "Maximum number of boot modules that a loader can pass"
>> +    range 1 64
> 
> OOI, any reason to limit the size?

I modelled this entirely after NR_CPUS, which applied a limit, and it
seemed reasonable to me at the time. I choose 64 since it was double
currently what Arm had set for MAX_MODULES. As such, I have no hard
reason for there to be a limit. It can easily be removed or adjusted to
whatever the reviewers feel would be appropriate.

>> +    default "8" if X86
>> +    default "32" if ARM
>> +    help
>> +      Controls the build-time size of various arrays allocated for
>> +      parsing the boot modules passed by a loader when starting Xen.
>> +
>> +      This is of particular interest when using Xen's hypervisor domain
>> +      capabilities such as dom0less.
>> diff --git a/xen/arch/arm/include/asm/setup.h
>> b/xen/arch/arm/include/asm/setup.h
>> index 2bb01ecfa8..312a3e4209 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -10,7 +10,8 @@
>>     #define NR_MEM_BANKS 256
>>   -#define MAX_MODULES 32 /* Current maximum useful modules */
>> +/* Current maximum useful modules */
>> +#define MAX_MODULES CONFIG_NR_BOOTMODS
> 
> There are only a handful number of use of MAX_MODULES in Arm. So I would
> prefer if we replace all the use with CONFIG_NR_BOOTMODS.

No problem, as I stated above, I mimicked what was done for NR_CPUS
which did a similar #define for MAX_CPUS.

v/r,
dps

