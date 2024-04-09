Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC3A89E596
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 00:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702850.1098470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruJlQ-0005fo-RM; Tue, 09 Apr 2024 22:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702850.1098470; Tue, 09 Apr 2024 22:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruJlQ-0005eH-Oe; Tue, 09 Apr 2024 22:16:24 +0000
Received: by outflank-mailman (input) for mailman id 702850;
 Tue, 09 Apr 2024 22:16:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nipE=LO=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1ruJlP-0005eB-Dz
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 22:16:23 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca21209e-f6be-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 00:16:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2CFD9828565D;
 Tue,  9 Apr 2024 17:16:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RRWNK4nCQJFI; Tue,  9 Apr 2024 17:16:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6DA2582857D4;
 Tue,  9 Apr 2024 17:16:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id x0G6uqvK4tz0; Tue,  9 Apr 2024 17:16:17 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 7E030828565D;
 Tue,  9 Apr 2024 17:16:16 -0500 (CDT)
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
X-Inumbo-ID: ca21209e-f6be-11ee-b907-491648fe20b8
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6DA2582857D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712700977; bh=IrqYeoF/AHP9VZMZyy3QTrgq6/0aKoRUmndDALsKsTg=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=WL0EgGsdSj8nQjJmd9Yt+vPd/a8Offcd/4eQ4KoLNkS6SdFcl7AwEg7pIRI84yWvB
	 NJrPSBMahVY4mvvP52Qf9nBpZ+mZJjiMRtLOFNhjyc86hOl62pVDDKC3oT2Yw9lING
	 Xm6k03gs2EvCmpMo/7wTl0jj2SazeTKRV8aT8WFw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <eb22ec4e-6e60-458d-a17c-ad47a3146a6e@raptorengineering.com>
Date: Tue, 9 Apr 2024 17:16:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/acpi: Allow xen/acpi.h to be included on non-ACPI
 archs
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20240405182031.396528-1-sanastasio@raptorengineering.com>
 <7ab4053f-f8b3-4b6a-bd29-5d0fa228fca5@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <7ab4053f-f8b3-4b6a-bd29-5d0fa228fca5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/8/24 1:54 AM, Jan Beulich wrote:
> On 05.04.2024 20:20, Shawn Anastasio wrote:
>> Conditionalize xen/acpi.h's inclusion of acpi/acpi.h and asm/acpi.h on
>> CONFIG_ACPI and import ARM's !CONFIG_ACPI stub for acpi_disabled() so
>> that the header can be included on architectures without ACPI support,
>> like ppc.
>>
>> This change revealed some missing #includes across the ARM tree, so fix
>> those as well.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit preferably with ...
> 
>> @@ -118,6 +121,7 @@ extern u32 pci_mmcfg_base_addr;
>>  #else	/*!CONFIG_ACPI*/
>>  
>>  #define acpi_mp_config	0
>> +#define acpi_disabled (true)
> 
> ... the unnecessary parentheses avoided here.
>

If you'd like to handle this durring commit, that would be fine with me.
Otherwise let me know if you'd like a v2 to be sent.

> Jan

Thanks,
Shawn

