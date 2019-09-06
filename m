Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993BAB96A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:38:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6EP1-0003RP-5Q; Fri, 06 Sep 2019 13:35:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tn+y=XB=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1i6EOz-0003RH-GS
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:35:49 +0000
X-Inumbo-ID: 3c483e76-d0ab-11e9-b299-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c483e76-d0ab-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 13:35:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y23so5696273ljn.5
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2019 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xs44Y9C5kY9tV3QgTmhRhvweKEdDbOReR13zxyIFFm4=;
 b=P+wdYOXpehdroAADXmlcuh1eKFwYQnN9366FZu4R1fvFkm0lVI+c7zFRMrez/myy5J
 pK+j9uFHU1sR2CyMU8GF6RDjY6C5oRSviR+jOYAkCVKEwx3oBEoAiBW/nuJJnz4QhL9U
 jMaHsJfoXNhassZc0ZQ3K/s4tt4XTdh1E3/oNqSxEUJAa50xZDVRscWWRdkaryc2FdvH
 9nJEZ0TSssBVBeIwazelGPD3TXqdYEFK7pzqeOXqWYx0pDIKalCZr9tlGEbw1q0WpqeT
 YOjoXWtjJ6vELErSJukfsrO5hMk/TH1mq/2XNc1bNVOvbLXJUOIAQ78A23RPEMDppzTS
 CiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xs44Y9C5kY9tV3QgTmhRhvweKEdDbOReR13zxyIFFm4=;
 b=PGW+a8bOEHg8mN4vVWEZStHzkrl6oTcVzUSIErMiKvDGH8BVtLhmmgcpjDSBbPr94g
 n+CjG4ogmUmdliy8qMf1K6qyTPBcL404bbh2w4xJ24QGoe2Q7yzKMZ8Gmbo2So0V4ukv
 uLupNacZOnkRJRKg/rj3KTYxzh0R/GhLLRfq83fJjmraGsRZJ+TtS1/qyroQ5u4elPsd
 zh6s0QqFEic90UVVpS1uT4Hg46m/cCgc2mPkd35b3CBTvQL2FKtrgEX5t4aoWtrL5isD
 mpd/U6Ur3FeoOpBVJvSQ5VL+iC5gq4bscObR3ibDKalfKsSHOe9JfQcJazvnBMO8mvnG
 p5Kg==
X-Gm-Message-State: APjAAAVnK6d5SwTwRtLLQ4Eblf+QFoav0eq1ETdTuWdBt+ZaIb8BDY/D
 Kfx8iVKOV/JplSs3QR7UeGjHvhR59ZoCwGy445I=
X-Google-Smtp-Source: APXvYqzxJ7WXxHJ/RpsvAOAd7PcptKpBh+T3mH0KMZgK4eRb/w+5tXb58u023SExLR7cXWypmkkwfEQ8EMhzxlF2a9o=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr5760872ljh.104.1567776947696; 
 Fri, 06 Sep 2019 06:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <1567413598-4477-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6zYkFk55gzmfwMFzpWiOp0xP3DXdmWyO2Ce8+mqYW12SNw@mail.gmail.com>
 <61bd1ea6-10b7-a1ee-fd79-327abf09fd73@oracle.com>
In-Reply-To: <61bd1ea6-10b7-a1ee-fd79-327abf09fd73@oracle.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 6 Sep 2019 19:05:36 +0530
Message-ID: <CAFqt6zZeenG495uAL09zXxTW+OeUrRzY+8eWd8CSzsu=xOZ2_A@mail.gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [Xen-devel] [PATCH v2] swiotlb-xen: Convert to use macro
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
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org,
 konrad.wilk@oracle.com, Sabyasachi Gupta <sabyasachi.linux@gmail.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgNiwgMjAxOSBhdCA3OjAyIFBNIEJvcmlzIE9zdHJvdnNreQo8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gT24gOS82LzE5IDg6MjcgQU0sIFNvdXB0aWNr
IEpvYXJkZXIgd3JvdGU6Cj4gPiBPbiBNb24sIFNlcCAyLCAyMDE5IGF0IDI6MDQgUE0gU291cHRp
Y2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+IFJhdGhlciB0aGFu
IHVzaW5nIHN0YXRpYyBpbnQgbWF4X2RtYV9iaXRzLCB0aGlzCj4gPj4gY2FuIGJlIGNvdmVydGVk
IHRvIHVzZSBhcyBtYWNyby4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJk
ZXIgPGpyZHIubGludXhAZ21haWwuY29tPgo+ID4+IFJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4gPiBJZiBpdCBpcyBzdGlsbCBub3QgbGF0ZSwgY2FuIHdlIGdl
dCB0aGlzIHBhdGNoIGluIHF1ZXVlIGZvciA1LjQgPwo+Cj4KPiBZZXMsIEkgd2lsbCBxdWV1ZSBp
dCBsYXRlciB0b2RheS4KClRoYW5rcyBCb3Jpcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
