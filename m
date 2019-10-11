Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DB9D43B1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 17:04:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIwN0-0001vT-4D; Fri, 11 Oct 2019 14:58:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIwMy-0001vO-UL
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 14:58:16 +0000
X-Inumbo-ID: 87771d7a-ec37-11e9-933b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87771d7a-ec37-11e9-933b-12813bfff9fa;
 Fri, 11 Oct 2019 14:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570805885;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ZqjH8/UEVTEXmGTsnBHznuAxrxT2Ur4HEdVGPaEt5jk=;
 b=Ja0KI2pdV4rN7vNsDNLNb6ZiSrweVaQnO8hOFx+9YRvu/H89B4FMXl1o
 IzB2vfz/6MOU8oCfFjiR/Khp3N9jOOYZArYZv36CBkF407GQ9n5zExiVc
 Jbo1sBeWtJHuxhgs8NQ2OA+g3xk16gl1AeYT0gZcLjoQaGfcV+cR8TZWh Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VgWl4zmFGrxCMEC6INpzMAYSqxndMEeFUK88xqWp8yRnPvINCuTFpciEy3o7FqpN8VDV6+wFt9
 tgntRkvFe9DS1LVuhCqs0iTYnRNyNNlSSCjBVGjfS03SF2z/5zv0P4UJETogvLwlxcPTcTTRML
 9jRWbldcTo2TBJF1ppM5RSTKf/QUpU9Pk1FQtSmPAP9u5IEW2Bpx5AX1h1iPx29r3/Z0IzqbEY
 5+7PxF1yCYR0Y650grA7cr8VCD4hzdJCeR6Mhrh/cHdZFFTC84hUwy8Sxb8gJ3D75n1WRxNAhO
 X7E=
X-SBRS: 2.7
X-MesageID: 7085743
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="7085743"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.39034.34800.276030@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 15:58:02 +0100
To: Oleksandr Grytsov <al1img@gmail.com>
In-Reply-To: <20191008141024.10885-2-al1img@gmail.com>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/2] libxl: introduce new backend type
 VINPUT
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
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYxIDEvMl0gbGlieGw6IGludHJvZHVj
ZSBuZXcgYmFja2VuZCB0eXBlIFZJTlBVVCIpOgo+IEZyb206IE9sZWtzYW5kciBHcnl0c292IDxv
bGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KPiAKPiBUaGVyZSBhcmUgdHdvIGtpbmQgb2YgVktC
RCBkZXZpY2VzOiB3aXRoIFFFTVUgYmFja2VuZCBhbmQgdXNlciBzcGFjZQo+IGJhY2tlbmQuIElu
IGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdGhleSBjYW4ndCBiZSBkaXN0aW5ndWlzaGVkIGFzIGJv
dGggdXNlCj4gVktCRCBiYWNrZW5kIHR5cGUuIEFzIHJlc3VsdCwgdXNlciBzcGFjZSBLQkQgYmFj
a2VuZCBpcyBzdGFydGVkIGFuZAo+IHN0b3BwZWQgYXMgUUVNVSBiYWNrZW5kLiBUaGlzIGNvbW1p
dCBhZGRzIG5ldyBkZXZpY2Uga2luZCBWSU5QVVQgdG8gYmUKPiB1c2VkIGFzIGJhY2tlbmQgdHlw
ZSBmb3IgdXNlciBzcGFjZSBLQkQgYmFja2VuZC4KCkkgZmluZCB0aGlzIGNvbmZ1c2luZy4gIEkn
bSBub3Qgc3VyZSB0aGlzIGNoYW5nZSBpcyByaWdodC4gIEJ1dCBJJ20KYWZyYWlkIHRoZSBvcmln
aW5hbCBwYXRjaGVzIGluIHRoaXMgYXJlYSBwYXNzZWQgbWUgYnkgc28gSSBkb24ndCBrbm93Cm11
Y2ggYWJvdXQgaXQuCgpJIHRoaW5rIGl0IHdhcyBhNDhlMDBmMTRhMmQgImxpYnhsOiBhZGQgYmFj
a2VuZCB0eXBlIGFuZCBpZCB0byB2a2IiCndoaWNoIGludHJvZHVjZWQgd2hhdCB5b3UgYXJlIGNh
bGxpbmcgInVzZXIgc3BhY2UiIGJhY2tlbmRzLiAgSXQKYXBwZWFycyB0aGF0IHRoZSB2a2IgYmFj
a2VuZCB0eXBlIGVudW0gd2FzIGludHJvZHVjZWQgdGhlcmUKc3BlY2lmaWNhbGx5IHRvIGRpc3Rp
bmd1aXNoIGJldHdlZW4gdGhlc2UgdHdvIHNpdHVhdGlvbnMuICBGb3IgcmVhc29ucwoKQW0gSSB3
cm9uZyA/ICBJZiBub3QsIHdoeSBpcyB0aGlzIG5vdCB3b3JraW5nIG9yIG5vdCBzdWl0YWJsZSA/
CgpJIGFsc28gZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhlICJ1c2VyIHNwYWNlIiBrYmQgYmFja2Vu
ZCBzZWVtcyB0byBiZQoibGludXgiIGluIHRoZSBlbnVtLiAgV2hlcmUgaXMgdGhlIGltcGxlbWVu
dGF0aW9uIG9mIHRoaXMgdXNlciBzcGFjZQpiYWNrZW5kID8gIElzIGl0IGJlIGNvbnRyb2xsZWQg
ZW50aXJlbHkgdGhyb3VnaCB4ZW5zdG9yZSA/CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
