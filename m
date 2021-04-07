Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228183573E8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 20:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106884.204343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUCZe-0004t3-SI; Wed, 07 Apr 2021 18:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106884.204343; Wed, 07 Apr 2021 18:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUCZe-0004se-PI; Wed, 07 Apr 2021 18:06:42 +0000
Received: by outflank-mailman (input) for mailman id 106884;
 Wed, 07 Apr 2021 18:06:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUCZd-0004sZ-60
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 18:06:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUCZW-0002qA-Md; Wed, 07 Apr 2021 18:06:34 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUCZW-0006Ws-CU; Wed, 07 Apr 2021 18:06:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=dBa7CWhB0OTByIuNtqoL61JE69DlmcrrbF4W9M1CZ6U=; b=HYpy3NR1SvWsTDKf0spz2CUywo
	E+6MBQYgocNBm81lBGC3qTOdW1hPxaU7Ra6rti6snn6og1RIqwskSf4sgH37q8Gz5IAOU8DQrEmNL
	p1a2yL61D4lyo2ZeDN+d9H10M5ctG7xlvflcq4iU3xa5Ris+WVpqxL3O3mRu1g3Gm1vU=;
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1617702520.git.rahul.singh@arm.com>
 <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
 <YGxsfdK9GEefLgAv@Air-de-Roger>
 <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
 <b0eb0833-50aa-d9a1-3265-3255970ef210@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4ab1e7ed-cdf6-1b06-4f55-bbb981cade91@xen.org>
Date: Wed, 7 Apr 2021 19:06:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b0eb0833-50aa-d9a1-3265-3255970ef210@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 06/04/2021 16:25, Jan Beulich wrote:
> On 06.04.2021 16:30, Julien Grall wrote:
>> Hi Roger,
>>
>> On 06/04/2021 15:13, Roger Pau Monné wrote:
>>> On Tue, Apr 06, 2021 at 12:39:11PM +0100, Rahul Singh wrote:
>>>> MSI support is not implemented for ARM architecture but it is enabled
>>>> for x86 architecture and referenced in common passthrough/pci.c code.
>>>>
>>>> Therefore introducing the new flag to gate the MSI code for ARM in
>>>> common code to avoid compilation error when HAS_PCI is enabled for ARM.
>>>
>>> Is such option really interesting long term?
>>>
>>> IIRC PCI Express mandates MSI support, at which point I don't see much
>>> value in being able to compile out the MSI support.
>>
>> I am pretty sure there are board out with PCI support but no MSI
>> support. Anyway, even if the spec may mandate it...
>>
>>>
>>> So while maybe helpful for Arm PCI efforts ATM, I'm not sure it
>>> warrants a Kconfig option, I would rather see Arm introduce dummy
>>> helpers for the missing functionality, even if unimplemented at the
>>> moment.
>>
>> ... from my understanding, most of (if not all) the MSI code is not very
>> useful on Arm when using the GICv3 ITS.
>>
>> The GICv3 ITS will do the isolation for you and therefore we should not
>> need to keep track of the state at the vPCI level.
> 
> But that's then not "has PCI MSI" but "need to intercept PCI MSI
> accesses", i.e. I don't think the Kconfig option is correctly
> named. If a device with MSI support is used, you can't make that
> MSI support go away, after all.

That's actually a good point. Rahul, do you think the config can be 
renamed to something like CONFIG_PCI_MSI_NEED_INTERCEPT?

Cheers,

-- 
Julien Grall

