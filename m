Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0134917B8D0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 09:58:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA8lY-0000ny-Jv; Fri, 06 Mar 2020 08:55:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dJSx=4X=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jA8lW-0000nt-Sg
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 08:55:30 +0000
X-Inumbo-ID: 3b21406c-5f88-11ea-8eb5-bc764e2007e4
Received: from mail-pj1-f65.google.com (unknown [209.85.216.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b21406c-5f88-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 08:55:30 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id cx7so786196pjb.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 00:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCRRo8mhsNgX7iUXkBf5uiGaRmrvVTy07+qmcaPwud4=;
 b=XtjdzTzWG6FgaIXqGdgfCpyqq+bYB9TpThrxEy8WCs883XqBd3IDTfUyPbfpX6T1cx
 hrr+vAPt/NkOUS60VDU0BoKR0symIW1/Va0XcNnuTdCgYDeGZFnIq3+jPP9unp9INwHK
 FwpoY3dFsfmIan+iqzXtA3MYYcoi9mqhuC4wUpjPepu6oWxVYzU7+9a/bVEOxRmQHQMR
 ufgqWq/rpnWpA3XV1zqQYyFeHoochbnYCk6EJDW/uY3vbVowk2DGWrAU/aKj33HA9mZB
 X6d4xUXHBe+pt9zVoN3FvSasq2ExCx2ElJd9phJDXY6HDe09M/uWNKMsFb2QO8Yfkim5
 xhbg==
X-Gm-Message-State: ANhLgQ2Nf8YWK2zppPiVoVtew+jz6pFsqceNMa5L+QUs3aJaLAIseFG8
 8A31jWNzPzaZAtjZ/kjgp/JLSK8RxZ7IJj7s
X-Google-Smtp-Source: ADFU+vsqh+XWOK7g975iTY38IMwJDvl8u8hp4JADWqswrEJqurAKvtWwDQ2F/dKHwgV4Xez+s9uTIg==
X-Received: by 2002:a17:902:be03:: with SMTP id
 r3mr2026297pls.137.1583484929357; 
 Fri, 06 Mar 2020 00:55:29 -0800 (PST)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com.
 [209.85.215.182])
 by smtp.gmail.com with ESMTPSA id c17sm13994294pfo.71.2020.03.06.00.55.28
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 00:55:29 -0800 (PST)
Received: by mail-pg1-f182.google.com with SMTP id m15so764576pgv.12
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 00:55:28 -0800 (PST)
X-Received: by 2002:a63:7453:: with SMTP id e19mr2304147pgn.50.1583484928522; 
 Fri, 06 Mar 2020 00:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-2-vsementsov@virtuozzo.com>
In-Reply-To: <20200306051536.27803-2-vsementsov@virtuozzo.com>
From: Paul Durrant <paul@xen.org>
Date: Fri, 6 Mar 2020 08:55:17 +0000
X-Gmail-Original-Message-ID: <CACCGGhB-Y6Jjwmn4CvydPGFZQnfvyeG=vbr5wCxt4GrCMjf80g@mail.gmail.com>
Message-ID: <CACCGGhB-Y6Jjwmn4CvydPGFZQnfvyeG=vbr5wCxt4GrCMjf80g@mail.gmail.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [Xen-devel] [PATCH v8 01/10] error: auto propagated local_err
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
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Eric Blake <eblake@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA2IE1hciAyMDIwIGF0IDA1OjE2LCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5
Cjx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdyb3RlOgo+Cj4gSGVyZSBpcyBpbnRyb2R1Y2Vk
IEVSUlBfQVVUT19QUk9QQUdBVEUgbWFjcm8sIHRvIGJlIHVzZWQgYXQgc3RhcnQgb2YKPiBmdW5j
dGlvbnMgd2l0aCBhbiBlcnJwIE9VVCBwYXJhbWV0ZXIuCj4KPiBJdCBoYXMgdGhyZWUgZ29hbHM6
Cj4KPiAxLiBGaXggaXNzdWUgd2l0aCBlcnJvcl9mYXRhbCBhbmQgZXJyb3JfcHJlcGVuZC9lcnJv
cl9hcHBlbmRfaGludDogdXNlcgo+IGNhbid0IHNlZSB0aGlzIGFkZGl0aW9uYWwgaW5mb3JtYXRp
b24sIGJlY2F1c2UgZXhpdCgpIGhhcHBlbnMgaW4KPiBlcnJvcl9zZXRnIGVhcmxpZXIgdGhhbiBp
bmZvcm1hdGlvbiBpcyBhZGRlZC4gW1JlcG9ydGVkIGJ5IEdyZWcgS3Vyel0KPgo+IDIuIEZpeCBp
c3N1ZSB3aXRoIGVycm9yX2Fib3J0IGFuZCBlcnJvcl9wcm9wYWdhdGU6IHdoZW4gd2Ugd3JhcAo+
IGVycm9yX2Fib3J0IGJ5IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUsIHRoZSByZXN1bHRpbmcg
Y29yZWR1bXAgd2lsbAo+IHJlZmVyIHRvIGVycm9yX3Byb3BhZ2F0ZSBhbmQgbm90IHRvIHRoZSBw
bGFjZSB3aGVyZSBlcnJvciBoYXBwZW5lZC4KPiAodGhlIG1hY3JvIGl0c2VsZiBkb2Vzbid0IGZp
eCB0aGUgaXNzdWUsIGJ1dCBpdCBhbGxvd3MgdXMgdG8gWzMuXSBkcm9wCj4gdGhlIGxvY2FsX2Vy
citlcnJvcl9wcm9wYWdhdGUgcGF0dGVybiwgd2hpY2ggd2lsbCBkZWZpbml0ZWx5IGZpeCB0aGUK
PiBpc3N1ZSkgW1JlcG9ydGVkIGJ5IEtldmluIFdvbGZdCj4KPiAzLiBEcm9wIGxvY2FsX2Vycitl
cnJvcl9wcm9wYWdhdGUgcGF0dGVybiwgd2hpY2ggaXMgdXNlZCB0byB3b3JrYXJvdW5kCj4gdm9p
ZCBmdW5jdGlvbnMgd2l0aCBlcnJwIHBhcmFtZXRlciwgd2hlbiBjYWxsZXIgd2FudHMgdG8ga25v
dyByZXN1bHRpbmcKPiBzdGF0dXMuIChOb3RlOiBhY3R1YWxseSB0aGVzZSBmdW5jdGlvbnMgY291
bGQgYmUgbWVyZWx5IHVwZGF0ZWQgdG8KPiByZXR1cm4gaW50IGVycm9yIGNvZGUpLgo+Cj4gVG8g
YWNoaWV2ZSB0aGVzZSBnb2FscywgbGF0ZXIgcGF0Y2hlcyB3aWxsIGFkZCBpbnZvY2F0aW9ucwo+
IG9mIHRoaXMgbWFjcm8gYXQgdGhlIHN0YXJ0IG9mIGZ1bmN0aW9ucyB3aXRoIGVpdGhlciB1c2UK
PiBlcnJvcl9wcmVwZW5kL2Vycm9yX2FwcGVuZF9oaW50IChzb2x2aW5nIDEpIG9yIHdoaWNoIHVz
ZQo+IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUgdG8gY2hlY2sgZXJyb3JzLCBzd2l0Y2hpbmcg
dGhvc2UKPiBmdW5jdGlvbnMgdG8gdXNlICplcnJwIGluc3RlYWQgKHNvbHZpbmcgMiBhbmQgMyku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50
c292QHZpcnR1b3p6by5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5v
cmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
