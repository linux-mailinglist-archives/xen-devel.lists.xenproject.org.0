Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF3114EFA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 11:25:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idAkl-00040I-Uv; Fri, 06 Dec 2019 10:22:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fkk7=Z4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idAkj-00040B-TC
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 10:22:25 +0000
X-Inumbo-ID: 4b1050c0-1812-11ea-8250-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b1050c0-1812-11ea-8250-12813bfff9fa;
 Fri, 06 Dec 2019 10:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575627744;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=av2jZfAgKAsdbvnfgTvMX3pQX7eto8rugjJ1rVCPY/Q=;
 b=Ddb/FRsI1WjNDItQBnjCl/Lj1YgPqTEZAjK1fMGfe9ktFCWJVXVBz0nN
 Ob/8SaT3fz6IvAbdJaMgbKmZDtKMbX3excc8Gttzrg8w7BgB5fJIu5A1E
 iBuzAZwz+TB5c3CoWAbuxmLUiLU51A7qnp+v6WRtchz/0QC8HtoyT5nna I=;
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
IronPort-SDR: hLvRyFiTyySC9fyTDT7/aW7N5hJWOg6HZ5fMCs+1r3E95vs89x4aFImD9oaUaJWaPlyF7mUVFk
 DI5jyJftw4OY1j5I9A7Y0u6RZs9qq1d/4Jd3clYDlYKAVYHaUxlIQ7YvtXMZa+8f5oQgYNrHNY
 E2HtIWKJGiWSPs8T5FgHDUx04AhL3y9zmEF9qlJe7eaLrAltBHJ24k/K7Ex3Pt2snNFYie/cSY
 sAba8gSgmI5DWiMe0+Vz8SDn/4bTJYOoy53vfLuG0qWz8KjIc2t0BkwcH1y71b3K0XCAKCR5F7
 XyU=
X-SBRS: 2.7
X-MesageID: 9302486
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,284,1571716800"; 
   d="scan'208";a="9302486"
To: Jan Beulich <jbeulich@suse.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <36c45366-35e2-68a9-fbc7-01fd935bf720@suse.com>
 <62e68657-dd09-85ea-662b-0f54688ed93a@citrix.com>
 <d83a00c5-77ca-0c8e-71f7-5e67bd0aec24@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <532ecf3e-67cb-981f-b3de-b97adc82bb15@citrix.com>
Date: Fri, 6 Dec 2019 10:22:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d83a00c5-77ca-0c8e-71f7-5e67bd0aec24@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 0/6] xen: Support continuations from tasklets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMTIvMjAxOSAxMDoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMTIuMjAxOSAx
MToxNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDYvMTIvMjAxOSAwOTo1OCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNS4xMi4yMDE5IDIzOjMwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IEZyb20gdGVzdGluZyB0aGlzIHNlcmllcywgSSBoYXZlIHJlLWNvbmZpcm1lZCB0aGUg
cHJldmlvdXMgcmVwb3J0ZWQKPj4+PiBvYnNlcnZhdGlvbiB0aGF0Ogo+Pj4+Cj4+Pj4gICAjIHdo
aWxlIDo7IGRvIHhlbi1ocHRvb2wgc210LWVuYWJsZTsgeGVuLWhwdG9vbCBzbXQtZGlzYWJsZTsg
ZG9uZQo+Pj4+Cj4+Pj4gaW4gZG9tMCBldmVudHVhbGx5IGNhdXNlcyB0aGUgc2VyaWFsIGNvbnNv
bGUgdG8gY2Vhc2Ugd29ya2luZyAod2VkZ2UgbWlkd2F5Cj4+Pj4gdGhyb3VnaCBwcmludGluZyBh
IGxpbmUpLgo+Pj4+Cj4+Pj4gVGhlcmUgYXJlIHNwb3JhZGljICJCcm9rZSBhZmZpbml0eSBmb3Ig
SVJRMjYsIG5ldzogZmZmZiIgbWVzc2FnZXMsIGJ1dCB0aGUKPj4+PiBzZXJpYWwgYWx3YXlzIHNl
ZW1zIHRvIGJyZWFrIHNob3J0bHkgYWZ0ZXIgdGhlIGZpcnN0ICJCcm9rZSBhZmZpbml0eSBmb3IK
Pj4+PiBJUlEzMCwgbmV3OiBmZmZmIi4gIEJvdGggSVJRcyBhcmUgbm9uLWRlc2NyaXB0IFBDSS1N
U0kvLVggaW50ZXJydXB0cyBib3VuZCB0bwo+Pj4+IGRvbTAuCj4+PiBBbmQgbmVpdGhlciBJUlEz
MCBub3QgSVJRMjYgYXJlIHRoZSBzZXJpYWwgb25lcz8gQW5kIHNlcmlhbCBkb2VzCj4+PiB1c2Ug
YW4gSVJRIChpLmUuIGlzbid0IHJ1bm5pbmcgaW4gcG9sbGluZyBtb2RlKT8gSSdsbCBzZWUgaWYg
SQo+Pj4gY2FuIHJlcHJvIChhbmQgdGhlbiBtYXliZSBiZSBhYmxlIHRvIGRlYnVnKS4KPj4gU2Vy
aWFsIHVzZXMgSVJRMCBhbmQgbmV2ZXIgaGFzIGFmZmluaXR5IGNoYW5nZXMgYXMgaXQgaXMgYWx3
YXlzIGJvdW5kIHRvCj4+IENQVTAuCj4gSVJRMD8gRFlNIElSUTMgb3IgSVJRND8gKEluIGFueSBl
dmVudCB0aGUgaW1wb3J0YW50IHBhcnQgaXMgZm9yIGl0Cj4gdG8gYmUgaW4gdGhlIElTQSByYW5n
ZSwgcmF0aGVyIHRoYW4gdGhlIFBDSSBvbmUuKQoKSSBkbyBtZWFuIElSUTQsIHNvcnJ5LsKgIE1p
eGVkIGl0IHVwIHdpdGggdGhlIHRpbWVyIElSUS4KCk9uIFNNVCBkaXNhYmxlLCBpdCBkb2VzIGxv
c2UgaGFsZiBvZiBpdHMgYWZmaW5pdHkuCgooWEVOKcKgwqDCoCBJUlE6wqDCoCA0IHZlYzpmMSBJ
Ty1BUElDLWVkZ2XCoMKgwqAgc3RhdHVzPTAwMCBhZmY6ezAtN30vezAsMiw0LDZ9CmRyaXZlcnMv
Y2hhci9uczE2NTUwLmMjbnMxNjU1MF9pbnRlcnJ1cHQoKQoKU28gdGhpcyBpcyBtb3JlIGxpa2Vs
eSB0byBiZSByZWxhdGVkIHRvIGEgaXJxLW1pZ3JhdGlvbiB0aGFuIExBUElDIGFja3MuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
