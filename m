Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E71225B73
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 11:25:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxS2c-0004CR-Tg; Mon, 20 Jul 2020 09:24:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eely=A7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxS2b-0004CM-9f
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 09:24:57 +0000
X-Inumbo-ID: dfd99b66-ca6a-11ea-8480-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfd99b66-ca6a-11ea-8480-bc764e2007e4;
 Mon, 20 Jul 2020 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xizyXMNDeLs4ZLnctySaz18NXv/aXzwDcBu6IFSNWNo=; b=LQpMvRz5l4IfQD5mNrzLdxLyL7
 tv8D4lxepWNYRUYdLLwdfq/4Yc9CtBG6bSPwN7GM2ysjCzzl/Hdi0dSljCkUrY9BXDWWbuW13AfUs
 2tIYs4tjyNhSD5TjYEigA9NhUr+oiKkwZLA5mp9uorc1SwGZOlEY12xk8516Z3pUheZk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxS2Y-0001Tr-FH; Mon, 20 Jul 2020 09:24:54 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxS2Y-0006Si-72; Mon, 20 Jul 2020 09:24:54 +0000
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
 <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
 <20200717153043.GX7191@Air-de-Roger>
 <C5B2BDD5-E504-4871-8542-5BA8C051F699@arm.com>
 <20200717160834.GA7191@Air-de-Roger>
 <0c76b6a0-2242-3bbd-9740-75c5580e93e8@xen.org>
 <20200720084734.GE7191@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <f28cd954-fecf-e223-e393-24d64a9161f7@xen.org>
Date: Mon, 20 Jul 2020 10:24:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720084734.GE7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

On 20/07/2020 09:47, Roger Pau Monné wrote:
> On Fri, Jul 17, 2020 at 05:18:46PM +0100, Julien Grall wrote:
>>> Do you really need to specify the ECAM and MMIO regions there?
>>
>> You need to define those values somewhere :). The layout is only shared
>> between the tools and the hypervisor. I think it would be better if they are
>> defined at the same place as the rest of the layout, so it is easier to
>> rework the layout.
> 
> OK, that's certainly a different approach from what x86 uses, where
> the guest memory layout is not defined in the public headers.

It is mostly a convenience as some addresses are used by both the 
hypervisor and tools. A guest should use the firmware tables (ACPI/DT) 
to detect the MMIO regions.

> 
> On x86 my plan would be to add an hypercall that would set the
> position of the ECAM region in the guest physmap, and that would be
> called by the toolstack during domain construction.

It would be possible to use the same on Arm so the hypervisor doesn't 
use hardcoded values for the ECAM.

Cheers,

-- 
Julien Grall

