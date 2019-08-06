Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51091838FF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 20:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv4XL-0005V4-6Z; Tue, 06 Aug 2019 18:50:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OvbI=WC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hv4XJ-0005Uz-BW
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 18:50:17 +0000
X-Inumbo-ID: 07226747-b87b-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 07226747-b87b-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 18:50:16 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v18so83049686ljh.6
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BJLYNt5lV+86JMgTXIKoRNijEW6XVd/pLvIjKCPYC3U=;
 b=LXZBdn8QofhwnOUpESeL4hZqCUm8KxxnDUU5PyV8I2ctaaInwdymUxBQYfkFA1tikc
 /pE9bzY93M9tLFVe2i5LBkaFSOip7C6mHauYOzWW5h+39Y+qqxFK9jJkm6M47PFxLtnD
 5UxQH2FhNMwD/yKO3HZvb1zeVHAGiAp9aRdgECW4DsymAqXmVi8z5hDUk1MZBuybqgB5
 0KzWX8FdGszS8oQViXXxhqUMLWRz0WyifBXpG844fztBpo578T2mv4jBxBaIS8I1Vqt0
 eFOLd+WqVNW9/Vo++rIV+N+2ANlJ8LXA6V8XWQmI4w8R8E9bN2VFNnXI6JCji3lrAXZd
 dOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BJLYNt5lV+86JMgTXIKoRNijEW6XVd/pLvIjKCPYC3U=;
 b=mNL96e2EjOsruRz8Yoh9gY2OhDrWW0+HX0lrI7rSgaSzWwLBMZpNh0VwLQZIc6svYu
 IsMaHkta2gJt19hixD91hL+eFQYtuGa+u9oPR41BirwNabngYaZo2y6jSg8E3Pft62ms
 USiyXyHkvL+BoONEOQGaLFl4tAufYDXg+ZE6hCQ0gGmmW3Sp4XUlYcLPouc7FoTN+GHd
 cEc/6YhylhMFdFTkLufxYa9nu0buK9W/Iigk3q/7YuQ/rvMvxC3Tjgbe1SHH++lKFW/e
 Q61h0nKCf+Vjj1tZmd73KEs8bVha7HqfFb+DX8v6Vr9zh1TFKtqxpRRzIe84+7k35djE
 jnrw==
X-Gm-Message-State: APjAAAWDHRDtG3YTaJdFBd03YkV5xigirN7I/P2g0IlNPdkX2Gn5sETZ
 FtyKwr64r/mOvY4rIv0pps8=
X-Google-Smtp-Source: APXvYqwiFrnKC81MmWw/4YA692R0t39rJUPGVb+7/H4w05t5V6pDpqAZD+HI2/QSdx2A3eHC7odDLA==
X-Received: by 2002:a2e:9198:: with SMTP id f24mr2559772ljg.221.1565117414552; 
 Tue, 06 Aug 2019 11:50:14 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id h1sm15848587lfj.21.2019.08.06.11.50.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 11:50:13 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
 <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <760df686-ef36-e400-4ef3-c51334694b68@gmail.com>
Date: Tue, 6 Aug 2019 21:50:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDA1LjA4LjE5IDEzOjAyLCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4gV2hpbGUg
SSBjYW4gc2VlIHdoeSBoYXZpbmcgYSByZS1hbGxvY2F0aW9uIGZ1bmN0aW9uIG1heSBiZSBoYW5k
eSwKPiBleHBsaWNpdCAvIGRpcmVjdCB1c2Ugb2YgX3htYWxsb2MoKSBhbmQgX3h6YWxsb2MoKSBh
cmUgZGlzY291cmFnZWQsCj4gaW4gZmF2b3Igb2YgdGhlIG1vcmUgdHlwZS1zYWZlIHVuZGVyc2Nv
cmUtbGVzcyB2YXJpYW50cy4KCnRvb2sgaW50byBhY2NvdW50CgoKPiBJIGNhbid0Cj4gc2VlIHRo
b3VnaCBob3cgYSB0eXBlLXNhZmUgInJlYWxsb2MiIGNvdWxkIGxvb2sgbGlrZSwgZXhjZXB0IGZv
cgo+IGFycmF5cy4gSWYgcmVzaXppbmcgYXJyYXlzIGlzIGFsbCB5b3UncmUgYWZ0ZXIsIEknZCBs
aWtlIHRvCj4gcmVjb21tZW5kIHRvIGdvIHRoYXQgcm91dGUgcmF0aGVyIHRoZW4gdGhlIHN1Z2dl
c3RlZCBvbmUgaGVyZS4gSWYKPiByZXNpemluZyBhcmJpdHJhcnkgb2JqZWN0cyBpcyB0aGUgZ29h
bCwgdGhlbiB3aGF0IHlvdSBzdWdnZXN0IG1heQo+IGJlIHRoZSBvbmx5IHJvdXRlLCBidXQgSSdk
IHN0aWxsIGJlIG5vdCBvdmVybHkgaGFwcHkgdG8gc2VlIHN1Y2gKPiBhZGRlZC4KCk15IG1haW4g
Z29hbCBpcyB0byBnZXQgInBvcnRlZCIgZnJvbSBMaW51eCAiaW9tbXVfZndzcGVjIiBzdXBwb3J0
IAooeHJlYWxsb2MgdXNlcikgaW4gWzFdLgoKSSB0cmllZCB0byByZXRhaW4gY29kZSBhcyBtdWNo
IGFzIHBvc3NpYmxlIHdoaWxlIHBvcnRpbmcuIFNvLCB0aGlzIHBhdGNoIAphZGRzIGFsbW9zdCB0
aGUgc2FtZSB0aGluZyB3aGF0IHRoZSBwb3J0ZWQgY29kZSBleHBlY3RzLgoKQnV0LCBJIHdvdWxk
IGJlIE9LIHRvIGNvbnNpZGVyIG1vZGlmeWluZyBhIGNvZGUgaW4gYSB3YXkgdG8gcmVzaXplIGFu
IAphcnJheSBhcyB3ZWxsIGFzIGFueSBvdGhlciB2YXJpYW50cyBpZiBwcmVzZW50LgoKCj4KPiBG
dXJ0aGVybW9yZSB5b3UgZG9uJ3QgZXZlbiB1c2UgaW50ZXJuYWxzIG9mIHRoZSBhbGxvY2F0b3I6
IEl0IGlzCj4gY29tbW9uIHByYWN0aWNlIHRvIGF2b2lkIHJlLWFsbG9jYXRpb24gaWYgdGhlIHJl
cXVlc3RlZCBzaXplIGZpdHMKPiB3aXRoaW4gdGhlIGFscmVhZHkgYWxsb2NhdGVkIGJsb2NrLiBU
aGF0J3Mgbm90IHRoZSBsZWFzdCBoZWxwZnVsCj4gYmVjYXVzZSBpbiBzdWNoIGEgY2FzZSB5b3Ug
Y2FuJ3QgcG9zc2libHkgc3VmZmVyIGFueSAtRU5PTUVNCj4gY29uZGl0aW9uLgoKYWdyZWUsIHRv
b2sgaW50byBhY2NvdW50IGFzIHdlbGwuCgoKPgo+IEFuZCBmaW5hbGx5IC0gcGxlYXNlIG5vdGUg
X3htYWxsb2MoKSdzIGFuZCBfeGZyZWUoKSdzIHVzZSAvCj4gc3BlY2lhbCBjYXNpbmcgb2YgWkVS
T19CTE9DS19QVFI6IFlvdSBhYnNvbHV0ZWx5IHdvdWxkIG5lZWQgdG8KPiBtaXJyb3IgdGhpcyBo
ZXJlLgoKZ290IGl0LCB3aWxsIHVzZSBmb3IgemVyby1zaXplIGFsbG9jYXRpb24KCgpbMV0gCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0w
OC9tc2cwMDI1Ny5odG1sCgoKVGhhbmsgeW91LgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5
c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
