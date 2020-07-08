Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C5218914
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 15:32:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtABL-00008k-Fw; Wed, 08 Jul 2020 13:32:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65hh=AT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jtABK-00008c-0y
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 13:32:14 +0000
X-Inumbo-ID: 6e1a8980-c11f-11ea-8e38-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e1a8980-c11f-11ea-8e38-12813bfff9fa;
 Wed, 08 Jul 2020 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594215133;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HtZuI3CdV67mITIBl5roTEp3sCpytQ+TQBB1qswd7/A=;
 b=Kzi1T70d9S+OuoAdSs+2XIRceO3j0DcD4OlOEONPkY/wcCdQbcPpKmjv
 M7xDfU8HyQOQmtEGEEtS1B4rPj0c6lCvvDvKpcrrbwpEIWF2t9YIRn7r/
 NzX+tfcRVvxah0QZx1zw/NWYnhnzR0xhCCc4nDyVx95MhBI/AzP+Kab9z U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bqgUmpPKJkm1N4Qd6szRWO97fo3vYR1GrX4nBemd9OaCzJzp+YxJazmJ2Ygqbtl3mNA6ioEesY
 uU891TXo8rqc6kw+8BxYMxsqI3PgyQSIvLRVf8Ijb8dBypPr1Ruqauj6kJpGmDhcO3NN2A8id/
 2yA/kp2DJSeyKGXoTH68EfKYbI6Xyi/Lw3RnM+IZ4iWWV3Y+hEDFfs/3HngX84ap/HrfNGiYwy
 DaCDUnbKs2WgGMwJas/1eD3W15gtWpaURXRUOTVc/jq8jkVRbx4cVQ4w2m/RPcV/+82kYHPBUF
 nUI=
X-SBRS: 2.7
X-MesageID: 21866724
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,327,1589256000"; d="scan'208";a="21866724"
Date: Wed, 8 Jul 2020 15:32:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: PCI passthrough on arm Design Session MoM
Message-ID: <20200708133205.GE7191@Air-de-Roger>
References: <4E0A40D3-2979-4A91-9376-C2B19B9F582E@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4E0A40D3-2979-4A91-9376-C2B19B9F582E@arm.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 08, 2020 at 12:55:36PM +0000, Bertrand Marquis wrote:
> Hi,
> 
> Here are the notes we took during the design session around PCI devices passthrough on Arm.
> Feel free to comment or add anything :-)
> 
> Bertrand
> 
> PCI devices passthrough on Arm Design Session
> ======================================
> 
> Date: 7/7/2020
> 
> - X86 VPCI support  is for the PVH guest .

Current vPCI is only for PVH dom0. We need to decide what to do for
PVH domUs, whether we want to use vPCI or xenpt from Paul:

http://xenbits.xen.org/gitweb/?p=people/pauldu/xenpt.git;a=summary

Or something else. I think this decision also needs to take into
account Arm.

> - X86 PCI devices discovery code should be checked and maybe used on Arm as it is not very complex
> 	- Remark from Julien: This might not work in number of cases
> - Sanitation of each the PCI access for each guest in XEN is required
> - MSI trap is not required for gicv3 but it required for gicv2m
> 	- We do not plan to support non ITS GIC
> - Check possibility to add some specifications in EBBR for PCI enumeration (address assignment part)
> - PCI enumeration support should not depend on DOM0 for safety reasons
> - PCI enumeration could be done in several places
> 	- DTB, with some entries giving values to be applied by Xen
> 	- In XEN (complex, not wanted out of devices discovery)
> 	- In Firmware and then xen device discovery
> - As per Julien it is difficult to tell the XEN on which segment PCI device is present
> 	- Current test implementation is done on Juno where there is only one segment
> 	- This should be investigated with an other hardware in the next months

I'm not sure the segments used by Xen need to match the segments used
by the guest. This is just an abstract value assigned from the OS (or
Xen) in order to differentiate different MMCFG (ECAM) regions, and
whether such numbers match doesn't seem relevant to me, as at the end
Xen will trap ECAM accesses and map such accesses to the Xen assigned
segments.

Segments matching between the OS and Xen is only relevant when PCI
information needs to be conveyed between the OS and Xen using some
kind of hypercall, but I think you want to avoid using such side-band
communication channels anyway?

> - Julien mentioned that clocks issues will be complex to solve and most hardware are not following the ECAM standard
> - Julien mentioned that Linux and Xen could do the enumeration in a different way, making it complex to have linux doing an enumeration after Xen
> - We should push the code we have ASAP on the mailing list for a review and discussion on the design
> 	- Arm will try to do that before end of July

I will be happy to give it a look and provide feedback.

For such complex pieces of work I would recommend to first send some
kind of document to the mailing list in order to make sure the
direction taken is accepted by the community, and we can also provide
feedback or point to existing components that can be helpful :). If
you have code done already that's also fine, feel free to send it.

Thanks, Roger.

