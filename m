Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F783219C60
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jul 2020 11:35:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtSxV-0001cx-Dz; Thu, 09 Jul 2020 09:35:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAgz=AU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jtSxT-0001cs-Br
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2020 09:35:11 +0000
X-Inumbo-ID: 7b270966-c1c7-11ea-8496-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b270966-c1c7-11ea-8496-bc764e2007e4;
 Thu, 09 Jul 2020 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594287310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gqMCyMr9A6fAlEZaEvpq/W0eCaBGhGhpO8X4MLxTtp0=;
 b=akaCTK/udqsczFGOLS7YtPKJc1W/TlmjeUXf6QnFEDV3to8cS+yXFNXA
 eB6Gvw3i4DrVGzMiZFrbUYTN0psvN/aCaN67VkRuc3LSJkcX6x+njy5iw
 EfiORaofF85jZWImKwq7ofmqMov5P6fJ95L5lstQS89HL4gv9v4eNV7wP 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xcFvwX9mLqd7rZFTNTw/Ng0DWImv0Jfo1s53jxr/IKq3ViG0Xh/62gx2BFJUy46sk9Ih0weSci
 I9KlqXGrEpRufggJK+NNrGigg1InEv6h2jELrmbeKOdK3JlyR88vQdriHkbCic98U6g9ap8CqR
 /u9LzyIk7HockGinLfDvpjPBfLYiDCHVsIDcnyGYeOiG76f9EtryuYw5wdphQ+NqC61jGrQfHw
 kryzwTTiX0xbo9/IG1XmKSfMq2r7+Q4KXYUFiAJ9cxyOBBegd6fwmsFHAR3/RN2o6ktc9EIWzR
 D10=
X-SBRS: 2.7
X-MesageID: 21956476
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,331,1589256000"; d="scan'208";a="21956476"
Date: Thu, 9 Jul 2020 11:34:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jg@pfupf.net>
Subject: Re: Followup of yesterday's design session "refactoring the REST"
Message-ID: <20200709093454.GF7191@Air-de-Roger>
References: <a578fb24-cc6a-b3bd-b83d-3f7b9b1302cf@pfupf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a578fb24-cc6a-b3bd-b83d-3f7b9b1302cf@pfupf.net>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 09, 2020 at 07:56:58AM +0200, Jürgen Groß wrote:
> Yesterday's design session at Xen Developer Summit "Hypervisor Team: .."
> had one topic regarding whether we should find specific maintainers of
> all the files currently assigned to "THE REST" in order to lower the
> amount of reviews for those assigned to be "THE REST" maintainers.
> 
> Modifying the MAINTAINERS file adding "REST@x.y" as REST maintainer
> and running the rune:
> 
> git ls-files | while true; do f=`line`; [ "$f" = "" ] && exit; \
> echo $f `./scripts/get_maintainer.pl -f $f | awk '{print $(NF)}'`; \
> done | awk '/REST/ { print $1}'
> 
> shows that basically the following files are covered by "THE REST":
> 
> - files directly in /
> - config/
> - most files in docs/ (not docs/man/)
> - misc/ (only one file)
> - scripts/
> - lots of files in xen/common/
> - xen/crypto/
> - lots of files in xen/drivers/
> - lots of files in xen/include/
> - xen/scripts/
> - some files in xen/tools/
> 
> I have attached the file list.

Thanks! I still have to go over the list in more detail, just some
comments below.

> So the basic idea to have a "hypervisor REST" and a "tools REST"
> wouldn't make a huge difference, if we don't assign docs/ to "tools
> REST".
> 
> So I think it would make sense to:
> 
> - look through the docs/ and xen/include/ files whether some of those
>   can be assigned to a component already having dedicated maintainers
> 
> - try to find maintainers for the other files, especially those in
>   xen/common/ and xen/drivers/ (including the related include files, of
>   course)

I think it's important that xen/common files (specially the ones
containing interfaces exposed to guests) have at least one maintainer
from each supported architecture (Arm and x86 ATM), plus whatever
common code maintainers we want to have. It's sometimes easy (at least
for me) to forget about other arches or make wrong assumptions about
them when modifying common code.

Drivers could also benefit from something similar IMO, where common
code has a shared group of maintainers, for example IOMMU should
ideally have a mix of maintainers from the current implementations
(Arm/Intel/AMD) plus again whatever common code maintainers we want
to have.

Roger.

