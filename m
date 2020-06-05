Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DD21EFFAC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 20:10:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhGnQ-0007rG-7S; Fri, 05 Jun 2020 18:10:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVi9=7S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jhGnP-0007rB-5f
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 18:10:23 +0000
X-Inumbo-ID: d24e93ba-a757-11ea-b016-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d24e93ba-a757-11ea-b016-12813bfff9fa;
 Fri, 05 Jun 2020 18:10:22 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /D7uevOGb7NUS3jLhu56Icbr/nUD7Qi81n2S5LiPeFIrT8ReeW9XNSW42OEZ0WFDiBKGdrKCfj
 uv8eVAIzuVxu4PI66k7fgrV13TriETEJNqX+6x2DtP6nVsDNEg85NlOCrAnDIfRbkobyP1HM3t
 6+XYZ8lfZTxgKh8idzSCtkPzVXNYBvTzGjMJO8aQWPzbeRQeNVkg1o+MjrMCdCuq2/nd1ecgGl
 IPiY58EJ5yOUn8NM0FPYRK+gsojASP025eDRmGjiDWLeKDzo/r+hETjg4zsiEMAAyzN9jnp5P9
 1Jg=
X-SBRS: 2.7
X-MesageID: 19701429
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,477,1583211600"; d="scan'208";a="19701429"
Subject: Re: 5.7.0 / BUG: kernel NULL pointer dereference / setup_cpu_watcher
To: Christian Kujau <lists@nerdbynature.de>, <linux-kernel@vger.kernel.org>
References: <alpine.DEB.2.22.395.2006050059530.13291@trent.utfs.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a467c2db-e72d-9a27-9fbd-9bcf8770de20@citrix.com>
Date: Fri, 5 Jun 2020 19:10:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.395.2006050059530.13291@trent.utfs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/06/2020 09:36, Christian Kujau wrote:
> Hi,
>
> I'm running a small Xen PVH domain and upgrading from vanilla 5.6.0 to 
> <snip>
>
> Note: that "Xen Platform PCI: unrecognised magic value" on the top appears 
> in 5.6 kernels as well, but no ill effects so far.
>
> ---------------------------------------------------------------
> Xen Platform PCI: unrecognised magic value

PVH domains don't have the emulated platform device, so Linux will be
finding ~0 when it goes looking in config space.

The diagnostic should be skipped in that case, to avoid giving the false
impression that something is wrong.

~Andrew

