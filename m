Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8A20842
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGT1-00076y-55; Thu, 16 May 2019 13:30:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N6Wg=TQ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hRGSz-00076R-DQ
 for xen-devel@lists.xen.org; Thu, 16 May 2019 13:30:37 +0000
X-Inumbo-ID: c9412953-77de-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c9412953-77de-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:30:36 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w1so3154062ljw.0
 for <xen-devel@lists.xen.org>; Thu, 16 May 2019 06:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t7lI4WOk/bYAyJxw8FstfOpNgsO0ur/kOD9bmUDyXqY=;
 b=NVkBFsSicZWuBEpkIdW9PcqUmM0sbHGPMlpnTSk5X5yB31FvgbZM/ygux2+aqcg4yr
 9j0NbsShUu1FkdfrQpLaTVYUMFPS3D9Yi2SX0wic1x5t8Fx90r55cm41nF4EPpxBRIig
 6AiSzdoS4h/b6g7w2q4WLiyKhjW8nrWL4mFYKos1+Vz3xapOJfqDbFeMNaDf5Y+wRNyJ
 xxTQ/62FqufMl/Aw17vniEnvjU7KLY+u65A7Z9Z4+aKV80IcmiB4NHIC/1TwipHp7uuk
 770GQJjeTMwtWK9TGzH3YysrMqNi7zc72Dl6h5YRyd3286DS+GNRf70iexGeimkYgE/y
 ED9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t7lI4WOk/bYAyJxw8FstfOpNgsO0ur/kOD9bmUDyXqY=;
 b=tb4HeOJInyeu4pYymJQFqDdcbzS6Cr8808ge3mO30ftlAkgWd2RVHde+XVRp+jUPNv
 58+Pxy3n2+imW9P6PSdV4RWwO/v3l6ZMX2sJ2i1GNFKcJKHccHcGNfEoglJhSS963mdh
 TJPyY3YxQkHDK3B//hg4ByWpfgAoBjMoP9hz17/KbEg4oAK1c6mp4Q5nD9HzcbAsR4Uw
 lXvhfbMwDHDcB1zp4UPNXtr/BN/WlaLz9yaHC6bjlWsls/6IoGXS0xWJDWNaUSAlu6r9
 +iuV+aeJYuNXckoGoSAyRwC94bPxcw4nuAQmf+OUdOzDJVQ34ShqJn+6PgKXQbF1+GVc
 qvKQ==
X-Gm-Message-State: APjAAAUDOb7KaRv+Vvno/c6DNEO2Y1eXkNbFJc/i8HfuszUiFcGMh5V4
 XIMICv+my+UX6kQF20nCOas=
X-Google-Smtp-Source: APXvYqxNqKKTkKD7XE9lMe6I3mTbTyWr6itrICaANHD7FODUeVCpzBW44UNTMzTv4ytjRRdzJM5M7Q==
X-Received: by 2002:a2e:c41:: with SMTP id o1mr18479822ljd.23.1558013434812;
 Thu, 16 May 2019 06:30:34 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 c10sm962498lfh.79.2019.05.16.06.30.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 06:30:33 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <e6e788f4-f74e-758d-997d-a01d50a80025@gmail.com>
Date: Thu, 16 May 2019 16:30:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSmFuLAoKT24gMTYuMDUuMTkgMTU6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDIzLjA0LjE5IGF0IDEwOjEwLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3RlOgo+PiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaAo+PiBAQCAtMTYzLDE1ICsxNjMsMjMgQEAgc3RydWN0IHZjcHUKPj4gICAgICAgdm9pZCAg
ICAgICAgICAgICpzY2hlZF9wcml2OyAgICAvKiBzY2hlZHVsZXItc3BlY2lmaWMgZGF0YSAqLwo+
PiAgIAo+PiAgICAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvIHJ1bnN0YXRlOwo+PiArCj4+
ICsgICAgc3BpbmxvY2tfdCAgICAgIG1hcHBlZF9ydW5zdGF0ZV9sb2NrOwo+IAo+IEJlc2lkZXMg
b3RoZXIgY29tbWVudHMgZ2l2ZW4gZWxzZXdoZXJlIGFscmVhZHkgLSBkb2VzIHRoaXMKPiByZWFs
bHkgbmVlZCB0byBiZSBhIHBlci12Q1BVIGxvY2s/IEd1ZXN0cyBhcmVuJ3QgZXhwZWN0ZWQgdG8K
PiBpbnZva2UgdGhlIEFQSSBmcmVxdWVudGx5LCBzbyBxdWl0ZSBsaWtlbHkgYSBwZXItZG9tYWlu
IGxvY2sKPiB3b3VsZCBzdWZmaWNlLiBRdWl0ZSBwb3NzaWJseSBkb21haW5feyx1bn1sb2NrKCkg
Y291bGQKPiBhY3R1YWxseSBiZSAocmUtKXVzZWQuCgpJJ2Qgbm90IHVzZSBhIHBlci1kb21haW4g
bG9jayBoZXJlLiBUaGlzIGxvY2sgd2lsbCBiZSBsb2NrZWQgb24gZXZlcnkgcnVuc3RhdGUgYXJl
YSB1cGRhdGUsIHdoYXQncyBoYXBwZW5pbmcgb24gZXZlcnkgY29udGV4dCBzd2l0Y2guIEFuZCB0
aGUgZXZlbnQgb2Ygc2ltdWx0YW5lb3VzIHN3aXRjaGluZyBvZiB2Y3B1cyBmcm9tIHRoZSBzYW1l
IGRvbWFpbiBoYXMgcXVpdGUgaGlnaCBwcm9iYWJpbGl0eS4KCi0tIApTaW5jZXJlbHksCkFuZHJp
aSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
