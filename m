Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061FFBEE63
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:25:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPyW-0001Rz-1d; Thu, 26 Sep 2019 09:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDPyU-0001Ru-O7
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:22:10 +0000
X-Inumbo-ID: 1d5394c2-e03f-11e9-bf31-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by localhost (Halon) with ESMTPS
 id 1d5394c2-e03f-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 09:22:09 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x80so1150880lff.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 02:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Z18wNcGZx4LANKBnwuIhZSYHeNwLlm213lXvyyPxVnc=;
 b=pWqNAFnuNG3wXiWvATCdOZqFjsIfkgxzUZE1R1jkAdmjKK8CQxP0Sn81Pk+/bOkbE8
 ciW2AjAT/axPhK+Egr8/MOfHuj7pIlBeEqBnQQs3kN1X38bVp3vNYOjFdKJGgYgPWjeR
 +PubZditl6UfxXjmxYdMJXY8KouxD/6Lj47lTSpA/IOElH+MUleB8ZL82FAsqHEECpnn
 FAvRzl3rpE13Q4XQSaGWnajSSLdF9jI36uKKtZ6oHMulcGXu643qaXwmg3LmnQPyD0lC
 0VFWZaAXj86+olZFFGEvz0AxGqBbHWfdfyr57RQT1i4m4z7KgUcgz3354AUrikO9YeYl
 9ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Z18wNcGZx4LANKBnwuIhZSYHeNwLlm213lXvyyPxVnc=;
 b=Fr1166Gr9T8JadSKp0K0oKGmCQFz5/ZiGbg9vlcWOny/DtoEwIjMo59TLGhP03H4DO
 jTwmCaBCL6Ie+XswBM1zOdIFoIKNz0xsdo3bXUbEihnywN6zPBaINt36kiV/ap0MrMPQ
 kySXpL6kxRe34MbAdAGpTbwk7w7YdVnEQrk7wv64xRjtWYP56hY0KI4Fu7cGzKw3V9dn
 U7od2euiBoMA+8pfISsxlzH/MS0ga6c8Q38j7Z/TbI7VpsViLk0G8gAWpaBJ+ZhEzDSB
 XqBjNzBc7gkvQ9WL0CIazPuMi9FQJpQvIT436LakWbZ46o4Um144eSUR0Lm++lR6T0A4
 sZfg==
X-Gm-Message-State: APjAAAVh+nF7HK3LQkSnzz3GjE5XJUNNwzVHAroNhR1HjjKjj7OYLgj2
 RmP1y30fVwijq4bqvBJ+/jw=
X-Google-Smtp-Source: APXvYqwYDiINoHq29Tnugs1NmUsszS3qYfdz3kd34AVpnLxN9l4vdoxwiCtTkNBBhz4Va7nEIILdFA==
X-Received: by 2002:a19:f801:: with SMTP id a1mr1403277lff.166.1569489728626; 
 Thu, 26 Sep 2019 02:22:08 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id n4sm456864lfi.63.2019.09.26.02.22.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 02:22:08 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>,
 'Julien Grall' <Julien.Grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
 <7f18c7f3-1d25-6d24-b44b-27cf77163eec@arm.com>
 <3c719420dabd4cc1860f0d687cdc3f78@AMSPEX02CL03.citrite.net>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <dcf0a05d-22f3-53d3-558e-9bb3bf05d76f@gmail.com>
Date: Thu, 26 Sep 2019 12:22:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3c719420dabd4cc1860f0d687cdc3f78@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI2LjA5LjE5IDExOjM5LCBQYXVsIER1cnJhbnQgd3JvdGU6CgpIaSBQYXVsCgo+Pgo+Pj4+
IFtDQyBKdWxpZW5dCj4+Pj4KPj4+Pgo+Pj4+IEhpIFBhdWwKPj4+Pgo+Pj4+IEkgbWF5IG1pc3Rh
a2UsIGJ1dCBsb29rcyBsaWtlCj4+Pj4KPj4+PiA4MGZmM2QzMzhkYzkzMjYwYjQxZmZlZWViYjBm
ODUyYzJlZGVmOWNlIGlvbW11OiB0aWR5IHVwCj4+Pj4gaW9tbXVfdXNlX2hhcF9wdCgpIGFuZCBu
ZWVkX2lvbW11X3B0X3N5bmMoKSBtYWNyb3MKPj4+Pgo+Pj4+IHRyaWdnZXJzIEFTU0VSVF9VTlJF
QUNIQUJMRSBvbiBBcm0gaWYgbm8gSU9NTVUgaGFzIGJlZW4gZm91bmQgKEkgYnVpbHQKPj4+PiB3
aXRoIG15IHBsYXRmb3JtJ3MgSU9NTVUgZHJpdmVyIGRpc2FibGVkOiAjIENPTkZJR19JUE1NVV9W
TVNBIGlzIG5vdCBzZXQpIC4KPj4+Pgo+Pj4+IFNvLCBpb21tdV9zZXR1cCgpIGNhbGxzIGNsZWFy
X2lvbW11X2hhcF9wdF9zaGFyZSgpIHdpdGgKPj4+PiBpb21tdV9oYXBfcHRfc2hhcmUgYmVpbmcg
c2V0IChDT05GSUdfSU9NTVVfRk9SQ0VfUFRfU0hBUkU9eSkgd2hpY2gsCj4+Pj4gYWN0dWFsbHks
IHRyaWdnZXJzIEFTU0VSVC4KPj4+Pgo+Pj4gSGVyZSBhIG1pbmltYWwgcGF0Y2gsIGxlYXZpbmcg
J2ZvcmNlIHB0IHNoYXJlJyBpbiBwbGFjZS4gRG9lcyB0aGlzIGF2b2lkIHRoZSBwcm9ibGVtPwo+
Pj4KPj4+IC0tLTg8LS0tCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zeXNjdGwuYyBiL3hl
bi9jb21tb24vc3lzY3RsLmMKPj4+IGluZGV4IGU4NzYzYzdmZGYuLmY4OGEyODVlN2YgMTAwNjQ0
Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3N5c2N0bC5jCj4+PiArKysgYi94ZW4vY29tbW9uL3N5c2N0
bC5jCj4+PiBAQCAtMjY4LDkgKzI2OCwxMSBAQCBsb25nIGRvX3N5c2N0bChYRU5fR1VFU1RfSEFO
RExFX1BBUkFNKHhlbl9zeXNjdGxfdCkgdV9zeXNjdGwpCj4+PiAgICAgICAgICAgIHBpLT5tYXhf
bWZuID0gZ2V0X3VwcGVyX21mbl9ib3VuZCgpOwo+Pj4gICAgICAgICAgICBhcmNoX2RvX3BoeXNp
bmZvKHBpKTsKPj4+ICAgICAgICAgICAgaWYgKCBpb21tdV9lbmFibGVkICkKPj4+ICsgICAgICAg
IHsKPj4+ICAgICAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlT
Q0FQX2RpcmVjdGlvOwo+Pj4gLSAgICAgICAgaWYgKCBpb21tdV9oYXBfcHRfc2hhcmUgKQo+Pj4g
LSAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2lvbW11
X2hhcF9wdF9zaGFyZTsKPj4+ICsgICAgICAgICAgICBpZiAoIGlvbW11X2hhcF9wdF9zaGFyZSAp
Cj4+PiArICAgICAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlT
Q0FQX2lvbW11X2hhcF9wdF9zaGFyZTsKPj4+ICsgICAgICAgIH0KPj4+Cj4+PiAgICAgICAgICAg
IGlmICggY29weV90b19ndWVzdCh1X3N5c2N0bCwgb3AsIDEpICkKPj4+ICAgICAgICAgICAgICAg
IHJldCA9IC1FRkFVTFQ7Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2lvbW11Lmgg
Yi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAo+Pj4gaW5kZXggN2MzMDAzZjNmMS4uNmExMGEyNDEy
OCAxMDA2NDQKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4+PiArKysgYi94ZW4v
aW5jbHVkZS94ZW4vaW9tbXUuaAo+Pj4gQEAgLTY4LDggKzY4LDYgQEAgc3RhdGljIGlubGluZSB2
b2lkIGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSh2b2lkKQo+Pj4gICAgewo+Pj4gICAgI2lmbmRl
ZiBpb21tdV9oYXBfcHRfc2hhcmUKPj4+ICAgICAgICBpb21tdV9oYXBfcHRfc2hhcmUgPSBmYWxz
ZTsKPj4+IC0jZWxpZiBpb21tdV9oYXBfcHRfc2hhcmUKPj4+IC0gICAgQVNTRVJUX1VOUkVBQ0hB
QkxFKCk7Cj4+PiAgICAjZW5kaWYKPj4gSUhNTywgY2FsbGluZyB0aGlzIGZ1bmN0aW9uIGlzIGEg
bWlzdGFrZSBvbiBwbGF0Zm9ybSBvbmx5IHN1cHBvcnRpbmcKPj4gc2hhcmVkIHBhZ2UtdGFibGUg
c28gdGhlIEFTU0VSVCgpIHNob3VsZCBiZSBrZXB0IGhlcmUuCj4+Cj4+IFRoaXMgcmFpc2VzIHRo
ZSBxdWVzdGlvbiB3aHkgdGhlIGZ1bmN0aW9uIGlzIGFjdHVhbGx5IGNhbGxlZCBmcm9tIGNvbW1v
bgo+PiBjb2RlLiBpb21tdV9oYXBfZW5hYmxlZCgpIHNob3VsZCB0ZWNobmljYWxseSBub3QgYmUg
dXNlZCBpbiBhbnkgY29kZSBpZgo+PiB0aGUgSU9NTVUgaXMgbm90IGVuYWJsZWQvcHJlc2VudC4g
U28gd2hhdCBhcmUgeW91IHRyeWluZyB0byBwcmV2ZW50IGhlcmU/Cj4gV2hhdCBJJ20gdHJ5aW5n
IHRvIHByZXZlbnQsIG9uIHg4NiwgaXMgYSBzaXR1YXRpb24gd2hlcmUgdGhlIGlvbW11X2VuYWJs
ZWQgPT0gZmFsc2UgYnV0IGlvbW11X2hhcF9wdF9zaGFyZSA9PSB0cnVlLiBJIGhhZCwgbWlzdGFr
ZW5seSwgYmVsaWV2ZWQgdGhhdCBpb21tdV9lbmFibGVkIHdvdWxkIG5ldmVyIGJlIGZhbHNlIGZv
ciBBUk0gYnV0IGl0IHNlZW1zIHRoaXMgaXMgbm90IHRoZSBjYXNlIHNvIHRoYXQgc2l0dWF0aW9u
IGhhcyB0byBiZSB0b2xlcmF0ZWQuIEkgZ3Vlc3MsIGdpdmVuIHRoZSBvdGhlciBodW5rIG9mIG15
IHBhdGNoLCBJIGNhbiBhY3R1YWxseSBsZWF2ZSB0aGUgQVNTRVJUIGluIHBsYWNlIGFuZCBhdm9p
ZCBtYWtpbmcgdGhlIGNhbGwgZnJvbSBjb21tb24gY29kZSwgaW4gd2hpY2ggY2FzZSB0aGUgZnVu
Y3Rpb24gb3VnaHQgdG8gbW92ZSBpbnRvIGFuIHg4NiBoZWFkZXIgYXMgd2VsbC4KCgpOb3QgYWxs
IEFybSBiYXNlZCBTb0NzICh3aGljaCBzdXBwb3J0ZWQgYnkgWGVuKSBjb250YWlucyBTTU1VICh0
aGUgb25seSAKb25lIHN1cHBvcnRlZCBkcml2ZXIgYXQgdGhlIG1vbWVudCkgb3IgSVBNTVUtVk1T
QSAob24gcmV2aWV3IG5vdywgYnV0LCAKaXQgd2lsbCBiZSB1bmRlciBDT05GSUdfRVhQRVJUIHdo
ZW4gbWVyZ2VkLCBzbyBkaXNhYmxlZCBieSBkZWZhdWx0KS4gU28sIAoiaW9tbXVfZW5hYmxlZCIg
Y2FuIGJlIGZhbHNlLgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
