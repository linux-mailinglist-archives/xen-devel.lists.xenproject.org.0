Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1958824858D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:01:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k81EH-0004AU-SK; Tue, 18 Aug 2020 13:00:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SD0B=B4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k81EG-0004AN-6P
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:00:40 +0000
X-Inumbo-ID: bc2d4a03-8c82-4108-92b5-bd0790ef4ce9
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc2d4a03-8c82-4108-92b5-bd0790ef4ce9;
 Tue, 18 Aug 2020 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597755638;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S4nMXYt4zLDEgt5+NiZ2jFTX250FsYEjnxleQ7p/rjk=;
 b=aiJJU9Osprhxaao9b+oD1vgQjhTQG5Y2LwOBiSw9aiUADDdGfnLrTkCh
 EyOCRpeV3L05i3+vhghRD/m9DMT/7/THptWbzkXKOYaufVMBftZkMP9C0
 NLu1Z8AbM4LAbY++b9c2CRQ8hwku28N3iAM7SGzAB6vqBxxSBG5/+F7gm M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: x3qodcmwxt+RT4kptlzkIXUvj4u2I6JhuB99+0+V/d2XSbTO8rjHiqlaW4ImqfPw4GqSm3eOGp
 AvGzwcDNW+yiDoLeeYy9aJ1481b2P1C5HV1gUluh8yHGwG9gRoGsbJdHBiTRPPBDLQMwbzgQmc
 BGwLpznVwQe4JtgsjQPQ2nW9X1JC207KlPePA7Q8aYgnuvj5pfPE9ec5QWZrHFBl3heVQuxyBl
 6bT7Q0WUTWWtrIRLIECwLyrrnGbgdsBI62gjnTAFf8L6milYCSF7bpLs886z722FNOaajEJHzO
 rpo=
X-SBRS: 2.7
X-MesageID: 25690460
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25690460"
Date: Tue, 18 Aug 2020 15:00:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/7] x86: don't build with EFI support in
 shim-exclusive mode
Message-ID: <20200818130028.GL828@Air-de-Roger>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <1a501ca8-8cf0-6fd0-547e-30b709fec6fc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a501ca8-8cf0-6fd0-547e-30b709fec6fc@suse.com>
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

On Fri, Aug 07, 2020 at 01:32:38PM +0200, Jan Beulich wrote:
> There's no need for xen.efi at all, and there's also no need for EFI
> support in xen.gz since the shim runs in PVH mode, i.e. without any
> firmware (and hence by implication also without EFI one).
> 
> The slightly odd looking use of $(space) is to ensure the new ifneq()
> evaluates consistently between "build" and "install" invocations of
> make.

I would likely add a comment to the code itself, as it's not obvious
without a hint IMO.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wonder however if there would be a less tricky way to arrange all
this. Maybe the Kconfig work will remove some of this hacks?

Thanks, Roger.

