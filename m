Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10EF18B3A
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 16:06:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOjeq-0008Bc-Pz; Thu, 09 May 2019 14:04:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hAXO=TJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hOjep-0008BX-1x
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 14:04:23 +0000
X-Inumbo-ID: 56dee61e-7263-11e9-83ee-378223138b83
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56dee61e-7263-11e9-83ee-378223138b83;
 Thu, 09 May 2019 14:04:20 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: JMpQM32534b8MMq6FfUVXm1k8Q5GonKR3ugQZH1JBQB93lSG5uk94Uf5yE9YrtGUqqbsI4ZIM2
 nJnIIwm8NLditMz4zpTpCvBsiiUDSpRtVAIbQSsrLSfW6ddcn4rSg0gSQsX6ew3KwwfotWtszn
 OdIDjCex+usIzJqikNABwjbBQXOTQ/rUOGcORKsh42BRzPMirZ7i8QEDMMWXrWFD2EZHIFKl5h
 J2fDO8qw4FNC+++R/lM4VKtVnYDo4lrVloo5Vt30U9qfWhnbyV2BhMSgc00XoH0OMHwidHJVm8
 Eek=
X-SBRS: 2.7
X-MesageID: 248666
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,450,1549947600"; 
   d="scan'208";a="248666"
To: Jan Beulich <JBeulich@suse.com>
References: <5CD41EA1020000780022D25D@prv1-mh.provo.novell.com>
 <ab00c7c5-4b1d-f608-e531-5c9922fb2f23@citrix.com>
 <5CD42A36020000780022D2D5@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <93a05c18-eaac-baf7-bf13-7f6c49ee41b9@citrix.com>
Date: Thu, 9 May 2019 14:34:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD42A36020000780022D2D5@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] page-alloc: detect double free earlier
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDUvMjAxOSAxNDoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMDUuMTkg
YXQgMTQ6NTAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMDkvMDUv
MjAxOSAxMzozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBSaWdodCBub3cgdGhpcyBnb2VzIHVu
bm90aWNlZCB1bnRpbCBzb21lIHN1YnNlcXVlbnQgcGFnZSBhbGxvY2F0b3IKPj4+IG9wZXJhdGlv
biBzdHVtYmxlcyBhY3Jvc3MgdGhlIHRodXMgY29ycnVwdGVkIGxpc3QuIFdlIGNhbiBkbyBiZXR0
ZXI6Cj4+PiBPbmx5IFBHQ19zdGF0ZV9pbnVzZSBhbmQgUEdDX3N0YXRlX29mZmxpbmluZyBwYWdl
cyBjYW4gbGVnaXRpbWF0ZWx5IGJlCj4+PiBwYXNzZWQgdG8gZnJlZV9oZWFwX3BhZ2VzKCkuCj4+
Pgo+Pj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gcmVzdHJpY3QgdGhlIFBHQ19icm9r
ZW4gY2hlY2sgdG8gdGhlCj4+PiBQR0Nfc3RhdGVfb2ZmbGluaW5nIGNhc2UsIGFzIG9ubHkgcGFn
ZXMgb2YgdGhhdCB0eXBlIG9yCj4+PiBQR0Nfc3RhdGVfb2ZmbGluZWQgbWF5IGhhdmUgdGhpcyBm
bGFnIHNldCBvbiB0aGVtLiBTaW1pbGFybHksIHNpbmNlCj4+PiBQR0Nfc3RhdGVfb2ZmbGluZWQg
aXMgbm90IGEgdmFsaWQgaW5wdXQgc3RhdGUsIHRoZSBzZXR0aW5nIG9mICJ0YWludGVkIgo+Pj4g
Y2FuIGJlIHJlc3RyaWN0ZWQgdG8ganVzdCB0aGlzIGNhc2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBBY2tlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4sIHdpdGggYSBzdWdnZXN0aW9uLgo+IFRo
YW5rcy4KPgo+Pj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4+ICsrKyBiL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCj4+PiBAQCAtMTQwOSwxMyArMTQwOSwyMiBAQCBzdGF0aWMgdm9p
ZCBmcmVlX2hlYXBfcGFnZXMoCj4+PiAgICAgICAgICAgKiAgICAgaW4gaXRzIHBzZXVkb3BoeXNp
Y2FsIGFkZHJlc3Mgc3BhY2UpLgo+Pj4gICAgICAgICAgICogSW4gYWxsIHRoZSBhYm92ZSBjYXNl
cyB0aGVyZSBjYW4gYmUgbm8gZ3Vlc3QgbWFwcGluZ3Mgb2YgdGhpcyBwYWdlLgo+Pj4gICAgICAg
ICAgICovCj4+PiAtICAgICAgICBBU1NFUlQoIXBhZ2Vfc3RhdGVfaXMoJnBnW2ldLCBvZmZsaW5l
ZCkpOwo+Pj4gLSAgICAgICAgcGdbaV0uY291bnRfaW5mbyA9Cj4+PiAtICAgICAgICAgICAgKChw
Z1tpXS5jb3VudF9pbmZvICYgUEdDX2Jyb2tlbikgfAo+Pj4gLSAgICAgICAgICAgICAocGFnZV9z
dGF0ZV9pcygmcGdbaV0sIG9mZmxpbmluZykKPj4+IC0gICAgICAgICAgICAgID8gUEdDX3N0YXRl
X29mZmxpbmVkIDogUEdDX3N0YXRlX2ZyZWUpKTsKPj4+IC0gICAgICAgIGlmICggcGFnZV9zdGF0
ZV9pcygmcGdbaV0sIG9mZmxpbmVkKSApCj4+PiArICAgICAgICBzd2l0Y2ggKCBwZ1tpXS5jb3Vu
dF9pbmZvICYgUEdDX3N0YXRlICkKPj4+ICsgICAgICAgIHsKPj4+ICsgICAgICAgIGNhc2UgUEdD
X3N0YXRlX2ludXNlOgo+Pj4gKyAgICAgICAgICAgIEJVR19PTihwZ1tpXS5jb3VudF9pbmZvICYg
UEdDX2Jyb2tlbik7Cj4+PiArICAgICAgICAgICAgcGdbaV0uY291bnRfaW5mbyA9IFBHQ19zdGF0
ZV9mcmVlOwo+Pj4gKyAgICAgICAgICAgIGJyZWFrOwo+Pj4gKwo+Pj4gKyAgICAgICAgY2FzZSBQ
R0Nfc3RhdGVfb2ZmbGluaW5nOgo+Pj4gKyAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8gPSAo
cGdbaV0uY291bnRfaW5mbyAmIFBHQ19icm9rZW4pIHwKPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUEdDX3N0YXRlX29mZmxpbmVkOwo+Pj4gICAgICAgICAgICAgIHRhaW50ZWQg
PSAxOwo+Pj4gKyAgICAgICAgICAgIGJyZWFrOwo+Pj4gKwo+Pj4gKyAgICAgICAgZGVmYXVsdDoK
Pj4gR2l2ZW4gdGhhdCB0aGlzIGlzIGEgZnVsbHkgZmF0YWwgY29uZGl0aW9uLCBpdCB3b3VsZCBi
ZSBoZWxwZnVsIHRvIGF0Cj4+IGxlYXN0IHByaW50IHRoZSBzdGF0ZSB3ZSBmb3VuZCBoZXJlLiAg
Rm9yIGNhc2VzIG90aGVyIHRoYW4KPj4gUEdDX3N0YXRlX2ZyZWUsIGl0IHdvdWxkIHByb2JhYmx5
IGJlIGEgdmVyeSB1c2VmdWwgcGllY2Ugb2YgaW5mb3JtYXRpb24KPj4gZm9yIGRpYWdub3Npbmcg
d2hhdCB3ZW50IHdyb25nLgo+IEZ1bm55IHlvdSBzaG91bGQgc2F5IHRoaXMgLSBJIGhhdmUgdGhl
IGRlYnVnZ2luZyBwYXRjaCBiZWxvdyBvbiB0b3AKPiBpbiBteSB0cmVlLiBJIGNvdWxkIGVhc2ls
eSBzdWJtaXQgdGhpcyBhcyBhIHN0YW5kYWxvbmUgZm9sbG93LW9uIHBhdGNoLgoKVEJILCBJIHRo
aW5rIGl0IHdvdWxkIGJlIGZpbmUgZm9sZGVkIGluLCBhbHRob3VnaCB3aXRoLi4uCgo+Cj4gSmFu
Cj4KPiAtLS0gdW5zdGFibGUub3JpZy94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+ICsrKyB1bnN0
YWJsZS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+IEBAIC0xMDE0LDcgKzEwMTQsMTQgQEAgc3Rh
dGljIHN0cnVjdCBwYWdlX2luZm8gKmFsbG9jX2hlYXBfcGFnZQo+ICAgICAgZm9yICggaSA9IDA7
IGkgPCAoMSA8PCBvcmRlcik7IGkrKyApCj4gICAgICB7Cj4gICAgICAgICAgLyogUmVmZXJlbmNl
IGNvdW50IG11c3QgY29udGludW91c2x5IGJlIHplcm8gZm9yIGZyZWUgcGFnZXMuICovCj4gLSAg
ICAgICAgQlVHX09OKChwZ1tpXS5jb3VudF9pbmZvICYgflBHQ19uZWVkX3NjcnViKSAhPSBQR0Nf
c3RhdGVfZnJlZSk7Cj4gKyAgICAgICAgaWYgKCAocGdbaV0uY291bnRfaW5mbyAmIH5QR0NfbmVl
ZF9zY3J1YikgIT0gUEdDX3N0YXRlX2ZyZWUgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAg
cHJpbnRrKFhFTkxPR19FUlIgInBnWyV4XSBtPSVseCBjPSVseCBvPSV4IHY9JWx4IHQ9JXhcbiIs
CgoicGdbJXVdIG1mbiAlIlBSSW1mbiIgYz0lI2x4IG89JXUgdj0lI2x4IHQ9JSN4XG4iCgpzbyB3
ZSBkb24ndCBlbmQgdXAgcHJpbnRpbmcgbnVtYmVycyB3aGljaCBhcmUgYW1iaWd1b3VzIGJldHdl
ZW4gaGV4L2RlYy4KCldpdGggYXQgbGVhc3QgdGhlIGFtYmlndWl0eSByZW1vdmVkLCBteSBhY2sg
c3RhbmRzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
