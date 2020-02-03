Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F85150653
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:46:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyb5K-0002iQ-CZ; Mon, 03 Feb 2020 12:44:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2xfu=3X=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iyb5I-0002iI-1z
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:44:12 +0000
X-Inumbo-ID: df41d64e-4682-11ea-b211-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df41d64e-4682-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 12:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qYYXd0hnNUz5OvcYj7fS7rg4MtSDk3pfXBnVJbpQTS8=; b=RiuwtpA6N/u9h6+kwQe8TqBarK
 tQ5MJPCslMKHgvqjLltkDIcn98iDZdsnlJfDSt8e9eR7xGEnAHZEnFmx37wZSGsMf0ahQbxV5vInW
 vD0aFk0c2CaZfSQzHgEhZQ6+XdYTixmJme1k3HfYRNmgPG3pkd/yIxA+XEe0lee7I0Sg=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:22169
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iyb6q-0000vX-4Y; Mon, 03 Feb 2020 13:45:48 +0100
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
 <20200203122319.GU4679@Air-de-Roger>
 <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
 <20200203124127.GV4679@Air-de-Roger>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <fe191f7a-b902-19a3-e4c8-ace8c02319c6@eikelenboom.it>
Date: Mon, 3 Feb 2020 13:44:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200203124127.GV4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: pci-passthrough regression bisected
 to: x86/smp: use APIC ALLBUT destination shorthand when possible
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDIvMjAyMCAxMzo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEZl
YiAwMywgMjAyMCBhdCAwMTozMDo1NVBNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6
Cj4+IE9uIDAzLzAyLzIwMjAgMTM6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBN
b24sIEZlYiAwMywgMjAyMCBhdCAwOTozMzo1MUFNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20g
d3JvdGU6Cj4+Pj4gSGkgUm9nZXIsCj4+Pj4KPj4+PiBMYXN0IHdlZWsgSSBlbmNvdW50ZXJlZCBh
biBpc3N1ZSB3aXRoIHRoZSBQQ0ktcGFzc3Rocm91Z2ggb2YgYSBVU0IgY29udHJvbGxlci4gCj4+
Pj4gSW4gdGhlIGd1ZXN0IEkgZ2V0Ogo+Pj4+ICAgICBbIDExNDMuMzEzNzU2XSB4aGNpX2hjZCAw
MDAwOjAwOjA1LjA6IHhIQ0kgaG9zdCBub3QgcmVzcG9uZGluZyB0byBzdG9wIGVuZHBvaW50IGNv
bW1hbmQuCj4+Pj4gICAgIFsgMTE0My4zMzQ4MjVdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogeEhD
SSBob3N0IGNvbnRyb2xsZXIgbm90IHJlc3BvbmRpbmcsIGFzc3VtZSBkZWFkCj4+Pj4gICAgIFsg
MTE0My4zNDczNjRdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogSEMgZGllZDsgY2xlYW5pbmcgdXAK
Pj4+PiAgICAgWyAxMTQzLjM1NjQwN10gdXNiIDEtMjogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBu
dW1iZXIgMgo+Pj4+Cj4+Pj4gQmlzZWN0aW9uIHR1cm5lZCB1cCBhcyB0aGUgY3VscHJpdDogCj4+
Pj4gICAgY29tbWl0IDU1MDBkMjY1YTJhOGZhNjNkNjBjMDhiZWI1NDlkZThlYzgyZmY3YTUKPj4+
PiAgICB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4g
cG9zc2libGUKPj4+Cj4+PiBTb3JyeSB0byBoZWFyIHRoYXQsIGxldCBzZWUgaWYgd2UgY2FuIGZp
Z3VyZSBvdXQgd2hhdCdzIHdyb25nLgo+Pgo+PiBObyBwcm9ibGVtLCB0aGF0IGlzIHdoeSBJIHRl
c3Qgc3R1ZmYgOikKPj4KPj4+PiBJIHZlcmlmaWVkIGJ5IHJldmVydGluZyB0aGF0IGNvbW1pdCBh
bmQgbm93IGl0IHdvcmtzIGZpbmUgYWdhaW4uCj4+Pgo+Pj4gRG9lcyB0aGUgc2FtZSBjb250cm9s
bGVyIHdvcmsgZmluZSB3aGVuIHVzZWQgaW4gZG9tMD8KPj4KPj4gV2lsbCB0ZXN0IHRoYXQsIGJ1
dCBhcyBhbGwgb3RoZXIgcGNpIGRldmljZXMgaW4gZG9tMCB3b3JrIGZpbmUsCj4+IEkgYXNzdW1l
IHRoaXMgY29udHJvbGxlciB3b3VsZCBhbHNvIHdvcmsgZmluZSBpbiBkb20wIChhcyBpdCBoYXMg
YWxzbwo+PiB3b3JrZWQgZmluZSBmb3IgYWdlcyB3aXRoIFBDSS1wYXNzdGhyb3VnaCB0byB0aGF0
IGd1ZXN0IGFuZCBzdGlsbCB3b3Jrcwo+PiBmaW5lIHdoZW4gcmV2ZXJ0aW5nIHRoZSByZWZlcmVu
Y2VkIGNvbW1pdCkuCj4gCj4gSXMgdGhpcyB0aGUgb25seSBkZXZpY2UgdGhhdCBmYWlscyB0byB3
b3JrIHdoZW4gZG9pbmcgcGNpLXBhc3N0aHJvdWdoLAo+IG9yIG90aGVyIGRldmljZXMgYWxzbyBk
b24ndCB3b3JrIHdpdGggdGhlIG1lbnRpb25lZCBjaGFuZ2UgYXBwbGllZD8KPiAKPiBIYXZlIHlv
dSB0ZXN0ZWQgb24gb3RoZXIgYm94ZXM/Cj4gCj4+IEkgZG9uJ3Qga25vdyBpZiB5b3VyIGNoYW5n
ZSBjYW4gc29tZWhvdyBoYXZlIGEgc2lkZSBlZmZlY3QKPj4gb24gbGF0ZW5jeSBhcm91bmQgdGhl
IHByb2Nlc3Npbmcgb2YgcGNpLXBhc3N0aHJvdWdoID8KPiAKPiBIbSwgdGhlIG1lbnRpb25lZCBj
b21taXQgc2hvdWxkIHNwZWVkIHVwIGJyb2FkY2FzdCBJUElzLCBidXQgSSBkb24ndAo+IHNlZSBo
b3cgaXQgY291bGQgc2xvdyBkb3duIG90aGVyIGludGVycnVwdHMuIEFsc28gSSB3b3VsZCB0aGlu
ayB0aGUKPiBkb21haW4gaXMgbm90IHJlY2VpdmluZyBpbnRlcnJ1cHRzIGZyb20gdGhlIGRldmlj
ZSwgcmF0aGVyIHRoYW4KPiBpbnRlcnJ1cHRzIGJlaW5nIHNsb3cuCj4gCj4gQ2FuIHlvdSBhbHNv
IHBhc3RlIHRoZSBvdXRwdXQgb2YgbHNwY2kgLXYgZm9yIHRoYXQgeEhDSSBkZXZpY2UgZnJvbQo+
IGRvbTA/Cj4gCj4gVGhhbmtzLCBSb2dlci4KCldpbGwgZG8gdGhpcyBldmVuaW5nIGluY2x1ZGlu
ZyB0aGUgdGVzdGluZyBpbiBkb20wIGV0Yy4KV2lsbCBhbHNvIHNlZSBpZiB0aGVyZSBpcyBhbnkg
cGF0dGVybiB3aGVuIG9ic2VydmluZyAvcHJvYy9pbnRlcnJ1cHRzIGluCnRoZSBndWVzdC4KClRo
YW5rcywKClNhbmRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
