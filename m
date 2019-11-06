Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FFF216D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 23:12:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSTTo-0004rq-7d; Wed, 06 Nov 2019 22:08:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2Wv1=Y6=gmail.com=joculator@srs-us1.protection.inumbo.net>)
 id 1iSTTm-0004rl-3y
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 22:08:42 +0000
X-Inumbo-ID: fd8a2e08-00e1-11ea-adbe-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd8a2e08-00e1-11ea-adbe-bc764e2007e4;
 Wed, 06 Nov 2019 22:08:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q70so5894142wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 14:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LeL4y32kMwIOuYszilx4oc25oLRlUga0vb/Cw9Rf/VA=;
 b=YNb/+Hp5sZKLTSJGNHfDWho8xNvPDIWxLGoidgxkNwhiNWdtdwbArqLUdY3Ss8NPDu
 pwGuW7O7niBE3/RlZnzxw49zg2UkakWsltiKXLzlPf6SkmuzQxEEdWJQJ/saPQFgVO6g
 RADdQ/GoFMK1HcxBdB9Nk8/1HTyBh45xlfvmvpIOfmUxmvfU1WT7r592OqOgmPBjhciM
 b9aT8UgN+X91NQZJUzBdmLzvy2sj4hdSPOGwbI4ygT9ycm7svTyKEljqCEXjfHsrs5ks
 8HJn5unRaZKoKgAmJAQNX/FjBK5v3pQVCDsA1MguYDB0YYXNgrtiWAQbIk35cQkDs8/r
 O4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LeL4y32kMwIOuYszilx4oc25oLRlUga0vb/Cw9Rf/VA=;
 b=cm5wMKG6ozekEp3UKucuJwKde0IwqEuEQ+Tk5I9n72wj9Zw+tWYHAcmKb7+v4h1FOG
 LW1MdDIyKJwZLDACsPWB3MSssXJYwT0fCR/Hqi+uLrprEEB4qK1xjTRX/p6fk/vVzHJA
 tfNpJOFg/F7rSa0gIc+D0YRXHdr3PakVYkJ1WeO19R8/6SEU8xgfcVq2v7X0o3Sk2twb
 87VhwFv21vhPj0/ene2LBMZiid2cmWIDLwQsnJISXyhBz4CLw7MRena1fYvsNSy1gR8r
 H+WTfOhisfkL+XsZ554HusmzePzEVDZ+xgwce7mFW1oYSAu03/02zyWEcybRz6yJmQxJ
 UfHw==
X-Gm-Message-State: APjAAAVk+4LE94EG39dY177Q1pYNae/Y2pJ+sxDk4fSg49xg2x762Il6
 2rcNVtZl2cHLnFRAcTX2kzYP+4pXigEM9RvUK5s=
X-Google-Smtp-Source: APXvYqwQHJG6aHBEXtcXJHwXyUIi+Tq3hP5zGUgCEZGeVJNl8RxL7USHFaEhi1mkmK4/6oMKNS5SwORWtnLdl8hbgN8=
X-Received: by 2002:a1c:8086:: with SMTP id b128mr4515278wmd.104.1573078120288; 
 Wed, 06 Nov 2019 14:08:40 -0800 (PST)
MIME-Version: 1.0
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-3-git-send-email-andrii.anisov@gmail.com>
 <7d3b0692-11e1-ad70-618b-c17318a2f257@suse.com>
In-Reply-To: <7d3b0692-11e1-ad70-618b-c17318a2f257@suse.com>
From: Artem Mygaiev <joculator@gmail.com>
Date: Wed, 6 Nov 2019 23:08:40 +0100
Message-ID: <CAJwc6KsiYYFEjV=My+J1mrFCEYO-gS-SH9oqSwj7nzWjn4C-kA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSmFuCgpPbiBXZWQsIE5vdiA2LCAyMDE5IGF0IDQ6MjggUE0gSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPgo+IE9uIDA2LjExLjIwMTkgMTA6MTksIEFuZHJpaSBB
bmlzb3Ygd3JvdGU6Cj4gPiBGcm9tOiBBcnRlbSBNeWdhaWV2IDxqb2N1bGF0b3JAZ21haWwuY29t
Pgo+ID4KPiA+IFN0aWxsIGhhdmUgbGlua2VyIGlzc3Vlcwo+Cj4gVGhpcyBtYXkgYmUgYWNjZXB0
YWJsZSBmb3IgYW4gUkZDIHNlcmllcywgYnV0IGRvZXNuJ3QganVzdGlmeSB0aGVyZQo+IG5vdCBi
ZWluZyBhbnkgb3RoZXIgZGVzY3JpcHRpb24uIEp1c3QgdG8gZ2l2ZSBhbiBleGFtcGxlLEknZCBs
aWtlIHRvCj4gdW5kZXJzdGFuZCB3aHkgLi4uCj4KPiA+IC0tLSBhL0NvbmZpZy5tawo+ID4gKysr
IGIvQ29uZmlnLm1rCj4gPiBAQCAtMjIxLDcgKzIyMSw5IEBAIENGTEFHUyArPSAtV2FsbCAtV3N0
cmljdC1wcm90b3R5cGVzCj4gPgo+ID4gICQoY2FsbCBjYy1vcHRpb24tYWRkLEhPU1RDRkxBR1Ms
SE9TVENDLC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50KQo+ID4gICQoY2FsbCBjYy1vcHRp
b24tYWRkLENGTEFHUyxDQywtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCkKPiA+ICtpZm5l
cSAoJChhcm1kcykseSkKPiA+ICAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsLVduby11
bnVzZWQtYnV0LXNldC12YXJpYWJsZSkKPiA+ICtlbmRpZgo+ID4gICQoY2FsbCBjYy1vcHRpb24t
YWRkLENGTEFHUyxDQywtV25vLXVudXNlZC1sb2NhbC10eXBlZGVmcykKPiA+Cj4gPiAgTERGTEFH
UyArPSAkKGZvcmVhY2ggaSwgJChFWFRSQV9MSUIpLCAtTCQoaSkpCj4KPiAuLi4gdGhpcyB3b3Vs
ZCBiZSBuZWNlc3NhcnkuCgpJIGFtIHZlcnkgc29ycnksIHRoaXMgcGF0Y2ggZG9lcyBub3QgaGF2
ZSBhIHByb3BlciBkZXNjcmlwdGlvbiBpbmRlZWQuCgpGb3IgdGhpcyBwYXJ0aWN1bGFyIGNoYW5n
ZSAtIGFybSBjbGFuZyBkb2VzIG5vdCB1bmRlc3RhbmQKLVduby11bnVzZWQtYnV0LXNldC12YXJp
YWJsZQpvcHRpb24gYXQgYWxsLCB0aGF0IGlzIHdoeSBpdCBpcyB1bmRlciAhJChhcm1kcykKCj4K
PiBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
