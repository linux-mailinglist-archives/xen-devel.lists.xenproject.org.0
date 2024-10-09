Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71163996831
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814356.1227917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUfF-0008IC-O3; Wed, 09 Oct 2024 11:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814356.1227917; Wed, 09 Oct 2024 11:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUfF-0008GQ-K5; Wed, 09 Oct 2024 11:15:33 +0000
Received: by outflank-mailman (input) for mailman id 814356;
 Wed, 09 Oct 2024 11:15:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syUfE-000805-R5
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:15:32 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca87313c-862f-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 13:15:30 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172847252110664.66275634369288;
 Wed, 9 Oct 2024 04:15:21 -0700 (PDT)
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
X-Inumbo-ID: ca87313c-862f-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728472524; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XyjCXCrDOO+WNcR1EvXbXYfJ2JXuP+Hy43N03AAchP7FJQ0UfVorhyzcmyI2HXVGyPbTLsZrN2ZyXxPkO9zUP6WX8UjzYKjF9Iinkv8QTZHJQlvjgzBW4DsNC5OawaS9c4r2ejrmXbnUCfuX41ROLWfl6klGm6C27o0Dgv5JwA0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728472524; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zXqOY56Juga8JCiHINW0eoQtjUwj7V6YyLxEKeLtq68=; 
	b=S1G4DWA+pEaryKRucNJfA++v35FFQTuQFAhbbvp9TkB1Zugb/PwaVGnmYgnEjXE65MerN8p74E0wL20poxq3widVMh+lndVTjX7c8jghhGsCyc/EfpdmMUkr6V1CDrryeRKBpnOjM1/tX3KAYzxLQ9JGrIAYVa9d5vzRWEbCkek=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728472524;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zXqOY56Juga8JCiHINW0eoQtjUwj7V6YyLxEKeLtq68=;
	b=mk5ueNPWLmAGlA1pEx5EgVFidFMSWqXFLvYsss2dR8ug3kDnQU1Suk6XI6RYuk4a
	b+J3V8LgAUgSkNssjL0AqY4wexBFdYgtacq+UmX65TzmRZT4RPAviACL/DzxcJYkYCx
	IR8gYW0jaZThyXDc52VeD4ViQOw0aj//Ar6kPWwU=
Message-ID: <9ddabcda-855d-4629-8a04-3fa309f10152@apertussolutions.com>
Date: Wed, 9 Oct 2024 07:15:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-2-dpsmith@apertussolutions.com>
 <1e3d6e99-37df-4824-8702-3e8ae7a4923f@amd.com>
 <87f57db3-3784-47b2-a923-ca09cfee91b2@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <87f57db3-3784-47b2-a923-ca09cfee91b2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/8/24 02:41, Jan Beulich wrote:
> On 07.10.2024 19:57, Jason Andryuk wrote:
>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>>> @@ -0,0 +1,29 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>>> + * Copyright (c) 2024 Apertus Solutions, LLC
>>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> + */
>>> +
>>> +#ifndef __XEN_X86_BOOTINFO_H__
>>> +#define __XEN_X86_BOOTINFO_H__
>>
>> I haven't been following closely, but I think if we follow Frediano's
>> naming scheme, it would be:
>> ASM__X86__BOOTINFO_H
> 
> The new scheme became "official" only after Daniel posted the series, by me
> actually committing what previously was only a proposal (coming from Bugseng
> originally, as a result of long winded discussions). But yes, now that it's
> official new headers ought to adhere to it.

Ack.

v/r,
dps

