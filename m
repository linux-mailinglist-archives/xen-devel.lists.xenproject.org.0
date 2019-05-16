Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327D52083C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGTK-0007EU-C3; Thu, 16 May 2019 13:30:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N6Wg=TQ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hRGTI-0007Da-4P
 for xen-devel@lists.xen.org; Thu, 16 May 2019 13:30:56 +0000
X-Inumbo-ID: d44d4054-77de-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d44d4054-77de-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:30:54 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h11so1755131ljb.2
 for <xen-devel@lists.xen.org>; Thu, 16 May 2019 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mqwaw7psmk5KqqXDL+y/8E4bonZUmp8eV5yXb1h0J0g=;
 b=QdYmNSoiA6jKgy51jy82Tl7Be8JXvc1vwxbdEv3VAaN6LMZetit6oun7RPzqNx6TZq
 W6P1E9d410PsRT4RXbN0S1tgBySioH/+MGuN1uwN22WQtkm2NqMUKRDplLuxSvlhYUtB
 RELu6ROZs55DSaV420/xBid9+6Gdgm475fXKmlYgp9HTCSPeV6vDcBrPpgn0S9+KoDYg
 +T8GKewegG48fJ6rvLdZAFIHiQA5P5kmkvM3bq9j9Yo9y/VZnOGvaWzCsO4oCIPzBthn
 +N2tHnZkwUBhDu7cSTsqvMrmn6C2lX2CJm1seQDBx/axohqDm/HNvBRSDckXCZ1HQjYK
 4v3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mqwaw7psmk5KqqXDL+y/8E4bonZUmp8eV5yXb1h0J0g=;
 b=ZzlN2JayF9COU6i7A8D1iuPOe/D2CulrcJAOAU4NB5jmS9Vdzte4rB8ED0gSRCQIDG
 iujadUP9Q92WJp2hOTTGHd4InejJPGNmwvNC6eX60lCgpZamEr79svb4A9qRif791vHv
 s6ZxV98F0mmq0/T8UCXcCvX9RqyqlbfQxN1OOTnWba8/bAUUddMizJOVenSu8Bw7X4t7
 wTCVOT//eGICJ0x16E9e/uuNYkPUoiUNgDR+cRuilKeDwK6MPoPxydHfrUDwrMVz1TDr
 yHlzKO0Na2rmBXzUXLu3AebVtGu0TGY6VSWg/oFjoaccagFsTi9tVM3oMpkgPVfeMbeG
 K/JQ==
X-Gm-Message-State: APjAAAXkeDBzQ90jJx3/HrLmPmc+cW1H6y8MmV2OWTM5ThDgi1EoGu+7
 oUh8lLAlrg8pakhm87CJ4ro=
X-Google-Smtp-Source: APXvYqyMojyDWLuiFR1sO6yZoVJYVnU5WjJgzI5klx0q6g4QXt7aOPNaWhpg/58nXr+yUqYx+ox8tg==
X-Received: by 2002:a2e:5d4f:: with SMTP id r76mr8968596ljb.49.1558013453490; 
 Thu, 16 May 2019 06:30:53 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 q6sm956620lff.26.2019.05.16.06.30.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 06:30:52 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <80187476-c972-7d88-d6f7-09c04d96705e@gmail.com>
Date: Thu, 16 May 2019 16:30:51 +0300
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
aGUgZXZlbnQgb2Ygc2ltdWx0YW5lb3VzIHN3aXRjaGluZyBvZiBzZXZlcmFsIHZjcHVzIGZyb20g
dGhlIHNhbWUgZG9tYWluIGhhcyBxdWl0ZSBoaWdoIHByb2JhYmlsaXR5LgoKLS0gClNpbmNlcmVs
eSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
