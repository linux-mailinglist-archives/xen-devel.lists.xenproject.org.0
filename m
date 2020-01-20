Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7305A143183
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 19:34:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itbou-0001DC-F5; Mon, 20 Jan 2020 18:30:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aT4h=3J=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1itbot-0001D7-8h
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 18:30:39 +0000
X-Inumbo-ID: f461373e-3bb2-11ea-aecd-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f461373e-3bb2-11ea-aecd-bc764e2007e4;
 Mon, 20 Jan 2020 18:30:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a13so106372ljm.10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 10:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ho6Q7YRV3O3bl3vYzygqKkj4nmKf42DSWMxuHiggIhY=;
 b=RSHhOKoL3YjUMKDVyGG8Iz2Gxj8gFZf+7wIgUMWPhYsffNjcWh4IPKs+pv7ytCYdiI
 rP/MCX/7MVyV31LsPevIBTQqv+fjDn+bmk5UxILqqI+o4ecadDvsvm8qFyz+JfBpXF3F
 1PGJO9WEMtGAZ4UzLKzDCL4i4iWIZCnyjHmQzoqCSMcSV0pfqgVDPHV5pXNuGLJpsWcH
 eClfVh95RGz+SHjNZlnCIqHvpPzdyfuv8b1/ngb8ct9os9+nrxOBhgeDm6m2B/e2jedg
 9LM5p9QEPnwUXN6Hm11GGcxP8x6W5nqCxH8ZxlnHC+ImCdevhF2FVNGnRoSgKAn4j3wA
 TgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ho6Q7YRV3O3bl3vYzygqKkj4nmKf42DSWMxuHiggIhY=;
 b=Z2DE7UpclZl/Oz+8yglSaM2Rn7CKwyadJd7aVMDRRx9MaaDRmJfpwvO0hRieO8rSXv
 bvOSc9euI+bvZxxCNW8XTgLXCqkqRKzoFcNbRh5tLG39+p60MiYFVvDuR3dBHn6ix2OB
 KmKhvJYPGsvkY+SSjbUpz7NAcF94meUSbnejTYG1/JV24ng9mX++cwOuUIEnmHOgHE3G
 jiVCxCq1jXY72jdYTMw/yd8cmy3BGAsJrN8x1fo4ER0FRmb98ZgbbVQPBphMjfzk+DSo
 BPysoV34OyDKUT6qbzxPcVyVDpu/LIVYBf4g8uMJnJy5TCA2QPdnJG+Az49HNa/NjYvf
 SG7w==
X-Gm-Message-State: APjAAAVzcc4NmfgD5+h0oIGR/Po4m1muvzp3gEKlRHr9RSqywYaHx9E+
 0lCG9ZBUWcEMCJCMMtgg/c31MiOf4b3fTVTdFSY=
X-Google-Smtp-Source: APXvYqzqAPt4/O4klpgabdOQCM50rhtAG28Fo789zf0vqO/IHY/62LkR94WwJJqR/Xzjs1FLcIEOJFpxpffULUOwOFQ=
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr14373699ljj.102.1579545037464; 
 Mon, 20 Jan 2020 10:30:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <901ff35e0410fe9b871169383984f1e48850a836.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <901ff35e0410fe9b871169383984f1e48850a836.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Jan 2020 13:30:26 -0500
Message-ID: <CAKf6xpvZAmAY1DAoUqbGfhkUgL4NWjP65qkVtkpKdk4YHn73ZA@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 01/16] Document ioemu MiniOS stubdomain
 protocol
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MSBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gQWRkIGRvY3Vt
ZW50YXRpb24gYmFzZWQgb24gcmV2ZXJzZS1lbmdpbmVlcmVkIHRvb2xzdGFjay1pb2VtdSBzdHVi
ZG9tYWluCj4gcHJvdG9jb2wuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gLS0tCj4gIGRvY3Mv
bWlzYy9zdHViZG9tLnR4dCB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RvY3MvbWlzYy9zdHViZG9tLnR4dCBiL2RvY3MvbWlzYy9zdHViZG9tLnR4dAo+IGlu
ZGV4IGRlN2I2YzcuLjRjNTI0ZjIgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9taXNjL3N0dWJkb20udHh0
Cj4gKysrIGIvZG9jcy9taXNjL3N0dWJkb20udHh0Cj4gQEAgLTIzLDYgKzIzLDU5IEBAIGFuZCBo
dHRwOi8vd2lraS54ZW4ub3JnL3dpa2kvRGV2aWNlX01vZGVsX1N0dWJfRG9tYWlucyBmb3IgbW9y
ZQoKPHNuaXA+Cgo+ICtTdGFydHVwOgo+ICsxLiBQViBzdHViZG9tYWluIGlzIHN0YXJ0ZWQgd2l0
aCBpb2VtdS1zdHViZG9tLmd6IGtlcm5lbCBhbmQgbm8gaW5pdHJkCj4gKzIuIHN0dWJkb21haW4g
aW5pdGlhbGl6ZSByZWxldmFudCBkZXZpY2VzCj4gKzIuIHN0dWJkb21hIHNpZ25hbCByZWFkaW5l
c3MgYnkgd3JpdGluZyAicnVubmluZyIgdG8gL2xvY2FsL2RvbWFpbi88c3R1YmRvbS1pZD4vZGV2
aWNlLW1vZGVsLzx0YXJnZXQtaWQ+L3N0YXRlIHhlbnN0b3JlIHBhdGgKCnMvc3R1YmRvbWEvc3R1
YmRvbWFpbi8KCk51bWJlcmluZyBpcyBvZmYgLSAyIGlzIGR1cGxpY2F0ZWQuCgo+ICszLiBub3cg
c3R1YmRvbWFpbiBpcyBjb25zaWRlcmVkIHJ1bm5pbmcKCkknbSBub3QgZmFtaWxpYXIgd2l0aCBt
aW5pLW9zIHN0dWJkb20gdG8gcmV2aWV3IHRoZSBjb250ZW50IHlvdSd2ZSB3cml0dGVuLgoKUmVn
YXJkcywKSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
