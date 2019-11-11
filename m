Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB10F72B3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 12:04:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU7Qp-0000w8-Hz; Mon, 11 Nov 2019 11:00:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VDtj=ZD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iU7Qo-0000w3-85
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 11:00:26 +0000
X-Inumbo-ID: 7634a30e-0472-11ea-984a-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7634a30e-0472-11ea-984a-bc764e2007e4;
 Mon, 11 Nov 2019 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573470025;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=p+o41MxVXgP/EfIS9Ew7WWIff22vzEYD7t8iDZ2wtUo=;
 b=ZBTH30uPJHJ4ApmrcHgCZaPxK9YjxYyNeFNXDoxtgqsXPfZ878ZiXH2R
 8MzL98ipml/w1IgKt49kjzvBas8ZeQZKv0C5Fz5eCX755fH6vkxTeJZnL
 xFBwX7yfvii2fsWNFCnt3rTCWGSV6btLm9ggFW3tGYUra3vPCtN2fYCfv A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: olMt/t34SBKwD2t58c2gNPqtZoF7Y2MuLCJd+WwxNdSIUD5nFD1FuadkbqLtuMH4Ie8rAvMW9Y
 bdxMDEbbUA6GGOhwRnn9b0ExjADtrKys3QsxYuMGvgBGNW5DgzghRkq4EQk3350taqgaj5HQSh
 9AJHbDAVAPCCL6o7HTTkMx3U6wAnU4VrMSTr32ovegr1msTBscI8ftlEx1Tc0+dy89oXsgf2CN
 /zv2/WmWRQA/g79q308sEKUgBekPcbBDMrEqq4y6qJFvUjsEhD8TPbhpjYxkZIsDnU9jL3CeZJ
 y5c=
X-SBRS: 2.7
X-MesageID: 8651226
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,292,1569297600"; 
   d="scan'208";a="8651226"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24009.16196.627425.877118@mariner.uk.xensource.com>
Date: Mon, 11 Nov 2019 11:00:20 +0000
To: Sander Eikelenboom <linux@eikelenboom.it>
In-Reply-To: <1095f982-8336-0e85-8245-0d74467e2895@eikelenboom.it>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
 <1095f982-8336-0e85-8245-0d74467e2895@eikelenboom.it>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 00/13] Speed up and restore host
 history
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2FuZGVyIEVpa2VsZW5ib29tIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbT1NTVEVTVCBQQVRD
SCAwMC8xM10gU3BlZWQgdXAgYW5kIHJlc3RvcmUgaG9zdCBoaXN0b3J5Iik6Cj4gTm90IG1lbmQg
dG8gYmlrZSBzaGVkLCBzbyBqdXN0IGZvciBjb25zaWRlcmF0aW9uOgoKU3VnZ2VzdGlvbnMgYXJl
IHZlcnkgd2VsY29tZS4gIEJlIGNhcmVmdWwsIEknbSBzdGlsbCBsb29raW5nIGZvciBhCmNvLW1h
aW50YWluZXIgOi0pLgoKPiAtIEhhdmUgeW91IGNvbnNpZGVyZWQgKGlubGluZSkgY3NzIGZvciB0
aGUgYmFja2dyb3VuZCBjb2xvdXJpbmcsIG9yIGRvZXMKPiAgIGl0IGhhdmUgdG8gYmUgaHRtbCBv
bmx5ICA/CgpUaGVyZSBpcyBubyBwYXJ0aWN1bGFyIHJlYXNvbiB3aHkgaXQgc2hvdWxkbid0IGJl
IENTUy4gIElzIHRoZXJlIGEKcmVhc29uIHdoeSBkb2luZyBpdCBpbiBodG1sIGNhdXNlcyBwcm9i
bGVtcyBmb3IgeW91ID8KClRoZSBiYWNrZ3JvdW5kIGNvbG91cnMgZm9yIHRoZSBjZWxscyBhcmUg
bWFkZSB3aXRoCiAgcmVwb3J0X2FsdGNvbG91cgogIHJlcG9ydF9hbHRjaGFuZ2Vjb2xvdXIKaW4g
T3NzdGVzdC9FeGVjdXRpdmUucG0uCgpyZXBvcnRfYWx0Y29sb3VyIHJldHVybnMgc29tZXRoaW5n
IHRoYXQgY2FuIGJlIHB1dCBpbnRvIGFuIGVsZW1lbnQKb3BlbiB0YWcsIGdpdmVuIGEgZGVmaW5p
dGUgaW5kaWNhdGlvbiBvZiB3aGV0aGVyIHRoZSBjb2xvdXIgc2hvdWxkIGJlCnBhbGVyIG9yIGRh
cmtlci4KCnJlcG9ydF9hbHRjaGFuZ2Vjb2xvdXIgaXMgdXNlZCB0byBwcm9kdWNlIGJhY2tncm91
bmQgY29sb3VycyB3aGljaApjaGFuZ2Ugd2hlbiB0aGUgdmFsdWUgaW4gdGhlIGNlbGwgY2hhbmdl
cy4KCkkgdGhpbmsgaXQgd291bGQgYmUgZWFzeSB0byByZXBsYWNlIGJnY29sb3VyPSB3aXRoIHNv
bWUgYXBwcm9wcmlhdGUKc3R5bGU9IGFuZCBzb21lIENTUy4gIFBhdGNoZXMgLSBldmVuIHZlcnkg
cm91Z2ggb25lcyAtIHdlbGNvbWUuCgo+IC0gQW5kIGZvciBjYWNoaW5nIHBlcmhhcHMgYSBtYXRl
cmlhbGl6ZWQgdmlldyB3aXRoIGFnZ3JlZ2F0ZWQgZGF0YSBvbmx5Cj4gICByZWZyZXNoZWQgYXQg
YSBtb3JlIGNvbnZpZW50IHRpbWUgY291bGQgcGVyaGFwcyBoZWxwIGF0IHRoZSBkYXRhYmFzZQo+
ICAgbGV2ZWwgPwoKTWF5YmUsIGJ1dCBjdXJyZW50bHkgdGhlIGFyY2hhZW9sb2d5IGFsZ29yaXRo
bSBpcyBub3QgZXhwcmVzc2VkCmVudGlyZWx5IGluIFNRTCBzbyBpdCBjb3VsZG4ndCBiZSBhIG1h
dGVyaWFsaXNlZCB2aWV3LiAgQW5kIGNvbnZlcnRpbmcKaXQgdG8gU1FMIHdvdWxkIGJlIGFubm95
aW5nIGJlY2F1c2UgU1FMIGlzIGEgcmF0aGVyIHBvb3IgcHJvZ3JhbW1pbmcKbGFuZ3VhZ2UuCgpJ
dCBtaWdodCBiZSBwb3NzaWJsZSB0bywgaW5zdGVhZCwgaGF2ZSB0YWJsZShzKSBjb250YWluaW5n
IGFyY2hhZW9sb2d5CnJlc3VsdHMuICBJIGhhZG4ndCByZWFsbHkgcHJvcGVybHkgY29uc2lkZXJl
ZCB0aGF0IHBvc3NpYmlsaXR5LiAgVGhhdAptaWdodCB3ZWxsIGhhdmUgYmVlbiBhIGJldHRlciBh
cHByb2FjaC4gIFNvIHRoYW5rIHlvdSBmb3IgeW91ciBoZWxwZnVsCnByb21wdC4gIEkgd2lsbCBk
ZWZpbml0ZWx5IGJlYXIgdGhpcyBpbiBtaW5kIGZvciB0aGUgZnV0dXJlLgoKSSdtIG5vdCBzdXJl
IEkgZmVlbCBsaWtlIHJlZW5naW5lZXJpbmcgdGhpcyBwYXJ0aWN1bGFyIHNlcmllcyBhdCB0aGlz
CnRpbWUsIHRob3VnaC4gIE9uZSByZWFzb24gKGFwYXJ0IGZyb20gdGhhdCBJJ3ZlIGRvbmUgaXQg
bGlrZSB0aGlzIG5vdykKaXMgdGhhdCB0aGUgY3VycmVudCBhcHByb2FjaCBoYXMgdGhlIGFkdmFu
dGFnZSB0aGF0IGl0IGRvZXNuJ3QgbmVlZCBhCkRCIHNjaGVtYSBjaGFuZ2UuICBJIGhhdmUgYSBz
eXN0ZW0gZm9yIGRvaW5nIHNjaGVtYSBjaGFuZ2VzIGJ1dCB0aGV5CmFkZCByaXNrIGFuZCBJIGRv
bid0IHdhbnQgdG8gZG8gdGhhdCBpbiB0aGUgWGVuIHJlbGVhc2UgZnJlZXplLgoKUmVnYXJkcywK
SWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
