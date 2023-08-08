Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ABF773A23
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579774.907888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLpI-0007Cp-4S; Tue, 08 Aug 2023 12:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579774.907888; Tue, 08 Aug 2023 12:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLpI-0007AU-16; Tue, 08 Aug 2023 12:28:40 +0000
Received: by outflank-mailman (input) for mailman id 579774;
 Tue, 08 Aug 2023 12:28:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTLpG-0007AO-Ai
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:28:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTLpE-0003NM-E6; Tue, 08 Aug 2023 12:28:36 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.31.116]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTLpE-00013Q-7d; Tue, 08 Aug 2023 12:28:36 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=EYaOroeVFlJM9DpgQl2/n4FQhpOoYKJb12BcVk4ofpU=; b=nioaxZiF7EzxSXQLk7D4M6Qv6b
	rnUMLD6UzwqC36spkmCoIrXEWPtfJU1dB0KLEJr2paS1JhcLM5wjSeX/zIOecC7uxj/QN+vg2jrMo
	0V/5aXmy54ayPr/gdLuo2eiyKL7TJGiz2pZwkOhpHn5xwVP8qgs3RRO5RPHQEODl9PzM=;
Message-ID: <2c9ec464-954a-4404-973d-4d7b6ab7be54@xen.org>
Date: Tue, 8 Aug 2023 13:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/IOMMU: Switch bool_t to bool
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <stefano@stabellini.net>
References: <20230807165830.6719-1-andrew.cooper3@citrix.com>
 <504749e9-1782-f031-e015-d36c538e80cc@suse.com>
 <b2551bf8-06de-c098-77e8-ed1a01ef6319@citrix.com>
 <a5649355-e441-0de0-0189-c7ec5863ede6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a5649355-e441-0de0-0189-c7ec5863ede6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/08/2023 13:12, Jan Beulich wrote:
> On 08.08.2023 14:06, Andrew Cooper wrote:
>> On 08/08/2023 8:54 am, Jan Beulich wrote:
>>> On 07.08.2023 18:58, Andrew Cooper wrote:
>>>> ... as part of cleaning up the types used.  Minor style cleanup on some
>>>> altered lines.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>> ---
>>>>   xen/drivers/passthrough/amd/iommu.h         |  4 ++--
>>>>   xen/drivers/passthrough/amd/iommu_acpi.c    |  6 +++---
>>>>   xen/drivers/passthrough/amd/iommu_init.c    |  6 +++---
>>>>   xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
>>>>   xen/drivers/passthrough/ats.c               |  2 +-
>>>>   xen/drivers/passthrough/ats.h               |  2 +-
>>>>   xen/drivers/passthrough/device_tree.c       |  4 ++--
>>> This will want a DEVICE TREE ack; Cc-ing respective maintainers here
>>> (and therefore preserving full context).
>>>
>>>>   xen/drivers/passthrough/iommu.c             |  8 ++++----
>>>>   xen/drivers/passthrough/pci.c               | 16 ++++++++--------
>>> For these and ats.? you would also have wanted to Cc Paul.
>>
>> This very much qualifies as tree-wide.
> 
> Certainly. Question is what follows from this. In Prague we discussed
> whether to weaken the required-acks model, and if I'm not mistaken we
> said we'd first try whether we can't really get chasing acks to work
> (i.e. for people to respond in a timely fashion, ideally not really
> requiring any "chasing").
> 
> That said, it certainly remains up to you whether to wait of whether
> to commit. Yet even if already at submission time you know you're not
> going to wait, I think relevant maintainers should still be Cc-ed.

+1. Nowadays, it is also not very difficult to CC the relevant 
maintainers. scripts/add_maintainers.pl will add all of them 
automatically for you.

Cheers,

-- 
Julien Grall

