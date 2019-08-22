Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D79900D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 11:54:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0jk6-00046S-3n; Thu, 22 Aug 2019 09:50:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JKi2=WS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i0jk4-00046N-Ci
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 09:50:52 +0000
X-Inumbo-ID: 5327f81a-c4c2-11e9-add3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5327f81a-c4c2-11e9-add3-12813bfff9fa;
 Thu, 22 Aug 2019 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566467451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kb0GU+ttBMqRVpJsDsEvrY2dU+fDlmOn6LXpmrXVq0g=;
 b=Kd/ecNWAQ8wcf9szVo0RP3Jvk0ulg/uesVN6Jng2+kw+HNRKFF2WNKO8
 xeLT2CQrDHzcnta2buK0zIiaRA6I5d4ENI9M7faqu7DGGm9bAw6i8sYNX
 E1T2vklPrJPft3WiVwhB7uwgYFttPb4ydO+QINz/Btuzdxa8X+m1UY3nB E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O9lKIgEh6B6Slbx5Zm/CVt7/QI5+5ITpOd2Z8y6YogdRKcgGkRmzoASFSGOvGW8DP9UsUT/3iB
 yftONNVb6wGJrqkcMMwzEbxojfNQOPZojwx/HAsRpdtrW0hnr6/HG2f/tVMSCG9HpLwSF/WEVu
 cbHUTnVq7EBs4ek9i4i+genesI7ftx1N9LR3umSRsaKXhJ67oJY5aZfA0fxhSEkrNtVvrS588t
 01yrRYs33R5eymDsakQQRSHkWMWOjV3Yr0mPXKO1Y56zjtjKjocqaAEXN4O6dcJTA16nY+Gk73
 IVs=
X-SBRS: 2.7
X-MesageID: 4827446
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4827446"
Date: Thu, 22 Aug 2019 10:50:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190822095043.GI1289@perard.uk.xensource.com>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-2-anthony.perard@citrix.com>
 <b3a6a2e0022c4785a4a04a809d948cef@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3a6a2e0022c4785a4a04a809d948cef@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 1/2] xen-bus: Fix backend state transition
 on device reset
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMTA6MzY6NDBBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4tYnVzLmMgYi9ody94ZW4veGVuLWJ1cy5j
Cj4gPiBpbmRleCBlNDA1MDAyNDJkLi45ODJlY2E0NTMzIDEwMDY0NAo+ID4gLS0tIGEvaHcveGVu
L3hlbi1idXMuYwo+ID4gKysrIGIvaHcveGVuL3hlbi1idXMuYwo+ID4gQEAgLTU0MCw5ICs1NDAs
MTEgQEAgc3RhdGljIHZvaWQgeGVuX2RldmljZV9iYWNrZW5kX2NoYW5nZWQodm9pZCAqb3BhcXVl
KQo+ID4gICAgICAvKgo+ID4gICAgICAgKiBJZiB0aGUgdG9vbHN0YWNrIChvciB1bnBsdWcgcmVx
dWVzdCBjYWxsYmFjaykgaGFzIHNldCB0aGUgYmFja2VuZAo+ID4gICAgICAgKiBzdGF0ZSB0byBD
bG9zaW5nLCBidXQgdGhlcmUgaXMgbm8gYWN0aXZlIGZyb250ZW5kIChpLmUuIHRoZQo+ID4gLSAg
ICAgKiBzdGF0ZSBpcyBub3QgQ29ubmVjdGVkKSB0aGVuIHNldCB0aGUgYmFja2VuZCBzdGF0ZSB0
byBDbG9zZWQuCj4gPiArICAgICAqIHN0YXRlIGlzIG5vdCBDb25uZWN0ZWQgb3IgQ2xvc2luZykg
dGhlbiBzZXQgdGhlIGJhY2tlbmQgc3RhdGUKPiA+ICsgICAgICogdG8gQ2xvc2VkLgo+ID4gICAg
ICAgKi8KPiA+ICAgICAgaWYgKHhlbmRldi0+YmFja2VuZF9zdGF0ZSA9PSBYZW5idXNTdGF0ZUNs
b3NpbmcgJiYKPiA+ICsgICAgICAgIHhlbmRldi0+ZnJvbnRlbmRfc3RhdGUgIT0gWGVuYnVzU3Rh
dGVDbG9zaW5nICYmCj4gPiAgICAgICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlICE9IFhlbmJ1
c1N0YXRlQ29ubmVjdGVkKSB7Cj4gPiAgICAgICAgICB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X3N0
YXRlKHhlbmRldiwgWGVuYnVzU3RhdGVDbG9zZWQpOwo+IAo+IEFjdHVhbGx5LCBJIHdvbmRlciB3
aGV0aGVyIGl0IGlzIGJldHRlciB0byAnd2hpdGVsaXN0JyBoZXJlPyBBRkFJSyB0aGUgb25seSB2
YWxpZCBmcm9udGVuZCBzdGF0ZXMgd2hldGhlciB0aGUgYmFja2VuZCBzaG91bGQgc2V0IGl0c2Vs
ZiAnY2xvc2VkJyBhcmUgJ2Nsb3NlZCcgKGkuZS4gdGhlIGZyb250ZW5kIGlzIGZpbmlzaGVkKSBh
bmQgJ2luaXRpYWxpc2luZycgKHRoZSBmcm9udGVuZCB3YXMgbmV2ZXIgdGhlcmUpLgoKTGV0J3Mg
c2VlLCB3aGF0IGFyZSB0aGUgcmVhc29uIGJhY2tlbmQ9Q2xvc2luZz8KICAgIC0gZnJvbnRlbmQg
Y2hhbmdlZCB0byBDbG9zaW5nIChiZWNhdXNlIGl0IHdhbnRzIHRvIGRpc2Nvbm5lY3QpCiAgICAt
IHRvb2xzdGFjayhsaWJ4bCkgb3IgUUVNVSh1bnBsdWcgcmVxdWVzdCkgc2V0IHRoZSBzdGF0ZSB0
byBDbG9zaW5nLAogICAgICBidXQgYWxzbyBvbmxpbmUgdG8gMC4KCldoYXQgc2hvdWxkIHRoZSBi
YWNrZW5kIGRvIGluIGJvdGggY2FzZToKICAgIC0gZnJvbnRlbmQgYWxpdmU6IGJhY2tlbmQgc2hv
dWxkIHdhaXQKICAgICAgICBmcm9udGVuZCBzdGF0ZSBtaWdodCBiZSBJbml0V2FpdCwgSW5pdGlh
bGlzZWQsIENvbm5lY3RlZCwKICAgICAgICBDbG9zaW5nLgogICAgLSBmcm9udGVuZCBub3QgZXhp
c3Rpbmcgb3IgZGlzY29ubmVjdGVkOiBiYWNrZW5kIGNhbiBza2lwIHdhaXRpbmcKICAgICAgYW5k
IGdvIHRvIHRoZSBuZXh0IHN0ZXAsIENsb3NlZC4KICAgICAgICBmcm9udGVuZCBtaWdodCBiZSBJ
bml0aWFsaXNpbmcsIENsb3NlZC4KICAgICAgICBCdXQgdGhlcmUgYXJlIGFsc28gVW5rbm93biwg
UmVjb25maWd1cmluZyBhbmQgUmVjb25maWd1cmVkIHdoaWNoCiAgICAgICAgYXJlIHByb2JhYmx5
IGVycm9ycy4KClNvLCB0aGUgd2hpdGVsaXN0IHdpdGggQ2xvc2VkIGFuZCBJbml0aWFsaXNpbmcg
aXMgYSBnb29kIHN0YXJ0LCBidXQgd2hhdAphYm91dCB0aGUgVW5rbm93biBzdGF0ZT8gKFFFTVUg
ZG9lc24ndCBoYXZlIGJhY2tlbmRzIHdlcmUgdGhlIHN0YXRlClJlY29uZmlndXIqIGlzIHBvc3Np
YmxlLCBzbyB0aGV5IGNhbiBiZSBtYXBwZWQgdG8gVW5rbm93biBmb3Igbm93KS4KCkNoZWVycywK
Ci0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
