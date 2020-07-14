Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13FA21EF12
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 13:20:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvIz7-0003UM-To; Tue, 14 Jul 2020 11:20:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvIz6-0003UG-Qq
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 11:20:28 +0000
X-Inumbo-ID: 04d12412-c5c4-11ea-92fb-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04d12412-c5c4-11ea-92fb-12813bfff9fa;
 Tue, 14 Jul 2020 11:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594725628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Vt9c3nTJZogbN6qLCKM6gSJ5dFdCX/WrcqZiM8ZlO/Q=;
 b=Lfa+UxTxVWi9xzOOWLn7o+5sW9s/vVeKhqHuOT2QfNCTa54DtRDfDq25
 dv4xrjLeahw0DwA5SaklIqG5dIuBXhWpA3dsq5NQ6VRSNUB8ogKZqeFqS
 ilw/7qlv9/B4C4ynVtGlumsjomJ+TQzjgr97PZzoaswupeXdPKgBlSVKE g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VE1OCxTXnGzaJJbvQ+p0n95YcaiXxN0ZIjl3t4yUpWCq9PADJ/cTx7bmHcNJ5uqe7WckrCG/oe
 j76OX6XFfhxJ2JBe7AX9ZB178Moi2dSWZukiVNtST6EY3pbYIy2of2fLggu12l+Nc3KWe8RBw5
 QbNAa2sIR9OQtT+gVWn86hQH0sM6BeyA9YexosbrfOnvcks6/YqkE6N1bAWsjSb1bRYwcCyVtL
 XbF2qRBjzskXlJqFIgqWWlP88PQwqlb4smsH559v8nEigid53qkBUG4YMZzIe6ri4ubVGtEyrI
 pYk=
X-SBRS: 2.7
X-MesageID: 22326596
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22326596"
Date: Tue, 14 Jul 2020 13:19:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 4/7] x86/dmop: add compat struct checking for
 XEN_DMOP_map_mem_type_to_ioreq_server
Message-ID: <20200714111957.GJ7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <8bb00b11-7004-51c4-c679-83da922d085b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bb00b11-7004-51c4-c679-83da922d085b@suse.com>
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 12:27:16PM +0200, Jan Beulich wrote:
> This was forgotten when the subop was added.
> 
> Also take the opportunity and move the dm_op_relocate_memory entry in
> xlat.lst to its designated place.
> 
> No change in the resulting generated code.
> 
> Fixes: ca2b511d3ff4 ("x86/ioreq server: add DMOP to map guest ram with p2m_ioreq_server to an ioreq server")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

