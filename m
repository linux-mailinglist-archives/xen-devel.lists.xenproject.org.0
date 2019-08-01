Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76777DB36
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 14:19:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htA0U-0003GT-A7; Thu, 01 Aug 2019 12:16:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9Oh=V5=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1htA0S-0003GO-Lw
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 12:16:28 +0000
X-Inumbo-ID: 2f859003-b456-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f859003-b456-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 12:16:27 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k20so143759591ios.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QhA8bDBYN7clAKQsdOl+jRlcdR5/qISJhlSEUxK3ers=;
 b=ZfLnAsmJ9Gm180x5veiM5tN4nkjLygh1tgl7EcKN+yvxjvi1ebuCyfUxVFzXtZMAUl
 plQUghnkX/Ra9XbnBCQaomFC8RQ4FxobyHG2wTxpXhUPqL1QoHoIMV8a0DuamUbcWoto
 ONOG9BgqTjwyTX1IwyMe5B8L5TLlAqWCBibUZtn65JsCWFHql9mm1OtAPBPKK90nAopf
 SUsPB+0KapUloqiPIo/pYNcA6yrVgqZA27OdrFzm26oToTh7QUR/E8n+re4EQlA1ZJi3
 /Zo0xh4mcDDMkrkia6I9OQMvzkS7VBUEnYB+K1z5ViXRC7GUfs5v00Ys/7OnGi3ljVFk
 vSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhA8bDBYN7clAKQsdOl+jRlcdR5/qISJhlSEUxK3ers=;
 b=SrVcA5oZD9k/KdxgkEFgDf9K1tjfLj36K97znSMVFQ0Ick9YrDKaxciaOfvHEeWHLp
 yd3y3x2eRZk7HmCSbwsn5pzX7/8ZL7g2SxhvgGGCLaAzZERNRG4u7aDNTSkvJfeDIjjN
 gqSI/cUcwTZzBaixh0Pon0ZyiloiKyqj39AWXps5rGdd+BcxZQ2u68kxwMM4sZBIldji
 UDrWOqFboABppudekzreX6XKUZk5L4bYDiadJl66Dj8nW+fvpdLG8Gk96/oEftpnjPXJ
 ydavw7JwUi8iMWeJaB4qZlGJUNM84o3nVdBbEr+fN1Ow0ljXKuJODHSUyw/OsULHVCNA
 dTJw==
X-Gm-Message-State: APjAAAVdhHWHfwtQHQHZJRvnVMONAi2BiAKUqn0tp/54Yiscceza+jzN
 Qt9SpKiRZRSJ8saycBK50m3JJYLglhznIYuPX10=
X-Google-Smtp-Source: APXvYqwrZ6eceUKDb2IP6q89XOYC3wJi0TUcfHkDHZMTj+LzUETUw8q7AWETX5o7G6KwQZqkSZ2OrM+/OLfW9Pqw2es=
X-Received: by 2002:a02:4484:: with SMTP id
 o126mr132909853jaa.34.1564661786526; 
 Thu, 01 Aug 2019 05:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
 <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
 <de9f1e4a-7923-40f8-9c3b-fab912aa250b@arm.com>
 <6aa7726a-5dc2-c901-2700-34bbc2726879@suse.com>
 <CAOcoXZY-0Bru-evWJtVMZ4LB0w1xx0EqD5M8ZDHw+EZUopEr6Q@mail.gmail.com>
 <be9cc69b-41cc-6725-b205-aafa31bdc39c@suse.com>
In-Reply-To: <be9cc69b-41cc-6725-b205-aafa31bdc39c@suse.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 1 Aug 2019 15:16:14 +0300
Message-ID: <CAOcoXZb8SYbLryapgNmnL3w7oAkyJZtdzM0jRgsvMA=5qtysNQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAxMDo0MCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMzEuMDcuMjAxOSAxODoyMCwgVmlrdG9yIE1pdGluIHdyb3Rl
Ogo+ID4gSG93IGFsbCB0aG9zZSBwcm9qZWN0cyBsaXZlIHdpdGhvdXQgdGhpcyBpc3N1ZT8KPgo+
IFBlcmhhcHMgdGhleSBkb24ndCBjYXJlPyBJIGRvLgo+Cj4gPiBXaGF0IGlzIHRoZSByZWFzb24g
bm90IHRvIGZpeCAnZGlmZiAtcCc/IElzIGl0IG5vdCBwb3NzaWJsZSBhdCBhbGw/Cj4KPiBJIGhh
dmUgbm8gaWRlYSwgYnV0IEkgZ3Vlc3MgdGhlcmUncyBhIHJlYXNvbiBmb3IgaXRzIGN1cnJlbnQK
PiBiZWhhdmlvci4KCkphbiwgaXQgc2VlbXMgaXQgaXMgbm90IGEgZ29vZCBpZGVhIHRvIG1vZGlm
eSB0aGUgWGVuIGNvZGluZyBzdHlsZQp3aXRob3V0IGludmVzdGlnYXRpb24gb2YgdGhlIGlzc3Vl
IGZpcnN0LiBJdCB0YWtlcyBzb21lIGVmZm9ydCB0bwphdXRvbWF0ZSBldmVyeSBzdWNoIChvciBz
aW1pbGFyKSBleGNlcHRpb25hbCBjb2RlIGZvcm1hdHRpbmcgY2FzZS4gU28KaXQgbG9va3Mgd2Ug
Y291bGQgZmluZCBhIGJldHRlciBvcHRpb24sIHRoYW4ganVzdCBhZGRpbmcgb25lIG1vcmUKZXhj
ZXB0aW9uIHRvIFhlbiBjb2Rpbmcgc3R5bGUsIGF0IGxlYXN0IHdvcnRoIHRvIGludmVzdGlnYXRl
IGl0IGZpcnN0LgoKPiA+IENvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgbW9yZSBkZXRhaWxzIGFib3V0
IHRoZSBiYWNrZ3JvdW5kIG9mIHRoZSBpc3N1ZQo+ID4gYW5kIGV4YW1wbGVzPwo+Cj4gV2hhdCAo
ZnVydGhlcikgYmFja2dyb3VuZCBhbmQgd2hhdCBraW5kIG9mIGV4YW1wbGVzIGFyZSB5b3UgYWZ0
ZXI/CgpJIGV4cGVjdGVkIHlvdSB0byBoYXZlIHNvbWUgYXJndW1lbnRzIHdoeSBpdCBjYW5ub3Qg
YmUgZml4ZWQgaW4gdGhlCmRpZmYgb3Igb3RoZXIgdG9vbHMuClRoZSBleGFtcGxlcyBJIG1lYW50
IGFyZSBhbnkgcmVhbCBwYXRjaGVzIGNvZGUgZXhhbXBsZXMgdG8gYmUgdXNlZCBmb3IKdGhpcyBp
bnZlc3RpZ2F0aW9uLgpIb3BlZnVsbHksIHlvdSBjYXJlIGFib3V0IGl0LCBhcyB5b3UgbWVudGlv
bmVkIHByZXZpb3VzbHkuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
