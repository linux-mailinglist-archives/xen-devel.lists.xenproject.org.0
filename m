Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5E5E763
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 17:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hignF-0007Os-Dm; Wed, 03 Jul 2019 15:03:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lC9h=VA=gmail.com=bart.vanassche@srs-us1.protection.inumbo.net>)
 id 1hignE-0007On-3A
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 15:03:32 +0000
X-Inumbo-ID: b825946a-9da3-11e9-8980-bc764e045a96
Received: from mail-pf1-f194.google.com (unknown [209.85.210.194])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b825946a-9da3-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 15:03:30 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id r7so1426858pfl.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2019 08:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UpKw9Zxoxe8rge03LP2f6638eI4p8y0legXuCWEjCsI=;
 b=i9AiPiruVsrnAvJACqjBUyJLUI+scvc7hpC9K6cOpIUso2zrKY3fOIc3UkVgCSqhmq
 fGSE9/d4VzLfz0Rnrf+UCMwVgbjw1JViLy/YQU1hBVLB+eWKzUb8JLq4r3pm++GQDjGk
 6HP4tEsJKrKyDjAvComltQE713pNBf7cxhhLvHMidBFbQ6ZFZYRhwPzqPawQWPQVvmaG
 m4BSYjvIaugMJxmgHOq93VBKqtdrLaWSyo7zB5YpJS6+7uomqDizFzNH4HcjMehI1zr5
 A9jzchmc0uv8N13Wn55oCwmuxuj2dDUECNEfhKIVeXdeGBFRoY9Qq5vE0ULzlYaVDB2F
 cfIw==
X-Gm-Message-State: APjAAAXDGdK/3FzAxXMqs6v/Ken+7+5coagfwO0D0FEJXADafBKxNwFq
 mf73pAP6/ydMKi/ctZDZDDc=
X-Google-Smtp-Source: APXvYqyR83vJcx0j6MO8XREogh+x0eiGjMP5GA+fOFSvZ7wYxEQvReZcXoMSmjWhPLNI5xsp0sPuDQ==
X-Received: by 2002:a17:90a:ff17:: with SMTP id
 ce23mr13281431pjb.47.1562166210114; 
 Wed, 03 Jul 2019 08:03:30 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com
 ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
 by smtp.gmail.com with ESMTPSA id o13sm2450376pje.28.2019.07.03.08.03.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 08:03:29 -0700 (PDT)
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 linux-block@vger.kernel.org
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
 <20190702174236.3332-2-chaitanya.kulkarni@wdc.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <26917678-fd82-b6c8-761e-220bc7d3b179@acm.org>
Date: Wed, 3 Jul 2019 08:03:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702174236.3332-2-chaitanya.kulkarni@wdc.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 1/9] block: add a helper function to read
 nr_setcs
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com, yuchao0@huawei.com,
 colyli@suse.de, linux-bcache@vger.kernel.org, jaegeuk@kernel.org,
 xen-devel@lists.xenproject.org, kent.overstreet@gmail.com,
 roger.pau@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8yLzE5IDEwOjQyIEFNLCBDaGFpdGFueWEgS3Vsa2Fybmkgd3JvdGU6Cj4gKy8qIEhlbHBl
ciBmdW5jdGlvbiB0byByZWFkIHRoZSBiZGV2LT5iZF9wYXJ0LT5ucl9zZWN0cyAqLwo+ICtzdGF0
aWMgaW5saW5lIHNlY3Rvcl90IGJkZXZfbnJfc2VjdHMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRl
dikKPiArewo+ICsJcmV0dXJuIHBhcnRfbnJfc2VjdHNfcmVhZChiZGV2LT5iZF9wYXJ0KTsKPiAr
fQoKSXMgdGhlIGNvbW1lbnQgYWJvdmUgYmRldl9ucl9zZWN0cygpIHJlYWxseSB1c2VmdWwgb3Ig
c2hvdWxkIGl0IGJlIGxlZnQgb3V0PwoKVGhhbmtzLAoKQmFydC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
