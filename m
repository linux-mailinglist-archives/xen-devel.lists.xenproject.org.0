Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C666C97E8A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 17:22:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0SNh-0002kb-QE; Wed, 21 Aug 2019 15:18:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VEBa=WR=gmail.com=bart.vanassche@srs-us1.protection.inumbo.net>)
 id 1i0SNg-0002kW-HG
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 15:18:36 +0000
X-Inumbo-ID: efd5cb84-c426-11e9-adc7-12813bfff9fa
Received: from mail-pf1-f193.google.com (unknown [209.85.210.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efd5cb84-c426-11e9-adc7-12813bfff9fa;
 Wed, 21 Aug 2019 15:18:32 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c81so1619401pfc.11
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2019 08:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cPgn/PFoCByY+PWlvj5b9AZN9a5jNavJRN/2PxPSIno=;
 b=TCHYRf8DE7qCGk44aPqGK+If5Pf/bhr8VRwn+djY3mppAGNv30awc75W8HYwWYUjGO
 nrLv6S4/Ao9aPDGMl7tVTSGakCWxh3y4TIBDYMCL6/zpF9M2tPt+R9zdqlIwlTAX+lPt
 x6jE68zT508ItbkTXvJGV7AgNfhjzxwQNW6fAktl8LOQQL0aAevnrKjlfF0KzAVIxhqj
 DzssKg9AJbu8YsGkuaXQDFYOlwiOUn4fndD1vXk1zy5jciqzEy5otmtDIaO4o0fLYf7N
 4Dp+YbPdN6pS6Mhw/CKfjmIvHl16OHz9ULqY+djwhENW1Gb37NwQy4P66TTbD2qw2IQc
 /vWA==
X-Gm-Message-State: APjAAAUKduDxtK6kvlT3gbbds6GHbW1TZ+IOOilOTnYzvXzGY7exO6X7
 KoYIQWmJVTB8+2DKiQnflAE=
X-Google-Smtp-Source: APXvYqy2L7AA2hz9ZXPWsXWD1fEa7Fk43rILvDcukCeG1BmZKwwhPZ2GXrWLLrTzPCyrP/BP2vReaA==
X-Received: by 2002:aa7:9799:: with SMTP id o25mr36325210pfp.74.1566400711891; 
 Wed, 21 Aug 2019 08:18:31 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com
 ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
 by smtp.gmail.com with ESMTPSA id b24sm22101467pgw.66.2019.08.21.08.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2019 08:18:31 -0700 (PDT)
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 linux-block@vger.kernel.org
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
 <20190821061423.3408-2-chaitanya.kulkarni@wdc.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <3e0917fc-290e-d1e6-3ba9-936accda0a2b@acm.org>
Date: Wed, 21 Aug 2019 08:18:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821061423.3408-2-chaitanya.kulkarni@wdc.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 1/9] block: add a helper function to read
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

T24gOC8yMC8xOSAxMToxNCBQTSwgQ2hhaXRhbnlhIEt1bGthcm5pIHdyb3RlOgo+IFRoaXMgcGF0
Y2ggaW50cm9kdWNlcyBoZWxwZXIgZnVuY3Rpb24gdG8gcmVhZCB0aGUgbnVtYmVyIG9mIHNlY3Rv
cnMKPiBmcm9tIHN0cnVjdCBibG9ja19kZXZpY2UtPmJkX3BhcnQgbWVtYmVyLiBGb3IgbW9yZSBk
ZXRhaWxzIFBsZWFzZSByZWZlcgo+IHRvIHRoZSBjb21tZW50IGluIHRoZSBpbmNsdWRlL2xpbnV4
L2dlbmhkLmggZm9yIHBhcnRfbnJfc2VjdHNfcmVhZCgpLgo+IAo+IFJldmlld2VkLWJ5OiBNaW53
b28gSW0gPG1pbndvby5pbS5kZXZAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gSy4g
UGV0ZXJzZW4gPG1hcnRpbi5wZXRlcnNlbkB4eHh4eHh4eHh4PgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXgpUaGlzIGxvb2tzIHdl
aXJkLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
