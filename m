Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E93B5D37B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 17:50:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiL0h-0004kX-41; Tue, 02 Jul 2019 15:47:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SKLB=U7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hiL0e-0004kS-W0
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 15:47:57 +0000
X-Inumbo-ID: bf8fae4e-9ce0-11e9-b910-c31da410a232
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf8fae4e-9ce0-11e9-b910-c31da410a232;
 Tue, 02 Jul 2019 15:47:51 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: POuLN2aU1hUgEmgOcsmrPx4eBxyWNap05ZBVa9MBm91DR4Jk5b/v48Fh6lV5nHXw2ebirIY0dQ
 iplb4sov/ooILEtm9GMljEAqsCk2wFSVFIWJcmZKzAeav05j/MBZpvttjxEhDAlvQsggfjfLtw
 VIJihLHmsx4nUljL3Q6opXd6YI1A4SYJn1zeOC/7RS5b88fIQA976qUCUK8bl+eUvT+UitC5sk
 QlBFboTmmAcytquzAbzvTOygAixG2KSuLgxplC1OBmYklUCB3j/O5cpmViig/vlWEtIKCw1AB4
 McQ=
X-SBRS: 2.7
X-MesageID: 2523428
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2523428"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DEEB020000780023B987@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <330aa2a1-bb69-140e-3a91-125b82df755f@citrix.com>
Date: Tue, 2 Jul 2019 15:41:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5D14DEEB020000780023B987@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 05/10] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDYvMjAxOSAxNjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMKPiBAQCAtNDAsMTIgKzQwLDQ1IEBAIHVuaW9uIGlydGUz
MiB7Cj4KPiAtI2RlZmluZSBJTlRSRU1BUF9UQUJMRV9PUkRFUiAgICAxCj4gK3VuaW9uIGlydGVf
Y3B0ciB7Cj4gKyAgICBjb25zdCB2b2lkICpwdHI7Cj4gKyAgICBjb25zdCB1bmlvbiBpcnRlMzIg
KnB0cjMyOwo+ICsgICAgY29uc3QgdW5pb24gaXJ0ZTEyOCAqcHRyMTI4Owo+ICt9IF9fdHJhbnNw
YXJlbnRfXzsKPiArCj4gKyNkZWZpbmUgSU5UUkVNQVBfVEFCTEVfT1JERVIgKGlydGVfbW9kZSA9
PSBpcnRlMzIgPyAxIDogMykKClRoaXMgaXMgcHJvYmxlbWF0aWMgZm9yIGlydGVfbW9kZSA9PSBp
cnRlVU5LLsKgIEFzIHRoaXMgImNvbnN0YW50IiBpcwp1c2VkIGluIGV4YWN0bHkgdHdvIHBsYWNl
cywgSSdkIHN1Z2dlc3QgYSB0aW55IHN0YXRpYyBmdW5jdGlvbiBhbG9uZyB0aGUKc2FtZSBsaW5l
cyBhcyB7Z2V0LHVwZGF0ZX1faW50cmVtYXBfZW50cnkoKSwgd2hpY2ggY2FuIHNlbnNpYmx5IHBy
ZXZlbnQKY29kZSBsb29raW5nIGZvciBhIHNpemUgYmVmb3JlIGlydGVfbW9kZSBpcyBzZXQgdXAu
Cgo+IEBAIC0xNDIsNyArMTg3LDIxIEBAIHN0YXRpYyB2b2lkIGZyZWVfaW50cmVtYXBfZW50cnko
dW5zaWduZWQKPiAgewo+ICAgICAgdW5pb24gaXJ0ZV9wdHIgZW50cnkgPSBnZXRfaW50cmVtYXBf
ZW50cnkoc2VnLCBiZGYsIGluZGV4KTsKPiAgCj4gLSAgICBBQ0NFU1NfT05DRShlbnRyeS5wdHIz
Mi0+cmF3WzBdKSA9IDA7Cj4gKyAgICBzd2l0Y2ggKCBpcnRlX21vZGUgKQo+ICsgICAgewo+ICsg
ICAgY2FzZSBpcnRlMzI6Cj4gKyAgICAgICAgQUNDRVNTX09OQ0UoZW50cnkucHRyMzItPnJhd1sw
XSkgPSAwOwo+ICsgICAgICAgIGJyZWFrOwo+ICsKPiArICAgIGNhc2UgaXJ0ZTEyODoKPiArICAg
ICAgICBBQ0NFU1NfT05DRShlbnRyeS5wdHIxMjgtPnJhd1swXSkgPSAwOwo+ICsgICAgICAgIGJh
cnJpZXIoKTsKCnNtcF93bWIoKS4KClVzaW5nIGJhcnJpZXIgaGVyZSBpc24ndCB0ZWNobmljYWxs
eSBjb3JyZWN0LCBiZWNhdXNlIHdoYXQgbWF0dGVycyBpcwp0aGUgZXh0ZXJuYWwgdmlzaWJpbGl0
eSBvZiB0aGUgd3JpdGUuCgpJdCBmdW5jdGlvbnMgY29ycmVjdGx5IG9uIHg4NiBiZWNhdXNlIHNt
cF93bWIoKSBpcyBiYXJyaWVyKCksIGJ1dCB0aGlzCmNvZGUgZG9lc24ndCB3b3JrIGNvcnJlY3Rs
eSBvbiBlLmcuIEFSTS4KCkknZCBnbyBmdXJ0aGVyIGFuZCBsZWF2ZSBhbiBleHBsYW5hdGlvbi4K
CnNtcF93bWIoKTsgLyogRW5zdXJlIHRoZSBjbGVhciBvZiAucmVtYXBfZW4gaXMgdmlzaWJsZSB0
byB0aGUgSU9NTVUKZmlyc3QuICovCgo+IEBAIC00NDQsOSArNjAxLDkgQEAgc3RhdGljIGludCB1
cGRhdGVfaW50cmVtYXBfZW50cnlfZnJvbV9tcwo+ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsK
PiAgICAgIHVuaW9uIGlydGVfcHRyIGVudHJ5Owo+ICAgICAgdTE2IHJlcV9pZCwgYWxpYXNfaWQ7
Cj4gLSAgICB1OCBkZWxpdmVyeV9tb2RlLCBkZXN0LCB2ZWN0b3IsIGRlc3RfbW9kZTsKPiArICAg
IHVpbnQ4X3QgZGVsaXZlcnlfbW9kZSwgdmVjdG9yLCBkZXN0X21vZGU7CgpGb3IgdGhlIGlvYXBp
YyB2ZXJzaW9uLCB5b3UgdXNlZCB1bnNpZ25lZCBpbnQsIHJhdGhlciB0aGFuIHVpbnQ4X3QuwqAg
SSdkCmV4cGVjdCB0aGVtIHRvIGF0IGxlYXN0IGJlIGNvbnNpc3RlbnQuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
