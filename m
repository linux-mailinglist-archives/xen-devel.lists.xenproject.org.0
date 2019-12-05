Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E3611437B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:25:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icsyq-0006Vb-N3; Thu, 05 Dec 2019 15:23:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4RYm=Z3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1icsyo-0006VS-EW
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:23:46 +0000
X-Inumbo-ID: 3876d65f-1773-11ea-822b-12813bfff9fa
Received: from mail-lj1-f195.google.com (unknown [209.85.208.195])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3876d65f-1773-11ea-822b-12813bfff9fa;
 Thu, 05 Dec 2019 15:23:44 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id j6so4066676lja.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 07:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oz1F/5vH48/Imn5uJAnI8Mqmv6suWVPWA6AYw/FKWJg=;
 b=dSqhPnLZ2X+MNx7iy7/cAwCMHuOamb+xegS35vK/AvSIFLor4Z1CP0Kw27UcwKfQ3I
 WbjU9PxK4vpIPKJQwESpPwSA69hm6hh4pJPg3fSLej6tVrI+R0maRH8Pqz9X+gthy8bj
 Sh7iXOuFnCBkEuSiomvqfB36jUk6YqcEyn4cwFq9CXhY5OPaO9S1RKi/81thWp/BPBIy
 8MINH8XONcn2T3GOJz3zF+TZjdSfnrkzeZ2T71R8fo6t5leCfIKKwWlf8VYMWuYOKjfq
 sDvwA6cF3zGNVy0JDSjj0QY/5lRwBw+sw4KTz3fZ1XUelNiuWMnwNk3Pmyljuf0djHbG
 9h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oz1F/5vH48/Imn5uJAnI8Mqmv6suWVPWA6AYw/FKWJg=;
 b=hE1LY+8fqnVBPpZ7Zk1gxVv3DcBRDrSGre4CC2iwNkTQ6pmyNRMYJGLEBp2KO0W3Vz
 hrquleDSj/TQNfRhz3Wg04qbbWdc9KcwWdG/rGHItAdz54CQrHYkI3AESo+Dv8GOxtko
 PK8FbX2PCvfBdyf+NqjZpd/yDTpGwpyZAO7wow5eAOvlGeuAyL0Tih0ZXgmALecL+wAD
 +9x2gLbtdk6Nv3Cq04C9ihZeKimLkSgUwEwCZ9WYEDWzz+zN5zjaEmZ/63KAJ6omTCQk
 M6Ns+pDOXe+s1c/3A6hdfBm6xF46k1A5wz9Nv7p/QS9cbk20VnUOIFkLpzRic7tN/jEY
 eOHw==
X-Gm-Message-State: APjAAAVLIgdw6Qoz5DKU3lMtwExnKrjC/mnS5UnhvPdZfh4MnfEbYUMk
 CD1PfJDuYzuIcwrIiOe331MrPW2cU0A67hwTf/U=
X-Google-Smtp-Source: APXvYqwgoQ8lVSnHOIeh2vadRLeWne9bidmIJYSt/K2cKwa8o9M2hZKLcKkV8E4CDpOLGoPil8yCD3GPQsswaG183Fk=
X-Received: by 2002:a2e:880c:: with SMTP id x12mr5105615ljh.44.1575559423266; 
 Thu, 05 Dec 2019 07:23:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <1997f553223508247777fb47fce9af3f658c5d74.1573840474.git.rosbrookn@ainfosec.com>
 <a8c4717c-13cd-8061-56a9-006a9aea1913@citrix.com>
In-Reply-To: <a8c4717c-13cd-8061-56a9-006a9aea1913@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 5 Dec 2019 10:23:31 -0500
Message-ID: <CAEBZRSf1CCByv_8xmcQwR=Kwr447WHfu1Sp_Kb=_OSjdDJP-hw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 02/22] golang/xenlight: define Defbool
 builtin type
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

PiBJIGltcGxlbWVudGVkIHNvbWUgdGVzdHMgZm9yIHRoZXNlIG1ldGhvZHMgdG8gbWFrZSBzdXJl
IGV2ZXJ5dGhpbmcKPiB3b3JrZWQgYXMgZXhwZWN0ZWQgKHRoZXkgZGlkKTsgYnV0IHRoZXJlJ3Mg
YW4gdW5leHBlY3RlZCBzaWRlLWVmZmVjdDoKPgo+IC0gICpfdGVzdC5nbyBmaWxlcyBjYW5ub3Qg
YGltcG9ydCAiQyJgCgpZZWFoLCB0aGlzIGlzIHVuZm9ydHVuYXRlLgoKPiAtIFRoZSBmcm9tQyAv
IHRvQyBtZXRob2RzIGFyZW4ndCBleHBvcnRlZAo+Cj4gU28gaXQncyBub3QgcG9zc2libGUgdG8g
ZG8gdGhlIGZvbGxvd2luZyBjaGVjazoKPgo+ICAgdmFyIGIgRGVmYm9vbAo+Cj4gICBiLlNldCh0
cnVlKQo+ICAgY2IsIGVyciA6PSBiLnRvQygpCj4gICBpZiAoICFDLmxpYnhsX2RlZmJvb2xfdmFs
KGNiKSApIHsKPiAgICAgLy8gcmVwb3J0IGFuIGVycm9yCj4gICB9Cj4KPiBkZWZib29sX3Rlc3Qu
Z28gY2FuJ3QgYGltcG9ydCAiQyJgLCBzbyBpdCBjYW4ndCBjYWxsCj4gQy5saWJ4bF9kZWZib29s
X3ZhbCgpLiAgV2UgY291bGQgbWFrZSBhbiBleHRlcm5hbCB4ZW5saWdodHRlc3QgcGFja2FnZSwK
PiBidXQgdGhhdCB3b3VsZG4ndCBiZSBhYmxlIHRvIGNhbGwgdG9DKCkuCj4KPiAoSSBzdXBwb3Nl
IHdlIGNvdWxkIHdyaXRlICJwcm94eSIgZnVuY3Rpb25zIGZvciBldmVyeSBzdWNoIGZ1bmN0aW9u
IHdlCj4gbWlnaHQgd2FudCB0byBjaGVjaywgYnV0IHRoYXQgc2VlbXMgZXhjZXNzaXZlLikKCklm
IGJ5ICJwcm94eSIgZnVuY3Rpb25zIHlvdSBtZWFuIHNvbWV0aGluZyBsaWtlOgoKZnVuYyBsaWJ4
bERlZmJvb2xWYWwoZGIgRGVmYm9vbCkgYm9vbCB7CiAgICAgICAgcmV0dXJuIEMubGlieGxfZGVm
Ym9vbF92YWwoQy5saWJ4bF9kZWZib29sKGRiKSkKfQoKSSBhZ3JlZSBpdCBjb3VsZCBiZSBhIGJp
dCBleGNlc3NpdmUuIEJ1dCwgaXQgbWlnaHQgYmUgbmVjZXNzYXJ5IGluCm9yZGVyIHRvIGxldmVy
YWdlIGdvIHRlc3QuIEFuZCwgd2UgY291bGQgbWFrZSBzdXJlIHRoYXQgdGhvc2UgZXh0cmEKInBy
b3h5IiBmdW5jdGlvbnMgYXJlIG9ubHkgaW5jbHVkZWQgaW4gdGVzdCBidWlsZHMgKG1heWJlIGJ5
IG1ha2luZwppbnRlcm5hbCBwYWNrYWdlIHRvIGhvdXNlIHRoZW0pLgoKTWF5YmUgdGhlcmUgaXMg
YSBiZXR0ZXIgc29sdXRpb24gdG8gdGhpcy4gSSdsbCBuZWVkIHRvIHRoaW5rIGFib3V0IGl0IHNv
bWUgbW9yZS4KCi1OUgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
