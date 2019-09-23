Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B99BB5B2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:46:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOdC-0002eD-PU; Mon, 23 Sep 2019 13:43:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZLOQ=XS=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1iCOdA-0002e5-NW
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:43:56 +0000
X-Inumbo-ID: 2fba8154-de08-11e9-95fe-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fba8154-de08-11e9-95fe-12813bfff9fa;
 Mon, 23 Sep 2019 13:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569246236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bGxS8vo4TTx21EGHREpk2wYSrzAH8zda6z1wY+g6PkM=;
 b=dP6iOao1EVjK/dfTraq71bO2daLRWh7oKLWngqrM6E7Hh6EnKKZ634qd
 niH41bJOt2wbUCT48dppXY7NIt2VglU2sQt3mdXBryCISMrnsUrNVNkeB
 bhsEj4mtQIYXtwqWZsP8U6uEvPdKENKfEnZzGyymJd7mzVAxWTWt64mQK k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0WXs4AvPexnWdcEO14fru2seJRWBeXXbjQpYtqa1EturPYCLlekRjXax3RVz613PsQgGtRtI6I
 aqfiNj8OKcWF5bDyEoJLaZXZeQpPtdDYwptzsTzSz0O+ozif/fH7wK78Keu85c2FuY6v1hvjpX
 dC6+2yQIRn/VUtfmDnY6gFyMfL2JLYXMNYIiO9WMIIpf0Md7CWrDW4+6LD8ojeAN08TzfOMIo2
 R6WRWsMrPnFfMOzuRuIwRn4Acm6ilBnf94IYIR5Z4/EWuSz92PzxN+Qo7wo739xLJ+CBMzmhmH
 5mc=
X-SBRS: 2.7
X-MesageID: 5992300
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="5992300"
From: Christian Lindig <christian.lindig@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH REPOST v13 3/4] tools/ocaml: abi check: Cope with
 consecutive relevant enums
Thread-Index: AQHVbg54RGsg7Sx7Bkq/mHBajtuTGKc5KvkAgAABQIA=
Date: Mon, 23 Sep 2019 13:43:52 +0000
Message-ID: <321650BB-04BB-40D5-BA4B-57EDC6FF083E@citrix.com>
References: <20190918104718.3695-1-paul.durrant@citrix.com>
 <62d6130b1a4c41f28ddf95bb73f3af1a@AMSPEX02CL03.citrite.net>
In-Reply-To: <62d6130b1a4c41f28ddf95bb73f3af1a@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <E93FBBA8EBC4D342B4421093DD9E1915@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH REPOST v13 3/4] tools/ocaml: abi check: Cope
 with consecutive relevant enums
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDIzIFNlcCAyMDE5LCBhdCAxNDozOSwgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gUGluZz8gSSB0aGluayB0aGlzIGlzIHRoZSBvbmx5IHJl
bWFpbmluZyBwYXRjaCBpbiB0aGlzIHNlcmllcyB0aGF0IHN0aWxsIG5lZWRzIGFuIGFjay4KCkFj
a2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
