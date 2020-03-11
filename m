Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738AD181798
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 13:18:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC0HK-0004tQ-W3; Wed, 11 Mar 2020 12:16:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p6g3=44=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jC0HJ-0004tK-HZ
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 12:16:01 +0000
X-Inumbo-ID: 11d3350e-6392-11ea-a6c1-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11d3350e-6392-11ea-a6c1-bc764e2007e4;
 Wed, 11 Mar 2020 12:16:01 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x22so1498708lff.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2020 05:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YDZxVRFdFwfg+EonkKBJ8bWQZOYUlQtWHlwiXopOqug=;
 b=DOW9j3/jR1F41ttKNmVYtpOLJcNPnFcm7F66m6ITllNbwJVr8gGzCgJ9ZHbL1731jP
 gPaEnDVRhslyCEgzbwBATxb1TgP+LPZTTiL9fDQY+D40bF4ukPMMgREuDfo5VdUjXNUF
 vosF787fXqYdcxophddfiK5xy1SnkRtXgr9X4Ba57XeRpW6xQPXpUaMQKw5s6jg+iV5y
 n+KQoLxnKcUW6gZbmxTN6G/gTpRG/jQ0Yy/tro/hSq9jJv2eA9fIMgt1bobJzcVHR+DK
 lmIlCRXdUP0pCPHczEl3o8lLlG0vigAz0ZeSv+SdZPc+Ustxvy0HjXWsNlhsT07qgPF1
 vJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YDZxVRFdFwfg+EonkKBJ8bWQZOYUlQtWHlwiXopOqug=;
 b=Se1sdO2DSqI4fmUCsrqRATIoStHiGhoe4XwNf+flPJ3CmRi6HBJ7sFz6IzRlgR6+aK
 3MkzJciZ2i0Px9CqTVnXqrWXbLMCeZ2z0XW5AW2qn4txTohoe5ulrSjn0yfIWax7pkGn
 GG0ZWLuymJgDIh2cNrErcRbdWZwRHTglaZYgVfUqxpykV1rpnSaEPOrvrs322nBT/IpB
 edEFhA1A89rCPIEuCAJwYKkL/Pl+y47MduJhNybz4ui5uDaBIC+/B5lxYrq/x6S434Nx
 uwKEzdRqsJaWKuXD42aW0Zh9spxcsYOgD9yLkmzSE7mxzhLVDrwfBRpn1Pgc+aA12Lcw
 AfDQ==
X-Gm-Message-State: ANhLgQ0bobrK7RZBi99Pk9KGDlTULIMSDs1ZAMhvNSnoeX5x1OgkrAaS
 GYLpg54pIOdORwTkiOeNAUabzs7VIf5fNXlaAzI=
X-Google-Smtp-Source: ADFU+vt5MM8JnBOOks/Fs/Ge8m7kn6/FLru941HBYmN1yHNeG3m/9o/MZoN1xTH8Lp8j1HEDofjGBGHuYiup3PjP648=
X-Received: by 2002:a19:6d0d:: with SMTP id i13mr1990714lfc.105.1583928959894; 
 Wed, 11 Mar 2020 05:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200310132904.16992-1-jandryuk@gmail.com>
 <24167.46462.266537.781520@mariner.uk.xensource.com>
 <CAKf6xpseFVzvfZhm=0GqLkGyPe4vqtMpAKA5JgzLzAafxTqb3w@mail.gmail.com>
In-Reply-To: <CAKf6xpseFVzvfZhm=0GqLkGyPe4vqtMpAKA5JgzLzAafxTqb3w@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 11 Mar 2020 08:15:48 -0400
Message-ID: <CAKf6xpvrXdzzeyYYQrrxNcZnV27SLvubDiZ-Fu5+yGkKz5SSkw@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH] scripts: Use stat to check lock claim
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgNDowNiBQTSBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMTE6NDMgQU0gSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gQWx0ZXJuYXRpdmVs
eSwgaWYgeW91IGRvbid0IG1pbmQgdXNpbmcgLS1wcmludGYgaW5zdGVhZCBvZiAtYywKPiA+Cj4g
PiAkIGJhc2ggLWMgJ3g9JCggc3RhdCAtTCAtLWZvcm1hdCAiJUQuJWkgIiB0IHUgMj4vZGV2L251
bGwgfHwgOiApOyBlY2hvICR7eCUlICp9ID0gJHt4IyogfScKPiA+IGZlMDQuODQ0MzA3ID0gZmUw
NC44MjY0MTcKPiA+ICQKPiA+Cj4gPiBJIGRvbid0IGtub3cgd2hlbiAtLWZvcm1hdCB3YXMgaW50
cm9kdWNlZC4KPgo+IExvb2tzIGxpa2UgLS1wcmludGYgd2FzIGludHJvZHVjZWQgaW4gMjAwNS4g
IEkgdGhpbmsgSSBwcmVmZXIgdGhpcyB0bwo+IGhhdmluZyB0aGUgbmV3bGluZXMuICBZb3Ugc3Rp
bGwgaGF2ZSBzb21lIG9mIHRoZSBzdHJpbmcgc3Vic3RpdHV0aW9uCj4gY29uY2VybnMsIGJ1dCBJ
IHRoaW5rIHRoaW5rIHJlbHlpbmcgb24gYSBzdWNjZXNzZnVsIHN0YXQoMSkgY2FsbCB0bwo+IGdp
dmUgdHdvIG91dHB1dCB2YWx1ZXMgaXMgcmVhc29uYWJsZS4KCmJ1c3lib3ggc3RhdCBkb2VzIG5v
dCBzdXBwb3J0IC0tcHJpbnRmLiAgVGhpcyBpcyBub3QgYW4gaW1tZWRpYXRlCmNvbmNlcm4gZm9y
IG1lLCBidXQgaXQncyBzb21ldGhpbmcgSSB0aG91Z2h0IG9mIGFuZCBqdXN0IHRlc3RlZC4gIFRo
ZQpuZXdsaW5lIGFwcHJvYWNoIGF2b2lkcyB0aGlzIGNvbXBsaWNhdGlvbi4KCj4gPiBJJ20gc29y
cnkgdG8gYm91bmNlIHRoZSBwYXRjaCBvdmVyIHN1Y2ggYSBzbWFsbCB0aGluZywgYnV0IHRoaXMg
aXMKPiA+IHBhdGggaXMgYWxyZWFkeSBxdWl0ZSBzbG93IGFuZCBpcyBjcml0aWNhbCBmb3IgZG9t
YWluIGNyZWF0aW9uIGFuZCBJCj4gPiB3b3VsZCBwcmVmZXIgbm90IHRvIGFkZCAodHdvKSBhZGRp
dGlvbmFsIHN1YnByb2Nlc3MgaW52b2NhdGlvbnMgaGVyZS4KPgo+IE5vIHdvcnJpZXMuCgpUaGUg
YWJvdmUgZ3lyYXRpb25zIGNhbiBiZSBhdm9pZGVkIGlmIHdlIGp1c3QgY2FsbCBzdGF0IHR3aWNl
IC0gb25jZQpmb3IgdGhlIGZkIGFuZCBvbmNlIGZvciB0aGUgZmlsZS4gIFRoZXkgYXJlbid0IHJl
cXVpcmVkIHRvIGJlIGluIGEKc2luZ2xlIGNhbGwuICBCdXQgbW92aW5nIGZvcndhcmQgd2l0aCBh
IHNpbmdsZSBjYWxsLCB3ZSBoYXZlIGEgZmV3Cm9wdGlvbnM6CgpXZSBjb3VsZCB1c2UgYW4gYXJy
YXkgdG8gc2lkZS1zdGVwIHRoZSBsaW5lIHNwbGl0dGluZzoKCmlmIHN0YXQ9JCggc3RhdCAtTCAt
YyAnJUQuJWknIC0gJF9sb2NrZmlsZSAwPCYkX2xvY2tmZCAyPi9kZXYvbnVsbCApCnRoZW4KICAg
ICAgICBzdGF0PSgke3N0YXR9KQogICAgICAgIGZkX3N0YXQ9JHtzdGF0WzBdfQogICAgICAgIGZp
bGVfc3RhdD0ke3N0YXRbMV19CiAgICAgICAgWyAiJGZkX3N0YXQiID0gIiRmaWxlX3N0YXQiIF0K
CkFub3RoZXIgb3B0aW9uIGlzIHRvIHVzZSB0aGUgYmFzaGlzbSAkJ1xuJyBpbnN0ZWFkIG9mIHRo
ZSBsaXRlcmFsIG5ld2xpbmVzOgoKaWYgc3RhdD0kKCBzdGF0IC1MIC1jICclRC4laScgLSAkX2xv
Y2tmaWxlIDA8JiRfbG9ja2ZkIDI+L2Rldi9udWxsICkKdGhlbgogICAgICAgIGZkX3N0YXQ9JHtz
dGF0JSQnXG4nKn0KICAgICAgICBmaWxlX3N0YXQ9JHtzdGF0IyokJ1xuJ30KCk9yIGp1c3QgdXNl
IHlvdXIgbmV3bGluZSBjb25zdHJ1Y3QuICBXaGljaCBkbyB5b3UgcHJlZmVyPwoKUmVnYXJkcywK
SmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
