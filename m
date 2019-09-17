Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35DB53D5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:18:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAH52-0005nn-Jz; Tue, 17 Sep 2019 17:15:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAH50-0005nZ-Pf
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:15:54 +0000
X-Inumbo-ID: cd7f71e0-d96e-11e9-961c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd7f71e0-d96e-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740553;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=BmNQHqHfBgoW4CMwBeBqQstb4/asHF3jOlhkNr601Gk=;
 b=OVlfLQNLGbk/t6D3WYJcZC97b1U5/rlNStZtlFglgynf8Zdzjx/MrmUk
 +Fmlwc8G9kBxksfgoZvfM6D9iKlw6Bcc+uxsS58GncD77ZI1WKm5Wnypx
 8WPd65oe7ZXgxFPKhKpCf4sz9vqke2hrR/UpReIpdMAzBt1FzO5ruDAhM A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0dTUC+jiD0XWeCpl6A9V5A0lmRcDtsK10nqNdDxNbAV5L/eKUaoA26Y07LAkqEm07T3pT3Rg06
 FhLGV+PnJfv7HNKwRw8U6Z6Jpwplo4mcqw7ukUpngzU0vEkXaqDDrraCRWniAU/nGZAGTMeFDN
 gSStdf8DJk0ImJuE4rfBvV0iuS3bZCjOaHybG4SxtURiIkE4wesQm2dpt/QvP9x1tC147WD7zU
 ttw8WwjBOjWxYjrntPwHUdL3sDvH2+x4muywjoC9qUhNg/4mHu00RfA5rNWixV+lEGEokBDf5b
 JBw=
X-SBRS: 2.7
X-MesageID: 5685901
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5685901"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.5314.869997.485633@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:15:46 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-26-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-26-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 25/35] libxl_pci: Coding style of do_pci_add
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDI1LzM1XSBsaWJ4bF9wY2k6IENvZGluZyBz
dHlsZSBvZiBkb19wY2lfYWRkIik6Cj4gZG9fcGNpX2FkZCBpcyBnb2luZyB0byBiZSBhc3luY2hy
b25vdXMsIHNvIHdlIHN0YXJ0IGJ5IGhhdmluZyBhIHNpbmdsZQo+IHBhdGggb3V0IG9mIHRoZSBm
dW5jdGlvbi4gQWxsIGByZXR1cm5gcyBpbnN0ZWFkIHNldCByYyBhbmQgZ290byBvdXQuCj4gCj4g
V2hpbGUgaGVyZSwgc29tZSB1c2Ugb2YgYHJjJyB3YXMgdXNlZCB0byBzdG9yZSB0aGUgcmV0dXJu
IHZhbHVlIG9mCj4gbGlieGMgY2FsbHMsIGNoYW5nZSB0aGVtIHRvIHN0b3JlIGludG8gYHInLiBB
bHNvLCBhZGQgdGhlIHZhbHVlIG9mIGByJwo+IGluIHRoZSBlcnJvciBtZXNzYWdlIG9mIHRob3Nl
IGNhbGxzLgo+IAo+IFRoZXJlIHdlcmUgYW4gYG91dCcgbGFiZWwgdGhhdCB3YXMgdXNlIGl0IHNl
ZW1zIHRvIHNraXAgc2V0dGluZyB1cCB0aGUKPiBJUlEsIHRoZSBsYWJlbCBoYXMgYmVlbiByZW5h
bWVkIHRvIGBvdXRfbm9faXJxJy4KCkkgdGhpbmsgeW91IHdhbnQgdG8gd3JpdGUgIk5vIGZ1bmN0
aW9uYWwgY2hhbmdlIiA/CklmIHNvLCB0aGVuIHdpdGggdGhhdCBhZGRlZCB0byB0aGUgY29tbWl0
IG1lc3NhZ2U6CgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+CgpUaGFua3MsCmlhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
