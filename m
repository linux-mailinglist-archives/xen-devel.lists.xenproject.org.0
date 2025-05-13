Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ACDAB5F43
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 00:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983588.1369833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEy29-0006iM-Ac; Tue, 13 May 2025 22:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983588.1369833; Tue, 13 May 2025 22:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEy29-0006gh-7e; Tue, 13 May 2025 22:23:33 +0000
Received: by outflank-mailman (input) for mailman id 983588;
 Tue, 13 May 2025 22:23:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDEU=X5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uEy27-0006gW-38
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 22:23:31 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e37adb1d-3048-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 00:23:27 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174717499037724.98380287927887;
 Tue, 13 May 2025 15:23:10 -0700 (PDT)
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
X-Inumbo-ID: e37adb1d-3048-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747174994; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dnbxfO9FO9L9jHwq5lmiybVz8M4I7DPxem85dxhxHznEk7x7w0/Z2ZGtG/RLDnxTDxkR3vlhUISZtLGaXcorv7UGwVZb2ZhvXAAZZsPNtAT3PL1sXEUcKZOxOia5xTeHbxQrPY6CdC7KpX9Dy35e5SLT3OZ2/nKZpnyoYuKex6I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747174994; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NXg63RRzJ4hapBxJNGZiNbaJBJJTD1PtZ9P4eE9E0wc=; 
	b=Iheu5mM+XTRBV24/BjGZqHB/SiWlDpdZajRsLqfxfXhcEYEoBFhVcnCimVch0k9NePuiBhY/lubWsQ1OPv5yK7YWzLTR4YQnWuSzIV2khIOShmtmbcQaClRk1g1fvg2kHsOXB3ryYC3GL6T71poVcbMsMoItBpxVLD3w+/gmGjQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747174994;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NXg63RRzJ4hapBxJNGZiNbaJBJJTD1PtZ9P4eE9E0wc=;
	b=M3lNsuLX15puJACVHh8doX92RV7e0plEgvnwUS3LZ2rgZSHRjJ8fuJWXtpp6nf/Y
	g5bKGCW3jjtTHkh4urWT70bo37Zvu1bQU6/Pj8POnxLNEJM3oAgfMZbMAXpq7nBwp2j
	cbpu41wgPtPvOiw3DtoZnjGqYHCP3Nfek8xAg1dw=
Message-ID: <6e3f3727-d084-40b9-a42a-46c52e770c88@apertussolutions.com>
Date: Tue, 13 May 2025 18:23:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/12] common/hyperlaunch: introduce the domain builder
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
 <f199c2a3-88c6-4578-8667-2060a79285d6@apertussolutions.com>
 <f8828ac3-face-401b-bad6-84eef390cab6@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <f8828ac3-face-401b-bad6-84eef390cab6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/13/25 04:05, Jan Beulich wrote:
> On 06.05.2025 21:29, Daniel P. Smith wrote:
>> On 5/2/25 03:21, Jan Beulich wrote:
>>> On 30.04.2025 20:56, Daniel P. Smith wrote:
>>>> On 4/29/25 08:36, Alejandro Vallejo wrote:
>>>>> --- a/xen/common/Makefile
>>>>> +++ b/xen/common/Makefile
>>>>> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>>>>>     obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
>>>>>     obj-$(CONFIG_IOREQ_SERVER) += dm.o
>>>>>     obj-y += domain.o
>>>>> +obj-$(CONFIG_DOMAIN_BUILDER) += domain-builder/
>>>>
>>>> Please don't do this, use IF_ENABLED in core.c and then hide the
>>>> unnecessary units in domain-builder/Makefile as I originally had it.
>>>> This allows for a much easier time incrementally converting the dom0
>>>> construction path into a generalized domain construction path.
>>>
>>> That is, are you viewing this as a transitional thing only? If the end
>>> goal is to have it as Alejandro has it above, that may be acceptable
>>> (even if not nice).
>>
>> There is/will be shared domain construction code between dom0-only and
>> multidomain construction, with it will all living under domain builder.
>> So no, the end goal is not what Alejandro just did. The end result will
>> be the way I had it, with a different kconfig option to enable/disable
>> the multidomain construction path.
> 
> Isn't CONFIG_DOMAIN_BUILDER a misnomer then?

Which is why I originally had two kconfig flags, one to enable dtb 
parsing for domain configuration, which allowed dom0 construction from 
dtb. Then there was the second flag that was to enable multi-domain 
construction. I have reworked a portion of the approach in the RFC based 
on feedback, which is based off of this series. In it, I tried to 
minimize how much went into common, but you will see how I still had to 
rework the kconfig flags.

v/r,
dps


