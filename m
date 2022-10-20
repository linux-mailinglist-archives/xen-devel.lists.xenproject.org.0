Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA006061A2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426807.675505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVcK-0006SP-ER; Thu, 20 Oct 2022 13:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426807.675505; Thu, 20 Oct 2022 13:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVcK-0006PK-Ay; Thu, 20 Oct 2022 13:29:48 +0000
Received: by outflank-mailman (input) for mailman id 426807;
 Thu, 20 Oct 2022 13:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iaqk=2V=citrix.com=prvs=285ecbe66=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1olVcJ-0006PC-A6
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:29:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 428d2189-507b-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 15:29:46 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 428d2189-507b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666272585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aWOjyxBt9oAQgjedR8p8FAX5XibGH38ijrGq3nkJQDw=;
  b=gcoWQBP4JFdpWSlx8TJcTbeYhXUe9bFUmI9kU9tb4XVxw+EltjRBFCDY
   XAcVetSQukLYzhyWEPdIgwfp5sq1+njW0iSMLK/HAfxf5QX7y+/xUBTXj
   j9MYmILinHmlYVzpIV2dMSS2+6G81R5ltd2SreSc+PntXzI/jXozh2M0t
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82266859
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nTWSJqJypPJKabWpFE+R25UlxSXFcZb7ZxGr2PjKsXjdYENShGMDz
 mEYW2yFafuPMWKhL9sjaozko00Ov8XcydNqG1ZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4mtA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbBJqr8sOX0Vy
 fAVIhYVdjCJrMHx/K3uH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3FYICPJILaGJQ9ckCwm
 D3q2E32XU8hOvuH4Aqn8layrN7+gnauMG4VPOLhraM76LGJ/UQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O8037hucjJXd5QmxD3IBCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8kGLiYHMtMTQ+aSIOaxMdw9PIg8YPkUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8N8n9hO0yT5FWy13N2ZDB4wWvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMIQXO8gtKFHcoXsGiausM4fFyRJErE3CE
 c3DLZbE4YgyU8yLMwZat89CiOR2l0jSNEvYRIzhzgTP7IdykEW9EO9fWHPXN7hRxPrd/G3oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcqv+p0GKLHfflcO9aNII6a5/I7NsrdNx8x9/tokN
 FnkBie0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:CrMQxKw5+qOGSYH2n7uHKrPwKr1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPHjP+VEssRAb6LW90ca7LE80maQY3WBVB8bFYOCEghrLEGgB1+vfKlTbckWUnNK1l5
 0QEJSWYOeAdGSS5vya3ODXKbkd/OU=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="82266859"
Date: Thu, 20 Oct 2022 14:29:36 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH for-4.17?] test/vpci: enable by default
Message-ID: <Y1FNQHS496AkjTNX@perard.uk.xensource.com>
References: <20221020102706.29267-1-roger.pau@citrix.com>
 <AS8PR08MB79919E26BAD0DD1B74C564EF922A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR08MB79919E26BAD0DD1B74C564EF922A9@AS8PR08MB7991.eurprd08.prod.outlook.com>

On Thu, Oct 20, 2022 at 10:30:26AM +0000, Henry Wang wrote:
> Hi Roger,
> 
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Subject: [PATCH for-4.17?] test/vpci: enable by default
> > 
> > CONFIG_HAS_PCI is not defined for the tools build, and as a result the
> > vpci harness would never get build.  Fix this by building it
> > unconditionally, there's nothing arch specific in it.
> > 
> > Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > While not strictly a bugfix, I think it's worth adding this change to the
> > release in order to always build the vpci test hardness and prevent it
> > from bitrotting.
> 
> Good point.
> 
> No problem from my side, but I think you need also Anthony's opinion
> as he is the toolstack maintainer.

This sounds fine to me, the risk is that the build could fail. But we
can easily revert the patch and reapply it at the next development
cycle.

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

