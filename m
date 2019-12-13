Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E61F11EBC3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 21:19:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifrLs-0007fv-31; Fri, 13 Dec 2019 20:15:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UQum=2D=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ifrLq-0007fq-Kg
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 20:15:50 +0000
X-Inumbo-ID: 5abd5e22-1de5-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5abd5e22-1de5-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 20:15:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so68289wmj.5
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2019 12:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rJv5Y6Z4CycrlkkoTSWTTaLCT/AygFk2ZBaz9Wwt8IY=;
 b=KemWN0z7EuP2YXqCSJVsbg50UHnskfcPDR5k8UCNKsuNMxCqDPdfFptF6lt9lSKqzy
 DcfD2xMrbcE9hnNpwqnASFBV2npJA0/qjuzDJWm3e25QobGjYyoMSnSSrKdc4qSHMKHT
 e843eNR79uJ9NkdRKqmfHHPfsb8e6Q0eE0bm1VCBVC7f1K83kzi1P8cxrkdGfuSCTmkj
 qjgk9kMIp0kK37bEvaKvzBg3MKCnvpMZb0JTBP3Hu4LG6JIIO4j7Qz3m9hl6qG3dFj5+
 8F0LsTtT6DZqIsIybsMW0Q04VXcoSdI6Tr5UhKGwdEopWvoDLUeTALOc8ALqFJHsUitK
 eiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rJv5Y6Z4CycrlkkoTSWTTaLCT/AygFk2ZBaz9Wwt8IY=;
 b=iJAOX7jvpZsDcoKnbkAHn+cB7WTMlgW23wPLLNI8Lv51HQDpi1JXmgtmIsRuamXhAb
 yDVK0SUyWhqEIIr6KhmB0lDnkhtpOilI/Z0DFUTJi3k/wxRLuXzYHXTPYfWmVRub9wSd
 fqBb0gcLYFchBvFBon7iEkWu1ChvmQsDdwzchHdldEWkUZigtKocVTLVNIbtVQysTw05
 txvcbtav+PlsoJ5ZotNMSVn7zIvZqFjhzLMfWlIoiBaQ/+e5bNuMTXxor6gmp9FeNonI
 RUw4HmWf8MkAZvgWQhMakCkgAGrxsXdZUfbzMPlZ3Om+IcJw8R8Bii7P0pqfIwjAJClB
 2bgg==
X-Gm-Message-State: APjAAAWJTdb4STrEAZLT21MSTYUOw6NCGzBrhxvZxwL6mRtGxXgYQnKp
 np7/IVbPW4euJWFFmLMqRjKJ53ysDdvAEpI/aNE=
X-Google-Smtp-Source: APXvYqyLcYLiPln2DBT+NFEpPHZxzc3ouTQoHJdgGrDnUJ99exJAiCGn1VBFuBBjUMP4YOIs2YFeaokjilKrWHjX/tI=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr16344625wme.125.1576268149127; 
 Fri, 13 Dec 2019 12:15:49 -0800 (PST)
MIME-Version: 1.0
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
 <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
 <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
 <e25e1ae4-d5b1-7ce8-348f-f2d1809d0635@amazon.com>
 <eb8beed3-3b9e-25f9-94bf-c6fe56a397f5@suse.com>
 <ff5b0699-5010-fabc-f7fd-2d40f8c56644@amazon.com>
 <2d23e5e7-fe5d-3446-57e5-6559cd8e7258@citrix.com>
In-Reply-To: <2d23e5e7-fe5d-3446-57e5-6559cd8e7258@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 13 Dec 2019 13:15:13 -0700
Message-ID: <CABfawhmU=EwU0RD2b4aD6GjD8rjePg7o6QFG-JwJqODWcMq1Cw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBUaGVyZSBpcyBhbHNvIHZhbHVlIHdoZW4gaXQgY29tZXMgdG8gZWFzaWVyIFNSVE0vRFJUTSBt
ZWFzdXJlbWVudHMgb2YKPiB0aGUgc3lzdGVtIGluIHF1ZXN0aW9uLCBpbmNsdWRpbmcgY2FzZXMg
d2hlcmUgWGVuIHNpdHMgb24gYSBib290IFJPTQo+IHJhdGhlciB0aGFuIG9uIGRpc2suCgpXZSd2
ZSBleHBsb3JlZCB0aGF0IGluIHRoZSBwYXN0IC0gYnVpbGRpbmcgdGhpbmdzIGludG8gWGVuIGFu
ZCBMaW51eApzdGF0aWNhbGx5IC0gYW5kIHVsdGltYXRlbHkgaXQgb25seSB3b3JrcyBpZiB0aGUg
Y29tbWFuZCBsaW5lIHBhc3NlZAp0byBYZW4gYWxzbyBnZXRzIG1lYXN1cmVkLCBvdGhlcndpc2Ug
eW91IGNhbiBhbHdheXMgb3ZlcnJpZGUgYW55CmJ1aWx0LWluIGNvbXBvbmVudC4gU28gZm9yIGV4
YW1wbGUgd2l0aCBPcGVuWFQgb24gVUVGSSB0aGUgZW50aXJlIFhlbgpjb25maWcgZmlsZSBnZXRz
IG1lYXN1cmVkLiBGb3IgRFJUTSBJIGRvbid0IHRoaW5rIGl0IG1ha2VzIG11Y2gKZGlmZmVyZW5j
ZSwgSSBiZWxpZXZlIHRoZSBhY3RpdmUgbWljcm9jb2RlIGluZm8gaXMgYWxyZWFkeSBwYXJ0IG9m
IHRoZQptZWFzdXJlbWVudCwgc28gaGF2aW5nIGl0IG1lYXN1cmVkIGFzIHBhcnQgb2YgdGhlIFhl
biBibG9iIGRvZXNuJ3QgYWRkCmFueXRoaW5nLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
