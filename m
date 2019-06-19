Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ACF4BBAA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 16:33:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdbbj-0005WA-41; Wed, 19 Jun 2019 14:30:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdbbi-0005W5-8k
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 14:30:38 +0000
X-Inumbo-ID: ccc6a0c8-929e-11e9-8ed0-bf07ab166e16
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccc6a0c8-929e-11e9-8ed0-bf07ab166e16;
 Wed, 19 Jun 2019 14:30:35 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YnxHfFtdX0YUMBbupop5zms6sMWm7xBSKPoolb6PwaGp92rNRrKUI+ilCjddIGRxeiYsz4dq9B
 8EYA9Wdtq90t13obbARJxxKj6+mnpd7TC6ecvLBZ31Rq0R36siWSVDQFbCm24SzRJu/QEkAlz4
 zmyiRO4LIgSNGT5hUbJpvv3HxLiEi32GxesC++t6ZQaKmWB2/O9IDfW7XCBwGqfIZJXlUX3dn1
 sS9+JuH50DT26MuLZz3Y29zR3IR7DrlGgJeDKnC7f52ZnFklr/mjryQfHps9soZH84kTCef5/u
 qhM=
X-SBRS: 2.7
X-MesageID: 1947036
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1947036"
Date: Wed, 19 Jun 2019 16:30:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190619143027.qrcg6b6fcpsgwvjd@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <cd4af737-de45-15a0-d0c6-90e7d9cc0185@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd4af737-de45-15a0-d0c6-90e7d9cc0185@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MjA6NDBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8wNi8yMDE5IDEyOjAyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBJ
ZiB0aGUgaHlwZXJ2aXNvciBoYXMgYmVlbiBidWlsdCB3aXRoIEVGSSBzdXBwb3J0IChpZTogbXVs
dGlib290MikuCj4gCj4gU2VlaW5nIGFzIHRoaXMgY29udGludWVzIHRoZSBzZW50ZW5jZSBmcm9t
IHRoZSBzdWJqZWN0LCBpdCBzaG91bGQgc3RhcnQKPiB3aXRob3V0IGEgY2FwaXRhbC7CoCBPdGhl
cndpc2UgdGhlIHJlc3VsdCBpcyB3ZXJkIHRvIHJlYWQuCj4gCj4gPiBUaGlzIGFsbG93cyB0byBw
b3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24gY29ycmVjdGx5IGluIHRoZSBvdXRwdXQKPiA+IGJp
bmFyeSwgb3IgZWxzZSB0aGUgbGlua2VyIG1pZ2h0IHBsYWNlIC5yZWxvYyBiZWZvcmUgdGhlIC50
ZXh0Cj4gPiBzZWN0aW9uLgo+IAo+IFJlYWxseT/CoCBIb3cgY2FuIHRoaXMgYmUgYSBsZWdpdGlt
YXRlIHRyYW5zZm9ybWF0aW9uIGZvciB0aGUgbGlua2VyIHRvIG1ha2U/CgpJJ3ZlIGFscmVhZHkg
c3VibWl0dGVkIGEgYnVnIHJlcG9ydDoKCmh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9NDIzMjcKCkdOVSBsZCBiZWhhdmlvdXIgaXMgdG8gcGxhY2Ugb3JwaGFuZWQgc2VjdGlv
bnMgYXQgdGhlIGVuZC4KCj4gPgo+ID4gTm90ZSB0aGF0IHRoZSAucmVsb2Mgc2VjdGlvbiBpcyBt
b3ZlZCBiZWZvcmUgLmJzcyBmb3IgdHdvIHJlYXNvbnM6IGluCj4gPiBvcmRlciBmb3IgdGhlIHJl
c3VsdGluZyBiaW5hcnkgdG8gbm90IGNvbnRhaW4gYW55IHNlY3Rpb24gd2l0aCBkYXRhCj4gPiBh
ZnRlciAuYnNzLCBzbyB0aGF0IHRoZSBmaWxlIHNpemUgY2FuIGJlIHNtYWxsZXIgdGhhbiB0aGUg
bG9hZGVkCj4gPiBtZW1vcnkgc2l6ZSwgYW5kIGJlY2F1c2UgdGhlIGRhdGEgaXQgY29udGFpbnMg
aXMgcmVhZC1vbmx5LCBzbyBpdAo+ID4gYmVsb25ncyB3aXRoIHRoZSBvdGhlciBzZWN0aW9ucyBj
b250YWluaW5nIHJlYWQtb25seSBkYXRhLgo+IAo+IFRoZSBjb250ZW50IG9mIC5yZWxvY3MgaXMg
dHJhbnNmb3JtZWQgdmlhIG1rcmVsb2MgdG8gYmVjb21lCj4gX19iYXNlX3JlbG9jc197c3RhcnQs
ZW5kfSBhbmQgc2hvdWxkbid0IGV4aXN0IGludG8gdGhlIGZpbmFsIGxpbmtlZAo+IGltYWdlIEFG
QUlDVC4KCl9fYmFzZV9yZWxvY3Nfe3N0YXJ0L2VuZH0gaXMgYWN0dWFsbHkgd2hhdCdzIGNvbnRh
aW5lZCBpbiB0aGUgLnJlbG9jcwpzZWN0aW9uLCBvciBhdCBsZWFzdCB0aGF0IHdhcyBtbnkgaW1w
cmVzc2lvbiBiYXNlZCBvbiB0aGUgY29udGVudHMgb2YKeGVuL2FyY2gveDg2L2VmaS9yZWxvY3Mt
ZHVtbXkuUwoKPiBTaW5jZSB0aGUgTUIxL01CMiBidWlsZHMgYXJlbid0IHJlbG9jYXRhYmxlLCBJ
IHRoaW5rIHdlIG1pZ2h0IGJlIGFibGUgdG8KPiBnZXQgYXdheSB3aXRoIHNpbXBseSBleGNsdWRp
bmcgdGhlbSBpbiB0aGUgbm9uLUVGSSBidWlsZC4KCkhtLCBPSy4gSSdtIHNsaWdodGx5IGxvc3Mg
dGhlbi4gSSd2ZSB0YWtlbiBhIGxvb2sgYXQgdGhlIGhpc3Rvcnkgb2YKeGVuL2FyY2gveDg2L2Vm
aS9yZWxvY3MtZHVtbXkuUyBhbmQgaXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IHN1Y2ggYQpkdW1t
eSBmaWxlIHdhcyBhZGRlZC4gTXkgZ3Vlc3MgaXMgdGhhdCBpdCdzIGRvbmUgaW4gb3JkZXIgdG8g
cHJldmVudAptaXNzaW5nIHN5bWJvbHMgZXJyb3JzLiBJZiB0aGF0J3MgdGhlIGNhc2UgSSBndWVz
cyB0aGUgY29kZSB0aGF0IG1ha2VzCnVzZSBvZiBzdWNoIHN5bWJvbHMgY2FuIGJlIGd1YXJkZWQs
IGFuZCB0aGUgZHVtbXkgZmlsZSByZW1vdmVkPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
