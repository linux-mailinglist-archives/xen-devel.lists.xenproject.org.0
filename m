Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D18D5E25
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 11:07:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJwFm-0005U2-Gp; Mon, 14 Oct 2019 09:02:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7fCd=YH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iJwFk-0005Tx-Fm
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 09:02:56 +0000
X-Inumbo-ID: 683328c4-ee61-11e9-9375-12813bfff9fa
Received: from mail-lf1-f66.google.com (unknown [209.85.167.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 683328c4-ee61-11e9-9375-12813bfff9fa;
 Mon, 14 Oct 2019 09:02:54 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y127so11247044lfc.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2019 02:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=atd8JY4xDCXy07woK57hou/QSpa2JswFfraCBbT5GNE=;
 b=fmQXjFYF+gDiIloalMEY9ThMpTzgr05Om6oaYoQIx81am+2D1+e1jSfB5HIYlN3dqw
 WE4BqzZR4rf3Duc3qhCmLdLxbfpwnAqBYkNM6UJSRkchu/lRIBWQ8R9mMeOjCCHjvxU1
 loDGWcvbMwbTQOBMcjPCcDR3yc5uokEMIlDwXFSzFnfDKMNMcHpTw05J5wL1FPRcuHx3
 fRYGP6FWQYa8UU+Wr9dSRjHNp8s6/L3cUnVc1mvxhxJu6e9zlyIt3QtC8RwBSPC52+Uc
 immX+gbdrV77rBD1XFZlJndz+yWzIAxGzbXDRQXtDeSv2aMyJ+NVALkSBwYLqbwFsX5d
 c7/Q==
X-Gm-Message-State: APjAAAXHuxjfV1144C4zgemQsxreFi4X62Gcrzn8F2dp49fQippEPIWS
 lYD6Sf/rFcmZ+M/hKUg8Wz2A1GfqiHY=
X-Google-Smtp-Source: APXvYqyt71lqOZA31nqvXj459OjF79IcD7eXeyAR/+BIYGf/ELAf9sIy3WHePvRGywTHgYgPDIVB8g==
X-Received: by 2002:a19:4b8f:: with SMTP id y137mr16991354lfa.19.1571043773372; 
 Mon, 14 Oct 2019 02:02:53 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id k23sm4098173ljc.13.2019.10.14.02.02.52
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2019 02:02:52 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id d1so15772631ljl.13
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2019 02:02:52 -0700 (PDT)
X-Received: by 2002:a2e:9112:: with SMTP id m18mr4996678ljg.75.1571043772475; 
 Mon, 14 Oct 2019 02:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191002170543.26571-1-olaf@aepfle.de>
 <20191002170543.26571-2-olaf@aepfle.de>
 <20191013162039.hsylxvashc4rbo67@function>
 <20191013162127.2pdc6ho4oer5pnpr@function>
 <20191013185032.49807077.olaf@aepfle.de>
 <20191013165521.ktfmn3rcipexwaiw@function>
In-Reply-To: <20191013165521.ktfmn3rcipexwaiw@function>
From: Wei Liu <wl@xen.org>
Date: Mon, 14 Oct 2019 10:02:36 +0100
X-Gmail-Original-Message-ID: <CAK9nU=r3kwePih8Ugr4=Tv5=wxNAN6v1DLdE5wz1pBnfVmmZoQ@mail.gmail.com>
Message-ID: <CAK9nU=r3kwePih8Ugr4=Tv5=wxNAN6v1DLdE5wz1pBnfVmmZoQ@mail.gmail.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [Xen-devel] [PATCH v2 1/8] stubdom/vtpm: include stdio.h for
 declaration of printf
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Olaf Hering <olaf@aepfle.de>, Quan Xu <quan.xu0@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2MgSnVlcmdlbi4KCkxvb2tzIHByZXR0eSBoYXJtbGVzcyBmb3IgNC4xMy4KCk9uIE1vbiwgMTQg
T2N0IDIwMTkgYXQgMDU6MjMsIFNhbXVlbCBUaGliYXVsdAo8c2FtdWVsLnRoaWJhdWx0QGVucy1s
eW9uLm9yZz4gd3JvdGU6Cj4KPiBPbGFmIEhlcmluZywgbGUgZGltLiAxMyBvY3QuIDIwMTkgMTg6
NTA6MzIgKzAyMDAsIGEgZWNyaXQ6Cj4gPiBBbSBTdW4sIDEzIE9jdCAyMDE5IDE4OjIxOjI3ICsw
MjAwCj4gPiBzY2hyaWViIFNhbXVlbCBUaGliYXVsdCA8c2FtdWVsLnRoaWJhdWx0QGVucy1seW9u
Lm9yZz46Cj4gPgo+ID4gPiA+ID4gY2tlZC1ieTogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5
Y2hvLm5zYS5nb3Y+Cj4gPiA+Cj4gPiA+IE5vdGUgdGhhdCB5b3UgbWlzcyBhbiAnQScgYXQgdGhl
IGJlZ2lubmluZyBvZiB0aGUgbGluZSB0aGVyZS4KPiA+Cj4gPiBUaGFua3MgZm9yIHNwb3R0aW5n
Lgo+ID4KPiA+IFNob3VsZCBJIHJlc2VuZCB0aGlzIHBhdGNoPwo+Cj4gV2l0aCB0aGUgZml4ZWQg
QWNrZWQtYnkgYW5kIG15IFJldmlld2VkLWJ5LCB5ZXMuCj4KPiBTYW11ZWwKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxp
bmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
