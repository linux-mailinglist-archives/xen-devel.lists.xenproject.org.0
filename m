Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB331625C4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:49:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j41KN-00032y-Pq; Tue, 18 Feb 2020 11:46:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVht=4G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j41KM-00032p-FQ
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:46:10 +0000
X-Inumbo-ID: 40fda756-5244-11ea-815b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40fda756-5244-11ea-815b-12813bfff9fa;
 Tue, 18 Feb 2020 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582026369;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=w8i9DJ302Rb2+IGVA0cwZ6pnH0mGBTdOI2pPOWLdFaI=;
 b=Q9vHK0/qWIX2/RAHXSuqqn08Z6qV856m+bS60sFzK+ioeRJvLPemVpaS
 buAqos6gq/5xWAtFcnGP+cq8HiPMxiY4vNpc1B+w7DoaoIBGFU9dkcsY8
 qvR+7h0+3hrzFM4OTHBRwqnVBR5H8QPyxB9ufVmcIZvECZK5QwB3aT/sa A=;
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
IronPort-SDR: 2213N4unL3hpyI1Y35GWa7IVkN/JL7rRgS0YD4+FM7v3cez2Srg+varcaJIFR6fKiwfUfydnNL
 NzvyygYKPU3MYqXqh0V1eTDqVVvdO9Mo1xuQOi8TToDGO/7JumuBWYvNucK3EDVZqxKI6PQsVt
 5IH7jVLISkhaX2c0FncD2HeJWHkoscxAJihMJTbGcuL41pGQX94J0yFZ4/TortnRxNNSI2XeTx
 g8XhSVjgiWs9p9TZUmOB/0JbtoJWrt6vXfKCwn4fjmmogctUv445kktRKpk8YRfmCNhl0pD2C1
 R0I=
X-SBRS: 2.7
X-MesageID: 13044138
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="13044138"
Date: Tue, 18 Feb 2020 12:46:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200218114602.GU4679@Air-de-Roger>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
 <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
 <20200218111039.GS4679@Air-de-Roger>
 <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
 <20200218112238.GT4679@Air-de-Roger>
 <301e4658-3dc2-de74-ae9d-3f13bc2f1502@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <301e4658-3dc2-de74-ae9d-3f13bc2f1502@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTE6MzU6MzdBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiAKPiAKPiBPbiAxOC8wMi8yMDIwIDExOjIyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+ID4gT24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTE6MjE6MTJBTSArMDAwMCwgQW5kcmV3IENv
b3BlciB3cm90ZToKPiA+PiBPbiAxOC8wMi8yMDIwIDExOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+ID4+PiBPbiBUdWUsIEZlYiAxOCwgMjAyMCBhdCAxMDo1Mzo0NUFNICswMDAwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+ID4+Pj4gT24gMTcvMDIvMjAyMCAxODo0MywgUm9nZXIgUGF1IE1v
bm5lIHdyb3RlOgo+ID4+Pj4+IEBAIC02Nyw3ICs2OCwyMCBAQCBzdGF0aWMgdm9pZCBzZW5kX0lQ
SV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2ZWN0b3IsCj4gPj4+Pj4gIHZv
aWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3IpCj4gPj4+
Pj4gIHsKPiA+Pj4+PiAgICAgIGJvb2wgY3B1c19sb2NrZWQgPSBmYWxzZTsKPiA+Pj4+PiAtICAg
IGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFzayk7Cj4gPj4+Pj4g
KyAgICBjcHVtYXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsKPiA+
Pj4+PiArICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPj4+Pj4gKwo+ID4+Pj4+ICsgICAgaWYg
KCBpbl9tYygpIHx8IGluX25taSgpICkKPiA+Pj4+PiArICAgIHsKPiA+Pj4+PiArICAgICAgICAv
Kgo+ID4+Pj4+ICsgICAgICAgICAqIFdoZW4gaW4gI01DIG9yICNNTkkgY29udGV4dCBYZW4gY2Fu
bm90IHVzZSB0aGUgcGVyLUNQVSBzY3JhdGNoIG1hc2sKPiA+Pj4+PiArICAgICAgICAgKiBiZWNh
dXNlIHdlIGhhdmUgbm8gd2F5IHRvIGF2b2lkIHJlZW50cnksIHNvIGRvIG5vdCB1c2UgdGhlIEFQ
SUMKPiA+Pj4+PiArICAgICAgICAgKiBzaG9ydGhhbmQuCj4gPj4+Pj4gKyAgICAgICAgICovCj4g
Pj4+Pj4gKyAgICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwoZ2VuYXBpYy5zZW5kX0lQSV9tYXNrLCBt
YXNrLCB2ZWN0b3IpOwo+ID4+Pj4+ICsgICAgICAgIHJldHVybjsKPiA+Pj4+IFRoZSBzZXQgb2Yg
dGhpbmdzIHlvdSBjYW4gc2FmZWx5IGRvIGluIGFuIE5NSS9NQ0UgaGFuZGxlciBpcyBzbWFsbCwg
YW5kCj4gPj4+PiBkb2VzIG5vdCBpbmNsdWRlIHNlbmRpbmcgSVBJcy7CoCAoSW4gcmVhbGl0eSwg
aWYgeW91J3JlIHVzaW5nIHgyYXBpYywgaXQKPiA+Pj4+IGlzIHNhZmUgdG8gc2VuZCBhbiBJUEkg
YmVjYXVzZSB0aGVyZSBpcyBubyByaXNrIG9mIGNsb2JiZXJpbmcgSUNSMgo+ID4+Pj4gYmVoaW5k
IHlvdXIgb3V0ZXIgY29udGV4dCdzIGJhY2spLgo+ID4+Pj4KPiA+Pj4+IEhvd2V2ZXIsIGlmIHdl
IGVzY2FsYXRlIGZyb20gTk1JL01DRSBjb250ZXh0IGludG8gY3Jhc2ggY29udGV4dCwgdGhlbgo+
ID4+Pj4gYW55dGhpbmcgZ29lcy7CoCBJbiByZWFsaXR5LCB3ZSBvbmx5IGV2ZXIgc2VuZCBOTUlz
IGZyb20gdGhlIGNyYXNoIHBhdGgsCj4gPj4+PiBhbmQgdGhhdCBpcyBub3QgcGVybWl0dGVkIHRv
IHVzZSBhIHNob3J0aGFuZCwgbWFraW5nIHRoaXMgY29kZSBkZWFkLgo+ID4+PiBUaGlzIHdhcyBy
ZXF1ZXN0ZWQgYnkgSmFuLCBhcyBzYWZldHkgbWVhc3VyZQo+ID4+IFRoYXQgbWF5IGJlLCBidXQg
aXQgZG9lc24ndCBtZWFuIGl0IGlzIGNvcnJlY3QuwqAgSWYgZXhlY3V0aW9uIGV2ZXIKPiA+PiBl
bnRlcnMgdGhpcyBmdW5jdGlvbiBpbiBOTUkvTUNFIGNvbnRleHQsIHRoZXJlIGlzIGEgcmVhbCwK
PiA+PiBzdGF0ZS1jb3JydXB0aW5nIGJ1ZywgaGlnaGVyIHVwIHRoZSBjYWxsIHN0YWNrLgo+ID4g
QWNrLCB0aGVuIEkgZ3Vlc3Mgd2Ugc2hvdWxkIGp1c3QgQlVHKCkgaGVyZSBpZiBldmVyIGNhbGxl
ZCBmcm9tICNOTUkKPiA+IG9yICNNQyBjb250ZXh0Pwo+IAo+IFdlbGwuwqAgVGhlcmUgaXMgYSBy
ZWFzb24gSSBzdWdnZXN0ZWQgcmVtb3ZpbmcgaXQsIGFuZCBub3QgdXNpbmcgQlVHKCkuCj4gCj4g
SWYgTk1JL01DRSBjb250ZXh0IGVzY2FsYXRlcyB0byBjcmFzaCBjb250ZXh0LCB3ZSBkbyBuZWVk
IHRvIHNlbmQgTk1Jcy7CoAo+IEl0IHdvbid0IGJlIHRoaXMgZnVuY3Rpb24gc3BlY2lmaWNhbGx5
LCBidXQgaXQgd2lsbCBiZSBwYXJ0IG9mIHRoZQo+IGdlbmVyYWwgSVBJIGluZnJhc3RydWN0dXJl
Lgo+IAo+IFdlIGRlZmluaXRlbHkgZG9uJ3Qgd2FudCB0byBnZXQgaW50byB0aGUgZ2FtZSBvZiB0
cnlpbmcgdG8gY2xvYmJlciBlYWNoCj4gb2YgdGhlIHN0YXRlIHZhcmlhYmxlcywgc28gdGhlIG9u
bHkgdGhpbmcgdGhyb3dpbmcgQlVHKCkncyBhcm91bmQgaW4KPiB0aGlzIGFyZWEgd2lsbCBkbyBp
cyBtYWtlIHRoZSBjcmFzaCBwYXRoIG1vcmUgZnJhZ2lsZS4KCkkgc2VlLCBwYW5pY2tpbmcgaW4g
c3VjaCBjb250ZXh0IHdpbGwganVzdCBjbG9iYmVyIHRoZSBwcmV2aW91cyBjcmFzaApoYXBwZW5l
ZCBpbiBOTUkvTUMgY29udGV4dC4KClNvIHlvdSB3b3VsZCByYXRoZXIga2VlcCB0aGUgY3VycmVu
dCB2ZXJzaW9uIG9mIGZhbGxpbmcgYmFjayB0byB0aGUKdXNhZ2Ugb2YgdGhlIG5vbi1zaG9ydGhh
bmQgSVBJIHNlbmRpbmcgcm91dGluZSBpbnN0ZWFkIG9mIHBhbmlja2luZz8KCldoYXQgYWJvdXQ6
CgppZiAoIGluX21jKCkgfHwgaW5fbm1pKCkgKQp7CiAgICAvKgogICAgICogV2hlbiBpbiAjTUMg
b3IgI01OSSBjb250ZXh0IFhlbiBjYW5ub3QgdXNlIHRoZSBwZXItQ1BVIHNjcmF0Y2ggbWFzawog
ICAgICogYmVjYXVzZSB3ZSBoYXZlIG5vIHdheSB0byBhdm9pZCByZWVudHJ5LCBzbyBkbyBub3Qg
dXNlIHRoZSBBUElDCiAgICAgKiBzaG9ydGhhbmQuIFRoZSBvbmx5IElQSSB0aGF0IHNob3VsZCBi
ZSBzZW50IGZyb20gc3VjaCBjb250ZXh0CiAgICAgKiBpcyBhICNOTUkgdG8gc2h1dGRvd24gdGhl
IHN5c3RlbSBpbiBjYXNlIG9mIGEgY3Jhc2guCiAgICAgKi8KICAgIGlmICggdmVjdG9yID09IEFQ
SUNfRE1fTk1JICkKICAgIAlhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21hc2ss
IG1hc2ssIHZlY3Rvcik7CiAgICBlbHNlCiAgICAgICAgQlVHKCk7CgogICAgcmV0dXJuOwp9CgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
