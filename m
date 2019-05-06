Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D765B14A34
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:50:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd3C-0007cH-EX; Mon, 06 May 2019 12:48:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd3A-0007bh-Vk
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:57 +0000
X-Inumbo-ID: 4ec65817-6ffd-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4ec65817-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:48:56 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h126so9041525lfh.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vg/LrPpU5IFuyVNrhQiSjz9vtNXlqfoOwfa16AWPCRo=;
 b=CFutSjksP/18qHIWZA3ZOla+GCvSo+JYy3Yovfye6o8q/foVAO9h03kT9J71xl35d+
 15C0QDsofBlY7Adpgi30zvW0yqJ4gf4YrSvzaktvfrH858qSaegKbKLrGlp1Ai8RA2TE
 MCpTU+95goY2BJnCK5D3696dgXo1BqhFt2awu4XZ/pjGQE9SdUJvO+JWwI9rJYR3k6Vc
 cRfchbS+FBBLt50UcFyP9IrZCQu04gxB++CGfHlQGXTtHly2T8kQURiwajqUsqlvu1KJ
 FI2Cz23MJ5i2i5t4XHlOeOGzHZpHBCw0Mb7Da+y0T6+vN+GmFbAZHTsJWTmD5zbiJpwu
 7oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vg/LrPpU5IFuyVNrhQiSjz9vtNXlqfoOwfa16AWPCRo=;
 b=pb1mWLodWw57JAFOvKG5J8J01QXpak2r893YjTmZMilpmCM93JgWVXTOATgtRjwBTY
 f9uMSn8msLJuAhjhWkesGHB2Yj1oCUr0//0+LT+IClpZo0A68oZHO/2//B3ZQ44uFvXq
 nxbqE6NuUPy5yIOIS+6jfR/VecBzgM/lXln+RWvEUHaG+a6iOVdtEDVedRrwrZcpnKUf
 MsO06l04o1KkxqbHG4vopmjbPpoANf6hJI9BaE+oDRLLJdQOzv7mFhw/J2qkYxqGV323
 /KGW4P7d1pLmt7w43yTN3b96/OA7LkFzoHpB1Csqhl9A/nUXGVDOb3G0GZVqbi7IScWP
 tsaw==
X-Gm-Message-State: APjAAAU1tJYWwGGAq4SpYZD+E4e9XOo+8HOUoYttP9gKen3Dpug5fw+9
 xLufZkY0V5ErvGo3Dol2Qj4=
X-Google-Smtp-Source: APXvYqwkgYRQRHacQOFB18ARSp56emh6HwFssalnbq/zzd2lJhT/Rqq7JYPjHifH7IOB9XCmH1XCYQ==
X-Received: by 2002:ac2:4246:: with SMTP id m6mr7414098lfl.0.1557146934580;
 Mon, 06 May 2019 05:48:54 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 o28sm2386331lfi.64.2019.05.06.05.48.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:48:53 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-9-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <db5f607d-f10b-4487-e722-a371942613cd@gmail.com>
Date: Mon, 6 May 2019 15:48:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-9-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 08/12] xen/arm: mm: Remove enum
 xenmap_operation
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBlbnVtIHhlbm1h
cF9vcGVyYXRpb24gaXMgbm90IHVzZWQgYW55bW9yZS4gU28gcmVtb3ZlIGl0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCgpSZXZp
ZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5j
ZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
