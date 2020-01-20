Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786761431DD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 19:59:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itcET-00035I-Av; Mon, 20 Jan 2020 18:57:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aT4h=3J=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1itcES-00035D-DV
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 18:57:04 +0000
X-Inumbo-ID: a551c312-3bb6-11ea-9fd7-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a551c312-3bb6-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 18:57:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v201so68776lfa.11
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 10:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zVfYvJXBnuqDrW8CXoruy7M4zYIPTMQRF20r3/azPJI=;
 b=HVxRWyuBO43siNC03V+cl7I1o6BqGF+U14AKZYsYJjs4ZLXf/WBYTh3ng3Q8yAMWD1
 y8CUNizltXakOA+5s0ocHs0Wtk5OcznNF7zv/KICIjYhatDKEfrZUwilGMpu3S11QfIM
 i2A89rda4jf6f+J36mjIMiIOxxSdNi8LIAHB4PYWOFbWntQ8P9GiqI85Q/MzzG5cQmSY
 WOmHi2P3inGxcy/A1AtVIQxFyL17Tq84O8rAgxauYL3OW+PY13Bvyi0nWA0WoeYeu17m
 Vc4eOP1VHpyKlhvgCOMVl16RFr6KyaW1fEwb6xtyJm5yr122IDWxSEZasirx3/zSNbgo
 R0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zVfYvJXBnuqDrW8CXoruy7M4zYIPTMQRF20r3/azPJI=;
 b=GSwqZofosqXEqh2L9wUlKB11xyatfHI+8KgbDYA/oUwzIVNd7//NyWoKzArFzi4Mtc
 awbNgGuctt11Gwuz4K5rpFSnboTpM+08NsN3PyIvdQK/Sw7HcDGrmpaFkeN5Epr5UxBw
 pWavvfCI5p9nzAf0WwMrIvOvu2+PM/ifdWm5iUm8FpfD+xAvEyVBXyk1BI/v7/0ky0um
 i0k4mw4RBcrSQUERrDWLaRKVyy7Jqfs1ids9ZXq2RvfaWFsks1Yyz1cC6sttfSfohzd/
 KcO/2ez9+DdxDItrbMm47CdDIJTMDUQ7J1X8RJQYxd8oyP0SMZbq2CRwAPOaVcNWOotf
 X8gw==
X-Gm-Message-State: APjAAAWbWCa15Hrp/EIUnkV/cFW3u901G3TC/15UaexFtJW7RlXw27QA
 zY3qG/3SftQywcNTepBlgY/LSYkDTmoOjELo+KE=
X-Google-Smtp-Source: APXvYqwyYQSiPPMPunPThnE0b1nIQn46BUi1qNHMnyOiD90aZ0VNrPaS/s2w8Cv9C6Dn/XI2g78GkXvBrpJ2IZK0Nls=
X-Received: by 2002:a19:ac43:: with SMTP id r3mr425463lfc.156.1579546622847;
 Mon, 20 Jan 2020 10:57:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <ef0bef56e682bff2aaa04250212bc2c3fd9ed8ce.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <ef0bef56e682bff2aaa04250212bc2c3fd9ed8ce.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Jan 2020 13:56:51 -0500
Message-ID: <CAKf6xptNPBe3ZT3Q9S7g63cxtQKhMaBTODHGz+TBNfKCDmgLEA@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 04/16] libxl: Allow running qemu-xen in
 stubdomain
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MSBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gRG8gbm90IHBy
b2hpYml0IGFueW1vcmUgdXNpbmcgc3R1YmRvbWFpbiB3aXRoIHFlbXUteGVuLgo+IFRvIGhlbHAg
ZGlzdGluZ3VzaGluZyBNaW5pT1MgYW5kIExpbnV4IHN0dWJkb21haW4sIGFkZCBoZWxwZXIgaW5s
aW5lCj4gZnVuY3Rpb25zIGxpYnhsX19zdHViZG9tYWluX2lzX2xpbnV4KCkgYW5kCj4gbGlieGxf
X3N0dWJkb21haW5faXNfbGludXhfcnVubmluZygpLiBUaG9zZSBzaG91bGQgYmUgdXNlZCB3aGVy
ZSByZWFsbHkKPiB0aGUgZGlmZmVyZW5jZSBpcyBhYm91dCBNaW5pT1MvTGludXgsIG5vdCBxZW11
LXhlbi9xZW11LXhlbi10cmFkaXRpb25hbC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPgo+IC0t
LQo+IENoYW5nZXMgaW4gdjM6Cj4gIC0gbmV3IHBhdGNoLCBpbnN0ZWFkIG9mICJsaWJ4bDogQWRk
ICJzdHViZG9tYWluX3ZlcnNpb24iIHRvCj4gIGRvbWFpbl9idWlsZF9pbmZvIgo+ICAtIGhlbHBl
ciBmdW5jdGlvbnMgYXMgc3VnZ2VzdGVkIGJ5IElhbiBKYWNrc29uCj4gLS0tCgo8c25pcD4KCj4g
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmgKPiBAQCAtMjI5OSw2ICsyMjk5LDIzIEBAIF9oaWRkZW4gaW50IGxpYnhs
X19kZXZpY2VfbW9kZWxfdmVyc2lvbl9ydW5uaW5nKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRv
bWlkKTsKPiAgICAvKiBSZXR1cm4gdGhlIHN5c3RlbS13aWRlIGRlZmF1bHQgZGV2aWNlIG1vZGVs
ICovCj4gIF9oaWRkZW4gbGlieGxfZGV2aWNlX21vZGVsX3ZlcnNpb24gbGlieGxfX2RlZmF1bHRf
ZGV2aWNlX21vZGVsKGxpYnhsX19nYyAqZ2MpOwo+Cj4gK3N0YXRpYyBpbmxpbmUKPiArYm9vbCBs
aWJ4bF9fc3R1YmRvbWFpbl9pc19saW51eF9ydW5uaW5nKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90
IGRvbWlkKQoKVGhpcyBpcyB1bnVzZWQgaW4gdGhlIHNlcmllcywgYXMgZmFyIGFzIEkgY2FuIHRl
bGwuCgpSZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
