Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F7315BE9B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 13:44:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Dog-0004jx-5h; Thu, 13 Feb 2020 12:42:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kGnI=4B=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j2Doe-0004jp-WF
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:42:01 +0000
X-Inumbo-ID: 3a6b9630-4e5e-11ea-ade5-bc764e2007e4
Received: from mail-pj1-x1043.google.com (unknown [2607:f8b0:4864:20::1043])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a6b9630-4e5e-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 12:42:00 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id 12so2374146pjb.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2020 04:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZAREPQnfQkqtDBHcsf4dUhi9JqCnyRbJhKQs20vklzU=;
 b=mjbhG91hXKlLt1iBFr0q/4LqTF+sJm3yzGPFfP7oRlmVinzYNFj7FI6hOcB/szuxjE
 6W5t63eC+FMyxMT0Xn+dki9jbiwDgNco0ivgWdKDQtHJSxQhZkw0jWnf0ZbddDy3YCtm
 zURd3qUAUrUxv9iF3jHLbrhlklKM6CcdO858Ilf5CJRxJs6/25pNfygTt0DlAT6V+f67
 v6LyOtjCxTxzbwnRrKS8WW9/H3ibvwi0IJSMxsL3mA8ow4CdPidFDtpU6Ar/jqbAJ9d6
 PTQB1kIR0k57ICxSoVRH7rp6Hy/MWdeApNif6EG0dIPNgyaQV8BUPjs0g9qbEsLWfHph
 Nn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZAREPQnfQkqtDBHcsf4dUhi9JqCnyRbJhKQs20vklzU=;
 b=CQUM5fohqpQrbltbK4LyQ+WRl97gVrJROryYS1bbwEvUWF0DCm5VOUTyYkAjXIaE8n
 8JcoZ+s32L/Af5ajNKA9c60zK7u/X3X9Z/dxy6EM3coWvpkSueqTVsiljLYltlsd3vEq
 o2meOG8xf310uNRkvV1iICH9+Ri98v6j5Lm8HeK9qzXJLRJFB9nHXa02BeG6haj+JNvU
 oM3NBOlPxB+DDGvZo6MWkwjuRx+u7bLpHNEyt9TaSZMapn6p5VKsnQSWWAh8guznJ5Tz
 FyPLZHjKIz6FUB5TffDNNYAjLjZ0hrJUEdknstZiEKjcwfkSehtDtg5ZjXXNt08IR4eu
 38Fw==
X-Gm-Message-State: APjAAAVP1x5Vb2TbxWOC0m3DppqGIHUCHKRS7Dq5uk7uVh+/2Wxc5kLo
 XZHsntXRS5cFsw7NkmmCY2fWpNqd1FLrCYFXoL4=
X-Google-Smtp-Source: APXvYqzbIB89rQuhbqhXbUShG2DTMjpwKhgXxhN5tu0+FvKO3FMPYXkITIUh+Pc9Y+G74lG7LqnQRh+cO1IBXXEX0tE=
X-Received: by 2002:a17:902:7004:: with SMTP id
 y4mr13457129plk.263.1581597719813; 
 Thu, 13 Feb 2020 04:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20200212134254.11073-1-david@redhat.com>
 <20200212134254.11073-14-david@redhat.com>
In-Reply-To: <20200212134254.11073-14-david@redhat.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Thu, 13 Feb 2020 13:41:48 +0100
Message-ID: <CACCGGhAubw1jgkAvAOiz05qMzE4ATD=PHzAJruUD4a_XJDfC0A@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 fixed 13/16] numa: Teach ram block
 notifiers about resizable ram blocks
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMiBGZWIgMjAyMCBhdCAxNDo0NCwgRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gV2Ugd2FudCB0byBhY3R1YWxseSByZXNpemUgcmFtIGJsb2Nr
cyAobWFrZSBldmVyeXRoaW5nIGJldHdlZW4KPiB1c2VkX2xlbmd0aCBhbmQgbWF4X2xlbmd0aCBp
bmFjY2Vzc2libGUpIC0gaG93ZXZlciwgbm90IGFsbCByYW0gYmxvY2sKPiBub3RpZmllcnMgd2ls
bCBzdXBwb3J0IHRoYXQuIExldCdzIHRlYWNoIHRoZSBub3RpZmllciB0aGF0IHJhbSBibG9ja3MK
PiBhcmUgaW5kZWVkIHJlc2l6YWJsZSwgYnV0IGtlZXAgdXNpbmcgbWF4X3NpemUgaW4gdGhlIGV4
aXN0aW5nIG5vdGlmaWVycy4KPgo+IFN1cHBseSB0aGUgbWF4X3NpemUgd2hlbiBhZGRpbmcgYW5k
IHJlbW92aW5nIHJhbSBibG9ja3MuIEFsc28sIG5vdGlmeSBvbgo+IHJlc2l6ZXMuIEludHJvZHVj
ZSBhIHdheSB0byBkZXRlY3QgaWYgYW55IHJlZ2lzdGVyZWQgbm90aWZpZXIgZG9lcyBub3QKPiBz
dXBwb3J0IHJlc2l6ZXMgLSByYW1fYmxvY2tfbm90aWZpZXJzX3N1cHBvcnRfcmVzaXplKCkgLSB3
aGljaCB3ZSBjYW4gbGF0ZXIKPiB1c2UgdG8gZmFsbGJhY2sgdG8gbGVnYWN5IGhhbmRsaW5nIGlm
IGEgcmVnaXN0ZXJlZCBub3RpZmllciAoZXNwLiwgU0VWIGFuZAo+IEhBWCkgZG9lcyBub3Qgc3Vw
cG9ydCBhY3R1YWwgcmVzaXplcy4KPgo+IENjOiBSaWNoYXJkIEhlbmRlcnNvbiA8cnRoQHR3aWRk
bGUubmV0Pgo+IENjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+IENjOiAi
RHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRnaWxiZXJ0QHJlZGhhdC5jb20+Cj4gQ2M6IEVkdWFy
ZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVkaGF0LmNvbT4KPiBDYzogTWFyY2VsIEFwZmVsYmF1bSA8
bWFyY2VsLmFwZmVsYmF1bUBnbWFpbC5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Cj4gQ2M6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+IENjOiAiTWlj
aGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+IENjOiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgoKWGVu
IHBhcnRzLi4uCgpBY2tlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
