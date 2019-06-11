Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607803D764
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 22:01:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hamvW-0005Xu-Nv; Tue, 11 Jun 2019 19:59:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W27b=UK=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1hamvV-0005Xo-EJ
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 19:59:25 +0000
X-Inumbo-ID: 6865809c-8c83-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6865809c-8c83-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 19:59:24 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t28so12871844lje.9
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 12:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jAAqlgEKFgjdoE/fxTYBf8FCfuqhuqqgtFGSbFdsBBY=;
 b=KKsvlEPFrpX5bldLzt7+lWoTdN74xfhUhU5Iqszn5JO39oDh9+TIYxlDXIxLNJNONM
 SZ3t284RrjDCgjWCtSGAbFBJW/r9/r3NwoTD4otaVaxBJAgPsnahqojkWFpx6hOHWi2D
 wJtotPZg0ga+ttp0flaaPUbTwx6AAekcaWS8sV2feRU2+/yOPs1arqwUEXgonrDubQMm
 N54jPA6GoQT3FmhYlOdUIvTj25zkRy4aRhuPfwMFbkF19ivIcf8kWrEJ5GVFsOfSWNSU
 rEA2gARicLx8cMAQaO8TR4TWRAEyCzCjNVS2BfReDGiArEs3ZmzCdiNQcHcMH+MjdkQ2
 5zEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jAAqlgEKFgjdoE/fxTYBf8FCfuqhuqqgtFGSbFdsBBY=;
 b=ZwNWGME13tPSfjq5M4vLAwabWGw2mfkyXfs5blrHkweq67UZSneLX+97+FevMJLzU+
 x71WjP0Q5yeFL54woUeLEA1hZq0FC9vZektgF0Ufc3EkM0hTXTMwpKfHYbuS3us9a5uW
 Tecpy/I/yuNqHUznJoJwVgCB24fzS7yAfPEyfKTcAjRYmbiWuMnTExHbq6ROhHDd3l/R
 7bFa0wns2kMQnI2L4vrWJMe5m5RsNfbKOx1hwBzrLp0xrsDtC8B0O+LnLqF55ubUNzAG
 Hhepv5l6ENegi2bB6SqZzQ9k3tvf8PBRAJLfGrw93rCoHa/T7M9BAzRRbYJ2Vny8RUhv
 t4jg==
X-Gm-Message-State: APjAAAWaM4DBMjYXJgbe6NwvTlxsfR5lDKA+6+V/HWYV+pR0x5UCoFsJ
 JhtoSCWKFZHYi2bEg4gkpPVmcqBuX121JVomHcY=
X-Google-Smtp-Source: APXvYqysxUBJ0H9tZLDZetbowMR7umPD0HPbh+hUai0xzG+Xm57JKsIsP4dd42sCGBO7lfvMd8dnmWRTGcAjYpq3QiQ=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr2094560ljj.113.1560283162714; 
 Tue, 11 Jun 2019 12:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
 <43766a806049b9556dd73ed8c1d6368ab2b26c4f.1560272437.git.tsirakisn@ainfosec.com>
 <CACMJ4GZfTrrA=HkWemB96Qb_8wftbSxv+cXDpa6t0Z=gQc-ywQ@mail.gmail.com>
 <CAFqpmV+c9ZF8+Dh7sDwBQjx8MXAfWc7n5aKdPziQFUxg-7bj_A@mail.gmail.com>
In-Reply-To: <CAFqpmV+c9ZF8+Dh7sDwBQjx8MXAfWc7n5aKdPziQFUxg-7bj_A@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 11 Jun 2019 12:59:11 -0700
Message-ID: <CACMJ4GbeF+=7pLaQ97FQ9ZS9NknLMbbMdZsgh=ZXuxnGaKk1SQ@mail.gmail.com>
To: Nicholas Tsirakis <niko.tsirakis@gmail.com>
Subject: Re: [Xen-devel] [PATCH 2/2] argo: correctly report pending message
 length
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Nicholas Tsirakis <tsirakisn@ainfosec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTI6NTUgUE0gTmljaG9sYXMgVHNpcmFraXMKPG5pa28u
dHNpcmFraXNAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDI6
NDkgUE0gQ2hyaXN0b3BoZXIgQ2xhcmsKPiA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDEwOjExIEFNIE5pY2hvbGFz
IFRzaXJha2lzCj4gPiA8bmlrby50c2lyYWtpc0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBXaGVuIGEgbWVzc2FnZSBpcyByZXF1ZXVlJ2QgaW4gWGVuJ3MgaW50ZXJuYWwgcXVldWUsIHRo
ZSBxdWV1ZQo+ID4gPiBlbnRyeSBjb250YWlucyB0aGUgbGVuZ3RoIG9mIHRoZSBtZXNzYWdlIHNv
IHRoYXQgWGVuIGtub3dzIHRvCj4gPiA+IHNlbmQgYSBWSVJRIHRvIHRoZSByZXNwZWN0aXZlIGRv
bWFpbiB3aGVuIGVub3VnaCBzcGFjZSBmcmVlcyB1cAo+ID4gPiBpbiB0aGUgcmluZy4gRHVlIHRv
IGEgc21hbGwgYnVnLCBob3dldmVyLCBYZW4gZG9lc24ndCBwb3B1bGF0ZQo+ID4gPiB0aGUgbGVu
Z3RoIG9mIHRoZSBtc2cgaWYgYSBnaXZlbiB3cml0ZSBmYWlscywgc28gdGhpcyBsZW5ndGggaXMK
PiA+ID4gYWx3YXlzIHJlcG9ydGVkIGFzIHplcm8uIFRoaXMgY2F1c2VzIFhlbiB0byBzcHVycmlv
dXNseSB3YWtlIHVwCj4gPiA+IGEgZG9tYWluIGV2ZW4gd2hlbiB0aGUgcmluZyBkb2Vzbid0IGhh
dmUgZW5vdWdoIHNwYWNlLgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIG1ha2VzIHN1cmUgdGhhdCB0
aGUgbXNnIGxlbiBpcyBwcm9wZXJseSByZXBvcnRlZCBieQo+ID4gPiBwb3B1bGF0aW5nIGl0IGlu
IHRoZSBldmVudCBvZiBhIHdyaXRlIGZhaWx1cmUuCj4gPgo+ID4gWW91J3JlIGNvcnJlY3QgdGhh
dCB0aGlzIGlzIGFuIGlzc3VlIHRvIGJlIGZpeGVkLCBidXQgdW5mb3J0dW5hdGVseQo+ID4gdGhp
cyBwYXRjaCBkb2Vzbid0IGNvbXBpbGUsIGF0IGxlYXN0IHdpdGggZ2NjIDguMiB3aXRoIHdhcm5p
bmdzIGFzCj4gPiBlcnJvcnMsIHJlcG9ydGluZzoKPiA+Cj4gPiBhcmdvLmM6IEluIGZ1bmN0aW9u
ICdzZW5kdic6Cj4gPiBhcmdvLmM6MjA1NzozNTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBv
ZiAnaW92X2NvdW50JyBmcm9tCj4gPiBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2Vycm9y
PWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+ID4gICAgICAgICAgICAgIGlvdl9jb3VudChp
b3ZzLCBuaW92LCAmbGVuKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fgo+ID4gYXJnby5jOjcyMzoyNTogbm90ZTogZXhwZWN0ZWQgJ3Vuc2lnbmVkIGludCAqJyBi
dXQgYXJndW1lbnQgaXMgb2YgdHlwZQo+ID4gJ2xvbmcgdW5zaWduZWQgaW50IConCj4gPiAgICAg
ICAgICAgIHVuc2lnbmVkIGludCAqY291bnQpCj4gPiAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+
Xn5+fn4KPgo+IFNob290LCBzb3JyeSBhYm91dCB0aGF0LCBpdCBjb21waWxlcyBvbiBteSBlbmQg
anVzdCBmaW5lLgo+Cj4gPiBFdmVuIHdpdGhvdXQgdGhpcyBlcnJvciwgdGhlIGxvZ2ljIGl0IGlt
cGxlbWVudHMgY2FuIHVubmVjZXNzYXJpbHkKPiA+IGludm9rZSBpb3ZfY291bnQgdHdpY2UgdXBv
biB0aGUgc2FtZSBndWVzdC1zdXBwbGllZCBidWZmZXJzOyBpdCB3b3VsZAo+ID4gYmUgYmV0dGVy
IHRvIGF2b2lkIHRoYXQsIHNvOiBsb29raW5nIGF0IHRoZSBvcmlnaW5hbCBzZWN0aW9uIG9mIGNv
ZGU6Cj4gPgo+ID4gKiBzZW5kdidzICJsZW4iIHZhcmlhYmxlIGNhbiBiZSBpbnQsIHJhdGhlciB0
aGFuIGxvbmcuCj4gPiAqIGlvdl9jb3VudCBjYW4gYmUgY2FsbGVkIGZyb20gc2VuZHYsIGp1c3Qg
YmVmb3JlIHJpbmdidWZfaW5zZXJ0LAo+ID4gaW5zdGVhZCBvZiB3aXRoaW4gcmluZ2J1Zl9pbnNl
cnQuIEl0IGNhbiBwb3B1bGF0ZSBzZW5kdidzICJsZW4iCj4gPiB2YXJpYWJsZS4KPiA+ICogdGhl
IGxlbiBvYnRhaW5lZCBmcm9tIGlvdl9jb3VudCAoaWYgc3VjY2Vzc2Z1bCkgY2FuIGJlIHBhc3Nl
ZCBpbnRvCj4gPiByaW5nYnVmX2luc2VydCBhcyBhIHBhcmFtZXRlciwgYW5kIHJlcGxhY2Ugcmlu
Z2J1Zl9pbnNlcnQncyBleGlzdGluZwo+ID4gImxlbiIgdmFyaWFibGUuCj4gPiAqIHJpbmdidWZf
aW5zZXJ0J3MgIm91dF9sZW4iIHBvaW50ZXIgYXJndW1lbnQgY2FuIHRoZW4gYmUgZHJvcHBlZCBh
cwo+ID4gdW5uZWNlc3NhcnkuCj4gPiAqIHBlbmRpbmdfcmVxdWV1ZSB3aWxsIGJlIGZpbmUgdG8g
dXNlIHNlbmR2J3MgcG9wdWxhdGVkICJsZW4iIHZhcmlhYmxlLgo+Cj4gVGhpcyB3YXMgYW4gYWx0
ZXJuYXRpdmUgdGhhdCBJIGhhZCBjb25zaWRlcmVkLiBVbHRpbWF0ZWx5IEkgd2VudCB3aXRoIG15
IGN1cnJlbnQKPiBpbXBsZW1lbnRhdGlvbiBhcyBpdCBoYWQgbGVzcyBvZiBhIFNMT0MgY2hhbmdl
LCB0aG91Z2ggSSBzZWUgbm93IHRoYXQgdGhhdCB3YXMKPiBhIHBvb3IgY2hvaWNlLiBTaGFsbCBJ
IHN1Ym1pdCBhcyBhIHYyIG9yIHJlcGx5IHRvIHRoaXMgdGhyZWFkCj4gZGlyZWN0bHk/IEJlaW5n
IHRoYXQKPiB0aGUgZmlyc3QgcGF0Y2ggd2FzIGFscmVhZHkgcHVzaGVkLgoKdjIgcGxlYXNlLCBl
bnN1cmluZyB0aGF0IGl0IGFwcGxpZXMgdG8gc3RhZ2luZyBvbiB0b3Agb2YgdGhlIHByaW9yCnBh
dGNoIGFscmVhZHkgYXBwbGllZC4KCnRoYW5rcwoKQ2hyaXN0b3BoZXIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
