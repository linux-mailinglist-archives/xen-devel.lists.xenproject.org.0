Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E3B548B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:47:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAHX2-00039B-Rz; Tue, 17 Sep 2019 17:44:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAHX1-00038y-Lp
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:44:51 +0000
X-Inumbo-ID: d8c171a9-d972-11e9-961c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8c171a9-d972-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568742290;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=U+5ALrY685rBpPcnbKYYibyAHW1qnDJHjbmZpgBOXF4=;
 b=Qrxdb4Nj25PUXhYSmNT3o1fbv4xhgv7Fc7DsIzPQecqY7e8ipb/psmHl
 9eTSQdEnmH83DEBs0I8YyG1CQYivNbQ+8Vggoi8eEekNFZaXDAfaGKwhm
 GObt9fdjgrOmJko7Dsl1yu829eQZ4bkiKrfUlpYYD+AnM9J0cMUFYKpqQ Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XQXoRMxOHmW0ZaP5bELQHPw3Y3Ucwh9p0Z87fgUfSfs2UPgBowlE3c5wZH/9yoHSwI4ZRIpd6N
 LqcltNTQc1HJKlJiRhPbF6//HcDAUjyc3j333S7UIwErT/b9uYTTWn6JOgsgODhheITg/2xMD3
 OIhnIuoFfNc+pgkumh+Ae7QXlpdlYEzG3o/ZYPU7h17egindQnr+6Up5HskXIgwKJtEGrhm4/v
 TnJz3XZgBErBCwefnlOpvKIYAX6UrkhBI/6GS/wY+seD6PiheyTAiO9UkxQIHO99cjzyPrPJlo
 Cic=
X-SBRS: 2.7
X-MesageID: 5994515
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5994515"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.7055.525747.474236@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:44:47 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 00/35] libxl refactoring to use ev_qmp (with
 API changes)
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDAwLzM1XSBsaWJ4bCByZWZhY3RvcmluZyB0
byB1c2UgZXZfcW1wICh3aXRoIEFQSSBjaGFuZ2VzKSIpOgo+IE9uIHRoZSBxdWVzdCB0byBoYXZl
IFFFTVUgZGVwcml2aWxlZGdlLCB3ZSBuZWVkIHRvIG1ha2UgcXVpdGUgYSBmZXcgY2hhbmdlcyB0
bwo+IGxpYnhsLiBUaGlzIHBhdGNoIHNlcmllcyByZXdvcmsgcXVpdGUgYSBmZXcgbGlieGwgZmVh
dHVyZSB0byB1c2UgbGlieGxfX2V2X3FtcCwKPiB3aGljaCBpcyB0aGUgbmV3IGFzeW5jaHJvbm91
cyB3YXkgb2YgY29tbXVuaWNhdGluZyB3aXRoIFFFTVUgaW4gbGlieGwuCgpUaGFuayB5b3UgZm9y
IHRoaXMgd29yayEKCkkgd2FzIGEgYml0IGFmcmFpZCBpdCB3b3VsZCBiZSBoYXJkIHJlYWRpbmcg
YnV0IG1vc3Qgb2YgaXQgd2FzIHZlcnkKZWFzeS4gIFRoYW5rcyBmb3IgYnJlYWtpbmcgdGhpbmdz
IHVwIHNvIG5pY2VseTsgdGhhdCBtYWRlIG15IGpvYiBhIGxvdApiZXR0ZXIuCgpJIHRoaW5rIEkg
YW0gbm93IHVwIHRvIGRhdGUgb24gYWxsIHRoaXMuICBQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCB5
b3UKdGhpbmsgb2YgbXkgcmVxdWVzdHMgZm9yIGZ1cnRoZXIgcGF0Y2gtYXRvbWlzYXRpb24uICBJ
ZiB0aGF0J3MgZ29pbmcKdG8gYmUgYSBsb3Qgb2Ygd29yayBJIHdpbGwgc2ltcGx5IHN0YXJlIGF0
IHRoZSBjb2RlIGhhcmRlciBteXNlbGYuCgpSZWdhcmRzLApJYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
