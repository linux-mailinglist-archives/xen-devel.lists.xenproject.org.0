Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6211D62E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 19:48:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTSh-0001Yw-Dd; Thu, 12 Dec 2019 18:45:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Md0W=2C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifTSf-0001Yr-Ft
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:45:17 +0000
X-Inumbo-ID: 8501949a-1d0f-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8501949a-1d0f-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576176308;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Enl2t4LsWRnFGOkmlxwRlQLt5nhQH1JIvd8PlluiG4o=;
 b=CDh/RgPtCzuGYXfLuKZE4hD16AJnHNh2OqiKyEuwkkfRzW3ahIRWqVcs
 TRsPU8G54LYRVp5dcdlJvN0++BZaUNPZ69ve4UJBvyaMctkxeK9LudUX6
 hydkTX1opakhsbOF6o+Q89GSqR4ogoHZsFxqrc2vmw63W6zuSxJ86CnXQ Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9GiqKgFNopAnxq1R9qQCjZguRkgGuJraanXU7gxFmuNzaDp7zPo2p6tytIGZdnvFrDHfNbxCJv
 jHEuhf+iy/jRodX1AlHQM6wTOFOXtCZSIbA19TsbHHebIKtajoCbBxo0VeBYKgYN5SM5z3E/7Z
 s07QrpGQQi2OCholreCjVgJ8lBficJX8VwRczCYq6n8rDCjhshx/dvrUqFBG1f8pFDRY1xSklZ
 V9aa5knnzCkuyVgohUIaEe9KgxgtqnCby20cTZX/0aNYQPLZwt9bLB1xzM5i/sacJOv67VEb/Y
 ITo=
X-SBRS: 2.7
X-MesageID: 9965193
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9965193"
To: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-4-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <beee342b-0d81-f0bb-0a56-2b4eb4b2df67@citrix.com>
Date: Thu, 12 Dec 2019 18:45:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191212182740.2190199-4-anthony.perard@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH 3/8] xen: Update Kconfig to Linux v5.4
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTIvMjAxOSAxODoyNywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhpcyBwYXRjaCB1
cGRhdGVzIEtjb25maWcgdG8gYSBtb3JlIHJlY2VudCB2ZXJzaW9uIG9mIEtjb25maWcsIGZvdW5k
Cj4gaW4gTGludXggdjUuNC4wLCAyMTlkNTQzMzJhMDkgKCJMaW51eCA1LjQiKS4KPgo+IFdpdGgg
dGhlIHVwZGF0ZWQgdmVyc2lvbiBvZiBLY29uZmlnLCBvdGhlciBjaGFuZ2VzIGFyZSBuZWNlc3Nh
cnkgdG8KPiBhdm9pZCBicmVha2luZyB0aGUgYnVpbGQuCj4KPiBLY29uZmlnIGZpbGVzOgo+IC0g
Zml4IEtjb25maWcgZmlsZXMgdGhhdCB3aGVyZSB1c2luZyBvcHRpb24gZW52PSo6Cj4gICBTaW5j
ZSBMaW51eCBjb21taXQgMTA0ZGFlYTE0OWM0ICgia2NvbmZpZzogcmVmZXJlbmNlIGVudmlyb25t
ZW50Cj4gICB2YXJpYWJsZXMgZGlyZWN0bHkgYW5kIHJlbW92ZSAnb3B0aW9uIGVudj0nIiksIHdl
IGNhbiBhY2Nlc3MgdGhlCj4gICBlbnZpcm9ubWVudCBkaXJlY3RseSB2aWEgJCgpIGFuZCAib3B0
aW9uIGVudj0iIGFzIGJlZW4gcmVtb3ZlZC4KPiAtIENPTkZJR19FWFBFUlQ9J3knIHdpbGwgbm93
IGFwcGVhciBpbiAuY29uZmlnIGZpbGUgaWYKPiAgIFhFTl9DT05GSUdfRVhQRVJUPXkgaW4gdGhl
IGVudmlyb25tZW50LiBUaGUgYWx0ZXJuYXRpdmUgaXMgdG8gY2hhbmdlCj4gICAiRVhQRVJUIiB0
byAiJChYRU5fQ09ORklHX0VYUEVSVCkiIGluIGFsbCBLY29uZmlnIGZpbGVzLgo+Cj4gTWFrZWZp
bGU6Cj4gLSBzaWxlbnRvbGRjb25maWcgdGFyZ2V0IGFzIGJlZW4gcmVtb3ZlZCBmcm9tIEtjb25m
aWcuIFRvIHVwZGF0ZQo+ICAgaW5jbHVkZS9nZW5lcmF0ZWQvYXV0b2NvbmYuaCwgd2UgbmVlZCB0
byB1c2Ugc3luY2NvbmZpZyB0YXJnZXQKPiAgIGluc3RlYWQuCj4KPiBNYWtlZmlsZS5rY29uZmln
Ogo+IC0gSW1wb3J0IG5ld2VyIG5lZWRlZCBjb2RlIGZyb20gTGludXgncyBNYWtlZmlsZS5saWIg
YW5kCj4gICBLYnVpbGQuaW5jbHVkZSBhbmQgTWFrZWZpbGUuYnVpbGQuCj4gLSBTZXQgUSB0byBl
bXB0eSwgWGVuIGJ1aWxkIHN5c3RlbSBkb2Vzbid0IHNpbGVuY2UgY29tbWFuZHMuIEhhdmluZyBR
Cj4gICBlbXB0eSBtZWFuIHdlIGNhbiBpbXBvcnQgc3R1ZmYgZnJvbSBMaW51eCB3aXRob3V0IGhh
dmluZyB0byByZW1vdmUgdGhlCj4gICBsZWFkaW5nICQoUSkgZnJvbSBidWlsZCBjb21tYW5kcy4g
QW5kIHF1aWV0PScnIG1lYW5zIGNvbW1hbmRzIHdpbGwgYmUKPiAgIGVjaG9lZC4KPiAtIEFkZCAk
KFBIT05ZKSB0byAuUEhPTlkuIExpa2UgaXQgaXMgaW50ZW5kZWQgYnkgS2J1aWxkLgo+Cj4gTWFr
ZWZpbGUuaG9zdCBpcyBhbHNvIHVwZGF0ZWQgYW5kIGNvcGllZCBmcm9tIExpbnV4Lgo+Cj4gRGVw
ZW5kZW5jeSBjaGFuZ2U6Cj4gLSBOb3cgZGVwZW5kcyBvbiBmbGV4L2Jpc29uLCBtYXliZSB3ZSBj
b3VsZCBfc2hpcHBlZCB0aG9zZSBmaWxlcyBsaWtlCj4gICBiZWZvcmUuIExpbnV4IGRvZXNuJ3Qg
ZG8gdGhhdCBhbnltb3JlLgoKQ29udGVudCBsaWtlIHRoYXQgc2hvdWxkIG5vdCBiZSBjaGVja2Vk
IGluIHRvIGJlaW5nIHdpdGgsIGFuZCBJIHRoaW5rIGl0CmlzIGVudGlyZWx5IHJlYXNvbmFibGUg
dG8gcmVxdWlyZSBmbGV4L2Jpc29uIGluIGEgYnVpbGQgZW52aXJvbm1lbnQuCgpJbmRlZWQsIFJF
QURNRSBsaXN0cyB0aGVtIGFzIG1hbmRhdG9yeSByZXF1aXJlbWVudHMuCgo+IFNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
