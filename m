Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C159CF7F5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 13:17:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHnSu-0008CE-95; Tue, 08 Oct 2019 11:15:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQDQ=YB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iHnSs-0008C1-7W
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 11:15:38 +0000
X-Inumbo-ID: f404fc32-e9bc-11e9-80e3-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f404fc32-e9bc-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570533337;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RVLz9ey/KgvKmUqF2IA0F8rH83am3e9CauuEfG0gd9g=;
 b=dNR3LAD3PWF/aOSP0l4IUOfSMWVvmY+4RFF07oNc8GV7jaOu/BFE99lF
 P4QnTxbf8YTXsP704xwqADIW9Yvqo+YWj+GMEdETFvfY2j7gOdOw9xJbj
 P9HomIFtzHctcpHa+IhX0RlSpDG9GdOSpgxuiV02Bg68ZuLEgbMec275F 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SerzBmcxbZD3+/NaNzTFmEchzDRyBVghE8UPWkxdbsZkT8jC33CFi/0DdOeTudcMblkf1bnBj5
 Lv20Ff0a0wYZmY3XKyx0pvEEH5DfJ8/SbXiFUqAIGbYFGzHH1wJPVEVmpaFJXjbFq1b2PHJsOh
 aKHDPRi0itszOuD3a0pE92h407VkQNI/aynTENbMPZJA6rRnFS7yAfPKIll1/DpEqn8p0LCxVm
 N3ZO3ZyrACQ+QHw6nsU2Qj3GHD/wwV8aEbZscQ87tHmDYgP1TluXksDrerjaBl+5gJETYDbWzB
 Z2Y=
X-SBRS: 2.7
X-MesageID: 6902522
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6902522"
Date: Tue, 8 Oct 2019 13:15:30 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Message-ID: <20191008111530.GD66437@Air-de-Roger>
References: <osstest-142383-mainreport@xen.org>
 <b155b2f9-9664-7366-cdd0-10fac5c3ab3b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b155b2f9-9664-7366-cdd0-10fac5c3ab3b@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [xen-unstable test] 142383: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMTI6NDI6MjVQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAwNy4xMC4xOSAyMjo1Niwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+
ID4gZmxpZ2h0IDE0MjM4MyB4ZW4tdW5zdGFibGUgcmVhbCBbcmVhbF0KPiA+IGh0dHA6Ly9sb2dz
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDIzODMvCj4gPiAKPiA+IFJl
Z3Jlc3Npb25zIDotKAo+ID4gCj4gPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFy
ZSBibG9ja2luZywKPiA+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+
ID4gICB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcGFpciAyMiBndWVzdC1taWdyYXRlL3NyY19o
b3N0L2RzdF9ob3N0IGZhaWwgUkVHUi4gdnMuIDE0MTgyMgo+ID4gICB0ZXN0LWFtZDY0LWkzODYt
bGlidmlydC1wYWlyIDIyIGd1ZXN0LW1pZ3JhdGUvc3JjX2hvc3QvZHN0X2hvc3QgZmFpbCBSRUdS
LiB2cy4gMTQxODIyCj4gCj4gSG1tLCB0ZXN0IGxvZyBzYXlzIHRoZSBndWVzdCBkaWRuJ3Qgc3Vz
cGVuZC4KPiAKPiBDb3VsZCB0aGF0IGJlIHJlbGF0ZWQgdG8gY29tbWl0IGIxODNlMTgwYmNlOTMw
MyA/CgpUaGUgbGlidmlydCBsaWJ4bCBkYWVtb24gc3BpdHM6CgoyMDE5LTEwLTA3IDEyOjMxOjA5
Ljk1MyswMDAwOiBsaWJ4bC1zYXZlLWhlbHBlcjogc3RhcnRpbmcgc2F2ZTogU3VjY2VzcwoyMDE5
LTEwLTA3IDEyOjMxOjA5Ljk1MyswMDAwOiB4YzogZmQgNDAsIGRvbSAxLCBmbGFncyAxLCBodm0g
MAoyMDE5LTEwLTA3IDEyOjMxOjA5Ljk1NCswMDAwOiB4YzogU2F2aW5nIGRvbWFpbiAxLCB0eXBl
IHg4NiBQVgoyMDE5LTEwLTA3IDEyOjMxOjA5Ljk1NCswMDAwOiB4YzogNjQgYml0cywgNCBsZXZl
bHMKMjAxOS0xMC0wNyAxMjozMTowOS45NTkrMDAwMDogeGM6IG1heF9tZm4gMHgyODAwMDAKMjAx
OS0xMC0wNyAxMjozMTowOS45NTkrMDAwMDogeGM6IHAybSBsaXN0IGZyb20gMHhmZmZmYzkwMDAw
MDAwMDAwIHRvIDB4ZmZmZmM5MDAwMDBmZmZmZiwgcm9vdCBhdCAweDI3ZGUwYQoyMDE5LTEwLTA3
IDEyOjMxOjA5Ljk1OSswMDAwOiB4YzogbWF4X3BmbiAweDFmZmZmLCBwMm1fZnJhbWVzIDI1Ngoy
MDE5LTEwLTA3IDEyOjMxOjA5Ljk2MCswMDAwOiB4YzogRmFpbGVkIHRvIGVuYWJsZSBsb2dkaXJ0
eTogMjIsMCwyMiAoMjIgPSBJbnZhbGlkIGFyZ3VtZW50KTogSW50ZXJuYWwgZXJyb3IKMjAxOS0x
MC0wNyAxMjozMTowOS45NjArMDAwMDogeGM6IFNhdmUgZmFpbGVkICgyMiA9IEludmFsaWQgYXJn
dW1lbnQpOiBJbnRlcm5hbCBlcnJvcgoyMDE5LTEwLTA3IDEyOjMxOjA5Ljk4MSswMDAwOiBsaWJ4
bC1zYXZlLWhlbHBlcjogY29tcGxldGUgcj0tMTogSW52YWxpZCBhcmd1bWVudAoyMDE5LTEwLTA3
IDEyOjMxOjA5Ljk4MyswMDAwOiBsaWJ4bDogbGlieGwuYzo3NTI6bGlieGxfX2ZkX2ZsYWdzX3Jl
c3RvcmU6IGZuY3RsIEZfU0VURkwgb2YgZmQgNDAgdG8gMHgyCjIwMTktMTAtMDcgMTI6MzE6MDku
OTgzKzAwMDA6IGxpYnhsOiBsaWJ4bF9ldmVudC5jOjE4NzM6bGlieGxfX2FvX2NvbXBsZXRlOiBh
byAweDdmNzYwYzAwMjExMDogY29tcGxldGUsIHJjPS04CjIwMTktMTAtMDcgMTI6MzE6MDkuOTgz
KzAwMDA6IGxpYnhsOiBsaWJ4bF9ldmVudC5jOjE4NDI6bGlieGxfX2FvX19kZXN0cm95OiBhbyAw
eDdmNzYwYzAwMjExMDogZGVzdHJveQoKV2hpY2ggc2VlbSB0byBiZSByZWxhdGVkIHRvIHRoZSBy
ZWNlbnQgaW9tbXUgY2hhbmdlcywgSSB3b3VsZCBzYXkgaXQncwpsaWtlbHkgaGl0dGluZyB0aGUg
aXNfaW9tbXVfZW5hYmxlZCBjaGVjayBpbiBwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZQphbmQgaGVu
Y2UgcmV0dXJuaW5nIEVJTlZBTC4KCkFkZGluZyBQYXVsIGFuZCBKYW4gd2hvIHdvcmtlZCBvbiB0
aGUgc2VyaWVzLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
