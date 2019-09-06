Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BD2ABA32
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:05:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Epc-0006w4-6n; Fri, 06 Sep 2019 14:03:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHqG=XB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i6Epa-0006vk-Iz
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:03:18 +0000
X-Inumbo-ID: 13556efe-d0af-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13556efe-d0af-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567778597;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tPHhLEkftJLgiRaou15/ehBVRbKUfUKbB27aJn0nwhc=;
 b=QyGXIQpnGvs0CuDV7rtp5u6Fvve0wkwGiOAiTanslWp9Gc8MrCrFAtdW
 kGMLtuJhu1ChE8XjAq+1Ex9wQ4BrKWiFQm4Ldz+Y5pwOJlzF2b/ahbpZU
 KNbWn57uPX1qJWLF6AE0rEUfyT7/JyQfZx5Uwt9WNoR2ez5hodclBIMg3 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 47qCg4KOiYR5FRYBhqhJAQtfUtYNVrDg9N2AwT8RVmgkMJ5JVF4Hg57xJrmLgaal8OSGY3dUtm
 a8OIQI8oNlPZJ/D5D9SI0ScrS5VajbmESAaLTA4Xp932ejWPmzdWjNa4kmWRXs4GRQWRQUHG3d
 h5pfNy5ZU+n3espgAG40JCgGUrkj0ViuA92YE0foVHqg8iwQ9JLGyxy4CDbJRgxeXi4pXeEYtq
 8qzETbzr+H9wwrizismDUTQAQJTmehvz+lMeiEMRF1uESfWFteDGOtbW8M+EN7TPlZgzzh3xu2
 kK4=
X-SBRS: 2.7
X-MesageID: 5514432
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5514432"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <67f6d8cc-05cf-ac8e-38c0-55578f9f595a@suse.com>
 <35bb2f38-9d50-c12c-1051-7005251685ca@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f9e6038a-927c-e245-a800-e5686b06a1f6@citrix.com>
Date: Fri, 6 Sep 2019 15:03:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <35bb2f38-9d50-c12c-1051-7005251685ca@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/3] x86/apic: do not initialize LDR and DFR
 for bigsmp
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

T24gMDYvMDkvMjAxOSAxNTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTGVnYWN5IGFwaWMgaW5p
dCB1c2VzIGJpZ3NtcCBmb3Igc21wIHN5c3RlbXMgd2l0aCA4IGFuZCBtb3JlIENQVXMuIFRoZQo+
IGJpZ3NtcCBBUElDIGltcGxlbWVudGF0aW9uIHVzZXMgcGh5c2ljYWwgZGVzdGluYXRpb24gbW9k
ZSwgYnV0IGl0Cj4gbmV2ZXJ0aGVsZXNzIGluaXRpYWxpemVzIExEUiBhbmQgREZSLiBUaGUgTERS
IGV2ZW4gZW5kcyB1cCBpbmNvcnJlY3RseSB3aXRoCj4gbXVsdGlwbGUgYml0IGJlaW5nIHNldC4K
Pgo+IFRoaXMgZG9lcyBub3QgY2F1c2UgYSBmdW5jdGlvbmFsIHByb2JsZW0gYmVjYXVzZSBMRFIg
YW5kIERGUiBhcmUgaWdub3JlZAo+IHdoZW4gcGh5c2ljYWwgZGVzdGluYXRpb24gbW9kZSBpcyBh
Y3RpdmUsIGJ1dCBpdCB0cmlnZ2VyZWQgYSBwcm9ibGVtIG9uIGEKPiAzMi1iaXQgS1ZNIGd1ZXN0
IHdoaWNoIGp1bXBzIGludG8gYSBrZHVtcCBrZXJuZWwuCj4KPiBUaGUgbXVsdGlwbGUgYml0cyBz
ZXQgdW5lYXJ0aGVkIGEgYnVnIGluIHRoZSBLVk0gQVBJQyBpbXBsZW1lbnRhdGlvbi4gVGhlCj4g
Y29kZSB3aGljaCBjcmVhdGVzIHRoZSBsb2dpY2FsIGRlc3RpbmF0aW9uIG1hcCBmb3IgVkNQVXMg
aWdub3JlcyB0aGUKPiBkaXNhYmxlZCBzdGF0ZSBvZiB0aGUgQVBJQyBhbmQgZW5kcyB1cCBvdmVy
d3JpdGluZyBhbiBleGlzdGluZyB2YWxpZCBlbnRyeQo+IGFuZCBhcyBhIHJlc3VsdCwgQVBJQyBj
YWxpYnJhdGlvbiBoYW5ncyBpbiB0aGUgZ3Vlc3QgZHVyaW5nIGtkdW1wCj4gaW5pdGlhbGl6YXRp
b24uCj4KPiBSZW1vdmUgdGhlIGJvZ3VzIExEUi9ERlIgaW5pdGlhbGl6YXRpb24uCj4KPiBUaGlz
IGlzIG5vdCBpbnRlbmRlZCB0byB3b3JrIGFyb3VuZCB0aGUgS1ZNIEFQSUMgYnVnLiBUaGUgTERS
L0RGUgo+IGluaW5pdGFsaXphdGlvbiBpcyB3cm9uZyBvbiBpdHMgb3duLgo+Cj4gU3VnZ2VzdGVk
LWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBTaWduZWQtb2ZmLWJ5
OiBCYW5kYW4gRGFzIDxic2RAcmVkaGF0LmNvbT4KPiBbTGludXggY29tbWl0IGJhZTNhOGQzMzA4
ZWU2OWE3ZGJkZjE0NTkxMWIxOGRmZGE4YWRlMGRdCj4KPiBEcm9wIGluaXRfYXBpY19sZHJfeDJh
cGljX3BoeXMoKSBhdCB0aGUgc2FtZSB0aW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
