Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADEC20A0D4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 16:28:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joSqg-0000V8-Vs; Thu, 25 Jun 2020 14:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1joSqf-0000V1-Le
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 14:27:29 +0000
X-Inumbo-ID: ff3b51c2-b6ef-11ea-bca7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff3b51c2-b6ef-11ea-bca7-bc764e2007e4;
 Thu, 25 Jun 2020 14:27:28 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5+QvFqiIpiPeFQfY+KcNIO7AnAvDFlv58lI3+MJ2i+EwlOAT5dS8doRKOxian+9FvJ54dkL6l1
 n3JSeBp88g0q6t3/qzmQlBC8DmYVvilhcgHBecxvlmDC2DjPOUtbk+Davpckrm69EhTwrWqrTK
 U2nH34nowDBZ1xJiHLPhRxQG0R+u10Z18Ap+SiPCT29gfEq/1aVYoB2CoF36xdLnDK3m3/4Y75
 28+hmCnZSohwYbJCAqL1TxG36Ng2Ruvbj/rg2RGRSi84/91EA246gbnvpaRoCwnrNc1KxM2Afz
 Y4Y=
X-SBRS: 2.7
X-MesageID: 20938600
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,279,1589256000"; d="scan'208";a="20938600"
Date: Thu, 25 Jun 2020 16:27:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.14 v2] mm: fix public declaration of struct
 xen_mem_acquire_resource
Message-ID: <20200625142721.GY735@Air-de-Roger>
References: <20200625141643.82822-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200625141643.82822-1-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 25, 2020 at 04:16:43PM +0200, Roger Pau Monne wrote:
> XENMEM_acquire_resource and it's related structure is currently inside
> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
> hypervisor or the toolstack only. This is wrong as the hypercall is
> already being used by the Linux kernel at least, and as such needs to
> be public.
> 
> Also switch the usage of uint64_aligned_t to plain uint64_t, as
> uint64_aligned_t is only to be used by the toolstack. Note that a
> padding field is added on 32bit x86, so that the size of the structure
> is the same.
> 
> No layout structure change. The structure doesn't need to be adjusted
> on 32bit Arm, because guest handlers are already expanded to 64bits.
> 
> Fixes: 3f8f12281dd20 ('x86/mm: add HYPERVISOR_memory_op to acquire guest resources')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Should also be backported.
> ---
> Changes since v1:
>  - Add padding on 32bits so structure size matches between arches and
>    the previous layout is kept.

This is bogus, will send a proper version.

Sorry for the noise, Roger.

