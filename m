Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E769367104
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 16:10:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlwC1-0003TO-FP; Fri, 12 Jul 2019 14:06:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+APl=VJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hlwBz-0003TJ-RF
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 14:06:31 +0000
X-Inumbo-ID: 3ee8e237-a4ae-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3ee8e237-a4ae-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 14:06:30 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8c49cXmEU4DVbzknZCNFFH/vhecAeN1PtOBv9TIf+TYshzn88tjaI/QrzDZc0UaZ+U2pZb/rwG
 uBPoMDuBbOGKi0PrrlTCknCnOze2WQG9MPxgaDF1TBo7pJM8NqGzQvd8p9ciespPfNFC1L1ood
 PJruXl2zoS6m96MWXHH7LhEfaSCVc+sHA7PgLEP/wOJts5H77lFWNt/T2Mhn0wVZDutSXLTFnK
 S3CTcnK5hkKLTKdfu55xy9ANzGvAeURf5XlS095zv/9wOx0wLV9vBjd/AUOvmC3JSuBjT80U50
 FgM=
X-SBRS: 2.7
X-MesageID: 2947113
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,482,1557201600"; 
   d="scan'208";a="2947113"
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, <linux-kernel@vger.kernel.org>
References: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ebf9657b-7d97-87a0-e32e-af8453ee7bba@citrix.com>
Date: Fri, 12 Jul 2019 09:06:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] xen/pv: Fix a boot up hang revealed by
 int3 self test
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 srinivas.eeda@oracle.com, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDcvMjAxOSAwMzoxNSwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4gQ29tbWl0IDc0NTdj
MGRhMDI0YiAoIng4Ni9hbHRlcm5hdGl2ZXM6IEFkZCBpbnQzX2VtdWxhdGVfY2FsbCgpCj4gc2Vs
ZnRlc3QiKSBpcyB1c2VkIHRvIGVuc3VyZSB0aGVyZSBpcyBhIGdhcCBzZXR1cCBpbiBleGNlcHRp
b24gc3RhY2sKPiB3aGljaCBjb3VsZCBiZSB1c2VkIGZvciBpbnNlcnRpbmcgY2FsbCByZXR1cm4g
YWRkcmVzcy4KPgo+IFRoaXMgZ2FwIGlzIG1pc3NlZCBpbiBYRU4gUFYgaW50MyBleGNlcHRpb24g
ZW50cnkgcGF0aCwgdGhlbiBiZWxvdyBwYW5pYwo+IHRyaWdnZXJlZDoKPgo+IFsgICAgMC43NzI4
NzZdIGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdDogMDAwMCBbIzFdIFNNUCBOT1BUSQo+IFsgICAg
MC43NzI4ODZdIENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDUuMi4w
KyAjMTEKPiBbICAgIDAuNzcyODkzXSBSSVA6IGUwMzA6aW50M19tYWdpYysweDAvMHg3Cj4gWyAg
ICAwLjc3MjkwNV0gUlNQOiAzNTA3OmZmZmZmZmZmODIyMDNlOTggRUZMQUdTOiAwMDAwMDI0Ngo+
IFsgICAgMC43NzMzMzRdIENhbGwgVHJhY2U6Cj4gWyAgICAwLjc3MzMzNF0gIGFsdGVybmF0aXZl
X2luc3RydWN0aW9ucysweDNkLzB4MTJlCj4gWyAgICAwLjc3MzMzNF0gIGNoZWNrX2J1Z3MrMHg3
YzkvMHg4ODcKPiBbICAgIDAuNzczMzM0XSAgPyBfX2dldF9sb2NrZWRfcHRlKzB4MTc4LzB4MWYw
Cj4gWyAgICAwLjc3MzMzNF0gIHN0YXJ0X2tlcm5lbCsweDRmZi8weDUzNQo+IFsgICAgMC43NzMz
MzRdICA/IHNldF9pbml0X2FyZysweDU1LzB4NTUKPiBbICAgIDAuNzczMzM0XSAgeGVuX3N0YXJ0
X2tlcm5lbCsweDU3MS8weDU3YQo+Cj4gQXMgeGVuaW50MyBhbmQgaW50MyBlbnRyeSBjb2RlIGFy
ZSBzYW1lIGV4Y2VwdCB4ZW5pbnQzIGRvZXNuJ3QgZ2VuZXJhdGUKPiBhIGdhcCwgd2UgY2FuIGZp
eCBpdCBieSB1c2luZyBpbnQzIGFuZCBkcm9wIHVzZWxlc3MgeGVuaW50My4KCkZvciA2NGJpdCBQ
ViBndWVzdHMsIFhlbidzIEFCSSBlbnRlcnMgdGhlIGtlcm5lbCB3aXRoIHVzaW5nIFNZU1JFVCwg
d2l0aAolcmN4LyVyMTEgb24gdGhlIHN0YWNrLgoKVG8gY29udmVydCBiYWNrIHRvICJub3JtYWwi
IGxvb2tpbmcgZXhjZXB0aW9ucywgdGhlIHhlbiB0aHVua3MgZG8gYHBvcAolcmN4OyBwb3AgJXIx
MTsgam1wIGRvXypgLi4uCgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5T
IGIvYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUwo+IGluZGV4IDBlYTQ4MzEuLjM1YTY2ZmMgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUwo+ICsrKyBiL2FyY2gveDg2L2Vu
dHJ5L2VudHJ5XzY0LlMKPiBAQCAtMTE3Niw3ICsxMTc2LDYgQEAgaWR0ZW50cnkgc3RhY2tfc2Vn
bWVudAkJZG9fc3RhY2tfc2VnbWVudAloYXNfZXJyb3JfY29kZT0xCj4gICNpZmRlZiBDT05GSUdf
WEVOX1BWCj4gIGlkdGVudHJ5IHhlbm5taQkJCWRvX25taQkJCWhhc19lcnJvcl9jb2RlPTAKPiAg
aWR0ZW50cnkgeGVuZGVidWcJCWRvX2RlYnVnCQloYXNfZXJyb3JfY29kZT0wCj4gLWlkdGVudHJ5
IHhlbmludDMJCWRvX2ludDMJCQloYXNfZXJyb3JfY29kZT0wCj4gICNlbmRpZgoKV2hhdCBpcyBj
b25mdXNpbmcgaXMgd2h5IHRoZXJlIGFyZSAzIGV4dHJhIG1hZ2ljIHZlcnNpb25zIGhlcmUuwqAg
QXQgYQpndWVzcywgSSdkIHNheSBzb21ldGhpbmcgdG8gZG8gd2l0aCBJU1Qgc2V0dGluZ3MgKGdp
dmVuIHRoZSB2ZWN0b3JzKSwKYnV0IEkgZG9uJ3Qgc2VlIHdoeSAjREIvI0JQIHdvdWxkIG5lZWQg
dG8gYmUgZGlmZmVyZW50IGluIHRoZSBmaXJzdApwbGFjZS7CoCAoTk1JIHN1cmUsIGJ1dCB0aGF0
IGlzIG1vcmUgdG8gZG8gd2l0aCB0aGUgY3JhenkgaG9vcHMgbmVlZGluZwp0byBiZSBqdW1wZWQg
dGhyb3VnaCB0byBrZWVwIG5hdGl2ZSBmdW5jdGlvbmluZyBzYWZlbHkuKQoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
