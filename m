Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB23E13418A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:23:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAK0-0001tD-Dg; Wed, 08 Jan 2020 12:20:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/AM3=25=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipAJy-0001t8-Su
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:20:22 +0000
X-Inumbo-ID: 3d8db0b4-3211-11ea-b7d4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d8db0b4-3211-11ea-b7d4-12813bfff9fa;
 Wed, 08 Jan 2020 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578486021;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+DRwsiPJXO3yctwqULEuJgHmWLuMH9MG/NTAqBUYTtw=;
 b=HTFcz7XMl+N93ho6R9nCoaDfA6cdexq0tf3Wpx5uKMOX8ZFxaiheXL5e
 KXxhhnp92IC72af1jYjWbl1aSB0oAbrckvAN0b6eGecbU3c3JXtvZCjLL
 pIlxZXlz0S4Vfte4cOLz0dLYvaRQ5IJq5S2PjGSvzl6JGQtyl12Rk3x3e c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ex51nlvpZb4oKU9vWf8HdpXV+nzr14ws6Y/luWR6qdNrR9w6UEX1VhxVTBsCwr8IuB1Cj+Tucv
 JiaGF8FpyJBTzDkH3f5/tULzP9YUTIkMkxuqTqcxw1cOF7axMQTJ5/ZRAlg5mqkC2d7nCbiqAl
 xmxWiiD97cExAA7Zl84jpVHe5MycjDH2ds5xsI9G47XfYRpOsWGlSN0y38TOSIZtS3fNO3N1MV
 QPafxNTT+lblvivwRufoChVTLt+xx09XxnJCJZH0nSW+64EjVoOU+eYi5NpfgRZCD+Ms18jdQl
 +Dk=
X-SBRS: 2.7
X-MesageID: 11206051
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,409,1571716800"; d="scan'208";a="11206051"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>
References: <20200108110148.18988-1-jgross@suse.com>
 <20200108121606.yr25b27mrnawu6um@debian>
 <61ec5633-05b7-fab3-ceac-e6c7649893e3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <30678579-b51e-cedc-88cf-bd5e540144bb@citrix.com>
Date: Wed, 8 Jan 2020 12:20:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <61ec5633-05b7-fab3-ceac-e6c7649893e3@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDEvMjAyMCAxMjoxOCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwOC4wMS4yMCAx
MzoxNiwgV2VpIExpdSB3cm90ZToKPj4gT24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMTI6MDE6NDhQ
TSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IGNwdV9zbXBib290X2ZyZWUoKSByZW1v
dmVzIHRoZSBzdHVicyBmb3IgdGhlIGNwdSBnb2luZyBvZmZsaW5lLCBidXQgaXQKPj4+IGlzbid0
IGNsZWFyaW5nIHRoZSByZWxhdGVkIHBlcmNwdSB2YXJpYWJsZXMuIFRoaXMgd2lsbCByZXN1bHQg
aW4KPj4+IGNyYXNoZXMgd2hlbiBhIHN0dWIgcGFnZSBpcyByZWxlYXNlZCBkdWUgdG8gYWxsIHJl
bGF0ZWQgY3B1cyBnb25lCj4+PiBvZmZsaW5lIGFuZCBvbmUgb2YgdGhvc2UgY3B1cyBnb2luZyBv
bmxpbmUgbGF0ZXIuCj4+Pgo+Pj4gRml4IHRoYXQgYnkgY2xlYXJpbmcgc3R1YnMuYWRkciBhbmQg
c3R1YnMubWZuIGluIG9yZGVyIHRvIGFsbG9jYXRlIGEKPj4+IG5ldyBzdHViIHBhZ2Ugd2hlbiBu
ZWVkZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgo+Pj4gLS0tCj4+PiDCoCB4ZW4vYXJjaC94ODYvc21wYm9vdC5jIHwgMiArKwo+Pj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+Pj4gaW5kZXggN2Uy
OTcwNDA4MC4uNDZjMDcyOTIxNCAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290
LmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPj4+IEBAIC05NDUsNiArOTQ1LDgg
QEAgc3RhdGljIHZvaWQgY3B1X3NtcGJvb3RfZnJlZSh1bnNpZ25lZCBpbnQgY3B1LAo+Pj4gYm9v
bCByZW1vdmUpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKHBlcl9jcHUoc3R1YnMuYWRkciwgY3B1KSB8Cj4+PiB+UEFHRV9N
QVNLKSArIDEpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggaSA9PSBTVFVCU19QRVJfUEFH
RSApCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmVlX2RvbWhlYXBfcGFnZShtZm5f
dG9fcGFnZShtZm4pKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBwZXJfY3B1KHN0dWJzLmFkZHIsIGNw
dSkgPSAwOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHBlcl9jcHUoc3R1YnMubWZuLCBjcHUpID0gMDsK
Pj4KPj4gU2hvdWxkbid0IHRoZSBtZm4gYmUgc2V0IHRvIElOVkFMSURfTUZOIGluc3RlYWQ/Cj4K
PiBUaGlzIHdvdWxkIHJlcXVpcmUgbW9kaWZ5aW5nIGFsbG9jX3N0dWJfcGFnZSgpOgo+Cj4gwqDC
oMKgIGlmICggKm1mbiApCj4gwqDCoMKgwqDCoMKgwqAgcGcgPSBtZm5fdG9fcGFnZShfbWZuKCpt
Zm4pKTsKPiDCoMKgwqAgZWxzZQoKQ29ycmVjdC7CoCBwZXItY3B1IGRhdGEgaXMgaW5pdGlhbGlz
ZWQgdG8gMCwgbm90IHRvIGEgY3VzdG9tIGRlZmF1bHQsIHNvCnVzaW5nIElOVkFMSURfTUZOIGlz
IG1vcmUgY29tcGxpY2F0ZWQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
