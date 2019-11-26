Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3C10A0F3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:07:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcOZ-0004yp-2k; Tue, 26 Nov 2019 15:04:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xtMf=ZS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iZcOX-0004yh-66
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:04:49 +0000
X-Inumbo-ID: 16aab886-105e-11ea-83b8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16aab886-105e-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574780689;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=1yqlUB3LAsMa19rNp3/p5q0xveHqWBQgrXxUaBe/tOw=;
 b=iUumBQLLrI1uNa1ybaTghfZPETfujYBzQuAuvk1jYccUomFnyj8o1Api
 bjmyERxQRuwjmDzTAnlC11N56FljEPt31xKIdn0M14+u+EjWszg8trz1x
 kvOcjWrZ5BQciuwJ2CB/fAc30qKVuiGu1EKW+W+4bdBmD93xgduacr+mC I=;
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
IronPort-SDR: RiHEjzKKErRDUKqBgtONE6iCllo74LuRo3z7JOc66stPPUWSse8HLEX+4vcBLGjtOsuZnwV2wP
 wj8DO4VSP3WFXiTCuo8V4tMIfBqm07jSCokflWOGLPQ3d3pHoT1En67KygDG5p2tO24U10zNoF
 pIN/pW8GzX9SSWDMoYsckT9uwBbeT41twGBREJDkxCOEfmsv/Urzx+DY1LFrPqxzIDRM504KWK
 dqqbtZMBj+/i1lScnvxRMl+iE7PF6MbXYm9dTnM2OFvctWlV/Nzd833YAu5p8GfsdwE7ox2KW8
 z3g=
X-SBRS: 2.7
X-MesageID: 8857180
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="8857180"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24029.16141.74013.802354@mariner.uk.xensource.com>
Date: Tue, 26 Nov 2019 15:04:45 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <afd686bc-27fa-adbf-910d-75ef8cb5ab40@citrix.com>
References: <20191126141026.2858622-1-george.dunlap@citrix.com>
 <24029.13124.935192.209484@mariner.uk.xensource.com>
 <afd686bc-27fa-adbf-910d-75ef8cb5ab40@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjEzXSBkb2NzL3hsOiBEb2N1
bWVudCBwY2ktYXNzaWduYWJsZSBzdGF0ZSIpOgo+IEkga2luZCBvZiBmZWVsIGxpa2UgdGhlIGRp
c2N1c3Npb24gb2YgdGhlIHNlY3VyaXR5IHJpc2tzIGluaGVyZW50IGluIHBjaQo+IHBhc3N0aHJv
dWdoIGJlbG9uZyBpbiBhIHNlcGFyYXRlIGRvY3VtZW50LCBidXQgcGVyaGFwcyBhIGJyaWVmIG1l
bnRpb24KPiBoZXJlIHdvdWxkIGJlIGhlbHBmdWwuICBQZXJoYXBzIHRoZSBmb2xsb3dpbmc/Cj4g
Cj4gIkFzIGFsd2F5cywgdGhpcyBzaG91bGQgb25seSBiZSBkb25lIGlmIHlvdSB0cnVzdCB0aGUg
Z3Vlc3QsIG9yIGFyZQo+IGNvbmZpZGVudCB0aGF0IHRoZSBwYXJ0aWN1bGFyIGRldmljZSB5b3Un
cmUgcmUtYXNzaWduaW5nIHRvIGRvbTAgd2lsbAo+IGNhbmNlbCBhbGwgaW4tZmxpZ2h0IERNQSBv
biBGTFIuIgoKU0dUTS4KCkkgbGlrZSAiYXMgYWx3YXlzIiB3aGljaCBjbGVhcmx5IHNpZ25hbHMg
dGhhdCB0aGlzIGlzIGEgbW9yZSBnZW5lcmFsCnByb2JsZW0gd2l0aG91dCByZXF1aXJpbmcgdXMg
dG8gYWN0dWFsbHkgd3JpdGUgdGhhdCBvdGhlcgpjb21wcmVoZW5zaXZlIGRvY3VtZW50Li4uCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
