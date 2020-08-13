Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F08C243FBE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 22:18:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6JeZ-00035A-6r; Thu, 13 Aug 2020 20:16:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6jG6=BX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6JeW-000355-V9
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 20:16:46 +0000
X-Inumbo-ID: 5cf6f435-22fe-442b-bd5f-4da532392567
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cf6f435-22fe-442b-bd5f-4da532392567;
 Thu, 13 Aug 2020 20:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=n4atXAS6AvGuuBYNrAJ+ohIcUP78yGukOZPCXu1prXw=; b=NdgppCtJklOT0te3Vge9u1bw1h
 5bvQFbS52PXB0QVnPQT9CyaaugjPeL5aR85KkroqLuG7uNx5aWwK0V+oT2V5LacJNB3M0bYhA6BCe
 99zlzeWKLvDNOqzagkRRCxX9nwCJghcaRRMuBkGtyCWqiwLRIT/Oy5EKJvTCMzo/z5e4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6JeH-0002ON-Ti; Thu, 13 Aug 2020 20:16:29 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6JeH-0003E4-IJ; Thu, 13 Aug 2020 20:16:29 +0000
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr <olekstysh@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, paul@xen.org,
 xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'Tim Deegan' <tim@xen.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
 <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
 <013b142d-5296-5bbe-7d19-903f59e0c974@gmail.com>
 <alpine.DEB.2.21.2008071259580.16004@sstabellini-ThinkPad-T480s>
 <06f78323-b8f5-fd11-486a-437267eccc29@gmail.com>
 <27513b2b-e59b-d446-7e68-eac4bc503409@gmail.com>
 <alpine.DEB.2.21.2008101200230.16004@sstabellini-ThinkPad-T480s>
 <441f4413-b746-035e-948e-da3ff76a9a3b@xen.org>
 <dc6de2f4-8f9d-aa96-8513-aecedb11e0ef@gmail.com>
 <alpine.DEB.2.21.2008111433520.15669@sstabellini-ThinkPad-T480s>
 <870b70b2-97da-3b3f-c06d-ffb5479328ac@gmail.com>
 <alpine.DEB.2.21.2008121211450.15669@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <09cb9fdf-e41e-1fdf-997b-89921d72968b@xen.org>
Date: Thu, 13 Aug 2020 21:16:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008121211450.15669@sstabellini-ThinkPad-T480s>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 13/08/2020 00:08, Stefano Stabellini wrote:
>>> It is very similar to your second patch with a small change on calling
>>> try_handle_mmio from handle_mmio and setting the register there. Do you
>>> think that would work?
>> If I understood correctly what you had suggested and properly implemented then
>> it works, at least I didn't face any issues during testing.
>> I think this variant adds some extra operations comparing to the previous one
>> (for example an attempt to find a mmio handler at try_handle_mmio). But, if
>> you think new variant is cleaner and better represents how the state machine
>> should look like, I would be absolutely OK to take this variant for non-RFC
>> series. Please note, there was a request to move try_fwd_ioserv() to
>> arm/ioreq.c (I am going to move new handle_ioserv() as well).
>   
> Yes, I think this version better represents the state machine, thanks
> for looking into it. I think it is good.
> 
> In terms of number of operations, it doesn't look very concerning (in
> the sense that it doesn't seem to add that many ops.) However we could
> maybe improve it by passing a reference to the right mmio handler from
> handle_mmio to try_handle_mmio if we have it. Or maybe we could save a
> reference to the mmio handler as part of v->arch.hvm.hvm_io.io_req.

There is no MMIO handler for the IOREQ handling. So I am not entirely 
sure what you are suggesting.

Cheers,

-- 
Julien Grall

