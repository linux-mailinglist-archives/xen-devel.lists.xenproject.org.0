Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A7769D6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:54:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0eC-0000Of-J4; Fri, 26 Jul 2019 13:52:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxDH=VX=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hr0eB-0000Oa-JI
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:52:35 +0000
X-Inumbo-ID: 9e4476b0-afac-11e9-8980-bc764e045a96
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9e4476b0-afac-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:52:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id n9so29451919wrr.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 06:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WD3wPDaZADFRnuvgiasIBFG8xBUFXKjWEtNfsudmnKU=;
 b=qatGa11wrltpDw3KUUfrMmprMKFqEe/4NFn94WMGBoj0pPiFkD0rkI3b8O/2cJVzw3
 PsXs0YW7myEwZawWv8w5GHnhvPQawNOowHiyCpt16ygNSgLyyVMfREIlMY8tg8JxVkJl
 7zTuz1fMbildSou2ygZeRcR3BdbloHgHkpDwHnCKDH5wll56ZJ6d8H7MRpaMYvbJB5wE
 E/BJeKmROqjT9izwMuSGCIMcn3t11m66pB3FyCsw2lFgS54WjoPz6ppQm5Ik7oMCAfbQ
 1ruF6bjJxrRLFCQrGv+B8UgkQc7k+UinJ5dW7YnXVhDQJ2y/pkEV2dddicuJH/j6YJRh
 2zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WD3wPDaZADFRnuvgiasIBFG8xBUFXKjWEtNfsudmnKU=;
 b=eSdyu2LgO1aybu6IRl2+JwBIXr9FTI9DNNuJze800aUsNrm9rMPh/CynYU3uRYr8DW
 2CjwzVhKHY/Pj49kdchG0oJRhiTsS1Z6LEW6SYeJkbXN5olq0Ik/wZbLRh/UYce6rgWm
 cyAnTOYGV3rZuPodpMX4yJKJKuOi+8GvyOBCBwcNcflwY5IWbRbCmx8TN68Xt68A5ojy
 8Ptf+GffKg7NYmtybbPKNTyrCz/C6EjalEwOOawFsEiOR25mypKeek3yecZcAdGt9Ver
 pa3vRB1cBoDiYi/K9LjNvYIjzevA+usTF3UnmmlZHfzyinur5qYmyJKlW4ep/wD2usY2
 tLOg==
X-Gm-Message-State: APjAAAXrUxpAQElZEsYOrvXlE/c7cwHX2we4QlOyOwDO0rl7yOHLtt/Q
 64KCG2flX2DoO3zKW7iq64U=
X-Google-Smtp-Source: APXvYqxUcQIB15Kg+qsvh8d3VYAQ0atiiyoP7lQMvFN0TxgbKvdohUM2/o3fpd1/FhJgR0s/Rx9B1A==
X-Received: by 2002:a5d:4b91:: with SMTP id b17mr63583419wrt.57.1564149152693; 
 Fri, 26 Jul 2019 06:52:32 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:1d44:aeab:d929:303?
 ([2a02:c7f:ac18:da00:1d44:aeab:d929:303])
 by smtp.gmail.com with ESMTPSA id p6sm57833115wrq.97.2019.07.26.06.52.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:52:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <CAOcoXZbXPys+LjzhwP5f75rcKSXKatmPSaiA+MvVVm0_FWK7GA@mail.gmail.com>
Date: Fri, 26 Jul 2019 14:52:30 +0100
Message-Id: <D8A1ACAC-5830-4C1A-8A85-A86C5B05246D@gmail.com>
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <CAOcoXZbXPys+LjzhwP5f75rcKSXKatmPSaiA+MvVVm0_FWK7GA@mail.gmail.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Committers <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDI2IEp1bCAyMDE5LCBhdCAxNDo0NSwgVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4u
MTlAZ21haWwuY29tPiB3cm90ZToKPiAKPj4gSGkgVmlrdG9yLAo+IAo+IEhpIExhcnMsCj4gCj4+
IHRoYW5rIHlvdSBmb3IgcHV0dGluZyB0aGlzIG1haWwgdG9nZXRoZXIgYW5kIGRyaXZpbmcgdGhp
cyBmb3J3YXJkLiBJIGFkZGVkIGNvbW1pdHRlcnNAIGFzIHdlbGwgYXMgRG91Zy4gSSBhbSBnb2lu
ZyB0byBsZXQgb3RoZXJzIHJlc3BvbmQgZmlyc3QuCj4+IEkgYW0gYXNzdW1pbmcgd2UgYXJlIGxv
b2tpbmcgZm9yIHNvbWUgdGVzdGluZz8KPiAKPiBZZXMsIHlvdSBhcmUgcmlnaHQuCj4gVGhlIGlt
cGxlbWVudGF0aW9uIGhhcyBiZWVuIHVwZGF0ZWQgYW5kIHJldGVzdGVkIHdpdGggbmV3ZXIgdmVy
c2lvbnMKPiBvZiBjbGFuZyBjb2RlLgo+IFdlIGFyZSBsb29raW5nIGZvciBzb21lIHRlc3Rpbmcg
YW5kIGZlZWRiYWNrIHRvIG1vdmUgZm9yd2FyZC4KPiAKPj4gSXMgdGhlcmUgYSBzaW1wbGUgc2V0
IG9mIGluc3RydWN0aW9ucyB0byBnZXQgc3RhcnRlZCBhbmQgdGVzdCB0aGUgdG9vbD8KPiAKPiBZ
ZXMsIGhvd2V2ZXIsIHNpbmNlIHRoZSBjaGFuZ2VzIGFyZSBub3QgaW50ZWdyYXRlZCBpbnRvIGNs
YW5nLWZvcm1hdAo+IG1haW5saW5lIHlldCwKPiB0byB0ZXN0IHRoZSB0b29sIGl0IG5lZWRzIHRv
IGNvbXBpbGUgY2xhbmctZm9ybWF0IHRvb2wgd2l0aCB0aGUgcGF0Y2ggZmlyc3QuCgpPSwpJcyB0
aGVyZSBhIGdpdCByZXBvIHdoaWNoIGluY2x1ZGVzIHRoZSBwYXRjaD8gVGhhdCB3b3VsZCBtYWtl
IHRoaW5ncyBhIGxpdHRsZSBlYXNpZXIKCj4gVGhlcmUgYXJlIHR3byB1c2UtY2FzZXMgd2l0aCBp
dDoKPiAtIGNsYW5nLWZvcm1hdCBiaW5hcnkgY2FuIGJlIHVzZWQgYXMtaXMgdG8gY2hlY2sgZ2l2
ZW4gZmlsZSBvciBtYW55IGZpbGVzLgo+IEZvciBleGFtcGxlLCB0aGUgbmV4dCBjb21tYW5kIGZv
cm1hdHMgYWxsIHhlbiAqLmMgZmlsZXMgd2l0aCBpdC4KPiBmaW5kIH4vdy94ZW4veGVuIC1uYW1l
ICcqLmMnIC1wcmludDAgfCB4YXJncyAtMCAtbiAxIC1QIDEyCj4gfi93L2xsdm0tcHJvamVjdC9i
aW4vY2xhbmctZm9ybWF0IC1pIC1zdHlsZT14ZW4KPiAKPiBTZWUgb3V0cHV0IGV4YW1wbGUgaW46
Cj4gaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3Zpa3Rvci1taXRpbi94ZW4tY2xh
bmctZm9ybWF0LWV4YW1wbGUvbWFzdGVyLzAwMDEtY2xhbmctZm9ybWF0LWNoZWNrcGF0Y2gtb3V0
cHV0LWV4YW1wbGUucGF0Y2gKPiAKPiAtIGFub3RoZXIgdXNlLWNhc2UgaXMgdG8gcnVuIGl0IHdp
dGggY2xhbmctZm9ybWF0IGRpZmYgY2hlY2tlciwKPiBGb3IgZXhhbXBsZSwgdGhlIG5leHQgY29t
bWFuZCBsaW5lIGNoZWNrcyB0aGUgbGF0ZXN0IGNvbW1pdCBpbiBjYXNlIG9mIGdpdDoKPiBnaXQg
ZGlmZiAtVTAgLS1uby1jb2xvciBIRUFEXiB8IGNsYW5nLWZvcm1hdC1kaWZmIC1wMQoKRG9lcyB0
aGlzIHJlcXVpcmUgdG8gY29weSB0aGUgbW9kaWZpZWQgY2xhbmctZm9ybWF0LWRpZmYucHkgKHdo
aWNoIGlzIG1lbnRpb25lZCBpbiB0aGUgbWFpbCkgc29tZXdoZXJlCgpMYXJzCgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
