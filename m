Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C139FB6195
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:42:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXNE-0001h5-4D; Wed, 18 Sep 2019 10:39:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bm4j=XN=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAXNC-0001gd-LE
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:39:46 +0000
X-Inumbo-ID: a0eaa388-da00-11e9-962b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0eaa388-da00-11e9-962b-12813bfff9fa;
 Wed, 18 Sep 2019 10:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568803185;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=kneoa6t+RL9JChmEQMtILEENftzvbvb5EQsW1K1N5G4=;
 b=RiTlH7J5KPKqbwdPZQtgUeQ7O7AjkaGHAUXPflOQBvQ7CXEBRM1Z9omG
 Fp7DOEFc+YDfzRkiuoX7uLw0eEfg24AIzAWZqK7WTYU6K2BCpyxtbj4R5
 SWU8iVs8pkdSKfVumlxhKXhyC8KvH1ukngBNx7PmS2sWn6mu6QgUDsxjO s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YKhzn3wf8a/7M14GN/3fOmBLnK1Ym5XVgCuzqTs/hXCzZT51oZ9dCx0H7F8EaBBDAJGwOmiTBF
 lZtCgMDaPz25813c2rHHFLvh4MvwToHwtuCQjeQDClFR11BsyPlGmPksLYs261bUphewrzJiCb
 QzA5YXKjKmYQTJoef4IiBR2t5KrkbZ7G5pxhA9+/HNCb/oulY2t091sAjo2kgq+WXjykJQDJg/
 P4YNt4Vte5QYeDnfPiQqVW22xYnwvaNazN3/JqMtRRMiQJMAcfB0lXJUPDBdrdcGPAkuPuRDWL
 J3M=
X-SBRS: 2.7
X-MesageID: 5921939
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5921939"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23938.2413.911345.500080@mariner.uk.xensource.com>
Date: Wed, 18 Sep 2019 11:39:41 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190918101736.GK1308@perard.uk.xensource.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-12-anthony.perard@citrix.com>
 <23937.3411.877144.354998@mariner.uk.xensource.com>
 <20190918101736.GK1308@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 11/15] libxl_usb: Fix wrong usage of asserts
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCAxMS8xNV0gbGlieGxfdXNiOiBGaXgg
d3JvbmcgdXNhZ2Ugb2YgYXNzZXJ0cyIpOgo+IE9uIFR1ZSwgU2VwIDE3LCAyMDE5IGF0IDA1OjQ0
OjAzUE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gQW50aG9ueSBQRVJBUkQgd3JpdGVz
ICgiW1BBVENIIDExLzE1XSBsaWJ4bF91c2I6IEZpeCB3cm9uZyB1c2FnZSBvZiBhc3NlcnRzIik6
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgo+ID4gCj4gPiBJJ20gbm90IHN1cmUgd2h5IHlvdSB3b3VsZG4ndCBqdXN0IGRlbGV0
ZSB0aGUgYnJlYWtzLCByYXRoZXIgdGhhbgo+ID4gcmVwbGFjaW5nIHRoZW0gInJldHVybiIgPwo+
IAo+IEJlY2F1c2UgYXNzZXJ0cyBhcmVuJ3Qgc3VwcG9zZWQgdG8gYmUgY29tcGlsZWQgaW4gYSBy
ZWxlYXNlIGJ1aWxkLiBJCj4ga25vdyB0aGF0J3Mgbm90IHRoZSBjYXNlIGluIGxpYnhsLi4uCgpP
aCBJIHNlZS4KCj4gSSBjb3VsZCByZXBsYWNlIHRoZSBhc3NlcnQoMCkgYnkgYWJvcnQoKSBpbnN0
ZWFkLCB0aGV5IHdvbid0IGJlIG5lZWQgZm9yCj4gYSBicmVhayBvciByZXR1cm4gYWZ0ZXIgaXQu
CgpZZXMsIHBsZWFzZS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
