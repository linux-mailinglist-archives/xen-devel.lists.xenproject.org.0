Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205A135A76
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 14:44:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipY4O-0002z1-Ug; Thu, 09 Jan 2020 13:41:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fuxF=26=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipY4M-0002yw-Vn
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 13:41:51 +0000
X-Inumbo-ID: c9b22438-32e5-11ea-b9d3-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9b22438-32e5-11ea-b9d3-12813bfff9fa;
 Thu, 09 Jan 2020 13:41:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578577310; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=mNRAkRs8ZxVGvHHoNsXeberaQwfI7zHgIWHRJQ5Fn4I=;
 b=I0HMS2mv4iSwC3htaRJOD8NZYtoYsWciKaWL+1+pHdUCKcH95uDGxaDVhpoyuaM2RwF0P3bW
 xz9dc8u7w9XkMIcqZvvkTiI6OiFmJYwWF48sKm/LFMKfhr3kfywWvStaujH1xeCKrbA6Lj6Z
 aiYf9yRlsuBoCGhPljf4Yh94QNM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mxa.mailgun.org with ESMTP id 5e172d9d.7fe1705ad9f0-smtp-out-n03;
 Thu, 09 Jan 2020 13:41:49 -0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id t14so2869118wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 05:41:49 -0800 (PST)
X-Gm-Message-State: APjAAAXNyExEfJiCMoUpKJBIVRl9EFNJTqmxj9pwDxcpltlws3kilB9y
 oROM/egI1PuQVfenwcIxi3zodAst1YaH0RjJJM8=
X-Google-Smtp-Source: APXvYqyOcsbd1qlOBz15r6Ruxg0JiJRK/EqQb8uGCcYCUSGTRaYM6v/wxiFdXAIfhIwtnvAF85JhJMtMYLPhq71vCWY=
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr4903950wmc.168.1578577308285; 
 Thu, 09 Jan 2020 05:41:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <b816ff21d1156eeb5d68b35932ad23f4e5891bdb.1578503483.git.tamas.lengyel@intel.com>
 <5084334f-7ed6-6095-e31a-d530454357a4@xen.org>
In-Reply-To: <5084334f-7ed6-6095-e31a-d530454357a4@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Jan 2020 06:41:12 -0700
X-Gmail-Original-Message-ID: <CABfawhnwdYX6W_arEL_SP4eqvrOYQZUB1jqeuMA+WUXo_TaZiQ@mail.gmail.com>
Message-ID: <CABfawhnwdYX6W_arEL_SP4eqvrOYQZUB1jqeuMA+WUXo_TaZiQ@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH v4 15/18] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gOSwgMjAyMCBhdCAzOjI5IEFNIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOgo+Cj4gSGkgVGFtYXMsCj4KPiBPbiAwOC8wMS8yMDIwIDE3OjE0LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiArc3RhdGljIGludCBtZW1fc2hhcmluZ19mb3JrKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBkb21haW4gKmNkKQo+ID4gK3sKPiA+ICsgICAgaW50IHJjOwo+ID4g
Kwo+ID4gKyAgICBpZiAoICFkLT5jb250cm9sbGVyX3BhdXNlX2NvdW50ICYmCj4gPiArICAgICAg
ICAgKHJjID0gZG9tYWluX3BhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIoZCkpICkKPgo+IEFGQUlV
LCB0aGUgcGFyZW50IGRvbWFpbiB3aWxsIGJlIHBhdXNlZCBpZiBpdCB3YXNuJ3QgcGF1c2VkIGJl
Zm9yZSBhbmQKPiB0aGlzIHdpbGwgbm90IGJlIHVucGF1c2VkIGJ5IHRoZSBzYW1lIGh5cGVyY2Fs
bC4gUmlnaHQ/CgpZZXMsIGl0IG5lZWRzIHRvIHJlbWFpbiBwYXVzZWQgYXMgbG9uZyBhcyB0aGVy
ZSBhcmUgZm9ya3MgYWN0aXZlIGZyb20KaXQuIEFmdGVyd2FyZHMgaXQgY2FuIGJlIHVucGF1c2Vk
LgoKPgo+IElmIHNvLCB0aGlzIGJyaW5ncyB0d28gcXVlc3Rpb25zOgo+ICAgICAgLSBXaGF0IHdv
dWxkIGhhcHBlbiBpZiB0aGUgdG9vbHN0YWNrIGRlY2lkZSB0byB1bnBhdXNlIHRoZSBkb21haW4/
CgpUaGUgZm9ya3MgZXZlbnR1YWxseSB3b3VsZCBlbmQgdXAgbWlzYmVoYXZpbmcgc2luY2UgdGhl
IG1lbW9yeSB0aGV5CmhhdmVuJ3QgdG91Y2hlZCB5ZXQgd291bGQgc3RhcnQgY2hhbmdpbmcgdW5k
ZXJuZWF0aCB0aGVpciBmZWF0LiBJZgp0aGV5IG5ldmVyIHVzZSB0aG9zZSBwYWdlcywgdGhlbiB0
aGV5IGFyZSBzYWZlLiBJZiB0aGV5IGFyZSwgYW5kIHRoZXkKZXhwZWN0IHRoZW0gdG8gYmUgaW4g
dGhlIHNhbWUgc3RhdGUgd2hlbiB0aGV5IHdlcmUgY3JlYXRlZCwgaXQgd2lsbApsZWFkIHRvIGlz
c3Vlcy4gRGVwZW5kcyByZWFsbHkgb24gd2hhdCBpcyBydW5uaW5nIGluIHRoZSBmb3JrLgoKPiAg
ICAgIC0gSG93IGRvZXMgdGhlIGNhbGxlciBrbm93cyB3aGV0aGVyIHRoaXMgd2FzIHBhdXNlZCBi
eSB0aGUKPiBoeXBlcmNhbGwgb3Igbm90PwoKV2VsbCwgaWYgdGhleSBwYXVzZWQgdGhlIFZNIGJl
Zm9yZSB0aGVuIHRoZSBoeXBlcmNhbGwgZG9lc24ndCBwYXVzZSBpdAphZ2Fpbi4gSWYgaXQgd2Fz
bid0IHBhdXNlZCwgaXQgd2lsbCBiZSBub3cuCgo+Cj4gSSB3b3VsZCBhbHNvIHN1Z2dlc3QgdG8g
ZG9jdW1lbnQgdGhlIGJlaGF2aW9yIG9mIHRoZSBoeXBlcmNhbGwgYXMgdGhpcwo+IGlzIG5vdCBl
bnRpcmVseSBvYnZpb3VzIHRoYXQgdGhlIGRvbWFpbiB3aWxsIGJlIHBhdXNlZCBoZXJlLgoKU3Vy
ZS4KCj4KPiA+ICsgICAgICAgIHJldHVybiByYzsKPiA+ICsKPiA+ICsgICAgY2QtPm1heF9wYWdl
cyA9IGQtPm1heF9wYWdlczsKPiA+ICsgICAgY2QtPm1heF92Y3B1cyA9IGQtPm1heF92Y3B1czsK
PiA+ICsKPiA+ICsgICAgLyogdGhpcyBpcyBwcmVlbXB0aWJsZSBzbyBpdCdzIHRoZSBmaXJzdCB0
byBnZXQgZG9uZSAqLwo+ID4gKyAgICBpZiAoIChyYyA9IGZvcmtfaGFwX2FsbG9jYXRpb24oZCwg
Y2QpKSApCj4gPiArICAgICAgICByZXR1cm4gcmM7Cj4gPiArCj4gPiArICAgIGlmICggKHJjID0g
YnJpbmdfdXBfdmNwdXMoY2QsIGQtPmNwdXBvb2wpKSApCj4gPiArICAgICAgICByZXR1cm4gcmM7
Cj4gPiArCj4gPiArICAgIGlmICggKHJjID0gaHZtX2NvcHlfY29udGV4dF9hbmRfcGFyYW1zKGQs
IGNkKSkgKQo+ID4gKyAgICAgICAgcmV0dXJuIHJjOwo+ID4gKwo+ID4gKyAgICBmb3JrX3RzYyhk
LCBjZCk7Cj4gPiArCj4gPiArICAgIGNkLT5wYXJlbnQgPSBkOwo+Cj4gSG93IGRvIHlvdSBlbnN1
cmUgdGhhdCB0aGUgcGFyZW50IGRvbWFpbiB3aWxsIG5vdCBnZXQgZGVzdHJveWVkIGJlZm9yZQo+
IHRoZSBmb3JrZWQgZG9tYWluPyBEbyB5b3UgaGF2ZSBhIHJlZmNvdW50IHNvbWV3aGVyZT8KCldl
IGRvbid0LiBBdCB0aGlzIHBvaW50IHdlIGV4cGVjdCB0aGUgdXNlciB0byBrZWVwIHRoZSBwYXJl
bnQgVk0gYWxpdmUKYnV0IHBhdXNlZC4gSXMgdGhlcmUgc3VjaCBhIHRoaW5nIGFzIGEgZG9tYWlu
IHJlZmNvdW50IHdlIGNvdWxkIHVzZQpmb3IgdGhpcz8KClRhbWFzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
