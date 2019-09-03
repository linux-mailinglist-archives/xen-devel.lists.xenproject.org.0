Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319ECA68AE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:37:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i580n-0006Cl-O3; Tue, 03 Sep 2019 12:34:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dlnz=W6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i580n-0006Cb-4D
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:34:17 +0000
X-Inumbo-ID: 2436fd06-ce47-11e9-ab93-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2436fd06-ce47-11e9-ab93-12813bfff9fa;
 Tue, 03 Sep 2019 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567514056;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=csWDgcNxuZRdHSQahQfdtlW1rLJ9nQEXU+nATGA/IZg=;
 b=N2k/wV3ViuTc5tL1UvbsmDK9I2yb1ujxS50OYMsSpkrPOX16TkwTUKnJ
 CDcKSq3yk1zC5oj8Wuah57ue42amjWC1XbotdAw9lWZenVfP4YZp4WR+m
 FVcwhipTpQS5w26uidtYAGye4bIAVZs6vUoLSLMGjpoBbZiQaGsncP/c9 w=;
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
IronPort-SDR: 3V39GXK1iLDvk5RQf0RRKttEK6Qpd9I8QJ5VUqyky+0KtvEYmfe2J5r1aCezxPJ6Ijv651+6qY
 uDRrGtFrhtB/8/eqKaE/r9bSUIytBHPSvCcuXqJNXVIzBAQ0M/vlGemoubyNkFFB3Gom7wMooA
 7w2H5ZgnKoYPhVXgS78Rt8CTIXRVjccA1IxDtfMqJW0zQtf2uTE64Gt7/djrYoEBi8uL2/V+BS
 lVngu/S+qVD/cCYnYkXm8Ckkyf/ArmDWBJmRTTTNXHye93832Ay2yAtjzHWXWUwECAUQGkvekR
 CK0=
X-SBRS: 2.7
X-MesageID: 5103637
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5103637"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <1fc41c75-7e6d-5a34-c500-8f769e4374bb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c0e34ad1-746b-6520-2d6a-f069e3107755@citrix.com>
Date: Tue, 3 Sep 2019 13:34:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1fc41c75-7e6d-5a34-c500-8f769e4374bb@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 7/8] x86emul: support RDPRU
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
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDkvMjAxOSAxMDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgdGhlIFBNIGRv
ZXNuJ3Qgc2F5IHNvLCB0aGlzIGFzc3VtZXMgdGhhdCB0aGUgTVBFUkYgdmFsdWUgcmVhZCB0aGlz
Cj4gd2F5IGdldHMgc2NhbGVkIHNpbWlsYXJseSB0byBpdHMgcmVhZGluZyB0aHJvdWdoIFJETVNS
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRo
aXMgd2FudHMgdGhlIGZvbGxvd2luZyBodW5rcyBtZXJnZWQsIHRvIGF0IGxlYXN0IGtlZXAgdGhl
CmludGVyY2VwdC9leGl0IGNvZGVzIHVwIHRvIGRhdGUuICBUaGlzIGlzIGZyb20gbXkgYWx0ZXJu
YXRpdmUgc2VyaWVzCndoaWNoIGludGVyY2VwdGVkIGFuZCB0ZXJtaW5hdGVkIFJEUFJVIHdpdGgg
I1VELgoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNiLmgKYi94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vdm1jYi5oCmluZGV4IDVjNzEwMjg2ZjcuLjJiZjBk
NTBmNmQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNiLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaApAQCAtNzYsNyArNzYsOCBAQCBl
bnVtIEdlbmVyaWNJbnRlcmNlcHQyYml0cwogICAgIEdFTkVSQUwyX0lOVEVSQ0VQVF9NT05JVE9S
ID0gMSA8PCAxMCwKICAgICBHRU5FUkFMMl9JTlRFUkNFUFRfTVdBSVQgICA9IDEgPDwgMTEsCiAg
ICAgR0VORVJBTDJfSU5URVJDRVBUX01XQUlUX0NPTkRJVElPTkFMID0gMSA8PCAxMiwKLSAgICBH
RU5FUkFMMl9JTlRFUkNFUFRfWFNFVEJWICA9IDEgPDwgMTMKKyAgICBHRU5FUkFMMl9JTlRFUkNF
UFRfWFNFVEJWICA9IDEgPDwgMTMsCisgICAgR0VORVJBTDJfSU5URVJDRVBUX1JEUFJVICAgPSAx
IDw8IDE0LAogfTsKCgpAQCAtMzAwLDYgKzMwMSw3IEBAIGVudW0gVk1FWElUX0VYSVRDT0RFCiAg
ICAgVk1FWElUX01XQUlUICAgICAgICAgICAgPSAxMzksIC8qIDB4OGIgKi8KICAgICBWTUVYSVRf
TVdBSVRfQ09ORElUSU9OQUw9IDE0MCwgLyogMHg4YyAqLwogICAgIFZNRVhJVF9YU0VUQlYgICAg
ICAgICAgID0gMTQxLCAvKiAweDhkICovCisgICAgVk1FWElUX1JEUFJVICAgICAgICAgICAgPSAx
NDIsIC8qIDB4OGUgKi8KICAgICBWTUVYSVRfTlBGICAgICAgICAgICAgICA9IDEwMjQsIC8qIDB4
NDAwLCBuZXN0ZWQgcGFnaW5nIGZhdWx0ICovCiAgICAgVk1FWElUX0lOVkFMSUQgICAgICAgICAg
PSAgLTEKIH07CgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1aWQuYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9jcHVpZC5jCj4gQEAgLTU0NSw2ICs1NDUsMTEgQEAgdm9pZCByZWNhbGN1bGF0ZV9jcHVp
ZF9wb2xpY3koc3RydWN0IGRvbQo+ICAKPiAgICAgIHAtPmV4dGQubWF4bGluYWRkciA9IHAtPmV4
dGQubG0gPyA0OCA6IDMyOwo+ICAKPiArICAgIGlmICggcC0+ZXh0ZC5yZHBydSApCj4gKyAgICAg
ICAgcC0+ZXh0ZC5yZHBydV9tYXggPSBtaW4ocC0+ZXh0ZC5yZHBydV9tYXgsIG1heC0+ZXh0ZC5y
ZHBydV9tYXgpOwo+ICsgICAgZWxzZQo+ICsgICAgICAgIHAtPmV4dGQucmRwcnVfbWF4ID0gMDsK
PiArCj4gICAgICByZWNhbGN1bGF0ZV94c3RhdGUocCk7Cj4gICAgICByZWNhbGN1bGF0ZV9taXNj
KHApOwoKVGhlIENQVUlEIGxvZ2ljIG5lZWRzIHF1aXRlIGEgYml0IG1vcmUgdGhhbiB0aGlzLCBh
bmQgdG8gYmUgc2FmZSBvbgptaWdyYXRlLiAgRm9yIG9uZSwgcmVjYWxjdWxhdGVfeHN0YXRlKCkg
dW5pbGF0ZXJhbGx5IGNsb2JiZXJzIHRoaXMgdG8gMC4KClNoYWxsIEkgZG8gYSBwcmVwIHBhdGNo
IGdldHRpbmcgdGhlIENQVUlEIHNpZGUgb2YgdGhpbmdzIGluIG9yZGVyPwoKPiAgCj4gLS0tIGEv
eGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiArKysgYi94ZW4vYXJjaC94
ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+IEBAIC01NjcwLDYgKzU2NzEsNTIgQEAgeDg2
X2VtdWxhdGUoCj4gICAgICAgICAgICAgICAgICBsaW1pdCAtPSBzaXplb2YoemVybyk7Cj4gICAg
ICAgICAgICAgIH0KPiAgICAgICAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAgICAgIGNhc2UgMHhm
ZDogLyogcmRwcnUgKi8KPiArICAgICAgICAgICAgdmNwdV9tdXN0X2hhdmUocmRwcnUpOwo+ICsK
PiArICAgICAgICAgICAgaWYgKCAhbW9kZV9yaW5nMCgpICkKPiArICAgICAgICAgICAgewo+ICsg
ICAgICAgICAgICAgICAgZmFpbF9pZighb3BzLT5yZWFkX2NyKTsKPiArICAgICAgICAgICAgICAg
IGlmICggKHJjID0gb3BzLT5yZWFkX2NyKDQsICZjcjQsIGN0eHQpKSAhPSBYODZFTVVMX09LQVkg
KQo+ICsgICAgICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiArICAgICAgICAgICAgICAgIGdl
bmVyYXRlX2V4Y2VwdGlvbl9pZihjcjQgJiBYODZfQ1I0X1RTRCwgRVhDX1VEKTsKPiArICAgICAg
ICAgICAgfQo+ICsKPiArICAgICAgICAgICAgc3dpdGNoICggX3JlZ3MuZWN4ICkKPiArICAgICAg
ICAgICAgewo+ICsgICAgICAgICAgICBjYXNlIDA6ICBuID0gTVNSX0lBMzJfTVBFUkY7IGJyZWFr
Owo+ICsgICAgICAgICAgICBjYXNlIDE6ICBuID0gTVNSX0lBMzJfQVBFUkY7IGJyZWFrOwo+ICsg
ICAgICAgICAgICBkZWZhdWx0OiBuID0gMDsgYnJlYWs7Cj4gKyAgICAgICAgICAgIH0KPiArICAg
ICAgICAgICAgaWYgKCBfcmVncy5lY3ggPiBjdHh0LT5jcHVpZC0+ZXh0ZC5yZHBydV9tYXggKQo+
ICsgICAgICAgICAgICAgICAgbiA9IDA7CgpUaGlzIGNhbiBiZSBmb2xkZWQgaW50byB0aGUgc3dp
dGNoIHN0YXRlbWVudC4gIFNvbWV0aGluZyBsaWtlICgKX3JlZ3MuZWN4IHwgLShfcmVncy5lY3gg
PiBjdHh0LT5jcHVpZC0+ZXh0ZC5yZHBydV9tYXgpICkKCkFsc28sIHRoZSBzZW50aW5lbCBtaWdo
dCBiZXR0ZXIgYmUgLTEsIHdoaWNoIGlzIG5vdCBpbiBhIGRlZmluZWQgTVNSCmJsb2NrLiAgTVNS
IDAgaXMgYSBQNS1jb21wYXQgTUNFIE1TUiwgZXZlbiBvbiBBTUQgaGFyZHdhcmUuCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
