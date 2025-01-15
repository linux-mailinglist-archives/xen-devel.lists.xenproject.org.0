Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682CFA129C6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 18:24:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872929.1283929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY784-00067W-HL; Wed, 15 Jan 2025 17:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872929.1283929; Wed, 15 Jan 2025 17:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY784-00065L-EU; Wed, 15 Jan 2025 17:24:32 +0000
Received: by outflank-mailman (input) for mailman id 872929;
 Wed, 15 Jan 2025 17:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3mb0=UH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tY782-00065D-Oq
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 17:24:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92c2fb2d-d365-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 18:24:29 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736961858619464.6083482162387;
 Wed, 15 Jan 2025 09:24:18 -0800 (PST)
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
X-Inumbo-ID: 92c2fb2d-d365-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1736961861; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XAu2r15hSwso5dZOXyFyFxRLX4vEIwKNhmBhaOqr6GDO5MN6sViyHA0R0UZyjRcBWbXfeYb9H4L4ME2vBm30/fnuWKICy2lXwI1TSihG7bA8HBnGC4J8fav6VBjyaJRC9FT6+EKGFmJWrlRai+ruQ7BUD1nRU7xwzP4LuwhQS+0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736961861; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h+VVkBJPBeYEKvx1sLgmKR302+785QZO/5qA+TWHgas=; 
	b=FqDPrh664HrnKBTN+13S/r1C7yM44SSRXQpQjt+VwaSu8VDykiWgjP0xehEqXvIeJ+FECtGiE7LntfsGs0QZPilZLoS8c5/jvsPgAibRUJBYMDunOrrckGgeNXOD3oI1Cjuc6XWJvAWeD8HMzp6fO4tPe5ykHiP8RKwedlZ72dw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736961860;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=h+VVkBJPBeYEKvx1sLgmKR302+785QZO/5qA+TWHgas=;
	b=W7SjeCdfmKcuNn5cUA8R0PGyV79i0tkVzrc73iWOutGPvqoBZ+uP3C7rz2wWUjei
	XkzAgJ+pTdRJzT4LhVAtnPFRwPZb8jTzsUFLoNUMI/U5RFkZ6jGJvcrEAShHvUqoULh
	n24JTUEtlsUeOkYDVaJgVDwsJMB+Bm1XcFjAyhfA=
Message-ID: <0932dc87-edae-4b68-a4b2-bf2aa39ab64e@apertussolutions.com>
Date: Wed, 15 Jan 2025 12:24:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] kconfig: introduce domain builder config option
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-6-dpsmith@apertussolutions.com>
 <43c0ce53-4b3c-47b6-8b4d-c5278f52d7fe@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <43c0ce53-4b3c-47b6-8b4d-c5278f52d7fe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 1/10/25 14:55, Jason Andryuk wrote:
> On 2024-12-26 11:57, Daniel P. Smith wrote:
>> Hyperlaunch domain builder will be the consolidated boot time domain 
>> building
>> logic framework. Introduces the config option to enable this domain 
>> builder to
>> and turn on the ability to load the domain configuration via a 
>> flattened device
>> tree.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index 9cdd04721afa..25b9b75423c5 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -383,6 +383,8 @@ config ALTP2M
>>         If unsure, stay with defaults.
>> +source "arch/x86/domain_builder/Kconfig"
> 
> s/_/-/ ?

Ack.

> With that,
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

v/r,
dps

