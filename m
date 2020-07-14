Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF12921F41A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 16:31:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvLxb-0003hf-N8; Tue, 14 Jul 2020 14:31:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvLxa-0003hX-8R
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 14:31:06 +0000
X-Inumbo-ID: a57251f7-c5de-11ea-931c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a57251f7-c5de-11ea-931c-12813bfff9fa;
 Tue, 14 Jul 2020 14:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594737065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8FOpZIUFkT24rTxJ54S6+D0PJNk5JhVGQbVAYis6n7I=;
 b=Zxf+DndZy3wGPRYaRer9mcimy7QC0HKqjD2+ZdjKAjFzbar4OQVSZM2J
 dSX1rD378H3R0gAr+OWjIU4Rv+gyqFpMeAXiKezJKwofiAaHdlj24YDWO
 8QLHMot2p8s2LTpkDPM5bEDvU98IbOIshmD8BHTKr2cJAxZsBAGwsOWSc Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9qnxXcY4NEsRUKhOCIWlGWUEOW9Soj8rsp7Md0TeUyPO4z/fWV5rOeYKybZYpkpAwT/oqDBeKO
 80bLUEHNVBsZRGdVCiQFTzIFK9t9aAd0+tjxb/ByBltyVHQRpGEbUDMO4cP58bhbfVykLK8fjI
 sMuRaP8CkBUY0BH1H+idzoTyLSEeo4J6WZgcQwC7qjIQhdcnRNKc9QI1X6lNf4QZGv/y7U70pF
 ylgjNi9e+TX/W/zmSSNECBtC6H/LtEQabdusj3fIvdtPNChK4CrHsV/Duew7VV/N7juwASWd49
 nts=
X-SBRS: 2.7
X-MesageID: 22660398
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22660398"
Date: Tue, 14 Jul 2020 16:30:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/7] x86/mce: add compat struct checking for
 XEN_MC_inject_v2
Message-ID: <20200714143056.GL7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <007679c8-84d5-2e91-e48e-68746741fb45@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <007679c8-84d5-2e91-e48e-68746741fb45@suse.com>
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

On Wed, Jul 01, 2020 at 12:25:48PM +0200, Jan Beulich wrote:
> 84e364f2eda2 ("x86: add CMCI software injection interface") merely made
> sure things would build, without any concern about things actually
> working:
> - despite the addition of xenctl_bitmap to xlat.lst, the resulting macro
>   wasn't invoked anywhere (which would have lead to recognizing that the
>   structure appeared to have no fully compatible layout, despite the use
>   of a 64-bit handle),
> - the interface struct itself was neither added to xlat.lst (and the
>   resulting macro then invoked) nor was any manual checking of
>   individual fields added.
> 
> Adjust compat header generation logic to retain XEN_GUEST_HANDLE_64(),
> which is intentionally layed out to be compatible between different size
> guests. Invoke the missing checking (implicitly through CHECK_mc).
> 
> No change in the resulting generated code.
> 
> Fixes: 84e364f2eda2 ("x86: add CMCI software injection interface")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

