Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0398127ACA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 13:13:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiH5T-0006WM-Gk; Fri, 20 Dec 2019 12:08:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiH5R-0006WH-Rk
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 12:08:53 +0000
X-Inumbo-ID: 7ce59f47-2321-11ea-9340-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ce59f47-2321-11ea-9340-12813bfff9fa;
 Fri, 20 Dec 2019 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576843733;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=BWue+qTKWsr/l/lNqAdcILnhNwmC4woSVp0Ix48lxV4=;
 b=Hwcbs0wbziLaeuZeHpzwyo1cH+762o8f1nYRUsXQG6+cIASAWqa878JQ
 ZFsG58nme3wh5GuWfFgW8glXExBpOuAL0vFasqlD8wmdlFdROixGyV5Hy
 3cW2KTJh1ZhUycKJkFWKSPqKytsBQbMktEKP5a9YF2FHz7aj70Ui9EO/L I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WVL+h7KHpkeU5taY2mh8GlBaoysFEA62xrjidS5rUorICd7RFIZTcN/lYDfN4m44zXdwSoda5x
 sc+Z+zh/BDtSI08h/LB2JdqDUlT3XTTIIi1d9xG1WGeI/KscsswM05742rAXM5lo2IxmCBuxak
 /lD2brr/wRzCHNbES9U8dS915fpSNxLD1i2nu4bwo3sPP0c8nhMe2M0DQPi9bALXgzrLxFXjwy
 Ga+TM376uUaPZIT0Nd+A14oIW9nOYb91+Gcoo7Sf0drB2BH7j/Juh8hh7tod6BhN2ZToTDDBif
 aAE=
X-SBRS: 2.7
X-MesageID: 9997931
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,335,1571716800"; 
   d="scan'208";a="9997931"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24060.47569.695421.196780@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 12:08:49 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191219140656.9906-1-andrew.cooper3@citrix.com>
References: <20191219140656.9906-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH] libxc/restore: Fix data auditing in
 handle_x86_pv_info()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhjL3Jlc3RvcmU6IEZpeCBkYXRhIGF1
ZGl0aW5nIGluIGhhbmRsZV94ODZfcHZfaW5mbygpIik6Cj4gaGFuZGxlX3g4Nl9wdl9pbmZvKCkg
aGFzIGEgc3VidGxlIGJ1Zy4gIEl0IHVzZXMgYW4gJ2Vsc2UgaWYnIGNoYWluIHdpdGggYQo+IGNs
YXVzZSBpbiB0aGUgbWlkZGxlIHdoaWNoIGRvZXNuJ3QgZXhpdCB1bmNvbmRpdGlvbmFsbHkuICBJ
biBwcmFjdGljZSwgdGhpcwo+IG1lYW5zIHRoYXQgd2hlbiByZXN0b3JpbmcgYSAzMmJpdCBQViBn
dWVzdCwgbGF0ZXIgc2FuaXR5IGNoZWNrcyBhcmUgc2tpcHBlZC4KPiAKPiBSZXdvcmsgdGhlIGxv
Z2ljIGEgbGl0dGxlIHRvIGJlIHNpbXBsZXIuICBUaGVyZSBhcmUgZXhhY3RseSB0d28gdmFsaWQK
PiBjb21iaW5hdGlvbnMgb2YgZmllbGRzIGluIFg4Nl9QVl9JTkZPLCBzbyBmYWN0b3IgdGhpcyBv
dXQgYW5kIGNoZWNrIHRoZW0gYWxsCj4gaW4gb25lIGdvLCBiZWZvcmUgbWFraW5nIGFkanVzdG1l
bnRzIHRvIHRoZSBjdXJyZW50IGRvbWFpbi4KPiAKPiBPbmNlIGFkanVzdG1lbnRzIGhhdmUgYmVl
biBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5LCBzYW5pdHkgY2hlY2sgdGhlIHJlc3VsdAo+IGFnYWlu
c3QgdGhlIFg4Nl9QVl9JTkZPIHNldHRpbmdzIGluIG9uZSBnbywgcmF0aGVyIHRoYW4gcGllY2V3
aXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
