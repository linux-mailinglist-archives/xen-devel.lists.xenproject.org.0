Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868521432B4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 21:01:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itdCP-0008RO-Ip; Mon, 20 Jan 2020 19:59:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aT4h=3J=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1itdCO-0008RJ-87
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 19:59:00 +0000
X-Inumbo-ID: 4c1386ec-3bbf-11ea-8e9a-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c1386ec-3bbf-11ea-8e9a-bc764e2007e4;
 Mon, 20 Jan 2020 19:58:59 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z18so252815lfe.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 11:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JfzUMHwD13mly01zoUA+pODBFXsZXWoHKNwOtUllupc=;
 b=Dp7t3kF5CFOpUk+lComksxSdMmd67Q6l5liAAe2Ik4cOtEG/CdqU2SqBjg0HRe83fn
 JYgRZ1cNLmMBJ04+b9TjIpQBXnrG5F88cKwYt1Me0YLRbFIhrfxL1j3dWEyDn2Rw4Y5N
 y83/v11ZIYbauS9V3Cm8yt+0ohYzKLPJRIt0mkaZ9DjDR0QS+vrW3jnSQdbiWwFAxoP1
 b3i7S+Gmbp5zxyan7+0UJ+w5MITHGD22D8ixvzDtOZJ7hJhFPpzzyjhHeoywa6mwm1H1
 bUf5YPIOMYiI20k27QdopR4TJqxSKIpofBQ1qha2ZF7oHxYo26Q8Vy/hR4x9As/RszkL
 924A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JfzUMHwD13mly01zoUA+pODBFXsZXWoHKNwOtUllupc=;
 b=BqqO/Z1cecCf/+yiIS8ecw4mSYfqNuhesjKEOCJSeWR0OiJNBis46Mxy71JEBshTfT
 YahaJL7diybmtgHL+JehuFApcYmNrmdzNTE4CCAiTYGdUUuEVzLIXOaXJ/a4r4t/dLlQ
 cRPx5WqyB47PSuKLiuTZIXW/kEKck+R4LKqmc3btlH895Oul2XFkHDBRFvpwORmseGOm
 GRKtxMKXl0Gw5FD0obt1j29PmRICp8/aYeShtaxdcxIIBJYZu4477f1uxrVSKKilWXw+
 lfnjH2OiPuCRxXvJgJ/8RMQQGIMIP+6SEyjzR67wrDETl7ORzB/XYb0q6XAt2RGQL8yJ
 EMOA==
X-Gm-Message-State: APjAAAWOg/8ezTziE7gi382zOeItxWY0OqK0OM8qL1fwJHdgGtkbSTIn
 oGnLPZczEmR5DDDYwOCBJWtN3Xh3kCVhHw91FlA=
X-Google-Smtp-Source: APXvYqw+H0wiBE9utDnXqJ6zuXYWqXFiFGnKbjwNx8rt2kNStAsHKxJubAuYdsgEPlUivS6AnZfCIqyXpi0jI9Vjt/A=
X-Received: by 2002:a19:22cc:: with SMTP id i195mr491645lfi.148.1579550338568; 
 Mon, 20 Jan 2020 11:58:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <11435f88fd5802b4c7c0197794d9832bd87093d7.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <11435f88fd5802b4c7c0197794d9832bd87093d7.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Jan 2020 14:58:47 -0500
Message-ID: <CAKf6xpt-ezUTqagiFdCyBjys5NdH=YyhtFDRzH1vzUDwwD9bfw@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 10/16] tools: add missing libxenvchan
 cflags
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gbGlieGVudmNo
YW4uaCBpbmNsdWRlIHhlbmV2dGNobi5oIGFuZCB4ZW5nbnR0YWIuaCwgc28gYXBwbGljYXRpb25z
IGJ1aWx0Cj4gd2l0aCBpdCBuZWVkcyBhcHBsaWNhYmxlIC1JIGluIENGTEFHUyB0b28uCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlz
aWJsZXRoaW5nc2xhYi5jb20+CgpSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtA
Z21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
