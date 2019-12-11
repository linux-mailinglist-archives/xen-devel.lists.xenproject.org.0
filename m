Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BEF11BDCA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 21:20:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if8PJ-0002EN-FC; Wed, 11 Dec 2019 20:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=48P7=2B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1if8PI-0002EI-Lu
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 20:16:24 +0000
X-Inumbo-ID: 19d8f65c-1c53-11ea-8c09-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19d8f65c-1c53-11ea-8c09-12813bfff9fa;
 Wed, 11 Dec 2019 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576095384;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=O8A3ivPWSIyo5t/mpB+zBfWMngvWPgQjhNJ04KsnqJA=;
 b=Hoo2emGo9KoIEu+ucu8Q10MNDh+fBzLAM1rC5tfQPcamTt1EcjQPvqVm
 YO3RfDToAY07GAu2Mc8tQGZH0TBTAUObjlGpZ/6JuVaVyxXZKcMIO0rdO
 FbqxF8gEf/0rMYEh5Ol7gXaCxDo/5aF1Z6ZUHRjUSBzkzc21HG+QspUL3 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hLNwByzx89hFaIQ+c7RgqiMsLedIFfwrkR7odlIxdlWDvmlTstQePjgKRfCVByXRoI6og5DfzW
 btvaxF3SyTef3oHv1QKSIEkrVuxYoeceVrFJ3MaapcmUJFlq65ZU88Cv8OgxfoA8zIbHRrdyIv
 fgJyRgz5Tx8bAkSPHH7lRLT+trAEwKrQb5q4jxlkJwSng2lUC0+CFa9FGoTvpBdvSSU5jlEDRl
 83xAGtpEjRdIGoOxCUR+lofOfCs0LRZ5/kCswkhayRY2w1WciVWT9KeJWG4mAPAei1ieggbMH6
 G38=
X-SBRS: 2.7
X-MesageID: 9680614
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,303,1571716800"; 
   d="scan'208";a="9680614"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
References: <20191209180638.47305-1-roger.pau@citrix.com>
 <db19e41f-9ecf-b999-23ce-075daf6dff22@citrix.com>
 <2214d2ca-271b-da04-14a1-7014c8faf6ed@suse.com>
 <25310dca-1f21-942d-1f88-0d712658de6f@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fec507d3-1acd-f27d-6329-b10f6e0c57c8@citrix.com>
Date: Wed, 11 Dec 2019 20:16:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <25310dca-1f21-942d-1f88-0d712658de6f@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86: store cr4 during suspend/resume
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTIvMjAxOSAxOTozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBBYnNvbHV0ZWx5IG5v
dGhpbmcgcmVtYWluaW5nIGluIHN1c3BlbmQuYyBzaG91bGQgYmUgc3BpbGxlZC7CoCBJdCBjYW4g
YWxsCj4gYmUgKHJlKWNhbHVjbGF0ZWQgZnJvbSB0aGUgc2FtZSBpbmZvcm1hdGlvbiBzb3VyY2Ug
YXMgdGhlIEFQIGJvb3QgcGF0aCwKPiBhbmQgdGhlIHJlc3VsdCB3aWxsIGJlIHN0cmljdGx5IHNt
YWxsZXIgaW4gUkFNLCBhbmQgbW9yZSByb2J1c3QuCgpBbmQgYXQgYSBjdXJzb3J5IGdsYW5jZSwg
dGhlIGxvZ2ljIGluIHN1c3BlbmQuYyBkb2Vzbid0IGNvcnJlY3RseSBoYW5kbGUKdGhlIGxlcj0x
IGNhc2UuwqAgVGhpcyBjYW4gdHJpdmlhbGx5IGJlIGZpeGVkIGJ5OgoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9hY3BpL3N1c3BlbmQuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3N1c3BlbmQuYwpp
bmRleCBjOWRlYTY3YmYzLi41MGRiYjE0NTI4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYWNw
aS9zdXNwZW5kLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvc3VzcGVuZC5jCkBAIC0xNSw4ICsx
NSw2IEBACsKgI2luY2x1ZGUgPGFzbS94c3RhdGUuaD4KwqAjaW5jbHVkZSA8eGVuL2h5cGVyY2Fs
bC5oPgrCoAotc3RhdGljIHVuc2lnbmVkIGxvbmcgc2F2ZWRfbHN0YXIsIHNhdmVkX2NzdGFyOwot
c3RhdGljIHVuc2lnbmVkIGxvbmcgc2F2ZWRfc3lzZW50ZXJfZXNwLCBzYXZlZF9zeXNlbnRlcl9l
aXA7CsKgc3RhdGljIHVuc2lnbmVkIGxvbmcgc2F2ZWRfZnNfYmFzZSwgc2F2ZWRfZ3NfYmFzZSwg
c2F2ZWRfa2VybmVsX2dzX2Jhc2U7CsKgc3RhdGljIHVpbnQ2NF90IHNhdmVkX3hjcjA7CsKgCkBA
IC0yNCwxNSArMjIsNiBAQCB2b2lkIHNhdmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUodm9pZCkKwqB7
CsKgwqDCoMKgIHNhdmVkX2ZzX2Jhc2UgPSByZGZzYmFzZSgpOwrCoMKgwqDCoCBzYXZlZF9nc19i
YXNlID0gcmRnc2Jhc2UoKTsKLcKgwqDCoCByZG1zcmwoTVNSX1NIQURPV19HU19CQVNFLCBzYXZl
ZF9rZXJuZWxfZ3NfYmFzZSk7Ci3CoMKgwqAgcmRtc3JsKE1TUl9DU1RBUiwgc2F2ZWRfY3N0YXIp
OwotwqDCoMKgIHJkbXNybChNU1JfTFNUQVIsIHNhdmVkX2xzdGFyKTsKLQotwqDCoMKgIGlmICgg
Y3B1X2hhc19zZXAgKQotwqDCoMKgIHsKLcKgwqDCoMKgwqDCoMKgIHJkbXNybChNU1JfSUEzMl9T
WVNFTlRFUl9FU1AsIHNhdmVkX3N5c2VudGVyX2VzcCk7Ci3CoMKgwqDCoMKgwqDCoCByZG1zcmwo
TVNSX0lBMzJfU1lTRU5URVJfRUlQLCBzYXZlZF9zeXNlbnRlcl9laXApOwotwqDCoMKgIH0KwqAK
wqDCoMKgwqAgaWYgKCBjcHVfaGFzX3hzYXZlICkKwqDCoMKgwqDCoMKgwqDCoCBzYXZlZF94Y3Iw
ID0gZ2V0X3hjcjAoKTsKQEAgLTQyLDI1ICszMSwxMiBAQCB2b2lkIHNhdmVfcmVzdF9wcm9jZXNz
b3Jfc3RhdGUodm9pZCkKwqB2b2lkIHJlc3RvcmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUodm9pZCkK
wqB7CsKgwqDCoMKgIGxvYWRfc3lzdGVtX3RhYmxlcygpOwotCi3CoMKgwqAgLyogUmVjb3ZlciBz
eXNjYWxsIE1TUnMgKi8KLcKgwqDCoCB3cm1zcmwoTVNSX0xTVEFSLCBzYXZlZF9sc3Rhcik7Ci3C
oMKgwqAgd3Jtc3JsKE1TUl9DU1RBUiwgc2F2ZWRfY3N0YXIpOwotwqDCoMKgIHdybXNybChNU1Jf
U1RBUiwgWEVOX01TUl9TVEFSKTsKLcKgwqDCoCB3cm1zcmwoTVNSX1NZU0NBTExfTUFTSywgWEVO
X1NZU0NBTExfTUFTSyk7CivCoMKgwqAgcGVyY3B1X3RyYXBzX2luaXQoKTsKwqAKwqDCoMKgwqAg
d3Jmc2Jhc2Uoc2F2ZWRfZnNfYmFzZSk7CsKgwqDCoMKgIHdyZ3NiYXNlKHNhdmVkX2dzX2Jhc2Up
OwrCoMKgwqDCoCB3cm1zcmwoTVNSX1NIQURPV19HU19CQVNFLCBzYXZlZF9rZXJuZWxfZ3NfYmFz
ZSk7CsKgCi3CoMKgwqAgaWYgKCBjcHVfaGFzX3NlcCApCi3CoMKgwqAgewotwqDCoMKgwqDCoMKg
wqAgLyogUmVjb3ZlciBzeXNlbnRlciBNU1JzICovCi3CoMKgwqDCoMKgwqDCoCB3cm1zcmwoTVNS
X0lBMzJfU1lTRU5URVJfRVNQLCBzYXZlZF9zeXNlbnRlcl9lc3ApOwotwqDCoMKgwqDCoMKgwqAg
d3Jtc3JsKE1TUl9JQTMyX1NZU0VOVEVSX0VJUCwgc2F2ZWRfc3lzZW50ZXJfZWlwKTsKLcKgwqDC
oMKgwqDCoMKgIHdybXNyKE1TUl9JQTMyX1NZU0VOVEVSX0NTLCBfX0hZUEVSVklTT1JfQ1MsIDAp
OwotwqDCoMKgIH0KLQrCoMKgwqDCoCBpZiAoIGNwdV9oYXNfeHNhdmUgJiYgIXNldF94Y3IwKHNh
dmVkX3hjcjApICkKwqDCoMKgwqDCoMKgwqDCoCBCVUcoKTsKwqAKCmZvciBzdGFydGVycy4KClRo
ZSBmcy9ncy9zaGFkb3cgdmFsdWVzIGFyZSBndWVzdC1vbmx5IHN0YXRlIHNvIGNhbiBqdXN0IGJl
IGRpc2NhcmRlZC4KCnhjcjAgaXNuJ3QgbmVlZGVkIGJ1dCB0aGlzIGNvZGUgaXMgbGF0ZW50bHko
c29vbi10by1iZT8pIGJ1Z2d5IGJ5IG5vdApoYW5kbGluZyBYU1MgYXQgdGhlIHNhbWUgdGltZS7C
oCBCb3RoIHNob3VsZCBmb2xsb3cgdGhlIEJTUCBsb2dpYyBmb3IKZXZhbHVhdGluZyB0aGUgc3lz
dGVtIGRlZmF1bHQuCgpUaGF0IGxldHMgdXMgZGVsZXRlIHNhdmVfcmVzdF9wcm9jZXNzb3Jfc3Rh
dGUoKSBlbnRpcmVseS4KCkluIHRoZSBhc3NlbWJseSBzaWRlIG9mIHRoaW5ncywgc3MgYW5kIGNy
MyBvYnZpb3VzbHkgZG9uJ3QgbmVlZCB0byBiZQpzcGlsbGVkLsKgIHNzIGlzIGFsd2F5cyAwLCBh
bmQgd2UncmUgYWxyZWFkeSBvbiB0aGUgY29ycmVjdCBwYWdldGFibGUuwqAKV2UncmUgYWxzbyBw
cm9iYWJseSBvbiB0aGUgY29ycmVjdCBjcjAuCgpUaGUgY2FsbGVyLWNsb2JiZXJlZCBHUFJzIGNh
biBqdXN0IGJlIGRpc2NhcmRlZCwgYW5kIHRoYXQgZ2V0cyBvdXIKc3Rhc2hlZCBzdGF0ZSBkb3du
IHRvIGFsbW9zdCBub3RoaW5nLgoKSSB0cnVzdCBJIGhhdmUgbWFkZSBteSBwb2ludCBibGluZGlu
Z2x5IG9idmlvdXMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
