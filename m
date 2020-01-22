Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF3145A19
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:45:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuJ5c-0004Ch-Ce; Wed, 22 Jan 2020 16:42:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EGdE=3L=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iuJ5a-0004Cc-TH
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:42:46 +0000
X-Inumbo-ID: 37a55820-3d36-11ea-b833-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37a55820-3d36-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 16:42:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so7898971wmi.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 08:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFxJJ6YqbRxgHQ8V7K1lrMAL896qln/alfrkn/m/1hU=;
 b=UmNjfG8dJqXBP3JYFbzMwNuaQL3M2ECVZe40/ZFEB+5/zr2grINwPFvxQf5MxZBBzA
 pwHwsVQmUmekE4ZRF9hILwbAngYfa7vdgwKCwHTP1dVe9GX8fj7KgQAIqQOLeqOAmPtG
 fpOhcThuTEtCoz6XhjYxgn17YqhrC1nenS3WeGPXYHpIHC/kvqYvi5rt4jcRsT2kZB3L
 sGpWRzpW2kCRF48TZcVSLRd19dws69XLwtmjyjXIVBDwUOZR1MunFDFJSgwEQFmiHbDK
 SClDvh/1L1UYvAojFYQRuwqmOOaQ3TELXaq37swzyKzFQ4bWkQWxD/hMyoe4OzHs7DJD
 Hklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFxJJ6YqbRxgHQ8V7K1lrMAL896qln/alfrkn/m/1hU=;
 b=Jbf6ovs5ANY/Q13BsW5bNDQIa/uuRl2K6oyWu3R93C3E+F+z23fULcOTjuxfiODwLv
 tb8EWuIbBLaNBqTmhPFN2vd0MzqGdgAwG+mOMTajNYurCHaOF4cZH1aI7B7VJzX8HeZA
 T3+PzWzlyZ804CKkhz3o95VlxZwlPZwAwhhGbxQ3erz6dVE6bFpMTbDr+jU2DayIOL9x
 XLej9FKdRL40MERC0PeA0zOPP227sKFfRY9ksEV9xhPdLfj8E6fTprGNhH8zBn+L10vp
 WnGY0kno5sqAecwZBydGNHuvHhFZsgxUyrq5bYfVQ2CwF477A+rgwogSCl1ZV5ErOONV
 VRIQ==
X-Gm-Message-State: APjAAAV0dNYkbs6qUMYgoHjByaOOZftF5NkLfSQRr2d1WW/avD7rV3M3
 8ijciCIesJLiqQytNVitgYO1PJ6yc9PslAb4XWo=
X-Google-Smtp-Source: APXvYqyfj+mH/7ycOBKYcgEJhr6e/gAql8QIDRvbZVV5FI1KKic4nypx7UmIRm/pLmhm1GAkxpSFwwDziBHMxMeE1ds=
X-Received: by 2002:a7b:c216:: with SMTP id x22mr3994232wmi.51.1579711365459; 
 Wed, 22 Jan 2020 08:42:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <8b7e04b4f853de484f5f15f4523b4ae85134d5e9.1579628566.git.tamas.lengyel@intel.com>
 <ba92fb88-1f7a-0a3a-6005-090afb6f7680@suse.com>
In-Reply-To: <ba92fb88-1f7a-0a3a-6005-090afb6f7680@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 22 Jan 2020 09:42:07 -0700
Message-ID: <CABfawhkgErqVG_MEEU2rbbgWuM9BWLv4ESxUe5+NAnzTxnvKbA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v5 01/18] x86/hvm: introduce
 hvm_copy_context_and_params
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgODowMSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gQ3VycmVudGx5IHRoZSBodm0gcGFyYW1ldGVycyBhcmUgb25seSBhY2Nlc3NpYmxl
IHZpYSB0aGUgSFZNT1AgaHlwZXJjYWxscy4gSW4KPiA+IHRoaXMgcGF0Y2ggd2UgaW50cm9kdWNl
IGEgbmV3IGZ1bmN0aW9uIHRoYXQgY2FuIGNvcHkgYm90aCB0aGUgaHZtIGNvbnRleHQgYW5kCj4g
PiBwYXJhbWV0ZXJzIGRpcmVjdGx5IGludG8gYSB0YXJnZXQgZG9tYWluLiBObyBmdW5jdGlvbmFs
IGNoYW5nZXMgaW4gZXhpc3RpbmcKPiA+IGNvZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGFt
YXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KPgo+IEluIHJlcGx5IHRvIG15
IHY0IGNvbW1lbnRzIHlvdSBzYWlkICJJIGRvbid0IGhhdmUgYW55IG9iamVjdGlvbnMgdG8gdGhl
Cj4gdGhpbmdzIHlvdSBwb2ludGVkIG91dC4iIFlldCBvbmx5IG9uZSBhc3BlY3Qgd2FzIGFjdHVh
bGx5IGNoYW5nZWQgaGVyZS4KPiBJdCBhbHNvIGRvZXNuJ3QgaGVscCB0aGF0IHRoZXJlJ3Mgbm8g
YnJpZWYgc3VtbWFyeSBvZiB0aGUgY2hhbmdlcyBkb25lCj4gZm9yIHY1LiBJIGd1ZXNzIEknbSBj
b25mdXNlZC4KCkluZGVlZCBpdCBzZWVtcyBJIG1pc3NlZCBzb21lIG9mIHlvdXIgcHJldmlvdXMg
cmVxdWVzdHMuIEkgd2FzIGhhbGZ3YXkKdGhyb3VnaCBtYWtpbmcgdGhlIG1vZGlmaWNhdGlvbnMg
YnV0IHNpbXBseSBmb3Jnb3QgdG8gZG8gdGhlIHJlc3QKYWZ0ZXIgSSBzdGVwcGVkIGF3YXkuIEkg
c3RpbGwgZG9uJ3QgaGF2ZSBhbnkgb2JqZWN0aW9ucyB0byB0aGVtCnRob3VnaCwgc28gd2lsbCBj
YXRjaCB1cCBvbiBpdCBpbiB2Ni4KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
