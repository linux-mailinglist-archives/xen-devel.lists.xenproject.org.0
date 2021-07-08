Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851333BF90E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 13:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153015.282679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1SFE-0002vw-Gz; Thu, 08 Jul 2021 11:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153015.282679; Thu, 08 Jul 2021 11:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1SFE-0002ss-DZ; Thu, 08 Jul 2021 11:31:04 +0000
Received: by outflank-mailman (input) for mailman id 153015;
 Thu, 08 Jul 2021 11:31:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mEkc=MA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m1SFD-0002sm-97
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 11:31:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f92ac5d2-dfdf-11eb-8566-12813bfff9fa;
 Thu, 08 Jul 2021 11:31:02 +0000 (UTC)
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
X-Inumbo-ID: f92ac5d2-dfdf-11eb-8566-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625743862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=esbQBVKkIBzl+74nh9KJhdLM7ID0KyDQoub54rhJncg=;
  b=VqOxNPS8Kgp6aGeW6g+L1Op096VE9go9++lAhbzg2TCcx149SnfP1BSm
   Jn6kQTb5vlXv0kvfu4WLapmTKaIsXGdhjSBVjfVHVlMXzjB5tMjgiZNBe
   zm1/rRjwlir6+WufRre9/DCXLsDtvaSt40Zes4V2jLv6gtjttX6CvDt9d
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HXec6kzt16mgJQKxAcOzU5NRmTAJVrmDQSS4y8PAnxA3baa85izGTg4YTuY2SdAEqStzPdlKaD
 jcrGzu7ADs9HzlBt1qQtIJRTE2hgGoNmndLH9jP41OT6h664sLMhblWkCnkwYUqv/efVGCSFqT
 cXERBEV4s7lyPpzC7EgHt9rtLtxZf1p9IGnFNLcHokQdyXNM/XXO04Os4ezFGk1QWVOR9ytbQs
 MeavI66n9qhURXDHsVhUCd4RuzRnigGuwoRBTTDjDwJfclqc5dMMWNngz5vpoa1zWVelnH9AGJ
 PCE=
X-SBRS: 5.1
X-MesageID: 47817631
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:X1yb1qoR8WMd9nyxluQCzGUaV5oTeYIsimQD101hICG8cqSj9v
 xGuM5rsiMc7wxhPk3I+OrwXJVoLkmxyXcY2+Ys1PKZLXDbUQiTXeRfBOnZsl7d8kTFn4Y3v8
 pdmupFeb/N5DBB/L7HCWKDc+rIruPozJyV
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47817631"
Date: Thu, 8 Jul 2021 12:30:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <YObh8vb+oNDgpCoI@perard>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
 <20210707164001.894805-3-anthony.perard@citrix.com>
 <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com> <YObY02T0Mhnw82DS@perard>
 <4667fbe6-8767-4769-7d3d-26ebfdf070ed@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4667fbe6-8767-4769-7d3d-26ebfdf070ed@citrix.com>

On Thu, Jul 08, 2021 at 12:23:38PM +0100, Andrew Cooper wrote:
> I'd go with simply:
> 
> "ninja is now required to build the latest version of QEMU, and not all
> distros have a suitable version.  Skip the QEMU build when ninja is not
> available".
> 
> Can fix on commit if you're happy with this.

Sounds good, thanks.

-- 
Anthony PERARD

