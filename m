Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7215E53C050
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 23:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341270.566481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwsEl-0002jj-9a; Thu, 02 Jun 2022 21:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341270.566481; Thu, 02 Jun 2022 21:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwsEl-0002gJ-6K; Thu, 02 Jun 2022 21:20:11 +0000
Received: by outflank-mailman (input) for mailman id 341270;
 Thu, 02 Jun 2022 21:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOPH=WJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nwsEj-0002gD-Ci
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 21:20:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c60c3e87-e2b9-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 23:20:07 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654204804662743.2078611312962;
 Thu, 2 Jun 2022 14:20:04 -0700 (PDT)
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
X-Inumbo-ID: c60c3e87-e2b9-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654204805; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZAKHKc0ihEqMlIkC7Pg4x00z9OtuyZSOAF8r8POW78p4f4G43L6jf5el0IQMk6ID0F+HzkJRBXP3kkU/lwIyCDGjTTBTZrwMoWITa+7tqehlG6r5wyUDD6fCmUAR4zIcnAfJtORxPGdTtVPRhtsljSHZQia9cdmfZPPV4nOhkog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654204805; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=FJKAaVTT+R2zvKSvaDWAN2iQq0wixUB9o/f6YbTjDmU=; 
	b=BjGukJQfAYZNzTWcH6PuNMnfFTwT95KcK9NPzfOmwxLhYBL2F7f6VGuAvMNO1VjZhslY14GdyV5BQBWq4+1+t7NhBLcTTmyP+n/Xa+LilI0X88psgzHAPSZcekRCCAUjfYEOangs3JEMVUhjC2teJ8m+r787hyrm/Z9D6uxep2s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654204805;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FJKAaVTT+R2zvKSvaDWAN2iQq0wixUB9o/f6YbTjDmU=;
	b=lChteZMH/J95LziRS7/r+G62+vJG/aVj4WHScNL7uD+GBM22mXA1BL/9HxDrAq9M
	5Z0CTP6fptRyu/02sv7pAkayx62T9BRBjsnnLISDymYS9isBuVpj8IK+bNurSE52K9D
	8f4u8tTX1AIvRNL9tp19JKL1jKpLM8TKo1Nd91us=
Message-ID: <8dde6c92-2c4a-8665-8519-38a01e7421a3@apertussolutions.com>
Date: Thu, 2 Jun 2022 17:18:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v8 2/2] flask: implement xsm_set_system_active
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Luca Fancellu <luca.fancellu@arm.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220531145646.10062-1-dpsmith@apertussolutions.com>
 <20220531145646.10062-3-dpsmith@apertussolutions.com>
 <da87eeb4-516c-64bf-ee96-619a19875add@apertussolutions.com>
In-Reply-To: <da87eeb4-516c-64bf-ee96-619a19875add@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 6/2/22 16:32, Daniel P. Smith wrote:
> On 5/31/22 10:56, Daniel P. Smith wrote:
>> This commit implements full support for starting the idle domain privileged by
>> introducing a new flask label xenboot_t which the idle domain is labeled with
>> at creation.  It then provides the implementation for the XSM hook
>> xsm_set_system_active to relabel the idle domain to the existing xen_t flask
>> label.
>>
>> In the reference flask policy a new macro, xen_build_domain(target), is
>> introduced for creating policies for dom0less/hyperlaunch allowing the
>> hypervisor to create and assign the necessary resources for domain
>> construction.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> I am still debugging, but I now have a dom0 crashing due to an AVC that
> is being tripped with this patch applied to the tip of staging. I just
> wanted to give a heads-up, and I will follow back up once I can
> determine the root cause.

Please ignore and my apologies for the noise. The updated policy file
was not getting synced into the test environment.

v/r,
dps

