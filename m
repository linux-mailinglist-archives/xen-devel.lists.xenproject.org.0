Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023216B3F4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 23:28:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6MBZ-00028J-Vp; Mon, 24 Feb 2020 22:26:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gzzy=4M=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6MBY-000288-Ir
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 22:26:44 +0000
X-Inumbo-ID: bbf8994c-5754-11ea-aba8-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbf8994c-5754-11ea-aba8-bc764e2007e4;
 Mon, 24 Feb 2020 22:26:43 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p14so13805381edy.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 14:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iIZGuHLezILmmmtpyY6Q4xeCs0vJewJ2am1Nf5evwYI=;
 b=Gc4PY8UwucLQPUcMqkxc+GBGs8XODMkb2UI1Bu3Z1yGxVXgrVPt/zXt2Knpq1/mvp1
 pKeCpJpi4s9UBDSd9YNq2yelrLnXsv4d0ropVAWc1eeM5WOKDJuuMkJaszDvGEh/CtHX
 uG9lgZDKyjYpOj60ebmZhIwnkUnGGM7Vhr0W0bk6onJdZaj7p+kvi47UbEdpkug5bVnb
 6EzedlB65lEkmjsl4t1vNs9uiALzDpwOuzq2njeUEhKXksClQfNeH9xMdyZpW5oOplf/
 U85vtWCrrj95hVG91lqVnouyRNKeeldJGlBgdzJMuTzWW0k32OPPzMy3OyyP2rO3Kk4i
 KORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iIZGuHLezILmmmtpyY6Q4xeCs0vJewJ2am1Nf5evwYI=;
 b=Y+XtKCC9nwzl7eSjmqV6XiSXKF4IlUGsek0hIvCXceTYF3Qp6P4HsAr0kOR83VsBZS
 cF+DwBUdIi/w4KIi3ADOnk0xUM+0Q92zCXodv23r1o0BplV/v6S7152HlZ5iJyavjUum
 LronjnhuRWv6MwZAU2O43Yu0hv2qBaK+hzB9EYJgy6V474OFggWvDw6Y1r1dREswr3if
 XrWSbCXOEXgywTXdIgxQYXIE5GUK64UcYeNd+Hjo5Mi0O0yIr/Cg5nqALsYbakqBgPe6
 7EJHj6t9mp73EBGzf6bkECblsJAK6p/l6Bmx7ltePrElO97r4c1i2u5t8Pu8Fo3MD/q9
 kcJg==
X-Gm-Message-State: APjAAAU3fL7fhnRb4Czj/ULCI//tnGvdfHyg1K5CsAn9QyeHAPFuw4t3
 lbHbT7wCuXR8me2dxfQU6kIHX+XZ8EA=
X-Google-Smtp-Source: APXvYqyY4V//7Fh5RIMd6NMAbQ4FSxx5DeiixQm9TleuM6lbtBdHhZ1mXkdHQg0ReL6bgt8d6Ue/OQ==
X-Received: by 2002:a17:906:f241:: with SMTP id
 gy1mr48886537ejb.345.1582583202526; 
 Mon, 24 Feb 2020 14:26:42 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id e3sm1124237edu.3.2020.02.24.14.26.41
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 14:26:41 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id m16so12297994wrx.11
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 14:26:41 -0800 (PST)
X-Received: by 2002:adf:f288:: with SMTP id k8mr72804574wro.301.1582583201162; 
 Mon, 24 Feb 2020 14:26:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200224123922.GO4679@Air-de-Roger>
 <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
In-Reply-To: <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 24 Feb 2020 15:26:05 -0700
X-Gmail-Original-Message-ID: <CABfawhnF5Va8k11zoQEXGS6N1pu031YmBF+TNsJUaBp+2Rh54Q@mail.gmail.com>
Message-ID: <CABfawhnF5Va8k11zoQEXGS6N1pu031YmBF+TNsJUaBp+2Rh54Q@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IEFsc28gY2QgYW5kIGQgYW5kIG5vdCB2ZXJ5IGhlbHBmdWwgbmFtZXMsIEkgd291bGQganVz
dCB1c2UgY2hpbGQgYW5kCj4gPiBwYXJlbnQuCj4KPiBTdXJlLgoKTG9va2luZyBhdCB0aGlzIGlu
IHRoZSBjb250ZXh0IG9mIHRoZSB3aG9sZSBwcmUtZXhpc3RpbmcgY29kZS1iYXNlLAp0aGUgbmFt
ZXMgY2QgJiBkIGFyZSB1c2VkIHRocm91Z2hvdXQgbWVtX3NoYXJpbmcuIFNvIGZvciBjb25zaXN0
ZW5jeSBJCndpbGwga2VlcCBpdCBmb3Igbm93LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
