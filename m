Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061431C59EC
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:47:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVypi-0005KZ-Ub; Tue, 05 May 2020 14:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWWA=6T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jVyph-0005KU-Gn
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:46:05 +0000
X-Inumbo-ID: 2550c4de-8edf-11ea-9dc5-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2550c4de-8edf-11ea-9dc5-12813bfff9fa;
 Tue, 05 May 2020 14:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588689964;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z/06VXz1QCIMRlvIrPWSVg2baNeBhGKRScRV3SSV5vg=;
 b=bOKQY1RTkPIYGO1eOugAY7ujYlxrreSsMeBBGfjzpTVKFP3tX6PANHM4
 L4Be5jBc7wG/azkiF7igGcmHs/1LRAQQRvu+Z6hBRJ7ArQCwpvJ+PS1j/
 EoqLPflGrflE4taPfu4G6quzoxbJiFww11dmSwvVo5aEOcq7wbGJOsovp 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZHb8yAuz7SXyRwf1x6QFARxzfAsQX1CEgLISabU3b+K9JkX8WspZcgJ3ol4nixTybrrH9XYv02
 L7IFfw7dOqbPJYdvNQ5CzZsIddfVqGVmzq+b3SOKFZ1c3OPzJC7YojEHMfPWqNv9Fx4MshrGPs
 PVGzj9DLjuJTTVkIefntrcxv6B+J+BAUq2Mld72Y5pnNb31bztj7kLcr9m46tv0+QJl7rFLfVJ
 +awM6KXQKJV4BGQgV8l4xSr/0RK76uWd9vZ0uqmlDZtFSLxacnuHdMpfSJvP7yH4ZTJ+LIvFAa
 w84=
X-SBRS: 2.7
X-MesageID: 17474732
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,355,1583211600"; d="scan'208";a="17474732"
Date: Tue, 5 May 2020 16:45:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pv: Fix Clang build with !CONFIG_PV32
Message-ID: <20200505144557.GD1353@Air-de-Roger>
References: <20200505142810.14827-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200505142810.14827-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 05, 2020 at 03:28:10PM +0100, Andrew Cooper wrote:
> Clang 3.5 doesn't do enough dead-code-elimination to drop the compat_gdt
> reference, resulting in a linker failure:
> 
>   hidden symbol `per_cpu__compat_gdt' isn't defined
> 
> Drop the local variable, and move evaluation of this_cpu(compat_gdt) to within
> the guarded region.
> 
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Tested-and-reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

