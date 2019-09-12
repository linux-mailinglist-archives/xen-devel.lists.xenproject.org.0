Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D2B0A7F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:39:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Kav-0002cp-OE; Thu, 12 Sep 2019 08:36:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UPIc=XH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8Kau-0002ck-Fu
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:36:48 +0000
X-Inumbo-ID: 75200198-d538-11e9-a337-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75200198-d538-11e9-a337-bc764e2007e4;
 Thu, 12 Sep 2019 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568277407;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wOAuti8jhOBqD6nNo2mseTehBe3P6EVRlCVXXDVW55c=;
 b=cbw4GPuX7tcfzZ+8Mvif1BQfXEWlW8FdbXybP2PihP/8sLnoKJKMUbuk
 GkP47VOq/hD5ViGgB/YXr2baHX/F04pLFHdIT2W+EcMPlML1DrhW64xMI
 J6JNIy5cwWgxVw/DV8/YvupFmYAnDx7SsjQ05E1Ahw/X+xiUYOWd84Vms w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BWs8+zqYfaUKqoAEEZiy+UD93EYVFvykBlY/k6gkPw4SHrJ6blSsdlMUDY+QWDsNwwmUzJljQN
 5+yloXp16ABXt8ezhmw01wee7TRL6I5G25jsPrPUs7ZWsrYWdZ9OxsLk65e6l6VLezJtjmqNXl
 k17v6TeWe6+Mt8hId804pzglCSijReq0Sp7ibnTt3uy0H1rXRAb8kbrxJCwWJSPwubd5m0us06
 trCsH4MIZatJ6znKSiYycpfhFBlFi9jxSAB2vqwUi8zPDueK+2oIJXIab17e1FG8OPW7MZnf8N
 Bi0=
X-SBRS: 2.7
X-MesageID: 5525056
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5525056"
To: Jan Beulich <jbeulich@suse.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-6-andrew.cooper3@citrix.com>
 <523f8f8d-8517-be28-b3d9-8ae7cca6ddec@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <61bf9e3a-b331-7336-1a49-91d62f53dd63@citrix.com>
Date: Thu, 12 Sep 2019 09:36:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <523f8f8d-8517-be28-b3d9-8ae7cca6ddec@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 5/8] tools/libxc: Rework xc_cpuid_set() to
 use {get, set}_cpu_policy()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDkvMjAxOSAwOToxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMDkuMjAxOSAy
MjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhlIHB1cnBvc2Ugb2YgdGhpcyBjaGFuZ2Ug
aXMgdG8gc3RvcCB1c2luZyB4Y19jcHVpZF9kb19kb21jdGwoKSwgYW5kIHRvIHN0b3AKPj4gYmFz
aW5nIGRlY2lzaW9ucyBvbiBhIGxvY2FsIENQVUlEIGluc3RydWN0aW9uLiAgVGhpcyBpcyBub3Qg
YW4gYXBwcm9wcmlhdGUgd2F5Cj4+IHRvIGNvbnN0cnVjdCBwb2xpY3kgaW5mb3JtYXRpb24gZm9y
IG90aGVyIGRvbWFpbnMuCj4+Cj4+IE9idGFpbiB0aGUgaG9zdCBhbmQgZG9tYWluLW1heCBwb2xp
Y2llcyBmcm9tIFhlbiwgYW5kIG1peCB0aGUgcmVzdWx0cyBhcwo+PiBiZWZvcmUuICBQcm92aWRl
IHJhdGhlciBtb3JlIGVycm9yIGxvZ2dpbmcgdGhhbiBiZWZvcmUuCj4gQW5kIHRoaXMgcGFzc2lu
ZyB0aHJvdWdoIG9mIGhvc3QgdmFsdWVzIGlzIG1lYW50IHRvIHN0YXkgbG9uZwo+IHRlcm0/IFNo
b3VsZG4ndCB0aGlzIHJhdGhlciBiZSBwYXNzaW5nIHRocm91Z2ggb2YgbWF4LXBvbGljeQo+IHZh
bHVlcywgd2l0aCBtYXgtcG9saWN5IGxvbmcgdGVybSB3aWRlciB0aGFuIGRlZmF1bHQtcG9saWN5
PyBUaGUKPiBjaGFuZ2UgaXRzZWxmIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBiZWZvcmUgZ2l2aW5n
IG15IFItYiBJJ2QKPiBsaWtlIHRvIHVuZGVyc3RhbmQgdGhpcyBhc3BlY3QuCgpUaGVyZSBpcyBh
IHZlcnkgbGFyZ2UgYW1vdW50IHdyb25nIHdpdGggeGNfY3B1aWRfc2V0KCkuCgpGb3Igb25lLCBp
dHMgYmVoYXZpb3VyIGlzIG9ubHkgdXNlZnVsIGZvciBmZWF0dXJlIGxlYXZlcywgYnV0IGl0IHdp
bGwKb3BlcmF0ZSBvbiBhbnkgbGVhdmVzIHRoZSB1c2VyIHJlcXVlc3RzLCBhbmQgd2hpbGUgaXQg
aXMgY2FwYWJsZSBvZgpyZXR1cm5pbmcgZXJyb3JzLCBsaWJ4bCBkb2Vzbid0IGNoZWNrIHRoZSBy
ZXR1cm4gdmFsdWUgYW5kIGNvbnRpbnVlcwpibGluZGx5IGZvcndhcmRzLgoKQWxzbyBmcm9tIHRo
ZSBMMVRGIGVtYmFyZ28gZGF5cyBpcyBhIHNlcmllcyBvZiB3b3JrIChvciBhdCBsZWFzdCwgdGhl
CnN0YXJ0IG9mKSB3aGljaCBpcyBhIHRvdGFsIG92ZXJoYXVsIG9mIGhvdyBsaWJ4bCBhbmQgbGli
eGMgaW50ZXJhY3Qgd2hlbgppdCBjb21lcyBDUFVJRCBhbmQgTVNSIHNldHRpbmdzLsKgIE5laXRo
ZXIgeGNfY3B1aWRfc2V0KCkgbm9yCnhjX2NwdWlkX2FwcGx5X3BvbGljeSgpIHdpbGwgc3Vydml2
ZSB0byB0aGUgZW5kLgoKRm9yIG5vdywgSSd2ZSBvcHRlZCB3aXRoIG5vdCBjaGFuZ2luZyB0aGUg
c2VtYW50aWNzIG9mIHRoZSBjYWxscyB3aGlsZQphbHRlcmluZyB0aGUgZGF0YS10cmFuc2ZlciBt
ZWNoYW5pc20sIHRvIGF2b2lkIGNvbmZsYXRpbmcgdGhlIHR3byBhcmVhcwpvZiB3b3JrLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
