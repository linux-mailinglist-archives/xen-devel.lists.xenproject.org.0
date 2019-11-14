Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929DCFCAA5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 17:18:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVHmI-00026j-Ny; Thu, 14 Nov 2019 16:15:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=isnB=ZG=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVHmH-00026e-8O
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 16:15:25 +0000
X-Inumbo-ID: f6551ff8-06f9-11ea-9631-bc764e2007e4
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6551ff8-06f9-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 16:15:24 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id 139so7323107ljf.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 08:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yxfJ0kHIFd0+QEK3+72lFgASgftD/k0b10pD3qEx2yY=;
 b=FUxGjiXG24Yk+BhtMzq6idLVCsSyXTR2n60AaiLtkP16/pqjg/fRbm2VNIOuvp6Fys
 edUXRj9bzRQmXC3HR5R+GruQq641cwOaf7wilusIFHaMARNC5JsMdIYUuWcOhc1D8/Rk
 PsLEK8FYVPzYQoTKJhuhmippZrdNlo3MfauOOgSKBsnI1Zslb1RcYBENU6sHYPAe7SUt
 vAAJTD+RtE0/rHFWUK2QEq1O58i3qDEL6E5YfDRsgZ4ZRaN6gYZ8arBdR37pmPrjv+D3
 niaW1EhDUbjSFrzxZlVCDKSXkhcD5YjykJY0SnrW84DH1XSfReWwN9CSIv4uSqkyJRHs
 uCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yxfJ0kHIFd0+QEK3+72lFgASgftD/k0b10pD3qEx2yY=;
 b=fk41ZPhHFfS9VesaLLH2587jXuPtZKjMpdPzVe//fsKFFwIXt9HLa3Yef2TW98pnEm
 EM3JfSo81xpOfX8LsclonxgGslz9Id/4Az3CIWT6oBv2Hvez3Z773OfmPitnSTw6MI0G
 elai62/mrWKTbPKudklUrBQbpg6g336iraNRvw4QlqWV9+eVWQGFWFAwvaCEHQlvkZcU
 3ZYbJdbwnDmZMVTAJ5z1kmadZkEnwEFsYULMkL+giJPJHV1tFXL6wNMd2iF0lPCALD++
 EO9wJpjybH8fIc8DFHqMWGyPZIJZjypL18HIfnQBlXxh69b+dauca9/woQcpJBJFuOW+
 qldw==
X-Gm-Message-State: APjAAAU9aG6JbWXyrfVjrW8iC3usWn2y6YBd9LZXq3iWqweUZG+1FEsc
 1EZ0NqZFnPjvytKC/KUl31GSTcYxHk1Ef8bkKfU=
X-Google-Smtp-Source: APXvYqwfFLVbN2iTdRu2RkP45tR3Wf+O/7pj0dl2/QxxQ2yXtCjJ7FZS3mwwKKRQ4HZr78lWdUuEuKyE7HfoXGbgB8Q=
X-Received: by 2002:a05:651c:95:: with SMTP id 21mr7312259ljq.40.1573748123196; 
 Thu, 14 Nov 2019 08:15:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <18a733f00beec2b7ec9fc729fd90e2a6c456987b.1570456846.git.rosbrookn@ainfosec.com>
 <4484e729-7e34-c628-37f0-80f395f7088c@citrix.com>
In-Reply-To: <4484e729-7e34-c628-37f0-80f395f7088c@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 14 Nov 2019 11:15:11 -0500
Message-ID: <CAEBZRScmbTLG9=0=GgAA-K9fm78VXq=fSZAsx=p5qGmv7xqZ4g@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 14/24] golang/xenlight: generate structs
 from the IDL
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
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBCVFcgSSB3YXMgZGlzY3Vzc2luZyB3aXRoIElhbiBKYWNrc29uLCBhbmQgSSB0aGluayBhdCBz
b21lIHBvaW50IGl0Cj4gd291bGQgYmUgd29ydGggY29uc2lkZXJpbmcgYWRkaW5nIGluIGFuIGFu
bm90YXRpb24gb3Igc29tZXRoaW5nIHRvIHRoZQo+IElETCBzdWNoIHRoYXQgdGhlIGdlbmVyYXRv
ciBjYW4gdXNlIHRpbWUuRHVyYXRpb24gZm9yIHRoZXNlIHRoaW5ncy4KPiBUaGF0IG9wZW5zIHVw
IGFub3RoZXIgY2FuIG9mIHdvcmtzLCBsaWtlICB0aGUgZmFjdCB0aGF0IER1cmF0aW9uIGlzCj4g
aW50NjQgcmF0aGVyIHRoYW4gdWludDY0Lgo+Cj4gQnV0IGF0IGFueSByYXRlLCB0aGF0J3Mgc29t
ZXRoaW5nIHRvIGxvb2sgaW50byAqYWZ0ZXIqIHRoaXMgc2VyaWVzIGlzCj4gY2hlY2tlZCBpbi4K
CkFkZCBpdCB0byB0aGUgbGlzdCEgOikKCj4gVGhpcyBkb2Vzbid0IHNlZW0gbGlrZSBncmVhdCBz
b2Z0d2FyZSBlbmdpbmVlcmluZy4gOi0pICBXb3VsZCBpdCBiZQo+IHRlcnJpYmx5IGRpZmZpY3Vs
dCB0byByZWZhY3RvciB0aGluZ3MgdG8gYXZvaWQgdGhpcz8gIFBlcmhhcHMgYnkKPiByZXR1cm5p
bmcgdHVwbGVzIHRoYXQgYXJlIG1lcmdlZCB0b2dldGhlciBvciBzb21ldGhpbmc/CgpObywgSSBk
b24ndCB0aGluayB0aGlzIHdvdWxkIGJlIGRpZmZpY3VsdCB0byByZS1mYWN0b3IuIEkgdGhpbmsg
ZWl0aGVyCmp1c3QgcmV0dXJuaW5nIGEgbGlzdCBvZiBzdHJpbmdzLCBvciBzb21lIG4tdHVwbGUg
YXMgeW91IHN1Z2dlc3Qgd291bGQKYmUgZmluZS4KCi1OUgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
