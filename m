Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B767510DA0F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 20:18:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ialja-0006gE-Lm; Fri, 29 Nov 2019 19:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ialjY-0006g9-RL
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 19:15:16 +0000
X-Inumbo-ID: 92bb18aa-12dc-11ea-a3eb-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92bb18aa-12dc-11ea-a3eb-12813bfff9fa;
 Fri, 29 Nov 2019 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575054915;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Yo8EKInYI4TdOV4yK0azZj7xgbzijvBcnAwZmk9W76k=;
 b=gFRQ8wvjIwM8oTc5PsoUSHcIQcwE72NYvACpkgS/KzBO9CnhbHMj2TuC
 Xru+bx6p+esyU0J4dlpqNHYqPHsNALr4qbZVEWl1YZzjbAa2kQIk3BlUT
 EjxC4ZfVsDhITENGNHqTU8cz/IOIMaq/4uTOA2JqAWplrNFXoqbIji9bf k=;
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
IronPort-SDR: ehsAPFnZpE/q6SSkwS0feZ7tQhC6C2rTNnw6mzxiCrqF2bMpeHOmWqB0UwQmJp1IqDSFscR+S8
 +YBaH+/GHtvjLHv6g09eBx6irLbDw9gkGZ46Yoihza3ZeeaqJAKhwCTqjJXvn3XQoh9W1MdUCM
 fWyduamos8WK1bVhoP+rT7/BtoMhEw7YgrODGJywAo9EwhUfrnwvAUsc1fLw/XiHA1mFWqvuJf
 kb0fkzzs7voVLTafX1md61yUMfZVxsCdlKlaczbENWi+q4Y0TuvlTT4m/lAivvo9/qQ/CS9b8N
 sjw=
X-SBRS: 2.7
X-MesageID: 8990440
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,258,1571716800"; 
   d="scan'208";a="8990440"
To: "Durrant, Paul" <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cce7c12e-907b-bc1b-5092-a1d7874c099a@suse.com>
 <cd4349a30f2f4aa78813115aa9edc6aa@EX13D32EUC003.ant.amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <18bb7a19-9cbf-9245-9e22-414b4a51e32a@citrix.com>
Date: Fri, 29 Nov 2019 19:15:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cd4349a30f2f4aa78813115aa9edc6aa@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] gnttab: make sure grant map operations
 don't skip their IOMMU part
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMTEvMjAxOSAxMToyMiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gQEAgLTExNDQsMjcg
KzExNDAsMjIgQEAgbWFwX2dyYW50X3JlZigKPj4gICAgICBpZiAoIG5lZWRfaW9tbXUgKQo+PiAg
ICAgIHsKPj4gICAgICAgICAgdW5zaWduZWQgaW50IGtpbmQ7Cj4+IC0gICAgICAgIGludCBlcnIg
PSAwOwo+Pgo+PiAgICAgICAgICBkb3VibGVfZ3RfbG9jayhsZ3QsIHJndCk7Cj4+Cj4+IC0gICAg
ICAgIC8qIFdlJ3JlIG5vdCB0cmFuc2xhdGVkLCBzbyB3ZSBrbm93IHRoYXQgZ21mbnMgYW5kIG1m
bnMgYXJlCj4+IC0gICAgICAgICAgIHRoZSBzYW1lIHRoaW5ncywgc28gdGhlIElPTU1VIGVudHJ5
IGlzIGFsd2F5cyAxLXRvLTEuICovCj4+ICsgICAgICAgIC8qCj4+ICsgICAgICAgICAqIFdlJ3Jl
IG5vdCB0cmFuc2xhdGVkLCBzbyB3ZSBrbm93IHRoYXQgZGZucyBhbmQgbWZucyBhcmUKPj4gKyAg
ICAgICAgICogdGhlIHNhbWUgdGhpbmdzLCBzbyB0aGUgSU9NTVUgZW50cnkgaXMgYWx3YXlzIDEt
dG8tMS4KPj4gKyAgICAgICAgICovCj4+ICAgICAgICAgIGtpbmQgPSBtYXBraW5kKGxndCwgcmQs
IG1mbik7Cj4+IC0gICAgICAgIGlmICggKGFjdF9waW4gJiAoR05UUElOX2hzdHdfbWFza3xHTlRQ
SU5fZGV2d19tYXNrKSkgJiYKPj4gLSAgICAgICAgICAgICAhKG9sZF9waW4gJiAoR05UUElOX2hz
dHdfbWFza3xHTlRQSU5fZGV2d19tYXNrKSkgKQo+PiAtICAgICAgICB7Cj4+IC0gICAgICAgICAg
ICBpZiAoICEoa2luZCAmIE1BUEtJTkRfV1JJVEUpICkKPj4gLSAgICAgICAgICAgICAgICBlcnIg
PSBpb21tdV9sZWdhY3lfbWFwKGxkLCBfZGZuKG1mbl94KG1mbikpLCBtZm4sIDAsCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVUZfcmVhZGFibGUgfAo+PiBJ
T01NVUZfd3JpdGFibGUpOwo+PiAtICAgICAgICB9Cj4+IC0gICAgICAgIGVsc2UgaWYgKCBhY3Rf
cGluICYmICFvbGRfcGluICkKPj4gLSAgICAgICAgewo+PiAtICAgICAgICAgICAgaWYgKCAha2lu
ZCApCj4+IC0gICAgICAgICAgICAgICAgZXJyID0gaW9tbXVfbGVnYWN5X21hcChsZCwgX2Rmbiht
Zm5feChtZm4pKSwgbWZuLCAwLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgSU9NTVVGX3JlYWRhYmxlKTsKPj4gLSAgICAgICAgfQo+PiAtICAgICAgICBpZiAoIGVy
ciApCj4+ICsgICAgICAgIGlmICggIShvcC0+ZmxhZ3MgJiBHTlRNQVBfcmVhZG9ubHkpICYmCj4+
ICsgICAgICAgICAgICAgIShraW5kICYgTUFQS0lORF9XUklURSkgKQo+PiArICAgICAgICAgICAg
a2luZCA9IElPTU1VRl9yZWFkYWJsZSB8IElPTU1VRl93cml0YWJsZTsKPj4gKyAgICAgICAgZWxz
ZSBpZiAoICFraW5kICkKPj4gKyAgICAgICAgICAgIGtpbmQgPSBJT01NVUZfcmVhZGFibGU7Cj4+
ICsgICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAgIGtpbmQgPSAwOwo+PiArICAgICAgICBpZiAo
IGtpbmQgJiYgaW9tbXVfbGVnYWN5X21hcChsZCwgX2RmbihtZm5feChtZm4pKSwgbWZuLCAwLCBr
aW5kKQo+IFJlLXVzaW5nICdraW5kJyBpbiB0aGlzIHdheSBzbGlnaHRseSBvYmZ1c2NhdGVzIHRo
aW5ncy4gSSdtIHN1cmUgdGhlIGNvbXBpbGVyIHdvdWxkIHN0aWxsIGdlbmVyYXRlIHJlYXNvbmFi
bGUgY29kZSBpZiB5b3UgdXNlZCBhIHNlcGFyYXRlICdmbGFncycgdmFyaWFibGUgd2l0aGluIHRo
ZSBzYW1lIHNjb3BlLgoKSSBhZ3JlZS4KCkV2ZXJ5dGhpbmcgTEdUTSwgc28gQWNrZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
