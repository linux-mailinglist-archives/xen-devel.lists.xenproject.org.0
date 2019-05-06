Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E914A30
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd2Q-0007IP-9r; Mon, 06 May 2019 12:48:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2O-0007IH-JQ
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:08 +0000
X-Inumbo-ID: 322abec6-6ffd-11e9-843c-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 322abec6-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:48:07 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j11so9054759lfm.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=56a3lXKG32B9aeBNyTvFnEGtEFWe6ohQI2IlFabaTMU=;
 b=q1P23AEr/mmwJ0RrJnm1nANC1YtFXsLFo6uryivPFG6miqizPBgJiJLZzoc4OD7GIh
 1Iy+T92pOTsQqzCGEybXkwnzq+o4fHcjzjGtYLoDzrjE1jp/iXzGgmzwy0XTb395ciyf
 31JhpqQacbkleG0lIFDy5m7hxOEqItkFkBLC87EHd5Yk5pZ8FqokETE5z11F6IP2HJEk
 bwxYNsCwajeCynkLWvGnIN5XK2UOhKxC2mOSM/fQyDG4AGmYPtpf2v3Ie0Txq6tSsB+d
 bzhpK8U9k/ZCnBQ65ECkwg/xQ2nzWXpApkCScd35TSoB3O5YzgppOSUMuLxKsHRv6xSS
 bxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=56a3lXKG32B9aeBNyTvFnEGtEFWe6ohQI2IlFabaTMU=;
 b=pDdylqPEKh0bpl+mloEX2Bw1IHnKpTuxAMXDOkG0ibbTZoQD/E5JYLTM9NkGJNbcCT
 rHlf+MAkm/yUpX+HiEOvpy6KnEKblGcjvFzynnSySzwbFP/YwVfdVi2PxgSXf7IxMVYG
 1xG6n6V6OZHgA1huUI7r9RBZS50nBuMOIPhXBGsqw8Q15r3MZBG3djSaSegD2NIlmj0y
 sQCa/5PbSLqL6qjfy5bwQ20RcwIbsx0bEmZzx8FT8faXUUIsfdoWIaZ8FpPwDk1qfouy
 mMBsUHtmQqs/fuEsCUZH9eJoTiZZSRnXvVimSJn6eNLD+nfXBeUrdK0k1VZPlIAo8SBv
 u3Kg==
X-Gm-Message-State: APjAAAV4lcLNwvZOeEUJwpnPqc0TqkjUW/zHIIvh7a8dGBLJ1Pm/fbyj
 AuIqamBQQ0NZpnXMFxbagWA=
X-Google-Smtp-Source: APXvYqwSdLr94Uu7gLY9+0uUmKKwXdrj++zmsHtqiYzWxwF60kuQtVe4gQmhvWjabJcXRiHZ/LVkuA==
X-Received: by 2002:ac2:4357:: with SMTP id o23mr13879162lfl.146.1557146886596; 
 Mon, 06 May 2019 05:48:06 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 o21sm769032ljj.19.2019.05.06.05.48.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:48:05 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-3-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <067aa134-e16f-c0df-4802-04cceeb5af68@gmail.com>
Date: Mon, 6 May 2019 15:48:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-3-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/12] xen/arm: mm: Rename
 create_xen_entries() to xen_pt_update()
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGNyZWF0ZV94ZW5fZW50
cmllcygpIGlzIGRvaW5nIG1vcmUgdGhhbiBjcmVhdGluZyBlbnRyaWVzLiBJdCBjYW4gYWxzbwo+
IG1vZGlmeSBhbmQgcmVtb3ZlIGVudHJpZXMuCj4gCj4gUmVuYW1lIHRoZSBmdW5jdGlvbiB0byBt
YWtlIGNsZWFyIHdoYXQgdGhlIGZ1bmN0aW9uIGlzIGFjdHVhbGx5IGRvaW5nLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1i
eTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHks
CkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
