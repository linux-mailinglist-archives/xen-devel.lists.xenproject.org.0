Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126A314322C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 20:28:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itcf3-0005a6-8a; Mon, 20 Jan 2020 19:24:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aT4h=3J=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1itcf2-0005a1-9c
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 19:24:32 +0000
X-Inumbo-ID: 7acd12a0-3bba-11ea-9fd7-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7acd12a0-3bba-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 19:24:30 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m26so226898ljc.13
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 11:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FVmDnY/GWl6e64va5yvHsK4b6tWz+y8/fNWHyc/Cxfw=;
 b=FtdTU+c3myGG4u+raNdVX8n13rZjSN7frre4THwPEWmJGd5gm4gcLHQlrGQwqZ6gxl
 i/3N2ml29SbXtAShVCZJ8Xuf3PJ+AeWghqsgPi/7NRo2eDlLdPGK1XGQF3Nxf4wYumHo
 xdMbO5bkNKe8oIajhk0KD3yiKG38vkZGZfAow984UsaYAVkTjhTLyfe2DtOU38IKI1bj
 Ym1D5OApEi1FYeDFVuLObKF1SIIIRvj3vZkMZo8k6IaL5pP12+nuXd2JitF42ojVAqyM
 IfLmTGMWui3kcco3K4Es+GodgNRjujusZ3H5wza5l6u7RkYRAJtunM4yFYTNbWmLeCcH
 lbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FVmDnY/GWl6e64va5yvHsK4b6tWz+y8/fNWHyc/Cxfw=;
 b=Ig9+QHwiBFmjGlI8k3F59nvwqeGa2fQEFcsvYA8M92+kXXoQYrFLSR2+Kw6eWYEUyU
 K1Z8Tcp4V+/LwldzSm2iGGgX6UUL+quJ2TNu+BnEGrteTLqi1DKzmI9P5xFCZO5q0sQH
 bqKEph3U/UvCwtotY7i9gthLfzHsQ9JHMT7gorBNcyy7LTfSRlxcICOkOVX6a7PjwgCW
 /EhKgHF0HY8/lM85CkTYU8QHoatiFMSET2c29oi5l8E9/oCPRCSbqM4sS0Hm9aFqDLKB
 6FlljJB0yOtDTtQw7pxsKPYQk06Khh3wlzYsxNqGVr2ZThXP7yCe6dyDP90UsSVx3B5Q
 Txsg==
X-Gm-Message-State: APjAAAVlrYNonc45lt40X3ymw0gQBIknEmX6U8Vf2NtVoMeWBlR9oxBZ
 ZK7Fr565qptj5dIZjOiL0vV8n58foRbO9XsVXQE=
X-Google-Smtp-Source: APXvYqxovwc9HtCpp/FELNERsEAOwktBHUW8RCML9d0SXW15FY7hsBWiJE7lwRugYpSPhd8Oe4eQzK/4Md9w01ZdcEw=
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr14472533ljj.102.1579548269379; 
 Mon, 20 Jan 2020 11:24:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <27770209c1e2984cda8b9893ed6313fb2bdf30a6.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <27770209c1e2984cda8b9893ed6313fb2bdf30a6.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Jan 2020 14:24:18 -0500
Message-ID: <CAKf6xpv--A2zUieSAY47L9dppsP43rd=zrJdVB_Rxps3CWTnqQ@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 05/16] libxl: Handle Linux stubdomain
 specific QEMU options.
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Eric Shelton <eshelton@pobox.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRXJp
YyBTaGVsdG9uIDxlc2hlbHRvbkBwb2JveC5jb20+Cj4KPiBUaGlzIHBhdGNoIGNyZWF0ZXMgYW4g
YXBwcm9wcmlhdGUgY29tbWFuZCBsaW5lIGZvciB0aGUgUUVNVSBpbnN0YW5jZQo+IHJ1bm5pbmcg
aW4gYSBMaW51eC1iYXNlZCBzdHViZG9tYWluLgo+Cj4gTk9URTogYSBudW1iZXIgb2YgaXRlbXMg
YXJlIG5vdCBjdXJyZW50bHkgaW1wbGVtZW50ZWQgZm9yIExpbnV4LWJhc2VkCj4gc3R1YmRvbWFp
bnMsIHN1Y2ggYXM6Cj4gLSBzYXZlL3Jlc3RvcmUKPiAtIFFNUCBzb2NrZXQKPiAtIGdyYXBoaWNz
IG91dHB1dCAoZS5nLiwgVk5DKQo+Cj4gU2lnbmVkLW9mZi1ieTogRXJpYyBTaGVsdG9uIDxlc2hl
bHRvbkBwb2JveC5jb20+Cj4KPiBTaW1vbjoKPiAgKiBmaXggZGlzayBwYXRoCj4gICogZml4IGNk
cm9tIHBhdGggYW5kICJmb3JtYXQiCj4gICogcGFzcyBkb3duc2NyaXB0IGZvciBuZXR3b3JrIGlu
dGVyZmFjZXMKClNpbmNlIHRoaXMgaXMgaGVyZS4uLgoKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBH
YWlzZXIgPHNpbW9uQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gW2Ryb3AgUXViZXMtc3BlY2lm
aWMgcGFydHNdCgouLi5tYXliZSBtZW50aW9uIGRyb3BwaW5nIGRvd25zY3JpcHQgaGVyZT8gIE90
aGVyd2lzZSB0aGUgY29tbWl0Cm1lc3NhZ2UgYW5kIGNvbnRlbnRzIGRvbid0IG1hdGNoLgoKPiBT
aWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlz
aWJsZXRoaW5nc2xhYi5jb20+Cj4gLS0tCgo8c25pcD4KCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBpbmRleCAx
NDJiOTYwLi5hNmQ0MGI3IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
Cj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBAQCAtMTY5LDYgKzE2OSwzMSBA
QCBpbnQgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywK
PiAgICAgICAgICB9Cj4gICAgICB9Cj4KPiArICAgIGlmIChiX2luZm8tPnR5cGUgPT0gTElCWExf
RE9NQUlOX1RZUEVfSFZNICYmCj4gKyAgICAgICAgbGlieGxfZGVmYm9vbF92YWwoYl9pbmZvLT5k
ZXZpY2VfbW9kZWxfc3R1YmRvbWFpbikpIHsKPiArICAgICAgICBpZiAoIWJfaW5mby0+c3R1YmRv
bWFpbl9rZXJuZWwpIHsKPiArICAgICAgICAgICAgc3dpdGNoIChiX2luZm8tPmRldmljZV9tb2Rl
bF92ZXJzaW9uKSB7Cj4gKyAgICAgICAgICAgICAgICBjYXNlIExJQlhMX0RFVklDRV9NT0RFTF9W
RVJTSU9OX1FFTVVfWEVOX1RSQURJVElPTkFMOgo+ICsgICAgICAgICAgICAgICAgICAgIGJfaW5m
by0+c3R1YmRvbWFpbl9rZXJuZWwgPQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9f
YWJzX3BhdGgoTk9HQywgImlvZW11LXN0dWJkb20uZ3oiLCBsaWJ4bF9feGVuZmlybXdhcmVkaXJf
cGF0aCgpKTsKPiArICAgICAgICAgICAgICAgICAgICBiX2luZm8tPnN0dWJkb21haW5fcmFtZGlz
ayA9IE5VTEw7Cj4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAg
ICBjYXNlIExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVOOgo+ICsgICAgICAgICAg
ICAgICAgICAgIGJfaW5mby0+c3R1YmRvbWFpbl9rZXJuZWwgPQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICBsaWJ4bF9fYWJzX3BhdGgoTk9HQywKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAic3R1YmRvbS1saW51eC1rZXJuZWwiLAoKTm90IHRvIGJpa2VzaGVkLCBidXQgdGhp
cyBjYW1lIHVwIGluIGEgY29udmVyc2F0aW9uIGEgbGl0dGxlIHdoaWxlCmFnby4gIFN0dWJkb20g
aXMgYSBnZW5lcmljIG5hbWUsIGFuZCB0aGlzIGNvZGUgaXMgZm9yIGEgZGV2aWNlIG1vZGVsLgpT
byBzb21lIGNvbWJpbmF0aW9uIG9mIHFlbXV7LC1kbX17LC1saW51eH0ta2VybmVsIHNlZW1zIG1v
cmUKZGVzY3JpcHRpdmUuCgpIYXZpbmcgc2FpZCB0aGF0LCBJJ20gZmluZSB3aXRoIGl0IGFzIGlz
IHNpbmNlIEkgZG9uJ3QgaW1hZ2luZSBtb3JlCnN0dWJkb21zIHNob3dpbmcgdXAuCgo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX194ZW5maXJtd2FyZWRpcl9wYXRoKCkp
Owo+ICsgICAgICAgICAgICAgICAgICAgIGJfaW5mby0+c3R1YmRvbWFpbl9yYW1kaXNrID0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2Fic19wYXRoKE5PR0MsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgInN0dWJkb20tbGludXgtcm9vdGZzIiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9feGVuZmlybXdhcmVkaXJfcGF0aCgpKTsK
PiArICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgIGRlZmF1bHQ6
Cj4gKyAgICAgICAgICAgICAgICAgICAgYWJvcnQoKTsKCkNhbiB3ZSByZXR1cm4gYW4gZXJyb3Ig
aW5zdGVhZD8KCj4gKyAgICAgICAgICAgIH0KPiArICAgICAgICB9Cj4gKyAgICB9Cj4gKwo+ICAg
ICAgaWYgKCFiX2luZm8tPm1heF92Y3B1cykKPiAgICAgICAgICBiX2luZm8tPm1heF92Y3B1cyA9
IDE7Cj4gICAgICBpZiAoIWJfaW5mby0+YXZhaWxfdmNwdXMuc2l6ZSkgewoKPHNuaXA+CgpSZXZp
ZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
