Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2E2E9801
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 16:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61288.107704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRNd-0003EG-7g; Mon, 04 Jan 2021 15:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61288.107704; Mon, 04 Jan 2021 15:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRNd-0003Dr-4a; Mon, 04 Jan 2021 15:02:45 +0000
Received: by outflank-mailman (input) for mailman id 61288;
 Mon, 04 Jan 2021 15:02:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rg9=GH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwRNb-0003Dm-HE
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 15:02:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0c07ce6-b0e5-4e95-82f4-27f38bd6215b;
 Mon, 04 Jan 2021 15:02:42 +0000 (UTC)
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
X-Inumbo-ID: d0c07ce6-b0e5-4e95-82f4-27f38bd6215b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609772562;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=z0nPNBAuE5l5eohkfe1q86aMYoCGWTNKoUdSNjc43H4=;
  b=HlQpGILLaTjD3MHV+XqUGeZ9xpQhMNf8I/BWcnM/uD06WcxzNsxuITkS
   3zR7Ysxv/k4vFUwbFmzQN79Whp7DAVDNmi/0ph31v2G9aopxgxDQu2rjt
   c+NCxeRQnEBo4GAHNayFdc2XcTO74xAzaMTF4HUR3aurw0+jJUdpAvCxh
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TtUEGLKIONvBIb5obpHa6ywTfJhSy5cFuQm919Pu0ObM1n4v9cfZ9SabuD7KhJ9n6l08B8zdX1
 iGDhetN2CIx0RXxc96c7mjgbKFEFgQug45GGBCAdF+OluA/g19AnVZ6ixeEC7ftdlQvWxA6bWW
 04j2jAnwgkxrKENBqbog20yR69EzIojsNcENQ0+7JAv4oSpKb0jcg8TtThnPunqtqlnz59/jmi
 FaUioSn8PmMaQ16bDMArFoXtCJiqVRBWdReChdmulCd3TtrV0EaThbelcQyDmILDyZPzNKwcGe
 CWc=
X-SBRS: 5.2
X-MesageID: 34344883
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34344883"
Subject: Re: [PATCH] x86/CPUID: suppress IOMMU related hypervisor leaf data
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
References: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
 <20201228105400.dzkyrgyvkjuevzsj@Air-de-Roger>
 <cb289033-9e7c-b51e-dd02-5c6d05285a8c@suse.com>
 <20210104145640.dmufekd2qb5gemud@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bb687468-c657-cfa4-22bc-f33059a184a5@citrix.com>
Date: Mon, 4 Jan 2021 15:02:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104145640.dmufekd2qb5gemud@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 04/01/2021 14:56, Roger Pau Monné wrote:
> On Mon, Jan 04, 2021 at 02:43:52PM +0100, Jan Beulich wrote:
>> On 28.12.2020 11:54, Roger Pau Monné wrote:
>>> On Mon, Nov 09, 2020 at 11:54:09AM +0100, Jan Beulich wrote:
>>>> Now that the IOMMU for guests can't be enabled "on demand" anymore,
>>>> there's also no reason to expose the related CPUID bit "just in case".
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> I'm not sure this is helpful from a guest PoV.
>>>
>>> How does the guest know whether it has pass through devices, and thus
>>> whether it needs to check if this flag is present or not in order to
>>> safely pass foreign mapped pages (or grants) to the underlying devices?
>>>
>>> Ie: prior to this change I would just check whether the flag is
>>> present in CPUID to know whether FreeBSD needs to use a bounce buffer
>>> in blkback and netback when running as a domU. If this is now
>>> conditionally set only when the IOMMU is enabled for the guest I
>>> also need to figure a way to know whether the domU has any passed
>>> through device or not, which doesn't seem trivial.
>> I'm afraid I don't understand your concern and/or description of
>> the scenario. Prior to the change, the bit was set unconditionally.
>> To me, _that_ was making the bit useless - no point in checking
>> something which is always set anyway (leaving aside old Xen
>> versions).
> This bit was used to differentiate between versions of Xen that don't
> create IOMMU mappings for grants/foreign maps (and so are broken) vs
> versions of Xen that do create such mappings. If the bit is not set
> HVM domains need a bounce buffer in blkback/netback in order to avoid
> sending grants to devices.

And remember that "send to devices" != "has an IOMMU".

An HVM backend would need to bounce buffer to use an emulated NVME
device, because there is no distinction between emulated and real DMA
from the guest kernels point of view.

The bit actually means "Xen doesn't screw up grant maps which requested
a DMA mapping any more".

~Andrew

P.S. If you wonder why I picked the NVME example, its because it turns
out that NVME emulated by Qemu has better performance than the PV blk
protocol.

