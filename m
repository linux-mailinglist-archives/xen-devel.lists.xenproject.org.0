Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6AA33CEDB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 08:52:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98207.186233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM4UN-0005af-WB; Tue, 16 Mar 2021 07:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98207.186233; Tue, 16 Mar 2021 07:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM4UN-0005aG-Sx; Tue, 16 Mar 2021 07:51:39 +0000
Received: by outflank-mailman (input) for mailman id 98207;
 Tue, 16 Mar 2021 07:51:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lM4UM-0005aB-BL
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 07:51:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c7e8aef-c616-45ff-9a6e-1d7bda322d57;
 Tue, 16 Mar 2021 07:51:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D4FFAC5C;
 Tue, 16 Mar 2021 07:51:36 +0000 (UTC)
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
X-Inumbo-ID: 6c7e8aef-c616-45ff-9a6e-1d7bda322d57
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615881096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCt8X04kFCPL+HlbEF40rUayFBIytXBEXXO2B+QHQEU=;
	b=uMKzE/xsTprjGrjeak+TacSyTgP79ZdpfmvitwGDXkqFJRX4vdo5A9EAOLieYAITZlVJWr
	9iOsgfMNzy34Bj0mMyjIabnUMrv066Y2CgGAn3JA7nWZhWZuzLV0PpR/a9qbhxz2bRyPvf
	soNIYGPqBqGg+plOrJOmFSOL18z+t1I=
Subject: Re: [PATCH v3] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20210312231632.5666-1-sstabellini@kernel.org>
 <0e35a613-fd93-0805-10b9-5ecee73bb15d@suse.com>
 <alpine.DEB.2.21.2103151259550.5325@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48a7ea93-06b4-21f1-5db2-0104058a2446@suse.com>
Date: Tue, 16 Mar 2021 08:51:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103151259550.5325@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.03.2021 21:01, Stefano Stabellini wrote:
> On Mon, 15 Mar 2021, Jan Beulich wrote:
>> On 13.03.2021 00:16, Stefano Stabellini wrote:
>>> Introduce two feature flags to tell the domain whether it is
>>> direct-mapped or not. It allows the guest kernel to make informed
>>> decisions on things such as swiotlb-xen enablement.
>>>
>>> The introduction of both flags (XENFEAT_direct_mapped and
>>> XENFEAT_not_direct_mapped) allows the guest kernel to avoid any
>>> guesswork if one of the two is present, or fallback to the current
>>> checks if neither of them is present.
>>>
>>> XENFEAT_direct_mapped is always set for not auto-translated guests.
>>>
>>> For auto-translated guests, only Dom0 on ARM is direct-mapped. Also,
>>> see is_domain_direct_mapped() which refers to auto-translated guests:
>>> xen/include/asm-arm/domain.h:is_domain_direct_mapped
>>> xen/include/asm-x86/domain.h:is_domain_direct_mapped
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> CC: jbeulich@suse.com
>>> CC: andrew.cooper3@citrix.com
>>> CC: julien@xen.org
>>
>> Any particular reason my previously given R-b isn't here?
> 
> I reworded part of the comment in the public header, and I decided to
> err on the side of caution and not add your R-b given this change
> compared to the previous version.

I see. FAOD, despite me not being overly happy with the "older
Xen assumptions" part of the comment, feel free to add it back.

Jan

