Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1510F12A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 20:55:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibrjh-00029d-ON; Mon, 02 Dec 2019 19:51:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PMC0=ZY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ibrjf-00029Y-OB
 for xen-devel@lists.xen.org; Mon, 02 Dec 2019 19:51:55 +0000
X-Inumbo-ID: 3081678a-153d-11ea-81c3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3081678a-153d-11ea-81c3-12813bfff9fa;
 Mon, 02 Dec 2019 19:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575316315;
 h=to:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=UqpZ1f8WscaqbpqkbzLbj3mSPwfxUAAkIqSmVSr5nMY=;
 b=XiFaCgkvCwqIWLpQvseuNU/J0Y47Vx/VHMAPgedHswXWmCxeHpZQKogz
 pJ/qL9BEIvKG08A7PATOfadVJq5eB6QhdlL96+GgRmhu66CrM6omBKaMm
 tGBI62sEKPOnUNkyAk/HnORYtdL50Ero4FjlTO3cTXasYbHRrJVIp5zfv A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: r/gTEalOHtC6lxYyV4xY04aaEUjv87UVdPc2+ziHm2A6mzQ8fJMw33cW5XyppLiTw1v/VOvOTf
 Dh+00nYstzcQR7vl8FDZ5B7dHqWA5p05cCreuBu9vqSvffiVrUeZ0+4YwRSFsFtXxIlM/gr3ZR
 HuD3NZd91fApvOeLstCDh3CWTPfoIAVfBJnWshXB8rDhm2LGdpegrc9Nj97KkGmQrhkem8XFom
 yqUwLXXFRWHotPktzM8jDH3Ky9TzSxojjxeXj4pVTbm/HLA9I+r7ni2E+A+aDx+TMGuICmoHYa
 nDQ=
X-SBRS: 2.7
X-MesageID: 9070125
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,270,1571716800"; 
   d="scan'208";a="9070125"
To: Xen-devel List <xen-devel@lists.xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <941cf23c-13ed-14a1-fd25-45b001d9564a@citrix.com>
Date: Mon, 2 Dec 2019 19:51:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: [Xen-devel] Xen 4.14 and future work
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpOb3cgdGhhdCA0LjEzIGlzIG9uIGl0cyB3YXkgb3V0IG9mIHRoZSBkb29yLCBpdCBp
cyB0aW1lIHRvIGxvb2sgdG8Kb25nb2luZyB3b3JrLgoKV2UgaGF2ZSBhIGxhcmdlIGJhY2tsb2cg
b2Ygc3BlY3VsYXRpb24tcmVsYXRlZCB3b3JrLsKgIEZvciBvbmUsIHdlIHN0aWxsCmRvbid0IHZp
cnR1YWxpc2UgTVNSX0FSQ0hfQ0FQUyBmb3IgZ3Vlc3RzLCBvciB1c2UgZUlCUlMgb3Vyc2VsdmVz
IGluClhlbi7CoCBUaGVyZWZvcmUsIHdoaWxlIFhlbiBkb2VzIGZ1bmN0aW9uIG9uIENhc2NhZGUg
TGFrZSwgc3VwcG9ydCBpcwpkaXN0aW5jdGx5IHN1Ym9wdGltYWwuCgpTaW1pbGFybHksIEFNRCBz
eXN0ZW1zIGZyZXF1ZW50bHkgZmlsbCAvdmFyL2xvZyB3aXRoOgoKKFhFTikgZW11bC1wcml2LW9w
LmM6MTExMzpkMHYxMyBEb21haW4gYXR0ZW1wdGVkIFdSTVNSIGMwMDExMDIwIGZyb20KMHgwMDA2
NDA0MDAwMDAwMDAwIHRvIDB4MDAwNjQwNDAwMDAwMDQwMAoKd2hpY2ggaXMgYW4gaW50ZXJhY3Rp
b24gTGludXgncyBwcmN0bCgpIHRvIGRpc2FibGUgbWVtb3J5IGRpc2FtYmlndWF0aW9uCm9uIGEg
cGVyLXByb2Nlc3MgYmFzaXMsIFhlbidzIHdyaXRlL2Rpc2NhcmQgYmVoYXZpb3VyIGZvciBNU1Jz
LCBhbmQgdGhlCmxvbmctb3ZlcmR1ZSBzZXJpZXMgdG8gcHJvcGVybHkgdmlydHVhbGlzZSBTU0JE
IHN1cHBvcnQgb24gQU1ECmhhcmR3YXJlLsKgIEFNRCBSb21lIGhhcmR3YXJlLCBsaWtlIENhc2Nh
ZGUgTGFrZSwgaGFzIGNlcnRhaW4gaGFyZHdhcmUKc3BlY3VsYXRpdmUgbWl0aWdhdGlvbiBmZWF0
dXJlcyB3aGljaCBuZWVkIHZpcnR1YWxpc2luZyBmb3IgZ3Vlc3RzIHRvCm1ha2UgdXNlIG9mLgoK
ClNpbWlsYXJseSwgdGhlcmUgaXMgcGxlbnR5IG1vcmUgd29yayB0byBkbyB3aXRoIGNvcmUtYXdh
cmUgc2NoZWR1bGluZywKYW5kIGZyb20gbXkgc2lkZSBvZiB0aGluZ3MsIHNhbmUgZ3Vlc3QgdG9w
b2xvZ3kuwqAgVGhpcyB3aWxsIGV2ZW50dWFsbHkKdW5ibG9jayBvbmUgb2YgdGhlIGZhY3RvcnMg
b24gdGhlIGhhcmQgMTI4IHZjcHUgbGltaXQgZm9yIEhWTSBndWVzdHMuCgoKQW5vdGhlciBiaWcg
YXJlYSBpcyB0aGUgc3RhYmlsaXR5IG9mIHRvb2xzdGFjayBoeXBlcmNhbGxzLsKgIFRoaXMgaXMg
YQpjcmlwcGxpbmcgcGFpbiBwb2ludCBmb3IgZGlzdHJvcyBhbmQgdXBncmFkZWFiaWxpdHkgb2Yg
c3lzdGVtcywgYW5kCnRoZXJlIGlzIGZyYW5rbHkgbm8ganVzdGlmaWFibGUgcmVhc29uIGZvciB0
aGUgd2F5IHdlIGN1cnJlbnRseSBkbwp0aGluZ3PCoCBUaGUgcmVhbCByZWFzb24gaXMgaW5lcnRp
YSBmcm9tIGJhY2sgaW4gdGhlIGRheXMgd2hlbiBYZW4uZ2l0CihiaXRrZWVwZXIgYXMgaXQgd2Fz
IGJhY2sgdGhlbikgY29udGFpbmVkIGEgZm9yayBvZiBldmVyeSByZWxldmFudApwaWVjZXMgb2Yg
c29mdHdhcmUsIGJ1dCB0aGlzIGEgbG9uZy1zaW5jZSBvYnNvbGV0ZSBtb2RlbCwgYnV0IHN0aWxs
CmNhdXNpbmcgdXMgcGFpbi7CoCBJIHdpbGwgZm9sbG93IHVwIHdpdGggYSBwcm9wb3NhbCBpbiBk
dWUgY291cnNlLCBidXQgYXMKYSBvbmVsaW5lciwgaXQgd2lsbCBidWlsZCBvbiB0aGUgZG1fb3Ao
KSBBUEkgbW9kZWwuCgpMaWtlbHkgaW5jbHVkZWQgd2l0aGluIHRoaXMgaXMgbWFraW5nIHRoZSBk
b21haW4vdmNwdSBkZXN0cm95IHBhdGhzCmlkZW1wb3RlbnQgc28gd2UgY2FuIGZpeCBhIGxvYWQg
b2YgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlcyBpbiBYZW4KY2F1c2VkIGJ5IFhFTl9ET01DVExf
bWF4X3ZjcHVzIG5vdCBiZWluZyBwYXJ0IG9mIFhFTl9ET01DVExfY3JlYXRlZG9tYWluLgoKT3Ro
ZXIgd29yayBpbiB0aGlzIGFyZWEgaW52b2x2ZXMgYWRkaW5nIFg4Nl9FTVVMX3tWSVJJRElBTixO
RVNURURfVklSVH0KdG8gcmVwbGFjZSB0aGVpciBleGlzdGluZyBwcm9ibGVtYXRpYyBlbmFibGVt
ZW50IGludGVyZmFjZXMuCgoKQSBzdGFydCBuZWVkcyB0byBiZSBtYWRlIG9uIGEgdG90YWwgcmV0
aGluayBvZiB0aGUgSFZNIEFCSS7CoCBUaGlzIGhhcwpjb21lIHVwIHJlcGVhdGVkbHkgYXQgcHJl
dmlvdXMgZGV2IHN1bW1pdHMsIGFuZCBpcyBpbiBkZXNwZXJhdGUgbmVlZCBvZgpoYXZpbmcgc29t
ZSB3b3JrIHN0YXJ0ZWQgb24gaXQuCgoKT3RoZXIgYXJlYXMgaW4gbmVlZCBvZiB3b3JrIGlzIHRo
ZSBib290IHRpbWUgZGlyZWN0bWFwIGF0IDAgKHdoaWNoIGhpZGVzCk5VTEwgcG9pbnRlciBkZWZl
cmVuY2VzIGR1cmluZyBib290KSwgYW5kIHRoZSBjb3JyZWN0IGhhbmRsaW5nIG9mICVkcjYKZm9y
IGFsbCBraW5kcyBvZiBndWVzdHMuCgoKQW55d2F5LCB0aGF0J3MgcHJvYmFibHkgYSBnb29kIGVu
b3VnaCBzdW1tYXJ5IGZvciBub3cuwqAKVGhvdWdodHMvY29tbWVudHMgd2VsY29tZSwgZXNwZWNp
YWxseSBpZiBzb21ldGhpbmcgb24gdGhpcyBsaXN0IGhhcHBlbnMKdG8gYmUgYSBwcmlvcml0eSBl
bHNld2hlcmUgYW5kIGVuZ2luZWVyaW5nIGVmZm9ydCBjYW4gYmUgcHV0IHRvd2FyZHMgaXQuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
