Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D92BB477
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 14:54:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCNnV-0005S9-3i; Mon, 23 Sep 2019 12:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FsY0=XS=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCNnT-0005S4-Rm
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 12:50:31 +0000
X-Inumbo-ID: b93e9652-de00-11e9-978d-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b93e9652-de00-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 12:50:30 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a22so13612106ljd.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cQW/pZsTyZLTswXtuTd0cWpjF3yfDnuHvHsStfOsvPc=;
 b=pOOb/fTxa/Hk2YqVTO/+CdlAhHmCDW2o6FaESllfah612vUj+cXWafwH1zBMVqmLi3
 6fOM4A5hmBODUXiJTc5btiD5VA85tmz9ZCKHV3xg4rDoCIY8oIoDtCC0vYIImIcojewo
 oFPE2pdz8HQ64rkcs3KfU2FUZ7nHQLPXvm7ne3vakmPEZlTSvNOneQR+/GfXS8PeNc1F
 TKOucthYSVU43h1asLbsnFwYpKuMJ0bO80bYyBPJmDRuoJkPBWD1a34JL7gqRm5infpz
 2lZyKiaARr+6V1Yo/79GCyBGOgpVfbtTIE920lDjAYtMVH+ypyum4BdjHDnLRy27ofL9
 lNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cQW/pZsTyZLTswXtuTd0cWpjF3yfDnuHvHsStfOsvPc=;
 b=sZjLBDv/xczO2TH1HRS0aNEgtMbwHMPwi4ZgfXZfYJ7UiB/Wg47EDNHd4xjKhCibq+
 s5yoKTYWA/nVZa331JKMPP5T7Kdwb7QAnaBi1vdkpH20WijdKEz/iqtjL5gT5KDobQ/+
 cO7nsSNKVnqxZqHBr0GlJDcYBGGu95FnA0/PJhg80GnC0aujsqdtYM4obNVCsgqDIF6t
 lMy67lGmGPlqdeURpb0FgGGj6jHJAIq3KEWPzoi6NitzdtqRTlvABQoYqCSQvWhzzYeJ
 SVoeahz3TxdRenI9pa5yDMOXBUDuaHnNb6O494OhQf7MYpaDymA+TNkW3invfTMhy7vk
 nVtA==
X-Gm-Message-State: APjAAAXnBdIgtmQs51y2+r87nZIngrAY6HCgw6Kq3jI8uKf4i2uqseU4
 fiWnAvvCgVMjHFt7xY94IBA=
X-Google-Smtp-Source: APXvYqz9S7L/7JaAq2LIA7g/iG1LvMJPAp4xfzN8HcWATC6Kczw00ras7f4ua2qDbI8LwGZfvKKqjQ==
X-Received: by 2002:a2e:878c:: with SMTP id n12mr4285955lji.175.1569243029607; 
 Mon, 23 Sep 2019 05:50:29 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id x17sm2262627lji.62.2019.09.23.05.50.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Sep 2019 05:50:28 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-5-git-send-email-olekstysh@gmail.com>
 <81c2099d-ee08-2e0a-134c-0a9889748ac8@suse.com>
 <0021c5ab-457e-7cbf-a5c7-7d8676503116@gmail.com>
 <93811967-b49d-7a86-6d19-647cd0e8d1dd@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4c2b6cca-5471-7430-0b29-fbd97c031074@gmail.com>
Date: Mon, 23 Sep 2019 15:50:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <93811967-b49d-7a86-6d19-647cd0e8d1dd@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 4/8] xen/common: Introduce _xrealloc
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
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE2LjA5LjE5IDE4OjI0LCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4uCgo+Pj4+ICsg
ICAgICAgICAgICBST1VORFVQX1NJWkUodG1wX3NpemUpOwo+Pj4+ICsKPj4+PiArICAgIGlmICgg
dG1wX3NpemUgPD0gY3Vycl9zaXplICYmICgodW5zaWduZWQgbG9uZylwdHIgJiAoYWxpZ24gLSAx
KSkgPT0gMCApCj4+Pj4gKyAgICAgICAgcmV0dXJuIHB0cjsgLyogdGhlIHNpemUgYW5kIGFsaWdu
bWVudCBmaXQgaW4gYWxyZWFkeSBhbGxvY2F0ZWQgc3BhY2UgKi8KPj4+IFlvdSBhbHNvIGRvbid0
IHNlZW0gdG8gZXZlciB1cGRhdGUgcHRyIGluIGNhc2UgeW91IHdhbnQgdG8gdXNlIHRoZQo+Pj4g
KGhlYWQpIHBhZGRpbmcsIGkuZS4geW91J2QgaGFuZCBiYWNrIGEgcG9pbnRlciB0byBhIGJsb2Nr
IHdoaWNoIHRoZQo+Pj4gY2FsbGVyIHdvdWxkIGFzc3VtZSBleHRlbmRzIHBhc3QgaXRzIGFjdHVh
bCBlbmQuIEkgdGhpbmsgeW91IHdhbnQKPj4+IHRvIGNhbGN1bGF0ZSB0aGUgbmV3IHRlbnRhdGl2
ZSBwb2ludGVyICh0YWtpbmcgdGhlIHJlcXVlc3RlZAo+Pj4gYWxpZ25tZW50IGludG8gYWNjb3Vu
dCksIGFuZCBvbmx5IGZyb20gdGhhdCBjYWxjdWxhdGUgY3Vycl9zaXplCj4+PiAod2hpY2ggcGVy
aGFwcyB3b3VsZCBiZXR0ZXIgYmUgbmFtZWQgInVzYWJsZSIgb3IgInNwYWNlIiBvciBzb21lCj4+
PiBzdWNoKS4gT2J2aW91c2x5IHRoZSAoaGVhZCkgcGFkZGluZyBibG9jayBtYXkgbmVlZCB1cGRh
dGluZywgdG9vLgo+PiBJIGFtIGFmcmFpZCBJIGRvbid0IGNvbXBsZXRlbHkgdW5kZXJzdGFuZCB5
b3VyIHBvaW50IGhlcmUuIEFuZCBzb3JyeSBmb3IKPj4gdGhlIG1heWJlIG5haXZlIHF1ZXN0aW9u
LCBidXQgd2hhdCBpcyB0aGUgIihoZWFkKSBwYWRkaW5nIiBoZXJlPwo+IFRoZSB2ZXJ5IHBhZGRp
bmcgdGFsa2VkIGFib3V0IGVhcmxpZXIuIEkgZGlkIGFkZCAiKGhlYWQpIiB0byBjbGFyaWZ5Cj4g
aXQncyB0aGF0IHNwZWNpZmljIGNhc2UgLSBhZnRlciBhbGwgdGFpbCBwYWRkaW5nIGlzIGZhciBt
b3JlIGNvbW1vbi4KCgpTdGlsbCB1bnN1cmUsIEkgY29tcGxldGVseSB1bmRlcnN0YW5kIHlvdXIg
cG9pbnQgcmVnYXJkaW5nIGNhbGN1bGF0aW5nIAp0ZW50YXRpdmUgcG9pbnRlciBhbmQgdGhlbiBj
dXJyX3NpemUuCgoKLS0tLS0tLS0tLQoKRG9lcyB0aGUgZGlmZiBiZWxvdyBpcyBjbG9zZSB0byB3
aGF0IHlvdSBtZWFudD8KCgotLS0KIMKgeGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYyB8IDExMyAK
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogwqB4ZW4vaW5j
bHVkZS94ZW4veG1hbGxvYy5oIHzCoMKgIDEgKwogwqAyIGZpbGVzIGNoYW5nZWQsIDk2IGluc2Vy
dGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24veG1hbGxv
Y190bHNmLmMgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCmluZGV4IGU5OGFkNjUuLmYyNGM5
N2MgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMKKysrIGIveGVuL2NvbW1v
bi94bWFsbG9jX3Rsc2YuYwpAQCAtNTU0LDEwICs1NTQsNDAgQEAgc3RhdGljIHZvaWQgdGxzZl9p
bml0KHZvaWQpCiDCoCNkZWZpbmUgWkVST19CTE9DS19QVFIgKCh2b2lkICopLTFMKQogwqAjZW5k
aWYKCitzdGF0aWMgdm9pZCAqc3RyaXBfcGFkZGluZyh2b2lkICpwKQoreworwqDCoMKgIHN0cnVj
dCBiaGRyICpiID0gKHN0cnVjdCBiaGRyICopKHAgLSBCSERSX09WRVJIRUFEKTsKKworwqDCoMKg
IGlmICggYi0+c2l6ZSAmIEZSRUVfQkxPQ0sgKQorwqDCoMKgIHsKK8KgwqDCoMKgwqDCoMKgIHAg
LT0gYi0+c2l6ZSAmIH5GUkVFX0JMT0NLOworwqDCoMKgwqDCoMKgwqAgYiA9IChzdHJ1Y3QgYmhk
ciAqKShwIC0gQkhEUl9PVkVSSEVBRCk7CivCoMKgwqDCoMKgwqDCoCBBU1NFUlQoIShiLT5zaXpl
ICYgRlJFRV9CTE9DSykpOworwqDCoMKgIH0KKworwqDCoMKgIHJldHVybiBwOworfQorCitzdGF0
aWMgdm9pZCAqYWRkX3BhZGRpbmcodm9pZCAqcCwgdW5zaWduZWQgbG9uZyBhbGlnbikKK3sKK8Kg
wqDCoCB1MzIgcGFkOworCivCoMKgwqAgaWYgKCAocGFkID0gLShsb25nKXAgJiAoYWxpZ24gLSAx
KSkgIT0gMCApCivCoMKgwqAgeworwqDCoMKgwqDCoMKgwqAgY2hhciAqcSA9IChjaGFyICopcCAr
IHBhZDsKK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBiaGRyICpiID0gKHN0cnVjdCBiaGRyICopKHEg
LSBCSERSX09WRVJIRUFEKTsKKworwqDCoMKgwqDCoMKgwqAgQVNTRVJUKHEgPiAoY2hhciAqKXAp
OworwqDCoMKgwqDCoMKgwqAgYi0+c2l6ZSA9IHBhZCB8IEZSRUVfQkxPQ0s7CivCoMKgwqDCoMKg
wqDCoCBwID0gcTsKK8KgwqDCoCB9CisKK8KgwqDCoCByZXR1cm4gcDsKK30KKwogwqB2b2lkICpf
eG1hbGxvYyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCiDCoHsKIMKg
wqDCoMKgIHZvaWQgKnAgPSBOVUxMOwotwqDCoMKgIHUzMiBwYWQ7CgogwqDCoMKgwqAgQVNTRVJU
KCFpbl9pcnEoKSk7CgpAQCAtNTc4LDE0ICs2MDgsNyBAQCB2b2lkICpfeG1hbGxvYyh1bnNpZ25l
ZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCiDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biB4bWFsbG9jX3dob2xlX3BhZ2VzKHNpemUgLSBhbGlnbiArIE1FTV9BTElHTiwgYWxpZ24pOwoK
IMKgwqDCoMKgIC8qIEFkZCBhbGlnbm1lbnQgcGFkZGluZy4gKi8KLcKgwqDCoCBpZiAoIChwYWQg
PSAtKGxvbmcpcCAmIChhbGlnbiAtIDEpKSAhPSAwICkKLcKgwqDCoCB7Ci3CoMKgwqDCoMKgwqDC
oCBjaGFyICpxID0gKGNoYXIgKilwICsgcGFkOwotwqDCoMKgwqDCoMKgwqAgc3RydWN0IGJoZHIg
KmIgPSAoc3RydWN0IGJoZHIgKikocSAtIEJIRFJfT1ZFUkhFQUQpOwotwqDCoMKgwqDCoMKgwqAg
QVNTRVJUKHEgPiAoY2hhciAqKXApOwotwqDCoMKgwqDCoMKgwqAgYi0+c2l6ZSA9IHBhZCB8IEZS
RUVfQkxPQ0s7Ci3CoMKgwqDCoMKgwqDCoCBwID0gcTsKLcKgwqDCoCB9CivCoMKgwqAgcCA9IGFk
ZF9wYWRkaW5nKHAsIGFsaWduKTsKCiDCoMKgwqDCoCBBU1NFUlQoKCh1bnNpZ25lZCBsb25nKXAg
JiAoYWxpZ24gLSAxKSkgPT0gMCk7CiDCoMKgwqDCoCByZXR1cm4gcDsKQEAgLTU5OCwxMCArNjIx
LDcwIEBAIHZvaWQgKl94emFsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZyAK
YWxpZ24pCiDCoMKgwqDCoCByZXR1cm4gcCA/IG1lbXNldChwLCAwLCBzaXplKSA6IHA7CiDCoH0K
Ci12b2lkIHhmcmVlKHZvaWQgKnApCit2b2lkICpfeHJlYWxsb2Modm9pZCAqcHRyLCB1bnNpZ25l
ZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCiDCoHsKLcKgwqDCoCBzdHJ1Y3QgYmhk
ciAqYjsKK8KgwqDCoCB1bnNpZ25lZCBsb25nIGN1cnJfc2l6ZSwgdG1wX3NpemU7CivCoMKgwqAg
dm9pZCAqcDsKKworwqDCoMKgIGlmICggIXNpemUgKQorwqDCoMKgIHsKK8KgwqDCoMKgwqDCoMKg
IHhmcmVlKHB0cik7CivCoMKgwqDCoMKgwqDCoCByZXR1cm4gWkVST19CTE9DS19QVFI7CivCoMKg
wqAgfQorCivCoMKgwqAgaWYgKCBwdHIgPT0gTlVMTCB8fCBwdHIgPT0gWkVST19CTE9DS19QVFIg
KQorwqDCoMKgwqDCoMKgwqAgcmV0dXJuIF94bWFsbG9jKHNpemUsIGFsaWduKTsKKworwqDCoMKg
IEFTU0VSVCgoYWxpZ24gJiAoYWxpZ24gLSAxKSkgPT0gMCk7CivCoMKgwqAgaWYgKCBhbGlnbiA8
IE1FTV9BTElHTiApCivCoMKgwqDCoMKgwqDCoCBhbGlnbiA9IE1FTV9BTElHTjsKKworwqDCoMKg
IHRtcF9zaXplID0gc2l6ZSArIGFsaWduIC0gTUVNX0FMSUdOOworCivCoMKgwqAgaWYgKCB0bXBf
c2l6ZSA8IFBBR0VfU0laRSApCivCoMKgwqDCoMKgwqDCoCB0bXBfc2l6ZSA9ICh0bXBfc2l6ZSA8
IE1JTl9CTE9DS19TSVpFKSA/IE1JTl9CTE9DS19TSVpFIDoKK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgUk9VTkRVUF9TSVpFKHRtcF9zaXplKTsKKworwqDCoMKgIGlmICggISgodW5zaWduZWQgbG9u
ZylwdHIgJiAoUEFHRV9TSVpFIC0gMSkpICkKK8KgwqDCoCB7CivCoMKgwqDCoMKgwqDCoCBjdXJy
X3NpemUgPSAodW5zaWduZWQgbG9uZylQRk5fT1JERVIodmlydF90b19wYWdlKHB0cikpIDw8IApQ
QUdFX1NISUZUOworCivCoMKgwqDCoMKgwqDCoCBpZiAoIHRtcF9zaXplIDw9IGN1cnJfc2l6ZSAm
JiAoKHVuc2lnbmVkIGxvbmcpcHRyICYgKGFsaWduIC0gCjEpKSA9PSAwICkKK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHB0cjsKK8KgwqDCoCB9CivCoMKgwqAgZWxzZQorwqDCoMKgIHsK
K8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBiaGRyICpiOworCivCoMKgwqDCoMKgwqDCoCAvKiBTdHJp
cCBhbGlnbm1lbnQgcGFkZGluZy4gKi8KK8KgwqDCoMKgwqDCoMKgIHAgPSBzdHJpcF9wYWRkaW5n
KHB0cik7CisKK8KgwqDCoMKgwqDCoMKgIGIgPSAoc3RydWN0IGJoZHIgKikocCAtIEJIRFJfT1ZF
UkhFQUQpOworwqDCoMKgwqDCoMKgwqAgY3Vycl9zaXplID0gYi0+c2l6ZSAmIEJMT0NLX1NJWkVf
TUFTSzsKKworwqDCoMKgwqDCoMKgwqAgaWYgKCB0bXBfc2l6ZSA8PSBjdXJyX3NpemUgKQorwqDC
oMKgwqDCoMKgwqAgeworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBBZGQgYWxpZ25tZW50IHBh
ZGRpbmcuICovCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHAgPSBhZGRfcGFkZGluZyhwLCBhbGln
bik7CisKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVNTRVJUKCgodW5zaWduZWQgbG9uZylwICYg
KGFsaWduIC0gMSkpID09IDApOworCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBwOwor
wqDCoMKgwqDCoMKgwqAgfQorwqDCoMKgIH0KKworwqDCoMKgIHAgPSBfeHphbGxvYyhzaXplLCBh
bGlnbik7CivCoMKgwqAgaWYgKCBwICkKK8KgwqDCoCB7CivCoMKgwqDCoMKgwqDCoCBtZW1jcHko
cCwgcHRyLCBtaW4oY3Vycl9zaXplLCBzaXplKSk7CivCoMKgwqDCoMKgwqDCoCB4ZnJlZShwdHIp
OworwqDCoMKgIH0KKworwqDCoMKgIHJldHVybiBwOworfQorCit2b2lkIHhmcmVlKHZvaWQgKnAp
Cit7CiDCoMKgwqDCoCBpZiAoIHAgPT0gTlVMTCB8fCBwID09IFpFUk9fQkxPQ0tfUFRSICkKIMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuOwoKQEAgLTYyNiwxMyArNzA5LDcgQEAgdm9pZCB4ZnJlZSh2
b2lkICpwKQogwqDCoMKgwqAgfQoKIMKgwqDCoMKgIC8qIFN0cmlwIGFsaWdubWVudCBwYWRkaW5n
LiAqLwotwqDCoMKgIGIgPSAoc3RydWN0IGJoZHIgKikoKGNoYXIgKilwIC0gQkhEUl9PVkVSSEVB
RCk7Ci3CoMKgwqAgaWYgKCBiLT5zaXplICYgRlJFRV9CTE9DSyApCi3CoMKgwqAgewotwqDCoMKg
wqDCoMKgwqAgcCA9IChjaGFyICopcCAtIChiLT5zaXplICYgfkZSRUVfQkxPQ0spOwotwqDCoMKg
wqDCoMKgwqAgYiA9IChzdHJ1Y3QgYmhkciAqKSgoY2hhciAqKXAgLSBCSERSX09WRVJIRUFEKTsK
LcKgwqDCoMKgwqDCoMKgIEFTU0VSVCghKGItPnNpemUgJiBGUkVFX0JMT0NLKSk7Ci3CoMKgwqAg
fQorwqDCoMKgIHAgPSBzdHJpcF9wYWRkaW5nKHApOwoKIMKgwqDCoMKgIHhtZW1fcG9vbF9mcmVl
KHAsIHhlbnBvb2wpOwogwqB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5o
IGIveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAppbmRleCBmMDc1ZDJkLi44MzExNTJmIDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi94
bWFsbG9jLmgKQEAgLTUxLDYgKzUxLDcgQEAgZXh0ZXJuIHZvaWQgeGZyZWUodm9pZCAqKTsKIMKg
LyogVW5kZXJseWluZyBmdW5jdGlvbnMgKi8KIMKgZXh0ZXJuIHZvaWQgKl94bWFsbG9jKHVuc2ln
bmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZyBhbGlnbik7CiDCoGV4dGVybiB2b2lkICpfeHph
bGxvYyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pOworZXh0ZXJuIHZv
aWQgKl94cmVhbGxvYyh2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9u
ZyBhbGlnbik7CgogwqBzdGF0aWMgaW5saW5lIHZvaWQgKl94bWFsbG9jX2FycmF5KAogwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBzaXplLCB1bnNpZ25lZCBsb25nIGFsaWduLCB1bnNpZ25lZCBsb25n
IG51bSkKLS0gCjIuNy40CgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
