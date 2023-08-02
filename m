Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE6776D88D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 22:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575169.900993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRIM6-0002Ae-FT; Wed, 02 Aug 2023 20:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575169.900993; Wed, 02 Aug 2023 20:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRIM6-00028t-BX; Wed, 02 Aug 2023 20:22:02 +0000
Received: by outflank-mailman (input) for mailman id 575169;
 Wed, 02 Aug 2023 20:22:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F9x3=DT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRIM4-00028n-Lg
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 20:22:00 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a42c37f-3172-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 22:21:58 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691007707481648.6787527259322;
 Wed, 2 Aug 2023 13:21:47 -0700 (PDT)
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
X-Inumbo-ID: 3a42c37f-3172-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691007709; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zz0MjaajDsFBonzv5hWRfcG9dn1TVzO9pufGPhBA74mSIgGTw05Sb7Rp8nD71psO3wHZ+RnBlvkwnDD3yR66XNO6sfGbSBIWgPphDy+A+AWOfgoDTlElrxta+CI0wToaFi8b3cUYZaeAt+gh6VuZmuRPnfconff4hhaGE17Zw3c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691007709; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Po1VrRofBB295pCEpyxAkDJUrJEKqzaejllOsbYbV7c=; 
	b=LmQWkSNdj7efhEpCmyRHzc4fNfu72rEBiRF0uw65VhpT4F0X6AMrXGYvfdheZ7deaHFW44z5xBlXsaj+HLBHRXFHE2uDVaX4jhPjce1JA6yYlLIYL7edIU7WjV9cuKLtqVfwMuqKY/2rjt1rpzFM9pWnzZV/V91XaJzNNcAMFPU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691007709;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Po1VrRofBB295pCEpyxAkDJUrJEKqzaejllOsbYbV7c=;
	b=UVHOcOLXVo2d6UQW28XFDE8dMLmvk45dYFhGBEPozIHnXkXur4D6ZSNkeXuSuCfB
	GrhGHgYcC71fNESgHWMv/faCio7u4mb2IbQFyOR+v4KRBWflm8GCaaTPORGr5Rgq0Jm
	bfz2FNijYNszDjK+RJr8AdDSMGiBuJsPDhgve9QM=
Message-ID: <d21df242-d42f-1304-8163-bac45bbedc3b@apertussolutions.com>
Date: Wed, 2 Aug 2023 16:21:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230801161409.25905-1-dpsmith@apertussolutions.com>
 <20230801161409.25905-3-dpsmith@apertussolutions.com>
 <6ce3a936-e35e-caf6-b197-66441292bb9b@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <6ce3a936-e35e-caf6-b197-66441292bb9b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/2/23 03:27, Jan Beulich wrote:
> On 01.08.2023 18:14, Daniel P. Smith wrote:
>> This refactors reusable code from Arm's bootfdt.c and device-tree.h that is
>> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
>> introduced for when the ability of parsing DTB files is needed by a capability
>> such as hyperlaunch.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   MAINTAINERS                   |   2 +
>>   xen/arch/arm/bootfdt.c        | 141 +------------------------------
>>   xen/common/Kconfig            |   4 +
>>   xen/common/Makefile           |   3 +-
>>   xen/common/fdt.c              | 153 ++++++++++++++++++++++++++++++++++
>>   xen/include/xen/device_tree.h |  50 +----------
>>   xen/include/xen/fdt.h         |  79 ++++++++++++++++++
>>   7 files changed, 242 insertions(+), 190 deletions(-)
>>   create mode 100644 xen/common/fdt.c
>>   create mode 100644 xen/include/xen/fdt.h
> 
> The filename here ...
> 
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -303,7 +303,9 @@ F:	xen/common/libfdt/
>>   F:	xen/common/device_tree.c
>>   F:	xen/include/xen/libfdt/
>>   F:	xen/include/xen/device_tree.h
>> +F:	include/xen/fdt.h
>>   F:	xen/drivers/passthrough/device_tree.c
>> +F:	common/fdt.c
> 
> ... don't match the additions here. Also please insert in alphabetically
> sorted order, ignoring the previously misplaced final entry (entries),
> unless you want to take the opportunity and get things properly sorted
> again in this section.

Ack, will fix along with ensuring they are properly sorted.

v/r,
dps

