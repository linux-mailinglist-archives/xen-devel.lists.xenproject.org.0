Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6249CEF8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 16:54:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260993.451419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkd0-0006MV-FE; Wed, 26 Jan 2022 15:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260993.451419; Wed, 26 Jan 2022 15:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkd0-0006Jx-C9; Wed, 26 Jan 2022 15:54:34 +0000
Received: by outflank-mailman (input) for mailman id 260993;
 Wed, 26 Jan 2022 15:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ptil=SK=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1nCkcz-0006Jr-1R
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 15:54:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4027121b-7ec0-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 16:54:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37572D6E;
 Wed, 26 Jan 2022 07:54:31 -0800 (PST)
Received: from [10.57.68.47] (unknown [10.57.68.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F387C3F766;
 Wed, 26 Jan 2022 07:54:29 -0800 (PST)
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
X-Inumbo-ID: 4027121b-7ec0-11ec-8f75-fffcc8bd4f1a
Message-ID: <447f89ca-86c0-dc35-e7ac-e6639a573670@arm.com>
Date: Wed, 26 Jan 2022 15:54:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: xen: document Xen iommu device
Content-Language: en-GB
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220117123251.140867-1-Sergiy_Kibrik@epam.com>
 <20220117123251.140867-2-Sergiy_Kibrik@epam.com>
 <e88b882f-4b5d-a801-fc68-66b7f790e11c@arm.com>
 <PAXPR03MB81144A63E18CAF10E785E2A7F0209@PAXPR03MB8114.eurprd03.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <PAXPR03MB81144A63E18CAF10E785E2A7F0209@PAXPR03MB8114.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-01-26 15:09, Sergiy Kibrik wrote:
> Hi Robin,
> 
>>
>> This could break Linux guests, since depending on the deferred probe
>> timeout setting it could lead to drivers never probing because the "IOMMU"
>> never becomes available.
>>
> 
> I've noticed no deferred probe timeouts when booting with this patch. Could you please explain more on how this would break guests?

Right now I think it would actually require command-line intervention, 
e.g. "fw_devlink=on" or "deferred_probe_timeout=3600" (with modules 
enabled for the latter to take full effect), but I'm wary of the 
potential for future config options to control those behaviours by default.

Robin.

> Thank you!
> 
>   -- Sergiy

