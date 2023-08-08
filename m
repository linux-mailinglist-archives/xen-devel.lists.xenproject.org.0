Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A336B773A21
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579765.907878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLlC-0006Vs-KK; Tue, 08 Aug 2023 12:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579765.907878; Tue, 08 Aug 2023 12:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLlC-0006TB-HS; Tue, 08 Aug 2023 12:24:26 +0000
Received: by outflank-mailman (input) for mailman id 579765;
 Tue, 08 Aug 2023 12:24:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTLlB-0006T1-6d
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:24:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTLl9-0003K6-Qy; Tue, 08 Aug 2023 12:24:23 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.31.116]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTLl9-0000yI-HG; Tue, 08 Aug 2023 12:24:23 +0000
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
	bh=39kcSSHBhdyZ37w3Fi441KnjRHvlOsxLqca8Jjs7ZZo=; b=isdET1bEgHpNW/xFEDA6nxcfUp
	ZEraDiksFsW4ESff4QX5+SHiSHVykw3kYX6HBu900jVG1QyiLEcRmSl4KIC8FfQeVrU1rDfsJapjs
	KkO9v0cziTvKCj64RHnpTqPhCepBP5ljyaCelL12OnZ7114WW1+qj67un7McujN2oIbY=;
Message-ID: <9fc81ba0-ca27-425c-84b6-90d767022086@xen.org>
Date: Tue, 8 Aug 2023 13:24:20 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <504749e9-1782-f031-e015-d36c538e80cc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/08/2023 08:54, Jan Beulich wrote:
> On 07.08.2023 18:58, Andrew Cooper wrote:
>> ... as part of cleaning up the types used.  Minor style cleanup on some
>> altered lines.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>   xen/drivers/passthrough/amd/iommu.h         |  4 ++--
>>   xen/drivers/passthrough/amd/iommu_acpi.c    |  6 +++---
>>   xen/drivers/passthrough/amd/iommu_init.c    |  6 +++---
>>   xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
>>   xen/drivers/passthrough/ats.c               |  2 +-
>>   xen/drivers/passthrough/ats.h               |  2 +-
>>   xen/drivers/passthrough/device_tree.c       |  4 ++--
> 
> This will want a DEVICE TREE ack; Cc-ing respective maintainers here
> (and therefore preserving full context).

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

