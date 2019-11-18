Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCDD10048B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 12:43:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWfP6-0007JX-Tq; Mon, 18 Nov 2019 11:41:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z7UX=ZK=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iWfP5-0007JO-GY
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 11:41:11 +0000
X-Inumbo-ID: 5138865c-09f8-11ea-adbe-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5138865c-09f8-11ea-adbe-bc764e2007e4;
 Mon, 18 Nov 2019 11:41:10 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id m5so15716781ilq.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 03:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4sTq7+gf/MyMyBtslDxNlqXGCKYrM+JkQnVytxZF7+4=;
 b=c2yYrZFGZeQuCg8os6Gi7vVwaa9nNRgUdpa8kJ7hc95S53a/6H/EQhiIIU3GdgeEQP
 8P4+Xph7WBAr1Z1FvS4owxVzpXjvw7aXQqelCLBht4Mi7yyZYwwJJDaE137dUdRG/qDI
 TXSEUyazIp4/7SwFypor1vPZhvlBLW8Btx55kQ//pZ+3QXRl3AKsUVFom9IHoPYOJhGt
 w+1Mm/cGKJrbT+KP0TzEhagws7SZ2+flvtGJbNJkvrvwwmPUR1iFgNp8ri5Gcgp5k662
 a6MNNNVCZ0qmoBHPjNL3eYuzKq5cwSn0sNV4wd59bWvExIDhuPDnCbcdXsmlmqoiKTdm
 xX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4sTq7+gf/MyMyBtslDxNlqXGCKYrM+JkQnVytxZF7+4=;
 b=n5pDruOH/1DEcbtavuFtedTp/Qbmqolzf7X9InoPfyF+ivRq6m9ygxdV6oZfqH8NkQ
 525S81jSFs1H0YMOuS9XaxDvfbxl/5zea1H6lyX48RbrZbqO0kV9KlPrFL3GR6WtKC5M
 y6PR1y3AO78Eywv3WjJc3d0t40Sd1X/3Ddq4gAfc06UkOGtMOANLc/ZdNeZp501VpzxX
 xxne3/dYNGdvdOPYlZCRNUS57ABSaXFdoCAcNmWZ1S270k8ZlsKRFWDFMtE9rm1EL8Dt
 DhiXe81pJlpZv23OvZZUWSAeH97TsxP7hf07vtWev8Wjd6unU6fRTfzYd3jlPX04RnYH
 AZBw==
X-Gm-Message-State: APjAAAVtVe8qJf3WnHgAtsVBXM25s0B1u036P+wa9vzxD8agU76id524
 5i9YPL9Myiz+NGHZMmYwN0sCJhbTeMqMOQyAVkU=
X-Google-Smtp-Source: APXvYqzxpMTgNvGGbD7idvTxUHBrSkDGNYeM5Q2tucxqbiOrJA1Zop5/U5PYA3dhthuIQGZ5rGSudESpxVMJnUnaGLc=
X-Received: by 2002:a92:495a:: with SMTP id w87mr16212899ila.133.1574077270304; 
 Mon, 18 Nov 2019 03:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
 <23968.39034.34800.276030@mariner.uk.xensource.com>
 <CACvf2oV6iFM6x1bs8JPT28Eqny0gARh8MtSTedbgAP-m9CTP=w@mail.gmail.com>
 <23968.46591.386956.861918@mariner.uk.xensource.com>
 <CACvf2oXrw9KdbYq__+Q7bSEPi7Gx8ZnjMTatQRj38Kw80-ywYA@mail.gmail.com>
 <CACvf2oXGzmZquomG5xH=DsCuybFR7b=k8HoOA-tU2ZytoJJfPg@mail.gmail.com>
 <CACvf2oUpk=bP4QB8c9QTPcomuOpYm88+G6Bm_DyFf2h_4_MFGA@mail.gmail.com>
 <24014.65525.944108.509444@mariner.uk.xensource.com>
In-Reply-To: <24014.65525.944108.509444@mariner.uk.xensource.com>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Mon, 18 Nov 2019 13:40:58 +0200
Message-ID: <CACvf2oVaR+N9Zgoty3DK6oKqeRcR0gpRnitnvbOUmxFJydD3FQ@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH v1 1/2] libxl: introduce new backend type
 VINPUT
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgOTo0MyBQTSBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbGVrc2FuZHIgR3J5dHNvdiB3cml0ZXMgKCJSZTogW1BB
VENIIHYxIDEvMl0gbGlieGw6IGludHJvZHVjZSBuZXcgYmFja2VuZCB0eXBlIFZJTlBVVCIpOgo+
ID4gMS4gTW92ZSBRRU1VX0JBQ0tFTkQgbWFjcm8gdG8gbGlieGxfX2RldmljZV90eXBlIHN0cnVj
dHVyZSBhcyBmdW5jdGlvbgo+ID4gICAgIGFuZCBsZXQgdGhlIGRldmljZSB0byBkZWNpZGUgaXQg
aGFzIFFFTVUgYmFja2VuZDoKPiA+Cj4gPiBzdHJ1Y3QgbGlieGxfX2RldmljZV90eXBlIHsKPiA+
ICAgICAuLi4KPiA+ICAgICBkZXZpY2VfcWVtdV9iYWNrZW5kX2ZuX3QgcWVtdV9iYWNrZW5kCj4g
PiB9Cj4gPgo+ID4gSW4gdGhpcyBjYXNlLCBpbnRyb2R1Y2luZyBuZXcgZGV2aWNlIHR5cGUgZm9y
IFZLQkQgaXMgbm90IG5lZWRlZC4gVGhlIFZLQkQKPiA+IGRldmljZSB3aWxsIGNoZWNrIGJhY2tl
bmQgdHlwZSBYUyBlbnRyeSB0byBkZWZpbmUgd2hpY2ggYmFja2VuZCBpcyBydW5uaW5nLgo+Cj4g
U29ycnkgZm9yIHRoZSBkZWxheSByZXBseWluZy4gIEluIHlvdXIgZWFybGllciBtYWlscyBJIGhh
ZCB0cm91YmxlCj4gZmlndXJpbmcgb3V0IHdoYXQgeW91IG1lYW50IGJ1dCB0aGlzIGxpdHRsZSB2
aWduZXR0ZSBtYWtlcyBpdCBjbGVhciB0bwo+IG1lLgo+Cj4gSSB0aGluayB0aGUgcHJvYmxlbSB5
b3UgYXJlIHRyeWluZyB0byBzb2x2ZSBpcyB0aGlzOiBpbiB5b3VyIGNhc2UKPiBRRU1VX0JBQ0tF
TkQgbmVlZHMgdG8gZGVwZW5kIG9uIHRoZSB2aXNpYmxlIHZrYl9iYWNrZW5kIGZpZWxkLCBidXQg
dGhlCj4gZGV2aWNlLT5iYWNrZW5kX2tpbmQgaXMgc2V0IHVuY29uZGl0aW9uYWxseSB0byBqdXN0
IFZLQiA/CgpFeGFjdGx5LgoKPgo+IENvdWxkIHlvdSBzb2x2ZSB0aGlzIHByb2JsZW0gYnkgaW52
ZW50aW5nIGEgbmV3IGJhY2tlbmRfa2luZCwgYW5kCj4gd3JpdGluZyB5b3VyIG93biBmdW5jdGlv
biBsaWJ4bF9fZGV2aWNlX2Zyb21fdmtiLCBhbmQgcHV0dGluZwo+ICpkaWZmZXJlbnQqIHZhbHVl
cyBpbnRvIGJhY2tlbmRfa2luZCA/ICBJIHRoaW5rIHRoYXQgaXMgd2hhdAo+IGJhY2tlbmRfa2lu
ZCBpcyBmb3IuICBTZWUgZm9yIGV4YW1wbGUgdmFyaW91cyBjb25zb2xlIGZ1bmN0aW9ucyBhbmQK
PiBhbHNvIGxpYnhsX19kZXZpY2VfZnJvbV9kaXNrLgo+CgpUaGlzIHdoYXQgd2FzIGRvbmUgaW4g
dGhpcyBwYXRjaC4gVklOUFVUIGJhY2tlbmQgdHlwZSB3YXMgaW50cm9kdWNlZC4KUHJvYmFibHkg
dGhlIG5hbWUgc2hvdWxkIGJlIGNoYW5nZWQgYnV0IGhhdmUgbm8gaWRlYSB3aGljaCBiYWNrZW5k
CmtpbmQgaXMgbW9yZSBzdWl0YWJsZSBmb3IgdGhpcyBwdXJwb3NlLgoKQWxzbyBiYWtjZW5kLXR5
cGUgeGVuc3RvcmUgZW50cnkgd2FzIHJlbW92ZWQgYXMgcmVkdW5kYW50IGluIHRoaXMgY2FzZS4K
QXMgdGhlIFBWIGJhY2tlbmQgZXhwZWN0cyBkZXZpY2Uga2luZCBWSU5QVVQuCgo+ID4gMi4gVXNl
IHN0cmluZyB0eXBlIGZvciBWS0JEIGJhY2tlbmRfdHlwZSBmaWVsZCBpbnN0ZWFkIG9mIGVudW0u
IEl0IHdpbGwgYmUKPiA+IGVtcHR5IGZvciBRRU1VIGFuZCBnZW5lcmljIGZvciAidXNlciBzcGFj
ZSIgYmFja2VuZHMuCj4KPiBUaGlzIHNlZW1zIHdvcnNlLgo+Cj4gPiBPbiBNb24sIE9jdCAyOCwg
MjAxOSBhdCA0OjA2IFBNIE9sZWtzYW5kciBHcnl0c292IDxhbDFpbWdAZ21haWwuY29tPiB3cm90
ZToKPiA+ID4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgNDoyNiBQTSBPbGVrc2FuZHIgR3J5dHNv
diA8YWwxaW1nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gW0lhbjpdCj4gPiA+ID4gPiBbT2xl
a3NhbmRyOl0KPiA+ID4gPiA+ID4gW0lhbjpdCj4gPiA+ID4gPiA+ID4gSSBhbHNvIGRvbid0IHVu
ZGVyc3RhbmQgd2h5IHRoZSAidXNlciBzcGFjZSIga2JkIGJhY2tlbmQgc2VlbXMgdG8gYmUKPiA+
ID4gPiA+ID4gPiAibGludXgiIGluIHRoZSBlbnVtLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJ
IGFncmVlIHRoaXMgaXMgbm90IHNvIGdvb2QgbmFtZS4gQnV0IEkgZG9uJ3Qga25vdyBob3cgdG8g
Y2FsbAo+ID4gPiA+ID4gPiBiYWNrZW5kcyB3aGljaCBhcmUgbm90IHJ1bm5pbmcKPiA+ID4gPiA+
ID4gaW5zaWRlIFFFTVUgaW4gZ2VuZXJhbC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHRoaW5rIHRo
aXMgd291bGQgYmUgdXNlYWJsZSBvbiBmcmVlYnNkID8gICJsaW51eCIgZGVmaW5pdGVseSBzZWVt
cwo+ID4gPiA+ID4gd3JvbmcuICBJIHNlZSBpdCBoYXNuJ3QgYmVlbiBpbiBhIHJlbGVhc2Ugc28g
aXQgaXMgbm90IHRvbyBsYXRlIHRvCj4gPiA+ID4gPiByZW5hbWUgaXQsIHN1YmplY3QgdG8gZGlz
Y3Vzc2lvbiB3aXRoIEp1ZXJnZW4gYXMgUk0uCj4gLi4uCj4gPiA+ID4gPiBNYXliZSAibGludXgi
IHNob3VsZCBiZSAidHJvb3BzIi4uLgo+ID4gPiA+Cj4gPiA+ID4gSXQgZG9lc24ndCBsb29rIGFz
IGdlbmVyaWMgc29sdXRpb24uIElmIHNvbWUgdXNlciBpbXBsZW1lbnRzIG93biBiYWNrZW5kCj4g
PiA+ID4gaXQgc2hvdWxkIGFkZCBuZXcgZW50cnkgaW50byBiYWNrZW5kIHR5cGUgZW51bS4KPgo+
IFdvdWxkIHlvdSBiZSBwcmVwYXJlZCB0byBjaGFuZ2UgaXQgdG8gKnNvbWV0aGluZyogZWxzZSA/
Cj4KPiBBRkFJQ1QgZnJvbSB0aGUgY29kZSBpdCBqdXN0IHVzZXMgd2hhdCB3b3VsZCB0aGUgYHVz
dWFsJyB4ZW5zdG9yZSBwdgo+IGNvbnRyb2wgcGxhbmUgcGF0aCBmb3IgYSBkZXZpY2UgY2FsbGVk
ICJ2a2IiID8KPgoKSSBndWVzcyB5ZXMuCgo+IFNvIG1heWJlIHdlIGNvdWxkIGNhbGwgaXQgInB2
IiA/CgpEbyB5b3UgbWVhbiBMSUJYTF9WS0JfQkFDS0VORF9QVj8KCj4gSXMgdGhlcmUgYSBwcm90
b2NvbCBkb2MgSSBzaG91bGQgYmUKPiBsb29raW5nIGF0IHRoYXQgZGVmaW5lcyB0aGlzIHZrYiBp
bnRlcmZhY2UgPwo+CgpUaGlzIFBWIGJhY2tlbmQgdXRpbGl6ZXMgdGhlIHByb3RvY29sIGRlc2Ny
aWJlZCBpbiBrYmRpZi5oCgo+IFNvcnJ5IHN0aWxsIHRvIGJlIHNvIGNvbmZ1c2VkLgo+Cj4gUmVn
YXJkcywKPiBJYW4uCgoKCi0tIApCZXN0IFJlZ2FyZHMsCk9sZWtzYW5kciBHcnl0c292LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
