Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EB1A0969
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 20:26:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i32be-00035S-Bn; Wed, 28 Aug 2019 18:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FDGi=WY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i32bd-00035N-4u
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 18:23:41 +0000
X-Inumbo-ID: f52c1f30-c9c0-11e9-b95f-bc764e2007e4
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f52c1f30-c9c0-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 18:23:40 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j4so341012lfh.8
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2019 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zMQHxVy0xcTRZFX+KcXXS2aLu3QBsYyscN3upp09Rz8=;
 b=iTVlDyWw1d3VI1HQe9WQ6hpX2+Ps2xVXntt8J0oR5t4FjIihJVrBsUn4/ZYYslkktl
 OoqK0yHAh5ND6kZZODDa5XN9iYE5C8kmE5nTfKxfdAPAnLgc1MKW5D1PntcBswnlIJan
 oODk540D6dvML+6LeRQ8grdBGBhej37LWY1A3kWhHqPiN+evOU7i4kRt3BVDXJHDymlX
 U2X8RE7ydTEJlaxh/O/s40nFbfHdF4gUNBVlOMH5qGVDyMFEfvKQFmu5FpngqB3SbGnj
 3mdsrhC50D8uN0D/8LDLTiBXrGIfGuITfRzo3gVOMeezWXuMlb+4T2hySfaf9czN3FJc
 1VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zMQHxVy0xcTRZFX+KcXXS2aLu3QBsYyscN3upp09Rz8=;
 b=iMlm++o1l9yaj+N4F0IONHrBcUZBhxl4m6SEQee3Y9scA289t19JltDUJVV28J/pW+
 xpZwEinO3/rlxDpoIOnLrJQIzupmxgdPiUDxZg0kAJB//YuFTUOKoBIIpLjtC/qeyD7I
 6+pM9WK44U2giPwCgVMZrhADgMOWJTe/mZ/jDeDWCg8Ow51mVEan0/Ck5zFFIf9HWRa4
 VTLJja8wU7drI0Fjl6XAJ8tvVma1mhOQgvnrNNZVdATAJ5CSXDbPtQNtAewNr8xcuMbq
 xwmWxMpiE8zGFp3AlX/KgFwMGxX1qqfokL5HQGXxT5+LRr9GuBLWf59nrxuCmhukN5So
 IclA==
X-Gm-Message-State: APjAAAUQvMtPmfGkhFQoUK75l5Ta898N7en53iZhj+FYnBo3vedLxvKO
 2f2LoRkbhDIODFT5nKx9BYY=
X-Google-Smtp-Source: APXvYqxH4mQB1PfUcChiAtxq0BmNriW+vCcLuPvP1C7pl7Xczmg/vVZJKoP2DWYLMEptTBxaRvK43A==
X-Received: by 2002:a19:7401:: with SMTP id v1mr3520150lfe.155.1567016619131; 
 Wed, 28 Aug 2019 11:23:39 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id 69sm1368ljj.101.2019.08.28.11.23.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 11:23:38 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-5-git-send-email-olekstysh@gmail.com>
 <e67b882b-64ff-9735-9006-b0c4592a3995@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4c7a381c-6f9c-3fd1-82e2-76f6b829d4ef@gmail.com>
Date: Wed, 28 Aug 2019 21:23:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e67b882b-64ff-9735-9006-b0c4592a3995@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 4/8] xen/common: Introduce
 xrealloc_flex_struct() helper macros
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
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI3LjA4LjE5IDE2OjI4LCBKYW4gQmV1bGljaCB3cm90ZToKCkhpIEphbgoKPiBPbiAyMC4w
OC4yMDE5IDIwOjA5LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3htYWxsb2MuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCj4+
IEBAIC0zNSw2ICszNSwxOCBAQAo+PiDCoCAjZGVmaW5lIHh6YWxsb2NfYXJyYXkoX3R5cGUsIF9u
dW0pIFwKPj4gwqDCoMKgwqDCoCAoKF90eXBlICopX3h6YWxsb2NfYXJyYXkoc2l6ZW9mKF90eXBl
KSwgX19hbGlnbm9mX18oX3R5cGUpLCBfbnVtKSkKPj4gwqAgKy8qIFJlLWFsbG9jYXRlIHNwYWNl
IGZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJyYXkgb2YgCj4+IHR5cGVkIG9iamVj
dHMuICovCj4+ICsjZGVmaW5lIHhyZWFsbG9jX2ZsZXhfc3RydWN0KF9wdHIsIF90eXBlLCBfZmll
bGQsIF9sZW4pIAo+PiAoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4K
PiBNYXkgSSBhc2sgdGhhdCB5b3UgZG9uJ3QgZXh0ZW5kIHRoZSBiYWQgdXNlIG9mIGxlYWRpbmcg
dW5kZXJzY29yZXMgaGVyZT8KClllcywgc3VyZS4KCgo+Cj4+ICvCoMKgwqAgLyogdHlwZSBjaGVj
a2luZzogbWFrZSBzdXJlIHRoYXQgaW5jb21pbmcgcG9pbnRlciBpcyBvZiBjb3JyZWN0IAo+PiB0
eXBlICovwqAgXAo+Cj4gQ29tbWVudCBzdHlsZSAoc2hvdWxkIHN0YXJ0IHdpdGggdXBwZXIgY2Fz
ZSBjaGFyKQoKb2sKCgo+Cj4+ICvCoMKgwqAgKHZvaWQpKCh0eXBlb2YoX3B0cikpIDAgPT0gKF90
eXBlICopIAo+PiAwKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPgo+IFN0cmF5IGJsYW5rcyBiZWZvcmUgMC4gQW5kIHdo
eSBub3Qgc2ltcGx5ICIodm9pZCkoKHB0cikgPT0gKHR5cGUgKikwKSI/Cj4gKFlvdSdkIG5lZWQg
dG8gYXZvaWQgdGhlIGRvdWJsZSBldmFsdWF0aW9uIG9mIHB0ciwgeWVzLikKCm9rCgoKPgo+PiAr
wqDCoMKgICgoX3R5cGUgKilfeHJlYWxsb2MoX3B0ciwgb2Zmc2V0b2YoX3R5cGUsIAo+PiBfZmll
bGRbX2xlbl0pLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gKyBfX2FsaWdu
b2ZfXyhfdHlwZSkpKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4KPiBVbm5lY2Vzc2FyeSBwYWlyIG9mIG91dGVybW9zdCBw
YXJlbnRoZXNlcy4KCm9rCgoKPgo+PiArfSkKPj4gKwo+PiArLyogQWxsb2NhdGUgc3BhY2UgZm9y
IGEgc3RydWN0dXJlIHdpdGggYSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZCAKPj4gb2JqZWN0cy4g
Ki8KPj4gKyNkZWZpbmUgeG1hbGxvY19mbGV4X3N0cnVjdChfdHlwZSwgX2ZpZWxkLCBfbGVuKSBc
Cj4+ICvCoMKgwqAgKChfdHlwZSAqKV94bWFsbG9jKG9mZnNldG9mKF90eXBlLCBfZmllbGRbX2xl
bl0pLCAKPj4gX19hbGlnbm9mX18oX3R5cGUpKSkKPgo+IEkgdGhpbmsgdGhpcyB3YW50cyB0byBn
byBhaGVhZCBvZiBpdHMgcmUtYWxsb2MgY291bnRlcnBhcnQuCgpvawoKCj4KPiBJbiBib3RoIGNh
c2VzIEknZCBhbHNvIGxpa2UgdG8gc3VnZ2VzdCB1c2luZyAibnIiIGluc3RlYWQgb2YgImxlbiIs
Cj4gYXMgc29tZXRoaW5nIGNhbGxlZCAibGVuZ3RoIiBjYW4gYmUgbWlzdGFrZW4gdG8gcmVwcmVz
ZW50IHRoZQo+IG92ZXJhbGwgbGVuZ3RoIG9mIHRoZSByZXN1bHRpbmcgb2JqZWN0LCByYXRoZXIg
dGhhbiB0aGUgbnVtYmVyIG9mCj4gYXJyYXkgZWxlbWVudHMuCgpzb3VuZHMgcmVhc29uYWJsZQoK
VGhhbmsgeW91LgoKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oIGIveGVu
L2luY2x1ZGUveGVuL3htYWxsb2MuaAppbmRleCA4MzExNTJmLi4zZWVjMTBiIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi94bWFsbG9j
LmgKQEAgLTM1LDYgKzM1LDE4IEBACiDCoCNkZWZpbmUgeHphbGxvY19hcnJheShfdHlwZSwgX251
bSkgXAogwqDCoMKgwqAgKChfdHlwZSAqKV94emFsbG9jX2FycmF5KHNpemVvZihfdHlwZSksIF9f
YWxpZ25vZl9fKF90eXBlKSwgX251bSkpCgorLyogQWxsb2NhdGUgc3BhY2UgZm9yIGEgc3RydWN0
dXJlIHdpdGggYSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZCAKb2JqZWN0cy4gKi8KKyNkZWZpbmUg
eG1hbGxvY19mbGV4X3N0cnVjdCh0eXBlLCBmaWVsZCwgbnIpIFwKK8KgwqDCoCAoKHR5cGUgKilf
eG1hbGxvYyhvZmZzZXRvZih0eXBlLCBmaWVsZFtucl0pLCBfX2FsaWdub2ZfXyh0eXBlKSkpCisK
Ky8qIFJlLWFsbG9jYXRlIHNwYWNlIGZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJy
YXkgb2YgdHlwZWQgCm9iamVjdHMuICovCisjZGVmaW5lIHhyZWFsbG9jX2ZsZXhfc3RydWN0KHB0
ciwgdHlwZSwgZmllbGQsIG5yKSAKKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKK8KgwqDCoCB0eXBlb2YoKihwdHIpKSAqcHRyXyA9IAoocHRyKTvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCivCoMKgwqAgLyogVHlwZSBjaGVja2luZzogbWFr
ZSBzdXJlIHRoYXQgaW5jb21pbmcgcG9pbnRlciBpcyBvZiBjb3JyZWN0IAp0eXBlICovwqAgXAor
wqDCoMKgICh2b2lkKSgocHRyKSA9PSAodHlwZSAKKikwKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAorwqDCoMKgICh0eXBlICopX3hyZWFsbG9jKHB0cl8sIG9mZnNldG9mKHR5
cGUsIGZpZWxkW25yXSksIApfX2FsaWdub2ZfXyh0eXBlKSk7wqDCoCBcCit9KQorCiDCoC8qIEFs
bG9jYXRlIHVudHlwZWQgc3RvcmFnZS4gKi8KIMKgI2RlZmluZSB4bWFsbG9jX2J5dGVzKF9ieXRl
cykgX3htYWxsb2MoX2J5dGVzLCBTTVBfQ0FDSEVfQllURVMpCiDCoCNkZWZpbmUgeHphbGxvY19i
eXRlcyhfYnl0ZXMpIF94emFsbG9jKF9ieXRlcywgU01QX0NBQ0hFX0JZVEVTKQooRU5EKQoKLS0g
ClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
