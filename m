Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902E10D792
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:04:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahkm-000678-D6; Fri, 29 Nov 2019 15:00:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUI4=ZV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iahkk-00066z-NZ
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:00:14 +0000
X-Inumbo-ID: f23dc13e-12b8-11ea-a3e7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f23dc13e-12b8-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0rFRPWgFoCoXHpD5aUkY0O2cDWq39XaQXIVJvAvRnsg=;
 b=JaQck9FwFNDLZ6EAON5VvoW29kG5aZF/iAqTPuAA4nHpG8nWFBW3izcZ
 TC8BpKOzfNYkGegWQkSeTCk+AoZUxi43Y0m8tTguys/tXWy4SV3SvXRq2
 45a7XvUHnJlB54TjJiAYOlK6IxXolJv4SPNPEsyW8Rzr1Y1jGKyJR+BJn Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uBLaSy9gdKqd7c8q6oQXhHoNzphxqnX5FXZDO5cTbo3sg4/fdD6hKI6Tj6BkfSHBbu7gc5Dcv1
 puKQUAEc4OPm7xMTzT/NWdB+3T59tPXuxHwt2zsEdH6XyhS2qiLozezQ46Wx1CuBuKnpKPc63x
 +JPcrfykPSLELLL3ABg4NXdTQqipqNNyes/zN+RwP/LhV28Rh67mxAbUt21+H/LoAA9g1PufmV
 aHeVBsVbmiiEBG1BZe/2M7WJiygShEQclQaVlTOADHB4Z6HhQ9R+fHK4yH9R6OErJIKJH7mUPD
 lDs=
X-SBRS: 2.7
X-MesageID: 8983823
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8983823"
Date: Fri, 29 Nov 2019 16:00:06 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191129150006.GZ980@Air-de-Roger>
References: <20191129134306.2738-1-pdurrant@amazon.com>
 <20191129134306.2738-3-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129134306.2738-3-pdurrant@amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] block/xen-blkback: allow module to
 be cleanly unloaded
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDE6NDM6MDZQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEFkZCBhIG1vZHVsZV9leGl0KCkgdG8gcGVyZm9ybSB0aGUgbmVjZXNzYXJ5IGNsZWFu
LXVwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNv
bT4KCkxHVE06CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpBRkFJQ1Qgd2Ugc2hvdWxkIG1ha2Ugc3VyZSB0aGlzIGlzIG5vdCBjb21taXR0ZWQg
YmVmb3JlIHBhdGNoIDEsIG9yCmVsc2UgeW91IGNvdWxkIHVubG9hZCBhIGJsa2JhY2sgbW9kdWxl
IHRoYXQncyBzdGlsbCBpbiB1c2U/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
