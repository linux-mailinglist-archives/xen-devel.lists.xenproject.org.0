Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09C132997
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 16:06:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioqP8-0006Ej-0d; Tue, 07 Jan 2020 15:04:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7mJ3=24=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ioqP6-0006Ee-Vo
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 15:04:21 +0000
X-Inumbo-ID: fb190bc8-315e-11ea-bf56-bc764e2007e4
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb190bc8-315e-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 15:04:20 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t2so54316797wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 07:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JiSjVjCKG37n23RiRWXBTmE8jsv3wHbIZ47JxseBRbo=;
 b=FaP8tH6coTvep3MaJ68dM1oCFk9+DQEq0bkbbZedMo/CqIgQVddPS3IUyL7FdzD8sG
 bUmhiCCJZAUNpfHAN705Q/NEo0M1RVfAOA1oDxfPQse90fswUydGfqHb/iR37+AmQL2N
 dqb8/6VrXDmpMF/joMMNJza+5Kks0p4sHEuWza7p0TEIAl3uTFekxfLxMwoT0KO3nYCB
 P7RQ8FS38BbR+/c5liHAB5I4Dpmek36ArHLebRTH9ISTGCguvwQfyeXe9k93+csweas4
 hH7DHFJkIowJSQvoImdLGt6ETsZQ7IO+485JYfCTxF7Q0UklS/RCzqVLbnIoQQJjSDcJ
 OYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JiSjVjCKG37n23RiRWXBTmE8jsv3wHbIZ47JxseBRbo=;
 b=orFsMXH6wOymCLej6JYgYkb+QGg6m2ceKyPZoYCvCNW4M8qM+cWYPdVjXiB3IGo0Qg
 LaEJE9s2gTw9fgc4538RFbxgxlPxHNfEYUVQY3J8jU/EOgMLUwh9WpcEeIPdHTSXHmw+
 FNTS7hto84hOFYtmpb2xSY0hHmX8ESE0cLZjvzZLTz56OdcQJUNeyxSOKahyFnhCAHXa
 7k0fwMIgEibOP87S31Hn85uZ7r2E/s0nifJKWLu00pK35Io+kq80tnZYFIY0YbktC/oX
 Qgvm5fip8saZ/8E98a06gr0An/QF5Sc4dn/OMHZf1RjP+ZaeKr356OclxPhA2VnQEXKP
 zNCg==
X-Gm-Message-State: APjAAAVW6pQLCniulzE6MJkelzX1SA3IH5IE0v6CK/uG1mRK5y1lUcb8
 ud5Ew/hPtH7wqJ13/jrS99YCB5jVpbBjd9CcsXE=
X-Google-Smtp-Source: APXvYqzAYzm/B64KfANyuHBD7UlwMSxlMoGb/JRUfdBA0epdnEzLPzIt6guFESD+5gNlnUyJUxvddG1/5iD/yJG/nKA=
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr91625363wrn.140.1578409459204; 
 Tue, 07 Jan 2020 07:04:19 -0800 (PST)
MIME-Version: 1.0
References: <4545D260-7F67-42DC-A33E-2F466011ED20@citrix.com>
 <89173194-efd5-61fb-d3f5-dd1011579c91@citrix.com>
 <3403b9d5b51845aea20aba2ca76fde6e@EX13D32EUC003.ant.amazon.com>
 <6D5427AF-D465-43E4-88D8-351F10E513A6@citrix.com>
In-Reply-To: <6D5427AF-D465-43E4-88D8-351F10E513A6@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 7 Jan 2020 08:03:44 -0700
Message-ID: <CABfawhmNWeTz5VuXOTrnLNcs_9-6M_2Ap5Zr63OFa7ETcyHurA@mail.gmail.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] Community Call: Call for Agenda Items and call
 details for Jan 9, 16:00 - 17:00 UTC
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
Cc: Amit Shah <amit@infradead.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Brian Woods <brian.woods@xilinx.com>,
 Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>, Robert Townley <rob.townley@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rian Quinn <rianquinn@gmail.com>,
 Varad Gautam <varadgautam@gmail.com>, Juergen Gross <jgross@suse.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Ji, John" <john.ji@intel.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAgICAgPiA+IFBsZWFzZSBzZW5kIG1lIGFnZW5kYSBpdGVtcyBmb3IgdGhpcyBUaHVyc2RheSdz
IGNvbW11bml0eSBjYWxsICh3ZQo+ICAgICA+IGFncmVlZCB0byBtb3ZlIGl0IGJ5IDEgd2Vlaykg
cHJlZmVyYWJseSBieSBXZWRuZXNkYXkhCj4gICAgID4gPgo+ICAgICA+ID4gQSBkcmFmdCBhZ2Vu
ZGEgaXMKPiAgICAgPiBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRVJa
dE1ZRDVqNmswc3YtTkc2SHRsLUFKLwo+ICAgICA+ID4gUGxlYXNlIGFkZCBhZ2VuZGEgaXRlbXMg
dG8gdGhlIGRvY3VtZW50IG9yIHJlcGx5IHRvIHRoaXMgZS1tYWlsCj4gICAgID4KPiAgICAgPiBJ
IHRoaW5rIGl0IHdvdWxkIGJlIHZlcnkgaGVscGZ1bCBmb3IgdGhlIGNvbW11bml0eSBpbiBnZW5l
cmFsIHRvIGtub3cKPiAgICAgPiBhbnkgc3BlY2lmaWMgcGxhbnMgZWFjaCBvZiB1cyBoYXZlIGZv
ciB0aGUgNC4xNCB0aW1lZnJhbWUuCj4gICAgID4KPiAgICAgPiBJIHBlcnNvbmFsbHkgYW0gYXdh
cmUgb2YgYSBmYWlyIHF1YW50aXR5IG9mIHdvcmsgZnJvbSB2YXJpb3VzIHBlb3BsZSwKPiAgICAg
PiBidXQgaXQgaXMgY2xlYXIgdGhhdCB0aGUgY29tbXVuaXR5IGFzIGEgd2hvbGUgZG9lc24ndCBy
ZWFsbHkgaGF2ZSBhbgo+ICAgICA+IGlkZWEgb2Ygd2hvIGlzIHdvcmtpbmcgb24gd2hhdC4KPiAg
ICAgPgo+ICAgICA+IE15IGNvbnRyaWJ1dGlvbiB0byB0aGUgZGlzY3Vzc2lvbiBzdGFydHMgd2l0
aAo+ICAgICA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC85NDFjZjIzYy0xM2Vk
LTE0YTEtZmQyNS0KPiAgICAgPiA0NWIwMDFkOTU2NGFAY2l0cml4LmNvbS9ULyN1Cj4gICAgID4g
YnV0IEkgdGhpbmsgaXQgd291bGQgYmUgaGVscGZ1bCBpZiBvdGhlcnMgZ2F2ZSBhdCBsZWFzdCBh
IGJyaWVmIG92ZXJ2aWV3Cj4gICAgID4gb2YgYW55IHBsYW5zIGFuZCB3aGV0aGVyIHRoZXkgYXJl
IGludGVuZGluZyB0aGUgd29yayB0byBoaXQgdGhlIG5leHQKPiAgICAgPiByZWxlYXNlLCBvciB3
aGV0aGVyIGl0IGlzIG1vcmUgbGlrZWx5IHRvIGJlIGEgZnV0dXJlIHJlbGVhc2UuCj4KPiAgICAg
QWdyZWVkLiBJIG5lZWQgYSBiYXNlbGluZSBsaXN0IG9mIGl0ZW1zIHRvIHRyYWNrIGZvciA0LjE0
LgoKTXkgdm0gZm9ya2luZyBzZXJpZXMgaGFzIGJlZW4gcG9zdGVkIGFuZCBpdCdzIGF0IHYzLiBN
b3N0IG9mIHRoZQpwYXRjaGVzIGFyZSBqdXN0IG1lbV9zaGFyaW5nIGNsZWFudXBzIHdpdGggbm8g
ZnVuY3Rpb25hbCBjaGFuZ2UgYnV0CnN0aWxsIG5lZWQgYW4gYWNrIGZyb20gYW4geDg2IG1haW50
YWluZXIgYXMgSSdtIHRoZSBvbmx5IG1haW50YWluZXIKbGlzdGVkIGZvciBtZW1fc2hhcmluZyBp
dHNlbGYuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
