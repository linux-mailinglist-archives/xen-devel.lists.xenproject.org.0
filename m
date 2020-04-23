Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA20D1B5914
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:23:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZ0U-0001CG-Jq; Thu, 23 Apr 2020 10:22:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmme=6H=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRZ0S-0001AT-V0
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 10:22:56 +0000
X-Inumbo-ID: 659ca5b8-854c-11ea-933f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 659ca5b8-854c-11ea-933f-12813bfff9fa;
 Thu, 23 Apr 2020 10:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587637377;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nU6Y4kkVHHkj1jrwZ1jZ8l50lzOYrnbCWh/1N9UKlek=;
 b=cFGIj76MwcdfayXLzXL7hIbvQ+LJHYyWeesvGssSf+6ylYQEAJlyWeX3
 2hA4E/chKqGNKWmH2QW82NdBVNLCJ1rXk6tH3vWxmkEPMxjhXMe1duRLH
 wgcGKilI8Sud0TLBSkXKGMDEO/PqW34BRieQQ/LfDoIfOm7uVcfBvdbE5 E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mspqZjDSIMvmZflvLD+zdnB7AR1trZSPEY5EelXCpIoqJ66kNS0Cq1/VtY7TlBOrHdhn7e5N/2
 2CEZ+IU3J/TGJLLvVZRRZHq4ZilWeKvKvONFX/Cplky3XXMWPRzSnS+fssymbi80T1Cw9SmD46
 zKK6KxYVxBqliq0W6fuEO8QnTRyvfwTTvRedy3Hmk+1YQetTcfwbD2R6Zqm+unN7tGbJbDNMmX
 iqINUNXSVoZTtaJsv9KxDq44eQZqvYEFu0Tm/7EIg8jei8fKwBVwwG46v7XLgeZmh8LvBEmV35
 tQ8=
X-SBRS: 2.7
X-MesageID: 16103911
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,306,1583211600"; d="scan'208";a="16103911"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 4/4] golang/xenlight: add DeviceUsbdevAdd/Remove wrappers
Thread-Topic: [PATCH 4/4] golang/xenlight: add DeviceUsbdevAdd/Remove wrappers
Thread-Index: AQHWERYd3+QkSUgUBk+84Cm8kpq52KiGbo8A
Date: Thu, 23 Apr 2020 10:22:46 +0000
Message-ID: <F8B21573-2C49-4402-9CEB-C46CF8AFDCFC@citrix.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
 <1fcd31482f5183f29e9d949c6e17183b6b101c8b.1586727061.git.rosbrookn@ainfosec.com>
In-Reply-To: <1fcd31482f5183f29e9d949c6e17183b6b101c8b.1586727061.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2CB9B430F023AB4DBBCDAACE6DD933BB@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Apr 12, 2020, at 11:02 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Add DeviceUsbdevAdd and DeviceUsbdevRemove as wrappers for
> libxl_device_usbdev_add and libxl_device_usbdev_remove.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

