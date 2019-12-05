Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8834B11467F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 19:04:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icvQg-00057H-He; Thu, 05 Dec 2019 18:00:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7+lP=Z3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1icvQe-00057C-Gh
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 18:00:40 +0000
X-Inumbo-ID: 24eb9958-1789-11ea-8232-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24eb9958-1789-11ea-8232-12813bfff9fa;
 Thu, 05 Dec 2019 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575568839;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IMaOcRgRTQsqemKS32u2OudPMmXfcvjjn9TTrf9t/7E=;
 b=feyMgCcMBtM+DVvJXsYmkzfs4x90VmsgV/P0ZK8KfVdNDtvVbOdHfbDF
 HSzHH1LEJJQhqkdEyuwShiBuL2i2QsXWzo/vjJea/arNXLHtERiHYbKaa
 PGt0vFqRcnS5cAQV3SBdYpGcNOcnmGfdYDF9PGe0Csv+IFwA1jSWIV67F Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vH2lhzZCUy0Lupt5F+Em4VijoZ40bOBjRhIE6pchoNqjBF5ZZIaSPkGQF19IA3mK4ztSYZd+4e
 HsPEHvG0yuZhgn6GZOjTcsuXMKPyFPaM91L8NTNPjChFkBSWgWKnSRQ5v8axG4H6Prgxu5/QfK
 nftB/DFhd2ejVx5dqvehPs5KgZZgVWow1rbhh+YMLQ85VRftnJaYiw7tg8BUPjoB2uR8R07U8D
 9ZT/sPAfEKdoXe61Q+CULNkdvp2dl7/WwrKMxVK7d7x6EWPtRxQ8YvTN64o8LZxcKuROrf6sXe
 cJg=
X-SBRS: 2.7
X-MesageID: 9676647
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,282,1571716800"; 
   d="scan'208";a="9676647"
To: Nick Rosbrook <rosbrookn@gmail.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <472334f58bc435e505ad6bc392426960630fb060.1573840474.git.rosbrookn@ainfosec.com>
 <0ab13f6e-2dcf-ebbb-4d14-ee87c816701d@citrix.com>
 <CAEBZRSe=8vW7qj5fbU7dTpPYTtuR5j1PTbiV0=tYnGvkcahG8w@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <ffe83eb5-ed94-d594-71f9-bef80377fc09@citrix.com>
Date: Thu, 5 Dec 2019 18:00:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAEBZRSe=8vW7qj5fbU7dTpPYTtuR5j1PTbiV0=tYnGvkcahG8w@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 15/22] golang/xenlight: begin C to Go
 type marshaling
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvNS8xOSA0OjM4IFBNLCBOaWNrIFJvc2Jyb29rIHdyb3RlOgo+PiBZb3Ugc2hvdWxkIHBy
b2JhYmx5IHNheSBoZXJlIGV4cGxpY2l0bHkgd2hhdCBraW5kcyBvZiBlbGVtZW50cyB5b3UncmUK
Pj4gc3VwcG9ydGluZyBhbmQgbm90IHN1cHBvcnRpbmcgaW4gdGhpcyBwYXRjaDsgc3BlY2lmaWNh
bGx5Ogo+Pgo+PiAtIFlvdSdyZSBjb252ZXJ0aW5nIGJ1aWx0LWlucyAob3IgaXMgdGhpcyBhbnkg
c3RydWN0LWxpa2UgdHlwZT8pCj4gCj4gQW55IHN0cnVjdC1saWtlIHR5cGUsIHNpbmNlIHRoZSBm
cm9tQyBmdW5jdGlvbnMgYXJlIGFsbCBkZWZpbmVkIGluCj4gdGhpcyBwYXRjaCAoZXhjbHVkaW5n
IGFycmF5IGZpZWxkcyBhbmQga2V5ZWQgdW5pb25zIGFzIHlvdSBzYWlkCj4gYmVsb3cpLgo+IAo+
PiAtIFlvdSBoYW5kbGUgbmVzdGVkIGFub255bW91cyBzdHJ1Y3RzCj4+IC0gQnV0IHlvdSdyZSBu
b3QgaGFuZGxpbmcga2V5ZWQgdW5pb25zIG9yIGFycmF5cyAoYW55dGhpbmcgZWxzZSk/Cj4gCj4g
SSB0aGluayB0aGlzIGNvdmVycyBpdCwgdGhhbmtzLgo+IAo+Pj4gK2Z1bmMgKHggKlZuY0luZm8p
IGZyb21DKHhjICpDLmxpYnhsX3ZuY19pbmZvKSBlcnJvciB7Cj4+PiArICAgICB2YXIgZGVmYm9v
bEVuYWJsZSBEZWZib29sCj4+PiArICAgICBpZiBlcnIgOj0gZGVmYm9vbEVuYWJsZS5mcm9tQygm
eGMuZW5hYmxlKTsgZXJyICE9IG5pbCB7Cj4+PiArICAgICAgICAgICAgIHJldHVybiBlcnIKPj4+
ICsgICAgIH0KPj4KPj4gSXMgdGhlcmUgYSByZWFzb24gaW4gdGhlc2UgY2FzZXMgdGhhdCB3ZSBk
b24ndCBzaW1wbHkgY2FsbCAuZnJvbUMgb24gdGhlCj4+IGVsZW1ldCBpdHNlbGY/Cj4gCj4gVGhp
cyBlbnN1cmVzIHRoYXQgd2hlbiB3ZSBjYWxsIGZyb21DLCB3ZSBoYXZlIGFuIGluaXRpYWxpemVk
IHZhcmlhYmxlLgo+IFRoaXMgbWlnaHQgYmUgb3ZlcmtpbGwgaGVyZSwgYXMgdGhpcyB3b3VsZCBt
YXR0ZXIgbW9yZSBpZiB3ZSBoYWQKPiBzdHJ1Y3RzIHdpdGggYSBuZXN0ZWQgc3RydWN0IHBvaW50
ZXIuIEUuZy4sIFsxXSB3aWxsIHBhbmljIHNpbmNlIG9ubHkKPiB0aGUgb3V0ZXIgc3RydWN0IGlz
IGluaXRpYWxpemVkLgoKU28gZmlyc3Qgb2YgYWxsLCBJIG5vdGljZWQgdGhhdCB0aGUgbWFyc2hh
bGxpbmcgY29kZSBmb3IgVW5pb24gc3RydWN0cwpkb2VzIHdoYXQgSSBzdWdnZXN0LiA6LSkKCkkg
Y2FuIHNlZSBob3cgc3VjaCBhIGNvbnN0cnVjdCB3b3VsZCBiZSBuZWVkZWQgd2hlbiB0aGVyZSB3
YXMgYSBwb2ludGVyCnR5cGUuICBCdXQgaWYgdGhlcmUgd2FzIGEgcG9pbnRlciB0eXBlLCB5b3Un
ZCBoYXZlIHRvIHNwZWNpYWwtY2FzZQp0aGluZ3MgYW55d2F5LiAgVGFrZSB0aGUgZm9sbG93aW5n
IGNvZGUgdGhhdCBoYXMgYSBub24tcG9pbnRlciBlbGVtZW50OgoKCXZhciBkZWZib29sRW5hYmxl
IERlZmJvb2wgLy8gVGhlIHNhbWUgdHlwZSBhcyB4LkVuYWJsZQoJaWYgZXJyIDo9IGRlZmJvb2xF
bmFibGUuZnJvbUMoJnhjLmVuYWJsZSk7IGVyciAhPSBuaWwgewoJCXJldHVybiBlcnIKCX0KCXgu
RW5hYmxlID0gZGVmYm9vbEVuYWJsZQoKTm93IHN1cHBvc2UgeW91IGhhZCBhIHBvaW50ZXIgZWxl
bWVudCBpbnN0ZWFkOyB3aGF0IHdvdWxkIGl0IGxvb2sgbGlrZT8KCgl2YXIgZGVmYm9vbEVuYWJs
ZSBEZWZib29sIC8vIE5PVCB0aGUgc2FtZSB0eXBlIGFzIHguRW5hYmxlIQoJaWYgZXJyIDo9IGRl
ZmJvb2xFbmFibGUuZnJvbUMoJnhjLmVuYWJsZSk7IGVyciAhPSBuaWwgewoJCXJldHVybiBlcnIK
CX0KCXguRW5hYmxlID0gJmRlZmJvb2xFbmFibGUKClRoZSBnZW5lcmF0aW9uIGNvZGUgd291bGQg
aGF2ZSB0byByZXBsYWNlIHRoZSB0eXBlIG9mICJFbmFibGUiLCB3aGljaCBpcwphIHBvaW50ZXIs
IHdpdGggdGhlIGFjdHVhbCBpbnN0YW5jZSBvZiB0aGUgdGhpbmc7IGFuZCB0aGVuIGFzc2lnbiB0
aGUKcmVmZXJlbmNlLCByYXRoZXIgdGhhbiB0aGUgdmFsdWUuICBTbyBpZiB3ZSBydW4gYWNyb3Nz
IHNvbWV0aGluZyBsaWtlCnRoYXQsIHdlIGNhbiBzb3J0IHRoYXQgb3V0IHdoZW4gd2UgY29tZSB0
byBpdC4KCkknbSBub3Qgc3VwZXItc3Ryb25nIG9uIHRoaXMsIHNvIEkgZG9uJ3Qgd2FudCB0byBi
aWtlLXNoZWQuICBCdXQgSSB0aGluawp0aGUgd2F5IHlvdSBnZW5lcmF0ZSB0aGUgbWFyc2hhbGxp
bmcgY29kZSBmb3IgdGhlIHVuaW9uIHN0cnVjdHMgaXMgYmV0dGVyOgoKCWlmIGVyciA6PSB4LlBh
ZS5mcm9tQygmdG1wLnBhZSk7IGVyciAhPSBuaWwgewoJCXJldHVybiBlcnIKCX0KClRoYW5rcywK
IC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
