Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD31073BD
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 14:57:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY9PM-00008D-Lq; Fri, 22 Nov 2019 13:55:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cGBV=ZO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iY9PL-00007s-AP
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 13:55:35 +0000
X-Inumbo-ID: c0c51bea-0d2f-11ea-b678-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0c51bea-0d2f-11ea-b678-bc764e2007e4;
 Fri, 22 Nov 2019 13:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574430935;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EsUVMTt8S2ZsyVibsnVnP/LhqvWcA1u2u+oX9AUF2Vk=;
 b=PnzlyO/gBrxr0/G/xBdb5xJYyJ8gUeEyCsI9HUEZ7dwBiWalJRiMP7Sq
 JNqtPB3obs0rSqWzPAukz+NM88y1EgLsGYILAMvt+WG1d+eesnbJQ38/j
 e83leP/O5LtfsFngVjMYaqLLovxYe7THteqie1dWx2KCwzNktwv3XuCmA Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P1v6X5cBVTtX1FNzGcqVuhkDEVlSre/dJ6gWYfdGhSytXcCtppt9m4xpfOiAv7P9ZyMjIj5+Ug
 4hOOEBJ3Jf59qy3JS3da5A6RhytNcohv9GUW0oAlLlmr9sUkLmPQJM55rfOJMipmUoyIwx5vHp
 rJj2k4k3xpPogaI8U+xTr2W3PUE/RAysDtTOsII37iynHB3vT0wJiJyl1jnNIArKmYT0uj7q9D
 /KKayIgL00V1zUxt0OVAMKD95L8MGFzi37VgPSNsfAwPXrmjwmL0QphHYqCcXMP6ZS4mfA0fk1
 nY0=
X-SBRS: 2.7
X-MesageID: 8705192
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="8705192"
To: Jan Beulich <jbeulich@suse.com>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-3-andrew.cooper3@citrix.com>
 <e2fe7f81-2852-dc74-d4b8-b990c186f1cf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c60b3c89-5617-caa4-3ca8-4648c378c2f6@citrix.com>
Date: Fri, 22 Nov 2019 13:55:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e2fe7f81-2852-dc74-d4b8-b990c186f1cf@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/svm: Write the correct %eip into
 the outgoing task
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMTEvMjAxOSAxMzozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjEuMTEuMjAxOSAy
MzoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0v
ZW11bGF0ZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL2VtdWxhdGUuYwo+PiBAQCAt
MTE3LDYgKzExNyw2MSBAQCB1bnNpZ25lZCBpbnQgc3ZtX2dldF9pbnNuX2xlbihzdHJ1Y3QgdmNw
dSAqdiwgdW5zaWduZWQgaW50IGluc3RyX2VuYykKPj4gIH0KPj4gIAo+PiAgLyoKPj4gKyAqIFRB
U0tfU1dJVENIIHZtZXhpdHMgbmV2ZXIgcHJvdmlkZSBhbiBpbnN0cnVjdGlvbiBsZW5ndGguICBX
ZSBtdXN0IGFsd2F5cwo+PiArICogZGVjb2RlIHVuZGVyICVyaXAgdG8gZmluZCB0aGUgYW5zd2Vy
Lgo+PiArICovCj4+ICt1bnNpZ25lZCBpbnQgc3ZtX2dldF90YXNrX3N3aXRjaF9pbnNuX2xlbihz
dHJ1Y3QgdmNwdSAqdikKPj4gK3sKPj4gKyAgICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCBjdHh0
Owo+PiArICAgIHN0cnVjdCB4ODZfZW11bGF0ZV9zdGF0ZSAqc3RhdGU7Cj4+ICsgICAgdW5zaWdu
ZWQgaW50IGVtdWxfbGVuLCBtb2RybV9yZWc7Cj4+ICsKPj4gKyAgICBBU1NFUlQodiA9PSBjdXJy
ZW50KTsKPiBZb3UgbG9vayB0byBiZSB1c2luZyB2IGhlcmUganVzdCBmb3IgdGhpcyBBU1NFUlQo
KSAtIGlzIHRoaXMgcmVhbGx5Cj4gd29ydGggaXQ/IEJ5IG1ha2luZyB0aGUgZnVuY3Rpb24gdGFr
ZSAidm9pZCIgaXQgd291bGQgYmUgcXVpdGUgb2J2aW91cwo+IHRoYXQgaXQgd291bGQgYWN0IG9u
IHRoZSBjdXJyZW50IHZDUFUgb25seS4KClRoaXMgd2FzIGNyaWJiZWQgbGFyZ2VseSBmcm9tIHN2
bV9nZXRfaW5zbl9sZW4oKSwgd2hpY2ggYWxzbyBiZWhhdmVzIHRoZQpzYW1lLgoKPgo+PiArICAg
IGh2bV9lbXVsYXRlX2luaXRfb25jZSgmY3R4dCwgTlVMTCwgZ3Vlc3RfY3B1X3VzZXJfcmVncygp
KTsKPj4gKyAgICBodm1fZW11bGF0ZV9pbml0X3Blcl9pbnNuKCZjdHh0LCBOVUxMLCAwKTsKPj4g
KyAgICBzdGF0ZSA9IHg4Nl9kZWNvZGVfaW5zbigmY3R4dC5jdHh0LCBodm1lbXVsX2luc25fZmV0
Y2gpOwo+PiArICAgIGlmICggSVNfRVJSX09SX05VTEwoc3RhdGUpICkKPj4gKyAgICAgICAgcmV0
dXJuIDA7Cj4+ICsKPj4gKyAgICBlbXVsX2xlbiA9IHg4Nl9pbnNuX2xlbmd0aChzdGF0ZSwgJmN0
eHQuY3R4dCk7Cj4+ICsKPj4gKyAgICAvKgo+PiArICAgICAqIENoZWNrIGZvciBhbiBpbnN0cnVj
dGlvbiB3aGljaCBjYW4gY2F1c2UgYSB0YXNrIHN3aXRjaC4gIEFueSBmYXIKPj4gKyAgICAgKiBq
bXAvY2FsbC9yZXQsIGFueSBzb2Z0d2FyZSBpbnRlcnJ1cHQvZXhjZXB0aW9uLCBhbmQgaXJldC4K
Pj4gKyAgICAgKi8KPj4gKyAgICBzd2l0Y2ggKCBjdHh0LmN0eHQub3Bjb2RlICkKPj4gKyAgICB7
Cj4+ICsgICAgY2FzZSAweGZmOiAvKiBHcnAgNSAqLwo+PiArICAgICAgICAvKiBjYWxsIC8gam1w
IChmYXIsIGFic29sdXRlIGluZGlyZWN0KSAqLwo+PiArICAgICAgICBpZiAoIHg4Nl9pbnNuX21v
ZHJtKHN0YXRlLCBOVUxMLCAmbW9kcm1fcmVnKSAhPSAzIHx8Cj4gRFlNICI9PSAzIiwgdG8gYmFp
bCB1cG9uIG5vbi1tZW1vcnkgb3BlcmFuZHM/CgpBaCB5ZXMgKGFuZCB0aGlzIGRlbW9uc3RyYXRl
cyB0aGF0IEkgcmVhbGx5IG5lZWQgdG8gZ2V0IGFuIFhURiB0ZXN0ZWQKc29ydGVkIHNvb24uKQoK
Pgo+PiArICAgICAgICAgICAgIChtb2RybV9yZWcgIT0gMyAmJiBtb2RybV9yZWcgIT0gNSkgKQo+
PiArICAgICAgICB7Cj4+ICsgICAgICAgICAgICAvKiBXcm9uZyBpbnN0cnVjdGlvbi4gIFRocm93
ICNHUCBiYWNrIGZvciBub3cuICovCj4+ICsgICAgZGVmYXVsdDoKPj4gKyAgICAgICAgICAgIGh2
bV9pbmplY3RfaHdfZXhjZXB0aW9uKFRSQVBfZ3BfZmF1bHQsIDApOwo+PiArICAgICAgICAgICAg
ZW11bF9sZW4gPSAwOwo+PiArICAgICAgICAgICAgYnJlYWs7Cj4+ICsgICAgICAgIH0KPj4gKyAg
ICAgICAgLyogRmFsbHRocm91Z2ggKi8KPj4gKyAgICBjYXNlIDB4NjI6IC8qIGJvdW5kICovCj4g
RG9lcyAiYm91bmQiIHJlYWxseSBiZWxvbmcgb24gdGhpcyBsaXN0PyBJdCByYWlzaW5nICNCUiBp
cyBsaWtlCj4gaW5zbnMgcmFpc2luZyByYW5kb20gb3RoZXIgZXhjZXB0aW9ucywgbm90IGxpa2Ug
SU5UTyAvIElOVDMsCj4gd2hlcmUgdGhlIElEVCBkZXNjcmlwdG9yIGFsc28gaGFzIHRvIGhhdmUg
c3VpdGFibGUgRFBMIGZvciB0aGUKPiBleGNlcHRpb24gdG8gYWN0dWFsbHkgZ2V0IGRlbGl2ZXJl
ZCAocmF0aGVyIHRoYW4gI0dQKS4gSS5lLiBpdAo+IHNob3VsZG4ndCBtYWtlIGl0IGhlcmUgaW4g
dGhlIGZpcnN0IHBsYWNlLCBkdWUgdG8gdGhlCj4gWDg2X0VWRU5UVFlQRV9IV19FWENFUFRJT04g
Y2hlY2sgaW4gdGhlIGNhbGxlci4KPgo+IElPVyBpZiAiYm91bmQiIG5lZWRzIHRvIGJlIGhlcmUs
IHRoZW4gYWxsIG90aGVycyBuZWVkIHRvIGJlIGFzCj4gd2VsbCwgdW5sZXNzIHRoZXkgY2FuJ3Qg
Y2F1c2UgYW55IGV4Y2VwdGlvbiBhdCBhbGwuCgpNb3JlIGV4cGVyaW1lbnRhdGlvbiByZXF1aXJl
ZC7CoCBCT1VORCBkb2Vzbid0IGFwcGVhciB0byBiZSBzcGVjaWFsIGNhc2VkCmJ5IFNWTSwgYnV0
IGlzIGJ5IFZULXguwqAgVlQteCBob3dldmVyIGRvZXMgdGhyb3cgaXQgaW4gdGhlIHNhbWUgY2F0
ZWdvcnkKYXMgI1VELCBhbmQgaWRlbnRpZnkgaXQgdG8gYmUgYSBoYXJkd2FyZSBleGNlcHRpb24u
CgpJIHN1c3BlY3QgeW91IGFyZSByaWdodCwgYW5kIHQgZG9lc24ndCB3YW50IHRvIGJlIGhlcmUu
Cgo+PiArICAgIGNhc2UgMHg5YTogLyogY2FsbCAoZmFyLCBhYnNvbHV0ZSkgKi8KPj4gKyAgICBj
YXNlIDB4Y2E6IC8qIHJldCBpbW0xNiAoZmFyKSAqLwo+PiArICAgIGNhc2UgMHhjYjogLyogcmV0
IChmYXIpICovCj4+ICsgICAgY2FzZSAweGNjOiAvKiBpbnQzICovCj4+ICsgICAgY2FzZSAweGNk
OiAvKiBpbnQgaW1tOCAqLwo+PiArICAgIGNhc2UgMHhjZTogLyogaW50byAqLwo+PiArICAgIGNh
c2UgMHhjZjogLyogaXJldCAqLwo+PiArICAgIGNhc2UgMHhlYTogLyogam1wIChmYXIsIGFic29s
dXRlKSAqLwo+PiArICAgIGNhc2UgMHhmMTogLyogaWNlYnAgKi8KPiBTYW1lIHBlcmhhcHMgZm9y
IElDRUJQLCBhbGJlaXQgSSdtIGxlc3MgY2VydGFpbiBoZXJlLCBhcyBpdHMKPiBiZWhhdmlvciBp
cyB0b28gcG9vcmx5IGRvY3VtZW50ZWQgKGlmIGF0IGFsbCkuCgpJQ0VCUCdzICNEQiBpcyBhIHRy
YXAsIG5vdCBhIGZhdWx0LCBzbyBpbnN0cnVjdGlvbiBsZW5ndGggaXMgaW1wb3J0YW50LgoKPgo+
PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL3N2bS9zdm0uYwo+PiBAQCAtMjc3Niw3ICsyNzc2LDQxIEBAIHZvaWQgc3ZtX3ZtZXhpdF9o
YW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+PiAgCj4+ICAgICAgY2FzZSBWTUVY
SVRfVEFTS19TV0lUQ0g6IHsKPj4gICAgICAgICAgZW51bSBodm1fdGFza19zd2l0Y2hfcmVhc29u
IHJlYXNvbjsKPj4gLSAgICAgICAgaW50MzJfdCBlcnJjb2RlID0gLTE7Cj4+ICsgICAgICAgIGlu
dDMyX3QgZXJyY29kZSA9IC0xLCBpbnNuX2xlbiA9IC0xOwo+PiArCj4+ICsgICAgICAgIC8qCj4+
ICsgICAgICAgICAqIEFsbCBUQVNLX1NXSVRDSCBpbnRlcmNlcHRzIGhhdmUgZmF1bHQtbGlrZSBz
ZW1hbnRpY3MuICBOUklQIGlzCj4+ICsgICAgICAgICAqIG5ldmVyIHByb3ZpZGVkLCBldmVuIGZv
ciBpbnN0cnVjdGlvbi1pbmR1Y2VkIHRhc2sgc3dpdGNoZXMsIGJ1dCB3ZQo+PiArICAgICAgICAg
KiBuZWVkIHRvIGtub3cgdGhlIGluc3RydWN0aW9uIGxlbmd0aCBpbiBvcmRlciB0byBzZXQgJWVp
cCBzdWl0YWJseQo+PiArICAgICAgICAgKiBpbiB0aGUgb3V0Z29pbmcgVFNTLgo+PiArICAgICAg
ICAgKgo+PiArICAgICAgICAgKiBGb3IgYSB0YXNrIHN3aXRjaCB3aGljaCB2ZWN0b3JlZCB0aHJv
dWdoIHRoZSBJRFQsIGxvb2sgYXQgdGhlIHR5cGUKPj4gKyAgICAgICAgICogdG8gZGlzdGluZ3Vp
c2ggaW50ZXJydXB0cy9leGNlcHRpb25zIGZyb20gaW5zdHJ1Y3Rpb24gYmFzZWQKPj4gKyAgICAg
ICAgICogc3dpdGNoZXMuCj4+ICsgICAgICAgICAqLwo+PiArICAgICAgICBpZiAoIHZtY2ItPmV2
ZW50aW5qLmZpZWxkcy52ICkKPj4gKyAgICAgICAgewo+PiArICAgICAgICAgICAgLyoKPj4gKyAg
ICAgICAgICAgICAqIEhXX0VYQ0VQVElPTiwgTk1JIGFuZCBFWFRfSU5UUiBhcmUgbm90IGluc3Ry
dWN0aW9uIGJhc2VkLiAgQWxsCj4+ICsgICAgICAgICAgICAgKiBvdGhlcnMgYXJlLgo+PiArICAg
ICAgICAgICAgICovCj4+ICsgICAgICAgICAgICBpZiAoIHZtY2ItPmV2ZW50aW5qLmZpZWxkcy50
eXBlIDw9IFg4Nl9FVkVOVFRZUEVfSFdfRVhDRVBUSU9OICkKPj4gKyAgICAgICAgICAgICAgICBp
bnNuX2xlbiA9IDA7Cj4+ICsKPj4gKyAgICAgICAgICAgIC8qCj4+ICsgICAgICAgICAgICAgKiBD
bG9iYmVyIHRoZSB2ZWN0b3JpbmcgaW5mb3JtYXRpb24sIGFzIHdlIGFyZSBnb2luZyB0byBlbXVs
YXRlCj4+ICsgICAgICAgICAgICAgKiB0aGUgdGFzayBzd2l0Y2ggaW4gZnVsbC4KPj4gKyAgICAg
ICAgICAgICAqLwo+PiArICAgICAgICAgICAgdm1jYi0+ZXZlbnRpbmouYnl0ZXMgPSAwOwo+PiAr
ICAgICAgICB9Cj4+ICsKPj4gKyAgICAgICAgLyoKPj4gKyAgICAgICAgICogaW5zbl9sZW4gYmVp
bmcgLTEgaW5kaWNhdGVzIHRoYXQgd2UgaGF2ZSBhbiBpbnN0cnVjdGlvbi1pbmR1Y2VkCj4+ICsg
ICAgICAgICAqIHRhc2sgc3dpdGNoLiAgRGVjb2RlIHVuZGVyICVyaXAgdG8gZmluZCBpdHMgbGVu
Z3RoLgo+PiArICAgICAgICAgKi8KPj4gKyAgICAgICAgaWYgKCBpbnNuX2xlbiA8IDAgJiYgKGlu
c25fbGVuID0gc3ZtX2dldF90YXNrX3N3aXRjaF9pbnNuX2xlbih2KSkgPT0gMCApCj4+ICsgICAg
ICAgICAgICBicmVhazsKPiBXb24ndCB0aGlzIGxpdmUtbG9jayB0aGUgZ3Vlc3Q/CgpQb3RlbnRp
YWxseSwgeWVzLgoKPiBJLmUuIGlzbid0IGl0IGJldHRlciB0byBlLmcuIGNyYXNoIGl0Cj4gaWYg
c3ZtX2dldF90YXNrX3N3aXRjaF9pbnNuX2xlbigpIGRpZG4ndCByYWlzZSAjR1AoMCk/CgpObyAt
IHRoYXQgd291bGQgbmVlZCBhbmQgWFNBIGlmIHdlIGdvdCBpdCB3cm9uZywgYXMgbm9uZSBvZiB0
aGVzZSBhcmUKcHJpdmlsZWdlZCBpbnN0cnVjdGlvbi4KCkhvd2V2ZXIsIGl0IG9jY3VycyB0byBt
ZSB0aGF0IHdlIGFyZSBpbiBhIHBvc2l0aW9uIHRvIHVzZQpzdm1fY3Jhc2hfb3JfZmF1bHQoKSwg
c28gSSdsbCByZXNwaW4gd2l0aCB0aGF0IGluIG1pbmQuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
