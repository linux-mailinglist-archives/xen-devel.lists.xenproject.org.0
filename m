Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77455210582
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 09:54:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqXYV-0004sF-8M; Wed, 01 Jul 2020 07:53:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4aC=AM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqXYT-0004sA-F5
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 07:53:17 +0000
X-Inumbo-ID: e9736c56-bb6f-11ea-86d7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9736c56-bb6f-11ea-86d7-12813bfff9fa;
 Wed, 01 Jul 2020 07:53:12 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fu4Ta5yH48MNwr0gP2MVL6yw9LSfyA5rlJq8yvKUM8DgJerDobGFXP5s5Y5Vowq8bH1xZ895ok
 TNKWZvURzOpr2Db5nmRC+iie24wL0URnYhjvZ3GZfsBsTEea/XZH3fcDLlhJd0K3JlkdQHAsJm
 wax/R2cohQpN7wNZzhkPU4y/UpX27bhjAFxwWq7JOeZeKdQwae+VnCPQxvvGKX2nnoL/klr22b
 URHOhlRPdbmYDESKpUS0b/a17KI+LklSqE9swgF/wM4pzuXyCZWZvOS0Mu+zN9YkWede3EmEKu
 srI=
X-SBRS: 2.7
X-MesageID: 21708591
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,299,1589256000"; d="scan'208";a="21708591"
Date: Wed, 1 Jul 2020 09:52:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH] hvmloader: Fix reading ACPI PM1 CNT value
Message-ID: <20200701075257.GM735@Air-de-Roger>
References: <20200630170913.123646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200630170913.123646-1-anthony.perard@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 06:09:13PM +0100, Anthony PERARD wrote:
> In order to get the CNT value from QEMU, we were supposed to read a
> word, according to the implementation in QEMU. But it has been lax and
> allowed to read a single byte. This has changed with commit
> 5d971f9e6725 ("memory: Revert "memory: accept mismatching sizes in
> memory_region_access_valid"") and result in hvmloader crashing on
> the BUG_ON.

This is a bug on the QEMU side, the ACPI spec states: "Accesses to PM1
control registers are accessed through byte and word accesses.".
That's on section 4.8.3.2.1 PM1 Control Registers of my copy of the
ACPI spec (6.2A).

> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I'm fine with this if such bogus behavior has made it's way into a
release version of QEMU, but it needs to state it's a workaround for a
QEMU bug, not a bug in hvmloader.

IMO the QEMU change should be reverted.

Thanks, Roger.

