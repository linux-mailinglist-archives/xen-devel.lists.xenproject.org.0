Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B2D16257A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:25:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40xk-0000jk-Kl; Tue, 18 Feb 2020 11:22:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVht=4G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j40xi-0000jN-Py
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:22:46 +0000
X-Inumbo-ID: fc929db8-5240-11ea-8156-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc929db8-5240-11ea-8156-12813bfff9fa;
 Tue, 18 Feb 2020 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582024965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UNu3nnpZFSBLrOjRlnf3u0lcgL+nT+ZK2oLGKvzzc7I=;
 b=bNEtpH5FPB1ETwtzzGZkdHacDotItvRrxXcnNWVJEgRb8Dyg0Isxpvkg
 8BbPpcUZhzvSn5Zmulr3YDO1ePMJSzQ1xMbRE3HiIA5fSDck7qBEC3CZd
 /2oInI2SmsHng/LcJpiY+ccEeHUdnZgE1qnTGQgqk1z1xTZqV7KUWOcUA M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1XrXBDHtHKhch9ZgE+C+NXXie6+1L0UVoZqRKQS3R7sGZVPdKcpSs7fx8hQ5oTWjt/SJrswAT9
 lRbiLXi6nOvhW6KO09OIOscjHMViI9XG+14ojomvdG29Tg1Rp+FF8c4ETYawcAwVUMDIFQuIlp
 4IeNtRBsrks1Mqz9BCn9QZR+sf4xYL7jVI3epQMWxeEQngshBD0RiGRVpGBjV2ok/zSTzXOSvf
 tKI0sT6wIIMkg1y0++sGQfoS+Nm+uZjDoEiGYevgmvB9CeOJcaV9a+O6Fd4yagow3vqv0znegl
 fmw=
X-SBRS: 2.7
X-MesageID: 13234336
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="13234336"
Date: Tue, 18 Feb 2020 12:22:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200218112238.GT4679@Air-de-Roger>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
 <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
 <20200218111039.GS4679@Air-de-Roger>
 <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
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

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTE6MjE6MTJBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOC8wMi8yMDIwIDExOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTA6NTM6NDVBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+PiBPbiAxNy8wMi8yMDIwIDE4OjQzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4g
Pj4+IEBAIC02Nyw3ICs2OCwyMCBAQCBzdGF0aWMgdm9pZCBzZW5kX0lQSV9zaG9ydGN1dCh1bnNp
Z25lZCBpbnQgc2hvcnRjdXQsIGludCB2ZWN0b3IsCj4gPj4+ICB2b2lkIHNlbmRfSVBJX21hc2so
Y29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9yKQo+ID4+PiAgewo+ID4+PiAgICAgIGJv
b2wgY3B1c19sb2NrZWQgPSBmYWxzZTsKPiA+Pj4gLSAgICBjcHVtYXNrX3QgKnNjcmF0Y2ggPSB0
aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spOwo+ID4+PiArICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9
IHRoaXNfY3B1KHNlbmRfaXBpX2NwdW1hc2spOwo+ID4+PiArICAgIHVuc2lnbmVkIGxvbmcgZmxh
Z3M7Cj4gPj4+ICsKPiA+Pj4gKyAgICBpZiAoIGluX21jKCkgfHwgaW5fbm1pKCkgKQo+ID4+PiAr
ICAgIHsKPiA+Pj4gKyAgICAgICAgLyoKPiA+Pj4gKyAgICAgICAgICogV2hlbiBpbiAjTUMgb3Ig
I01OSSBjb250ZXh0IFhlbiBjYW5ub3QgdXNlIHRoZSBwZXItQ1BVIHNjcmF0Y2ggbWFzawo+ID4+
PiArICAgICAgICAgKiBiZWNhdXNlIHdlIGhhdmUgbm8gd2F5IHRvIGF2b2lkIHJlZW50cnksIHNv
IGRvIG5vdCB1c2UgdGhlIEFQSUMKPiA+Pj4gKyAgICAgICAgICogc2hvcnRoYW5kLgo+ID4+PiAr
ICAgICAgICAgKi8KPiA+Pj4gKyAgICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwoZ2VuYXBpYy5zZW5k
X0lQSV9tYXNrLCBtYXNrLCB2ZWN0b3IpOwo+ID4+PiArICAgICAgICByZXR1cm47Cj4gPj4gVGhl
IHNldCBvZiB0aGluZ3MgeW91IGNhbiBzYWZlbHkgZG8gaW4gYW4gTk1JL01DRSBoYW5kbGVyIGlz
IHNtYWxsLCBhbmQKPiA+PiBkb2VzIG5vdCBpbmNsdWRlIHNlbmRpbmcgSVBJcy7CoCAoSW4gcmVh
bGl0eSwgaWYgeW91J3JlIHVzaW5nIHgyYXBpYywgaXQKPiA+PiBpcyBzYWZlIHRvIHNlbmQgYW4g
SVBJIGJlY2F1c2UgdGhlcmUgaXMgbm8gcmlzayBvZiBjbG9iYmVyaW5nIElDUjIKPiA+PiBiZWhp
bmQgeW91ciBvdXRlciBjb250ZXh0J3MgYmFjaykuCj4gPj4KPiA+PiBIb3dldmVyLCBpZiB3ZSBl
c2NhbGF0ZSBmcm9tIE5NSS9NQ0UgY29udGV4dCBpbnRvIGNyYXNoIGNvbnRleHQsIHRoZW4KPiA+
PiBhbnl0aGluZyBnb2VzLsKgIEluIHJlYWxpdHksIHdlIG9ubHkgZXZlciBzZW5kIE5NSXMgZnJv
bSB0aGUgY3Jhc2ggcGF0aCwKPiA+PiBhbmQgdGhhdCBpcyBub3QgcGVybWl0dGVkIHRvIHVzZSBh
IHNob3J0aGFuZCwgbWFraW5nIHRoaXMgY29kZSBkZWFkLgo+ID4gVGhpcyB3YXMgcmVxdWVzdGVk
IGJ5IEphbiwgYXMgc2FmZXR5IG1lYXN1cmUKPiAKPiBUaGF0IG1heSBiZSwgYnV0IGl0IGRvZXNu
J3QgbWVhbiBpdCBpcyBjb3JyZWN0LsKgIElmIGV4ZWN1dGlvbiBldmVyCj4gZW50ZXJzIHRoaXMg
ZnVuY3Rpb24gaW4gTk1JL01DRSBjb250ZXh0LCB0aGVyZSBpcyBhIHJlYWwsCj4gc3RhdGUtY29y
cnVwdGluZyBidWcsIGhpZ2hlciB1cCB0aGUgY2FsbCBzdGFjay4KCkFjaywgdGhlbiBJIGd1ZXNz
IHdlIHNob3VsZCBqdXN0IEJVRygpIGhlcmUgaWYgZXZlciBjYWxsZWQgZnJvbSAjTk1JCm9yICNN
QyBjb250ZXh0PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
