Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC4A26FD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 21:06:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Pj9-0000G1-LS; Thu, 29 Aug 2019 19:04:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jJ98=WZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i3Pj7-0000Ft-W5
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 19:04:58 +0000
X-Inumbo-ID: e4048e2a-ca8f-11e9-951b-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4048e2a-ca8f-11e9-951b-bc764e2007e4;
 Thu, 29 Aug 2019 19:04:57 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l11so3381380lfk.6
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2019 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2z3yyqoQ+Gn7xOwOFfVF87xjDLsUu5bHR7XmZ71e1fY=;
 b=NZRYqO4/r1srZhexM2bXF0lEit/mVX7gCc2x2ObKnQO40/gP7ajbJBDlCeqTdiywhV
 7g/AcrrSXdjy5j5bEs6Tmn05hkk7ebQ38fgi4Yl93XZlx3pJGafEabpEzAt2QsEN7NcB
 BtZ9Gjv9i1wpSY2VL0busBwFBNzTmyZF5yVBVXgssa2Jwt9sLNRulbvfqL82tTN4cLyj
 z1RpAdpkcfWL+8AZMXtZzyrfkB3KbmikFJpVfSsT9lhRSbc/GjgcuBJCVUYndzf9xA3j
 BeqqOKs1dq/r7fWs13zDHsUnKqmKNOMp6h/3b/YotSSyl4tpthm3/ldfNlcwkxmYSL1F
 /3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2z3yyqoQ+Gn7xOwOFfVF87xjDLsUu5bHR7XmZ71e1fY=;
 b=FbBq2EyAfQHm/uZ0X5s62GeZnY4ci6zGJcITGqHcR2e8AEyoM0MfCnT3OtgWtWv/4g
 Hnvl38b5rIeJfdp0LitVpdknLOhuaNbBl3ZVpM2Gq9SzJAhuRPGUplTJSCUL3g4ycKV+
 xcuAb59lDZBEGtc1k4mnmGRbV8M+0EfxPizc5QVoaOWMAtG+oJtLMxn4ESLpmmyFjjZU
 uRKAaY/rRcUs4xh1enNJGaNilssnrVwR45F/h99HiungS8DaIAB7Ad9987JgQhwVbKTy
 jM0Gm5qZCxLC/sbVhGdUifq4MUdL4ue9IMoR+zLYfisyj42GRnhUSNnNhAfqnrYmXbXe
 30iA==
X-Gm-Message-State: APjAAAUOjC9qDMbkdWgUrq3MnyE4QucZvF5XzymEeKLtBFQRGAn84CdA
 WD8dO3Q0NqsISXs2R3GIrdM=
X-Google-Smtp-Source: APXvYqzdN+v/fRD5mcflckzYBbmlOyHD3lDziHYiFrirfamjHnXKF7LXh4+TWvbbgI9PgJVeSF49LA==
X-Received: by 2002:ac2:4201:: with SMTP id y1mr7129264lfh.127.1567105496123; 
 Thu, 29 Aug 2019 12:04:56 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id b30sm513858lfq.59.2019.08.29.12.04.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 12:04:55 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-5-git-send-email-olekstysh@gmail.com>
 <e67b882b-64ff-9735-9006-b0c4592a3995@suse.com>
 <4c7a381c-6f9c-3fd1-82e2-76f6b829d4ef@gmail.com>
 <4b09510d-6961-3071-493e-53bba9536aa1@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1d30656f-c871-c20e-b664-ac80180472e2@gmail.com>
Date: Thu, 29 Aug 2019 22:04:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4b09510d-6961-3071-493e-53bba9536aa1@suse.com>
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

Ck9uIDI5LjA4LjE5IDEwOjIxLCBKYW4gQmV1bGljaCB3cm90ZToKCkhpIEphbgoKPiBPbiAyOC4w
OC4yMDE5IDIwOjIzLCBPbGVrc2FuZHIgd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi94
bWFsbG9jLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAo+PiBAQCAtMzUsNiAr
MzUsMTggQEAKPj4gICDCoCNkZWZpbmUgeHphbGxvY19hcnJheShfdHlwZSwgX251bSkgXAo+PiAg
IMKgwqDCoMKgICgoX3R5cGUgKilfeHphbGxvY19hcnJheShzaXplb2YoX3R5cGUpLCBfX2FsaWdu
b2ZfXyhfdHlwZSksIF9udW0pKQo+Pgo+PiArLyogQWxsb2NhdGUgc3BhY2UgZm9yIGEgc3RydWN0
dXJlIHdpdGggYSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZAo+PiBvYmplY3RzLiAqLwo+PiArI2Rl
ZmluZSB4bWFsbG9jX2ZsZXhfc3RydWN0KHR5cGUsIGZpZWxkLCBucikgXAo+PiArwqDCoMKgICgo
dHlwZSAqKV94bWFsbG9jKG9mZnNldG9mKHR5cGUsIGZpZWxkW25yXSksIF9fYWxpZ25vZl9fKHR5
cGUpKSkKPj4gKwo+PiArLyogUmUtYWxsb2NhdGUgc3BhY2UgZm9yIGEgc3RydWN0dXJlIHdpdGgg
YSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZAo+PiBvYmplY3RzLiAqLwo+PiArI2RlZmluZSB4cmVh
bGxvY19mbGV4X3N0cnVjdChwdHIsIHR5cGUsIGZpZWxkLCBucikKPj4gKHvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoCB0eXBlb2YoKihw
dHIpKSAqcHRyXyA9Cj4+IChwdHIpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4g
K8KgwqDCoCAvKiBUeXBlIGNoZWNraW5nOiBtYWtlIHN1cmUgdGhhdCBpbmNvbWluZyBwb2ludGVy
IGlzIG9mIGNvcnJlY3QKPj4gdHlwZSAqL8KgIFwKPj4gK8KgwqDCoCAodm9pZCkoKHB0cikgPT0g
KHR5cGUKPj4gKikwKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDC
oMKgICh0eXBlICopX3hyZWFsbG9jKHB0cl8sIG9mZnNldG9mKHR5cGUsIGZpZWxkW25yXSksCj4+
IF9fYWxpZ25vZl9fKHR5cGUpKTvCoMKgIFwKPj4gK30pCj4+ICsKPiBXaGF0IGFib3V0Cj4KPiAj
ZGVmaW5lIHhyZWFsbG9jX2ZsZXhfc3RydWN0KHB0ciwgZmllbGQsIG5yKSAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gICAgICAodHlwZW9mKHB0cikpX3hyZWFsbG9jKHB0ciwgb2Zmc2V0b2Yo
dHlwZW9mKCoocHRyKSksIGZpZWxkW25yXSksIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgX19hbGlnbm9mX18odHlwZW9mKCoocHRyKSkpKQo+Cj4gPwoKRXZlbiBiZXR0ZXIuIEFuZCB3
b3Jrcy4uLgoKVGhhbmsgeW91LgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
