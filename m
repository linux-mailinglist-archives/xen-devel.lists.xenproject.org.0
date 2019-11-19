Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B71024B8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 13:43:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX2oI-0006zs-9U; Tue, 19 Nov 2019 12:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+9Mm=ZL=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iX2oG-0006zn-En
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 12:40:44 +0000
X-Inumbo-ID: cd2bc5e0-0ac9-11ea-9631-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd2bc5e0-0ac9-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 12:40:43 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id k1so23000645ioj.6
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2019 04:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pQgJ3wOCtJGGShGezwAG2E9Vv+SUL5DWqgoVCEVJlRo=;
 b=ZjKiwuPyJtYXJ77iEDdCwz1qjNcCiJAzJdHf4KdDjehY3kgH7Rf/05XNfIq0YUFF80
 8qM9/5Y2W4olcuBrBQcu/Bt667HyTSSe7r7hcgWAsdj3M2XBlJhdJ7HwIfbEcbF10bCR
 oWuFpCL7wUMZpiYo5sve/5UPbZC+LFoJ+9ajmfk2JuLIKUFQ9Q31KSwjlKb4mOq6yb8B
 PV3E2JjiJkGy6Qh/ZXSuuq6P2+5qad+zGqiX0wOzMwCD7HUCKsDQM4D6j14LIGu57FwV
 8CvT7VT7gtSmAA9ROkNSiVkqELdBvGAcpxGij4PsAlAXCiza6aDqqYQ1xAcbOxlTd622
 Ja8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pQgJ3wOCtJGGShGezwAG2E9Vv+SUL5DWqgoVCEVJlRo=;
 b=ZimQIQG9Hsf4zKsqs3ioYxzh6jDU3Okku7N7zHQX0WT/9eHQElZJWdbKux+mM+I1hj
 wHiRp1+W7pdYkzZFgmWCepo4+wih3P1ZwdgypXq4zTmWzRQDyxSqhVmbTc/esQfIBnW8
 JtbPWCeJHVJhDyEzvoIY+aDchhnobWOA1XjUYSqPao+cdRZsi8OozQYOauxf8cXebx3A
 KsVC+psdxgpz3t+nfaS3Ju0DXoeEq1m3fZmMpmyIrr8ZDg6/R/ygfINpaii0S5cGK57e
 uxecFi+UPYZGCftlh7/vQXQOnzgjNdsEXsoVTkZuRks1dKgXxZw3puQVBOB/P68XWu0o
 cHNQ==
X-Gm-Message-State: APjAAAUoOo6CM3b05Ev1+tmcGregwaHUHnyuDlERmEnmghBHYowAGTt1
 tzrR0mRucz63pRkBbWHrXXoy40tYnKv2WuMtCfA=
X-Google-Smtp-Source: APXvYqwczcosUwQ3hgryHLuv5OOCM6SE/J2VUJSTWr2N01h8L+39BBInqFooCoOsNqL8jWDeN2R6tl3eaPWsOIF1GNA=
X-Received: by 2002:a5d:88c6:: with SMTP id i6mr1872642iol.251.1574167243181; 
 Tue, 19 Nov 2019 04:40:43 -0800 (PST)
MIME-Version: 1.0
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
 <24018.56094.533062.819238@mariner.uk.xensource.com>
In-Reply-To: <24018.56094.533062.819238@mariner.uk.xensource.com>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Tue, 19 Nov 2019 14:40:32 +0200
Message-ID: <CACvf2oXNrgs4BLiDSz_Lzqau2_e_ykmJYPqvYsRCreTM9-zagg@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH for-4.13 v1 1/2] libxl: introduce new
 backend type VINPUT
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Juergen Gross <jgross@suse.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgNzo1NSBQTSBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbGVrc2FuZHIgR3J5dHNvdiB3cml0ZXMgKCJbUEFUQ0gg
djEgMS8yXSBsaWJ4bDogaW50cm9kdWNlIG5ldyBiYWNrZW5kIHR5cGUgVklOUFVUIik6Cj4gPiBG
cm9tOiBPbGVrc2FuZHIgR3J5dHNvdiA8b2xla3NhbmRyX2dyeXRzb3ZAZXBhbS5jb20+Cj4gPgo+
ID4gVGhlcmUgYXJlIHR3byBraW5kIG9mIFZLQkQgZGV2aWNlczogd2l0aCBRRU1VIGJhY2tlbmQg
YW5kIHVzZXIgc3BhY2UKPiA+IGJhY2tlbmQuIEluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdGhl
eSBjYW4ndCBiZSBkaXN0aW5ndWlzaGVkIGFzIGJvdGggdXNlCj4gPiBWS0JEIGJhY2tlbmQgdHlw
ZS4gQXMgcmVzdWx0LCB1c2VyIHNwYWNlIEtCRCBiYWNrZW5kIGlzIHN0YXJ0ZWQgYW5kCj4gPiBz
dG9wcGVkIGFzIFFFTVUgYmFja2VuZC4gVGhpcyBjb21taXQgYWRkcyBuZXcgZGV2aWNlIGtpbmQg
VklOUFVUIHRvIGJlCj4gPiB1c2VkIGFzIGJhY2tlbmQgdHlwZSBmb3IgdXNlciBzcGFjZSBLQkQg
YmFja2VuZC4KPgo+IFRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaCBhbmQgdGhhbmsgeW91IGZvciB0
aGUgZXhwbGFuYXRpb25zLgo+Cj4gQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgo+Cj4gSSB3YXNuJ3QgYWJsZSB0byBmaW5kIGEgcG9zdGluZyBvZiB0aGlz
IHBhdGNoIGJlZm9yZSB0aGUgbGFzdCBwb3N0aW5nCj4gZGF0ZSBmb3IgNC4xMyBvZiB0aGUgMTN0
aCBvZiBTZXB0ZW1iZXIuICBIYXZlIEkgbWlzc2VkIGl0ID8gIFdlIG1pZ2h0Cj4gYmUgYWJsZSB0
byBqdXN0aWZ5IGEgZnJlZXplIGV4Y2VwdGlvbiBvbiB0aGUgZ3JvdW5kcyB0aGF0IHRoaXMgY2hh
bmdlCj4gYWZmZWN0cyBvbmx5IHZrYiB1c2VycyBidXQgaXQgd291bGQgYmUgYSBtYXR0ZXIgZm9y
IHRoZSBSTSAoQ0MnZCkuCj4KClRoaXMgY29tbWl0IHdhcyBzdWJtaXR0ZWQgd2l0aCBwYXRjaGVz
ZXQgWzFdLgpFYXJsaWVyIEkndmUgc3VibWl0dGVkIHRoZSBwYXRjaCB0byBzb2x2ZSB0aGUgaXNz
dWUgd2l0aCBwYXRjaGVzdCBbMl0uCkJ1dCB0aGF0IHBhdGNoZXQgd2FzIHRvdGFsbHkgd3Jvbmcu
Cgo+Cj4gSSB3b3VsZCBsaWtlIHRvIGNoYW5nZSB0aGUgImxpbnV4IiB0byAicHYiIG9yIHNvbWV0
aGluZyBlbHNlLCBmb3IKPiA0LjEzLCBhdCBsZWFzdC4KCkkgd2lsbCBzdWJtaXQgVjIgd2l0aCBy
ZW5hbWluZyBhbmQgY29tbWVudHMgYWRkcmVzc2VkIGZvciBzZWNvbmQgY29tbWl0IFszXQpvZiB0
aGUgcGF0Y2hzZXQuCgo+Cj4gSWFuLgoKWzFdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZl
bCZtPTE1NzA1NDM5MDAwNjY5MSZ3PTIKWzJdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZl
bCZtPTE1MTMyNjA4OTYwNDUyNCZ3PTIKWzNdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZl
bCZtPTE1NzA1NDM5MTUwNjcwOCZ3PTIKCgotLQpCZXN0IFJlZ2FyZHMsCk9sZWtzYW5kciBHcnl0
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
