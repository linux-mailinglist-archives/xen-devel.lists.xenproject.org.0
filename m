Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98041DFDF9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 09:08:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMoCo-0004bm-8k; Tue, 22 Oct 2019 07:03:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PETU=YP=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iMoCm-0004bh-3w
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 07:03:44 +0000
X-Inumbo-ID: 11b1c804-f49a-11e9-9460-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11b1c804-f49a-11e9-9460-12813bfff9fa;
 Tue, 22 Oct 2019 07:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571727817;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AuKU4SedsEGo8KQdxnFDVYDUQqPRFcWmPemeluFBcYI=;
 b=fUstiCJbB8XfSyQFoQl8A2FqFLwzQNsHf6bLtef46H/EevmMNm1UfCqb
 jouXkoq8DuZtvY4CtW1tisSMWClVxD4bXvRN8KgejOdI+5WGlE/9e83cR
 HpXyDMfhA+0ggOOc1cs3fdGkw7s9iFFiJxuZzgQE44Dgm6g1UUa2vyR72 M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XVG3PU3Ziidu41yh5kUHeRrazJxDCka3c394LuPyqN0fEO1FGf7ZGnGlKai+lcltWSMlx9hFdr
 TyAgz8xKx8/H8qYQgb3LdKYOR4OfNmmEsR9BXNtVNx39KhsMS8eLTfLDLKdtNJRkf+WzhPHQRR
 qMFoCMdbzqlm6f/mLvdpRv+TgzvJOg9GXW7xvtiaSvTOqXjwt8Afc8sM0NexeF5fWnLXDvLDO2
 iShgky6IEraUBYiLhmwU96ri21FtQqs0CRrn1qdBUUaHr8Lv1Rl3DPPqw2pVrtHxszwP7e0XhZ
 JyI=
X-SBRS: 2.7
X-MesageID: 7243047
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,326,1566878400"; 
   d="scan'208";a="7243047"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: PV-shim 4.13 assertion failures during vcpu_wake()
Thread-Index: AQHVh/UQu2oTY58TS06mHnzmUS2C6admPNGA
Date: Tue, 22 Oct 2019 07:03:33 +0000
Message-ID: <adc8abee5f2942e083588523cb69a982@AMSPEX02CL03.citrite.net>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
In-Reply-To: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] PV-shim 4.13 assertion failures during vcpu_wake()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgcHJpbnRpbmcgc29tZSBkZWJ1ZyBpbmZvcm1hdGlvbiBJIHNlZSB0aGF0Og0KDQpTTVAg
YWx0ZXJuYXRpdmVzOiBzd2l0Y2hpbmcgdG8gU01QIGNvZGUNCihYRU4pIFsgICAgMS40NzMwNTZd
ID09IGQxdjEgbWFzdGVyX2NwdSAwLCBsb2NrIGZmZmY4MzAxOGUzMTVlYzgNCihYRU4pIFsgICAg
MS40NzMxMjBdIHNjaGVkX251bGwuYzozNDQ6IDEgPC0tIGQxdjENCihYRU4pIFsgICAgMS40NzMx
NjVdID09IGQxdjEgbWFzdGVyX2NwdSAxLCBsb2NrIGZmZmY4MzAxODk5YzJmNDgNCihYRU4pIFsg
ICAgMS40NzMyMjNdIEFzc2VydGlvbiAnbG9jayA9PSBnZXRfc2NoZWRfcmVzKGktPnJlcy0+bWFz
dGVyX2NwdSktPnNjaGVkdWxlX2xvY2snIGZhaWxlZCBhdCAuLi5hcmUveGVuLWRpci94ZW4tcm9v
dC94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaDoyNw0KDQpUaGUgdW5kZXJseWluZyBwQ1BVIHdh
cyBjaGFuZ2VkIGZvciB0aGF0IHZDUFUgYW5kIGhlbmNlIHRoZSBwZXItY3B1IGxvY2sgY2hhbmdl
ZCBhcyB3ZWxsLg0KDQpUaGFua3MsDQpTZXJnZXkNCg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
