Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D9D1886FB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 15:11:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jECtz-0003A2-5B; Tue, 17 Mar 2020 14:09:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wpLQ=5C=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jECtx-00039w-Fd
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:09:01 +0000
X-Inumbo-ID: d95b3c78-6858-11ea-bec1-bc764e2007e4
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d95b3c78-6858-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 14:09:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g4so1634641lfb.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ALIX2Ql6HJ5JNM8uZW0nURptAIrU0esaVUynJf8ybBo=;
 b=Ebo4jxoxhNJ/vQ8F46adUfv3HXCetJ2fPcG/n9XRVaAhi1c3GpiNix92Ki33Wi8GIX
 sDQMGQZpeqtW4wr6J+vhZAs4iAYgqvdWAG/YENcYumyHyTLZenAiNlWyCstg42CLoEwh
 nDLpIfcsTXBfY+pL/ICsUZUuDFphSSq9QLDo5aKfSbsPteh/yY6BY/MDE+p0RcMjGI+V
 2a4jrzZIsCK0nBpKpD4gEW/lmakgvPrAztPdQhXCbKLfRoDh4cBIG8n4XFfhjiVaTwcj
 3lDaGOW/cRoapRE9/iudoVdwjxAzx2EOWdgZW8x98PtwN4OtWi0w95r0d8UOXHTq566Q
 ziCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ALIX2Ql6HJ5JNM8uZW0nURptAIrU0esaVUynJf8ybBo=;
 b=t8sgVGINGqBUh18L2Lj82ZmgZJaNzj3A71PGyuY77iKy440wk0Da6q6eQW9fYhLMpC
 nqxmo9LdVJwIHv4egm3yVXtAjmDYVCVoXqYPemAgNM93Ef6pNKcBK+hCk0SPkGaZ9WKC
 qppli7d+QfTzawcM5qFjRsDO40847ql0x/DseG8N5JtR4GBxbsd0/fo8MBRnHpqHNq7t
 i5K+UbSEwDjff34RbPiiFfjRlX4aYETchxGyiVPpkhwuYxmnfpbB6laQvfkeJ+xqoVOL
 rmU8yBX+d5xv9VeBJ77yKWiTLE7LqnHnJdCcWDRmv9PL/ziLl/fZmrxS7YVoz38jjTd5
 G4yw==
X-Gm-Message-State: ANhLgQ2yTTWJsTiWVBUGg5c7TUVnLVcynIlTHh3l/mq7a9Q9YAJ8hocv
 PRAlREE+5IXp0Hc21H+nqMk82OSy/Zc4ZB8B2x0=
X-Google-Smtp-Source: ADFU+vuZlx17akvBLMEMin/kzlfQGvU6ZC6AiTJjkpQVR9Q00r79d4iN9v43f7ZqLE7rHJjWa5jMLp1IBc6yZM9pdp8=
X-Received: by 2002:a05:6512:1116:: with SMTP id
 l22mr3012863lfg.70.1584454139556; 
 Tue, 17 Mar 2020 07:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
 <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
 <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
 <ea7cba55-f267-09c5-044e-e8947a6d2900@citrix.com>
 <4354846c-2210-db80-d14e-6f00c5ed2a3f@suse.com>
 <CAKf6xpsh3y_JpD15JLv52mgZOAVSu_Rp3EZOgGOmuS8_P5OsVQ@mail.gmail.com>
 <CAKf6xpu+YC9zcwZr7rWSz37RE20GQ0dpsMBSqQh6+oPDuYQXuQ@mail.gmail.com>
In-Reply-To: <CAKf6xpu+YC9zcwZr7rWSz37RE20GQ0dpsMBSqQh6+oPDuYQXuQ@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 17 Mar 2020 10:08:48 -0400
Message-ID: <CAKf6xpvd=6PUm7_kUcUtTFPM9b5HbsXSo4=P4=RbS_SrhSoiVQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Aaron Janse <aaron@ajanse.me>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTcsIDIwMjAgYXQgOTo0OCBBTSBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0Bn
bWFpbC5jb20+IHdyb3RlOgo+IEkgZ290IGl0IHRvIGJvb3QgcGFzdCAiSU8tQVBJQyArIHRpbWVy
IGRvZXNuJ3Qgd29yayIuICBJIHByb2dyYW1tZWQKPiB0aGUgSFBFVCB0byBwcm92aWRlIGEgcGVy
aW9kaWMgdGltZXIgaW4gaHBldF9yZXN1bWUoKSBvbiBUMC4gIFdoZW4gSQo+IGFjdHVhbGx5IGdv
dCBpdCBwcm9ncmFtbWVkIHByb3Blcmx5LCBpdCB3b3JrZWQgdG8gaW5jcmVtZW50Cj4gcGl0MF90
aWNrcy4gIEkgYWxzbyBtYWRlIHRpbWVyX2ludGVycnVwdCgpIHVuY29uZGl0aW9uYWxseQo+IHBp
dDBfdGlja3MrKyB0aG91Z2ggdGhhdCBtYXkgbm90IG1hdHRlci4KCkFsc28sIEhQRVRfQ0ZHX0xF
R0FDWSBpcyBlbmFibGVkIGZvciB0aGUgSFBFVC4KClJlZ2FyZHMsCkphc29uCgo+IE5vdyBpdCBw
YW5pY3MgaW4gcHZfZGVzdHJveV9nZHQoKSB3aGVuIGl0IGZhaWxzICJBU1NFUlQodiA9PSBjdXJy
ZW50Cj4gfHwgIXZjcHVfY3B1X2RpcnR5KHYpKTsiIHdoZW4gYnVpbGRpbmcgZG9tMC4gIEkgaGF2
ZW4ndCBpbnZlc3RpZ2F0ZWQKPiB0aGF0IHlldC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
