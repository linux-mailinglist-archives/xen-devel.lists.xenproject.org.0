Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3621FF7DA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:46:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwkR-0000a5-04; Thu, 18 Jun 2020 15:46:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlwkP-0000Zz-RD
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:46:37 +0000
X-Inumbo-ID: e48eb924-b17a-11ea-bab1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e48eb924-b17a-11ea-bab1-12813bfff9fa;
 Thu, 18 Jun 2020 15:46:37 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hhva6BU1rQl2VCDwwk4yuwkMXe2Wypada6Qo5g3E1C5DylH6c8+igtX3x48pwlmui30ekuvEmq
 eZhlbiXd5fv3vQscjL+gn5MMmOM1UJIxJXh5noXZglJ1izwktmdPtzMAISMyuwX7s4vwg1jrpc
 W5U2o3pCvpJgFOfmhW168H+P4/Td2yjpZv0OSCVBCZa8Kl9n5Fi4crHngXTi+ldRkaTbzihZA8
 u3mChOrap0PzZFJBPYy8Ag4ifxsTk3G6cbPewM6AFUVHqFNb7HverkaHpuFZS3JUBYhsQSXvNK
 Raw=
X-SBRS: 2.7
X-MesageID: 20400594
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20400594"
Date: Thu, 18 Jun 2020 17:46:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v3 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
Message-ID: <20200618154628.GW735@Air-de-Roger>
References: <a7635e7423f834f44a132114bd3e039dd0435a00.1592490545.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7635e7423f834f44a132114bd3e039dd0435a00.1592490545.git.tamas.lengyel@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 07:39:04AM -0700, Tamas K Lengyel wrote:
> While forking VMs running a small RTOS system (Zephyr) a Xen crash has been
> observed due to a mm-lock order violation while copying the HVM CPU context
> from the parent. This issue has been identified to be due to
> hap_update_paging_modes first getting a lock on the gfn using get_gfn. This
> call also creates a shared entry in the fork's memory map for the cr3 gfn. The
> function later calls hap_update_cr3 while holding the paging_lock, which
> results in the lock-order violation in vmx_load_pdptrs when it tries to unshare
> the above entry when it grabs the page with the P2M_UNSHARE flag set.
> 
> Since vmx_load_pdptrs only reads from the page its usage of P2M_UNSHARE was
> unnecessary to start with. Using P2M_ALLOC is the appropriate flag to ensure
> the p2m is properly populated.
> 
> Note that the lock order violation is avoided because before the paging_lock is
> taken a lookup is performed with P2M_ALLOC that forks the page, thus the second
> lookup in vmx_load_pdptrs succeeds without having to perform the fork. We keep
> P2M_ALLOC in vmx_load_pdptrs because there are code-paths leading up to it
> which don't take the paging_lock and that have no previous lookup. Currently no
> other code-path exists leading there with the paging_lock taken, thus no
> further adjustments are necessary.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

