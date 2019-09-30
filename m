Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17331C25C4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 19:27:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEzQS-0003uI-Ir; Mon, 30 Sep 2019 17:25:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QDh0=XZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iEzQR-0003tt-1n
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 17:25:31 +0000
X-Inumbo-ID: 4cb769bc-e3a7-11e9-8628-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 4cb769bc-e3a7-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569864331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ztb5O0vtThH7+sKudU/XRK83D2p2vFxm9enE0x6x+Ig=;
 b=JrF/FwREWCPQ3N/a34xF2QNM5QaRqMg8TS+AOzZyWvDR3wFo9rFTIeH/
 J0Ezh7Sowgfi1FjBtR8ZX0bY4nMVZArgWkAJwTwBQPn5Ov+DYqga5PW9D
 K24uO1MSlazFdd+ewAZO6g/ffZQH5Gx8wK9hsLepLausqhre1aQY07QQk I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: h2un3FwSNoMhLmOuXk63u4CZrYsiKq+nWc8RqHGMDqXeEHWU9Juq71wJ/EQymqlDCnZcL0XkIa
 aczUb1qwFtuN3hDUzhKc3t5gB5wc+G6KtqrcuKuw+psvBzU1nEVCAIGtRWlsG0BKTIHawBNh6b
 HpfBvDMeJILocuCOR3c3HCHgIkM0yg8xI85qKbevmWQujv+vUvFaQbIuUbVbK51JJ1gob6Jws6
 WIpPbTyhUP6D9fPMEFsP2vfqOu1yxvpTzV70RUgyTkj7ROmmVS2z5FxX4QQp3R4PpxXnjLUCmv
 SAc=
X-SBRS: 2.7
X-MesageID: 6336776
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,568,1559534400"; 
   d="scan'208";a="6336776"
Date: Mon, 30 Sep 2019 18:25:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20190930172527.GF1163@perard.uk.xensource.com>
References: <4010b453-54cc-152d-27c7-a7d5cb4acb11@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4010b453-54cc-152d-27c7-a7d5cb4acb11@eikelenboom.it>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] Xen-unstable: regression when trying to shutdown
 HVM guest with pci passthrough
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBTZXAgMjksIDIwMTkgYXQgMDg6Mjc6MTBQTSArMDIwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IEhpIEFudGhvbnksCj4gCj4gV2hpbGUgdGVzdGluZyBJIGVuY291bnRlcmVk
IGEgcHJvYmxlbSB3aXRoIG15IEhWTSBndWVzdHMgd2hpY2ggdXNlIHBjaSBwYXNzdGhyb3VnaC4K
PiBXaGVuIHRyeWluZyB0byBzaHV0ZG93biB0aGUgZ3Vlc3QgaXQgd2lsbCBzdGF5IGluIHRoZSAi
LS0tcy0tIiBydW5zdGF0ZSBpbmRlZmluaXRlbHkuCj4gCj4gT24gdGhlIGd1ZXN0IGNvbnNvbGUg
SSBnZXQ6Cj4gICAgIFsgIDUxOC41ODc2NjldIHhlbmJ1czogeGVuYnVzX2Rldl9zaHV0ZG93bjog
ZGV2aWNlL3BjaS8wOiBJbml0aWFsaXNpbmcgIT0gQ29ubmVjdGVkLCBza2lwcGluZwo+ICAgICBb
ICA1MTguNjc0ODcwXSBBQ1BJOiBQcmVwYXJpbmcgdG8gZW50ZXIgc3lzdGVtIHNsZWVwIHN0YXRl
IFM1Cj4gICAgIFsgIDUxOC42ODM5NTJdIHJlYm9vdDogUG93ZXIgZG93bgo+IAo+IFdoZW4gdHJ5
aW5nIHRvIGRlc3Ryb3kgdGhlIHN0dWNrIGd1ZXN0IEkgZ2V0Ogo+IAlsaWJ4bDogZXJyb3I6IGxp
YnhsX2RvbWFpbi5jOjExNjU6ZGVzdHJveV9kb21pZF9wY2lfZG9uZTogRG9tYWluIDk6UGNpIHNo
dXRkb3duIGZhaWxlZAo+IAlsaWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjEwODk6ZG9tYWlu
X2Rlc3Ryb3lfY2FsbGJhY2s6IERvbWFpbiA5OlVuYWJsZSB0byBkZXN0cm95IGd1ZXN0Cj4gCWxp
YnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTAxNjpkb21haW5fZGVzdHJveV9jYjogRG9tYWlu
IDk6RGVzdHJ1Y3Rpb24gb2YgZG9tYWluIGZhaWxlZCBkZXN0cm95IGZhaWxlZCAocmM9LTkpCj4g
Cj4gQmlzZWN0aW9uIHR1cm5lZCB1cCBjb21taXQgZmFlNDg4MGM0NWZlMDE1ZTU2N2FmYTIyM2Y3
OGJmMTdhNmQ5OGUxYiAibGlieGxfcGNpOiBVc2UgZXZfcW1wIGZvciBwY2lfcmVtb3ZlIiBhcyB0
aGUgY3VscHJpdC4KClRoYW5rcyBmb3IgdGhlIHJlcG9ydCBhbmQgdGhlIGJpc2VjdGlvbiEKCkkn
dmUgc2VudCBhIHBhdGNoIHdoaWNoIEkgdGhpbmsgc2hvdWxkIGZpeCB0aGlzLgoKQ2hlZXJzLAoK
LS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
