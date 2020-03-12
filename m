Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956921831F5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 14:47:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCO8z-0002bU-2G; Thu, 12 Mar 2020 13:45:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCO8x-0002bC-Ry
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 13:44:59 +0000
X-Inumbo-ID: a8e7dbcd-6467-11ea-b192-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8e7dbcd-6467-11ea-b192-12813bfff9fa;
 Thu, 12 Mar 2020 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584020698;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pWoV8dNLRnw48hVWH8EpOe+9TdyLfIol+1YEDfMimzo=;
 b=dtObyOBR1o4vsVpkS+++NJiEwHa23wnowOGRlYrLT0ut2K93zmp0a7Hd
 ZuuQ5CjhdX/USt6d6bTu219McmNu7ZGYPMtQfgUzr7j7EwL6AqmzQelpN
 n9dJhwrqh6XoMFevM2wCB7GZMSZfeIglBRKQCicSf2d2fe9L2mzwqdjwX w=;
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
IronPort-SDR: Q6JNUJVV2zOGvkRAXjK+KT0i4cLN1cl3D3By7GTTQgpBamkGGsbPaUcY86PuEbdWwPi+QpRIxl
 RZVIjyWnastXgNc6CW8wUNXTOO5UPNdBs/G1tdeQX68pL1kPNfyDG/rywup86KKqbtpxUV5GaV
 s8FMaeOm9rvRk3E+Dc2vice4MBClTNxnUnx5+TFUxWMhFF3WnwvPYH2bFVntHau5OL+1QCNp50
 se3SnqT8NvYUw7nepXM8qo9uvGD8+Ybem1Jou5y1XdkKfk+4bkPEKjbA9/iR0RCrxNjZrXtuBZ
 wT8=
X-SBRS: 2.7
X-MesageID: 14471823
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14471823"
Date: Thu, 12 Mar 2020 14:44:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200312134435.GJ24458@Air-de-Roger.citrite.net>
References: <8a151dd0-d083-d242-566c-f1faee084ae2@citrix.com>
 <658ef23d-f6e1-dbf8-8805-b84e32ffb6fa@suse.com>
 <20200312105639.GG24458@Air-de-Roger.citrite.net>
 <7c1fea74-15eb-0006-a99c-53fb4c4a676f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c1fea74-15eb-0006-a99c-53fb4c4a676f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] nvmx deadlock with MSR bitmaps
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMTI6MTI6MTJQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAxMi4wMy4yMCAxMTo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgTWFyIDEyLCAyMDIwIGF0IDA5OjU5OjQ4QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4gPiBPbiAxMS4wMy4yMDIwIDE5OjA0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4gPiA+
IFNwZWNpZmljYWxseSwgdGhpcyBpcyBhIHN3aXRjaCBmcm9tIGFuIEhWTSB2Y3B1LCB0byBhIFBW
IHZjcHUsIHdoZXJlIHRoZQo+ID4gPiA+IG1hcGNhY2hlIGNvZGUgdHJpZXMgdG8gYWNjZXNzIHRo
ZSBwZXItZG9tYWluIG1hcHBpbmdzIG9uIHRoZSBIVk0gbW9uaXRvcgo+ID4gPiA+IHRhYmxlLsKg
IEl0IGVuZHMgdXAgdHJ5aW5nIHRvIHJlY3Vyc2l2ZWx5IGFjcXVpcmUgdGhlIG1hcGNhY2hlIGxv
Y2sgd2hpbGUKPiA+ID4gPiB0cnlpbmcgdG8gd2FsayAlY3IyIHRvIGlkZW50aWZ5IHRoZSBzb3Vy
Y2Ugb2YgdGhlIGZhdWx0Lgo+ID4gPiA+IAo+ID4gPiA+IEZvciBudm14LT5tc3JfbWVyZ2VkLCB0
aGlzIG5lZWRzIHRvIGVpdGhlciBiZSBhIHhlbmhlYXAgcGFnZSwgb3IgYQo+ID4gPiA+IGdsb2Jh
bGx5IG1hcHBlZCBkb21oZWFwIHBhZ2UuwqAgSSdsbCBkcmFmdCBhIHBhdGNoIGluIGEgbW9tZW50
Lgo+ID4gPiA+IAo+ID4gPiA+IEZvciBtYXBfZG9tYWluX3BhZ2UoKSwgaXMgdGhlcmUgYW55dGhp
bmcgd2UgY2FuIHJhdGlvbmFsbHkgZG8gdG8gYXNzZXJ0Cj4gPiA+ID4gdGhhdCBpdCBpc24ndCBj
YWxsZWQgaW4gdGhlIG1pZGRsZSBvZiBhIGNvbnRleHQgc3dpdGNoP8KgIFRoaXMgaXMgdGhlCj4g
PiA+ID4ga2luZCBvZiB0aGluZyB3aGljaCBuZWVkcyB0byBibG93IHVwIHJlbGlhYmx5IGluIGEg
ZGVidWcgYnVpbGQuCj4gPiA+IAo+ID4gPiBXZWxsLCBpdCdzIG5vdCBpbmhlcmVudGx5IHVuc2Fm
ZSB0byBkbywgaXQncyBqdXN0IHRoYXQKPiA+ID4gbWFwY2FjaGVfY3VycmVudF92Y3B1KCkgd291
bGQgbmVlZCB0byBhdm9pZCB1c2luZyBjdXJyZW50IGZyb20KPiA+ID4gY29udGV4dF9zd2l0Y2go
KSdzIGNhbGwgdG8gc2V0X2N1cnJlbnQoKSB0aHJvdWdoIHRvCj4gPiA+IF9fY29udGV4dF9zd2l0
Y2goKSdzIGNhbGwgdG8gd3JpdGVfcHRiYXNlKCkuIEEgcG9zc2libGUKPiA+ID4gZGV0ZWN0aW9u
IChpZiB3ZSBkb24ndCB3YW50IHRvIG1ha2UgdGhlIGNhc2Ugd29yaykgd291bGQKPiA+ID4gc2Vl
bSB0byBiZSBBU1NFUlQoY3VycmVudCA9PSB0aGlzX2NwdShjdXJyX3ZjcHUpKS4gQnV0IG9mIGNv
dXJzZQo+ID4gPiB0aGVyZSdzIGFsc28gdGhpcyBleHRyYSBsb2dpYyBpbiBtYXBjYWNoZV9jdXJy
ZW50X3ZjcHUoKSB0byBkZWFsCj4gPiA+IHdpdGggYSBQViB2Q1BVIGhhdmluZyBhIG51bGwgdi0+
YXJjaC5ndWVzdF90YWJsZSwgd2hpY2ggSSdtIG9uY2UKPiA+ID4gYWdhaW4gc3RydWdnbGluZyB0
byBzZWUgdW5kZXIgd2hhdCBjb25kaXRpb25zIGl0IG1pZ2h0IGhhcHBlbi4KPiA+ID4gVGhlIERv
bTAgYnVpbGRpbmcgY2FzZSBjYW4ndCBiZSBtZWFudCB3aXRoIHRoZXJlIGJlaW5nCj4gPiA+IG1h
cGNhY2hlX292ZXJyaWRlX2N1cnJlbnQoKSBvbiB0aGF0IHBhdGguIEknbSB3b25kZXJpbmcgaWYg
dGhlCj4gPiA+IGNvbW1lbnQgdGhlcmUgaXMgbWlzbGVhZGluZyBhbmQgaXQncyByZWFsbHkgdG8g
Y292ZXIgdGhlIGNhc2UKPiA+ID4gd2hlcmUsIGNvbWluZyBmcm9tIGEgUFYgdkNQVSwgY3VycmVu
dCB3YXMgYWxyZWFkeSBzZXQgdG8gdGhlCj4gPiA+IGlkbGUgdkNQVSBieSBjb250ZXh0X3N3aXRj
aCgpICh3aGljaCB3b3VsZCBoYXZlIGEgbnVsbAo+ID4gPiB2LT5hcmNoLmd1ZXN0X3RhYmxlKSAt
IEkgd291bGRuJ3QgY2FsbCB0aGlzICJ3ZSBhcmUgcnVubmluZyBhCj4gPiA+IHBhcmF2aXJ0dWFs
aXNlZCBndWVzdCIuIEJ1dCBpbiBzdWNoIGEgY2FzZSB0aGUgbG9naWMgaGVyZSB3b3VsZAo+ID4g
PiBzaW1wbHkgYmUgYSAodG9vKSBzcGVjaWFsIGNhc2Ugb2Ygd2hhdCB5b3UncmUgZGVzY3JpYmlu
ZyBhcyB0aGUKPiA+ID4gaXNzdWUgd2l0aCBuVk1YLgo+ID4gCj4gPiBMb29raW5nIGF0IHRoZSBj
b2RlIGluIGNvbnRleHRfc3dpdGNoIGFuZCBfX2NvbnRleHRfc3dpdGNoIHdvdWxkIGl0IGJlCj4g
PiBwb3NzaWJsZSB0byBzZXQgY3VycmVudCB0byB0aGUgbmV4dCB2Q1BVIGFmdGVyIGFsbCB0aGUg
ZnJvbSBob29rcyBoYXZlCj4gPiBiZWVuIGNhbGxlZD8KPiA+IAo+ID4gSWU6IHNldF9jdXJyZW50
IGNvdWxkIGJlIG1vdmVkIGludG8gX19jb250ZXh0X3N3aXRjaCBhZnRlciB0aGUgY2FsbCB0bwo+
ID4gcGQtPmFyY2guY3R4dF9zd2l0Y2gtPmZyb20ocCkuCj4gCj4gTm8sIHdvdWxkbid0IHdvcmsu
IFdoZW4gc3dpdGNoaW5nIHRvIGlkbGUgX19jb250ZXh0X3N3aXRjaCgpIGlzIG5vcm1hbGx5Cj4g
bm90IGNhbGxlZCBpbiBvcmRlciB0byBhdm9pZCBzd2l0Y2hpbmcgdGhlIGFkZHJlc3Mgc3BhY2Ug
aW4gY2FzZSB0aGUKPiBzYW1lIHZjcHUgd2lsbCBiZSBzY2hlZHVsZWQgYWdhaW4gYWZ0ZXIgaWRs
ZS4gVGhpcyBpcyB0aGUgcmVhc29uIHdoeQo+IGN1cnJlbnQgYW5kIGN1cnJfdmNwdSBjYW4gYmUg
ZGlmZmVyZW50LgoKU2luY2UgdGhlIGlkbGUgdkNQVSBjb250ZXh0IHN3aXRjaCBpcyBhbHJlYWR5
IGEgc3BlY2lhbCBjYXNlIHdlIGNvdWxkCm1heWJlIHBsYWNlIHRoZSBjYWxsIHRvIHNldF9jdXJy
ZW50IGluIHN1Y2ggc3BlY2lhbCBoYW5kbGluZywgd2hpbGUKbGVhdmluZyB0aGUgY2FsbCBmb3Ig
dGhlIHJlc3Qgb2YgdkNQVXMgaW4gX19jb250ZXh0X3N3aXRjaCBhZnRlciB0aGUKLT5mcm9tIGhv
b2tzIGhhdmUgYmVlbiBleGVjdXRlZD8KCj4gPiBJJ20gYWxzbyBub3Qgc3VyZSBJIHVuZGVyc3Rh
bmQgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBjb250ZXh0X3N3aXRjaAo+ID4gYW5kIF9fY29udGV4
dF9zd2l0Y2gsIGFuZCBob3cgYXJlIGNhbGxlcnMgc3VwcG9zZWQgdG8gdXNlIHRoZW0uCgpKYW4g
cG9pbnRzIG91dCB0aGF0IF9fY29udGV4dF9zd2l0Y2ggc2lnbmFscyBhIHBlbmRpbmcgY29udGV4
dCBzd2l0Y2gsCmluIHdoaWNoIGNhc2UgbXkgcHJvcG9zYWwgdG8gdXNlIHNldF9jdXJyZW50IG1p
Z2h0IG5vdCBiZSBzdWl0YWJsZSwgYXMKd2Ugd291bGQgYmUgY2hhbmdpbmcgY3VycmVudCB3aXRo
b3V0IGFjdHVhbGx5IGRvaW5nIHRoZSBjb250ZXh0CnN3aXRjaD8KCkkgYWxzbyB3b25kZXIgd2h5
IF9fY29udGV4dF9zd2l0Y2ggdGhlbiBuZWVkcyB0byBjYWxsIHRoZSAtPmZyb20gaG9vawpqdXN0
IHRvIHNpZ25hbCBhIHBlbmRpbmcgY29udGV4dCBzd2l0Y2guIEl0IHNlZW1zIGxpa2UKX19jb250
ZXh0X3N3aXRjaCBkb2VzIGEgbG90IG9mIHdvcmsganVzdCB0byBzaWduYWwgYSBjb250ZXh0IHN3
aXRjaCwKd2hpY2ggd2lsbCB0aGVuIGJlIHJlZG9uZSB3aGVuIGNvbnRleHRfc3dpdGNoIGlzIGFj
dHVhbGx5IGNhbGxlZD8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
