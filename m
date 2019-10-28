Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA64E705B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:28:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3Ae-0004wo-HH; Mon, 28 Oct 2019 11:26:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP3Ac-0004ur-Ja
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 11:26:46 +0000
X-Inumbo-ID: d2031e52-f975-11e9-94f3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2031e52-f975-11e9-94f3-12813bfff9fa;
 Mon, 28 Oct 2019 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572262004;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=TmZna1+5cPf3gePZYEUUVdzAbeEb8y++5qgg4ti9fG4=;
 b=hfdH8OEsIQwWA33NIqCq3wRA7BCypK/+b7CMkDlywWxybumyCXqJVeyx
 3h8FcwUV0cYKi+/aYBsjZ52CClEseEchsVO3Ei1oUPt0kDTkHXuStnJrl
 XQ3sFG16lF/wSTA4Ni7MfCeYpCtCkX+Vvgjdpw9c+6w6kCW9q+rmTnzH/ Y=;
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
IronPort-SDR: s44TxI6EZItsWDyHL4Ct/M8uvThQkrAfm6FnyyGi2ytyFHQ98pdzsG8KaXSVarVK0umUrfrIHR
 BJLqcrgS0ALXksDUFsg0pEHV7QuhJzBmZk+k6N8XYf/LyAQkrRcgLtRV8i2rYUfNQsaL/+NYaC
 o8v97nqokOMlWl75OwFp4XG49nZa+EPi7rSkjLPOwFssgdwy/nLcCuzhXk7Do5FlFqQ87NW8un
 RwMYKPMS6Ujhzhpip5hADR4l4Fl0liL5I1xl/L0nyKFi7QGS49ypWj0c2DVJyiTn/QPwJzHmvq
 JFY=
X-SBRS: 2.7
X-MesageID: 7858429
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7858429"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23990.53361.316758.473175@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 11:26:41 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191025170505.2834957-2-anthony.perard@citrix.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
 <20191025170505.2834957-2-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 1/4] libxl: Introduce
 libxl__ev_child_kill
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

SGkuICBUaGFua3MuICBUaGUgY29kZSBoZXJlIGxvb2tzIGJ5IGFuZCBsYXJnZSBnb29kIHRvIG1l
IGJ1dCBJIHRoaW5rCnRoZSBkb2NzIGFuZCBtYXliZSB0aGUgbG9nIG1lc3NhZ2VzIG5lZWQgaW1w
cm92ZW1lbnQuCgpBbnRob255IFBFUkFSRCB3cml0ZXMgKCJbUkZDIFhFTiBQQVRDSCBmb3ItNC4x
MyAxLzRdIGxpYnhsOiBJbnRyb2R1Y2UgbGlieGxfX2V2X2NoaWxkX2tpbGwiKToKPiBBbGxvdyB0
byBraWxsIGEgY2hpbGQgYW5kIGRlcmVnaXN0ZXIgdGhlIGNhbGxiYWNrIGFzc29jaWF0ZWQgd2l0
aCBpdC4KCkRpZCB5b3UgcmVhZCB0aGUgZG9jIGNvbW1lbnQgYWJvdmUgbGlieGxfX2V2X2NoaWxk
X2ZvcmssIGluCmxpYnhsX2ludGVybmFsLmggbmVhciBsaW5lIDExNjAgPyAgVGhlIHVzZXIgb2Yg
bGlieGxfX2V2X2NoaWxkIGlzCmFscmVhZHkgcGVybWl0dGVkIHRvIGtpbGwgdGhlIGNoaWxkLgoK
SW4gdGhpcyBwYXRjaCBhcmUgYWRkaW5nIGEgbGF5ZXIgdG8gbWFrZSB0aGlzIG1vcmUgY29udmVu
aWVudCwgYW5kIGluCnBhcnRpY3VsYXIgdG8gbGV0IGEgbGlieGxfX2V2X2NoaWxkIHVzZXIgdHJh
bnNmZXIgcmVzcG9uc2liaWxpdHkgZm9yCnJlYXBpbmcgdGhlIGNoaWxkIGZyb20gaXRzIG93biBh
cHBsaWNhdGlvbiBsb2dpYyBpbnRvIHRoZSBhbyBzeXN0ZW0uCgpTb21lIG1vcmUgQVBJIGRvY3Vt
ZW50YXRpb24gdG8gbWFrZSB0aGlzIG11Y2ggbW9yZSBleHBsaWNpdCB3b3VsZCBiZQpnb29kIC0g
aWUgdGhlIG1haW4gZG9jIGNvbW1lbnQgdGhlIGZhY2lsaXR5IG5lZWRzIHRvIGRpc2N1c3MgaXQ6
CiB8ICogSXQgaXMgbm90IHBvc3NpYmxlIHRvICJkZXJlZ2lzdGVyIiB0aGUgY2hpbGQgZGVhdGgg
ZXZlbnQgc291cmNlCl4gdGhpcyBpcyBubyBsb25nZXIgdHJ1ZSBhZnRlciB5b3VyIHBhdGNoOyBp
bmRlZWQgdGhhdCdzIHRoZSBwb2ludC4KClNvIHBlcmhhcHMKCj4gK3ZvaWQgbGlieGxfX2V2X2No
aWxkX2tpbGwobGlieGxfX2FvICphbywgbGlieGxfX2V2X2NoaWxkICpjaCkKCnNob3VsZCBiZSBj
YWxsZWQKICAgbGlieGxfX2V2X2NoaWxkX3JlYXR0YWNoX3RvX2FvCm9yCiAgIGxpYnhsX19ldl9j
aGlsZF9raWxsX2RlcmVnaXN0ZXIKb3Igc29tZXRoaW5nLCBhbmQgbWF5YmUgaXQgc2hvdWxkIHRh
a2UgYSBzaWduYWwgbnVtYmVyID8KCj4gK3N0YXRpYyB2b2lkIGRlcmVnaXN0ZXJlZF9jaGlsZF9j
YWxsYmFjayhsaWJ4bF9fZWdjICplZ2MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsaWJ4bF9fZXZfY2hpbGQgKmNoLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGlkX3QgcGlkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaW50IHN0YXR1cykKPiArewo+ICsgICAgZXZfY2hpbGRfa2lsbGVkICpj
ayA9IENPTlRBSU5FUl9PRihjaCwgKmNrLCBjaCk7Cj4gKyAgICBFR0NfR0M7Cj4gKwo+ICsgICAg
aWYgKHN0YXR1cykgewo+ICsgICAgICAgIGxpYnhsX3JlcG9ydF9jaGlsZF9leGl0c3RhdHVzKENU
WCwgWFRMX0VSUk9SLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJr
aWxsZWQgZm9yayAoZHlpbmcgYXMgZXhwZWN0ZWQpIiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwaWQsIHN0YXR1cyk7Cj4gKyAgICB9IGVsc2Ugewo+ICsgICAgICAg
IExPRyhERUJVRywgImtpbGxlZCBjaGlsZCBleGl0IGNsZWFubHksIHVuZXhwZWN0ZWQiKTsKCkkg
ZG9uJ3QgdGhpbmsgdGhpcyBpcyBlbnRpcmVseSB1bmV4cGVjdGVkLiAgTWF5YmUgdGhlIGNoaWxk
IHdhcyBqdXN0CmV4aXRpbmcgYXQgdGhlIHBvaW50IHdoZXJlIGxpYnhsX19ldl9jaGlsZF9raWxs
IHdhcyBjYWxsZWQuCgpBbmQsIHBsZWFzZSBjaGVjayBsb2cgdGhlIGFjdHVhbCB3aG9sZSBleGl0
IHN0YXR1cy4gICJzdGF0dXMiIGlzIGEKd2FpdCBzdGF0dXMuICBXZSB3YW50IHRvIGtub3cgd2hh
dCBzaWduYWwgaXQgZGllZCBmcm9tLCB3aGV0aGVyIGl0CmNvcmUgZHVtcGVkLCB0aGUgZXhpdCBz
dGF0dXMsIGV0Yy4gIFByb2JhYmx5LCB5b3Ugc2hvdWxkIGNhbGwKbGlieGxfcmVwb3J0X2NoaWxk
X2V4aXRzdGF0dXMuCgo+IEBAIC0xODkxLDcgKzE4OTEsOCBAQCBzdGF0aWMgYm9vbCBhb193b3Jr
X291dHN0YW5kaW5nKGxpYnhsX19hbyAqYW8pCj4gICAgICAgKiBkZWNyZW1lbnQgcHJvZ3Jlc3Nf
cmVwb3J0c19vdXRzdGFuZGluZywgYW5kIGNhbGwKPiAgICAgICAqIGxpYnhsX19hb19jb21wbGV0
ZV9jaGVja19wcm9ncmVzc19yZXBvcnRzLgo+ICAgICAgICovCj4gLSAgICByZXR1cm4gIWFvLT5j
b21wbGV0ZSB8fCBhby0+cHJvZ3Jlc3NfcmVwb3J0c19vdXRzdGFuZGluZzsKPiArICAgIHJldHVy
biAhYW8tPmNvbXBsZXRlIHx8IGFvLT5wcm9ncmVzc19yZXBvcnRzX291dHN0YW5kaW5nCj4gKyAg
ICAgICAgfHwgYW8tPm91dHN0YW5kaW5nX2tpbGxlZF9jaGlsZDsKPiAgfQoKSSB3b25kZXIgaWYg
dGhpcyBzaG91bGQgZ2FpbiBhIG5ldyBkZWJ1ZyBtZXNzYWdlLiAgSWYgdGhlIGNoaWxkIGdldHMK
bG9zdCBvciBzdHVjayBmb3Igc29tZSByZWFzb24sIGl0IHdpbGwgb3RoZXJ3aXNlIHJlcXVpcmUg
c2VhcmNoaW5nIHRoZQpwYXN0IGxvZyB0byBmaW5kIG91dCB3aHkgdGhlIGFvIGRvZXNuJ3QgcmV0
dXJuLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
