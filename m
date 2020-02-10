Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9772157FB3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 17:24:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Bou-000080-NE; Mon, 10 Feb 2020 16:22:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8uky=36=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1Bot-00007v-5f
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 16:21:59 +0000
X-Inumbo-ID: 756d4380-4c21-11ea-8cad-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 756d4380-4c21-11ea-8cad-bc764e2007e4;
 Mon, 10 Feb 2020 16:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581351717;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=g6uz3s5qVjZiJxQ36zneAuFPbr07H9dXg9X1pDHr8d4=;
 b=iG1JiFMByrWdthuWeWIehNUlD6bYh9cnQp3G376AvNSPSNKQb0O6E2ai
 w4yudTNbRRRjwp+d4b4cf42MajDHdAdrkwkbeSxXpPG1jx9EGNJfj96h+
 4yEzS7iYtULdZLlokS5+KVUtAI+ySnKu7YHpoxrPDlcNh239BgM9X51uq c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wqRmoZzxq3a00D5YRqGryZfcCA+1S458N7JJiuECQfmP23Men1tFVNa63i6frLbuYcUkio5rSO
 NGCGDjyAr7ou+M8LvirY1ig3bSE1fiTUEoND44g/3qU8RvVjmECD/1lpgXFjumhA9fu0W7Yfab
 s8Eb17w+z/S9bQV7WkuAmsePTzmiWvpKyxmdrag4XRS+Kat91rwrGxrLVj5GltelXxuK1rBDi5
 orIRU7HNd0FmxESNQycziibu0l6d6AhEfL6JixKIq8Ja6yu2v/bj38T389YjTyXgyX3zIQ59t7
 0U8=
X-SBRS: 2.7
X-MesageID: 12834568
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12834568"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24129.33570.817622.221192@mariner.uk.xensource.com>
Date: Mon, 10 Feb 2020 16:21:54 +0000
To: Christopher Clark <christopher.w.clark@gmail.com>
In-Reply-To: <20200210043516.1996-1-christopher.w.clark@gmail.com>
References: <20200210043516.1996-1-christopher.w.clark@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH] tools/configure: generate stubs and long-double
 32-bit headers if needed
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
 Rich Persaud <persaur@gmail.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hyaXN0b3BoZXIgQ2xhcmsgd3JpdGVzICgiW1BBVENIXSB0b29scy9jb25maWd1cmU6IGdlbmVy
YXRlIHN0dWJzIGFuZCBsb25nLWRvdWJsZSAzMi1iaXQgaGVhZGVycyBpZiBuZWVkZWQiKToKPiBU
aGUgZ251L3N0dWJzLTMyLmggYW5kIGJpdHMvbG9uZy1kb3VibGUtMzIuaCBoZWFkZXJzIGFyZSBy
ZXF1aXJlZCB0bwo+IGJ1aWxkIGh2bWxvYWRlciBidXQgYXJlIG5vdCBhbHdheXMgYXZhaWxhYmxl
IGluIDY0LWJpdCBidWlsZAo+IGVudmlyb25tZW50cy4gVG8gYXZvaWQgaW50cm9kdWNpbmcgYSBi
dWlsZCByZXF1aXJlbWVudCBvbiAzMi1iaXQKPiBtdWx0aWxpYiBnZW5lcmF0ZSB2ZXJzaW9ucyBv
ZiB0aGVtIGZyb20gdGhlIDY0LWJpdCBlcXVpdmFsZW50IGhlYWRlci4KPiAKPiBUaGlzIHBhdGNo
IGVuYWJsZXMgdGhlIHJlbW92YWwgb2YgZG93bnN0cmVhbSBwYXRjaGluZyB0aGF0IGhhcyBiZWVu
Cj4gY2FycmllZCBpbiB0aGUgWW9jdG8vT3BlbkVtYmVkZGVkIG1ldGEtdmlydHVhbGl6YXRpb24g
bGF5ZXIgc2luY2UgMjAxMi4KClRoYW5rcyBmb3IgdGhpcyBwYXRjaC4gIEhvd2V2ZXIsIEknbSBx
dWl0ZSBkb3VidGZ1bCBhYm91dCB0aGUKYXBwcm9hY2guCgo+ICsgICAgICAgIGVjaG8gJyNpbmNs
dWRlIDxnbnUvc3R1YnMtNjQuaD4nID5jb25mLXN0dWJzLmMKPiArICAgICAgICBTSVhUWV9GT1VS
X0hEUj1gJENDIC1NIGNvbmYtc3R1YnMuYyB8IGdyZXAgJy9zdHVicy02NC5oJCdgCj4gKyAgICAg
ICAgcm0gY29uZi1zdHVicy5jCj4gKyAgICAgICAgbWtkaXIgLXAgaW5jbHVkZS9nbnUKPiArICAg
ICAgICBjYXQgIiR7U0lYVFlfRk9VUl9IRFJ9IiB8IFwKPiArICAgICAgICAgICAgZ3JlcCAtdiAn
c3R1Yl9iZGZsdXNoXHxzdHViX2dldG1zZ1x8c3R1Yl9wdXRtc2cnID5pbmNsdWRlL2dudS9zdHVi
cy0zMi5oCj4gKyAgICAgICAgZWNobyBcI2RlZmluZSBfX3N0dWJfX19rZXJuZWxfY29zbCA+PiBp
bmNsdWRlL2dudS9zdHVicy0zMi5oCj4gKyAgICAgICAgZWNobyBcI2RlZmluZSBfX3N0dWJfX19r
ZXJuZWxfc2lubCA+PiBpbmNsdWRlL2dudS9zdHVicy0zMi5oCj4gKyAgICAgICAgZWNobyBcI2Rl
ZmluZSBfX3N0dWJfX19rZXJuZWxfdGFubCA+PiBpbmNsdWRlL2dudS9zdHVicy0zMi5oCgpUaGlz
IGNvZGUgc2VlbXMgdG8gYmUgYWQtaG9jIHNlZGRlcnkgd2hpY2ggZGVwZW5kcyBvbiB0aGUgZGV0
YWlscyBvZgp0aGUgZXhpc3RpbmcgaGVhZGVyIGZpbGUuICBUaGF0IHNlZW1zIGxpa2UgaXQgaXMg
dW5wcmluY2lwbGVkIGFuZApmcmFnaWxlLCB0byBtZS4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkg
eW91IHdvdWxkbid0IGp1c3QgbWFrZSBhIHNtYWxsIHBhY2thZ2Ugb3IKdGFyYmFsbCBvciBzb21l
dGhpbmcgY29udGFpbmluZyB0aGUgcmVsZXZhbnQgaGVhZGVycyBhbmQgaW5zdGFsbAp0aGF0ID8K
CkFsc28sIGRvbid0IHlvdSBuZWVkIGEgMzItYml0IGxpYmdjYyB0b28gPwoKVGhhbmtzLApJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
