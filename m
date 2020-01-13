Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F29138D5B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 10:00:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqvXB-0003XA-TE; Mon, 13 Jan 2020 08:57:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3ec7=3C=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iqvXA-0003X5-3U
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 08:57:16 +0000
X-Inumbo-ID: b1d1260c-35e2-11ea-b89f-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1d1260c-35e2-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 08:57:15 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x185so4561074pfc.5
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 00:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IEIZnTuW8clF6RD08mgp42pBTUtM58PRkfUOgRWL1zo=;
 b=MAwoyYFkYHarEBVWbgItJtmHobiSNg2kU3HDC8JaQkwa72f7q5OTKh3xuBfGFjXaOY
 gljLSbgWqSUAWoeeusiBcp3OKcZKo/DztS4IAXmW/RCCl4zjvymU9quzuXQHadS6rehm
 pnkysXv6jzdj3qlv1N4cJE2VTUusHarSUFp6bdlbg7DB+vuj37AM9bBG5JliI0yh0t3L
 aFxj9qTMAR6UTfKESWpXF4p+ErMpXNg6uDDAp0d4o9wYHfPrqzuwxez3rXDd62FOyuVp
 XBU51pvBiNXgYtV7Lksh28ibaiXGQNC6pLAVP9kJGdQhLQmwXBwhCiQ6SNZZNWsNMXDG
 bp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IEIZnTuW8clF6RD08mgp42pBTUtM58PRkfUOgRWL1zo=;
 b=FzeB+fBzYAREy3rH94kc3F0YlfgPvnXJ1LNvfm6HME5SMEThSswBtv8FF1jnRnGGhZ
 gZ6KjrqN7jGyaGlx6Xu5R57XKP7Wo8OzqSkvVgtkVVI+6xCu6uJUDZAnff4NNuQtZceh
 +TlMid0cQrPCgorc23hkM/Y2HgAMwa9RbNQNPkKaTZE31uXuf/Zk99dXyXn4qPQ9Fvfz
 eRGMYTR1zyc+68Q90l5K+ajsxpNnh+TKM0gowyosy4Ktcp8CgnyeBj6c/+AdKFJSbquE
 +8UanG0vIwph2UuqZtok0w8loATgFpLj7ZsyFszXukKg0J7M7JxSoX7Y3AnVSVLhinTU
 Sgqg==
X-Gm-Message-State: APjAAAWiUXHWcWli+QHX6RnC0xSn37HIVgyZWWoAw0V4OWs/d78xW4vo
 GtAv+6+p+t83JlVsadarx2xuLE7/OpFJ3AktbiQ=
X-Google-Smtp-Source: APXvYqycorsm/yA2OqspdZCTdPrvz2wmqVS8037juslfs38oUSoLXQdSzBJX38dVrQY8BTs7z62X6zDN4wnntI85UDA=
X-Received: by 2002:a63:220b:: with SMTP id i11mr19393702pgi.50.1578905834622; 
 Mon, 13 Jan 2020 00:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <20200110194158.14190-12-vsementsov@virtuozzo.com>
In-Reply-To: <20200110194158.14190-12-vsementsov@virtuozzo.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 13 Jan 2020 08:57:03 +0000
Message-ID: <CACCGGhA78D7TVQdj-wrr=hWmFN+kefS_7zLm4UHBkx0ZHh8maA@mail.gmail.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [Xen-devel] [PATCH v6 11/11] xen: introduce ERRP_AUTO_PROPAGATE
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMCBKYW4gMjAyMCBhdCAxOTo0MiwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tp
eQo8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cm90ZToKPgo+IElmIHdlIHdhbnQgdG8gYWRk
IHNvbWUgaW5mbyB0byBlcnJwIChieSBlcnJvcl9wcmVwZW5kKCkgb3IKPiBlcnJvcl9hcHBlbmRf
aGludCgpKSwgd2UgbXVzdCB1c2UgdGhlIEVSUlBfQVVUT19QUk9QQUdBVEUgbWFjcm8uCj4gT3Ro
ZXJ3aXNlLCB0aGlzIGluZm8gd2lsbCBub3QgYmUgYWRkZWQgd2hlbiBlcnJwID09ICZlcnJvcl9m
YXRhbAo+ICh0aGUgcHJvZ3JhbSB3aWxsIGV4aXQgcHJpb3IgdG8gdGhlIGVycm9yX2FwcGVuZF9o
aW50KCkgb3IKPiBlcnJvcl9wcmVwZW5kKCkgY2FsbCkuICBGaXggc3VjaCBjYXNlcy4KPgo+IElm
IHdlIHdhbnQgdG8gY2hlY2sgZXJyb3IgYWZ0ZXIgZXJycC1mdW5jdGlvbiBjYWxsLCB3ZSBuZWVk
IHRvCj4gaW50cm9kdWNlIGxvY2FsX2VyciBhbmQgdGhlbiBwcm9wYWdhdGUgaXQgdG8gZXJycC4g
SW5zdGVhZCwgdXNlCj4gRVJSUF9BVVRPX1BST1BBR0FURSBtYWNybywgYmVuZWZpdHMgYXJlOgo+
IDEuIE5vIG5lZWQgb2YgZXhwbGljaXQgZXJyb3JfcHJvcGFnYXRlIGNhbGwKPiAyLiBObyBuZWVk
IG9mIGV4cGxpY2l0IGxvY2FsX2VyciB2YXJpYWJsZTogdXNlIGVycnAgZGlyZWN0bHkKPiAzLiBF
UlJQX0FVVE9fUFJPUEFHQVRFIGxlYXZlcyBlcnJwIGFzIGlzIGlmIGl0J3Mgbm90IE5VTEwgb3IK
PiAgICAmZXJyb3JfZmF0YWwsIHRoaXMgbWVhbnMgdGhhdCB3ZSBkb24ndCBicmVhayBlcnJvcl9h
Ym9ydAo+ICAgICh3ZSdsbCBhYm9ydCBvbiBlcnJvcl9zZXQsIG5vdCBvbiBlcnJvcl9wcm9wYWdh
dGUpCj4KPiBUaGlzIGNvbW1pdCBpcyBnZW5lcmF0ZWQgYnkgY29tbWFuZAo+Cj4gICAgIHNlZCAt
biAnL15YODYgWGVuIENQVXMkLywvXiQve3MvXkY6IC8vcH0nIE1BSU5UQUlORVJTIHwgXAo+ICAg
ICB4YXJncyBnaXQgbHMtZmlsZXMgfCBncmVwICdcLltoY10kJyB8IFwKPiAgICAgeGFyZ3Mgc3Bh
dGNoIFwKPiAgICAgICAgIC0tc3AtZmlsZSBzY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdh
dGVkLWVycnAuY29jY2kgXAo+ICAgICAgICAgLS1tYWNyby1maWxlIHNjcmlwdHMvY29jY2ktbWFj
cm8tZmlsZS5oIFwKPiAgICAgICAgIC0taW4tcGxhY2UgLS1uby1zaG93LWRpZmYgLS1tYXgtd2lk
dGggODAKPgo+IFJlcG9ydGVkLWJ5OiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgo+IFJl
cG9ydGVkLWJ5OiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFZs
YWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4KCkFj
a2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
