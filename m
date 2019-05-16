Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44235200E5
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 10:01:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRBID-0006i2-Vq; Thu, 16 May 2019 07:59:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Nh3=TQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRBIC-0006hl-GB
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 07:59:08 +0000
X-Inumbo-ID: 773d2f5e-77b0-11e9-acb7-8b0e65329745
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 773d2f5e-77b0-11e9-acb7-8b0e65329745;
 Thu, 16 May 2019 07:59:01 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: gj69KReN9/bM/UYjgTWutajD+nS6MheYT+FJxJpLxzhoZ+A2N6cnaPbrFvHjZSH5jT1biz4gq2
 wVXrpo9ZpzwwZHsviQ/LDhy9PHf9g7KAcodro4wZAfTHrAKeKHVqUOp1I9hQIr4y7+/47IhPlP
 22Ag0wUc/JcYa1/O1d/v0XlqIFFpDGYxah9JHeOUGmJsZVkTex9STl0gmZHI3LYoO7MZPZMR9j
 XY2nGIaT8Zg4Wa5XQ5eUX4ggY+cZ6jw9jK3RrlBIibeoqxuua1KsKPrqtwIpaS7ama44P3QSVE
 ILw=
X-SBRS: 2.7
X-MesageID: 511755
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,475,1549947600"; 
   d="scan'208";a="511755"
To: "wencongyang (A)" <wencongyang2@huawei.com>,
 <xen-devel@lists.xenproject.org>
References: <6bca3b07-c2aa-124f-e77e-59d5eb7bbd5c@huawei.com>
 <5cdbd5ec-3ee9-04ff-5ce8-73c542b8b752@citrix.com>
 <e30d844e-72e6-8ec5-354c-e61ef5c82093@huawei.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <67885e5e-d67c-8067-eded-69290429714b@citrix.com>
Date: Thu, 16 May 2019 08:58:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e30d844e-72e6-8ec5-354c-e61ef5c82093@huawei.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Question about MDS mitigation
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
Cc: gaowanlong <gaowanlong@huawei.com>,
 "Liujinsong \(Paul\)" <liu.jinsong@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, "Chentao
 \(Boby\)" <boby.chen@huawei.com>, guijianfeng <guijianfeng@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAwODo1Niwgd2VuY29uZ3lhbmcgKEEpIHdyb3RlOgo+Cj4gT24gMjAxOS81
LzE2IDE1OjM4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNi8wNS8yMDE5IDAzOjQ2LCB3
ZW5jb25neWFuZyAoQSkgd3JvdGU6Cj4+PiBIaSBhbGwKPj4+Cj4+PiBGaWxsIGJ1ZmZlcnMsIGxv
YWQgcG9ydHMgYXJlIHNoYXJlZCBiZXR3ZWVuIHRocmVhZHMgb24gdGhlIHNhbWUgcGh5c2ljYWwg
Y29yZS4KPj4+IFdlIG5lZWQgdG8gcnVuIG1vcmUgdGhhbiBvbmUgdm0gb24gdGhlIHNhbWUgcGh5
c2ljYWwgY29yZS4KPj4+IElzIHRoZXJlIGFueSBjb21wbGV0ZSBtaXRpZ2F0aW9uIGZvciBlbnZp
cm9ubWVudHMgdXRpbGl6aW5nIFNNVD8KPj4gTm8gLSBub3QgcmVhbGx5Lgo+Pgo+PiBBbiBhcHBy
b2FjaCB3aGljaCB3YXMgd29ya2VkIG9uIHdhcyB0aGF0IG9mIHN5bmNocm9uaXNlZCBzY2hlZHVs
aW5nLAo+PiB3aGVyZWJ5IHByaXZpbGVnZSB0cmFuc2l0aW9ucyBhcmUgc3luY3Job25pc2VkIHRv
IGVuc3VyZSB0aGF0IHdlJ3JlCj4+IG5ldmVyIHJ1bm5pbmcgY29kZSBmcm9tIGRpZmZlcmVudCBw
cml2aWxlZ2UgbGV2ZWxzIGNvbmN1cnJlbnRseSBvbgo+PiBhZGphY2VudCB0aHJlYWRzLiAgKFRo
aXMgaXMgdGhlIG1pdGlnYXRpb24gZGVzY3JpYmVkIGFzIEdyb3VwIFNjaGVkdWxpbmcKPj4gaW4K
Pj4gaHR0cHM6Ly9zb2Z0d2FyZS5pbnRlbC5jb20vc2VjdXJpdHktc29mdHdhcmUtZ3VpZGFuY2Uv
aW5zaWdodHMvZGVlcC1kaXZlLWludGVsLWFuYWx5c2lzLW1pY3JvYXJjaGl0ZWN0dXJhbC1kYXRh
LXNhbXBsaW5nCj4+ICkKPiBzeW5jaHJvbmlzZWQgc2NoZWR1bGluZyBpcyBub3QgYSBjb21wbGV0
ZSBtaXRpZ2F0aW9uLiBHdWVzdCBBIGFuZCBHdWVzdCBCCj4gcnVuIG9uIHRoZSBzYW1lIHBoeXNp
Y2FsIGNvcmUsIGFuZCB0aGUgcHJpdmlsZWdlIGxldmVsIGlzIHRoZSBzYW1lLiBTbwo+IEd1ZXN0
IEEgY2FuIGluZmVyIGRhdGEgZnJvbSBHdWVzdCBCLiBHdWVzdCBBIGNhbm5vdCBpbmZlciBkYXRh
IGZyb20gaHlwZXJ2aXNvcgo+IGJlY2F1c2UgdGhleSBhcmUgaW4gZGlmZmVyZW50IHByaXZpbGVn
ZSBsZXZlbHMuCgpUaGlzIGlzIChvbmUgb2YgdGhlIHJlYXNvbnMpIHdoeSBjb3JlIHNjaGVkdWxp
bmcgaXMgYSBwcmVyZXF1aXNpdGUgdG8Kc3luY2hyb25pc2VkIHNjaGVkdWxpbmcuCgpXaXRoIGNv
cmUgc2NoZWR1bGluZyBhY3RpdmUsIHlvdSB3aWxsIG5ldmVyIGhhdmUgZ3Vlc3QgQSBhbmQgQgpj
b25jdXJyZW50bHkgcnVubmluZyBvbiBhZGphY2VudCB0aHJlYWRzIG9mIHRoZSBzYW1lIGNvcmUu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
