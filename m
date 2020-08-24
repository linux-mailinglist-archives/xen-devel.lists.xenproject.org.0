Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AB3250668
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 19:32:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAGKr-0008SS-T6; Mon, 24 Aug 2020 17:32:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Qh=CC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kAGKr-0008SN-0Y
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 17:32:45 +0000
X-Inumbo-ID: 11683d2a-84dc-4835-a5ac-4efe240fab28
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11683d2a-84dc-4835-a5ac-4efe240fab28;
 Mon, 24 Aug 2020 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598290360;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=d708d49NmK6JVDRcBd33rRB8VLEFQ19wb+8POGO2DSU=;
 b=G2nQkjrKHoE5d1bEHqVoZV9aJuo5aRKCJNPn2cMGVQK0JRL1vK22VymK
 b/Lu5JT3oa7jgxrmHX1XaJ3nImeiPGDkxu5MUBhR74hfLR20GvUTARt5H
 h5ZxfpCgQHew/1IeHj94H4oU8dsDIzgODTtDAZNZRdKXyOrH+d0zaLBwh 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9aRUVSIh+sisJHbAgdMUENE60R710nr7l+p1geSUK0RwcMN7LGrPCytDa9sZXc0hMH7PntA+yq
 4jfdu2gDmkI/xOyItTk8vz0bbEy7U3YHHnGfls8d/o1A2ka9VU+ei7qixPdXFMMKu9SB8dp0ya
 oc3x5ZoSE7WLf6w+2jy0I3tQfduqTH3O2p4pz2JIxP1ZNsgCY+rJ+lhp3VyjmZtXZQPFNIyCId
 /DdFD/ezHT2Rf8315/XfDnR/uLnHkxQn1QHIp3BxcYNBY1gCaFkGnsb3xrjafRS0OGblkXz6C4
 uDY=
X-SBRS: 2.7
X-MesageID: 25484671
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,349,1592884800"; d="scan'208";a="25484671"
Subject: Re: [PATCH v3 1/4] x86/EFI: sanitize build logic
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <088c088d-d463-05c6-1d17-d682a878e149@suse.com>
 <4614d5de-1125-0c0c-0997-2546bf82a964@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <997f2523-8f0c-1a41-0f1e-bc59d3864766@citrix.com>
Date: Mon, 24 Aug 2020 18:32:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4614d5de-1125-0c0c-0997-2546bf82a964@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/08/2020 12:58, Jan Beulich wrote:
> With changes done over time and as far as linking goes, the only special
> things about building with EFI support enabled are
> - the need for the dummy relocations object for xen.gz uniformly in all
>   build stages,
> - the special efi/buildid.o file, which can't be made part of
>   efi/built_in.o, due to the extra linker options required for it.
> All other efi/*.o can be consumed from the built_in*.o files.
>
> In efi/Makefile, besides moving relocs-dummy.o to "extra", also properly
> split between obj-y and obj-bin-y.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/181365160

This appears to work.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

