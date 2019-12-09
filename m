Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD4116D1C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:27:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieI6p-0005D2-Ne; Mon, 09 Dec 2019 12:25:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieI6o-0005Cx-2k
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:25:50 +0000
X-Inumbo-ID: 080764d4-1a7f-11ea-a914-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 080764d4-1a7f-11ea-a914-bc764e2007e4;
 Mon, 09 Dec 2019 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575894349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7SWmu5ZUZZfuIJMpbgQUd3j93DLQjxI0xM82paabgDk=;
 b=eRebafFEFsRRRrR8XJfBrHndFPfSN0qTVDopenYDqhEGNf/rgp4I5Qv7
 Vvh7zp1v1rKpJV7kh1cZsul0jWv9j4XN+v+xV5PU5jjU8Akl1dl+1T7KI
 6bON/bePuJRPOGMdb2prOqmxrCrE5//kXuQYhrf+mgo/DgQt+kaTCKMVz U=;
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
IronPort-SDR: umSJYKkJ0Pr3c1V4tfcnZoKOyFredea2y4NAVpAVo5U3ceELPl8EBHyhdyuU2Pp4o9eG4a9eeT
 gZUjV1CEj6fUFNl6xrITY5xltx884qRowFUWLDF9KhuxaTl3rLbosPM6Y2x/MLHF68nUC7mWgz
 Kw5MmGHcsmpb3mzLdtGtg5/XmlFCkbSBQU94pmv0XQXGJRCxWwjboItOQKanVTl5hDgfZvl8xA
 mer4yGTg/nVc/oZoexnVvUzKoli1w7qbqdtpcqvROIx0dJf3x+SBtt2wm88PuYm4V95+UBuG8t
 dxk=
X-SBRS: 2.7
X-MesageID: 9391106
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9391106"
Date: Mon, 9 Dec 2019 13:25:37 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <20191209122537.GV980@Air-de-Roger>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
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

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMTI6MDE6MzhQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkg
MTE6MzkKPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgSnVlcmdlbgo+ID4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gPiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlz
Lm9zdHJvdnNreUBvcmFjbGUuY29tPgo+ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SCAyLzRdIHhlbmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8KPiA+IGNsb3NlZAo+
ID4gCj4gPiBPbiBUaHUsIERlYyAwNSwgMjAxOSBhdCAwMjowMToyMVBNICswMDAwLCBQYXVsIER1
cnJhbnQgd3JvdGU6Cj4gPiA+IE9ubHkgZm9yY2Ugc3RhdGUgdG8gY2xvc2VkIGluIHRoZSBjYXNl
IHdoZW4gdGhlIHRvb2xzdGFjayBtYXkgbmVlZCB0bwo+ID4gPiBjbGVhbiB1cC4gVGhpcyBjYW4g
YmUgZGV0ZWN0ZWQgYnkgY2hlY2tpbmcgd2hldGhlciB0aGUgc3RhdGUgaW4geGVuc3RvcmUKPiA+
ID4gaGFzIGJlZW4gc2V0IHRvIGNsb3NpbmcgcHJpb3IgdG8gZGV2aWNlIHJlbW92YWwuCj4gPiAK
PiA+IEknbSBub3Qgc3VyZSBJIHNlZSB0aGUgcG9pbnQgb2YgdGhpcywgSSB3b3VsZCBleHBlY3Qg
dGhhdCBhIGZhaWx1cmUgdG8KPiA+IHByb2JlIG9yIHRoZSByZW1vdmFsIG9mIHRoZSBkZXZpY2Ug
d291bGQgbGVhdmUgdGhlIHhlbmJ1cyBzdGF0ZSBhcwo+ID4gY2xvc2VkLCB3aGljaCBpcyBjb25z
aXN0ZW50IHdpdGggdGhlIGFjdHVhbCBkcml2ZXIgc3RhdGUuCj4gPiAKPiA+IENhbiB5b3UgZXhw
bGFpbiB3aGF0J3MgdGhlIGJlbmVmaXQgb2YgbGVhdmluZyBhIGRldmljZSB3aXRob3V0IGEKPiA+
IGRyaXZlciBpbiBzdWNoIHVua25vd24gc3RhdGU/Cj4gPiAKPiAKPiBJZiBwcm9iZSBmYWlscyB0
aGVuIEkgdGhpbmsgaXQgc2hvdWxkIGxlYXZlIHRoZSBzdGF0ZSBhbG9uZS4gSWYgdGhlCj4gc3Rh
dGUgaXMgbW92ZWQgdG8gY2xvc2VkIHRoZW4gYmFzaWNhbGx5IHlvdSBqdXN0IGtpbGxlZCB0aGF0
Cj4gY29ubmVjdGlvbiB0byB0aGUgZ3Vlc3QgKGFzIHRoZSBmcm9udGVuZCB3aWxsIG5vcm1hbGx5
IGNsb3NlIGRvd24KPiB3aGVuIGl0IHNlZXMgdGhpcyBjaGFuZ2UpIHNvLCBpZiB0aGUgcHJvYmUg
ZmFpbHVyZSB3YXMgZHVlIHRvIGEgYnVnCj4gaW4gYmxrYmFjayBvciwgZS5nLiwgYSB0cmFuc2ll
bnQgcmVzb3VyY2UgaXNzdWUgdGhlbiBpdCdzIGdhbWUgb3Zlcgo+IGFzIGZhciBhcyB0aGF0IGd1
ZXN0IGdvZXMuCgpCdXQgdGhlIGNvbm5lY3Rpb24gY2FuIGJlIHJlc3RhcnRlZCBieSBzd2l0Y2hp
bmcgdGhlIGJhY2tlbmQgdG8gdGhlCmluaXQgc3RhdGUgYWdhaW4uCgo+IFRoZSB1bHRpbWF0ZSBn
b2FsIGhlcmUgaXMgUFYgYmFja2VuZCByZS1sb2FkIHRoYXQgaXMgY29tcGxldGVseSB0cmFuc3Bh
cmVudCB0byB0aGUgZ3Vlc3QuIE1vZGlmeWluZyBhbnl0aGluZyBpbiB4ZW5zdG9yZSBjb21wcm9t
aXNlcyB0aGF0IHNvIHdlIG5lZWQgdG8gYmUgY2FyZWZ1bC4KClRoYXQncyBhIGZpbmUgZ29hbCwg
YnV0IG5vdCBzd2l0Y2hpbmcgdG8gY2xvc2VkIHN0YXRlIGluCnhlbmJ1c19kZXZfcmVtb3ZlIHNl
ZW1zIHdyb25nLCBhcyB5b3UgaGF2ZSBhY3R1YWxseSBsZWZ0IHRoZSBmcm9udGVuZAp3aXRob3V0
IGEgbWF0Y2hpbmcgYmFja2VuZCBhbmQgd2l0aCB0aGUgc3RhdGUgbm90IHNldCB0byBjbG9zZWQu
CgpJZTogdGhhdCB3b3VsZCBiZSBmaW5lIGlmIHlvdSBleHBsaWNpdGx5IHN0YXRlIHRoaXMgaXMg
c29tZSBraW5kIG9mCmludGVybmFsIGJsa2JhY2sgcmVsb2FkLCBidXQgbm90IGZvciB0aGUgZ2Vu
ZXJhbCBjYXNlIHdoZXJlIGJsa2JhY2sKaGFzIGJlZW4gdW5ib3VuZC4gSSB0aGluayB3ZSBuZWVk
IHNvbWV3YXkgdG8gZGlmZmVyZW5jZSBhIGJsa2JhY2sKcmVsb2FkIHZzIGEgdW5ib3VuZC4KClRo
YW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
