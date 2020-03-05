Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E3A17A43C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 12:28:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9odK-00014A-HV; Thu, 05 Mar 2020 11:25:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ek+B=4W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j9odI-000145-FE
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:25:40 +0000
X-Inumbo-ID: 0aa31b40-5ed4-11ea-a56d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0aa31b40-5ed4-11ea-a56d-12813bfff9fa;
 Thu, 05 Mar 2020 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583407540;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=bmJz9kzjX+Ut/uvg1V/kgQzWyluxDGknI1GbsMXU+YY=;
 b=hEE/5NkvmPi5ZMbVF1kZoH4jOUaNuAUOquq495HzEd/Q6dqBGONoombQ
 sSNm0OgAkFcNs47RmhO+lQOC9O2yuZSaA4W4bIAx0T5veehqOqMRXQlR4
 uZz/xeQrmD7DJR57+b4fkzd8UyqiavpstNs7/cZfRTT3hTmO0YTZikYGj M=;
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
IronPort-SDR: eY2vS8ClD6VqaVWjxkgLFIE/0NRhhixkeCYAc4scZMClzMSLRK2Vy7GyECO8LpMZXQCGaeg42m
 vysBMmdxlogjbFFLyUzYd9y07TBE231QhBjzI724oAeK0/RuJem1oT1nZTr6Ag9qXSrz98QjV2
 KjMPcvyYf2qKHEG86sCwZvNT6tRS9xeVN8KJWglfmjs9ZzqbkkX/cDAd4EW65sRuHnRipehk3V
 BtmiHDTv/zUk00+1nfXhq5LhM20SDBkp4Or2oajsICSWktHF6vHWaGHdRbhkbySFsNmLECOfI7
 6mE=
X-SBRS: 2.7
X-MesageID: 13462486
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,517,1574139600"; d="scan'208";a="13462486"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24160.57771.145327.230573@mariner.uk.xensource.com>
Date: Thu, 5 Mar 2020 11:25:31 +0000
To: Dario Faggioli <dfaggioli@suse.com>
In-Reply-To: <ae66ce58d2548deaab15d1f430e2aa7a41448ce1.camel@suse.com>
References: <E1j9RHW-0007Ya-1K@osstest.test-lab.xenproject.org>
 <ae66ce58d2548deaab15d1f430e2aa7a41448ce1.camel@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [linux-linus bisection] complete
 test-amd64-amd64-xl-credit2
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGFyaW8gRmFnZ2lvbGkgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtsaW51eC1saW51cyBiaXNl
Y3Rpb25dIGNvbXBsZXRlIHRlc3QtYW1kNjQtYW1kNjQteGwtY3JlZGl0MiIpOgo+IE9uIFdlZCwg
MjAyMC0wMy0wNCBhdCAxMDoyOSArMDAwMCwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+
ID4gYnJhbmNoIHhlbi11bnN0YWJsZQo+ID4geGVuYnJhbmNoIHhlbi11bnN0YWJsZQo+ID4gam9i
IHRlc3QtYW1kNjQtYW1kNjQteGwtY3JlZGl0Mgo+ID4gdGVzdGlkIGd1ZXN0LXN0YXJ0Cj4gPiAK
PiBJIHdhcyBoYXZpbmcgYSBsb29rIGF0IHRoaXMuIEEgcXVlc3Rpb246Ci4uLgo+ID4gICBMYXN0
IGZhaWwgcmVwcm86IAo+ID4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzLzE0ODA1My8KPiA+IAo+IEluIE9TU1Rlc3QsIHdlIGRvbid0IGNhcHR1cmUgYW5k
IHNhdmUgdGhlIGd1ZXN0IHNlcmlhbCBjb25zb2xlIG91dHB1dCwKPiBvciBkbyB3ZT8KClN1cmUs
IHdlIGRvLiAgQWx0aG91Z2ggb2YgY291cnNlIHRoaXMgaWEgYSBQViBndWVzdCBhbmQgaXQgaGFz
IG5vCiJzZXJpYWwiLiAgSXQgZG9lcyBoYXZlIGh2YzAuCgpIZXJlIGlzIGl0cyBjb25zb2xlIGxv
ZzoKCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDgw
NTMvdGVzdC1hbWQ2NC1hbWQ2NC14bC1jcmVkaXQyL2NoYXJkb25uYXkxLS0tdmFyLWxvZy14ZW4t
Y29uc29sZS1ndWVzdC1kZWJpYW4uZ3Vlc3Qub3NzdGVzdC5sb2cxCgpDb250YWlucyBhIEJVRy4K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
