Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE6C131B9
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:02:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaah-0007xt-1u; Fri, 03 May 2019 15:59:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaaf-0007we-CN
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:59:13 +0000
X-Inumbo-ID: 64712f26-6dbc-11e9-843c-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 64712f26-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:59:12 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h21so5608841ljk.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MaX18FDK7FzfUfbbf+WSDlTKj5xRCDHm2i5qcyMdjvA=;
 b=MRT2ObrLI3LaEV2A8du8dYOkiaGtJSyUZDNSY5HmDkkxzJqlmX1SOVkOTb07XzKWvf
 1rxMR0rt6nMMR+u+BR/0EN3rZfx7HrAzPQKkSJrHBQZgublD8N/+AxNNsETL9Vkj68ld
 5zWT0dBI+wN6VEBwkRtkay4tQ0Bmy0J+3MdWacfohu0vVgJsX8IXIHoZOSg/FnL8AYE+
 VDFyQ/j3LEa1AtjGDhAKaoC3vfktrVLKuKD6zRFlCqsR2f4uzCu/MdJh4MODPOCFADWe
 CzmCHc9M7dKk9e6hkqnfHEIYY/73CCh0of5FjipTLkKpDYQ7qZ7hLFsShYA3/cLQWgvP
 GVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MaX18FDK7FzfUfbbf+WSDlTKj5xRCDHm2i5qcyMdjvA=;
 b=LjV0/Z2yzrJM7z/1eXxKasPPaDlpy5f54UkYZ810MaGxo07gYGQq+T1hdbyb1H6Gue
 ZUs8XcOg340PzjxPvx7+VmVpehOYGpaBUllwhgbYiHfSzlwk78ryUjC1x6N2vzYIFev3
 3rsFX3QyzYCm0Qf1WuibXzmzS6Z13HP/UtxWlTzo7co5UNcJh0pdKup9GbOWg88wdmLQ
 vWmTj3MUdyfDoEwx0Y1MSyvYqp/H6LpCljg1R7e6p0MSDN5youj713Nc6UdyHJ0vjaFz
 X/e2YvPNo/cdxmTmck03rt3HCDmXpbcil/+U8dAUSwtoA4SPEwhRT+20yB83mqVedNLr
 GhMQ==
X-Gm-Message-State: APjAAAVz66gri3pDy81bJLwbWDIQxwv9vBcCfeJJm27QB6mQdBfAby2U
 5j23vKB22Rh3iNqcSf2qxz0=
X-Google-Smtp-Source: APXvYqz4MpSbBi428otbgSjGGMd2XY4O0zTqXETy0Y7xgstIb6ogYYzRAnsB8JSP0Wdftoec27ejpA==
X-Received: by 2002:a2e:3c06:: with SMTP id j6mr4977347lja.99.1556899151312;
 Fri, 03 May 2019 08:59:11 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 k11sm398910ljk.92.2019.05.03.08.59.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:59:09 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-20-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <c090be90-3ad1-a2f3-0901-fcae8776a63d@gmail.com>
Date: Fri, 3 May 2019 18:59:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-20-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 19/20] xen/arm: Pair call to set_fixmap with
 call to clear_fixmap in copy_from_paddr
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHNldF9maXhtYXAgbWF5IHJlcGxhY2UgYSB2YWxpZCBlbnRyeSB3aXRob3V0IGZvbGxvd2luZwo+
IHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4gVGhpcyBtYXkgcmVzdWx0IHRvIFRMQiBj
b25mbGljdCBhYm9ydC4KPiAKPiBSYXRoZXIgdGhhbiBkZWFsaW5nIHdpdGggQnJlYWstQmVmb3Jl
LU1ha2UgaW4gc2V0X2ZpeG1hcCwgZXZlcnkgY2FsbCB0bwo+IHNldF9maXhtYXAgaXMgcGFpcmVk
IHdpdGggYSBjYWxsIHRvIGNsZWFyX2ZpeG1hcC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
