Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519967D89BB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 22:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623978.972330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw75Y-0004uc-GO; Thu, 26 Oct 2023 20:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623978.972330; Thu, 26 Oct 2023 20:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw75Y-0004rH-DT; Thu, 26 Oct 2023 20:36:20 +0000
Received: by outflank-mailman (input) for mailman id 623978;
 Thu, 26 Oct 2023 20:36:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qw75W-0004rB-VN
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 20:36:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qw75V-0006im-M9; Thu, 26 Oct 2023 20:36:17 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.13.109]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qw75V-00060h-FR; Thu, 26 Oct 2023 20:36:17 +0000
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
	bh=lg+MBJgHZQ0NZxu+ZmE6Y1Slkt2OlxXCbhWQd3ZHTQ0=; b=Y2LrKlhmMRFbzunvJoq0N2erov
	NpGq/c2YHaAkAyaxr+N/pMHSgenp7kS6+LNDkCdhxxoHPusZgag2rGSx87cbBYWQLFsXKt+/8YA3Z
	GVIlzolTWCLTy2Qpzf4qNmiJKYL66EtDWTPL1x9+l5n6cMZUDJOA/pZxKjPrQXoSyfNU=;
Message-ID: <622969f4-1cd0-451a-8b31-9c2f33e45025@xen.org>
Date: Thu, 26 Oct 2023 21:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/arm: pci: plumb xen_arch_domainconfig with pci
 info
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
 <20231009195747.889326-3-stewart.hildebrand@amd.com>
 <5f69d9de-23af-429f-afa5-4623bedbb3ed@xen.org>
 <6fdaea2e-d6c8-4246-bd2b-7c08139e86fa@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6fdaea2e-d6c8-4246-bd2b-7c08139e86fa@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 25/10/2023 20:05, Stewart Hildebrand wrote:
> On 10/20/23 13:25, Julien Grall wrote:
>> On 09/10/2023 20:57, Stewart Hildebrand wrote:
>>> Add a flag to struct xen_arch_domainconfig to allow specifying at domain
>>> creation time whether the domain uses vPCI.
>>>
>>> Add a corresponding flag to struct arch_domain to indicate vPCI and set it
>>> accordingly.
>>
>> The new boolean you are adding doesn't seem very arch specific. So could
>> we use a bit in xen_domctl_createdomain.flags?
> 
> Right. Yes. Since x86 already has a vpci flag in xen_domctl_createdomain.arch.emulation_flags, I think the way forward is to move the x86 vpci flag to the common xen_domctl_createdomain.flags.

+1.

Cheers,

-- 
Julien Grall

