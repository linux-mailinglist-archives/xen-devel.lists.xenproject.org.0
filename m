Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F824FC2CF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 10:41:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVBaJ-0004Aa-Kt; Thu, 14 Nov 2019 09:38:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwvT=ZG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iVBaI-0004AU-6T
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 09:38:38 +0000
X-Inumbo-ID: 8836ab04-06c2-11ea-b678-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8836ab04-06c2-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573724318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZIoNSR1HgVi/XhzST+TT7UjDVQ2V+8bBLBHtraibrek=;
 b=MDoo3Awo498O9L4ILW1ygkMGbGhdW+iB07GNIa80lp324GmnbHOPr2UU
 dh1qN9WZ6o0Ju8UlhDoj++tghHOtuzdFtrxiz1PlYRrzXo1PhTbVGdKrw
 H0v/lTFOZeXnMbfmo5fd030+B0IZu8KTdv5HpZmnfO3U4x7BXXeZBZl0S c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jaqx3Axn1nwM3n6C2Gut1e59hpZVD+/9BGob9vCbsg+F5CbWDDXkJ/rrCXyqpWOfxLFM1VU7jn
 o1iKZqX7QELmmJQ4hEvVlYI4eBuqGFaUo5qdJut7odj7lZTKsk4uYlSHg15XNwMvHr3uqXZ6DP
 zynGOtMS8rmY+nvWqtblbTlXE0QKtPneId+gyP4PmcAppSUZ1mx0IPH24ix2IpgbxqbM33/Z3P
 wYT7sJaV+FMpUpM1+OBkJChaHCli2iagkhJEBd0GQfVvskfC0s4N5o9xBENcc73/zYz+O8aC7s
 wIE=
X-SBRS: 2.7
X-MesageID: 8315205
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,302,1569297600"; 
   d="scan'208";a="8315205"
Date: Thu, 14 Nov 2019 10:38:20 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191114093820.GB72134@Air-de-Roger>
References: <c46e975b-ef68-f09a-2790-3c4fb503cbf9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c46e975b-ef68-f09a-2790-3c4fb503cbf9@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86: fix clang .macro retention check
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDY6MDE6NDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUgd2VyZSB0d28gcHJvYmxlbXMgaGVyZTogVGhlIGZpcnN0IGNsb3NpbmcgcGFy
ZW50aGVzZXMgZ290IHBhcnNlZAo+IGJ5IG1ha2UgdG8gZW5kIHRoZSAkKGNhbGwgaW52b2NhdGlv
biwgYW5kIHRoZSBlc2NhcGluZyBvZiB0aGUgcXVvdGVzCj4gd2Fzbid0IHJpZ2h0IGVpdGhlciwg
YXMgdGhlcmUncyBub3doZXJlIHRoZXkgd291bGQgZ2V0IHVuLWVzY2FwZWQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IFRoaXMgbmVl
ZHMgdG8gYmUgdGVzdGVkIGluIGFuIGVudmlyb25tZW50IHdoZXJlIHRoaXMgd2FzIGFjdHVhbGx5
IGZvdW5kCj4gdG8gbWF0dGVyOyBJIGNhbid0IHNlZSBob3cgaXQgY2FuIGhhdmUgd29ya2VkIGlu
IGl0cyBmb3JtZXIgc2hhcGUuIEkKCldlbGwsIEkgY291bGQgc3dlYXIgdGhpcyB3YXMgd29ya2lu
ZywgYnV0IG9idmlvdXNseSBJIGRpZCBzb21ldGhpbmcKd3JvbmcuCgo+IGFsc28gZG9uJ3QgdW5k
ZXJzdGFuZCB3aHkgdGhlIHNhbWUgY29tbWl0IGludHJvZHVjaW5nIHRoZSBjaGVjayB0aGF0Cj4g
Z2V0cyBmaXhlZCBoZXJlIHB1dCB0aGUgLnNraXAgY2hlY2sgaW4geGVuL1J1bGVzLm1rIC0gdGhl
IG9ubHkgdXNlIG9mCj4gLnNraXAgdGhhdCBJIGNhbiBzcG90IGlzIGluIHg4NiBjb2RlLgoKSSBy
ZWNhbGwgcmVtb3Zpbmcgc29tZSB1c2FnZXMgb2YgLnNraXAsIGJ1dCBUQkggSSdtIG5vdCBzdXJl
IHdoZXRoZXIKQVJNIHdhcyBhbHNvIGludm9sdmVkLgoKSSBndWVzcyBpdCdzIGZpbmUgdG8gbW92
ZSBpdCB0byB4ODYvUnVsZXMubWsgbm93LCBzaW5jZSBJIGFsc28gaGF2ZSB0bwpmaXggYW4gaXNz
dWUgd2l0aCBpdC4KCj4gCj4gLS0tIGEvQ29uZmlnLm1rCj4gKysrIGIvQ29uZmlnLm1rCj4gQEAg
LTYsNiArNiw4IEBAIGVuZGlmCj4gIAo+ICAjIENvbnZlbmllbnQgdmFyaWFibGVzCj4gIGNvbW1h
ICAgOj0gLAo+ICtvcGVuICAgIDo9ICgKPiArY2xvc2UgICA6PSApCj4gIHNxdW90ZSAgOj0gJwo+
ICAjJyBCYWxhbmNpbmcgc3F1b3RlLCB0byBoZWxwIHN5bnRheCBoaWdobGlnaHRpbmcKPiAgZW1w
dHkgICA6PQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9SdWxlcy5tawo+IEBAIC04Miw2ICs2NCw2IEBAICQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFH
UyxDQywiLmluY2x1ZGUKPiAgIyBDaGVjayB3aGV0aGVyIGNsYW5nIGtlZXBzIC5tYWNyby1zIGJl
dHdlZW4gYXNtKCktczoKPiAgIyBodHRwczovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lk
PTM2MTEwCj4gICQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFHUyxDQyxcCj4gLSAgICAgICAgICAg
ICAgICAgICAgICIubWFjcm8gRk9PXG4uZW5kbVwiKTsgYXNtIHZvbGF0aWxlIChcIi5tYWNybyBG
T09cbi5lbmRtIixcCj4gKyAgICAgICAgICAgICAgICAgICAgICIubWFjcm8gRk9PXG4uZW5kbSIk
JChjbG9zZSk7IGFzbSB2b2xhdGlsZSAkJChvcGVuKSIubWFjcm8gRk9PXG4uZW5kbSIsXAoKVGhh
bmtzLCB3aGlsZSBoZXJlIGNvdWxkIHlvdSBhbHNvIHJlcGxhY2UgdGhlICdcbicgd2l0aCBhICc7
Jz8gJ1xuJwpkb2Vzbid0IHdvcmsgcHJvcGVybHkgYW5kIGdpdmVzIG1lIHRoZSBmb2xsb3dpbmcg
ZXJyb3I6Cgo8c3RkaW4+OjE6MzI6IGVycm9yOiBtaXNzaW5nIHRlcm1pbmF0aW5nICciJyBjaGFy
YWN0ZXIgWy1XZXJyb3IsLVdpbnZhbGlkLXBwLXRva2VuXQp2b2lkIF8odm9pZCkgeyBhc20gdm9s
YXRpbGUgKCAgIi5tYWNybyBGT08KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPHN0
ZGluPjoxOjMyOiBlcnJvcjogZXhwZWN0ZWQgc3RyaW5nIGxpdGVyYWwgaW4gJ2FzbScKPHN0ZGlu
PjozOjY6IGVycm9yOiBtaXNzaW5nIHRlcm1pbmF0aW5nICciJyBjaGFyYWN0ZXIgWy1XZXJyb3Is
LVdpbnZhbGlkLXBwLXRva2VuXQouZW5kbSIgKTsgfQogICAgIF4KPHN0ZGluPjozOjEyOiBlcnJv
cjogZXhwZWN0ZWQgJyknCi5lbmRtIiApOyB9CiAgICAgICAgICAgXgo8c3RkaW4+OjE6Mjk6IG5v
dGU6IHRvIG1hdGNoIHRoaXMgJygnCnZvaWQgXyh2b2lkKSB7IGFzbSB2b2xhdGlsZSAoICAiLm1h
Y3JvIEZPTwogICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo8c3RkaW4+OjM6MTI6IGVycm9y
OiBleHBlY3RlZCAnfScKLmVuZG0iICk7IH0KICAgICAgICAgICBeCjxzdGRpbj46MToxNDogbm90
ZTogdG8gbWF0Y2ggdGhpcyAneycKdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICggICIubWFj
cm8gRk9PCiAgICAgICAgICAgICBeCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
