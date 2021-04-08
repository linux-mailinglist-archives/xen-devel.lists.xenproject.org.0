Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAB7357C13
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 08:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107037.204593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUNiR-0000K8-4v; Thu, 08 Apr 2021 06:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107037.204593; Thu, 08 Apr 2021 06:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUNiR-0000Jj-0q; Thu, 08 Apr 2021 06:00:31 +0000
Received: by outflank-mailman (input) for mailman id 107037;
 Thu, 08 Apr 2021 06:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUNiP-0000Jd-Ha
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 06:00:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f698f6c-4450-42ba-b1c9-868da0dc7be5;
 Thu, 08 Apr 2021 06:00:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D388DAFF7;
 Thu,  8 Apr 2021 06:00:27 +0000 (UTC)
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
X-Inumbo-ID: 9f698f6c-4450-42ba-b1c9-868da0dc7be5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617861628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luvLxUo5r9q0Tj2IuoSUj9Ws+6VMHZaOL6ilkor95fw=;
	b=VJAcsnwSeLztqp78wn0Rw3+K3wHa27I8bDeBF8WK1mBn71spjQaBx84JsEmLFL8uUczVXI
	pWEu8SaiNPTxCVvHp6CqtXKtuzXX83wZsxyKY+G4D7sImOafCa79SRBGS3TTmu8QVt8S2T
	/go0LOEeo7MPpetOLAv0ntYHH95hhNU=
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
To: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>
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
 <4ab1e7ed-cdf6-1b06-4f55-bbb981cade91@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0071311d-6da5-636b-b823-32b5570d8f49@suse.com>
Date: Thu, 8 Apr 2021 08:00:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <4ab1e7ed-cdf6-1b06-4f55-bbb981cade91@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.04.2021 20:06, Julien Grall wrote:
> Hi Jan,
> 
> On 06/04/2021 16:25, Jan Beulich wrote:
>> On 06.04.2021 16:30, Julien Grall wrote:
>>> Hi Roger,
>>>
>>> On 06/04/2021 15:13, Roger Pau Monné wrote:
>>>> On Tue, Apr 06, 2021 at 12:39:11PM +0100, Rahul Singh wrote:
>>>>> MSI support is not implemented for ARM architecture but it is enabled
>>>>> for x86 architecture and referenced in common passthrough/pci.c code.
>>>>>
>>>>> Therefore introducing the new flag to gate the MSI code for ARM in
>>>>> common code to avoid compilation error when HAS_PCI is enabled for ARM.
>>>>
>>>> Is such option really interesting long term?
>>>>
>>>> IIRC PCI Express mandates MSI support, at which point I don't see much
>>>> value in being able to compile out the MSI support.
>>>
>>> I am pretty sure there are board out with PCI support but no MSI
>>> support. Anyway, even if the spec may mandate it...
>>>
>>>>
>>>> So while maybe helpful for Arm PCI efforts ATM, I'm not sure it
>>>> warrants a Kconfig option, I would rather see Arm introduce dummy
>>>> helpers for the missing functionality, even if unimplemented at the
>>>> moment.
>>>
>>> ... from my understanding, most of (if not all) the MSI code is not very
>>> useful on Arm when using the GICv3 ITS.
>>>
>>> The GICv3 ITS will do the isolation for you and therefore we should not
>>> need to keep track of the state at the vPCI level.
>>
>> But that's then not "has PCI MSI" but "need to intercept PCI MSI
>> accesses", i.e. I don't think the Kconfig option is correctly
>> named. If a device with MSI support is used, you can't make that
>> MSI support go away, after all.
> 
> That's actually a good point. Rahul, do you think the config can be 
> renamed to something like CONFIG_PCI_MSI_NEED_INTERCEPT?

Minor remark: In this name I'd be inclined to suggest to omit NEED.

Jan

