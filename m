Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E00D13619A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 21:13:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipe8k-0005uu-Pz; Thu, 09 Jan 2020 20:10:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zaws=26=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipe8j-0005un-EF
 for xen-devel@lists.xen.org; Thu, 09 Jan 2020 20:10:45 +0000
X-Inumbo-ID: 1df3494c-331c-11ea-ba80-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1df3494c-331c-11ea-ba80-12813bfff9fa;
 Thu, 09 Jan 2020 20:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578600644;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sg5oi2CsRf7FJx8Y+a3ysA6ozFgHhaqxyeQh0MFtsKE=;
 b=Ndh+jlDrDjPXEOWSfqH5Yxr3psxalYEBJwutPZUrDyo7a8H1QgLijb6W
 3+tJ5Rr0CwReSjz8fGzMSkECNTQM11APjOa10gZWlGLukfLl627PbkjH+
 59bPA1tY9WfAWHieBOMGGfD0plMNzhuSLQYgGLzudcP6Pgr1MnbpLSi/g U=;
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
IronPort-SDR: Vnpt1KrT6XTul1xBs5ghmJ6Gph3IFX1qm4a1ysvuTkmQ2oKPGyOyd9Ar6afSA6rd1L63D5vLhr
 5LrRARPc+2NcBnH56VNEk3n5WbCSKPlyH2fyFGx9EcgRGDjiRJ9qx4jujhYrA8u+gaPi19xZZv
 6WK0TDfmM7gi7pjDJOGrH9U7ncyuiKxBePQTSUOEILlP4v1RWbDXFdKz4Hi/dGJQdhJJ1NLZ2Z
 a0RNRgx6cS26mBb612BsLhvXOMjplym1Lo+637NTqsk5JJI8b0++T6NlxX0McR4AF2p8ZDWftG
 cmA=
X-SBRS: 2.7
X-MesageID: 10694523
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,414,1571716800"; d="scan'208";a="10694523"
To: Richard Kojedzinszky <richard@kojedz.in>
References: <58431af1ddf1e33711c9850c715cd9cb@kojedz.in>
 <44c4fb96-6d5a-c10f-9659-06ed48617b91@citrix.com>
 <752a8e49b2d47526f5942d3427a4feb4@kojedz.in>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fb6f0116-cee6-d966-db99-b4af361eca9c@citrix.com>
Date: Thu, 9 Jan 2020 20:10:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <752a8e49b2d47526f5942d3427a4feb4@kojedz.in>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [BUG] xenstat_vcpu_ns returns invalid value
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDEvMjAyMCAyMDowOSwgUmljaGFyZCBLb2plZHppbnN6a3kgd3JvdGU6Cj4gMjAyMC0w
MS0wOSAyMDo1MCBpZMWRcG9udGJhbiBBbmRyZXcgQ29vcGVyIGV6dCDDrXJ0YToKPj4gT24gMDkv
MDEvMjAyMCAxOTo0MCwgUmljaGFyZCBLb2plZHppbnN6a3kgd3JvdGU6Cj4+PiBEZWFyIFhlbiBE
ZXZzLAo+Pj4KPj4+IGNvbW1pdCAyNTI5Yzg1MGVhNDhmMDM2NzI3Y2EyZjE0OGNhZWQ4OTM5MTMx
MWI4IGludHJvZHVjZXMgdGhlCj4+PiBYRU5fUlVOU1RBVEVfVVBEQVRFIG1hcmtlciBiaXQsIHdo
aWNoIGlzIG5vdCBoYW5kbGVkIGluCj4+PiB2Y3B1X3J1bnN0YXRlX2dldCgpIGluIHhlbi9jb21t
b24vc2NoZWR1bGUuYy4gUmVsZXZhbnQgY29kZToKPj4+Cj4+PiDCoMKgwqAgZGVsdGEgPSBOT1co
KSAtIHJ1bnN0YXRlLT5zdGF0ZV9lbnRyeV90aW1lOwo+Pj4gwqDCoMKgIGlmICggZGVsdGEgPiAw
ICkKPj4+IMKgwqDCoMKgwqDCoMKgIHJ1bnN0YXRlLT50aW1lW3J1bnN0YXRlLT5zdGF0ZV0gKz0g
ZGVsdGE7Cj4+Cj4+IFRoYXQgd2FzIGZvdW5kIGFuZCBmaXhlZCBhIHdoaWxlIGFnby7CoCBjL3Mg
ZjI4YzRjNGMxMCAic2NoZWQ6IGRvbid0IGxldAo+PiBYRU5fUlVOU1RBVEVfVVBEQVRFIGxlYWsg
aW50byB2Y3B1X3J1bnN0YXRlX2dldCgpIi4KPj4KPj4gTm8gY2hhbmdlcyBpbiB1c2Vyc3BhY2Ug
c2hvdWxkIGJlIG5lY2Vzc2FyeSwgYWx0aG91Z2ggeW91IG1pZ2h0IG5lZWQgdG8KPj4gcGVzdGVy
IHlvdXIgZGlzdHJvIGZvciBiYWNrcG9ydHMuCj4+Cj4+IH5BbmRyZXcKPgo+IEhpLAo+Cj4gVGhh
bmtzIGZvciB0aGUgcXVpY2sgcmVwbHksCj4KPiBUaGVuLCBhcyBpdCBpcyBqdXN0IGEgbGVhaywg
dW50aWwgYSBiYWNrcG9ydCBhcnJpdmVzIHRvIG15IGRpc3RybywgSQo+IGNhbiBtYXNrIG91dCB0
aGF0IGJpdCBmcm9tIHRoZSByZXN1bHRzIHdpdGggbm8gb3RoZXIgc2lkZS1lZmZlY3RzLCBhbQo+
IEkgcmlnaHQ/CgpZZXMgLSB0aGF0IHNob3VsZCBiZSBzYWZlLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
