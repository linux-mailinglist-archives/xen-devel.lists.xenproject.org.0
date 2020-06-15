Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D31F9ADE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:51:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqSa-00041W-C3; Mon, 15 Jun 2020 14:51:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqSY-00041O-NS
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:51:38 +0000
X-Inumbo-ID: b64e625e-af17-11ea-b805-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b64e625e-af17-11ea-b805-12813bfff9fa;
 Mon, 15 Jun 2020 14:51:37 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: f73RR2H5j2vDOwXb/RJuXFDuihdqf6B5sew/Fa3YXkJOzvggFGXRB8n/5vnMx/B7zgRdUBr5hP
 t2L/p8JpatIT75SNug2hBVfvZ2c8R7nd1yJCPtgSRaXeAaQwTnwCPyjr01v94WiPx9tEvBcdzs
 IQZ/ZzR7NYeuSPU0oKERpcdNWKwMPYkNopnYJ3OJUtchGTQITdSC4R3N5HrhUsAAQUr8N8xEcR
 GdgUxAfbM7XiOeFAkNfB4bex4INi2uXyiQBOLNZjHxaaR0o08fgkNtYxSaDNvmEisAFiboWf9S
 CpA=
X-SBRS: 2.7
X-MesageID: 20083199
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20083199"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.35571.422130.264071@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:51:31 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/9] tools/libx[cl]: Introduce struct xc_xend_cpuid for
 xc_cpuid_set()
In-Reply-To: <20200615141532.1927-2-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Jan
 Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH 1/9] tools/libx[cl]: Introduce struct xc_xend_cpuid for xc_cpuid_set()"):
> In order to combine the functionality of xc_cpuid_set() with
> xc_cpuid_apply_policy(), arrange to pass the data in a single contained
> struct, rather than two arrays.
> 
> libxl__cpuid_policy is the ideal structure to use, but that would introduce a
> reverse dependency between libxc and libxl.  Introduce xc_xend_cpuid (with a
> transparent union to provide more useful names for the inputs), and use this
> structure in libxl.
> 
> The public API has libxl_cpuid_policy as an opaque type referencing
> libxl__cpuid_policy.  Drop the inappropriate comment about its internals, and
> use xc_xend_cpuid as a differently named opaque backing object.  Users of both
> libxl and libxc are not permitted to look at the internals.
> 
> No change in behaviour.
> 

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

