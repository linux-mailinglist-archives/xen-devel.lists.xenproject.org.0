Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD1627E6C4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539.1775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZSv-0008Ak-Gd; Wed, 30 Sep 2020 10:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539.1775; Wed, 30 Sep 2020 10:36:05 +0000
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
	id 1kNZSv-0008AL-DA; Wed, 30 Sep 2020 10:36:05 +0000
Received: by outflank-mailman (input) for mailman id 539;
 Wed, 30 Sep 2020 10:36:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNZSt-0008AG-8C
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:36:03 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea9b56c0-40dd-4a10-b635-ff90f9ca8159;
 Wed, 30 Sep 2020 10:36:01 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNZSp-00074Z-FX; Wed, 30 Sep 2020 10:35:59 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNZSo-0005vo-8K; Wed, 30 Sep 2020 10:35:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNZSt-0008AG-8C
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:36:03 +0000
X-Inumbo-ID: ea9b56c0-40dd-4a10-b635-ff90f9ca8159
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ea9b56c0-40dd-4a10-b635-ff90f9ca8159;
	Wed, 30 Sep 2020 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=sTkBKPiuxTC3q+YZ5Ojh9Flk9kOMS7pL+eKmNAnOdSw=; b=JKbaC+y4LfwxvLDQraMFRdR0O+
	khYdpPNF3w0sssgopF2ReiuN/44JCDkccu6MsFumd54kdEZXDoaysW4kOQEzw6CCXZJ+bTp6iROr3
	mI72gMpqV57jJTDHJq8vxHL6J5SFMT5OFMF/Hn1Eh7jb8KHFKyWYCdeT/FQsV92t9oT8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNZSp-00074Z-FX; Wed, 30 Sep 2020 10:35:59 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNZSo-0005vo-8K; Wed, 30 Sep 2020 10:35:58 +0000
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: xen-devel@lists.xenproject.org, masami.hiramatsu@linaro.org,
 ehem+xen@m5p.com, bertrand.marquis@arm.com, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200926205542.9261-1-julien@xen.org> <87k0wcppnj.fsf@linaro.org>
 <5afbce1c-0c45-4b8c-771a-f83b91328e4a@xen.org> <87d024p9tc.fsf@linaro.org>
 <d4f86fcf-fe13-5d96-895f-2737300b6628@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7a9f302f-0a95-77f4-c434-e7afedbb8d39@xen.org>
Date: Wed, 30 Sep 2020 11:35:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <d4f86fcf-fe13-5d96-895f-2737300b6628@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

(Removing the x86 folks from the CC list)

Hi André,

On 30/09/2020 00:39, André Przywara wrote:
> On 29/09/2020 22:11, Alex Bennée wrote:
> 
> Hi,
> 
>> Julien Grall <julien@xen.org> writes:
>>
>>> Hi Alex,
>>>
>>> On 29/09/2020 16:29, Alex Bennée wrote:
>>>>
>>>> Julien Grall <julien@xen.org> writes:
>>>>
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> Xen on ARM has been broken for quite a while on ACPI systems. This
>>>>> series aims to fix it.
>>>>>
>>>>> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
>>>>> to only support 5.1).
> 
> Does QEMU provide ACPI tables? Or is this actually EDK2 generating them?
> 
>> So I did only some light testing.
> 
> So about that v6.0 or later: it seems like the requirement comes from:
> commit 1c9bd43019cd "arm/acpi: Parse FADT table and get PSCI flags":
> "Since STAO table and the GIC version are introduced by ACPI 6.0, we
> will check the version and only parse FADT table with version >= 6.0. If
> firmware provides ACPI tables with ACPI version less than 6.0, OS will
> be messed up with those information, so disable ACPI if we get an FADT
> table with version less than 6.0."
> 
> STAO (and XENV) have indeed been introduced by ACPI v6.0, but those
> tables are supposed to be *generated* by Xen and handed down to Dom0,
> they will never be provided by firmware (or parsed) by the Xen
> hypervisor. Checking the Linux code it seems to actually not (yet?)
> support the STAO named list,

I may be because we don't yet use the named list in Xen. I am not sure 
if other hypervisor ever used the STAO.

> and currently finds and uses the STAO (UART
> block bit) regardless of the FADT version number.

IIRC, the concern at the time is an OS may decide to bail out if it 
finds a table that is not meant to exist.

> I can't find anything GIC related in the FADT, the whole GIC information
> is described in MADT.

My memory is quite fuzzy... IIRC the problem is (was?) related to how 
Linux used to check the size of the MADT.

Before commit [1], Linux was checking that the MADT entry was matching 
the ACPI version. As Xen generates the MADT using the ACPI 6.0 layout, 
it wouldn't be possible to boot Linux.

> 
> Linux/arm64 seems to be happy with ACPI >= v5.1:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/acpi.c#n148
> 
> So can we relax the v6.0 requirement, to be actually >= v5.1? That is
> among the first to support ARM anyway, IIRC.

I remember trying to relax the requiring in the past. However, I can't 
remember why I didn't upstream it. There was possibly some issues I 
could not get around?

I think supporting ACPI 5.1 would be useful. So I would suggest to 
attempt it again and see what breaks.

Cheers,

[1]
commit 9eb1c92b47c73249465d388eaa394fe436a3b489
Author: Jeremy Linton <jeremy.linton@arm.com>
Date:   Tue Nov 27 17:59:12 2018 +0000

     arm64: acpi: Prepare for longer MADTs

     The BAD_MADT_GICC_ENTRY check is a little too strict because
     it rejects MADT entries that don't match the currently known
     lengths. We should remove this restriction to avoid problems
     if the table length changes. Future code which might depend on
     additional fields should be written to validate those fields
     before using them, rather than trying to globally check
     known MADT version lengths.

     Link: 
https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
     Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
     [lorenzo.pieralisi@arm.com: added MADT macro comments]
     Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
     Acked-by: Sudeep Holla <sudeep.holla@arm.com>
     Cc: Will Deacon <will.deacon@arm.com>
     Cc: Catalin Marinas <catalin.marinas@arm.com>
     Cc: Al Stone <ahs3@redhat.com>
     Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
     Signed-off-by: Will Deacon <will.deacon@arm.com>

-- 
Julien Grall

