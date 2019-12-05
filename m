Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB711439C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:33:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ict5w-0007Qn-2L; Thu, 05 Dec 2019 15:31:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G9sg=Z3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ict5u-0007Qi-NS
 for xen-devel@lists.xen.org; Thu, 05 Dec 2019 15:31:06 +0000
X-Inumbo-ID: 3fd44ab6-1774-11ea-822b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fd44ab6-1774-11ea-822b-12813bfff9fa;
 Thu, 05 Dec 2019 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575559865;
 h=subject:from:to:references:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=Qs+R76s/xynkez2Vxdz4b80fucb9NMcbUol4CYpJ9Tc=;
 b=b0T5DJk4g/9H1d7/UNLoe5md/xMlqx9cQYdiXV7lj0X7aWDY7qOjSx+/
 VcDwLYxcNbK/raPNHCnkxIkUMfC6XO9iCn/qBFI4H5I0pxLoIV/wMtVCV
 siig7qrXx0Fht48MxaXivuaoP4JZCMTjUCtiq9AuxWbEG2z4y2I7bKF2G 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KqRCVw0jvwgnCRwh9DX6wLiMEWh1/VUqznJSoeRzqjcnf6LDsx3kWo7xrlUVrlUVSDZnRT8mK0
 1ywsyseKoYqLlxOekDtRlc8w8ysN+701Nm9C0xHHZ8BQ+ISZT3Vf2Kp5XngYkBlYI0oTeN22Yg
 P9ps+CJTfq5aqpCN5WKanxbFqWWpMT2+aFQNb9k41HVyFy+DcP1q7+yFVJ3qv1Xu6X0gdNFLiw
 su2AeTf9SF16wN60jBmBVr2QHAkJLoDOHXffOmg2DKKFsloaUm8a1RCvFwHBmOTmDBdv/2CIZh
 SGs=
X-SBRS: 2.7
X-MesageID: 9258621
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,281,1571716800"; 
   d="scan'208";a="9258621"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel List <xen-devel@lists.xen.org>
References: <941cf23c-13ed-14a1-fd25-45b001d9564a@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <de0fca0f-06f7-dcdf-0a55-4fda6bc0d1fa@citrix.com>
Date: Thu, 5 Dec 2019 15:30:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <941cf23c-13ed-14a1-fd25-45b001d9564a@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Xen 4.14 and future work
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

T24gMDIvMTIvMjAxOSAxOTo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBIZWxsbywKPgo+IE5v
dyB0aGF0IDQuMTMgaXMgb24gaXRzIHdheSBvdXQgb2YgdGhlIGRvb3IsIGl0IGlzIHRpbWUgdG8g
bG9vayB0bwo+IG9uZ29pbmcgd29yay4KCihhbmQgc29tZSBtb3JlLi4uKQoKKiBTaGltOiBSZW1v
dmFsIG9mIGFuIE0yUC4KCldpdGhpbiB0aGUgc2hpbSwgdHdvIE0yUCdzIGFyZSBjb25zdHJ1Y3Rl
ZCwgYW5kIG9uZSBvZiB0aGVtIGlzIGVudGlyZWx5CnVudXNlZC7CoCBCb3RoIHRha2UgdXAgYSBk
ZWNlbnQgY2h1bmsgb2YgbWVtb3J5LCBhbiBjb250cmlidXRlIHRvIHJlZHVjZWQKcGFja2luZyBk
ZW5zaXR5CgpCeSBpbnNwZWN0aW5nIHRoZSBrZXJuZWwgd2lkdGggZWFybGllciBkdXJpbmcgYm9v
dCwgd2UgY2FuIGF2b2lkCmNyZWF0aW5nIHRoZSB1bm5lZWRlZCBNMlAuwqAgVGhpcyB3b3VsZCBy
ZXF1aXJlIHRlYWNoaW5nIFhlbiB0byBvcGVyYXRlCndpdGggb25seSBhIGNvbXBhdCBwMm0gd2hl
biBydW5uaW5nIGEgMzJiaXQgZ3Vlc3QsIGJ1dCB0aGlzIHdpbGwgYmUgZmluZQp0byBydW4gd2l0
aC4KCiogQ09ORklHX1BWMzIKCkRlc3BpdGUgYmVpbmcgZGVwcmVjYXRlZCBpbiA2NGJpdCBwcm9j
ZXNzb3JzLCB3ZSBzdGlsbCB1c2UgcmluZyAxIGZvcgozMmJpdCBQViBrZXJuZWxzLsKgIEEgcmVs
aWMgb2YgYSBieWdvbmUgZXJhLCB0aGlzIGNhdXNlcyBwcm9ibGVtcyB3aXRoCm5ld2VyIHBhZ2V0
YWJsZSBiYXNlZCBmZWF0dXJlcyAoU01FUCBhbmQgU01BUCBpbiBwYXJ0aWN1bGFyKSwgcmVzdWx0
aW5nCmluIGNvbXBsZXhpdHkgaW4gdGhlIGVudHJ5IHBhdGhzIGFuZCBhIHN1YnN0YW50aWFsIHBl
cmZvcm1hbmNlIHBlbmFsdHkKKGEgQ1I0IHdyaXRlIG9uIHRoZSB3YXkgaW4gYW5kIG91dCBvZiAz
MmJpdCBndWVzdHMpLsKgIFRoZXJlIGFyZSBhbHNvCnNvbWUgc3BlY3VsYXRpdmUgbWl0aWdhdGlv
biBhY3Rpb25zIHdlIHRha2UgdW5pbGF0ZXJhbGx5LCBqdXN0IGJlY2F1c2UKMzJiaXQgUFYgZ3Vl
c3Qga2VybmVscyBydW4gb24gc3VwZXJ2aXNvciBtYXBwaW5ncyByYXRoZXIgdGhhbiB1c2VyCm1h
cHBpbmdzIChSU0Itc3R1ZmZpbmcgYmVpbmcgdGhlIG1vc3Qgb2J2aW91cyBvbmUpLgoKRnJvbSBh
biBhdHRhY2sgc3VyZmFjZSBwb2ludCBvZiB2aWV3LCBiZWluZyBhYmxlIHRvIHJlbW92ZSBhbGwg
cmluZyAxCmZhY2lsaXRpZXMgd291bGQgYmUgZ3JlYXQgZm9yIGRlcGxveW1lbnRzIG5vdCBpbnRl
bmRpbmcgdG8gcnVuIDMyYml0IFBWCmd1ZXN0cyAoYW5kL29yIHJlbGVnYXRlIHRoZW0gdG8gUFYt
c2hpbSksIGFuZCB0aGVyZSB3aWxsIGJlIHNvbWUKKHByb2JhYmx5IG1pbm9yKSBwZXJmb3JtYW5j
ZSBnYWlucyBmb3IgNjRiaXQgUFYgZ3Vlc3RzIGFzIGEgY29uc2VxdWVuY2UKb2YgdGhlIHNpbXBs
aWZpZWQgZW50cnkgcGF0aHMuCgooQW5kIHdobyBrbm93cy4uLsKgIEEgY29tYmluYXRpb24gb2Yg
dGhpcyBhbmQgUGF1bCdzIGlkZWEgZm9yIGVtdWxhdGlvbgp0aHVuay1pbmcgaW4gYSBwc2V1ZG8g
U01NLWxpa2UgbW9kZSBpbnNpZGUgSFZNIGd1ZXN0cyBjb3VsZCByZW1vdmUgdGhlCm5lZWQgZm9y
IENPTkZJR19DT01QQVQgZW50aXJlbHkgYXQgTDAuKQoKKiBDT05GSUdfUERYCgpIZXJlIGlzIG9u
ZSBJIHByZXBhcmVkIGVhcmxpZXIuwqAKaHR0cHM6Ly9hbmRyZXdjb29wLXhlbi5yZWFkdGhlZG9j
cy5pby9lbi9kb2NzLWRldmVsL21pc2MvdGVjaC1kZWJ0Lmh0bWwjY29uZmlnLXBkeAoKKiBDT05G
SUdfJFZFTkRPUgoKRm9yIHJlc3RyaWN0ZWQgdXNlY2FzZXMsIGRyb3BwaW5nIG9uZSBvZiBBTUQg
b3IgSU5URUwgd291bGQgZHJvcCBhCnN1YnN0YW50aWFsIGNodW5rIG9mIGNvZGUsIGFuZCBhIHN1
ZmZpY2llbnRseSBjYXBhYmxlIExUTyBjb21waWxlciB3aXRoCmRldmlydHVhbGlzYXRpb24gc3Vw
cG9ydCBjb3VsZCBldmVuIHJlbW92ZSB0aGUgZnVuY3Rpb24gcG9pbnRlcnMgdGhlbXNlbHZlcy4K
Ck1vcmUgdXNlZnVsbHkgdG8gdGhlIGdlbmVyYWwgcHJvamVjdCBob3dldmVyLCB3b3VsZCBiZSBS
QU5EQ09ORklHJ3MKYWJpbGl0eSB0byBjaGVjayBhbmQga2VlcCBvdXIgdmVuZG9yLXNwZWNpZmlj
IGludGVyZmFjZXMgY2xlYW4uwqAgVGhleQptb3N0IGRlZmluaXRlbHkgYXJlIG5vdCByaWdodCBu
b3cuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
