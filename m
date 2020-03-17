Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8366818891E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 16:25:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEE4O-00038C-34; Tue, 17 Mar 2020 15:23:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Yf1=5C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jEE4M-00037D-VJ
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 15:23:50 +0000
X-Inumbo-ID: 4b6f4912-6863-11ea-b34e-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b6f4912-6863-11ea-b34e-bc764e2007e4;
 Tue, 17 Mar 2020 15:23:47 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b23so27023114edx.4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 08:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Okgs2pm8my8HjnkNyDzQiWNi3a5PDXANi+POpXfXxXs=;
 b=InZhp5VhRqsbb7TjVMayFuCE3N7JnUV4kIdcaaRwKDvEVn3Eguf0lk1Jvu8KJwopPS
 6NABN6RVS2cKd+hQPTOUYpK04Vm+lc6Mso2ScPF9RjAXZHFPH8yc4z3kNxWmfYGy44Pq
 m1pzZvXxKoLh01UJ2jfrCpJUamhzk+vFR8kslm5qr/XRXhzpdeIXr+8o9NZKQNZWKm99
 ffFm1vrq8uzYDP+Gix8/dMpePKfwGU55fH1B7Rz2Q8QOgw6UgR0vmDxXguxQ3ihQgEJv
 Unb2qTJkpO4BnzLBQmkuzQZGakPv5GJ2pRDzBZVifmHja6uSMtKm/ZXENfn8PxjiDNh6
 cidQ==
X-Gm-Message-State: ANhLgQ1wJX9Js8QEbNyElIbXVO2Gt4VDSfNLNGsuo9Jh5bf+QTsFcfdU
 rONqum1oW0WR2kLw+i+fZeQ=
X-Google-Smtp-Source: ADFU+vs3m/nXhj3P8XBZOjp9k2pabqhOUNrKzPfN2AXAcys9Zt+d4uphtg+IYeSVItTrNtZWJ9FaVA==
X-Received: by 2002:a17:906:d14e:: with SMTP id
 br14mr4546741ejb.105.1584458626073; 
 Tue, 17 Mar 2020 08:23:46 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id rl28sm188113ejb.28.2020.03.17.08.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 08:23:45 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, paul@xen.org
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-5-paul@xen.org>
 <f0430298-0d18-5bad-4724-c0f2c941be35@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c0578878-35ba-618a-16b1-7a49057743e0@xen.org>
Date: Tue, 17 Mar 2020 15:23:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f0430298-0d18-5bad-4724-c0f2c941be35@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v6 4/5] mm: add 'is_special_page' inline
 function...
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNy8wMy8yMDIwIDEzOjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxMC4wMy4yMDIw
IDE4OjQ5LCBwYXVsQHhlbi5vcmcgd3JvdGU6Cj4+IEluIGF1ZGl0aW5nIG9wZW4tY29kZWQgdGVz
dHMgb2YgUEdDX3hlbl9oZWFwLCBJIGFtIHVuc3VyZSBpZiBvZmZsaW5lX3BhZ2UoKQo+PiBuZWVk
cyB0byBjaGVjayBmb3IgUEdDX2V4dHJhIHBhZ2VzIHRvby4KPiAKPiAiRXh0cmEiIHBhZ2VzIGJl
aW5nIHRoZSBkZXNpZ25hdGVkIHJlcGxhY2VtZW50IGZvciBYZW4gaGVhcCBvbmVzLAo+IEkgdGhp
bmsgaXQgc2hvdWxkLiBUaGVuIGFnYWluIHRoZSBlYXJsaWVyCj4gCj4gICAgICBpZiAoIChvd25l
ciA9IHBhZ2VfZ2V0X293bmVyX2FuZF9yZWZlcmVuY2UocGcpKSApCj4gCj4gc2hvdWxkIHN1Y2Nl
ZWQgb24gdGhlbSAoYXMgbXVjaCBhcyBpdCBzaG91bGQgZm9yIFhlbiBoZWFwIHBhZ2VzCj4gc2hh
cmVkIHdpdGggYSBkb21haW4pLCBzbyBwZXJoYXBzIHNpbXBseSBzYXkgc29tZXRoaW5nIHRvIHRo
aXMKPiBlZmZlY3QgaW4gdGhlIGRlc2NyaXB0aW9uPwo+IAo+PiBAQCAtNDIxNiw4ICs0MjE2LDcg
QEAgaW50IHN0ZWFsX3BhZ2UoCj4+ICAgICAgIGlmICggIShvd25lciA9IHBhZ2VfZ2V0X293bmVy
X2FuZF9yZWZlcmVuY2UocGFnZSkpICkKPj4gICAgICAgICAgIGdvdG8gZmFpbDsKPj4gICAKPj4g
LSAgICBpZiAoIG93bmVyICE9IGQgfHwgaXNfeGVuX2hlYXBfcGFnZShwYWdlKSB8fAo+PiAtICAg
ICAgICAgKHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfZXh0cmEpICkKPj4gKyAgICBpZiAoIG93bmVy
ICE9IGQgfHwgaXNfc3BlY2lhbF9wYWdlKHBhZ2UpICkKPj4gICAgICAgICAgIGdvdG8gZmFpbF9w
dXQ7Cj4+ICAgCj4+ICAgICAgIC8qCj4gCj4gQSBmZXcgaHVuZHJlZCBsaW5lcyBkb3duIGZyb20g
aGVyZSBpbiB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKCkKPiB0aGVyZSBpcyBhIHVzZSBvZiBp
c194ZW5faGVhcF9tZm4oKS4gQW55IHJlYXNvbiB0aGF0IGRvZXNuJ3QgZ2V0Cj4gY29udmVydGVk
PyBTYW1lIHF1ZXN0aW9uIC0gYmVjYXVzZSBvZiB0aGUgY29kZSBiZWluZyBzaW1pbGFyIC0KPiB0
aGVuIGdvZXMgZm9yIG1tL3AybS5jOnAybV9hZGRfZm9yZWlnbigpLgo+IAo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvbW0vcDJtLXBvZC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMK
Pj4gQEAgLTc0OSw4ICs3NDksOSBAQCBwMm1fcG9kX3plcm9fY2hlY2tfc3VwZXJwYWdlKHN0cnVj
dCBwMm1fZG9tYWluICpwMm0sIGdmbl90IGdmbikKPj4gICAKPj4gICAgICAgICAgIG4gPSAxVUwg
PDwgbWluKGN1cl9vcmRlciwgU1VQRVJQQUdFX09SREVSICsgMFUpOwo+PiAgICAgICAgICAgZm9y
ICggayA9IDAsIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOyBrIDwgbjsgKytrLCArK3BhZ2UgKQo+
PiAtICAgICAgICAgICAgaWYgKCAhKHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfYWxsb2NhdGVkKSB8
fAo+PiAtICAgICAgICAgICAgICAgICAocGFnZS0+Y291bnRfaW5mbyAmIChQR0NfcGFnZV90YWJs
ZSB8IFBHQ194ZW5faGVhcCkpIHx8Cj4+ICsgICAgICAgICAgICBpZiAoIGlzX3NwZWNpYWxfcGFn
ZShwYWdlKSB8fAo+PiArICAgICAgICAgICAgICAgICAhKHBhZ2UtPmNvdW50X2luZm8gJiBQR0Nf
YWxsb2NhdGVkKSB8fAo+PiArICAgICAgICAgICAgICAgICAocGFnZS0+Y291bnRfaW5mbyAmIFBH
Q19wYWdlX3RhYmxlKSB8fAo+PiAgICAgICAgICAgICAgICAgICAgKHBhZ2UtPmNvdW50X2luZm8g
JiBQR0NfY291bnRfbWFzaykgPiBtYXhfcmVmICkKPj4gICAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4+ICAgICAgIH0KPj4gQEAgLTg4Niw4ICs4ODcsOSBAQCBwMm1fcG9kX3plcm9fY2hlY2so
c3RydWN0IHAybV9kb21haW4gKnAybSwgY29uc3QgZ2ZuX3QgKmdmbnMsIHVuc2lnbmVkIGludCBj
b3VudAo+PiAgICAgICAgICAgICogSWYgdGhpcyBpcyByYW0sIGFuZCBub3QgYSBwYWdldGFibGUg
b3IgZnJvbSB0aGUgeGVuIGhlYXAsIGFuZAo+PiAgICAgICAgICAgICogcHJvYmFibHkgbm90IG1h
cHBlZCBlbHNld2hlcmUsIG1hcCBpdDsgb3RoZXJ3aXNlLCBza2lwLgo+PiAgICAgICAgICAgICov
Cj4+IC0gICAgICAgIGlmICggcDJtX2lzX3JhbSh0eXBlc1tpXSkgJiYgKHBnLT5jb3VudF9pbmZv
ICYgUEdDX2FsbG9jYXRlZCkgJiYKPj4gLSAgICAgICAgICAgICAhKHBnLT5jb3VudF9pbmZvICYg
KFBHQ19wYWdlX3RhYmxlIHwgUEdDX3hlbl9oZWFwKSkgJiYKPj4gKyAgICAgICAgaWYgKCBwMm1f
aXNfcmFtKHR5cGVzW2ldKSAmJiAhaXNfc3BlY2lhbF9wYWdlKHBnKSAmJgo+PiArICAgICAgICAg
ICAgIChwZy0+Y291bnRfaW5mbyAmIFBHQ19hbGxvY2F0ZWQpICYmCj4+ICsgICAgICAgICAgICAg
IShwZy0+Y291bnRfaW5mbyAmIFBHQ19wYWdlX3RhYmxlKSAmJgo+PiAgICAgICAgICAgICAgICAo
KHBnLT5jb3VudF9pbmZvICYgUEdDX2NvdW50X21hc2spIDw9IG1heF9yZWYpICkKPj4gICAgICAg
ICAgICAgICBtYXBbaV0gPSBtYXBfZG9tYWluX3BhZ2UobWZuc1tpXSk7Cj4+ICAgICAgICAgICBl
bHNlCj4gCj4gSSBhcHByZWNpYXRlIHlvdXIgZGVzaXJlIHRvIHVzZSB0aGUgaW5saW5lIGZ1bmN0
aW9uIHlvdSBhZGQsIGFuZAo+IEkgYWxzbyBhcHByZWNpYXRlIHRoYXQgeW91IGxpa2VseSBwcmVm
ZXIgdG8gbm90IG1ha2UgdGhlIG90aGVyCj4gc3VnZ2VzdGVkIGNoYW5nZSAoYXQgbGVhc3Qgbm90
IHJpZ2h0IGhlcmUpLCBidXQgdGhlbiBJIHRoaW5rIHRoZQo+IGNvbW1pdCBtZXNzYWdlIHdvdWxk
IGJldHRlciBnYWluIGEgcmVtYXJrIHJlZ2FyZGluZyB0aGUKPiBzdXNwaWNpb3VzIHVzZXMgb2Yg
UEdDX3BhZ2VfdGFibGUgaGVyZS4gSSBjb250aW51ZSB0byB0aGluayB0aGF0Cj4gdGhleSBzaG91
bGQgYmUgZHJvcHBlZCBhcyBiZWluZyBwb2ludGxlc3MuIEluIGFueSBldmVudCBJIGZlYXIKPiB0
aGUgcmVzdWx0aW5nIGNvZGUgd2lsbCBiZSBsZXNzIGVmZmljaWVudCwgYXMgSSdtIHVuY29udmlu
Y2VkCj4gdGhhdCB0aGUgY29tcGlsZXIgd2lsbCBmb2xkIHRoZSBub3cgc3BsaXQgYml0IGNoZWNr
cy4KPiAKPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9tdWx0aS5jCj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYwo+PiBAQCAtNTU5LDcgKzU1OSw3IEBAIF9zaF9w
cm9wYWdhdGUoc3RydWN0IHZjcHUgKnYsCj4+ICAgICAgICAqIGNhY2hpbmcgYXR0cmlidXRlcyBp
biB0aGUgc2hhZG93cyB0byBtYXRjaCB3aGF0IHdhcyBhc2tlZCBmb3IuCj4+ICAgICAgICAqLwo+
PiAgICAgICBpZiAoIChsZXZlbCA9PSAxKSAmJiBpc19odm1fZG9tYWluKGQpICYmCj4+IC0gICAg
ICAgICAhaXNfeGVuX2hlYXBfbWZuKHRhcmdldF9tZm4pICkKPj4gKyAgICAgICAgICFpc19zcGVj
aWFsX3BhZ2UobWZuX3RvX3BhZ2UodGFyZ2V0X21mbikpICkKPiAKPiBDYXJlZnVsIC0gaXNfeGVu
X2hlYXBfbWZuKCkgYWxzbyBpbmNsdWRlcyBhbiBtZm5fdmFsaWQoKSBjaGVjay4KPiBDb2RlIGEg
ZmV3IGxpbmVzIHVwIGZyb20gaGVyZSBzdWdnZXN0cyB0aGF0IE1NSU8gTUZOcyBjYW4gbWFrZQo+
IGl0IGhlcmUuCj4gCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4+ICsrKyBiL3hlbi9p
bmNsdWRlL3hlbi9tbS5oCj4+IEBAIC0yODUsNiArMjg1LDExIEBAIGV4dGVybiBzdHJ1Y3QgZG9t
YWluICpkb21fY293Owo+PiAgIAo+PiAgICNpbmNsdWRlIDxhc20vbW0uaD4KPj4gICAKPj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBpc19zcGVjaWFsX3BhZ2UoY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAq
cGFnZSkKPj4gK3sKPj4gKyAgICByZXR1cm4gaXNfeGVuX2hlYXBfcGFnZShwYWdlKSB8fCAocGFn
ZS0+Y291bnRfaW5mbyAmIFBHQ19leHRyYSk7Cj4gCj4gU2VlaW5nIEFybTMyJ3MgaW1wbGVtZW50
YXRpb24gSSB1bmRlcnN0YW5kIHdoeSB5b3UgbmVlZCB0byB1c2UKPiB8fCBoZXJlOyBpdCdzIGEg
cGl0eSB0aGUgdHdvIGNoZWNrcyBjYW4ndCBiZSBmb2xkZWQuIEhvcGVmdWxseQo+IGF0IGxlYXN0
IGhlcmUgdGhlIGNvbXBpbGVyIHJlY29nbml6ZXMgdGhlIG9wcG9ydHVuaXR5LgoKTm90ZSB0aGlz
IGlzIG5vdCBhIHJlcXVlc3QgZm9yIHRoaXMgc2VyaWVzIDopLgoKSSBub3RpY2VkIHRoaXMgb2Rk
aXR5IHJlY2VudGx5LiBJIGhhdmUgYmVlbiBwb25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQgCmFp
bSB0byBoYXZlIFBHQ194ZW5faGVhcCBldmVuIHdoZW4gdXNpbmcgc3BsaXQgKGxpa2Ugb24gQXJt
MzIpLgoKVGhpcyB3b3VsZCBhdm9pZCBwcm9ibGVtIGxpa2UgdGhlIG9mZmxpbmUgY29kZSwgd2hp
Y2ggaXMgY29tbW9uIGNvZGUsIHRvIApiZSBicm9rZW4gb24gcGxhdGZvcm0gdXNpbmcgc3BsaXQg
eGVuaGVhcC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
