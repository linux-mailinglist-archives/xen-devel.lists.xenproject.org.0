Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC955BD076
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:18:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoOg-0002LS-1c; Tue, 24 Sep 2019 17:14:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7zL=XT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCoOe-0002LK-N8
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:14:40 +0000
X-Inumbo-ID: ca7465ca-deee-11e9-97fb-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by localhost (Halon) with ESMTPS
 id ca7465ca-deee-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 17:14:39 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j19so2717052lja.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 10:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=799KN3twMwEWYj7RZXOEGeTxg2Z4YIhFubRwRSCzj4o=;
 b=MZe9BdevEl4w+p6rxF6C5MV0ANc4baee+rYTMUp9OWsmn/PPKwDKKKMCVH/NvmkhJK
 hhZ8TVkp1ATIm7Vh3rhFOOtrA4n8wsmNTziFJyiVEJW2/sM/iCl9w/hvtDCwS7I09S1M
 viBuj/nFlLr/KjnNCoApOR7DQrz3zgwnbSHgU8e5H6U4e3qQuqlg04p7hU4aLNmOWNga
 uNTbonI3Gw4cfUvxO+GLDQcFQpEzwFCVn+1tU/II8rTd7NdUJjIc1bR/SghkqzDD58nZ
 SRBGzutuZ7yTX8gypLeV2DXo5X62oMt77IizhR5E9J0LH6uI3JxjBqo4GBVW7WqfO1nu
 8tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=799KN3twMwEWYj7RZXOEGeTxg2Z4YIhFubRwRSCzj4o=;
 b=owRxRWOkVkUzr7sDPEzqa7YB2xIUnbUj/ekY3OvYzsU4PkJcK7J+L65MZqXHRE9euo
 WBQVoKy28HVR+4kcZLgARgEy9hsbxONpR/b95K/qRCJRXAOstRZj8WHOGeqEOhFkvisp
 AE4WmxH1/9Qy+JOHrpueMxJFx0SBP1dIL081M712kfg5nSVKH/YVuOcyBvNzcaoQPO30
 gPU2uxP77AKAfh6U+jL2GborOfEXW+VbkqH7GR5AggzL9d2OE9rrFu+g5EFr3helasEV
 lZts2anQpZ5uM4QdfR9myv2bNBbzvqkRTZxJNBN79bYDXXOWuHFyeOSynrGP91aZwvEN
 teQw==
X-Gm-Message-State: APjAAAXkz+0f+47FoK1LqizeZ7dto4f/DMIAOw3hZHaUnwHFTftHlWX1
 uy09QNf0yQE2FdhAAqW6GO0=
X-Google-Smtp-Source: APXvYqx+xSHhg2THlgDZadJOCfGE6lIGQz/BqG6BBj+a3zcLfWfVF/Z5z7hWkMkUPof21xtRHwW5gg==
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr2737657lji.101.1569345278545; 
 Tue, 24 Sep 2019 10:14:38 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id b67sm631051ljf.5.2019.09.24.10.14.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 10:14:38 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
 <1569339027-19484-4-git-send-email-olekstysh@gmail.com>
 <60879430-1e54-2503-8006-1c517bbe147a@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <625350f0-5012-d0e2-00f3-10f01ba3ef65@gmail.com>
Date: Tue, 24 Sep 2019 20:14:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <60879430-1e54-2503-8006-1c517bbe147a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 3/8] xen/common: Introduce _xrealloc
 function
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI0LjA5LjE5IDE4OjUxLCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4gT24gMjQu
MDkuMjAxOSAxNzozMCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+IENoYW5nZXMgVjQg
LT4gVjU6Cj4+ICAgICAgLSBhdm9pZCBwb3NzaWJsZSB0cnVuY2F0aW9uIHdpdGggYWxsb2NhdGlv
bnMgb2YgNEdpQiBvciBhYm92ZQo+PiAgICAgIC0gaW50cm9kdWNlIGhlbHBlciBmdW5jdGlvbnMg
YWRkKHN0cmlwKV9wYWRkaW5nIHRvIGF2b2lkCj4+ICAgICAgICBkdXBsaWNhdGluZyB0aGUgY29k
ZQo+PiAgICAgIC0gb21pdCB0aGUgdW5uZWNlc3NhcnkgY2FzdHMsIGNoYW5nZSB1MzIgdG8gdWlu
dDMyX3QKPj4gICAgICAgIHdoZW4gbW92aW5nIHRoZSBjb2RlCj4+ICAgICAgLSB1c2UgX3h6YWxs
b2MgaW5zdGVhZCBvZiBfeG1hbGxvYyB0byBnZXQgdGhlIHRhaWwKPj4gICAgICAgIHBvcnRpb24g
emVyb2VkCj4gSSdtIHNvcnJ5LCBidXQgbm8sIHRoaXMgaXMgd2FzdGVmdWw6IFlvdSB3cml0ZSB0
aGUgaW5pdGlhbGl6ZWQKPiBwb3J0aW9uIG9mIHRoZSBibG9jayB0d2ljZSB0aGlzIHdheSwgd2hl
biBvbmNlIGlzIGZ1bGx5Cj4gc3VmZmljaWVudCAoYnV0IHNlZSBiZWxvdykuCgpJbmRlZWQsIG5v
dCBlZmZlY3RpdmVseS4KCgo+PiAtLS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCj4+ICsr
KyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMKPj4gQEAgLTU1NCwxMCArNTU0LDQwIEBAIHN0
YXRpYyB2b2lkIHRsc2ZfaW5pdCh2b2lkKQo+PiAgICNkZWZpbmUgWkVST19CTE9DS19QVFIgKCh2
b2lkICopLTFMKQo+PiAgICNlbmRpZgo+PiAgIAo+PiArc3RhdGljIHZvaWQgKnN0cmlwX3BhZGRp
bmcodm9pZCAqcCkKPj4gK3sKPj4gKyAgICBzdHJ1Y3QgYmhkciAqYiA9IHAgLSBCSERSX09WRVJI
RUFEOwo+PiArCj4+ICsgICAgaWYgKCBiLT5zaXplICYgRlJFRV9CTE9DSyApCj4+ICsgICAgewo+
PiArICAgICAgICBwIC09IGItPnNpemUgJiB+RlJFRV9CTE9DSzsKPj4gKyAgICAgICAgYiA9IHAg
LSBCSERSX09WRVJIRUFEOwo+PiArICAgICAgICBBU1NFUlQoIShiLT5zaXplICYgRlJFRV9CTE9D
SykpOwo+PiArICAgIH0KPj4gKwo+PiArICAgIHJldHVybiBwOwo+PiArfQo+PiArCj4+ICtzdGF0
aWMgdm9pZCAqYWRkX3BhZGRpbmcodm9pZCAqcCwgdW5zaWduZWQgbG9uZyBhbGlnbikKPj4gK3sK
Pj4gKyAgICB1aW50MzJfdCBwYWQ7Cj4gQSBmaXhlZCB3aWR0aCB0eXBlIGlzIGluYXBwcm9wcmlh
dGUgaGVyZSBhbnl3YXkgLSB1bnNpZ25lZCBpbnQgd291bGQKPiBzdWZmaWNlLiBKdWRnaW5nIGZy
b20gdGhlIGluY29taW5nIHBhcmFtZXRlcnMsIHVuc2lnbmVkIGxvbmcgd291bGQKPiBiZSBtb3Jl
IGZ1dHVyZSBwcm9vZjsgYWx0ZXJuYXRpdmVseSB0aGUgImFsaWduIiBwYXJhbWV0ZXIgY291bGQg
YmUKPiAidW5zaWduZWQgaW50Iiwgc2luY2Ugd2UgZG9uJ3QgYWxsb3cgc3VjaCBodWdlIGFsbG9j
YXRpb25zIGFueXdheQo+IChidXQgSSBhZ3JlZSB0aGF0IGFkanVzdGluZyB0aGlzIGRvZXNuJ3Qg
cmVhbGx5IGJlbG9uZyBpbiB0aGUgcGF0Y2gKPiBoZXJlKS4KCldpbGwgY2hhbmdlIHRvIHVuc2ln
bmVkIGludC4KCgo+PiBAQCAtNTk4LDEwICs2MjEsNzAgQEAgdm9pZCAqX3h6YWxsb2ModW5zaWdu
ZWQgbG9uZyBzaXplLCB1bnNpZ25lZCBsb25nIGFsaWduKQo+PiAgICAgICByZXR1cm4gcCA/IG1l
bXNldChwLCAwLCBzaXplKSA6IHA7Cj4+ICAgfQo+PiAgIAo+PiAtdm9pZCB4ZnJlZSh2b2lkICpw
KQo+PiArdm9pZCAqX3hyZWFsbG9jKHZvaWQgKnB0ciwgdW5zaWduZWQgbG9uZyBzaXplLCB1bnNp
Z25lZCBsb25nIGFsaWduKQo+PiAgIHsKPj4gLSAgICBzdHJ1Y3QgYmhkciAqYjsKPj4gKyAgICB1
bnNpZ25lZCBsb25nIGN1cnJfc2l6ZSwgdG1wX3NpemU7Cj4+ICsgICAgdm9pZCAqcDsKPj4gKwo+
PiArICAgIGlmICggIXNpemUgKQo+PiArICAgIHsKPj4gKyAgICAgICAgeGZyZWUocHRyKTsKPj4g
KyAgICAgICAgcmV0dXJuIFpFUk9fQkxPQ0tfUFRSOwo+PiArICAgIH0KPj4gICAKPj4gKyAgICBp
ZiAoIHB0ciA9PSBOVUxMIHx8IHB0ciA9PSBaRVJPX0JMT0NLX1BUUiApCj4+ICsgICAgICAgIHJl
dHVybiBfeG1hbGxvYyhzaXplLCBhbGlnbik7Cj4gVGhpcyBpcyBpbmNvbnNpc3RlbnQgLSB5b3Ug
dXNlIF94emFsbG9jKCkgZnVydGhlciBkb3duIChhbmQgdG9vCj4gYWdncmVzc2l2ZWx5IGltbywg
YXMgc2FpZCkuCgpJbmRlZWQuIEkgbWlzc2VkIHRoYXQuCgoKCj4gICBIZXJlIHVzZSBvZiB0aGF0
IGZ1bmN0aW9uIHdvdWxkIHRoZW4KPiBiZSBpbmRpY2F0ZWQuIEhvd2V2ZXIsIC4uLgo+Cj4+ICsg
ICAgQVNTRVJUKChhbGlnbiAmIChhbGlnbiAtIDEpKSA9PSAwKTsKPj4gKyAgICBpZiAoIGFsaWdu
IDwgTUVNX0FMSUdOICkKPj4gKyAgICAgICAgYWxpZ24gPSBNRU1fQUxJR047Cj4+ICsKPj4gKyAg
ICB0bXBfc2l6ZSA9IHNpemUgKyBhbGlnbiAtIE1FTV9BTElHTjsKPj4gKwo+PiArICAgIGlmICgg
dG1wX3NpemUgPCBQQUdFX1NJWkUgKQo+PiArICAgICAgICB0bXBfc2l6ZSA9ICh0bXBfc2l6ZSA8
IE1JTl9CTE9DS19TSVpFKSA/IE1JTl9CTE9DS19TSVpFIDoKPj4gKyAgICAgICAgICAgIFJPVU5E
VVBfU0laRSh0bXBfc2l6ZSk7Cj4+ICsKPj4gKyAgICBpZiAoICEoKHVuc2lnbmVkIGxvbmcpcHRy
ICYgKFBBR0VfU0laRSAtIDEpKSApCj4+ICsgICAgewo+PiArICAgICAgICBjdXJyX3NpemUgPSAo
dW5zaWduZWQgbG9uZylQRk5fT1JERVIodmlydF90b19wYWdlKHB0cikpIDw8IFBBR0VfU0hJRlQ7
Cj4+ICsKPj4gKyAgICAgICAgaWYgKCBzaXplIDw9IGN1cnJfc2l6ZSAmJiAoKHVuc2lnbmVkIGxv
bmcpcHRyICYgKGFsaWduIC0gMSkpID09IDAgKQo+PiArICAgICAgICAgICAgcmV0dXJuIHB0cjsK
PiAuLi4gSSBvbmx5IG5vdyByZWFsaXplIHRoYXQgaW4gYSBjYXNlIGxpa2UgdGhpcyBvbmUgeW91
IGNhbid0IHJlYWxseQo+IHplcm8tZmlsbCB0aGUgdGFpbCBwb3J0aW9uIHRoYXQncyBleHRlbmRp
bmcgYmV5b25kIHRoZSBvcmlnaW5hbAo+IHJlcXVlc3QuIEhlbmNlIEkgdGhpbmsgdGhlIGp1c3Qt
aW4tY2FzZSB6ZXJvIGZpbGxpbmcgd291bGQgYmV0dGVyIGJlCj4gZHJvcHBlZCBhZ2FpbiAoYW5k
IHRoZSBfeG1hbGxvYygpIHVzZSBhYm92ZSBpcyBmaW5lKS4KCkdvdCBpdC4KCgo+IE5vdGUgdGhh
dCB3aXRoIHRoZSBmaXggZG9uZSBoZXJlIHlvdSBkb24ndCBuZWVkIHRtcF9zaXplIGFueW1vcmUK
PiBvdXRzaWRlIG9mIC4uLgoKPj4gKyAgICB9Cj4+ICsgICAgZWxzZQo+PiArICAgIHsKPiAuLi4g
dGhpcyBibG9jay4gUGxlYXNlIG1vdmUgaXRzIGNhbGN1bGF0aW9uIChhbmQgZGVjbGFyYXRpb24p
IGhlcmUuCgpBZ3JlZS4gV2lsbCBtb3ZlLgoKCj4+ICsgICAgICAgIHN0cnVjdCBiaGRyICpiOwo+
PiArCj4+ICsgICAgICAgIC8qIFN0cmlwIGFsaWdubWVudCBwYWRkaW5nLiAqLwo+PiArICAgICAg
ICBwID0gc3RyaXBfcGFkZGluZyhwdHIpOwo+PiArCj4+ICsgICAgICAgIGIgPSBwIC0gQkhEUl9P
VkVSSEVBRDsKPj4gKyAgICAgICAgY3Vycl9zaXplID0gYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFT
SzsKPj4gKwo+PiArICAgICAgICBpZiAoIHRtcF9zaXplIDw9IGN1cnJfc2l6ZSApCj4+ICsgICAg
ICAgIHsKPj4gKyAgICAgICAgICAgIC8qIEFkZCBhbGlnbm1lbnQgcGFkZGluZy4gKi8KPj4gKyAg
ICAgICAgICAgIHAgPSBhZGRfcGFkZGluZyhwLCBhbGlnbik7Cj4+ICsKPj4gKyAgICAgICAgICAg
IEFTU0VSVCgoKHVuc2lnbmVkIGxvbmcpcCAmIChhbGlnbiAtIDEpKSA9PSAwKTsKPiBTaW5jZSBh
bm90aGVyIHJldiBpcyBnb2luZyB0byBiZSBuZWVkZWQgYW55d2F5IC0gaGVyZSBhbmQgYWJvdmUK
PiBwbGVhc2UgcHJlZmVyICEgb3ZlciA9PSAwLgoKb2ssIHdpbGwgZG8uCgoKLS0gClJlZ2FyZHMs
CgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
