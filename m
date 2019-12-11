Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E06D11ACA4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 14:59:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if2T5-0000f2-Aw; Wed, 11 Dec 2019 13:55:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=irg7=2B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1if2T3-0000eu-Qg
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 13:55:53 +0000
X-Inumbo-ID: ecbc9730-1c1d-11ea-a914-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecbc9730-1c1d-11ea-a914-bc764e2007e4;
 Wed, 11 Dec 2019 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576072544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=m6R/VVoQ+gbtGku3qSSn8lR/7efTsyljc6KkleafnFc=;
 b=gXCCmURFNgUXUl1t8lYwEKOMJy03AqyqJ+JUkD3gekgjB45+1eom6T26
 SsRw5Q+PIb5Ect47BgTH0Ye/Tp6V4OpRcKO89TPsvpvqWq6Kpt0IOov08
 XBhF9KJ3/IpjpF336b0J9PNmWF2vx+3SySf56Vc8e5M+s4T9K1ZjT5TH3 c=;
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
IronPort-SDR: Re26XLu4wVkXUyQDl8HBVkOhLeyFLmQmgQTYX/F9xkWTCyCe72gIZikKm6tF3tt6LGPzXB7BMB
 OZrpVZVwrxPp+9dIKp8TmrhWU15IKf+Rxd8GXKNkzkbmmCaTtwW02zr+1AlI7hpua044e9Fk3J
 K0YNEqd4y/MEPLJgiCtuz501SpJJQm2a5pEorJKjlJJFmJs0CHTGcyq7C5/ig0Ie0XfWATCVpJ
 vy/KvmibcHM5BzacenYFyom3Vv5LKDcRs02GwOHtVkttOwWEUp5BuchIQTaYAmxDTT1B/X9YMH
 eaY=
X-SBRS: 2.7
X-MesageID: 9529409
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,301,1571716800"; 
   d="scan'208";a="9529409"
Date: Wed, 11 Dec 2019 14:55:23 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.com>, Juergen Gross <jgross@suse.com>
Message-ID: <20191211135523.GP980@Air-de-Roger>
References: <20191210145305.6605-1-pdurrant@amazon.com>
 <20191211112754.GM980@Air-de-Roger>
 <14a01d62046c48ee9b2486917370b5f5@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14a01d62046c48ee9b2486917370b5f5@EX13D32EUC003.ant.amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] xen-blkback: prevent premature module unload
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
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDE6Mjc6NDJQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTkg
MTE6MjkKPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gQ2M6
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgbGludXgtYmxvY2tAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC0KPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47Cj4gPiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJu
ZWwuZGs+Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ZW4tYmxrYmFjazogcHJldmVudCBwcmVt
YXR1cmUgbW9kdWxlIHVubG9hZAo+ID4gCj4gPiBPbiBUdWUsIERlYyAxMCwgMjAxOSBhdCAwMjo1
MzowNVBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IE9iamVjdHMgYWxsb2NhdGVk
IGJ5IHhlbl9ibGtpZl9hbGxvYyBjb21lIGZyb20gdGhlICdibGtpZl9jYWNoZScga21lbQo+ID4g
PiBjYWNoZS4gVGhpcyBjYWNoZSBpcyBkZXN0b3llZCB3aGVuIHhlbi1ibGtpZiBpcyB1bmxvYWRl
ZCBzbyBpdCBpcwo+ID4gPiBuZWNlc3NhcnkgdG8gd2FpdCBmb3IgdGhlIGRlZmVycmVkIGZyZWUg
cm91dGluZSB1c2VkIGZvciBzdWNoIG9iamVjdHMgdG8KPiA+ID4gY29tcGxldGUuIFRoaXMgbmVj
ZXNzaXR5IHdhcyBtaXNzZWQgaW4gY29tbWl0IDE0ODU1OTU0ZjYzNiAieGVuLWJsa2JhY2s6Cj4g
PiA+IGFsbG93IG1vZHVsZSB0byBiZSBjbGVhbmx5IHVubG9hZGVkIi4gVGhpcyBwYXRjaCBmaXhl
cyB0aGUgcHJvYmxlbSBieQo+ID4gPiB0YWtpbmcvcmVsZWFzaW5nIGV4dHJhIG1vZHVsZSByZWZl
cmVuY2VzIGluIHhlbl9ibGtpZl9hbGxvYy9mcmVlKCkKPiA+ID4gcmVzcGVjdGl2ZWx5Lgo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiA+IAo+ID4gT25lIG5pdCBiZWxvdy4KPiA+IAo+ID4gPiAtLS0KPiA+ID4gQ2M6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiA+ID4gQ2M6ICJS
b2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+IENjOiBKZW5zIEF4
Ym9lIDxheGJvZUBrZXJuZWwuZGs+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ibG9jay94ZW4t
YmxrYmFjay94ZW5idXMuYyB8IDEwICsrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hl
bi1ibGtiYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9ibG9jay94ZW4tCj4gPiBibGtiYWNrL3hlbmJ1
cy5jCj4gPiA+IGluZGV4IGU4YzVjNTRlMWQyNi4uNTlkNTc2ZDI3Y2E3IDEwMDY0NAo+ID4gPiAt
LS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCj4gPiA+ICsrKyBiL2RyaXZl
cnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKPiA+ID4gQEAgLTE3MSw2ICsxNzEsMTUgQEAg
c3RhdGljIHN0cnVjdCB4ZW5fYmxraWYgKnhlbl9ibGtpZl9hbGxvYyhkb21pZF90Cj4gPiBkb21p
ZCkKPiA+ID4gIAlibGtpZi0+ZG9taWQgPSBkb21pZDsKPiA+ID4gIAlhdG9taWNfc2V0KCZibGtp
Zi0+cmVmY250LCAxKTsKPiA+ID4gIAlpbml0X2NvbXBsZXRpb24oJmJsa2lmLT5kcmFpbl9jb21w
bGV0ZSk7Cj4gPiA+ICsKPiA+ID4gKwkvKgo+ID4gPiArCSAqIEJlY2F1c2UgZnJlZWluZyBiYWNr
IHRvIHRoZSBjYWNoZSBtYXkgYmUgZGVmZXJyZWQsIGl0IGlzIG5vdAo+ID4gPiArCSAqIHNhZmUg
dG8gdW5sb2FkIHRoZSBtb2R1bGUgKGFuZCBoZW5jZSBkZXN0cm95IHRoZSBjYWNoZSkgdW50aWwK
PiA+ID4gKwkgKiB0aGlzIGhhcyBjb21wbGV0ZWQuIFRvIHByZXZlbnQgcHJlbWF0dXJlIHVubG9h
ZGluZywgdGFrZSBhbgo+ID4gPiArCSAqIGV4dHJhIG1vZHVsZSByZWZlcmVuY2UgaGVyZSBhbmQg
cmVsZWFzZSBvbmx5IHdoZW4gdGhlIG9iamVjdAo+ID4gPiArCSAqIGhhcyBiZWVuIGZyZWUgYmFj
ayB0byB0aGUgY2FjaGUuCj4gPiAgICAgICAgICAgICAgICAgICAgIF4gZnJlZWQKPiAKPiBPaCB5
ZXMuIENhbiB0aGlzIGJlIGRvbmUgb24gY29tbWl0LCBvciB3b3VsZCB5b3UgbGlrZSBtZSB0byBz
ZW5kIGEgdjI/CgpBZGp1c3Rpbmcgb24gY29tbWl0IHdvdWxkIGJlIGZpbmUgZm9yIG1lLCBidXQg
aXQncyB1cCB0byBKdWVyZ2VuIHNpbmNlCmhlIGlzIHRoZSBvbmUgdGhhdCB3aWxsIHBpY2sgdGhp
cyB1cC4gSUlSQyB0aGUgbW9kdWxlIHVubG9hZCBwYXRjaGVzCmRpZG4ndCBnbyB0aHJvdWdoIHRo
ZSBibG9jayBzdWJzeXN0ZW0uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
