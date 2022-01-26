Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FCE49CCA0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 15:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260964.451328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjYA-0004Zl-Qc; Wed, 26 Jan 2022 14:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260964.451328; Wed, 26 Jan 2022 14:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjYA-0004Wt-NP; Wed, 26 Jan 2022 14:45:30 +0000
Received: by outflank-mailman (input) for mailman id 260964;
 Wed, 26 Jan 2022 14:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hAYL=SK=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nCjY9-0004Wn-4D
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 14:45:29 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 980b9254-7eb6-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 15:45:26 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50498)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nCjXx-000kp8-7Q (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 26 Jan 2022 14:45:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E069C1FBE5;
 Wed, 26 Jan 2022 14:45:16 +0000 (GMT)
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
X-Inumbo-ID: 980b9254-7eb6-11ec-8f75-fffcc8bd4f1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a46cb04b-2e83-a4d3-039f-61bdbd381c38@srcf.net>
Date: Wed, 26 Jan 2022 14:45:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <20220126122648.52275-1-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
In-Reply-To: <20220126122648.52275-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/01/2022 12:26, Roger Pau Monne wrote:
> One of the boxes where I was attempting to boot Xen in PVH dom0 mode
> has quirky firmware, as it will handover with a device with memory
> decoding enabled and a BAR of size 4K at address 0. Such BAR overlaps
> with a RAM range on the e820.
>
> This interacts badly with the dom0 PVH build, as BARs will be setup on
> the p2m before RAM, so if there's a BAR positioned over a RAM region
> it will trigger a domain crash when the dom0 builder attempts to
> populate that region with a regular RAM page.
>
> It's in general a very bad idea to have a BAR overlapping with a RAM
> region, so add some sanity checks for devices that are added with
> memory decoding enabled in order to assure that BARs are not placed on
> top of memory regions. If overlaps are detected just disable the
> memory decoding bit for the device and expect the hardware domain to
> properly position the BAR.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I'm not sure this is a sensible approach.

A bar at 0 is utterly unusable, because it is outside of the host bridge
window.

The absence of any coherent GPA map for guests (needs fixing for oh so
many reasons) is a primary contributor to the problem, because Xen
*should* know where the guest's low and high MMIO windows are before
attempting to map BARs into the guest.

The proper fix is to teach Xen about GPA maps, and reject BAR insertion
outside of the respective bridge windows.

An fix in the short term would be to disable the problematic BAR when
scanning the PCI bus to being with.

~Andrew

