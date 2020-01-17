Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D36141095
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 19:16:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isW88-0007xC-2K; Fri, 17 Jan 2020 18:14:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l5Bp=3G=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1isW87-0007x5-2u
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 18:13:59 +0000
X-Inumbo-ID: 211b45fe-3955-11ea-8e9a-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 211b45fe-3955-11ea-8e9a-bc764e2007e4;
 Fri, 17 Jan 2020 18:13:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r19so27395148ljg.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2020 10:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DGptQCpwFhyJWL9/n7z25mAr4ny5+nvOJCUoMUgqhF0=;
 b=ec8Epxc4RO/9zWpwA8EWk8i1CfleA2mq67frqZgmgyqkzJd3k6LvTfCIgLgfL7KbXk
 GXAbkRH5qOmVyO9JbC3zmtA0mcvbt78qw1dK+z+lMRab4LQc+lTvUvl8MNnqQesT51Zz
 dRUBElX7No9DQ6BqwGWvJzj8i+r5JVQsdd3H7mC8dZJeUMKl1h0UOSCi4VwuSoqoq5hh
 vcWSvMxyFmABXCnE1h4sdQEXhuAcUdUySxVWhG7kxHQ801WUtq0fF9BQotiOD4IAZkDw
 vHGFXUcDiIhcHinyvjjKGMGTyvKWJ7lsxaShJBduI51TjwWPbBsQFIPoGwXgPN5ID9/E
 IN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DGptQCpwFhyJWL9/n7z25mAr4ny5+nvOJCUoMUgqhF0=;
 b=HEPsSeCbe92oyt9Auap+ENmRyG5AzZGckyOOJBoYuFg7bOKmzfJWL3FqMgtpTaKEiP
 EDHjluPgNWUN3Xro+SDTNPSqNQV3EH/8KEPW2iD0RK9mtB/GUCdlTB3hnBGfgd7GkYYE
 lwV5zGcqsD1wMkHJDnuH6yRtb4WlOrd+TdB3F+2dLzaSJnWwGFh9xoFhvSzrV05GteAp
 BJZQrcdWiIQ+J9izcTlKUTFfJ8JPgH0akXm1/K9urw+W4krhnGxs2Pp+0UQBt/Om35bR
 67KKmpnvg7VFD8uGC+NJOeqeum5kp9VMj5TiRO+6gSIuFPENZPaw5IqThFdyk+dyYuxc
 KvHA==
X-Gm-Message-State: APjAAAV9GuAacqxzO/Z5cKQW+DwZXleooj0OdtfmyMo8uKdPdwW4WIDm
 7IN/duM+tQbhZffKSwm5NhAf8pqkkQCxb85Bpno=
X-Google-Smtp-Source: APXvYqw3az7EjcZ74Xh5MetyJcRNeRQTQgzPUKCK7jmZ6QXxAWjzpnfMG3e7NVR5LVoyHOb4Y6qbLwDU4vZ0IfljvkQ=
X-Received: by 2002:a05:651c:1049:: with SMTP id
 x9mr6489426ljm.233.1579284837368; 
 Fri, 17 Jan 2020 10:13:57 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-7-george.dunlap@citrix.com>
In-Reply-To: <20200117155734.1067550-7-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 17 Jan 2020 13:13:45 -0500
Message-ID: <CAEBZRSdvPOLLZ3Qd=4Zr2Ns7enO4RpmFsNFznKUP6=pxqj_jrA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 7/8] golang/xenlight: Notify xenlight of
 SIGCHLD
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
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAgLy8gQ29udGV4dCByZXByZXNlbnRzIGEgbGlieGxfY3R4Lgo+ICB0eXBlIENvbnRleHQgc3Ry
dWN0IHsKPiAtICAgICAgIGN0eCAgICAqQy5saWJ4bF9jdHgKPiAtICAgICAgIGxvZ2dlciAqQy54
ZW50b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVhbQo+ICsgICAgICAgY3R4ICAgICAgICAgKkMubGli
eGxfY3R4Cj4gKyAgICAgICBsb2dnZXIgICAgICAqQy54ZW50b29sbG9nX2xvZ2dlcl9zdGRpb3N0
cmVhbQo+ICsgICAgICAgc2lnY2hsZCAgICAgY2hhbiBvcy5TaWduYWwKPiArICAgICAgIHNpZ2No
bGREb25lIGNoYW4gYm9vbAoKSXQncyBwcmVmZXJyZWQgdG8gdXNlIGBjaGFuIHN0cnVjdHt9YCBm
b3IgdGhpcyBwYXR0ZXJuOyBpdCBtYWtlcyBpdApjbGVhciB0aGF0IHRoZSBkYXRhIHNlbnQgb3Zl
ciB0aGUgY2hhbm5lbCBoYXMgbm8gbWVhbmluZywgYW5kIGlzIG9ubHkKaW50ZW5kZWQgdG8gYmUg
dXNlZCBmb3Igc3luY2hyb25pemF0aW9uLgoKPiArICAgICAgIC8vIC4uLmFuZCBhcnJhbmdlIHRv
IGtlZXAgdGhhdCBwcm9taXNlLgo+ICsgICAgICAgY3R4LnNpZ2NobGQgPSBtYWtlKGNoYW4gb3Mu
U2lnbmFsLCAyKQo+ICsgICAgICAgY3R4LnNpZ2NobGREb25lID0gbWFrZShjaGFuIGJvb2wsIDEp
Cj4gKyAgICAgICBzaWduYWwuTm90aWZ5KGN0eC5zaWdjaGxkLCBzeXNjYWxsLlNJR0NITEQpCj4g
Kwo+ICsgICAgICAgZ28gc2lnY2hsZEhhbmRsZXIoY3R4KQoKSXQgY291bGQgYmUgdXNlZnVsIHRv
IGFkZCBhIGNvbW1lbnQgaGVyZSB0aGF0IGV4cGxhaW5zIHRoZSBsaWZldGltZSBvZgp0aGlzIGdv
cm91dGluZSwgaS5lLiBpdCByZXR1cm5zIHdoZW4gdGhlIGNvbnRleHQgaXMgQ2xvc2UoKSdkLgoK
PiAgLy8gQ2xvc2UgY2xvc2VzIHRoZSBDb250ZXh0Lgo+ICBmdW5jIChjdHggKkNvbnRleHQpIENs
b3NlKCkgZXJyb3Igewo+ICsgICAgICAgLy8gVGVsbCBvdXIgU0lHQ0hMRCBub3RpZmllciB0byBz
aHV0IGRvd24sIGFuZCB3YWl0IGZvciBpdCB0byBleGl0Cj4gKyAgICAgICAvLyBiZWZvcmUgd2Ug
ZnJlZSB0aGUgY29udGV4dC4KPiArICAgICAgIGlmIGN0eC5zaWdjaGxkID09IG5pbCB7CgpTaG91
bGRuJ3QgdGhpcyBiZSBgaWYgY3R4LnNpZ2NobGQgIT0gbmlsYD8KCi1OUgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
