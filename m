Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CC3143484
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 00:43:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itgeA-0001mD-4x; Mon, 20 Jan 2020 23:39:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JMHZ=3J=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1itge8-0001m8-GJ
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 23:39:52 +0000
X-Inumbo-ID: 2715d24a-3bde-11ea-9fd7-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2715d24a-3bde-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 23:39:51 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a13so788849ljm.10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 15:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kkD0X2gSmHnK/4LkL+ZYjh34c/uYh8bqT+o5NegCv48=;
 b=mEC2lVS5+UGsaH7j2Cl+Hwq5zsDdUtA59Nupgy2IchsU2fjP2BsX0nJo1x6f5KG53+
 +PZa5iogWOL3KlWeWoaePzeFi4oSePPJvmHWKIBWYeBntrzmKFnJaKRYKf9hB4gype2N
 WFgMSAU2fDEOGonq3jWj2dI+DhF5ozPDaJ/6Y3k3P9TUo34WN7qPjwN5noREXRXUMdEK
 J90keiKO2wPvReavvoYwfd9kZ5rM2g475UzeRpB5+kQVBK3ppTsNFK+o3gFz+0d2V9tO
 C+w3uX+K6vNtInMWA8BLgfZZXI/KKbXaNbx6yOLBNhVPgth6wD7jyGZADaA6B8EzbqNU
 wvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kkD0X2gSmHnK/4LkL+ZYjh34c/uYh8bqT+o5NegCv48=;
 b=WNzdVvJDnMkqFTXL9uJKdh1onFzEwqo0iqyx60uoipd/jFtLeMynDZ7FvtyPHp54Ks
 RSPf7+h6Msw9PyMVvhgq1kiGVB0l/QB/vlyevWW8P2TSZpnAvSoVTLtG7rXfdmdSLr72
 FCgIqN555oWEhEdrJx0ueJF82FcXkVX5iEhAXK9CF+3h31gvj5wrcvqO8YgtqrxKfyro
 JH72x8B/up0a+RYHhsMOnuM0IyUi5aViNzz3evD8/Ia0sG04NGeu3GrCTiezZ9n2U2s1
 5zr/XVHsA019mInRhmRo3Ch7mH1ZfVh2H8HPGoXr2czBlJXM4siCNhzLwNanx9yQghfT
 bZuw==
X-Gm-Message-State: APjAAAV3pl9Kxc1bm2mZnhpsgS4xc3VBmiU7tUzpxlk+bJorbuR9q0cG
 NorWbfKx7HZplgYWvp97nh16eR84LdC5KooESJI=
X-Google-Smtp-Source: APXvYqwbCW/SH0aAldWFCyIGmi+jAJm0LAlM3quNTrRLRUWaBkS+EAk2zndDiGJ7M791oUURgdKPZMozmMGb7QEBB6I=
X-Received: by 2002:a2e:b61a:: with SMTP id r26mr966255ljn.72.1579563590881;
 Mon, 20 Jan 2020 15:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
In-Reply-To: <20200117155734.1067550-1-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 20 Jan 2020 18:39:38 -0500
Message-ID: <CAEBZRSf071rPGwnCM5FCMn-gGPao4T0TJx4qvZug4iokF56p_Q@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 1/8] golang/xenlight: Don't try to
 marshall zero-length arrays in fromC
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
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IFNvcnJ5IEkgZGlkbid0IGNhdGNoIHRoaXMgdGhlIGZpcnN0IHRpbWUgYXJvdW5kLCBidXQ6Cgo+
IGRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28gYi90b29s
cy9nb2xhbmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28KPiBpbmRleCBiOWE3ZTgyOGEwLi44ODk4
MDdkOTI4IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9oZWxwZXJzLmdlbi5n
bwo+ICsrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9oZWxwZXJzLmdlbi5nbwo+IEBAIC02MjMs
MTIgKzYyMywxNCBAQCBmdW5jICh4ICpTY2hlZFBhcmFtcykgdG9DKHhjICpDLmxpYnhsX3NjaGVk
X3BhcmFtcykgKGVyciBlcnJvcikgewo+Cj4gIGZ1bmMgKHggKlZjcHVTY2hlZFBhcmFtcykgZnJv
bUMoeGMgKkMubGlieGxfdmNwdV9zY2hlZF9wYXJhbXMpIGVycm9yIHsKPiAgICAgICAgIHguU2No
ZWQgPSBTY2hlZHVsZXIoeGMuc2NoZWQpCj4gLSAgICAgICBudW1WY3B1cyA6PSBpbnQoeGMubnVt
X3ZjcHVzKQo+IC0gICAgICAgY1ZjcHVzIDo9ICgqWzEgPDwgMjhdQy5saWJ4bF9zY2hlZF9wYXJh
bXMpKHVuc2FmZS5Qb2ludGVyKHhjLnZjcHVzKSlbOm51bVZjcHVzOm51bVZjcHVzXQo+IC0gICAg
ICAgeC5WY3B1cyA9IG1ha2UoW11TY2hlZFBhcmFtcywgbnVtVmNwdXMpCj4gLSAgICAgICBmb3Ig
aSwgdiA6PSByYW5nZSBjVmNwdXMgewo+IC0gICAgICAgICAgICAgICBpZiBlcnIgOj0geC5WY3B1
c1tpXS5mcm9tQygmdik7IGVyciAhPSBuaWwgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBlcnIKPiArICAgICAgIHguVmNwdXMgPSBuaWwKPiArICAgICAgIGlmIG51bVZjcHVzIDo9
IGludCh4Yy5udW1fdmNwdXMpOyBudW1WY3B1cyA+IDAgewoKClNpbmNlIGBudW1YYCBpcyBub3cg
c2NvcGVkIHRvIHRoaXMgaWYgYmxvY2ssIHdlIGNvdWxkIHByb2JhYmx5IGp1c3QKdXNlIGBuYCBv
ciBzaW1pbGFyIGFuZCB0aGVuIGRyb3AgYGdvbGVudmFyYCBmcm9tCmB4ZW5saWdodF9nb2xhbmdf
YXJyYXlfZnJvbUNgLiBJdCB3b3VsZCByZW1vdmUgc29tZSBwcmV0dHkgdWdseQp2YXJpYWJsZSBu
YW1lcyBmcm9tIHRoZSBnZW5lcmF0ZWQgY29kZSA6KQoKLU5SCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
