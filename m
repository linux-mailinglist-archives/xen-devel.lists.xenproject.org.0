Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED71764CF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 21:20:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8rVI-0001cA-AY; Mon, 02 Mar 2020 20:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hq1L=4T=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1j8rVG-0001c5-NC
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 20:17:26 +0000
X-Inumbo-ID: d4e9237c-5cc2-11ea-af73-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4e9237c-5cc2-11ea-af73-bc764e2007e4;
 Mon, 02 Mar 2020 20:17:26 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c20so678006lfb.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2020 12:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CkLPB+WYTx1TStPa0MBXesZv086raRKPlXXuiA8XtMU=;
 b=WgQUOZ+ItaT018JOTscBEx+rGX8gc+rEGl/DyIaKiwV8Vre6Y4GF8Xozm+nBK7kusG
 Fan4LApGTXLUr8AbfqmL26axUS0sck4K0LPL/gEnHh0sl21nQK98b+sMY+pt5Z8edkOO
 2ryTYLVouomQksi/1SEbJsZcIEskYzuh+9VxFN2Sdytmoq/vu/+sJRJpr2/usBzcWVvh
 YgQiKqDKTUnJKAmCiREBtELYy4LM0oDuOwciOIpmiBuNovgP6Z4JEOlgt6MoW4wzFJyH
 RKJSrwYDk2opWz2XYkWyAJq+6/IW2amfAQq2MyydSfFZamWW6NJYbx8xfxTAauG4e8FU
 ENgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CkLPB+WYTx1TStPa0MBXesZv086raRKPlXXuiA8XtMU=;
 b=tsD3JD8Fp1IsBDifbYcxkkS9qQNVezPNg3xKze2cNPEFhdheI/fU1NIl1CkZPcqtPl
 Ss5m50aAzoyl+O9najvyxiwj/z0Lb0q6EqULQgao/g4JaLYSOQTn56cFsvrR3cfRbxUW
 Xfd3KWdNubF5pN7L/y5ObrlJ1h/BLHfMw/M3tPJRxFZUN3fovm6UprgJb7u1I+QkoyAI
 S70YPCXO5hCxakhZUdxOb5I1P1zWj3CGO2WuUzl2SB5m2SMGXsLPKF+qUZhPUUGNNlW1
 YEDGr0HkMuFXWZ5iR+RUGKljxVaQtN1W+e+Rz6qWoKQigUZyHP2UdEGtTrWfy5ycrkLu
 GT0g==
X-Gm-Message-State: ANhLgQ0DhjAz0W7UqsKJf1aC1t6Cx0dvbRT4NRBLlMLv7DJvLPCgAVKK
 BP+DX6BlCd5S4gux/GmzmrrHJLFnBBjVD5K5Ief2RQ==
X-Google-Smtp-Source: ADFU+vtNd+hMMAn6+gkO5dvBuFPWUJ2Qzfp5J22nzriJt6KboLyQSbFpg4HGN1QLQs8VAhFX5A0lwmjZTwnqiNEbFF0=
X-Received: by 2002:ac2:5046:: with SMTP id a6mr475210lfm.191.1583180244468;
 Mon, 02 Mar 2020 12:17:24 -0800 (PST)
MIME-Version: 1.0
References: <d9916032f6214e57caaac1d7a4b8afcf1723ad08.1583179824.git.rosbrookn@ainfosec.com>
In-Reply-To: <d9916032f6214e57caaac1d7a4b8afcf1723ad08.1583179824.git.rosbrookn@ainfosec.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 2 Mar 2020 15:17:13 -0500
Message-ID: <CAEBZRSdRJ_LsRFs73VwiZO1s5B3ii35XiWfFxSRf1eEQER7v1w@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [PATCH v2] golang/xenlight: implement constructor
 generation
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBHZW5lcmF0ZSBjb25zdHJ1Y3RvcnMgZm9yIGdlbmVyYXRlZCBHbyB0eXBlcy4gQ2FsbCBsaWJ4
bF88dHlwZT5faW5pdCBzbwo+IHRoZSBHbyB0eXBlIGNhbiBiZSBwcm9wZXJseSBpbml0aWFsaXpl
ZC4KPgo+IElmIGEgdHlwZSBoYXMgYSBrZXllZCB1bmlvbiBmaWVsZCwgYWRkIGEgcGFyYW1ldGVy
IHRvIHRoZSBmdW5jdGlvbgo+IHNpZ25hdHVyZSB0byBzZXQgdGhlIGtleSB2YXJpYWJsZSwgYW5k
IGNhbGwgdGhlIGluaXQgZnVuY3Rpb24gZm9yIHRoZQo+IGtleWVkIHVuaW9uLgo+Cj4gU2lnbmVk
LW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCk5vdGUgdGhh
dCB0aGlzIGlzIHJlYWxseSBhIHJlc2VuZCwgYnV0IGFmdGVyIEkgc2VudCB0aGlzIHBhdGNoIHRo
ZQpmaXJzdCB0aW1lIEkgcmVhbGl6ZWQgSSBmb3Jnb3QgdG8gYWRkIHRoZSBkaXNwb3NlKCkgY2Fs
bHMuIFNvLCBJCm1hcmtlZCB0aGlzIGFzIHYyIHdpdGggdGhhdCBjaGFuZ2UuCgpUaGFua3MsCk5S
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
