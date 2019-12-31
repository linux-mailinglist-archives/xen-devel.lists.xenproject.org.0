Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0C312DA32
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 17:13:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imK5R-0001a0-Or; Tue, 31 Dec 2019 16:09:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n71l=2V=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1imK5Q-0001Zu-Kr
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 16:09:36 +0000
X-Inumbo-ID: eb0f9386-2be7-11ea-88e7-bc764e2007e4
Received: from mail-lj1-f180.google.com (unknown [209.85.208.180])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb0f9386-2be7-11ea-88e7-bc764e2007e4;
 Tue, 31 Dec 2019 16:09:27 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id a13so36695278ljm.10
 for <xen-devel@lists.xenproject.org>; Tue, 31 Dec 2019 08:09:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SOjt3sLStxvcUo5NohFr0QDbudOTnfU7WXtQMXdplC4=;
 b=NvcJ5UG/7WMdOrMmQwzjAkz8/boRWAHGHo5fIqvo7X6ngFamIFmq5jTmLPaqCdXcDB
 X7+Nv5YT8n1XUiZv2IfMWCTEz8LP/+0g+WQu9LV/byb3YPBsvDJ1uJmD/mesISesyHDg
 ayxTYpU48el36ozYZc6nCqp/QsIatT1imfLw9yIvlCNsHOa3/+NwqLU5cvEjs9nbAgxH
 Y0PxQrUYY3nXY/qiQev7Idzwpn6kq/aE6HhDppTTxhFNzqFoA9tkaF7cU47QzwuPOXoR
 ajxeRlz1U39FvsC8WFpRHtjJ849DMl3PeqtfvkAc/1qtJFDzmsZu61+iiul+Sym5VP5g
 WqEA==
X-Gm-Message-State: APjAAAXV42p3SFmfFnRYGekSRd45UOgLxN0aysKGC5gzAT2m9m7UkC3V
 wde16l42CZat8LjdgzR+BBPQFTcY4i4=
X-Google-Smtp-Source: APXvYqy55DqI8eCtev/xXM2R/lOt+WvWU6/c9ERDHSbs+7dA0gf563IcTaGbljn/ovVKOJ4c0uqJQA==
X-Received: by 2002:a2e:9cc:: with SMTP id 195mr41326582ljj.130.1577808566346; 
 Tue, 31 Dec 2019 08:09:26 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id q13sm14549836ljm.68.2019.12.31.08.09.25
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2019 08:09:26 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id y4so22353552ljj.9
 for <xen-devel@lists.xenproject.org>; Tue, 31 Dec 2019 08:09:25 -0800 (PST)
X-Received: by 2002:a2e:8145:: with SMTP id t5mr43397493ljg.144.1577808565768; 
 Tue, 31 Dec 2019 08:09:25 -0800 (PST)
MIME-Version: 1.0
References: <CAK9nU=p6vCHsq2aGs4NND=qdRHekPLWoxwULP7-iY1d7JsSbWg@mail.gmail.com>
In-Reply-To: <CAK9nU=p6vCHsq2aGs4NND=qdRHekPLWoxwULP7-iY1d7JsSbWg@mail.gmail.com>
From: Wei Liu <wl@xen.org>
Date: Tue, 31 Dec 2019 16:09:09 +0000
X-Gmail-Original-Message-ID: <CAK9nU=rpLSrUgoyEjPw5MfuOzkC+=9R74Bch4yA2jv1FLWVtcQ@mail.gmail.com>
Message-ID: <CAK9nU=rpLSrUgoyEjPw5MfuOzkC+=9R74Bch4yA2jv1FLWVtcQ@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] Proxying Hyper-V hypercalls from L2 to L0
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <liuwe@microsoft.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAzMCBEZWMgMjAxOSBhdCAxNjoyNCwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBIaSBhbGwKPgo+IEFzIG11Y2ggYXMgSSB0cnkgdG8gYXZvaWQgd3JpdGluZyBjb2RlIHRv
IHByb3h5IEh5cGVyLVYgaHlwZXJjYWxscywgaXQKPiBzZWVtcyB1bmF2b2lkYWJsZSBmb3IgUFYg
Z3Vlc3RzLCBiZWNhdXNlIEh5cGVyLVYgcmVxdWlyZXMgaHlwZXJjYWxscwo+IHRvIGJlIGlzc3Vl
ZCB3aXRoIENQTD0wLgo+Cj4gVGhpcyBtZWFucyBmb3IgUFYgRG9tMCBJIHdpbGwgbmVlZCB0byBh
ZGQgY29kZSBpbiBYZW4gdG8gc3VwcG9ydAo+IEh5cGVyLVYncyBBQklzLCBhbG9uZyB3aXRoIGFw
cHJvcHJpYXRlIHZhbGlkYXRpb25zLgo+Cj4gSG93IG11Y2ggZG8geW91IGNhcmUgYWJvdXQgcnVu
bmluZyBhIFBWIERvbTAgaW4gdGhpcyBYZW4gb24gSHlwZXItVgo+IHNldHVwPyBJIHBlcnNvbmFs
bHkgd291bGQgY2VydGFpbmx5IGdvIGZ1bGwgb24gUFZIIGlmIHBvc3NpYmxlLiA6LSkKPgoKSSB0
ZXN0ZWQgUFZIIERvbTAgaW4gWGVuIG9uIEh5cGVyLVYgc2V0dXAganVzdCBub3cuIFVuZm9ydHVu
YXRlbHkKSHlwZXItViBkb2Vzbid0IHN1cHBvcnQgdklPTU1VIHlldC4gRG9tMCBkaWRuJ3QgZ2V0
IGFueSBpbnRlcnJ1cHQgaW4KdGhhdCBzZXR1cC4KCkkgZ3Vlc3MgbGlrZSBpdCBvciBub3QgaW4g
dGhlIHNob3J0IHRlcm0gSSB3aWxsIGhhdmUgdG8gbWFrZSBQViBEb20wIHdvcmsuCgpXZWkuCgoK
PiBUaGFua3MsCj4gV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
