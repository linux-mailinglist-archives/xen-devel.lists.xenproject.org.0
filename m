Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AFDB38E8
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:56:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9oeg-00048Q-SD; Mon, 16 Sep 2019 10:54:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDyh=XL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i9oee-00048J-UY
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:54:48 +0000
X-Inumbo-ID: 6596abf6-d870-11e9-95de-12813bfff9fa
Received: from mail-lj1-f194.google.com (unknown [209.85.208.194])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6596abf6-d870-11e9-95de-12813bfff9fa;
 Mon, 16 Sep 2019 10:54:47 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v24so5649545ljj.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 03:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pOqZUNWH2Ee+jJeP23pR2kI72Cp71bYCd2ng5a20jlM=;
 b=NLYVQiJh4v9ZbjgR82R44h2UG9Jnqav3/epP4GYhLj9tk78RaHFfy0cP0uwRRRmcn0
 ERj5UP+2FfP2jywK5PTNPf2cf0abwOuCS3MAaCS59oPMHw+4MvD3DnGF6rPxKYemd8Hn
 PaOEhW2s2GWVQi1bGmbkmBXMIqeLPnItlk/HbaPeIm4XnobpDu9UGZtwGzNsb0dOiS1G
 Qxaj9vyrL2jEDnbZFdEhvdUU+GMGyG7t1/AcuP1c7jx27T0jNLcRkAiOfXH4jj+TgeIO
 CNc+JTLwCNhawpE8Rt6IzZ2D0A7PKzdr/byB9YzD1qT9azP5727FTCghGFxZ5FDrcitz
 kjGA==
X-Gm-Message-State: APjAAAUPgJ1lwj/grn7YCal1PX/9MvZKRfdYBAwo998w0N+eGinCvNU1
 IlYTpLEgrE9Cqp1vh/Fvsn/JnzoNmw8=
X-Google-Smtp-Source: APXvYqxNKzfI+aVIumRrEefPTIwl9J8us3nGnFgN3iDEy1MjSdYBsDsdYaWddBy/ypsNy6CbStswBQ==
X-Received: by 2002:a05:651c:111c:: with SMTP id
 d28mr2231201ljo.138.1568631285916; 
 Mon, 16 Sep 2019 03:54:45 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id p27sm8874546lfo.95.2019.09.16.03.54.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2019 03:54:45 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id d5so33266004lja.10
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 03:54:45 -0700 (PDT)
X-Received: by 2002:a2e:b047:: with SMTP id d7mr37076379ljl.133.1568631285559; 
 Mon, 16 Sep 2019 03:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
 <2f61f30aa8d270212506542bda6cdf083a68c069.1568475323.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <2f61f30aa8d270212506542bda6cdf083a68c069.1568475323.git-series.marmarek@invisiblethingslab.com>
From: Wei Liu <wl@xen.org>
Date: Mon, 16 Sep 2019 11:54:29 +0100
X-Gmail-Original-Message-ID: <CAK9nU=qF6u7rmbkMoR4YxzfPhDKy9C3Fr2dyuKTMj7SOy1aSaA@mail.gmail.com>
Message-ID: <CAK9nU=qF6u7rmbkMoR4YxzfPhDKy9C3Fr2dyuKTMj7SOy1aSaA@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v6 6/6] tools/libxc: add wrapper for
 PHYSDEVOP_interrupt_control
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCAxNCBTZXAgMjAxOSBhdCAxNjozOCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
CjxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKPgo+IEFkZCBsaWJ4YyB3
cmFwcGVyIGZvciBQSFlTREVWT1BfaW50ZXJydXB0X2NvbnRyb2wgaW50cm9kdWNlZCBpbiBwcmV2
aW91cwo+IGNvbW1pdC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7Ny
ZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KClN1YmplY3QgdG8gYWNjZXB0
YW5jZSBvZiBlYXJsaWVyIHBhdGNoZXMuCgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
