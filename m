Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1751B1172A4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 18:21:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieMfe-0007wE-SW; Mon, 09 Dec 2019 17:18:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieMfd-0007w9-JO
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 17:18:05 +0000
X-Inumbo-ID: dc259bf0-1aa7-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc259bf0-1aa7-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575911885;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rkXopByrwPp2sBcRHNchnOCKQcjWZBRVSMRnG3CKxxA=;
 b=fNVrtcTa0ZsPaBlvf1mwCpwHyNk6KMbzWULYdnrmz7xdmIwnJMrlPVcU
 nXIcuwH4oghwsjDS9nYz8WcBhxYxAiTSVJWVP/e8aF+lYVInYxwHh940L
 3JfVh8b+7BSPQx9fwckN5j3wgGwWMEmno532qfSwv94l9PuOMMmmw6Iu1 k=;
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
IronPort-SDR: efnx41IuK1BLRB1YOurKYBC7JSe4UINc6kZ+B6IPVi21FZ7VsBIv5Q6cE+Wy0wcGrL//OeIUrf
 gpJOuVyYbBevHPxeESHEL0VfDKk7oED4f1EZVjKZ+Cj4TDZx3GHic4MiuN5kQfXGgLR8Mo5Hkz
 yTPp8TBbd8Rf5NY4UgBGWMnaMy/zHff5YF1+OE50DVUzxfQ7g4wgIwExOI3XHoABJK8S5jxz3Q
 eFizofgeZYJ5QKZQt8RBSag3pjuqHIO3fWd8sOLVmePph/oZKu7p2BtWn+ROYek98hu+4e9RS+
 gVQ=
X-SBRS: 2.7
X-MesageID: 9407797
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9407797"
Date: Mon, 9 Dec 2019 18:17:57 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <20191209171757.GC980@Air-de-Roger>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
 <20191209122537.GV980@Air-de-Roger>
 <54e3cd3a42d8418d9a36388315deab13@EX13D32EUC003.ant.amazon.com>
 <20191209142852.GW980@Air-de-Roger>
 <e026926b9aea4ffe868d41828c1f4721@EX13D32EUC003.ant.amazon.com>
 <20191209151339.GZ980@Air-de-Roger>
 <b9271df6222a4fba86ec54c81b09eace@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9271df6222a4fba86ec54c81b09eace@EX13D32EUC003.ant.amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMDQ6MjY6MTVQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+ID4gSWYgeW91IHdhbnQgdW5iaW5kIHRvIGFjdHVhbGx5IGRvIGEgcHJvcGVyIHVu
cGx1ZyB0aGVuIHRoYXQncyBleHRyYSB3b3JrCj4gPiBhbmQgbm90IHJlYWxseSBzb21ldGhpbmcg
SSB3YW50IHRvIHRhY2tsZSAoYW5kIHJlLWJpbmQgd291bGQgc3RpbGwgbmVlZCB0bwo+ID4gYmUg
dG9vbHN0YWNrIGluaXRpYXRlZCBhcyBzb21ldGhpbmcgd291bGQgaGF2ZSB0byByZS1jcmVhdGUg
dGhlIHhlbnN0b3JlCj4gPiBhcmVhKS4KPiA+IAo+ID4gV2h5IGRvIHlvdSBzYXkgdGhlIHhlbnN0
b3JlIGFyZWEgd291bGQgbmVlZCB0byBiZSByZWNyZWF0ZWQ/Cj4gPiAKPiA+IFNldHRpbmcgc3Rh
dGUgdG8gY2xvc2VkIHNob3VsZG4ndCBjYXVzZSBhbnkgY2xlYW51cCBvZiB0aGUgeGVuc3RvcmUK
PiA+IGFyZWEsIGFzIHRoYXQgc2hvdWxkIGFscmVhZHkgaGFwcGVuIGZvciBleGFtcGxlIHdoZW4g
dXNpbmcgcHZncnViCj4gPiBzaW5jZSBpbiB0aGF0IGNhc2UgZ3J1YiBpdHNlbGYgZGlzY29ubmVj
dHMgYW5kIGFscmVhZHkgY2F1c2VzIGEKPiA+IHRyYW5zaXRpb24gdG8gY2xvc2VkIGFuZCBhIHJl
LWF0dGFjaG1lbnQgYWZ0ZXJ3YXJkcyBieSB0aGUgZ3Vlc3QKPiA+IGtlcm5lbC4KPiA+IAo+IAo+
IEZvciBzb21lIHJlYXNvbiwgd2hlbiBJIG9yaWdpbmFsbHkgdGVzdGVkLCB0aGUgeGVuc3RvcmUg
YXJlYSBkaXNhcHBlYXJlZC4gSSBjaGVja2VkIGFnYWluIGFuZCBpdCBkaWQgbm90IHRoaXMgdGlt
ZS4gSSBqdXN0IGVuZGVkIHVwIHdpdGggYSBmcm9udGVuZCBzdHVjayBpbiBzdGF0ZSA1IChiZWNh
dXNlIGl0IGlzIHRoZSBzeXN0ZW0gZGlzayBhbmQgd29uJ3QgZ28gb2ZmbGluZSkgdHJ5aW5nIHRv
IHRhbGsgdG8gYSBub24tZXhpc3RlbnQgYmFja2VuZC4gVXBvbiByZS1iaW5kIHRoZSBiYWNrZW5k
IGdvZXMgaW50byBzdGF0ZSA1IChiZWNhdXNlIGl0IHNlZXMgdGhlIDUgaW4gdGhlIGZyb250ZW5k
KSBhbmQgbGVhdmVzIHRoZSBndWVzdCB3ZWRnZWQuCgpMaWtlbHkgYmxrZnJvbnQgc2hvdWxkIGdv
IGJhY2sgdG8gaW5pdCBzdGF0ZSwgYnV0IGFueXdheSwgdGhhdCdzIG5vdApzb21ldGhpbmcgdGhh
dCBuZWVkcyBmaXhpbmcgYXMgcGFydCBvZiB0aGlzIHNlcmllcy4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
