Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4767200932
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 14:59:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGcM-0006Jj-Be; Fri, 19 Jun 2020 12:59:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m4t/=AA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jmGcL-0006Jb-24
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:59:37 +0000
X-Inumbo-ID: ba81e96e-b22c-11ea-bb7c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba81e96e-b22c-11ea-bb7c-12813bfff9fa;
 Fri, 19 Jun 2020 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zZXV2cGq8quVC8rQLL/wToEmak2+bNq8yjvSM/moiPM=; b=TJeOos2H7cDfy/H/QukOyIaTHl
 Bnmdvk0XQaEILqjcVKprk9i3Eh/Rbf+iwYOoY/mhNpXbpjrUsDHgJ2jwOYodg7vABzc2PYqFQHla8
 k2BnHksTG5kf78rKaIHNQc1gGB/BVJLkmTks0kY+8FSUD/WJkDYnMSnJxbePFAMYdndo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmGcI-0007C3-Gq; Fri, 19 Jun 2020 12:59:34 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmGcI-0001Jc-9g; Fri, 19 Jun 2020 12:59:34 +0000
Subject: Re: UEFI support in ARM DomUs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <17a14578-6fc7-925d-6f69-8b2fcbf40ff3@epam.com>
 <9d4a6e78-49d3-01c3-251b-6d66f56c2761@xen.org>
 <ebf32205-55b0-8a40-1935-d3591be058ce@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d7334aea-363e-49f6-f8c3-336e3c20eb0f@xen.org>
Date: Fri, 19 Jun 2020 13:59:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ebf32205-55b0-8a40-1935-d3591be058ce@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 19/06/2020 13:51, Oleksandr Andrushchenko wrote:
> On 6/19/20 3:47 PM, Julien Grall wrote:
>> They will not be available from the fdt, but you can retrieve them with an hypervisor call (see HVM_PARAM_STORE_PFN, HVM_PARAM_CONSOLE_PFN).
> Yes, and it used in the relevant pieces of code (hyp calls)
>> One question though, why do you need to map them in advance? Couldn't you map them on demand?
> 
> Well, we need to at least estimate the pg_table size so we can reserve and allocate memory later,

Oh, so U-boot doesn't support runtime page-table table allocation. Is 
that right?

> 
> so I have to provide memory range from either by coding a constant or looking into the devtree at
> 
> hypervisor { reg = <>; }. It is a bit tricky though

Looking for a node in the device-tree shouldn't be too difficult given 
that you have fdt_* available.

However, please not that <reg> doesn't refer to the guest magic pages. 
Instead, it provides a region you can use for mapping the grant-table frames

Cheers,

-- 
Julien Grall

