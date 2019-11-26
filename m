Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6A5109AC8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 10:12:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZWqP-0001v7-43; Tue, 26 Nov 2019 09:09:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up47=ZS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZWqN-0001ua-TC
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 09:09:11 +0000
X-Inumbo-ID: 6253c8e0-102c-11ea-a39c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6253c8e0-102c-11ea-a39c-12813bfff9fa;
 Tue, 26 Nov 2019 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574759340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0j1mUuEp04pNR/nO3Ru9N0M/lMeIvyEv0Ep21CeCZNs=;
 b=K2+O37VK0m37kPr4vqk1jnTmVCvLtCNll37lqk4xuXFGi79lU2ut6yoG
 tKJ4rp9Nmpw3vU7HayWPvlFLYXfRrYVF8NYrIC8vVLMrK8TSXJmZFWv0A
 32QWQ6gZWyQfRpS+jZQvTohUgoKLp1v/mUsjPtKscdTKjjNxRVAawkhpJ E=;
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
IronPort-SDR: lWoZd84oh77CiqHaZmNqH7eGyerDMKw9IdeR+Torcmdr9lLAwkU+OexGQQQaIw02LlRKlphQ9e
 5vv35qa7u0rr0hb0twl7BclOF3aaVORWRAmzpFTC1w6ntwVjpL/quYqq5iqENlSIC3v3PCX3ld
 JNrRAdMrMAFDBZhdOkV5to2yJISolCCJ+iaPBrVx4zb25j2YnrKlDFBxTI/w3KHEoYvFzDATF5
 81qABnVG7H3Csm+sHMcmVeY6EWeU5nlV424nsTTAtTPMPZroZdkdK/TotJ4aJLS8pNHQ0n8654
 tW0=
X-SBRS: 2.7
X-MesageID: 9384112
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="9384112"
Date: Tue, 26 Nov 2019 10:08:50 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191126090850.GD980@Air-de-Roger>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
 <20191125140606.6jmltrc624zugnqv@debian>
 <20191125155931.GA980@Air-de-Roger>
 <20191125170704.etgloq6y2e7j6ewg@debian>
 <20191125172704.GB980@Air-de-Roger>
 <0449da3e-2e23-1d2a-1967-5d52a803df65@citrix.com>
 <20191125174956.GC980@Air-de-Roger>
 <33faac3c-ab0f-0f1e-7444-4cd8cc9fb12c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33faac3c-ab0f-0f1e-7444-4cd8cc9fb12c@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 GeorgeDunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDk6MzA6NDdBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjUuMTEuMjAxOSAxODo0OSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBNb24sIE5vdiAyNSwgMjAxOSBhdCAwNTozNDoxNVBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOgo+ID4+IE9uIDI1LzExLzIwMTkgMTc6MjcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4g
Pj4+IE9uIE1vbiwgTm92IDI1LCAyMDE5IGF0IDA1OjA3OjA0UE0gKzAwMDAsIFdlaSBMaXUgd3Jv
dGU6Cj4gPj4+PiBPbiBNb24sIE5vdiAyNSwgMjAxOSBhdCAwNDo1OTozMVBNICswMTAwLCBSb2dl
ciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+Pj4gWy4uLl0KPiA+Pj4+PiBXaGljaCBJIHRoaW5rIGl0
J3MgZXhwZWN0ZWQsIHdlIGFscmVhZHkga25ldyBjbGFuZyBoYWQgYSBsb3Qgb2YKPiA+Pj4+PiBk
dXBsaWNhdGUgc3ltYm9scy4gVGhlIG9ubHkgd2F5IEkga25vdyB0byB3b3JrYXJvdW5kIHRoaXMg
QVRNIGlzIHRvCj4gPj4+Pj4gdXNlIGBnbWFrZSB4ZW4gY2xhbmc9eSBDT05GSUdfRU5GT1JDRV9V
TklRVUVfU1lNQk9MUz1uYC4gSXQncyBvbiBteQo+ID4+Pj4+IHBpbGUgb2Ygc3R1ZmYgdG8gbG9v
ayBpbnRvLCBidXQgSSdtIG5vdCBzdXJlIHdoZW4gSSB3aWxsIGdldCB0byBpdC4KPiA+Pj4+IElu
IHRoYXQgY2FzZSB3ZSBzaG91bGQgbWFrZSBHaXRsYWIgQ0kgdXNlIHRoZSBuZXcgY29uZmlndXJh
dGlvbiBvcHRpb24uCj4gPj4+IElNTyB0aGUgYnVpbGQgc2hvdWxkIHdvcmsgb3V0IG9mIHRoZSBi
b3gsIHNvIHdlIHNob3VsZCBkaXNhYmxlCj4gPj4+IENPTkZJR19FTkZPUkNFX1VOSVFVRV9TWU1C
T0xTIGF1dG9tYXRpY2FsbHkgaWYgY2xhbmcgaXMgZGV0ZWN0ZWQuCj4gPj4KPiA+PiBLY29uZmln
IGluIDQuMTMgaXNuJ3QgaW4gYSBwb3NpdGlvbiB0byBrbm93IHRoaXMuwqAgKEl0IHdpbGwgYmUg
aW4gNC4xNAo+ID4+IHdpdGggQW50aG9ueSdzIHJlZnJlc2ggY29tbWl0dGVkKS4KPiA+IAo+ID4g
V2UgYWxyZWFkeSBoYXZlIEtjb25maWcgb3B0aW9ucyB0aGF0IGRlcGVuZCBvbiB0b29sY2hhaW4g
ZmVhdHVyZXMsCj4gPiBsaXZlcGF0Y2ggaXRzZWxmIHdpbGwgYmUgZW5hYmxlZCBpZiBidWlsZCBp
ZCBpcyBzdXBwb3J0ZWQgYnkgdGhlCj4gPiBsaW5rZXIsIHdoeSBub3QgdXNlIHNvbWV0aGluZyBs
aWtlOgo+IAo+IEknbSBzb3JyeSB0byBzYXkgdGhpcywgYnV0IHN1Z2dlc3Rpbmcgd29ya2Fyb3Vu
ZHMgbGlrZSB0aGlzIHdoZW4KPiB0aGVyZSdzIGEgc29sdXRpb24gdG8gdGhlIHByb2JsZW0gWzFd
IGZlZWxzIGFic3VyZC4KPiAKPiBKYW4KPiAKPiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTExL21zZzAwMzU3Lmh0bWwKCklJUkMg
SnVlcmdlbiBoYWQgY29uY2VybnMgYWJvdXQgdGFraW5nIHRoaXMgYWZ0ZXIgcmMzLiBJJ20gYWxs
IGZvcgpnZXR0aW5nIHRoaXMgZml4ZWQgaW4gNC4xMywgYnV0IGlmIHRoYXQncyBub3QgdGhlIGNh
c2Ugd2Ugc2hvdWxkIGp1c3QKZGlzYWJsZSBsaXZlIHBhdGNoaW5nIG9uIGNsYW5nLgoKUmVsZWFz
aW5nIHdpdGhvdXQgWGVuIGJ1aWxkaW5nIG91dCBvZiB0aGUgYm94IHdpdGggY2xhbmcgaXMgbm90
IGFuCm9wdGlvbiBJTU8uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
