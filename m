Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7524C27
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 12:04:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1af-0003ED-V0; Tue, 21 May 2019 10:01:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wdSZ=TV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hT1ae-0003E5-RL
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:01:48 +0000
X-Inumbo-ID: 71a4fdbc-7baf-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 71a4fdbc-7baf-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 10:01:47 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y13so12570939lfh.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m4BLbqkTS9G1TGAXZOgnjeBJhJZcO68wCdSx6Mdkns8=;
 b=OWPl+ZC5Ti7KPiYXqkrE8Yw8rQi7RKM9G5KJH28q4bK0W7x3kIyfbMX7LKHYYSz/UO
 QN576OfxwPCs4mNIGDBvgMBGdtYrvL+SMg09M8OmzSwV+hWeRjj4o/wbbbLtpRhaYEE2
 M7bHm9IzwYI+xmlmE+L0ICJlz7c/XB0NaLM32dHajIxg5UbZ7jtMTFPoeucH1J+IreLQ
 GQvIzHKU3BgNLbWuFT93pkwHfJxOyqdKmOc3gszI91ImQvU/HlQvUI+4gm3genDEriqS
 p5pKu8tWPNXIr8NyDJvtbm3zyeWfZ0gVYa4r9PRbwuIlS6KJxrwgStMxo9OzJbVOLiVj
 iAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m4BLbqkTS9G1TGAXZOgnjeBJhJZcO68wCdSx6Mdkns8=;
 b=qcrrQK1fKLWaFYuhBgmDB+CJZBdNkhWJgo5KNvFO0gd2IIKed77yqeseTa52WH1LEf
 c7F5OaRkeyrvWwUavv1vMPiy1qcKI75ck26QN6oY8PBp/RJU7t17S1v6Hl+VgOV40qfT
 3CZhLC5EyA4fdsQD21qDBBdFw8oU7IKJ0iUD1F1PnQL5rqHSjsRZJamHrwRcrwKXOY5s
 NBT2gIbxVtZxAjAVVb1F2p/7dSmTQdGhHIpHl2HzolYYJ8pqvhNMBbuSWiE3eMIFlo7Y
 BF5P9VG4UfFiNiNNE3JQzuKHBpuFvdJqRXLR3ttWjbI6CMl8bOGhTwMIpF2Rj4PnJ/R0
 E9+A==
X-Gm-Message-State: APjAAAVeQo0tZz5E3W8DeI7dqN5pHRDS7mUKGJTAP3eSlgyPF0qutRz1
 NedXNEG+bg0msn3Ju72K5SE=
X-Google-Smtp-Source: APXvYqzlqTcthyKiqbtv7TEb8OyV6REL6ZGkxWWB03y0swDEkQ6cqVYNkYn83dqPy5jhYG504SqJhQ==
X-Received: by 2002:ac2:528f:: with SMTP id q15mr21561942lfm.37.1558432906298; 
 Tue, 21 May 2019 03:01:46 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 y8sm4396400ljk.79.2019.05.21.03.01.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 03:01:45 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-6-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <d728673e-a308-b5ec-ac8c-e60e0cb3001d@gmail.com>
Date: Tue, 21 May 2019 13:01:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514122456.28559-6-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 05/19] xen/arm: Remove
 parameter cpuid from start_xen
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC4wNS4xOSAxNToyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBwYXJhbWV0ZXIg
Y3B1aWQgaXMgbm90IHVzZWQgYnkgc3RhcnRfeGVuLiBTbyByZW1vdmUgaXQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiAtLS0KPiAg
ICAgIC0gUmUtb3JkZXIgdGhlIHBhdGNoIHdpdGggInhlbi9hcm06IFJld29yayBzZWNvbmRhcnlf
c3RhcnQKPiAgICAgIHByb3RvdHlwZSIKPiAtLS0KClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292
IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
