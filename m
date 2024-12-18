Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760229F69F4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 16:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860577.1272588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvuh-000177-Jw; Wed, 18 Dec 2024 15:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860577.1272588; Wed, 18 Dec 2024 15:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvuh-00014j-H0; Wed, 18 Dec 2024 15:24:39 +0000
Received: by outflank-mailman (input) for mailman id 860577;
 Wed, 18 Dec 2024 15:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLCT=TL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tNvug-00014d-50
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 15:24:38 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f41b763-bd54-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 16:24:35 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1734535465032784.0309698241986;
 Wed, 18 Dec 2024 07:24:25 -0800 (PST)
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
X-Inumbo-ID: 2f41b763-bd54-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1734535467; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eHs31qdRs+en4moz92y5KoYh63NAklrVpF04eyNd8ZJSxV4WiM6r4rWbII6yDdGVKU5tLuXd5GEPuhlGtwTErgp7TIpRN+HSpazmR1eEhO5rybbCmsvZfSPfrsr5+QoOX9DketNzCwLL+GMQzZpzw4zc88f85WPwgAXfJ+8OaOU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734535467; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nzekv+dagWiXVVPf1hyvvkKH7M5iejRXQcHziW3FD00=; 
	b=RfgKrBNQACeJolQNk5xmU/qwk9KE6uFeNERlUMe5Gf/6uI3mZTkToHJvXb3mANqVGpO+D9bT2Q8SB2hl999eCYk/GNIUeOIHk/2QmxMPNDrOMjSsCBmfJmKFusORTzyRU5XrDR10gSFr5JBU40nQfO4VXlLAaWjY+Hgz/ShdXZA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734535467;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nzekv+dagWiXVVPf1hyvvkKH7M5iejRXQcHziW3FD00=;
	b=vO13785I6IYEIMtsK+vOxIYt4o7CTc5OBrXFMCvSyMS851ApOjSt1CHF9LXTk4zQ
	WfLOKFOj2L7NeeuQEJxWsveS4BjffF93VEkHWRhn1Q2mxl9S688IDv5bXf35sbIk8Ll
	sGLffp2L2fdNLh1UMZext0uL+FnHhDACGDTeVrw4=
Message-ID: <ca0eddcb-274c-4244-a424-9726a5d61c43@apertussolutions.com>
Date: Wed, 18 Dec 2024 10:24:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Sergiy Kibrik <sergiy_kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
 <63b21760-7dea-423b-a9d8-64d213c40b2c@apertussolutions.com>
 <89e09a64-dafb-4665-adb5-be90fcc12646@epam.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <89e09a64-dafb-4665-adb5-be90fcc12646@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/18/24 05:04, Sergiy Kibrik wrote:
> 18.12.24 03:17, Daniel P. Smith:
>>> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>>>> Allow to build ARM configuration with support for initializing 
>>>> hardware domain.
>>>> On ARM it is only possible to start hardware domain in multiboot 
>>>> mode, so
>>>> dom0less support is required. This is reflected by dependency on 
>>>> DOM0LESS_BOOT
>>>> instead of directly depending on ARM config option.
>>
>>
>> Just to make sure my assumption is correct, you are looking to do a 
>> multi-domain construction at boot time, with at least two domains. One 
>> of those two domains is the "control domain" and one is the "hardware 
>> domain", aka late hwdom except it's not constructed "late".
> 
> yes, you're correct
> 
>>
>> If you want such a configuration, I would highly recommend you first 
>> enable setting flask labels via dom0less (assuming it is not there) 
>> before lighting this feature up. This is because the dummy/base policy 
>> has no support for differentiating between a "control domain" and a 
>> "hardware domain". What you really would end up with is two control 
>> domains, with one also having control over hardware.
>>
> 
> will check this out, thank you for suggestion!

Apologies, one minor correction. You would get a control domain and a 
domU with the hardware mapped into its address space, not two control 
domains. I was not thinking about the fact that dom0less builds a single 
dom0, if defined, and all the domain definitions are built as domU.

v/r,
dps

