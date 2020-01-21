Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A511445EA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 21:28:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu05G-0002CR-3j; Tue, 21 Jan 2020 20:25:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bw8Q=3K=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iu05E-0002CM-4d
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 20:25:08 +0000
X-Inumbo-ID: 1d044bca-3c8c-11ea-aecd-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d044bca-3c8c-11ea-aecd-bc764e2007e4;
 Tue, 21 Jan 2020 20:25:07 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id o11so3917913ljc.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 12:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wrD53ooYFV4TGab+zsq9rzoLWjVFsDk6/s4jo6mdwIE=;
 b=GubrtavBrmHuf8OPbsmcq1JYKaqd6+FgmWmYKAysmOBq9asPIDrxZ0eRVgaET1xyrc
 DGVNKtfbd3g6e4G1T4C84/nQnNLRC/g8E3wgfAYxjswXOTtpRpQu4IQkinQumBOcq5TM
 i6wm2hwqI+C2vUtySiOm/x+ne6tIzP5Nh8EIqma4veBhBXc9pbEbuKswbl7luPxzuQpc
 ozCxu2oAGuFCeZn6AIv/v6ZWPLqpfMxMxP02t3fENLNF3Z9+PH6f4ab7o6lnVUtZ4vRj
 FrZ4nJPhV2SmNETWnkGEdrl4qGd11aZ0/swlcvTGcTlFyeKdJtbECFbGKoN6DDukgTxj
 2wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wrD53ooYFV4TGab+zsq9rzoLWjVFsDk6/s4jo6mdwIE=;
 b=KT79oeqbIPb6hjAat3NzzNpqTytZoBMPUJdeJ/sfrV0jhcZ6XaWZMQVdXfjvcmoUtY
 XysjnH114THPfP2FaeTNxIx1AjY2mBbW7Fx1mrGlFZz5TrRTHOEh8amNCyIL2jfpsOTv
 5mWF17DQ3b2NEkJK5RGz+fp0OkIA8YUxhTvdhqYd/Or8hYqPiG4y0gAbhLO048v/610f
 ZwQ18M/ZXiGCA+2jE205Y6DzFrgwZVsFieCjlPEN6Z1uGgbx8F4ChwueGenACVxAPIZC
 f3lh41WTSNEBjNc+a6kIFNGCV9I+V3T3lIgJN/hZfDiSWpVxdyrUePQMqQOW5T4iUYvl
 HfWg==
X-Gm-Message-State: APjAAAVe2v2VI/YBQwssfEJidt9/Kf3FTnsIHABF3gQqwJWRSiB0087A
 Cj0e031C81ditoa2FJc/k5Pk5nve1nirEUhV+yE=
X-Google-Smtp-Source: APXvYqwFqTDD4064I12Jr0OKF6+U7TwW1n36de/L6ZrYcpug795KZxz/8tPhpS7AFWb+AAYudjJ+4op5YFGXTgK6tcc=
X-Received: by 2002:a2e:9cd2:: with SMTP id g18mr15092057ljj.272.1579638306372; 
 Tue, 21 Jan 2020 12:25:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <80cc023087afee3c37d68f18af258eba5dc75584.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <80cc023087afee3c37d68f18af258eba5dc75584.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 21 Jan 2020 15:24:55 -0500
Message-ID: <CAKf6xpsL8J_y3YuFMgeG4uYFGjv21Nsi4HBs890vedmLYxtnzQ@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 15/16] libxl: ignore emulated IDE disks
 beyond the first 4
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gUWVtdSBzdXBw
b3J0cyBvbmx5IDQgZW11bGF0ZWQgSURFIGRpc2tzLCB3aGVuIGdpdmVuIG1vcmUgKG9yIHdpdGgg
aGlnaGVyCj4gaW5kZXhlcyksIGl0IHdpbGwgZmFpbCB0byBzdGFydC4gU2luY2UgdGhlIGRpc2tz
IGNhbiBzdGlsbCBiZSBhY2Nlc3NpYmxlCj4gdXNpbmcgUFYgaW50ZXJmYWNlLCBqdXN0IGlnbm9y
ZSBlbXVsYXRlZCBwYXRoIGFuZCBsb2cgYSB3YXJuaW5nLCBpbnN0ZWFkCj4gb2YgcmVqZWN0aW5n
IHRoZSBjb25maWd1cmF0aW9uIGFsdG9nZXRoZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBN
YXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CgpS
ZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
