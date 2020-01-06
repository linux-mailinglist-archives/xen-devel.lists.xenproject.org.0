Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF9D130FDD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 11:02:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioPAv-0003Ci-Ns; Mon, 06 Jan 2020 09:59:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=opDM=23=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ioPAu-0003Cd-AT
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 09:59:52 +0000
X-Inumbo-ID: 47b334f8-306b-11ea-88e7-bc764e2007e4
Received: from mail-pj1-x1044.google.com (unknown [2607:f8b0:4864:20::1044])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47b334f8-306b-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 09:59:51 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id u63so4284828pjb.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2020 01:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SXHhgqW7n3NhX89cVkF3VrGqJiw1Llh1QL+MWctCWMI=;
 b=OjHxEDYutaVDhCiokq4fjdZgXc1pwUbIB3VnIGAJjIiuS6o6nQy/n6alcJzMxN8ppE
 BZ+udbWKlqWP5iUH3trErbR46u+ltY7aMDEXlp2CpX/fduNJ7l69WaIGLdfThcga8///
 Far4UuXA0fNnQ9tATpr11z0quyBEz1pc0VFVhAGiQflTXDpopTLBcLrg6OZNkKPZBTPH
 d84BKV1R84l8HlQnFWHnn2oSgtkuYlFxU/Wpw0tV6p1iyPVB41KbVfM+S6Y53XDJW+qB
 xg/bVS88pfGmi4d1Acznd9sJxat/u64ajlpeaJl/Q+TL2j6YkBkxEUBQ4i6jRc6JnaVM
 E1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SXHhgqW7n3NhX89cVkF3VrGqJiw1Llh1QL+MWctCWMI=;
 b=CLgEZEFbnqa99Tw3n4k1FjPAYSdNBbWQKnajcFqL+x76K9uyd666ATCQyi5xYpwfTR
 LcuSfnt1igU0D+pEt7tInJ3hzbqokPgSnOrE2H2HA42YsdIQ1OuENQA4PnnWAw5D/fRy
 0Jtw0oDVzf7qActR9hHBro+CR8alDGXjjHG4LBQ6XiWRTiZR+Jo89MDsOJqPI+H3QgnT
 RIX/Ui9coEXjjnLLz97BN3JoM1hdwexwWS4sFznafpjNxe3WoEj1sT2HpVQQvu/sT1aJ
 jtPbMWHJGmOhfMRx5c04Q81eRAtfAxXvJueJFjAGv9xBIUM274zdHhytCPdFUjp4H3pW
 xUwA==
X-Gm-Message-State: APjAAAWP8zGUIFPsYnaBQSuyVQ5rTdAZfIR1XU+09nTnvSR+ab24I0YO
 1Sd7vDFO0JB2Fdz4JJui0rQcmtC3PTb1xj/Xc8s=
X-Google-Smtp-Source: APXvYqwue5gAnkSSz0MaWl16UNYQGJy75aVrFqumX+BMjjAQBrI4OXk5kKBqZnOI9oKCInSRUmsgSTlGTfvcjXh/w3w=
X-Received: by 2002:a17:90a:98d:: with SMTP id
 13mr42342596pjo.102.1578304790607; 
 Mon, 06 Jan 2020 01:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-5-liuwe@microsoft.com>
In-Reply-To: <20200105164801.26278-5-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 6 Jan 2020 09:59:39 +0000
Message-ID: <CACCGGhA6LqUfwL3XrBfeWS+pm6_X4wwx0HVRjrwrQFhmmdLjTg@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/hyperv: retrieve vp_index from
 Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCA1IEphbiAyMDIwIGF0IDE2OjQ5LCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3cm90ZToK
Pgo+IFRoaXMgd2lsbCBiZSB1c2VmdWwgd2hlbiBpbnZva2luZyBoeXBlcmNhbGwgdGhhdCB0YXJn
ZXRzIHNwZWNpZmljCj4gdmNwdShzKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdl
QG1pY3Jvc29mdC5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+
Cgo+IC0tLQo+IHYyOgo+IDEuIEZvbGQgaW50byBzZXR1cF9wY3B1X2FyZyBmdW5jdGlvbgo+IC0t
LQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIHwgNSArKysrKwo+ICB4ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
di9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBpbmRleCA3
ZTA0NmRmYzA0Li5lNWYyNThjOTQ2IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvaHlwZXJ2LmMKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5j
Cj4gQEAgLTI4LDYgKzI4LDcgQEAgc3RydWN0IG1zX2h5cGVydl9pbmZvIF9fcmVhZF9tb3N0bHkg
bXNfaHlwZXJ2Owo+Cj4gIGV4dGVybiBjaGFyIGh2X2h5cGVyY2FsbF9wYWdlW107Cj4gIERFRklO
RV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOwo+ICtERUZJ
TkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKPgo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wczsKPiAgY29uc3Qgc3RydWN0IGh5
cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCj4gQEAgLTg3LDYgKzg4LDcg
QEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCj4gIHN0YXRp
YyB2b2lkIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQo+ICB7Cj4gICAgICB2b2lkICpt
YXBwaW5nOwo+ICsgICAgdWludDY0X3QgdnBfaW5kZXhfbXNyOwo+Cj4gICAgICBtYXBwaW5nID0g
YWxsb2NfeGVuaGVhcF9wYWdlKCk7Cj4gICAgICBpZiAoICFtYXBwaW5nICkKPiBAQCAtOTQsNiAr
OTYsOSBAQCBzdGF0aWMgdm9pZCBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcodm9pZCkKPiAgICAg
ICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+Cj4gICAgICB0aGlzX2NwdShodl9wY3B1
X2lucHV0X2FyZykgPSBtYXBwaW5nOwo+ICsKPiArICAgIHJkbXNybChIVl9YNjRfTVNSX1ZQX0lO
REVYLCB2cF9pbmRleF9tc3IpOwo+ICsgICAgdGhpc19jcHUoaHZfdnBfaW5kZXgpID0gdnBfaW5k
ZXhfbXNyOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQpCj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggYi94ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L2h5cGVydi5oCj4gaW5kZXggNmNmMmVhYjYyZi4uYmFlMDZjOGEzYSAxMDA2
NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAo+IEBAIC02Niw2ICs2Niw3IEBAIHN0cnVj
dCBtc19oeXBlcnZfaW5mbyB7Cj4gIGV4dGVybiBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlw
ZXJ2Owo+Cj4gIERFQ0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X3BjcHVfaW5wdXRfYXJnKTsKPiAr
REVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgaHZfdnBfaW5kZXgpOwo+Cj4gIGNvbnN0IHN0
cnVjdCBoeXBlcnZpc29yX29wcyAqaHlwZXJ2X3Byb2JlKHZvaWQpOwo+Cj4gLS0KPiAyLjIwLjEK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
