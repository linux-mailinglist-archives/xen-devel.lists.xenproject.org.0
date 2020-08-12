Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C5F2426A0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 10:20:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5lyh-0008AT-Iz; Wed, 12 Aug 2020 08:19:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iJM+=BW=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k5lyf-0008AO-6s
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 08:19:17 +0000
X-Inumbo-ID: 24aad7b0-dfaa-4891-a351-5d35c2ca340e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24aad7b0-dfaa-4891-a351-5d35c2ca340e;
 Wed, 12 Aug 2020 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=00xF1vqEIQ54XtQhx15Z4oxwg1jlme1LUA8cW490WGQ=; b=RM3KebmMudeFxmBRnoU65+s7/t
 UIzkqBDW3Hgk6EDjlbgPQ0v++u61ypRPi9zFNB8IWcygm/eRU0wfstanmdYCBTGNkx9CQfXpLV1UY
 GPUn26dhKtZisXTtoOzQjhC/f1W+BLXzP626UUviQG+PYTnLl38aJIy08a+Xn9JGuHok=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5lyS-00080S-8M; Wed, 12 Aug 2020 08:19:04 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5lyR-0002KV-LA; Wed, 12 Aug 2020 08:19:03 +0000
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <5df97055-67f9-16cc-a274-864672d67164@xen.org>
 <alpine.DEB.2.21.2008051121580.5748@sstabellini-ThinkPad-T480s>
 <1afb9ffd-088c-ef4e-131a-0f2b62142405@xen.org>
 <alpine.DEB.2.21.2008061352141.16004@sstabellini-ThinkPad-T480s>
 <598e2f35-e70e-36a7-1e5d-259ebb2e3cde@xen.org>
 <alpine.DEB.2.21.2008101433050.16004@sstabellini-ThinkPad-T480s>
 <3e9c1820-5a75-49d7-0a97-4c24b20986c3@xen.org>
 <alpine.DEB.2.21.2008111446500.15669@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <19d27a9a-ca14-cb86-52a1-6441bd24933a@xen.org>
Date: Wed, 12 Aug 2020 09:19:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008111446500.15669@sstabellini-ThinkPad-T480s>
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 11/08/2020 23:48, Stefano Stabellini wrote:
>> I have the impression that we disagree in what the Device Emulator is meant to
>> do. IHMO, the goal of the device emulator is to emulate a device in an
>> arch-agnostic way.
> 
> That would be great in theory but I am not sure it is achievable: if we
> use an existing emulator like QEMU, even a single device has to fit
> into QEMU's view of the world, which makes assumptions about host
> bridges and apertures. It is impossible today to build QEMU in an
> arch-agnostic way, it has to be tied to an architecture.

AFAICT, the only reason QEMU cannot build be in an arch-agnostic way is 
because of TCG. If this wasn't built then you could easily write a 
machine that doesn't depend on the instruction set.

The proof is, today, we are using QEMU x86 to serve Arm64 guest. 
Although this is only for PV drivers.

> 
> I realize we are not building this interface for QEMU specifically, but
> even if we try to make the interface arch-agnostic, in reality the
> emulators won't be arch-agnostic.

This depends on your goal. If your goal is to write a standalone 
emulator for a single device, then it is entirely possible to make it 
arch-agnostic.

Per above, this would even be possible if you were emulating a set of 
devices.

What I want to avoid is requiring all the emulators to contain 
arch-specific code just because it is easier to get QEMU working on Xen 
on Arm.

> If we send a port-mapped I/O request
> to qemu-system-aarch64 who knows what is going to happen: it is a code
> path that it is not explicitly tested.

Maybe, maybe not. To me this is mostly software issues that can easily 
be mitigated if we do proper testing...

Cheers,

-- 
Julien Grall

