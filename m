Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB785B48
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 09:10:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvcWZ-0001AY-4q; Thu, 08 Aug 2019 07:07:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u/LO=WE=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hvcWY-0001AP-1Z
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 07:07:46 +0000
X-Inumbo-ID: 38272d59-b9ab-11e9-8980-bc764e045a96
Received: from mail-ot1-x32b.google.com (unknown [2607:f8b0:4864:20::32b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38272d59-b9ab-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 07:07:44 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id j19so37965436otq.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=akc5+0vJE5tfkmAWkVw1pGR2CilbrWts+MiKHV7os5A=;
 b=O06jsYMeOPk87lDsnu3Ta9pJcm3mhERwtNBb5CrkaXcje8A8iSlqFJg/z2RX89IZsb
 /1fWFHW4Xdf/NZugxT4pW57hTh9Gy50U7JO96smz3eW+muVJtNlsO0Ir7lcLa0ful1Xw
 sM0NP2o9DfwCrJk3rN8t+H1c3c2eb/lX/rbhLgx9YqgCvIpjb+/ejeHoCE6KbLu8t+8F
 m0CWpUhbcddOokyl9AGTcJAjvy9JgsrCDdt3dChvAHpR7+ogP0Iv5bMGxwJAsS8CMK9e
 wcMEeZDgFNGamJYhRIfNKQ8m2/iMdF+fyl1XnTgr/RbxHRZjz2SR8d0DxmILNxmDi3+y
 y8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=akc5+0vJE5tfkmAWkVw1pGR2CilbrWts+MiKHV7os5A=;
 b=jRgyY0/BJ7z35Qc8DUC4Jws6DSt1uFFp8MnFTwJynr0qu5n5hQmVANY/lj+IBSbdnb
 OKvgNOhUKD1YiIk6kzYdaj9dqnuA5Pllcx8xdukM1l9ygBfpMZQUxmGce2jfFTy2Wk+8
 f056AAfRAntJaMH5vY6EQd0WJ8gDKyarlMmb0iPHLmbxIik6aKhCJG/+iuCBiUe9Pj1Q
 GEnkg75wMXWAlW6oVSVV1jh9TIuZh8lafGfT2VwIhAcIwMA4OnC03TlMxJPb0nYFOlRZ
 CFZN8IcERkJCtSh18J91Pj7LB1dy1XGrCG1ugIc+Lq8wrWObde46Wc5pLv2poqmVX/Op
 kJfA==
X-Gm-Message-State: APjAAAXkIOm4J9c9B8m0kV9DjDZgeKrWmIl93a0SnchROIuWlLDg4YTU
 ZhSbLdQ474ilU0N1k4i6Km5at7Oap/oi6eQ0DSY=
X-Google-Smtp-Source: APXvYqy+G6d9bSMKUTamApevrDBFKLs6jE6QMypTQRdSw/qJV4AFKkLAKeBkxahx7HAwC5RbkK8o2ORat/Gsg+2PrUU=
X-Received: by 2002:a02:c6a9:: with SMTP id o9mr15419378jan.90.1565248064051; 
 Thu, 08 Aug 2019 00:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
 <0d2ead7a-ad33-63c7-3749-dff571cb5296@suse.com>
 <b72cded3-5cdd-38db-b607-fbf98614ead5@arm.com>
 <a4b8c295-64aa-c4a1-acf0-8126c3094495@arm.com>
 <49846645-1D5F-463D-B699-05A9E242885C@citrix.com>
 <B5A8E35E-15F4-4997-B39E-896026FF5A90@citrix.com>
 <226B5CF5-704E-461A-A0DA-CF3DFEC86B9D@citrix.com>
 <CAOcoXZbC8BONGUgEOmWQN+5ZnSKa40xu6LNk7gWoE5Qs5Ed5=Q@mail.gmail.com>
 <7F24BEB4-B9CD-4020-BC40-6918123840E6@citrix.com>
In-Reply-To: <7F24BEB4-B9CD-4020-BC40-6918123840E6@citrix.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 8 Aug 2019 10:07:32 +0300
Message-ID: <CAOcoXZa+-NcV=0_hp6gyb-mf5VhA23WNcNRbb22VyyjyrL0+ow@mail.gmail.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] [RFC] Re-working the patch submission guide
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCA5OjQ1IEFNIExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0
cml4LmNvbT4gd3JvdGU6Cgo+ICAgICBPbiB0aGUgb25lIGhhbmQsIHRoZSB0ZXN0aW5nIHJlbGF0
ZXMgdG8gcGF0Y2hlcwo+ICAgICBzdWJtaXNzaW9uIChtZWFuIHBhdGNoZXMgc2hvdWxkIGJlIHRl
c3RlZCBiZWZvcmUgc3VibWlzc2lvbiBhbnl3YXkpLAo+ICAgICBidXQgb24gdGhlIG90aGVyIGhh
bmQsIHRlc3RpbmcgZGV0YWlscyBhcmUgbm90IGFib3V0IHRoZSBwYXRjaGVzCj4gICAgIHN1Ym1p
c3Npb24gcHJvY2Vzcy4gSW4gYW55IGNhc2UsIHdlIGRvIG5vdCBoYXZlIGFueSBleHBsaWNpdAo+
ICAgICBkb2N1bWVudGF0aW9uIGFib3V0IHBhdGNoZXMgdGVzdGluZyBmb3Igbm93LiBJcyBpdCBj
b3JyZWN0Pwo+Cj4gTm8sIG5vdCByZWFsbHkuCj4gT1NTVEVTVCBjYW4gYmUgcnVuIGxvY2FsbHkg
YnV0IGlzIGhhcmQgdG8gZG8KPiBYVEYgd291bGQgYmUgYSBnb29kIG9wdGlvbiwgYnV0IGRvZXMg
bm90IHdvcmsgb24gQXJtCgpXaGF0IGlzIFhURj8KT25lIG1vcmUgb3B0aW9uIGlzIHRvIHVzZSBR
ZW11IGZvciBYZW4geDg2IGFuZC9vciBBcm0gbWFudWFsL2F1dG9tYXRpYwp0ZXN0cy4gSXQgaXMg
bm90IGhhcmQgdG8gZG8sIGJ1dCBpdCBpcyBub3QgZG9jdW1lbnRlZCBleHBsaWNpdGx5IGZvcgpu
b3cuCgpUaGFua3MKCj4KPiAgICAgVGhhbmsgeW91IGFnYWluIGZvciBpbXByb3ZpbmcgWGVuIGRv
Y3VtZW50YXRpb24uCj4KPiBZb3UgYXJlIHdlbGNvbWUKPgo+IExhcnMKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
