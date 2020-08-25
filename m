Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB78251922
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 15:02:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAYaq-00046T-V3; Tue, 25 Aug 2020 13:02:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzwT=CD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kAYaq-00046O-8Z
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 13:02:28 +0000
X-Inumbo-ID: f599c69a-c47a-46d0-ba5c-6919c7ec97ad
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f599c69a-c47a-46d0-ba5c-6919c7ec97ad;
 Tue, 25 Aug 2020 13:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=bstPGRdsckafgUnvWlBoNXAnxgInXn+4hYuGom/Z5QQ=; b=4f2/HT1kQH/ihbihzDQ1Cy94YQ
 nur8jjYpT+l62wsTwuBojIHxaxJ+vg2wt8uZLAVZClJlKAQDTaYD1C/6sGhKlr39+4/V5a1n/Tt6g
 PeHm1ZCO5/280PPk70rM2mAfZybkVj5+Je7qrELoUuhmj6THM/cY8iFwvK5Kb6X1T3BA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAYal-0006b5-QH; Tue, 25 Aug 2020 13:02:23 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAYal-0002Y6-G2; Tue, 25 Aug 2020 13:02:23 +0000
Subject: Virtio Xen (WAS: Re: [Linux] [ARM] Granting memory obtained from the
 DMA API)
To: Simon Leiner <simon@leiner.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
 <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
 <44f2d486-e3bd-6a44-042d-f05b5d0c0732@leiner.me>
From: Julien Grall <julien@xen.org>
Message-ID: <9bbea2a9-76f8-6384-3cff-3ae65e0475fa@xen.org>
Date: Tue, 25 Aug 2020 14:02:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <44f2d486-e3bd-6a44-042d-f05b5d0c0732@leiner.me>
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



On 20/08/2020 12:57, Simon Leiner wrote:
> Hi Julien,

Hi Simon,

> 
> On 20.08.20 13:17, Julien Grall wrote:
>> There is a lot of interest to get Virtio working on Xen at the moment.
>> Is this going to be a new transport layer for Virtio?
> 
> 
> It is designed that way, yes. The current implementation (based on
> virtio_mmio.c) has a few limitations:
>   - Only the host side is implemented for Linux (We are currently only
> using bare metal domains for the device side - so the device
> implementation is based on OpenAMP[1])
> 
> - It lacks some features, e.g. there is currently no device
> configuration space
> 
> - It is tested only very narrowly (only for my use case which is RPMsg
> via the rpmsg_char kernel driver)
> 
> As this was really just a byproduct of my main research topic, I'm
> currently not in touch with the virtio standards committee. But I'm
> happy to contribute my work if there is interest :-)

I have CCed a few folks that are interested in virtio. May I ask why did 
you create a new transport rather than using the existing one?

So far, there is an RFC to implement virtio-mmio for Xen on Arm (see 
[2]). But the idea of a Xen specific transport is discussed on the 
mailing list time to time. It would be more secure than existing 
transport, but I am worried about the adoption of the transport.

A new transport requires to modify all the OSes so they can work on Xen. 
This is fine for open-source OS, but it may be more difficult to get 
proprietary OS to invest in the new transport.

Do see any use of this transport outside of Xen?

Cheers,

[2] 
https://lore.kernel.org/xen-devel/1596478888-23030-1-git-send-email-olekstysh@gmail.com/

-- 
Julien Grall

