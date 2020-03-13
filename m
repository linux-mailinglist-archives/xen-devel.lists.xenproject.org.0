Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE9184A6F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 16:18:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCm1e-0004Sm-Dz; Fri, 13 Mar 2020 15:15:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDBU=46=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCm1c-0004Sh-Sh
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 15:15:00 +0000
X-Inumbo-ID: 6727bd71-653d-11ea-b325-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6727bd71-653d-11ea-b325-12813bfff9fa;
 Fri, 13 Mar 2020 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584112499;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xeyCETlS5fqnhbzWlIshGNxaGKmc5t1zfbqqiG1dENw=;
 b=PtgaOFVpyqacmA+5zlxsTuLpyTC4Ly8wTn8Kn2bjuaM8Frdacbn+eQUH
 Oc3zvjlb/d5a1HIL467R0HUX4MtBl627UV6SXksggdyEblSCtCwRMsSB/
 pNUvwJmLFtkZlov3PLG3IaW0+L520zH5TGnZm9ssRqmmpX0DjYvGzUKwr 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EMBe5loO56xFFU3k8luViwL0KJ8fs3t/wlw4vF+9uBE/3LqaRQm15HVk2Gvno/qkUXSTiu/WBR
 dcuh6CCp3VBizD8UrfFusCbHKTma1rFvh74ULtWGs01BDbnUalRxWTR1j1qoHYX0FwgtTIKGqo
 UJJasABszI7IveiEg04iT3NZpNL9UabVyS2O2pNHMFUg++Z4At3P5CESeXXouXg8dlLt+LJSk7
 iiNNBa2XdeQBUldg8CZzH0deoOxcFI2lkwCGsq/zCdXwA9Pxazc8RQw+obGL7dHd4jQEmg3MQS
 KQQ=
X-SBRS: 2.7
X-MesageID: 14338340
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,549,1574139600"; d="scan'208";a="14338340"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <9460a5f8-5b6e-bba9-79fc-dae54cc6b348@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7b6e7266-7550-17c5-2edb-825e0fbf5b80@citrix.com>
Date: Fri, 13 Mar 2020 15:14:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9460a5f8-5b6e-bba9-79fc-dae54cc6b348@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/4] x86/time: reduce rounding errors in
 calculations
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDMvMjAyMCAwOToyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gUGxhaW4gKHVuc2lnbmVk
KSBpbnRlZ2VyIGRpdmlzaW9uIHNpbXBseSB0cnVuY2F0ZXMgdGhlIHJlc3VsdHMuIFRoZQo+IG92
ZXJhbGwgZXJyb3JzIGFyZSBzbWFsbGVyIHRob3VnaCBpZiB3ZSB1c2UgcHJvcGVyIHJvdW5kaW5n
LiAoRXh0ZW5kCj4gdGhpcyB0byB0aGUgcHVyZWx5IGNvc21ldGljIGFzcGVjdCBvZiB0aW1lLmMn
cyBmcmVxX3N0cmluZygpLCB3aGljaAo+IGJlZm9yZSB0aGlzIGNoYW5nZSBJJ3ZlIGZyZXF1ZW50
bHkgb2JzZXJ2ZWQgdG8gcmVwb3J0IGUuZy4gTk4uOTk5TUh6Cj4gSFBFVCBjbG9jayBzcGVlZHMu
KQo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0t
LQo+IFdlIGNvdWxkIHN3aXRjaCBhdCBsZWFzdCB0aGUgZmlyc3QgZGl2L3JlbSBwYWlyIGluIGNh
bGlicmF0ZV9BUElDX2Nsb2NrKCkKPiB0byB1c2UgZG9fZGl2KCksIGJ1dCB0aGlzIHdvdWxkIGlt
cGx5IHN3aXRjaGluZyBidXNfZnJlcSAoYW5kIHRoZW4gYWxzbwo+IHJlc3VsdCkgdG8gdW5zaWdu
ZWQgaW50IChhcyB0aGUgZGl2aXNvciBoYXMgdG8gYmUgMzItYml0KS4gV2hpbGUgSSB0aGluawo+
IHRoZXJlJ3MgcHJldHR5IGxpdHRsZSByaXNrIGZvciBidXMgZnJlcXVlbmNpZXMgdG8gZ28gYmV5
b25kIDRHSHogaW4gdGhlCj4gbmV4dCBzbyBtYW55IHllYXJzLCBJIHN0aWxsIHdhc24ndCBjZXJ0
YWluIGVub3VnaCB0aGlzIHdvdWxkIGJlIGEgd2VsY29tZQo+IGNoYW5nZS4KCkhvbmVzdGx5LCBk
b19kaXYoKSBpcyB2ZXJ5IGVhc3kgdG8gZ2V0IHdyb25nIChhbmQgaW4gc2VjdXJpdHkgcmVsZXZh
bnQKd2F5cyBpbiBMaW51eCkuwqAgSSdkIGFkdm9jYXRlIGZvciBwaGFzaW5nIGl0cyB1c2Ugb3V0
LCBpcnJlc3BlY3RpdmUgb2YKdGhpcyBmcmVxdWVuY3kgY29uY2Vybi4KCkFzIGZvciA0R0h6LCBJ
IHRoaW5rIGl0cyB1bmxpa2VseSwgYnV0IGJldHRlciB0byBiZSBzYWZlIGluIHRoZSBjb2RlLgoK
Pgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hcGljLmMKPiArKysgYi94ZW4vYXJjaC94ODYvYXBpYy5j
Cj4gQEAgLTEyNjEsNyArMTI2MSw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGNhbGlicmF0ZV9BUElD
X2Nsb2NrKHYKPiAgICAgIC8qIHNldCB1cCBtdWx0aXBsaWVycyBmb3IgYWNjdXJhdGUgdGltZXIg
Y29kZSAqLwo+ICAgICAgYnVzX2ZyZXEgICA9IHJlc3VsdCpIWjsKPiAgICAgIGJ1c19jeWNsZSAg
PSAodTMyKSAoMTAwMDAwMDAwMDAwMExML2J1c19mcmVxKTsgLyogaW4gcGljbyBzZWNvbmRzICov
Cj4gKyAgICBidXNfY3ljbGUgKz0gKDEwMDAwMDAwMDAwMDBVTCAlIGJ1c19mcmVxKSAqIDIgPiBi
dXNfZnJlcTsKClRoZXNlIHR3byBkaWZmZXIgaW4gc2lnbmVkbmVzcyBvZiB0aGUgbnVtZXJhdG9y
LsKgIEdDQyBzZWVtcyB0byBjb3BlIHdpdGgKY29tYmluaW5nIHRoZSB0d28gaW50byBhIHNpbmds
ZSBkaXYgaW5zdHJ1Y3Rpb24sIGJ1dCBJIHRoaW5rIHdlIHNob3VsZApiZSBjb25zaXN0ZW50IHdp
dGggdGhlIGNvbnN0YW50IG5ldmVydGhlbGVzcy4KCk90aGVyd2lzZSwgQWNrZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
