Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C637864D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 09:23:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrzy2-0008C1-Sr; Mon, 29 Jul 2019 07:21:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lmhy=V2=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hrzy1-0008Bw-QD
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 07:21:09 +0000
X-Inumbo-ID: 6f37ad5e-b1d1-11e9-8980-bc764e045a96
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6f37ad5e-b1d1-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 07:21:08 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id k8so117866759iot.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2019 00:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p1SRD3wW9TSM0TPTW4Wi4d3F3gl4PrzVOJTVZ3KIgxE=;
 b=gxrd0naHU9enrVjeVTRHonFoTvgYW3rcUxhppmCdbCvHfB6OszvxLu3hGdqR1Qkwhj
 WqbLowp8QpmsBrrRKBvQoqbAvuGiqp3CyEZ8y84bEKM6RlvMfdsjwAIoKB+JFF4Bz9E1
 srWYK+MHhqyWShiLjOW3uu9QlrE2IeL7UdfLMi7orVpIeSaVoT8DIXIcUgsholR81TyJ
 fkInc51FksUCL+v99A/YPQ6VRcVq4E0ERPCpvMYZq5cAgAiK0rg5xns84fT2afg0KbE9
 dtfGjO7FTqP/gwQ/K8T6/KmDZAOYeN+VCTdqYvAg9WnO0vik+6e+4Mo/H5RHR/47qSJy
 Eg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p1SRD3wW9TSM0TPTW4Wi4d3F3gl4PrzVOJTVZ3KIgxE=;
 b=aVIgERgtEv6Y2zL6Gpe2lsRIOUjyzmupWpaI3wPFYFHMw7Jw0g0BcXJjCDfd/DUQ+E
 5LCJOveuAEL8EvTAvoVpWaMBpKNpd/yg1JVEAfTTmKAsRmmeDwHY6pIdcsu4c56ahNkU
 xclx+sHY1oYs1o4zR9Sri0tJas2dxXjkC7BrN1hcYfdR7wc2b0b2twuB9OoCMFy97z9B
 aCRX3mQpbWzm7JntWb4t78E/MVPlnzDj0zZDbBaIWoi0IOwSbXvYZbyu4elLXdzO6eq2
 hLv20JzQXPPss9MgO/bFhsm+0NvdOX8h+ku5VDXnWNByYKEeJTpVbzJZysZ2NOzl9NV+
 Qd+w==
X-Gm-Message-State: APjAAAU7ig4Dwf4ev1BL0aryWVYmjfQTMZcNU9Nqm/sOl2GDRSWDUNrb
 kS3rpkDCN8VepmvRuyYXdCVx2htnyMOL/alGK/M=
X-Google-Smtp-Source: APXvYqzXzpdAid8YRr+1uZGBVsCkmFzgoVPLV38l/6LqWcYoh3ID+Zmx18IClUAKxj1mIfWjRJbiSK47wJUMvqN3s/k=
X-Received: by 2002:a6b:b756:: with SMTP id h83mr68909837iof.147.1564384868018; 
 Mon, 29 Jul 2019 00:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <CAOcoXZbJHzfde_Os=i58vio7nXU2u=V0Tph3gQ_GYhE_UFtUcQ@mail.gmail.com>
 <6b2e18cb-d02a-be2a-74b3-bf9443d9d0eb@arm.com>
In-Reply-To: <6b2e18cb-d02a-be2a-74b3-bf9443d9d0eb@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Mon, 29 Jul 2019 10:20:56 +0300
Message-ID: <CAOcoXZbtYtTHMjmz7H1V6WmTAhX3UmdLP3M1dTF8hgrPMpvpww@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>, Lars Kurth <lars.kurth.xen@gmail.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgNjo1NCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyNi8wNy8yMDE5IDE2OjQ4LCBWaWt0b3IgTWl0
aW4gd3JvdGU6Cj4gPiBIaSBBbGwsCj4gPgo+ID4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNTo0
NSBQTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4KPiA+
PiBDaGVja2luZyB0aGUgY29tbWVudCBzdHlsZXMgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGUgYXV0
b21hdGlvbi4KPiA+Cj4gPiBUaGUgc2FtZSBhYm91dCBjbGFuZy1mb3JtYXQuIENoZWNraW5nIHRo
ZSBjb21tZW50IHN0eWxlcyBpcyBub3Qgc3VwcG9ydGVkLgo+ID4gSXQgc2VlbXMgdGhpcyBpcyBu
b3QgY29kZSBmb3JtYXQgY2hlY2tlciB0YXNrIHRvIHBhcnNlIGFuZCBtb2RpZnkgdGhlCj4gPiBj
b2RlIGNvbW1lbnRzLi4uCj4KPiBBcmUgeW91IHN1cmUgYWJvdXQgeW91ciBzdGF0ZW1lbnQ/IExv
b2tpbmcgYXQgdGhlIGRpZmYgeW91IHByb3ZpZGVkIFsxXSwKPiBjbGFuZy1mb3JtYXQgaXMgY2xl
YXJseSB0cnlpbmcgdG8gYWx0ZXIgdGhlIGNvbW1lbnRzLgo+Cj4gQnV0IGNvbW1lbnRzIGZsb3cg
YXJlIGVxdWFsbHkgaW1wb3J0YW50IGFzIHRoZSBjb2RlLiBUaGlzIGlzIHBhcnQgb2YgdGhlIGNv
ZGluZwo+IHN0eWxlIGFmdGVyYWxsLgo+Cj4gWzFdCj4gaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNv
bnRlbnQuY29tL3Zpa3Rvci1taXRpbi94ZW4tY2xhbmctZm9ybWF0LWV4YW1wbGUvbWFzdGVyLzAw
MDEtY2xhbmctZm9ybWF0LWNoZWNrcGF0Y2gtb3V0cHV0LWV4YW1wbGUucGF0Y2gKCkNsYW5nLWZv
cm1hdCBzdXBwb3J0cyBvbmx5IGJhc2ljIGluZGVudGF0aW9uIG9mIEM4OSBjb21tZW50cy4KCi0t
LSBhL3hlbi9hcmNoL2FybS9hcm02NC9saXZlcGF0Y2guYworKysgYi94ZW4vYXJjaC9hcm0vYXJt
NjQvbGl2ZXBhdGNoLmMKQEAgLTUxLDE1ICs1MSwxNSBAQCB2b2lkIGFyY2hfbGl2ZXBhdGNoX2Fw
cGx5KHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVuYykKICAgICAgICAgKihuZXdfcHRyICsgaSkg
PSBpbnNuOwoKICAgICAvKgotICAgICogV2hlbiB3ZSB1cGxvYWQgdGhlIHBheWxvYWQsIGl0IHdp
bGwgZ28gdGhyb3VnaCB0aGUgZGF0YSBjYWNoZQotICAgICogKHRoZSByZWdpb24gaXMgY2FjaGVh
YmxlKS4gVW50aWwgdGhlIGRhdGEgY2FjaGUgaXMgY2xlYW5lZCwgdGhlIGRhdGEKLSAgICAqIG1h
eSBub3QgcmVhY2ggdGhlIG1lbW9yeS4gQW5kIGluIHRoZSBjYXNlIHRoZSBkYXRhIGFuZCBpbnN0
cnVjdGlvbiBjYWNoZQotICAgICogYXJlIHNlcGFyYXRlZCwgd2UgbWF5IHJlYWQgaW52YWxpZCBp
bnN0cnVjdGlvbiBmcm9tIHRoZSBtZW1vcnkgYmVjYXVzZQotICAgICogdGhlIGRhdGEgY2FjaGUg
aGF2ZSBub3QgeWV0IHN5bmNlZCB3aXRoIHRoZSBtZW1vcnkuIEhlbmNlIHN5bmMgaXQuCi0gICAg
Ki8KKyAgICAgKiBXaGVuIHdlIHVwbG9hZCB0aGUgcGF5bG9hZCwgaXQgd2lsbCBnbyB0aHJvdWdo
IHRoZSBkYXRhIGNhY2hlCisgICAgICogKHRoZSByZWdpb24gaXMgY2FjaGVhYmxlKS4gVW50aWwg
dGhlIGRhdGEgY2FjaGUgaXMgY2xlYW5lZCwgdGhlIGRhdGEKKyAgICAgKiBtYXkgbm90IHJlYWNo
IHRoZSBtZW1vcnkuIEFuZCBpbiB0aGUgY2FzZSB0aGUgZGF0YSBhbmQgaW5zdHJ1Y3Rpb24gY2Fj
aGUKKyAgICAgKiBhcmUgc2VwYXJhdGVkLCB3ZSBtYXkgcmVhZCBpbnZhbGlkIGluc3RydWN0aW9u
IGZyb20gdGhlIG1lbW9yeSBiZWNhdXNlCisgICAgICogdGhlIGRhdGEgY2FjaGUgaGF2ZSBub3Qg
eWV0IHN5bmNlZCB3aXRoIHRoZSBtZW1vcnkuIEhlbmNlIHN5bmMgaXQuCisgICAgICovCgpTbyBp
dCBhZGRyZXNzZXMgWGVuIENvZGluZyBTdHlsZSByZXF1aXJlbWVudHMgcGFydGlhbGx5OgoKRnJv
bSBDT0RJTkdfU1RZTEU6CiIKTXVsdGktbGluZSBjb21tZW50IGJsb2NrcyBzaG91bGQgc3RhcnQg
YW5kIGVuZCB3aXRoIGNvbW1lbnQgbWFya2VycyBvbgpzZXBhcmF0ZSBsaW5lcyBhbmQgZWFjaCBs
aW5lIHNob3VsZCBiZWdpbiB3aXRoIGEgbGVhZGluZyAnKicuCgovKgogKiBFeGFtcGxlLCBtdWx0
aS1saW5lIGNvbW1lbnQgYmxvY2suCiAqCiAqIE5vdGUgYmVnaW5uaW5nIGFuZCBlbmQgbWFya2Vy
cyBvbiBzZXBhcmF0ZSBsaW5lcyBhbmQgbGVhZGluZyAnKicuCiAqLwoiCgpIb3dldmVyLCB0aGUg
bmV4dCBjb21tZW50cyBydWxlcyBhcmUgbm90IHN1cHBvcnRlZCBmb3Igbm93IGFuZCBjYW4gYmUK
YWRkZWQgaW50byBpbXBsZW1lbnRhdGlvbiBsYXRlci4KCkZyb20gQ09ESU5HX1NUWUxFOgoiCk9u
bHkgQyBzdHlsZSAvKiAuLi4gKi8gY29tbWVudHMgYXJlIHRvIGJlIHVzZWQuICBDKysgc3R5bGUg
Ly8gY29tbWVudHMKc2hvdWxkIG5vdCBiZSB1c2VkLiAgTXVsdGktd29yZCBjb21tZW50cyBzaG91
bGQgYmVnaW4gd2l0aCBhIGNhcGl0YWwKbGV0dGVyLiAgQ29tbWVudHMgY29udGFpbmluZyBhIHNp
bmdsZSBzZW50ZW5jZSBtYXkgZW5kIHdpdGggYSBmdWxsCnN0b3A7IGNvbW1lbnRzIGNvbnRhaW5p
bmcgc2V2ZXJhbCBzZW50ZW5jZXMgbXVzdCBoYXZlIGEgZnVsbCBzdG9wCmFmdGVyIGVhY2ggc2Vu
dGVuY2UuCiIKCkJUVywgaXMgdGhlcmUgYW4gYWN0dWFsIHJlYXNvbiBub3QgdG8gc3VwcG9ydCBD
OTkgY29tbWVudHMgKCAvLyApID8KClRoYW5rcwoKPgo+ID4KPiA+IFRoYW5rcwo+ID4KPgo+IC0t
Cj4gSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
