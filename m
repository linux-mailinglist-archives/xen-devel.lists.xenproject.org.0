Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6AF131AC
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaYr-0006za-52; Fri, 03 May 2019 15:57:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYq-0006yx-72
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:20 +0000
X-Inumbo-ID: 209a08a1-6dbc-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 209a08a1-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:57:18 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v1so4769551lfg.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VoSrjDkYC+0vOph7mkd7DZZ0O7kuMA2CQ6IuHdmHhvI=;
 b=SYx51xMo6NpiAoi+7wKpVCVXmxkYSEWJMj4BeRrkZgwnF0R5JCbndU8LX31hW/nCWb
 nZYmsyZEUX8BkXi5//T2T15Ah+G7LFHh3qMotjW4hQQiCvwsfaeSs7ILqwDHy1Yhd7bA
 b8MhNCp+AtIBCKEfs+2gDRTu0dcjowlPkhVZEMqi9u9UB0l6PmN8xfzV3fpzCSV/CSuw
 3WHLUTWAIFlPMNiXuLjdezqXco26erP6jWanPRrtZ6wuQEkptYhsD8QUWva4PLXyHPGu
 Dh2WtLjIEFUXOzwUXrrdcG+BBF7HIvH9x1UCTOVI6aX8NwjCwjikq5vloGVoXRJmJeq2
 Cyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VoSrjDkYC+0vOph7mkd7DZZ0O7kuMA2CQ6IuHdmHhvI=;
 b=I1FAKag+Mo+aJVG0Pp6wvzNrqja4tyP3pQXpVpsQvs7miy8b2R++yViJnZF5BT6dy6
 +NxdHGIcZ6VaQE7+oo0q4j4aUtfl5FdszEAhEzKYM69WcTRn3v8oP8ZJUsQ9hSExaTjR
 z16dV2MzGd08HCL1Mqc6yF/JfrTnlyW+j11sMc9jFvRJMm5S6HnJAuLzo4GzEoO3JxVY
 rdDW96AllWkfWvQ5U6dD2CqUbVwgtY8bDpkG+1nxAwHXSlC/hAJOoIxAWaiqg+8iWtdw
 rbKiEr7RYM2dKvGILyn8D2frcR6sNqKzz0prrG+6EU8vyBRjgkAM/ntFlHqvE8CcD7bI
 mFBg==
X-Gm-Message-State: APjAAAVvGVSWhvJiRnI+xc8x8W5yUzcmQ8zgZZmLgZpOUSiA8MO42vPX
 HCQdMUSbadd5MO0zVUQMa45Ue0Q+ak8=
X-Google-Smtp-Source: APXvYqwEVpRoQEx/lp9VoQMHurBs9UHKkeS8gcPX9GjCYt/dyyXEeqOyGmJS+TZO9NR2UcjklhA9Nw==
X-Received: by 2002:ac2:558d:: with SMTP id v13mr645367lfg.76.1556899037507;
 Fri, 03 May 2019 08:57:17 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 p19sm492079lfc.48.2019.05.03.08.57.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:57:16 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-12-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <e6f933fb-c2ab-18e6-f8ac-37379d851855@gmail.com>
Date: Fri, 3 May 2019 18:57:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-12-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 11/20] xen/arm32: head: Don't set MAIR0 and
 MAIR1
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

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgY28tcHJvY2Vzc29yIHJlZ2lzdGVycyBNQUlSMCBhbmQgTUFJUjEgYXJlIG1hbmFnZWQgYnkg
RUwxLiBTbyB0aGVyZQo+IGFyZSBubyBuZWVkIHRvIGluaXRpYWxpemUgdGhlbSBkdXJpbmcgWGVu
IGJvb3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KCgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNv
bT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
