Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9D98100
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 19:07:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0U1u-0006C0-Aq; Wed, 21 Aug 2019 17:04:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yiYo=WR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i0U1s-0006Bv-OS
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 17:04:12 +0000
X-Inumbo-ID: b212f29a-c435-11e9-951b-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b212f29a-c435-11e9-951b-bc764e2007e4;
 Wed, 21 Aug 2019 17:04:11 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x3so2374204lfc.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2019 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Nlee8yzE02GV6gZtKu0VJ3fynxxeR3A1HGcbP1N4zac=;
 b=GIEhxVVjeJZxmBx3Ka6glDCVtwqPze9iPN6dNWm9OABCOjRR7hFLqDzG/WcyxuUhws
 fh7WSpb6WOGyJiAn4oDUCjGwSfhaLMJgx68XRuGgseLMVUQSWtUXhQOfFexZHmpnaslp
 7b6ACV5VWtKWacgyeE4tjJnjBkxyuk0EP0nIx3q4qmUd+q1HSlWDruirX9Y4XZSn38z4
 1EN6rxBS3kxGguFWezJsv4ozdTWmA+8ocJKfzhjPtZcHIJU9eqrvY0lrDjcpaaNWhDzW
 un4GNtFP7kakbafqG2es8MbnUIYmFJSUcwz09aIyho70gXGwDnAdcgtC8aKPPme1R3ou
 xpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Nlee8yzE02GV6gZtKu0VJ3fynxxeR3A1HGcbP1N4zac=;
 b=F+i735gyXlS5WWlc0V4jO4kcq/NouyN/5Gcc0bcBjrWO/loVdl77Xz2xyIgbXEsuH5
 2wQG+fsYzblZvs12gpOpFs2WkRipj1lfkPk4fbsUxx1htbLrYlUqPr20/jKH7R+KgWzi
 txkT19eCgW0shZWvt9fVRzU/r5obVQ3OxS4LPjP1ADgWxqKOzUlMR3yEZy7GyCbLjjT2
 qZQUGPjNxAN0+FS9lCQFzETswFxwHUnf0gs8mpk7l6gH/wl2HQXsUreliReC5m/hyLfJ
 X4SE+5pXlV6YwbKKWjYx8tqyehHXOLm1b0n4jKs6ZOKeN5GoiHlTSpWROvwO3ZbhAjQF
 3UHQ==
X-Gm-Message-State: APjAAAXvoGWFihW7OiBy8x2WjyvQ/QFVZe4J1ZjnYp2BUwYTGlrIQCF8
 DL9jfcBV+8rCK8UPe/a490g=
X-Google-Smtp-Source: APXvYqxHHpgWSZT/sR4sFNmLK3FiwMhTbb5bLMRtGXenqtnHDcRiFVPWalmGPB614xoisnHXxWc0KQ==
X-Received: by 2002:ac2:5104:: with SMTP id q4mr20054119lfb.56.1566407050638; 
 Wed, 21 Aug 2019 10:04:10 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id n9sm1884154ljj.62.2019.08.21.10.04.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 10:04:10 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-4-git-send-email-olekstysh@gmail.com>
 <a12616b4e61e418ab2d17a5e0ed02754@AMSPEX02CL03.citrite.net>
 <5cac4d1b-2406-a8e8-90c2-e04176a837ae@gmail.com>
 <51167370fc2d4853bd0d34df1b4dfb24@AMSPEX02CL03.citrite.net>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0759e91a-a695-565f-de70-7701fb562e3e@gmail.com>
Date: Wed, 21 Aug 2019 20:04:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <51167370fc2d4853bd0d34df1b4dfb24@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 3/8] xen/common: Introduce _xrealloc
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIxLjA4LjE5IDE4OjQ3LCBQYXVsIER1cnJhbnQgd3JvdGU6CgpIaQoKPj4KPj4gWW91IHNo
b3VsZCBhbHNvIGNoZWNrIHdoZXRoZXIgdGhlIG5ldyByZXF1ZXN0ZWQgYWxpZ25tZW50IGlzIGNv
bXBhdGlibGUgd2l0aCB0aGUgZXhpc3RpbmcgYmxvY2sKPj4gYWxpZ25tZW50Cj4+Cj4+Cj4+IEkg
YW0gd29uZGVyaW5nOgo+Pgo+PiBJbiBjYXNlIHdoZW4gd2UgdXNlIG9ubHkgdHlwZS1zYWZlIGNv
bnN0cnVjdGlvbiBmb3IgdGhlIGJhc2ljIGFsbG9jYXRpb24KPj4gKHhtYWxsb2MpIGFuZCB0eXBl
LXNhZmUgY29uc3RydWN0aW9uIGZvciB0aGUgcmUtYWxsb2NhdGlvbgo+PiAoeHJlYWxsb2NfZmxl
eF9zdHJ1Y3QpIG92ZXIgdGhlIHNhbWUgcG9pbnRlciBvZiB0aGUgY29ycmVjdCB0eXBlLCB3aWxs
Cj4+IHdlIGdldCBhIHBvc3NpYmxlIGFsaWdubWVudCBpbmNvbXBhdGliaWxpdHk/Cj4gWW91IHNo
b3VsZG4ndCBidXQgeW91J3JlIHRydXN0aW5nIHRoYXQgbm8tb25lIHdpbGwgd2FudCB0byBjYWxs
IHRoZSBmdW5jdGlvbiBkaXJlY3RseSB3aXRoIGEgaGlnaGVyIGFsaWdubWVudC4KClllcywgaXQg
aXMgYmVzdCB0byBiZSBvbiB0aGUgc2FmZSBzaWRlLgoKCj4gICAKPj4KPj4gVGhpcyBpcyBob3cg
SSBzZWUgaXQ6Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jIGIv
eGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYwo+PiBpbmRleCBlZWNhZTJlLi5mOTBmNDUzIDEwMDY0
NAo+PiAtLS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCj4+ICsrKyBiL3hlbi9jb21tb24v
eG1hbGxvY190bHNmLmMKPj4gQEAgLTYxNiw4ICs2MTYsMTUgQEAgdm9pZCAqX3hyZWFsbG9jKHZv
aWQgKnB0ciwgdW5zaWduZWQgbG9uZyBzaXplLAo+PiB1bnNpZ25lZCBsb25nIGFsaWduKQo+PiAg
IMKgwqDCoMKgwqDCoMKgwqAgY3Vycl9zaXplID0gUEZOX09SREVSKHZpcnRfdG9fcGFnZShwdHIp
KSA8PCBQQUdFX1NISUZUOwo+PiAgIMKgwqDCoMKgIGVsc2UKPj4gICDCoMKgwqDCoCB7Cj4+IC3C
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYmhkciAqYjsKPj4gLcKgwqDCoMKgwqDCoMKgIGIgPSAoc3Ry
dWN0IGJoZHIgKikoKGNoYXIgKilwdHIgLSBCSERSX09WRVJIRUFEKTsKPj4gK8KgwqDCoMKgwqDC
oMKgIHN0cnVjdCBiaGRyICpiID0gKHN0cnVjdCBiaGRyICopKChjaGFyICopcHRyIC0gQkhEUl9P
VkVSSEVBRCk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICggYi0+c2l6ZSAmIEZSRUVfQkxP
Q0sgKQo+PiArwqDCoMKgwqDCoMKgwqAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwID0g
KGNoYXIgKilwdHIgLSAoYi0+c2l6ZSAmIH5GUkVFX0JMT0NLKTsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYiA9IChzdHJ1Y3QgYmhkciAqKSgoY2hhciAqKXAgLSBCSERSX09WRVJIRUFEKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVNTRVJUKCEoYi0+c2l6ZSAmIEZSRUVfQkxPQ0sp
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gKwo+PiAgIMKgwqDCoMKgwqDCoMKgwqAgY3Vycl9z
aXplID0gYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFTSzsKPiBZZXMsIHRoYXQgbG9va3Mgb2sgZm9y
IGdldHRpbmcgdGhlIHNpemUgcmlnaHQuLi4KPgo+PiAgIMKgwqDCoMKgIH0KPj4KPj4gQEAgLTYz
MCw4ICs2MzcsOCBAQCB2b2lkICpfeHJlYWxsb2Modm9pZCAqcHRyLCB1bnNpZ25lZCBsb25nIHNp
emUsCj4+IHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCB0bXBfc2l6
ZSA9ICggdG1wX3NpemUgPCBNSU5fQkxPQ0tfU0laRSApID8gTUlOX0JMT0NLX1NJWkUgOgo+PiAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBST1VORFVQX1NJWkUodG1wX3NpemUpOwo+Pgo+PiAt
wqDCoMKgIGlmICggdG1wX3NpemUgPD0gY3Vycl9zaXplICkgLyogZml0cyBpbiBjdXJyZW50IGJs
b2NrICovCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gcHRyOwo+PiArwqDCoMKgIGlmICggdG1w
X3NpemUgPD0gY3Vycl9zaXplICYmICgodW5zaWduZWQgbG9uZylwdHIgJiAoYWxpZ24gLSAxKSkg
PT0gMCApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcHRyOyAvKiBmaXRzIGluIGN1cnJlbnQg
YmxvY2sgKi8KPiAuLi5hbmQgdGhhdCBzaG91bGQgZGVhbCB3aXRoIHRoZSBhbGlnbm1lbnQgdG9v
IChhbHRob3VnaCB5b3UgbWF5IHdhbnQgdG8gbWVudGlvbiB0aGUgYWxpZ25tZW50IHBhcnQgaW4g
dGhlIGNvbW1lbnQgdG9vKQo+Cj4+ICAgwqDCoMKgwqAgcCA9IF94bWFsbG9jKHNpemUsIGFsaWdu
KTsKPj4gICDCoMKgwqDCoCBpZiAoIHAgKQo+Pgo+PiAoRU5EKQo+Pgo+Pgo+PiBEaWQgSSBnZXQg
eW91ciBwb2ludCBjb3JyZWN0Pwo+Pgo+IFllcywgd2l0aCB0aG9zZSBjaGFuZ2VzIEkgdGhpbmsg
aXQgd2lsbCBsb29rIG9rLgoKVGhhbmsgeW91LgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5
c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
