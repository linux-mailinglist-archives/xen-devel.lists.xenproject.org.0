Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51051013A4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 06:27:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWvzM-0002H4-S4; Tue, 19 Nov 2019 05:23:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uXZT=ZL=gmail.com=2rushikeshj@srs-us1.protection.inumbo.net>)
 id 1iWvzK-0002Gy-Jc
 for xen-devel@lists.xen.org; Tue, 19 Nov 2019 05:23:42 +0000
X-Inumbo-ID: bf0ba364-0a8c-11ea-9631-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf0ba364-0a8c-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 05:23:41 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f7so15962165edq.3
 for <xen-devel@lists.xen.org>; Mon, 18 Nov 2019 21:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5W2e9t3vTvtZJkgUMbTgbzykRrrMthdzfOIjvc1CITw=;
 b=Vs12psXkvYqbOYwi06qB/fYkpTx1+EVyWN0h8tyOOtoxmNRIXXeTy4ywY1k0BMg4Vi
 l9opXHxoDoF68PxHBZQb20DzwLYBfgxW4ME+77V9NEuPaKeUYFVCjxC0s5GinrjxHEnK
 eHGy0hE+04J6uuDZzk0qBrUh1hIejRGIsY82Ym0OhUIbA3h7QAD03sM5h/RDwDWHIl31
 VFDLvtaQaHhTHj64IONIfJeqkvdXf/mA3IBA9a2t3TgoVC6PNxd+cm2y/9A3z69ALlRo
 XUtz7xYAgUX+5i7ZPietLkXz7WuFi9oStKwUZn67Wn0++ewffVuEqGcBFChuOxLhwQMX
 xFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5W2e9t3vTvtZJkgUMbTgbzykRrrMthdzfOIjvc1CITw=;
 b=efgAYBLwV6OhEgGnPcHE5g3lTZ8X5o71O6lgo1q3oJX8g8thGCq3iuF2hrQcDKsCBW
 VFlvwZTwEDAcSu8B04wndrTdMdWOkA4Lc+M0EunRTifI7z0FXQCvZr3GtRjz0PjarwPm
 Kjuaf/68RBPrminiOPbm1erdRdeDWZxdKgfnxyuU2Uw9GZzqKDaCiBRxV4HOnr1sAq9P
 JJd+11uTOT0lkU1YWNRQK4jfhYuQHG4jsW1U5H8xmKkIKbQZZrybvHo6RakrbLkENKX8
 2BJVIhSFMyLqAEMkE/wtihx7PHSdyJB5KD/dhkrg/TKd/e5u2Mc58xG91vWwkaUKVXT1
 EX/A==
X-Gm-Message-State: APjAAAW2f9ooL2WkyY+HPBD4RmRVxGL0GNU46yFW+YFNaB1V/Iee+4S3
 uShiwRAUmBEhF7NExXUI3UrKs99MqIlx2CG64Pg=
X-Google-Smtp-Source: APXvYqz5Xre29xzoOLliksIjQ1UPoMr1Eh/6LGrd7Aqf946rqNC2dKqWUFQHP4HuIYYu8wP9aBo+X4iv+DMVmO0urUc=
X-Received: by 2002:a17:906:53c7:: with SMTP id
 p7mr31884397ejo.88.1574141020074; 
 Mon, 18 Nov 2019 21:23:40 -0800 (PST)
MIME-Version: 1.0
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
In-Reply-To: <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
From: Rishi <2rushikeshj@gmail.com>
Date: Tue, 19 Nov 2019 10:53:29 +0530
Message-ID: <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMzowOCBQTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTUuMTEuMjAxOSAyMDoxOSwgUmlzaGkgd3JvdGU6Cj4gPiBP
biBUaHUsIE5vdiAxNCwgMjAxOSBhdCAxMDowNSBQTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTQuMTEuMjAxOSAxNzowNywgUmlzaGkgd3JvdGU6
Cj4gPj4+IEluIHNvbWUgb2Ygb3VyIGhvc3RzLCBYZW4gaXMgbm90IGNvcnJlY3RseSBleHBvc2lu
ZyBwcm9jZXNzb3IgdGhlcm1hbAo+ID4+PiBjYXBhYmlsaXRpZXMgdG8gRG9tMC4KPiA+Pj4gUGxl
YXNlIHJlZmVyOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIw
NTM0Nwo+ID4+Pgo+ID4+PiBUaGUgZmxhZwo+ID4+PiAvKiBUaGVybWFsIGFuZCBQb3dlciBNYW5h
Z2VtZW50IExlYWYsIENQVUlEIGxldmVsIDB4MDAwMDAwMDYgKEVBWCksIHdvcmQgMTQgKi8KPiA+
Pj4gWDg2X0ZFQVRVUkVfRFRIRVJNICgxNCozMisgMCkKPiA+Pj4KPiA+Pj4gaXMgcmV0dXJuZWQg
MCB2aWEgUFZPUF9WQ0FMTDQgdnMgcmV0dXJucyAxIHZpYSBuYXRpdmVfY3B1aWQoKSBjYWxsIGZy
b20gRG9tMC4KPiA+Pj4KPiA+Pj4gU2FtcGxlIG91dHB1dCB2aWEgUFZDQUxMIHZzIE5hdGl2ZSBj
YWxsLgo+ID4+PiBbNjMyOTEuNjg4NzU1XSBjcHVpZF9lYXggNiA6ICBhIDAKPiA+Pj4gWzYzMjkx
LjY4ODc1OV0gbmF0aXZlX2NwdWlkIDogYSA3Nwo+ID4+Pgo+ID4+PiBJcyB0aGlzIGEgYnVnIG9y
IG5lZWRzIHNvbWUgc3BlY2lhbCBmZWF0dXJlIHRvIGJlIGVuYWJsZWQgZnJvbSBYZW4gY29tbWFu
ZCBsaW5lPwo+ID4+Cj4gPj4gRXhwb3NpbmcgdGhpcyB0byBndWVzdHMgKGluY2x1ZGluZyBEb20w
KSB3b3VsZCBpbXBseSBwcm9wZXJseQo+ID4+IHZpcnR1YWxpemluZyB0aGUgcmVzcGVjdGl2ZSBi
ZWhhdmlvci4gSW4KPiA+PiB4ZW4vYXJjaC94ODYvY3B1aWQuYzpyZWNhbGN1bGF0ZV9taXNjKCkg
d2Ugc3BlY2lmaWNhbGx5IGhhdmUKPiA+Pgo+ID4+ICAgICBwLT5iYXNpYy5yYXdbMHg2XSA9IEVN
UFRZX0xFQUY7IC8qIFRoZXJtL1Bvd2VyIG5vdCBleHBvc2VkIHRvIGd1ZXN0cy4gKi8KPiA+Pgo+
ID4+IElmIHlvdSB3YW50ZWQgdGhpcyBleHBvc2VkLCB5b3UnZCBmaXJzdCBvZiBhbGwgbmVlZCB0
byBjb21lIHVwCj4gPj4gd2l0aCBhIHNhbmUgdmlydHVhbGl6YXRpb24gbW9kZWwgb2YgdGhpcyBm
dW5jdGlvbmFsaXR5LiBTaW1wbHkKPiA+PiBleHBvc2luZyB0aGUgQ1BVSUQgYml0cyBpcyBub3Qg
Z29pbmcgdG8gYmUgYW4gb3B0aW9uLgo+ID4KPiA+IElzIGl0IGR1ZSB0byBhbnkgc2VjdXJpdHkg
cmlza3M/IElmIHNvLCBhcmUgdGhlcmUgYW55IGFkdmlzb3JpZXMgYXJvdW5kIGl0Pwo+Cj4gTm8s
IGl0J3MgYmVjYXVzZSBvZiB0aGUgc3BsaXQgb2YgcmVzcG9uc2liaWxpdGllczogSXQncyBYZW4g
dG8gbWFuYWdlCj4gdGhlIENQVXMuCj4KPiA+IFNob3VsZCBpdCBiZSBhbGxvd2VkIHRoYXQgWGVu
IGlzIGhpZGluZyBDUFUgZmxhZ3MgKGluIHRoaXMgY2FzZQo+ID4gVGhlcm0pLCB5ZXQgYSBtb2Rp
ZmljYXRpb24gdG8gRG9tMCBrZXJuZWwgYWxsb3dzIHRoZW0gdG8gYmUgYnJvdWdodAo+ID4gYmFj
az8KPgo+IFllcywgYSBQViBrZXJuZWwgaXMgc3VwcG9zZWQgdG8gZG8gdGhpbmdzIHRoZSBQViB3
YXksIGkuZS4gaW4KPiBwYXJ0aWN1bGFyIHVzZSB0aGUgUFYgZm9ybSBvZiBDUFVJRC4gKE5vdGUg
dGhhdCBvbiBoYXJkd2FyZSBzdXBwb3J0aW5nCj4gQ1BVSUQgZmF1bHRpbmcgeW91IGNhbid0ICJi
cmluZyBiYWNrIiB0aGUgZmxhZ3MgdmlhIGEga2VybmVsIGNoYW5nZSwKPiBzaW5jZSB0aGVuIF9h
bGxfIENQVUlEIGludm9jYXRpb25zIHdpbGwgYmUgaGFuZGxlZCBieSBYZW4gaW5zdGVhZCBvZgo+
IGJ5IGJhcmUgaGFyZHdhcmUuIFNvIF9ub3RfIGRvaW5nIHRoaW5ncyB0aGUgUFYgd2F5IGluIHRo
ZSBrZXJuZWwgc2V0cwo+IHlvdSB1cCBmb3Igc3VycHJpc2VzLikKPgo+IEphbgoKb2ssIHRoYW5r
cyBmb3IgY2xlYXJpbmcgaXQgdXAuIFdvdWxkIGEgcGF0Y2ggYmUgYWNjZXB0ZWQgaWYgdGhpcwpv
cHRpb24gb2Ygc2hvd2luZyBFQVggbGVhZiBpcyBzZWxlY3RpdmVseSBkb25lIHRocm91Z2ggY29t
bWFuZCBsaW5lCihkZWZhdWx0IGRpc2FibGVkKT8KT24gbG9uZ2VyIHJ1biwgd2hhdCBpcyBhbiBl
eHBlY3RlZCBzYW5lIG1vZGVsIG9mIHZpcnR1YWxpemluZyB0aGlzPwpXaXRoIHNvbWUgZ3VpZGFu
Y2UsIG1heSBiZSBJIG9yIHNvbWVvbmUgZWxzZSBjYW4gY29kZSB0byBicmluZyB0aGUKZnVuY3Rp
b25hbGl0eSBiYWNrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
