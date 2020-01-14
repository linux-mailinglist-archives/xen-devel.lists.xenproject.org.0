Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D413B0FD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:33:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQ1X-0002Ds-5d; Tue, 14 Jan 2020 17:30:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irQ1V-0002Dh-T1
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:30:37 +0000
X-Inumbo-ID: 8ebe2248-36f3-11ea-a985-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ebe2248-36f3-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579023029;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=pJChP+msikcbPxbUc10dtn89lxVgFGT4f3as+Tn9HsE=;
 b=Nr1eYYhGNC8gSDn1WHk1WQQ2sDuPeaSK6xAJWzQuKgYd66fqsKmdjaNO
 NWm72BeHlm3vxV2NRtfwdPEo9DTgc/6f5xgbnk3D0VbASezKglCjAj3pH
 nDSz09wc49xPWE5EZIsoCNz/m52N1/ULLcX6/ZG6Xgs4o+U4cUuxiYxU8 s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j1595qxl3Eu+/3ZJbMhybcEUQjoL3niV1Qys55XGHha8kESz/e7nzL1pTw+h/nMrZSY9PTwz9B
 /Pmbzg/QkBwhie75/PQJ+BCF/VGruQV39lUOXwQ/BueWkELmeUl5KL51haij72mlr2FFaSzf7g
 OqE689ygsg66OLWRR6W4JWsbbfs98zj6aPZmT9scvkDZ5YH2/0vPMW/v5XD+37YIIOqawaKDvo
 9kMGTFDuUXxbPstfBtQrQmUT8Nbbg+kBPldzpe4BPzUYeIQyp9P9gkhAK6UkZK8nT1K/kBbPHR
 UvE=
X-SBRS: 2.7
X-MesageID: 10897465
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="10897465"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.64177.923164.677965@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 17:30:25 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200103130616.13724-4-andrew.cooper3@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
 <20200103130616.13724-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 17/20] tools/libx[cl]: Plumb
 static_data_done() up into libxl
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMTcvMjBdIHRvb2xzL2xpYnhbY2xdOiBQbHVt
YiBzdGF0aWNfZGF0YV9kb25lKCkgdXAgaW50byBsaWJ4bCIpOgo+ICAvKiBjYWxsYmFja3MgcHJv
dmlkZWQgYnkgeGNfZG9tYWluX3Jlc3RvcmUgKi8KPiAgc3RydWN0IHJlc3RvcmVfY2FsbGJhY2tz
IHsKPiArICAgIC8qCj4gKyAgICAgKiBDYWxsZWQgb25jZSB0aGUgU1RBVElDX0RBVEFfRU5EIHJl
Y29yZCBoYXMgYmVlbiByZWNlaXZlZC9pbmZlcnJlZC4KPiArICAgICAqIFBhc3NlcyBpbiB0aGUg
YmxvY2tzIG9mIHN0YXRpYyBkYXRhIHdoaWNoIGhhdmUgbm90IGJlZW4gcmVjZWl2ZWQsIHdoaWNo
Cj4gKyAgICAgKiB0aGUgaGlnaGVyIGxldmVsIHRvb2xzdGFjayBtdXN0IHByb3ZpZGUgYmFja3dh
cmRzIGNvbXBhdGliaWxpdHkgZm9yLgo+ICsgICAgICovCj4gKyNkZWZpbmUgWEdSX1NERF9NSVNT
SU5HX0NQVUlEICgxIDw8IDApCj4gKyNkZWZpbmUgWEdSX1NERF9NSVNTSU5HX01TUiAgICgxIDw8
IDEpCj4gKyAgICBpbnQgKCpzdGF0aWNfZGF0YV9kb25lKSh1bnNpZ25lZCBpbnQgbWlzc2luZywg
dm9pZCAqZGF0YSk7CgpUaGlzIGlzIGEgYml0IHdlaXJkLCBpc24ndCBpdCA/ICBJIG1lYW46IGlm
IHRoZXNlIGJsb2NrcyBvZiBkYXRhICphcmUqCnJlY2VpdmVkIHRoZW4gbGlieGMgaGFuZGxlcyB0
aGVtOyBidXQgaWYgdGhleSBhcmUgbm90LCBsaWJ4YydzIGNhbGxlcgptdXN0IGRvIHNvLgoKSSBh
cHByZWNpYXRlIHRoYXQgdGhlIGludGVyZmFjZSBhdCB0aGUgdG9wIG9mIGxpYnhjIGlzIGFscmVh
ZHkgcmF0aGVyCmNvbXBsZXggYW5kIHVuZXZlbiBidXQgdGhpcyBkb2Vzbid0IHNlZW0gdG8gYmUg
aGVscGluZy4uLgoKVGhlIGFjdHVhbCBjb2RlIGxvb2tzIE9LIHRvIG1lLgoKVGhhbmtzLApJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
