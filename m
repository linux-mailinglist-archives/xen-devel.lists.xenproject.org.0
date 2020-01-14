Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A111013AB7B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 14:54:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irMbZ-00054a-Hh; Tue, 14 Jan 2020 13:51:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bsQy=3D=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1irMbY-00054V-7i
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 13:51:36 +0000
X-Inumbo-ID: fa55beb8-36d4-11ea-a985-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa55beb8-36d4-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 13:51:35 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m26so14373284ljc.13
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 05:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q+n4dmjM9m23kufy0kmTywXxz4ja9q/vp9IFDZP1Ybw=;
 b=KvS3R28Li9VDyVUtr9x8ufXGSlrMi3syXKrm0L1JnuNNP7U7/EoPvdZTd5T9XHWOlg
 7fiYzImKzMMwCjfQRH+88tkf1GUEZvmJBMQGWy0wlWjZgFwrcFudUwl+uhIT/dqwaSxq
 pVGiOQJoNleObf2GhHpXViPTpLtqHzj7mY3MASQP6hMkDQGgnrh3Ns6LNF5pLL+/kPNj
 sf9GmfRx9leD3ImuN52VlC3F9bmXJN62M+3an/xIt/8aKrmAU0OTzjJOwT1F/7vtqqFD
 3yDOSG43Vh7h7AsSHO2/k3I3D2DqaiJodQ/LKmR/dWQWAzd9Z12FyYlfamtT6DCyWc6Q
 udMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+n4dmjM9m23kufy0kmTywXxz4ja9q/vp9IFDZP1Ybw=;
 b=hI3MiasMztWoj83/lu/y7IjVkLf8fYNbjnRgITTnHKKHS6hbSuXuy7rZb+jzBFbmfO
 KsVfOIa1ZgYGHUuXzVoq3UMRnibFAv5af7mpouqmy6PpzC65usVMRVx9GmtSjPLNq+qn
 CWLA3drdAlXgcPizIVIKaIrKg+gVf/Rt53yitcmS+dcmteoC/goNZ/QbC31uW7jNGo4n
 IwL40Qs9P1Vrgc9yDaX1VtfaXObTxuVd8/9UMU9lxTJdauH89wBHhUL7IFs48+wa0fVc
 cYMdLDY5H0ussm22acutXVGQjT0cWuH+/rAubTSB8HcqWSUW42P0sXgQBmuSS/6cdNmD
 mt4g==
X-Gm-Message-State: APjAAAWVKQDCrpU+Gsi7Ok4ntQeEi+K5agPWq004nWYRIrv8sh+s7Rrn
 FGl5hBJJ/QClY46RutmIhj23AZadBv87RWoykGY=
X-Google-Smtp-Source: APXvYqyhtlh82WQGagO1bRcCM/dLIeiAQctP2nJGhzfkC8MIzr+XdBnXHJccmqJiVXESnwReMWNbATj+Uv0bU25kQ0I=
X-Received: by 2002:a2e:6f19:: with SMTP id k25mr14278961ljc.84.1579009894497; 
 Tue, 14 Jan 2020 05:51:34 -0800 (PST)
MIME-Version: 1.0
References: <339bee59-b89b-b3fc-fb7d-114e8ffe1716@suse.com>
 <e06491b8-58cc-46b1-3f79-d06d6765d089@suse.com>
 <aa06aa23-d108-671e-74cc-5fd50c848792@citrix.com>
 <CAKf6xpuHqJiMjkkx=bttN4LWBbtOdcu_=SPoqaC+3kg=osAC4g@mail.gmail.com>
 <caa5e3c5-a315-53ba-13de-b355beb6ab2d@suse.com>
In-Reply-To: <caa5e3c5-a315-53ba-13de-b355beb6ab2d@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 Jan 2020 08:51:23 -0500
Message-ID: <CAKf6xps-G9q6CNDxEN0-MsSWa-xJsW60yMCNGgsq92-zWF=HdQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86/HVM: use single (atomic) MOV for
 aligned emulated writes
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgNDoyOCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTMuMDEuMjAyMCAyMDo0MCwgSmFzb24gQW5kcnl1ayB3cm90
ZToKPiA+IE9uIEZyaSwgRGVjIDI3LCAyMDE5IGF0IDExOjA5IEFNIEFuZHJldyBDb29wZXIKPiA+
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIwLzEyLzIw
MTkgMTY6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+PiBPbiAxNi4wOS4yMDE5IDExOjQwLCBK
YW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+IFVzaW5nIG1lbWNweSgpIG1heSByZXN1bHQgaW4gbXVs
dGlwbGUgaW5kaXZpZHVhbCBieXRlIGFjY2Vzc2VzCj4gPj4+PiAoZGVwZW5kZW5pbmcgaG93IG1l
bWNweSgpIGlzIGltcGxlbWVudGVkIGFuZCBob3cgdGhlIHJlc3VsdGluZyBpbnNucywKPiA+Pj4+
IGUuZy4gUkVQIE1PVlNCLCBnZXQgY2FycmllZCBvdXQgaW4gaGFyZHdhcmUpLCB3aGljaCBpc24n
dCB3aGF0IHdlCj4gPj4+PiB3YW50L25lZWQgZm9yIGNhcnJ5aW5nIG91dCBndWVzdCBpbnNucyBh
cyBjb3JyZWN0bHkgYXMgcG9zc2libGUuIEZhbGwKPiA+Pj4+IGJhY2sgdG8gbWVtY3B5KCkgb25s
eSBmb3IgYWNjZXNzZXMgbm90IDIsIDQsIG9yIDggYnl0ZXMgaW4gc2l6ZS4KPiA+Pj4+Cj4gPj4+
PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Pj4KPiA+PiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPiA+Cj4gPiBTaG91bGQgeGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYzpodm1fZW11bGF0
ZV93cml0ZSgpIGJlIHNpbWlsYXJseSBjaGFuZ2VkPwo+Cj4gUHJvYmFibHkuIENhcmUgdG8gbWFr
ZSBhIHBhdGNoPwoKU3VyZSA6KQoKLUphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
