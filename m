Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633BA84451
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 15:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945727.1343862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2riX-0006rh-EX; Thu, 10 Apr 2025 13:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945727.1343862; Thu, 10 Apr 2025 13:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2riX-0006pV-Be; Thu, 10 Apr 2025 13:13:17 +0000
Received: by outflank-mailman (input) for mailman id 945727;
 Thu, 10 Apr 2025 13:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBao=W4=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u2riV-0006nR-WC
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 13:13:16 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eba5c57-160d-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 15:13:14 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744290784534319.87413798027364;
 Thu, 10 Apr 2025 06:13:04 -0700 (PDT)
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
X-Inumbo-ID: 8eba5c57-160d-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1744290787; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DwZPRiPZDo8N8dNXcJYzdozI5jLY93yYKVZm/3JcWE1AO0eaRkEhdlVsp0/Ju2xYucmdN6dFePyNKXimyGXB3MpjB1lWUejgDiE5bdjFy5QAo/vqWjJdWS+WSTzfV5CZgIxp+uXPrIFL6qqNimy/ziHInQ14KHg0Bll9VpfPmcQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744290787; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ABw/kxXbPgd+vAaQxN7/KjBSr3Nsdxw8qOySFQ5babY=; 
	b=IpPhGw9y+Kw7G0DW7m51oQwTGXLduUiUBm3u8BQ8FUDheSSstmG2/9UlMJ/N+zWE1I0r+eaAR3vWAIuvD24LbNhz/Z5CH/iKX72yWXdMkXfkxLebLPbpltXrX0fP+27gD1z7gq2NNEmPcW80/ybaF0d4ZJQC6oY1qf5XtiLltEg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744290787;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ABw/kxXbPgd+vAaQxN7/KjBSr3Nsdxw8qOySFQ5babY=;
	b=p05v/hXV90wWRbcXTuAW1btRQKgBlp1iBznOPYunlTbvIpAJrlpLP4JYjsLCT0zW
	wLXV4+nX9XMKevHQ+FXl/G1nIf1DRnR2awG77En4rE2FvMclgrjeT5dPiN+As7YmmJN
	jQPdQRaYd1GV76NtyjXWIWq/Ju13x3Umb/krPuGM=
Message-ID: <7e87020b-859e-408a-ae0e-097ef4ee54cd@apertussolutions.com>
Date: Thu, 10 Apr 2025 09:13:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] x86/boot: introduce boot domain
To: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-2-agarciav@amd.com>
 <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
 <D921CCFOSV90.2LUNCRRSE6Q5M@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <D921CCFOSV90.2LUNCRRSE6Q5M@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/9/25 06:28, Alejandro Vallejo wrote:
> On Wed Apr 9, 2025 at 7:24 AM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>
>>> To begin moving toward allowing the hypervisor to construct more than one
>>> domain at boot, a container is needed for a domain's build information.
>>> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
>>> struct boot_domain that encapsulate the build information for a domain.
>>>
>>> Add a kernel and ramdisk boot module reference along with a struct domain
>>> reference to the new struct boot_domain. This allows a struct boot_domain
>>> reference to be the only parameter necessary to pass down through the domain
>>> construction call chain.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks
> 
>>
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/boot-domain.h
>>> @@ -0,0 +1,28 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Copyright (c) 2024 Apertus Solutions, LLC
>>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>>> + */
>>
>> I wonder if the 2024-s here shouldn't have been amended by 2025 now.
> 
> Maybe. I didn't think about it, tbh. One could argue that Daniel and
> Christopher's original contribution was indeed in 2024 and the fact they
> weren't committed until (hopefully!) 2025 doesn't remove the fact they
> did exist in some form in 2024.
> 
> I don't particularly care either way, but tend to lean on the "it's fine
> how it is".

Jan is correct, now that we have moved into 2025, they should be 
updated. Maybe we can actually get it all committed this year.

v/r,
dps

