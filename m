Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E77417A80F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 15:49:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9rm7-00032e-8I; Thu, 05 Mar 2020 14:46:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OR8N=4W=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1j9rm5-00032X-R8
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 14:46:57 +0000
X-Inumbo-ID: 293c5348-5ef0-11ea-90c4-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 293c5348-5ef0-11ea-90c4-bc764e2007e4;
 Thu, 05 Mar 2020 14:46:57 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h18so6344190ljl.13
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2020 06:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zuxGR8Ok34lerZp5LxNs/qyDDFGypyAPtDhjEwPxlik=;
 b=pJsr1A4TFgCYL+AMV/lPj3dndEPsGlB435X1W7YZl5bN6bBPsEN2ovFMx+AMgePdfC
 VW1SkeTJp+09ojgc1fb3UlNhfWz8FazR2tqEneFBKhHj3aAighvVWEzcQc/WkR05Y5P7
 CARaUGOv7FF4e/tfpJlQBPIlEijIEavSvuRtbmCqVLRz8Q9Z746eKMUTF/Xzw6kpcsgk
 9qZlAWoucTDav/gOXnigmTcJpFXAnYmuu/iEOWe1W1nU0JyltcQ4fhTIUf9ICTARIr3/
 neXL/f6dlUeDynG38PzlAxcg8yJ801NrrYIwJ4emEn3bJljcc+OxZfD5hS/1qZZSEeDQ
 7HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zuxGR8Ok34lerZp5LxNs/qyDDFGypyAPtDhjEwPxlik=;
 b=YPqr1C1P06keUquUP0nZanvLCEojMMTwmYArIawot5w2C8oRdYTYQ2PkMdV7CMACeD
 3ZeZLs/8joeYUJGsIEQdGGO9+F07pZBY45r6I8G5uHzD5Tb90n1+NDlSewaDo8YyAVuF
 XvoqlOU4mgGiuNYUCYBqa3OF6qcKiiqEavhecZYqjNwPB+GNgh8JUBVb9XN9TOetLgLL
 z+RH3f6EcM+TTqAPfdOkNUbq6zKEu+repvHJsq/CQLoYpnlplUAhwYPJmv3NyVarTjoh
 EgpxzdnDvon/zdAlRvFMvG4VvlsL+yApbgi4W7dBxsYZWmra+/igIcNJJD9EbCdzeq4v
 dLcg==
X-Gm-Message-State: ANhLgQ3XxaI47p24ShNcSCfoaSPYf4ycsV3zaMoJibCAxEweBFGYSDFO
 v9pXWaRJJaqLyC++EM9N3CQkw0ZZV54uesOJF7Y=
X-Google-Smtp-Source: ADFU+vsTZTDJSZnRnByxobK5bclb7f7xSQTcGS82X2Xjc337zvg3cUGZJO+vmpmfQZlAQUAarAXiilv7rX9kV2bBpyU=
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr5709467ljj.26.1583419615957; 
 Thu, 05 Mar 2020 06:46:55 -0800 (PST)
MIME-Version: 1.0
References: <d9916032f6214e57caaac1d7a4b8afcf1723ad08.1583179824.git.rosbrookn@ainfosec.com>
 <71388529-cfd8-cf6f-72f2-111e4e4f777c@citrix.com>
 <4cede606-c985-137e-2648-6ee550bf79da@citrix.com>
In-Reply-To: <4cede606-c985-137e-2648-6ee550bf79da@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 5 Mar 2020 09:46:44 -0500
Message-ID: <CAEBZRSen508M_afL6Axic-EhFbBZNXOqBrJWy1Y+LSCh=PtA-Q@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2] golang/xenlight: implement constructor
 generation
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBOZXdEb21haW5Db25maWcoKSBhcyBvZiB0aGlzIHBhdGNoIGNhbiBuZXZlciByZXR1cm4gc3Vj
Y2VzcywgYmVjYXVzZQo+IERvbWFpbkNvbmZpZy5mcm9tQygpIHdpbGwgY2FsbCBEb21haW5CdWls
ZEluZm8uZnJvbUMoKSwgd2hpY2ggd2lsbCBjaG9rZQo+IG9uIGJfaW5mby50eXBlID0gTElCWExf
RE9NQUlOX1RZUEVfSU5WQUxJRC4KPgo+IFRoaXMgaXMgYWN0dWFsbHkgYSBidWcgaW4gdG8vZnJv
bUMuICBDb25zaWRlciBsaWJ4bF9jaGFubmVsaW5mby4KPgo+IFRoZSBpZGwgc2F5czoKPgo+IGxp
YnhsX2NoYW5uZWxpbmZvID0gU3RydWN0KCJjaGFubmVsaW5mbyIsIFsKPiAgICAgKCJiYWNrZW5k
Iiwgc3RyaW5nKSwKPiAgICAgKCJiYWNrZW5kX2lkIiwgdWludDMyKSwKPiAgICAgKCJmcm9udGVu
ZCIsIHN0cmluZyksCj4gICAgICgiZnJvbnRlbmRfaWQiLCB1aW50MzIpLAo+ICAgICAoImRldmlk
IiwgbGlieGxfZGV2aWQpLAo+ICAgICAoInN0YXRlIiwgaW50ZWdlciksCj4gICAgICgiZXZ0Y2gi
LCBpbnRlZ2VyKSwKPiAgICAgKCJycmVmIiwgaW50ZWdlciksCj4gICAgICgidSIsIEtleWVkVW5p
b24oTm9uZSwgbGlieGxfY2hhbm5lbF9jb25uZWN0aW9uLCAiY29ubmVjdGlvbiIsCj4gICAgICAg
ICAgICBbKCJ1bmtub3duIiwgTm9uZSksCj4gICAgICAgICAgICAgKCJwdHkiLCBTdHJ1Y3QoTm9u
ZSwgWygicGF0aCIsIHN0cmluZyksXSkpLAo+ICAgICAgICAgICAgICgic29ja2V0IiwgTm9uZSks
Cj4gICAgICAgICAgICBdKSksCj4gICAgIF0sIGRpcj1ESVJfT1VUKQo+Cj4gQnV0IHRoZSBnZW5l
cmF0ZWQgY29kZSBjdXJyZW50bHkgb25seSBnZW5lcmF0ZXM6Cj4KPiB0eXBlIENoYW5uZWxpbmZv
IHN0cnVjdCB7Cj4gICAgICAgICBCYWNrZW5kICAgICAgICAgc3RyaW5nCj4gICAgICAgICBCYWNr
ZW5kSWQgICAgICAgdWludDMyCj4gICAgICAgICBGcm9udGVuZCAgICAgICAgc3RyaW5nCj4gICAg
ICAgICBGcm9udGVuZElkICAgICAgdWludDMyCj4gICAgICAgICBEZXZpZCAgICAgICAgICAgRGV2
aWQKPiAgICAgICAgIFN0YXRlICAgICAgICAgICBpbnRXaGljaCBtZWFucyBpZiBsaWJ4bCBwYXNz
ZXMgYmFjawo+ICAgICAgICAgRXZ0Y2ggICAgICAgICAgIGludAo+ICAgICAgICAgUnJlZiAgICAg
ICAgICAgIGludAo+ICAgICAgICAgQ29ubmVjdGlvbiAgICAgIENoYW5uZWxDb25uZWN0aW9uCj4g
ICAgICAgICBDb25uZWN0aW9uVW5pb24gY2hhbm5lbGluZm9Db25uZWN0aW9uVW5pb24KPiB9Cj4K
PiB0eXBlIGNoYW5uZWxpbmZvQ29ubmVjdGlvblVuaW9uIGludGVyZmFjZSB7Cj4gICAgICAgICBp
c2NoYW5uZWxpbmZvQ29ubmVjdGlvblVuaW9uKCkKPiB9Cj4KPiB0eXBlIENoYW5uZWxpbmZvQ29u
bmVjdGlvblVuaW9uUHR5IHN0cnVjdCB7Cj4gICAgICAgICBQYXRoIHN0cmluZwo+IH0KPgo+IGZ1
bmMgKHggQ2hhbm5lbGluZm9Db25uZWN0aW9uVW5pb25QdHkpIGlzY2hhbm5lbGluZm9Db25uZWN0
aW9uVW5pb24oKSB7fQo+Cj4gSSB0aGluayB0aGlzIG1ha2VzIHNlbnNlIC0tIHRoZXJlJ3Mgbm8g
bmVlZCB0byBoYXZlIHR5cGVzIGZvciAndW5rbm93bicKPiBhbmQgJ3NvY2tldCcganVzdCB0byBo
b2xkIG5vdGhpbmcuICBCdXQgdGhlbiB0aGUgbWFyc2hhbGluZyBjb2RlIGxvb2tzCj4gbGlrZSB0
aGlzOgo+Cj4gICAgICAgICBzd2l0Y2ggeC5Db25uZWN0aW9uIHsKPiAgICAgICAgIGNhc2UgQ2hh
bm5lbENvbm5lY3Rpb25QdHk6Cj4gICAgICAgICAgICAgICAgIHRtcCwgb2sgOj0geC5Db25uZWN0
aW9uVW5pb24uKENoYW5uZWxpbmZvQ29ubmVjdGlvblVuaW9uUHR5KQo+ICAgICAgICAgICAgICAg
ICBpZiAhb2sgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnJvcnMuTmV3KCJ3
cm9uZyB0eXBlIGZvciB1bmlvbiBrZXkgY29ubmVjdGlvbiIpCj4gICAgICAgICAgICAgICAgIH0K
PiAgICAgICAgICAgICAgICAgdmFyIHB0eSBDLmxpYnhsX2NoYW5uZWxpbmZvX2Nvbm5lY3Rpb25f
dW5pb25fcHR5Cj4gICAgICAgICAgICAgICAgIGlmIHRtcC5QYXRoICE9ICIiIHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBwdHkucGF0aCA9IEMuQ1N0cmluZyh0bXAuUGF0aCkKPiAgICAgICAg
ICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICBwdHlCeXRlcyA6PSBDLkdvQnl0ZXModW5zYWZl
LlBvaW50ZXIoJnB0eSksCj4gQy5zaXplb2ZfbGlieGxfY2hhbm5lbGluZm9fY29ubmVjdGlvbl91
bmlvbl9wdHkpCj4gICAgICAgICAgICAgICAgIGNvcHkoeGMudVs6XSwgcHR5Qnl0ZXMpCj4gICAg
ICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICByZXR1cm4gZm10LkVycm9yZigiaW52YWxp
ZCB1bmlvbiBrZXkgJyV2JyIsIHguQ29ubmVjdGlvbikKPiAgICAgICAgIH0KPgo+IFNvIHRoaXMg
d2lsbCBpbmNvcnJlY3RseSBmYWlsIGZvciBmb3IgZWl0aGVyICd1bmtub3duJyBvciAnc29ja2V0
Jy4KPiBXaGF0IHdlIG5lZWQgdG8gaGF2ZSBpcyBmb3IgdG9DIHRvIGlnbm9yZSBlbnVtZXJhdGVk
IHZhbHVlcyB0aGF0IGhhdmUKPiBlbXB0eSB0eXBlcywgYW5kIGZyb21DIHRvIHNldCB0aGUgdW5p
b24gdG8gYG5pbGAgaW4gdGhlc2UgY2FzZXMuCj4KPiBJJ3ZlIGdvdCBhIHBhdGNoIC0tIEknbGwg
c2VuZCBpdCBvdXQuCgpPaCwgeWVhaCBJIHNlZSB0aGUgcHJvYmxlbSBpbiB4ZW5saWdodF9nb2xh
bmdfdW5pb25fZnJvbV9DIC0tIGl0IGp1c3QKY29udGludWVzIGluIHRoZSBsb29wIGlmIGYudHlw
ZSBpcyBOb25lIHRvIGF2b2lkIGRlZmluaW5nIGFub3RoZXIKZnJvbUMsIGJ1dCBzaG91bGQgc3Rp
bGwgc2hvdWxkIGFkZCBhIGNhc2UgaW4gdGhlIHN3aXRjaCBzdGF0ZW1lbnQuCgpHb29kIGNhdGNo
LCB0aGFua3MuCgotTlIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
