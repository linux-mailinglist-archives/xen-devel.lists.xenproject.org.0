Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5754814927B
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2020 02:12:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv9xK-0003EF-Bs; Sat, 25 Jan 2020 01:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8SrB=3O=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1iv9xI-0003Dy-EL
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2020 01:09:44 +0000
X-Inumbo-ID: 5f0552a0-3f0f-11ea-b833-bc764e2007e4
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f0552a0-3f0f-11ea-b833-bc764e2007e4;
 Sat, 25 Jan 2020 01:09:44 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id o199so1912835ybc.4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 17:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4bohUsMSTdHgmpasd59hHVXdR3zeG/bWXFcGaK9lXqo=;
 b=L4PEO5lQe8OMV4bfFXmWTGh86KPVjSx3elCDM8UIldF637JWuHXfu3/sphs46lMYvD
 jRhh/6VHvQgm6QQ2xScMG0fYrd+6yBWtXTM06S4nwgJDHvp4SZVZfFjmcMP7Agqw+4wa
 01XX0eBzO8GATdIvlg6FI9HwmXuIGVH7AE8pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4bohUsMSTdHgmpasd59hHVXdR3zeG/bWXFcGaK9lXqo=;
 b=V3qIHNHop11wQxM2w2EENNvp2XOlnqmXDgoagt0Zdwkd/1O5d577e+11K5wqAXI5LU
 vusGoV8i+oVjVftdsOCFfg+CjOSsMi0IeiNfh2f4DAfu8epPJafJzx4a/MuHNdmkbEXl
 GCKTiDBBWDicWT7eUxe+zF7H1r4ZGdj3e7hBUUeTyTEGkp+uFherey0zA+/mxLpzyjq3
 VOK3ji2FRWWHpqw/KC523IgEezwN2vanKNpxiBaloWqSWUjbd0rNBMu/hLoCRhKL7/CG
 31XlQccqVeC2NMU0WRC4rc1rAyuScaXmYOVoK9r2CR54IFz7kd25fF9ge0cu1weIq4cc
 Cjqw==
X-Gm-Message-State: APjAAAVrlSWdRhGd3DiQ8jCnhDKEC3gRA2CwGNsPSWAraAbaq+jSmnhf
 peIletL9ord0gYZC4LJAimF5QDq78Os=
X-Google-Smtp-Source: APXvYqxaFUnpS6yGFbs9NrUQZlFxYL/eOb5iWhKJ0a+GVh7mP94W42DRSiig72fV97k5bFFvmPjU9A==
X-Received: by 2002:a25:ced4:: with SMTP id x203mr4587053ybe.419.1579914583548; 
 Fri, 24 Jan 2020 17:09:43 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:e1ae:1c18:9094:78e3])
 by smtp.gmail.com with ESMTPSA id
 q124sm3188277ywb.93.2020.01.24.17.09.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 17:09:43 -0800 (PST)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
 <20200120115053.1010739-3-anthony.perard@citrix.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <aa2bb6a2-d504-a6f3-3b8c-ad30f82c871e@cardoe.com>
Date: Fri, 24 Jan 2020 19:09:42 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200120115053.1010739-3-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH 2/3] automation: updating container to
 have python3-config binary
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzIwLzIwIDU6NTAgQU0sIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRob3NlIGNvbnRh
aW5lcnMgaGF2ZSBhbHJlYWR5IGJlZW4gdXBkYXRlZCBpbiBHaXRMYWI6Cj4gLSBkZWJpYW4vc3Ry
ZXRjaAo+IC0gZGViaWFuL3N0cmV0Y2gtaTM4Ngo+IC0gZGViaWFuL3Vuc3RhYmxlCj4gLSBkZWJp
YW4vdW5zdGFibGUtaTM4Ngo+IC0gZmVkb3JhLzI5Cj4gLSBzdXNlL29wZW5zdXNlLWxlYXAKPiAt
IHVidW50dS9iaW9uaWMKPiAtIHVidW50dS90cnVzdHkKPiAtIHVidW50dS94ZW5pYWwKPiAKPiBU
aGUgY29udGFpbmVyIGRlYmlhbjp1bnN0YWJsZS1hcm02NHY4IGhhdmVuJ3QgYmVlbiBjaGFuZ2Vk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgoKQWNrZWQtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
