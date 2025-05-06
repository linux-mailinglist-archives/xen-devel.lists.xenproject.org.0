Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0000EAACE0B
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 21:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977983.1364875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCNzX-00067c-Bo; Tue, 06 May 2025 19:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977983.1364875; Tue, 06 May 2025 19:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCNzX-000661-8k; Tue, 06 May 2025 19:30:11 +0000
Received: by outflank-mailman (input) for mailman id 977983;
 Tue, 06 May 2025 19:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w62W=XW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uCNzV-00065s-Sl
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 19:30:10 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83a9f970-2ab0-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 21:30:07 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1746559791369575.3431114911938;
 Tue, 6 May 2025 12:29:51 -0700 (PDT)
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
X-Inumbo-ID: 83a9f970-2ab0-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1746559794; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VL1S4WVwC63Fuhuqhx/mdKweXyWAbKTToJc/2clw6CxmCZb61MCM5oDVVQZdQNdr2kVnx9HaSDaMd0VmxZd/qn20WkyO3vE1fz2/Lspo0i6QOaKTLFUFI7kJ0+AeEyNLjxso6LG72z6OLIojBhV3pfqQleh2sjx3tBgrC0M/Yyo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746559794; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vTnvAL4GfSbZ9ZJ+5Y60PvSjRPqoisjqJVBAJeukLo8=; 
	b=R47BwV+4w6So8tM2k23yqs0RMPCPTlsM7pnx9ixQB735VjhGnzPOT42HXrJ84YHsigi0zMVV+ytBzYfI3cJp4UF/UfWfedZMdDO9yUDgfbAJTrIaMrLeYs+PiBiWoOkL7DzPnV7NnuSvl6/50XVuZDXS61amsD3KOXkyk1pYjJI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746559794;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vTnvAL4GfSbZ9ZJ+5Y60PvSjRPqoisjqJVBAJeukLo8=;
	b=aMNAJmyxNjzmHBeDazk5S01YbY2YwyY59UwMAQ423KbN9ksfnmTQQB+3s9mIDNK7
	3pUBe96C2/MNoeYKBnn8lDlS4SSFJL5WUmoKL7ejhzmE8w/uXoLertfeSjo9TK/p7VN
	POoGPMnX/xWL2LdLc/TN/14divNYVC9cY1HdK0mA=
Message-ID: <f199c2a3-88c6-4578-8667-2060a79285d6@apertussolutions.com>
Date: Tue, 6 May 2025 15:29:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/12] common/hyperlaunch: introduce the domain builder
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>,
 Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-3-agarciav@amd.com>
 <9021c878-9605-4d6e-95b8-ab97da186542@apertussolutions.com>
 <29a55d44-c26e-4834-b93b-47cbd98f885e@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <29a55d44-c26e-4834-b93b-47cbd98f885e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/2/25 03:21, Jan Beulich wrote:
> On 30.04.2025 20:56, Daniel P. Smith wrote:
>> On 4/29/25 08:36, Alejandro Vallejo wrote:
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>>>    obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
>>>    obj-$(CONFIG_IOREQ_SERVER) += dm.o
>>>    obj-y += domain.o
>>> +obj-$(CONFIG_DOMAIN_BUILDER) += domain-builder/
>>
>> Please don't do this, use IF_ENABLED in core.c and then hide the
>> unnecessary units in domain-builder/Makefile as I originally had it.
>> This allows for a much easier time incrementally converting the dom0
>> construction path into a generalized domain construction path.
> 
> That is, are you viewing this as a transitional thing only? If the end
> goal is to have it as Alejandro has it above, that may be acceptable
> (even if not nice).

There is/will be shared domain construction code between dom0-only and 
multidomain construction, with it will all living under domain builder. 
So no, the end goal is not what Alejandro just did. The end result will 
be the way I had it, with a different kconfig option to enable/disable 
the multidomain construction path.

v/r,
dps



