Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD26118513
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:28:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iechX-0008Dx-2G; Tue, 10 Dec 2019 10:25:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUzY=2A=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1iechV-0008Dr-Ny
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:25:05 +0000
X-Inumbo-ID: 548ff308-1b37-11ea-88e7-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 548ff308-1b37-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 10:25:05 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 9so13246177lfq.10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 02:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lg4AhAvPA2MW169lce5BVlmxb20DdD9akZ2hhy6ig3k=;
 b=FTiCBLotYFjh03wZj4knhcl8BMXBmq0zAi457bVRqn+6sc7GAOVzCj32SSKhUowk39
 S2ANnGVWu8HiwFveq4v/GT0it5Jv4Sm4Cw6YEYYjHIIv8z7ODCH/ONDyFYw3xryCuAJx
 KZNz8eUOyKp6173vQJSbNSQBI9U/u21/q8DFVvBcwNBb12hms38D6VYBJCbD0jSNolt9
 jCXg1kUrfpkD6fKz2WZJx/jLc7gy95Q5tA6mzMa4JIjleJzOzbloLczSC9mpyBblRcqo
 Gi4UxaDIVKn3aCRl/AmTyYrihS+4IqTCcCKpw8yEikIu4P77/3qmXdEVvWfES4cf7SUP
 PR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lg4AhAvPA2MW169lce5BVlmxb20DdD9akZ2hhy6ig3k=;
 b=Ur5PdFfNqFNoGx1c39SbqtH9meFrC2TExhL0fh19i+2W870g8TRVi8sItCATxLT+la
 CXviBxrM9G5FBdx6KmLihr/iDgoDGI9EK/Y2TpZfpFRQjbkukplf/S+71mmlkSKxuK7A
 ecNrssh+G+QIYSBDmRM8BIX31PIHQXokWNHtDl0npOMU4WJrbtaUi4tGlsSE2d4Cdbx/
 289Xgdaat6jwftXfCKaQIpQKo9EsDbgK4uOErf+ARzXasQM9AJ4DNWE0KM07IVoOPeug
 6lZK5Y9Haw+Qp+oaY2YpTK4br+lvvHU4F+n9Rh1gZeWle+QnM8SqQ3nabj3FcxnBTBkv
 07wg==
X-Gm-Message-State: APjAAAXKRRu2Ed/BWL3rv9IiRXl2ahcZEQZGwuHldZXgEGG7VKLD9rRR
 hLXIn0gHEc2ode64QKYuBuZPf1YXzUQYM4OcoL4=
X-Google-Smtp-Source: APXvYqzJ1n85YcM5EF1ZvSd+1TmfnkyzXyHPP1Je/JBYVDcQHyXtbVJXSpCo0J5NP1ZNn5s9enJ5G9jr2beZsSr+XS8=
X-Received: by 2002:a19:6a06:: with SMTP id u6mr14474371lfu.187.1575973503519; 
 Tue, 10 Dec 2019 02:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20191210080628.5264-1-sjpark@amazon.de>
 <20191210080628.5264-2-sjpark@amazon.de>
 <20191210101635.GD980@Air-de-Roger> <20191210102023.GF980@Air-de-Roger>
In-Reply-To: <20191210102023.GF980@Air-de-Roger>
From: SeongJae Park <sj38.park@gmail.com>
Date: Tue, 10 Dec 2019 11:24:37 +0100
Message-ID: <CAEjAshqsdjANuZDJwUnTgh3FBnhN-fp6T7-oN0hZKq8uHMDWhA@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v5 1/2] xenbus/backend: Add memory pressure
 handler callback
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
Cc: Jens Axboe <axboe@kernel.dk>, SeongJae Park <sjpark@amazon.com>,
 konrad.wilk@oracle.com, pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMTE6MjEgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMTE6MTY6
MzVBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIFR1ZSwgRGVjIDEwLCAy
MDE5IGF0IDA4OjA2OjI3QU0gKzAwMDAsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3hlbi94ZW5idXMuaCBiL2luY2x1ZGUveGVuL3hlbmJ1cy5oCj4gPiA+
IGluZGV4IDg2OWM4MTZkNWY4Yy4uY2RiMDc1ZTQxODJmIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNs
dWRlL3hlbi94ZW5idXMuaAo+ID4gPiArKysgYi9pbmNsdWRlL3hlbi94ZW5idXMuaAo+ID4gPiBA
QCAtMTA0LDYgKzEwNCw3IEBAIHN0cnVjdCB4ZW5idXNfZHJpdmVyIHsKPiA+ID4gICAgIHN0cnVj
dCBkZXZpY2VfZHJpdmVyIGRyaXZlcjsKPiA+ID4gICAgIGludCAoKnJlYWRfb3RoZXJlbmRfZGV0
YWlscykoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7Cj4gPiA+ICAgICBpbnQgKCppc19yZWFk
eSkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7Cj4gPiA+ICsgICB1bnNpZ25lZCAoKnJlY2xh
aW0pKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpOwo+ID4KPiA+IC4uLiBoZW5jZSBJIHdvbmRl
ciB3aHkgaXQncyByZXR1cm5pbmcgYW4gdW5zaWduZWQgd2hlbiBpdCdzIGp1c3QKPiA+IGlnbm9y
ZWQuCj4gPgo+ID4gSU1PIGl0IHNob3VsZCByZXR1cm4gYW4gaW50IHRvIHNpZ25hbCBlcnJvcnMs
IGFuZCB0aGUgcmV0dXJuIHNob3VsZCBiZQo+ID4gaWdub3JlZC4KPgo+IE1lYW50IHRvIHdyaXRl
ICdzaG91bGRuJ3QgYmUgaWdub3JlZCcgc29ycnkuCgpUaGFua3MgZm9yIGdvb2Qgb3BpbmlvbnMg
YW5kIGNvbW1lbnRzISAgSSB3aWxsIGFwcGx5IHlvdXIgY29tbWVudHMgaW4gdGhlIG5leHQKdmVy
c2lvbi4KCgpUaGFua3MsClNlb25nSmFlIFBhcmsKCj4KPiBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
