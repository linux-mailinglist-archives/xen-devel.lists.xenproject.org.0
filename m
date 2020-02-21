Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF64C16810B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:01:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59lz-0005K2-5x; Fri, 21 Feb 2020 14:59:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j59lx-0005Js-Dh
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:59:21 +0000
X-Inumbo-ID: bd3b1524-54ba-11ea-bc8e-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd3b1524-54ba-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582297161;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pCqEM6LvlovBocb/WuxDtIPqe3tWNNX+qBXx9cg8cqo=;
 b=Mo3iqzslbLPSYdOKs3qz6rDd79x3YxMUUxBS8Wo7w0BZ+te4w36/Ly79
 s6A0F3Qe5XAKnQGoOPk1VZAM+tGRQYvm5FjHbILVQWnd0CJs7Aqce/Qo1
 x+nvV33jDcZc6TQAZE+LJ1OWYV1qOk9jyb7GrPJLXy12YxwY5HKb9jztd g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qHfuBp7NIbMRI9fg/V+pYSbMrFvB+zhaxUQCeyEkiAY4mTPcvzdwUbuv17wqtl+mP1d/pYssUy
 l3A+ppSuY4x8pIxyy1LcDis5yKgo29eKSRFfHdghbOUDTV3YIZiy47guLR4FvCXkX8gJ5sVBRA
 J9KTCJSlym8zyxS4lfVApTwea2FcVVwK/T7VWGEFPmQeyJItISk9nN+756OmsuhUqcP4u4nptM
 4OrghkXdWrbIgEMH/7TAOLVaXCIFY0ph5GaFMoN5A+YdfiUrxzJQFT/15W0nqMkL1dzul9mx1r
 OZU=
X-SBRS: 2.7
X-MesageID: 12803882
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,468,1574139600"; d="scan'208";a="12803882"
Date: Fri, 21 Feb 2020 15:59:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200221145912.GE4679@Air-de-Roger>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
 <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
 <20200221144924.GC4679@Air-de-Roger>
 <270e3f03-a1e8-1cf8-af82-e7fed515985a@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <270e3f03-a1e8-1cf8-af82-e7fed515985a@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDI6NTY6MjBQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDIxLzAyLzIwMjAgMTQ6NDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAwMzo0MTo1OVBNICswMTAwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiA+ID4gQmVjYXVzZSB5b3UgbmVlZCB0byBpbnZva2Ugc21wX3Byb2Nlc3Nvcl9p
ZCgpIHRvIGNhbGN1bGF0ZSB0aGUgdmFsdWUKPiA+ID4gdG8gdXNlIGluIHRoZSBzdWJ0cmFjdGlv
bi4gSSdtIG5vdCBtZWFuaW5nIHRvIHNheSBJJ20gZW50aXJlbHkKPiA+ID4gb3Bwb3NlZCAoc2Vl
aW5nIGhvdyBtdWNoIG9mIGEgZGlzY3Vzc2lvbiB3ZSdyZSBoYXZpbmcpLCBidXQgdGhlCj4gPiA+
ICJzaW1wbGUgd3JpdGUgb2YgemVybyIgYXBwcm9hY2ggaXMgY2VydGFpbmx5IGFwcGVhbGluZy4K
PiA+IAo+ID4gV2VsbCwgd2UgY291bGQgYXZvaWQgdGhlIHNtcF9wcm9jZXNzb3JfaWQoKSBjYWxs
IGFuZCBpbnN0ZWFkIHVzZToKPiA+IAo+ID4gYXRvbWljX3N1YihhdG9taWNfcmVhZCgmbG9jay0+
Y250cykgJiAweGZmZmYsICZsb2NrLT5jbnRzKTsKPiAKPiBBRkFJQ1QsIHRoaXMgd291bGQgbm90
IGJlIHNhZmUgYmVjYXVzZSB0aGUgdG9wIDE2LWJpdCBtYXkgY2hhbmdlIGJlaGluZCB5b3VyCj4g
YmFjayAodmlhIGEgcmVhZF9sb2NrKS4KCldoeSBub3Q/IFdlIGRvbid0IHRvdWNoIHRoZSB0b3Ag
MTZiaXRzIGluIGFueSB3YXksIHRoZSBzdWJ0cmFjdGlvbgpvbmx5IGFmZmVjdHMgdGhlIGxvdyAx
NmJpdHMgYW5kIGlzIGRvbmUgaW4gYW4gYXRvbWljIG1hbm5lci4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
