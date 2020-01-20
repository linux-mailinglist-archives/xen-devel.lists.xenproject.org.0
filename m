Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CB814328C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 20:44:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itcvK-0007I2-BA; Mon, 20 Jan 2020 19:41:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aT4h=3J=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1itcvI-0007Hx-I4
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 19:41:20 +0000
X-Inumbo-ID: d4678d02-3bbc-11ea-aecd-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4678d02-3bbc-11ea-aecd-bc764e2007e4;
 Mon, 20 Jan 2020 19:41:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m26so268657ljc.13
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 11:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q58ZiJWjRTXKGlYh8pvKRG7BeTshEDNJFoo0xtgQ+g8=;
 b=S+Yd0qa9TWrUjrp2mCoF0yb6EHaEM9j6PeQKwK55b5at+dc2B60KvGi2yB8Q/cYlnc
 aP6CUt38V4lmLgeKEG+A0iTf70DnC8+B+p7Vruu5sum6PJhlCrxEqEg00ED7QgD7qEC4
 abLdSTgMFPfr//zzZuzPlTtD4lHV9k0qEwatIssG/6jlpkJGT4zkeW8QhX4JTXKm4SGj
 A3xXmlg+D1bHEau/KN4uXnJsaMXuD8fv/1LSun18fd3rHs7RWvhffSKIl6SnlpV9xWGk
 J+KSpgqROti/q/55fAT5zDxIgQAvislX/jWFUpwV+EzHZgTovYVuQT35aIIdOfN3gaxk
 YApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q58ZiJWjRTXKGlYh8pvKRG7BeTshEDNJFoo0xtgQ+g8=;
 b=TUsWoQcH0i7Fg8xaXzb4z5LLEngmTucmMbVIgBGTENYPWpyc5XqKHYrf1G6AN6kKl+
 EHIwsOrJpMfjNHa3qZYo3N8svaxKZF97eotcNZP8ZR8NYrgfaQgOcau/VdPDDN+Pdw6C
 g6/ZAc8zbov1tECLVNSCPsVk/xtrdiTHHjyU9vsy7kzJkSO1spo5e2hHrC0Yq0eY+U9n
 4iXNSUbPALOTEISnM1nJ3M9dUmcLM4qccQQPGOBxSlGRpoq7qD77Enc+GNYMbBCW9l8I
 TGu4oO60AZvGsvj8sZMW5Ur+HndAy9WcX/3sYJB18XP0576F1g83JH+58A3mPPJRQrNp
 wJlA==
X-Gm-Message-State: APjAAAWKcZynk/ud3ldLAI/XVneX/22crua3tSQd62wR9jxaB79tdn2z
 RoyWj73SbQNA/xEllY+8lmritx6Emz9SxuwaORk=
X-Google-Smtp-Source: APXvYqwktcmaV3U8pPyGWujSsQkccuZn9wQDmXK6MPq+f6WGHpUxWHq79kLETB8BAE8U082tVRLqV9CXYLY44awC91g=
X-Received: by 2002:a2e:6f19:: with SMTP id k25mr14471013ljc.84.1579549278750; 
 Mon, 20 Jan 2020 11:41:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <25fe2a1f9840ac0e6ca962b218013da0d1a46982.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <25fe2a1f9840ac0e6ca962b218013da0d1a46982.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Jan 2020 14:41:07 -0500
Message-ID: <CAKf6xpvf3syzz2ck1fWbmK_1xrL8LD3=bqO9SWeb6L44hhueJg@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 07/16] xl: add stubdomain related options
 to xl config parser
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MCBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gU2lnbmVkLW9m
Zi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGlu
Z3NsYWIuY29tPgo+IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5j
b20+Cj4gLS0tCj4gIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiB8IDIzICsrKysrKysrKysrKysr
KysrKystLS0tCj4gIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICB8ICA3ICsrKysrKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiBiL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5p
bgo+IGluZGV4IDI0NWQzZjkuLjZhZTBiZDAgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9tYW4veGwuY2Zn
LjUucG9kLmluCj4gKysrIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluCj4gQEAgLTI3MjAsMTAg
KzI3MjAsMjUgQEAgbW9kZWwgd2hpY2ggdGhleSB3ZXJlIGluc3RhbGxlZCB3aXRoLgo+Cj4gID1p
dGVtIEI8ZGV2aWNlX21vZGVsX292ZXJyaWRlPSJQQVRIIj4KPgo+IC1PdmVycmlkZSB0aGUgcGF0
aCB0byB0aGUgYmluYXJ5IHRvIGJlIHVzZWQgYXMgdGhlIGRldmljZS1tb2RlbC4gVGhlCj4gLWJp
bmFyeSBwcm92aWRlZCBoZXJlIE1VU1QgYmUgY29uc2lzdGVudCB3aXRoIHRoZQo+IC1CPGRldmlj
ZV9tb2RlbF92ZXJzaW9uPiB3aGljaCB5b3UgaGF2ZSBzcGVjaWZpZWQuIFlvdSBzaG91bGQgbm90
Cj4gLW5vcm1hbGx5IG5lZWQgdG8gc3BlY2lmeSB0aGlzIG9wdGlvbi4KPiArT3ZlcnJpZGUgdGhl
IHBhdGggdG8gdGhlIGJpbmFyeSB0byBiZSB1c2VkIGFzIHRoZSBkZXZpY2UtbW9kZWwgcnVubmlu
ZyBpbgo+ICt0b29sc3RhY2sgZG9tYWluLiBUaGUgYmluYXJ5IHByb3ZpZGVkIGhlcmUgTVVTVCBi
ZSBjb25zaXN0ZW50IHdpdGggdGhlCj4gK0I8ZGV2aWNlX21vZGVsX3ZlcnNpb24+IHdoaWNoIHlv
dSBoYXZlIHNwZWNpZmllZC4gWW91IHNob3VsZCBub3Qgbm9ybWFsbHkgbmVlZAo+ICt0byBzcGVj
aWZ5IHRoaXMgb3B0aW9uLgo+ICsKPiArPWl0ZW0gQjxzdHViZG9tYWluX2tlcm5lbD0iUEFUSCI+
Cj4gKwo+ICtPdmVycmlkZSB0aGUgcGF0aCB0byB0aGUga2VybmVsIGltYWdlIHVzZWQgYXMgZGV2
aWNlLW1vZGVsIHN0dWJkb21haW4uCj4gK1RoZSBiaW5hcnkgcHJvdmlkZWQgaGVyZSBNVVNUIGJl
IGNvbnNpc3RlbnQgd2l0aCB0aGUKPiArQjxkZXZpY2VfbW9kZWxfdmVyc2lvbj4gd2hpY2ggeW91
IGhhdmUgc3BlY2lmaWVkLgo+ICtJbiBjYXNlIG9mIEI8cWVtdS14ZW4tdHJhZGl0aW9uYWw+IGl0
IGlzIGV4cGVjdGVkIHRvIGJlIE1pbmlPUy1iYXNlZCBzdHViZG9tYWluCj4gK2ltYWdlLCBpbiBj
YXNlIG9mIEI8cWVtdS14ZW4+IGl0IGlzIGV4cGVjdGVkIHRvIGJlIExpbnV4LWJhc2VkIHN0dWJk
b21haW4KPiAra2VybmVsLgo+ICsKPiArPWl0ZW0gQjxzdHViZG9tYWluX3JhbWRpc2s9IlBBVEgi
Pgo+ICsKPiArT3ZlcnJpZGUgdGhlIHBhdGggdG8gdGhlIHJhbWRpc2sgaW1hZ2UgdXNlZCBhcyBk
ZXZpY2UtbW9kZWwgc3R1YmRvbWFpbi4KPiArVGhlIGJpbmFyeSBwcm92aWRlZCBoZXJlIGlzIHRv
IGJlIHVzZWQgYnkgYSBrZXJuZWwgcG9pbnRlZCBieSBCPHN0dWJkb21haW5fa2VybmVsPi4KPiAr
SXQgaXMga25vd24gdG8gYmUgdXNlZCBvbmx5IGJ5IExpbnV4LWJhc2VkIHN0dWJkb21haW4ga2Vy
bmVsLgoKQWxzbzoKCis9aXRlbSBCPHN0dWJkb21haW5fbWVtb3J5PU1CWVRFUz4KKworU3RhcnQg
dGhlIHN0dWJkb21haW4gd2l0aCBNQllURVMgbWVnYWJ5dGVzIG9mIFJBTS4KClJlZ2FyZHMsCkph
c29uCgo+ICA9aXRlbSBCPGRldmljZV9tb2RlbF9zdHViZG9tYWluX292ZXJyaWRlPUJPT0xFQU4+
Cj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfcGFyc2UuYyBiL3Rvb2xzL3hsL3hsX3BhcnNl
LmMKPiBpbmRleCBiODgxMTg0Li5mYzVkZDY1IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3hsL3hsX3Bh
cnNlLmMKPiArKysgYi90b29scy94bC94bF9wYXJzZS5jCj4gQEAgLTI1MjUsNiArMjUyNSwxMyBA
QCBza2lwX3VzYmRldjoKPiAgICAgIHhsdV9jZmdfcmVwbGFjZV9zdHJpbmcoY29uZmlnLCAiZGV2
aWNlX21vZGVsX3VzZXIiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYl9pbmZvLT5k
ZXZpY2VfbW9kZWxfdXNlciwgMCk7Cj4KPiArICAgIHhsdV9jZmdfcmVwbGFjZV9zdHJpbmcgKGNv
bmZpZywgInN0dWJkb21haW5fa2VybmVsIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZiX2luZm8tPnN0dWJkb21haW5fa2VybmVsLCAwKTsKPiArICAgIHhsdV9jZmdfcmVwbGFjZV9z
dHJpbmcgKGNvbmZpZywgInN0dWJkb21haW5fcmFtZGlzayIsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmYl9pbmZvLT5zdHViZG9tYWluX3JhbWRpc2ssIDApOwo+ICsgICAgaWYgKCF4
bHVfY2ZnX2dldF9sb25nIChjb25maWcsICJzdHViZG9tYWluX21lbW9yeSIsICZsLCAwKSkKPiAr
ICAgICAgICBiX2luZm8tPnN0dWJkb21haW5fbWVta2IgPSBsICogMTAyNDsKPiArCj4gICNkZWZp
bmUgcGFyc2VfZXh0cmFfYXJncyh0eXBlKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICAgICAgZSA9IHhsdV9jZmdfZ2V0X2xpc3RfYXNfc3RyaW5nX2xpc3Qo
Y29uZmlnLCAiZGV2aWNlX21vZGVsX2FyZ3MiI3R5cGUsIFwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJmJfaW5mby0+ZXh0cmEjI3R5cGUsIDApOyAgICAgICAgICAgIFwK
PiAtLQo+IGdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
