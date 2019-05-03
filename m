Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0764A131B4
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:01:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaaf-0007wj-N8; Fri, 03 May 2019 15:59:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaae-0007vr-2f
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:59:12 +0000
X-Inumbo-ID: 6335a973-6dbc-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6335a973-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:59:10 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q23so1016825lfc.12
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w3qJBWuFmehFLTiPWZTHyJEMT8WM6vgek1sAyyNoPck=;
 b=uIRkWVmygAjVrWVEAx4ISrmj9EROEPipUL6Nvc6po30Ulj5vftS/6CbmA5V78ZVKPm
 6QQ14hBOrRtHuJKoEvFTpC27TzQvmv05x0upsDXS5UIrRTMp22TjZzKr9Ib+UPLGznCy
 Ehand4JVhB3Bvdz0x+4cp3ZRGGKjd4ZWwpI2bJtP6nTJoNVPwryyA2mBjXsaQz4MjHfq
 iDJUQLLX/S+Vvbol9qSfWVF3m09gDETu8RZCJ/KZcvB0hTVpAGkhVPkFOFMQnQCP+/re
 YCqP6cACffOHYdpx1GjwADLMgufTqI6yF3m0wiS946AqgU+xpa381CvVUmek1JzUzfBF
 gG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w3qJBWuFmehFLTiPWZTHyJEMT8WM6vgek1sAyyNoPck=;
 b=V62byjlHAERJFMaeGJ46YJcizTUe25vmNvtkWS+bn3GRNAe4MwXWMif+Lewiah58NT
 wEUShO3z4Jz32mLpsIyvkgWUyH+ovF9CIfzkTQIktx5zn/1PW+F07+83Z9MvfB9d3RV1
 Ti4ueuwd8HUvcCuG87iBzI2vYNnPdTb5YB6LMYwF+CX5qXUeAPA58mxL+fG7d1x/bXj7
 YJTTvkOkFo9O43yGNBhzBbJrRXpJDTq6ujiPAVpTAW8fGsKJo+7h5QAXbc9BmwcEwQ4L
 U40RcjVB/2xxwxRG5qX0OLeQZQBgXz5k9yYtHK3aAUQVXgAzm2bxZ1jf4IDTTZ09IcJW
 ysxg==
X-Gm-Message-State: APjAAAUolOCbGreJvHGn5yeBcKWpGfJkRPpAHHtVZEyEJ5s46GoHB4Od
 mkrU0nfVLx9coBH2OYw/hSc=
X-Google-Smtp-Source: APXvYqyqBbYix2TSlUcJKvaIwet7RIJagObVOtsPSNfE7trwmq/xrc3EYrKnYOIcSHW4PtdewHAoPA==
X-Received: by 2002:a19:f243:: with SMTP id d3mr5284822lfk.168.1556899149222; 
 Fri, 03 May 2019 08:59:09 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 s26sm398798lfp.31.2019.05.03.08.59.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:59:06 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-19-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <ee9c1522-d7b7-8bb2-e810-61ce5334d279@gmail.com>
Date: Fri, 3 May 2019 18:59:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-19-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 18/20] xen/arm: mm: Check start is always
 before end in {destroy, modify}_xen_mappings
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSB0d28gaGVscGVy
cyB7ZGVzdHJveSwgbW9kaWZ5fV94ZW5fbWFwcGluZ3MgZG9uJ3QgY2hlY2sgdGhhdCB0aGUKPiBz
dGFydCBpcyBhbHdheXMgYmVmb3JlIHRoZSBlbmQuIFRoaXMgc2hvdWxkIG5ldmVyIGhhcHBlbiBi
dXQgaWYgaXQKPiBoYXBwZW5zLCBpdCB3aWxsIHJlc3VsdCB0byB1bmV4cGVjdGVkIGJlaGF2aW9y
Lgo+IAo+IENhdGNoIHN1Y2ggaXNzdWVzIGVhcmxpZXIgb24gYnkgYWRkaW5nIGFuIEFTU0VSVCBp
biBkZXN0cm95X3hlbl9tYXBwaW5ncwo+IGFuZCBtb2RpZnlfeGVuX21hcHBpbmdzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgoKUmV2aWV3
ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2Vy
ZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
