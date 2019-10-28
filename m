Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C84DE6C6D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 07:28:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOySz-0004fm-5f; Mon, 28 Oct 2019 06:25:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PCv5=YV=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1iOySy-0004fh-5N
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 06:25:24 +0000
X-Inumbo-ID: b8419d42-f94b-11e9-beca-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8419d42-f94b-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 06:25:22 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f4so886221lfk.7
 for <xen-devel@lists.xenproject.org>; Sun, 27 Oct 2019 23:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=U5RAXoFel6JiFEul8P59gVQ3AePT+MtgQnCRwa3TQX4=;
 b=Z1HmAxnfzdn9FoQZf+DyMDvMHJwLLsWJJUbPsWqENApbZymOmVxPjl1lOC4ePEDbeB
 U/S7eBT811AEPMeNkzgnKZ7Nlyr9+Thkld05BkFnmTBLG5VMJ+lMdrPfv96tMSDun4zD
 gduvO7L+Cozwk5XGL69xPZUzEZrkTh22aOqqX7gweGuFhisM9k/4NDzSIQf0Qxhj1QBz
 ibZfwCVSnyC5pAf/VxQ19qnGlIkLcjiBWCpW/usyvrtjaUFK2qCWpM2u3B76N8ABYRDC
 kiBhgF+AeBONyDxDgTxRYZfIUiHOEvvl0mq4LArLAT23Vp2jDCzAD49x09Z9fGC3pCkc
 J2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=U5RAXoFel6JiFEul8P59gVQ3AePT+MtgQnCRwa3TQX4=;
 b=sE+adl4LsERdTt8Wfc1RUW7DlZ6B4GMHRW5KzhblMaf6s16hZBXq5yuoBC4Ay01S8M
 u+2V9rDMiYSfNv2OyzXpY8ocCUMVuW8pH2rs32aU8J8H6fdpUtwYW6RBpFjZitoRsyXA
 EKsUkE09leMKUIfVQugAtUtYavMdOdjYDiDIwv79mtBefSC+pmALQvADX2WROJRlF0p9
 0BubSWIzh/wUbXVB/9XVTd8qPxtsd0iF6lfVkztoowpz5W+PZwBXEDzyMK2KBUC/aIS+
 WtKiEXTCX0atXRVMQuMn96TDepCVnTHWyO4qAwbks6VOwCaZ82HPxLDFpE7vhZYchwmz
 vm2Q==
X-Gm-Message-State: APjAAAVTy/jXm4lXJlstIcjZEZh5lSGWb3aFzqXnfJudFDr46FqD9GbZ
 z2M1Cpjwb2+R+KzsohWk2U8=
X-Google-Smtp-Source: APXvYqw0j0UrHTIHan0AsvKi6C9ZtF4b4usbEQKMeS5HlaSqNkgZbkrJaFwaQtl9Hf/UEroMopycIQ==
X-Received: by 2002:a19:f107:: with SMTP id p7mr9997330lfh.91.1572243921372;
 Sun, 27 Oct 2019 23:25:21 -0700 (PDT)
Received: from [10.17.182.20] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 u11sm1583705ljo.17.2019.10.27.23.25.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Oct 2019 23:25:20 -0700 (PDT)
To: Jason Gunthorpe <jgg@mellanox.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-9-jgg@ziepe.ca>
 <6f60f558-20db-1749-044d-a46697258c39@suse.com>
 <91329d7d-9db5-057e-59d2-887254083da0@epam.com>
 <20191021191219.GJ6285@mellanox.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <3a53baa5-bc1d-e901-2792-8d51753391ff@gmail.com>
Date: Mon, 28 Oct 2019 08:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021191219.GJ6285@mellanox.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH hmm 08/15] xen/gntdev: Use select for
 DMA_SHARED_BUFFER
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMjEvMTkgMTA6MTIgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBXZWQsIE9j
dCAxNiwgMjAxOSBhdCAwNjozNToxNUFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToKPj4gT24gMTAvMTYvMTkgODoxMSBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+IE9u
IDE1LjEwLjE5IDIwOjEyLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+Pj4gRnJvbTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+Pj4+Cj4+Pj4gRE1BX1NIQVJFRF9CVUZGRVIg
Y2FuIG5vdCBiZSBlbmFibGVkIGJ5IHRoZSB1c2VyIChpdCByZXByZXNlbnRzIGEKPj4+PiBsaWJy
YXJ5Cj4+Pj4gc2V0IGluIHRoZSBrZXJuZWwpLiBUaGUga2NvbmZpZyBjb252ZW50aW9uIGlzIHRv
IHVzZSBzZWxlY3QgZm9yIHN1Y2gKPj4+PiBzeW1ib2xzIHNvIHRoZXkgYXJlIHR1cm5lZCBvbiBp
bXBsaWNpdGx5IHdoZW4gdGhlIHVzZXIgZW5hYmxlcyBhIGtjb25maWcKPj4+PiB0aGF0IG5lZWRz
IHRoZW0uCj4+Pj4KPj4+PiBPdGhlcndpc2UgdGhlIFhFTl9HTlRERVZfRE1BQlVGIGtjb25maWcg
aXMgb3Zlcmx5IGRpZmZpY3VsdCB0byBlbmFibGUuCj4+Pj4KPj4+PiBGaXhlczogOTMyZDY1NjIx
NzllICgieGVuL2dudGRldjogQWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgZG1hLWJ1ZiBVQVBJIikK
Pj4+PiBDYzogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtv
QGVwYW0uY29tPgo+Pj4+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPgo+Pj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4+PiBDYzog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4+IENjOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPj4+Cj4+IFJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gVGhhbmtzIE9sZWtzYW5k
ciBhbmQgSnVlcmdlbiwgY2FuIHlvdSBhbHNvIGdpdmUgbWUgc29tZSBhZHZpY2Ugb24gaG93Cj4g
dG8gcHJvZ3Jlc3MgdGhlIG1vcmUgY29tcGxleCBwYXRjaDoKPgo+IGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTExOTEzNjkvCj4KPiBJcyB0aGlzIGdudGRldiBzdHVmZiBzdGls
bCBpbi11c2U/IEkgc3RydWdnbGVkIGEgYml0IHRvIHVuZGVyc3RhbmQKPiB3aGF0IGl0IGlzIGRv
aW5nLCBidXQgSSB0aGluayBJIG1hZGUgYSByZWFzb25hYmxlIGd1ZXNzPwpJIHRoaW5rIEp1cmdl
biBhbmQgQm9yaXMgY291bGQgaGVscCBoZXJlCj4gSmFzb24KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
