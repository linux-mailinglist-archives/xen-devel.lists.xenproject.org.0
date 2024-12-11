Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC299EC30E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 04:15:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853748.1267126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLDC1-0001sF-Co; Wed, 11 Dec 2024 03:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853748.1267126; Wed, 11 Dec 2024 03:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLDC1-0001pf-9P; Wed, 11 Dec 2024 03:15:17 +0000
Received: by outflank-mailman (input) for mailman id 853748;
 Wed, 11 Dec 2024 03:15:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLDC0-0001Nc-KR
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 03:15:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 236945cb-b76e-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 04:15:15 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733886904287260.9778254562499;
 Tue, 10 Dec 2024 19:15:04 -0800 (PST)
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
X-Inumbo-ID: 236945cb-b76e-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733886907; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W2ORHf/mKbQQAfTZA9Onw3fPGJ+6144y9v5XhV3f6bIIrjUjmWSYjp5ZT3jG4Gm/RSlrjXX1WnnkjLAWfqFW3Rbl8ddPs4Kyb/E3duQHIGm/N78BREQFt9/ANVRGcut+7Aroayncl3ogg2VkGmADWYjuJZl4Ho5UQJH47Etd/UE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733886907; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fFufXiXPkg6kDgH9fpNCf7zCQc40rCir74TbHskC/Mc=; 
	b=YOCA8nA2FTIBnoGEWOHwiEFiu8lW7n/eQJftEtXxUxgaKK51WiGNesSm5dUrJkWdLyVz48Wylovw3HKitMIbDt1mGEWAb/fxOOh7u13YiFqzwGWjxudGzS+t8oIYCnNJoCqxmbIrSVoifgbz8t/MbWdxjMG+ijqitwrH5W9n+1o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733886907;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fFufXiXPkg6kDgH9fpNCf7zCQc40rCir74TbHskC/Mc=;
	b=AWUY3GQ9bH5pf9vA8Q9CsMkSheiyzfAe9pWPa3x0k+8wiK/A9IzTgnD6QTQwtOTG
	uyAVWmf3SNyJSCyWIoh1zI4hOnhWAzZfrw2udhz3oC8SPWVbok3IwJ/mYs17epbEzHl
	yU+snm1Z27PvrbX57p4QLllhm6Htjmo4xDC78ozs=
Message-ID: <f3240ec7-879a-4476-bceb-e43cb2be4daa@apertussolutions.com>
Date: Tue, 10 Dec 2024 22:15:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] kconfig: introduce domain builder config option
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-6-dpsmith@apertussolutions.com>
 <aa722ea4-304b-47ec-9d93-ee88a03b7b53@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <aa722ea4-304b-47ec-9d93-ee88a03b7b53@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/26/24 05:09, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> Hyperlaunch domain builder will be the consolidated boot time domain building
>> logic framework. Introduces the config option to enable this domain builder to
>> and turn on the ability to load the domain configuration via a flattened device
>> tree.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/Kconfig                |  2 ++
>>   xen/arch/x86/domain_builder/Kconfig | 15 +++++++++++++++
>>   2 files changed, 17 insertions(+)
>>   create mode 100644 xen/arch/x86/domain_builder/Kconfig
> 
> I think I mentioned this already back when the much bigger series was first
> posted: Please no underscores in new file (or directory) names; dashes are
> to be preferred.

You are correct, my apologies for dropping that and I will fix it.

v/r,
dps


