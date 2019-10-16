Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD21D9352
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 16:07:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKjuu-0001qq-9m; Wed, 16 Oct 2019 14:04:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kVf2=YJ=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iKjus-0001ql-4t
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 14:04:42 +0000
X-Inumbo-ID: e5dd3e0a-f01d-11e9-beca-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5dd3e0a-f01d-11e9-beca-bc764e2007e4;
 Wed, 16 Oct 2019 14:04:41 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id w12so53880373iol.11
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2019 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O+oHlIjDGXxzdyZZSBjMgy4bnZAZUMNnYJ7ROklYBTk=;
 b=TWMr0b+HkIK7EHtI28rmJ6Su5ew2nG74eRNNwYhNKAoEgAcAwLdnkoUZiWkYsgMtSf
 K+7UwhaHc/XJkmiNP7Ocm3HT1kkFs7rhSTaL1nj1neUxJlI74eckmUKsRYEQYR6L5oIT
 0XlCFCjpIWEKC40IFFbBWXaaIiw31XY3dfu2MdUWga/l26A4JBdxXaDBtKoDhVkzlptn
 E0IlwYUxWbWwZWYzPQc45HFiVevrv63h8xP56gwa3jCrMtao/yDnJ85DnVozDzTWX3i6
 6ypT0Q2xewbfjAdMU1EHEtKnIg+j1W2xPVUZowgzv1GoTNulytQ3PnGLO+co+uW42qFl
 T1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+oHlIjDGXxzdyZZSBjMgy4bnZAZUMNnYJ7ROklYBTk=;
 b=BPFujfIdsmGaLjJqAQzc2wkuyzvwbQbFdhmJdb9xNoEKlPyuUT5J50cVpP9U+b8SD8
 ioRpSJ8NxxR1Jp/KrzzsrYJHtmwFhtR+eaRTsZgVvE5xgeeAzhwEbkH1fDuU1TyxIr0k
 4WCFhKQVPWtxD5RomAghAgSvH8KzgT28RmcTIXcqB4MrmL0z4/XAhqLY6eA3qCujkdxj
 WhP2STyiKCIm4Tg/y6MQMIajxtFYwmP4ZvCo8r+IBFwvmqfrIq3dzYSniwnitmVdS2y7
 M9D56LVgIX6LfYpCAyTI8t0hNKGFagz8lpCc81sY50FDPG+jgkbT3dNsBJrku5AsSDOT
 9u4w==
X-Gm-Message-State: APjAAAU32kV97jXmsCoIp036l6p1ITesLp3B/chHSC0qgKihMCwdv6Ch
 rWESh/rC0XmxT3sgND09Rx99vU8ITeWaCQ1vzbM=
X-Google-Smtp-Source: APXvYqwWpDCq+5m4p6AoTCdQ7afuYvOgT13E0GDBGIrD68yxMQ+xB3R2v6DhhDs6JijEKzCsP4+SUYjPCttNN3QSDJs=
X-Received: by 2002:a05:6602:1cc:: with SMTP id
 w12mr10202009iot.260.1571234680854; 
 Wed, 16 Oct 2019 07:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191010141231.25363-1-al1img@gmail.com>
 <23968.40555.917945.129929@mariner.uk.xensource.com>
 <8413c89d-3495-6407-f1a9-6eb9aff24e47@arm.com>
 <alpine.DEB.2.21.1910111017050.6326@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910111017050.6326@sstabellini-ThinkPad-T480s>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Wed, 16 Oct 2019 17:04:29 +0300
Message-ID: <CACvf2oWENPf27aqQdve6StQOBv_TitKF_HSxhqFTcfJtmkL6eg@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [XEN PATCH v1] libxl: Add DTB compatible list to
 config file
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
Cc: Iurii Konovalenko <iurii.konovalenko@globallogic.com>,
 "wl@xen.org" <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgODoyMSBQTSBTdGVmYW5vIFN0YWJlbGxpbmkKPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCAxMSBPY3QgMjAxOSwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gT24gMTEvMTAvMjAxOSAxNjoyMywgSWFuIEph
Y2tzb24gd3JvdGU6Cj4gPiA+IE9sZWtzYW5kciBHcnl0c292IHdyaXRlcyAoIltQQVRDSCB2MV0g
bGlieGw6IEFkZCBEVEIgY29tcGF0aWJsZSBsaXN0IHRvCj4gPiA+IGNvbmZpZyBmaWxlIik6Cj4g
PiA+ID4gRnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29t
Pgo+ID4gPiA+Cj4gPiA+ID4gU29tZSBwbGF0Zm9ybXMgbmVlZCBtb3JlIGNvbXBhdGlibGUgcHJv
cGVydHkgdmFsdWVzIGluIGRldmljZQo+ID4gPiA+IHRyZWUgcm9vdCBub2RlIGluIGFkZGl0aW9u
IHRvICJ4ZW4seGVudm0tJWQuJWQiIGFuZCAieGVuLHhlbnZtIgo+ID4gPiA+IHZhbHVlcyB0aGF0
IGFyZSBnaXZlbiBieSBYZW4gYnkgZGVmYXVsdC4KPiA+Cj4gPiBJIGFtIHByZXR0eSBzdXJlIEkg
aGF2ZSBzZWVuIHRoaXMgcGF0Y2ggYSBmZXcgeWVhcnMgYWdvLCBidXQgSSBjYW4ndCBmaW5kIGl0
Cj4gPiBpbiBteSBpbmJveC4gV2hhdCBpcyB0aGUgZXhhY3QgcHJvYmxlbSBoZXJlPwo+ID4KPiA+
ID4gPiBTcGVjaWZ5IGluIGRvbWFpbiBjb25maWd1cmF0aW9uIGZpbGUgd2hpY2ggdmFsdWVzIHNo
b3VsZCBiZSBhZGRlZAo+ID4gPiA+IGJ5IHByb3ZpZGluZyAiZHRiX2NvbXBhdGlibGUiIGxpc3Qg
b2Ygc3RyaW5ncyBzZXBhcmF0ZWQgYnkgY29tYXMuCj4gPiA+Cj4gPiA+IEhpLCB0aGFua3MuCj4g
PiA+Cj4gPiA+IEkgZG9uJ3QgaGF2ZSBhbiBvcGluaW9uIGFib3V0IHRoZSBwcmluY2lwbGUgb2Yg
dGhpcyBhbmQgd291bGQgbGlrZSB0bwo+ID4gPiBoZWFyIGZyb20gQVJNIGZvbGtzIGFib3V0IHRo
YXQuCj4gPiA+Cj4gPiA+IEFsc28sIFN0ZWZhbm8sIEp1bGllbjogc2hvdWxkIHdlIGJlIGFza2lu
ZyBmb3IgYSBmcmVlemUgZXhjZXB0aW9uIGZvcgo+ID4gPiB0aGlzIGZvciA0LjEzID8KPiA+Cj4g
PiBJIGRvbid0IGhhdmUgZW5vdWdoIGNvbnRleHQgdG8gdW5kZXJzdGFuZCB0aGUgZXhhY3QgaXNz
dWUgaGUgaXMgdHJ5aW5nIHRvCj4gPiBzb2x2ZS4KPgo+IFNhbWUgaGVyZS4gSXMgdGhpcyBwYXRj
aCBuZWVkZWQgYmVjYXVzZSBvbiBzb21lIHBsYXRmb3JtIHRoZSBPUyBjaGVja3MKPiBmb3IgdGhl
IHBsYXRmb3JtICJtb2RlbCIgKGFsc28ga25vd24gYXMgIm1hY2hpbmUgbmFtZSIpIG9uIGRldmlj
ZSB0cmVlCj4gYmVmb3JlIGNvbnRpbnVpbmcgb3IgdG8gdHJpZ2dlciBhIGRpZmZlcmVuY2UgYmVo
YXZpb3I/CgpZZXMsIGV4YWN0bHkuCgpJIHdpbGwgcmVkbyB0aGUgcGF0Y2ggd2l0aCBJYW4ncyBj
b21tZW50cyBpZiBpdCBpcyBvayBpbiBnZW5lcmFsLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
