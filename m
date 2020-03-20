Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD718D0D0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:29:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIce-0008GZ-BN; Fri, 20 Mar 2020 14:27:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AByC=5F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jFIcd-0008GU-E8
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:27:39 +0000
X-Inumbo-ID: f31855d2-6ab6-11ea-bec1-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f31855d2-6ab6-11ea-bec1-bc764e2007e4;
 Fri, 20 Mar 2020 14:27:38 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id i24so7356812eds.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2020 07:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oq3vX4h/L8+0J3ih6MRcKXbggaSs9AlvewHm02xYM1E=;
 b=NFEK33bkw4qybK4AkNdVG6OwsuCZmWy6Q5KfkErqnvkvY3DAqKk0CGS+Tr49t4QqlG
 GrRCYv5EcUI4nY6HhP7S/Y7NDa0kQKtKTSM40onQ/bmwLRgKjPGXlSW1NWFyVlS6uXsx
 WUOcq2dQcUOLIfKQ8XB7TEsouEquYOe8x+ztYMt5uLhwXW03mMq/B2c3QeOseywEF35o
 cOYD1j6Ux0u9BQlXWgwG9JlBNEbZZ6GHDuQP0yMSG7fV7rbPjlGAQr8tuRCoBG0iN02R
 R5QnpdeBY928xJbl+jjFhWKgQQhaHN22spSNh2NvalmudnzLHF6RUaA4m/7QU6eW5cmW
 /QSQ==
X-Gm-Message-State: ANhLgQ3tYV/nVJbjbtmeyYwqB2ikEDEXcNrhmqAo2MUs8+0nlTCTRSex
 HAvJbUywR7akgBY9Gv5ZWtw=
X-Google-Smtp-Source: ADFU+vv2Gf4uH6ihZvJOeY7NpTg97g/LA9zU6/5UZo8h5lVGquD8aHQLkHsUCIEpvjVkosUywiFvfw==
X-Received: by 2002:a50:e881:: with SMTP id f1mr7657708edn.135.1584714457993; 
 Fri, 20 Mar 2020 07:27:37 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id dj4sm190882edb.91.2020.03.20.07.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 07:27:37 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <9f6c3b5b-13e7-05aa-1ff6-930724674323@suse.com>
 <20200320142214.GX24458@Air-de-Roger.citrite.net>
From: Julien Grall <julien@xen.org>
Message-ID: <ec3d0416-22a0-bde0-1e92-174b41612bda@xen.org>
Date: Fri, 20 Mar 2020 14:27:36 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320142214.GX24458@Air-de-Roger.citrite.net>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMC8wMy8yMDIwIDE0OjIyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IHN0YXRpYyBp
bmxpbmUgdm9pZCBmaWx0ZXJlZF9mbHVzaF90bGJfbWFzayh1aW50MzJfdCB0bGJmbHVzaF90aW1l
c3RhbXApCj4gewo+ICAgICAgY3B1bWFza190IG1hc2s7Cj4gCj4gICAgICBjcHVtYXNrX2NvcHko
Jm1hc2ssICZjcHVfb25saW5lX21hcCk7Cj4gICAgICB0bGJmbHVzaF9maWx0ZXIoJm1hc2ssIHRs
YmZsdXNoX3RpbWVzdGFtcCk7Cj4gICAgICBpZiAoICFjcHVtYXNrX2VtcHR5KCZtYXNrKSApCj4g
ICAgICB7Cj4gICAgICAgICAgcGVyZmNfaW5jcihuZWVkX2ZsdXNoX3RsYl9mbHVzaCk7Cj4gI2lm
IENPTkZJR19YODYKPiAgICAgICAgICAvKgo+ICAgICAgICAgICAqIGZpbHRlcmVkX2ZsdXNoX3Rs
Yl9tYXNrIGlzIHVzZWQgYWZ0ZXIgbW9kaWZ5aW5nIHRoZSBwMm0gaW4KPiAgICAgICAgICAgKiBw
b3B1bGF0ZV9waHlzbWFwLCBYZW4gbmVlZHMgdG8gdHJpZ2dlciBhbiBBU0lEIHRpY2tsZSBhcyB0
aGlzIGlzIGEKPiAgICAgICAgICAgKiByZXF1aXJlbWVudCBvbiBBTUQgaGFyZHdhcmUuCj4gICAg
ICAgICAgICovCgpJIGRvbid0IHRoaW5rIHRoaXMgY29tbWVudCBpcyBjb3JyZWN0LiBwb3B1bGF0
ZV9waHlzbWFwKCkgaXMgb25seSBnb2luZyAKdG8gYWRkIGVudHJ5IGluIHRoZSBQMk0gYW5kIHRo
ZXJlZm9yZSBmbHVzaCBzaG91bGQgbm90IGJlIG5lZWRlZC4KClRoZSBvbmx5IHJlYXNvbiB0aGUg
Zmx1c2ggd291bGQgaGFwcGVuIGluIHBvcHVsYXRlX3BoeXNtYXAoKSBpcyBiZWNhdXNlIAp3ZSBh
bGxvY2F0ZWQgYSBwYWdlIHRoYXQgd2FzIHJlcXVpcmVkIHRvIGJlIGZsdXNoIChzZWUgZnJlZS5u
ZWVkX3RiZmx1c2gpLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
