Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF76B38F1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9oh0-0004Is-An; Mon, 16 Sep 2019 10:57:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDyh=XL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i9ogy-0004Ig-Kn
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:57:12 +0000
X-Inumbo-ID: bbbdfdfe-d870-11e9-95de-12813bfff9fa
Received: from mail-lj1-f193.google.com (unknown [209.85.208.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbbdfdfe-d870-11e9-95de-12813bfff9fa;
 Mon, 16 Sep 2019 10:57:11 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v24so5656034ljj.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 03:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4wWFCgDiAWzV1Z52oKn4uKC+LRwQ2K1pXCADwnN8E7w=;
 b=B8RgPnx0e3saF/N4lRmzt1/ZorcHQBbfZsc4R7xW1R+3QhCKu3qg0KoyQ6zJZd8qVS
 830Jno1m+ErL8EosUSWO7Sk17bWf1AW+M7nfwvrDO5EaoJEhQ37eeOgtbGuFIRHrtjze
 ErGSacd1f5tBSOqvriuLdz1KPmYWdweMU04MaCCq6hpIoNUyN/4tBIwwFBaHh4g15u2r
 4dtyIoFogQqRmylIOCWFb0TrGaFoV8PPqxlFaMYPYQMQT+bdKeEDWWdku/Zkg5lKw922
 RkqLZnQHU96Q1YVfEfUJjx8CWYo/IPZzZ9Y1dkmAWVkNLfvHEzCU1DuGDuBGtjYnTHuE
 YidQ==
X-Gm-Message-State: APjAAAUHn+WDnfiA+fblvp1bz9KabpLAWS1U4JUTC4EDWm0xwRVDGa0O
 YRrDPDArhEUWk+vv8jyyfP3Ao1Ky3ns=
X-Google-Smtp-Source: APXvYqzc/WA7VAO6rG/5Q/652Qy53xGLYrI2MZaWVL55pr2I9KdS4nJGi3Oyt+NqUTDxBh9qeQOVhQ==
X-Received: by 2002:a2e:87cb:: with SMTP id v11mr4136848ljj.31.1568631430513; 
 Mon, 16 Sep 2019 03:57:10 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id m10sm8928863lfo.69.2019.09.16.03.57.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2019 03:57:10 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id r2so9043019lfn.8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 03:57:10 -0700 (PDT)
X-Received: by 2002:ac2:4359:: with SMTP id o25mr38119321lfl.147.1568631429970; 
 Mon, 16 Sep 2019 03:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
 <b05e5bf3-ed23-cb07-638e-05101210645c@suse.com>
In-Reply-To: <b05e5bf3-ed23-cb07-638e-05101210645c@suse.com>
From: Wei Liu <wl@xen.org>
Date: Mon, 16 Sep 2019 11:56:53 +0100
X-Gmail-Original-Message-ID: <CAK9nU=re=7B2cpNc0QAiMY0hiKV7N8V1Be70Yaqdt_HmRRdkNA@mail.gmail.com>
Message-ID: <CAK9nU=re=7B2cpNc0QAiMY0hiKV7N8V1Be70Yaqdt_HmRRdkNA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 1/2] x86emul: treat Hygon guests like AMD
 ones
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBTZXAgMjAxOSBhdCAxMDo0NywgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToKPgo+IEZvciBzb21lIHJlYXNvbiB0aGUgSHlnb24gZW5hYmxpbmcgc2VyaWVz
IGxlZnQgb3V0IHRoZSBpbnNuIGVtdWxhdG9yLgo+IE1ha2UgYXBwcm9wcmlhdGUgYWRqdXN0bWVu
dHMgd2hlcmV2ZXIgd2UndmUgYmVlbiBzcGVjaWFsIGNhc2luZyBBTUQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExp
dSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
