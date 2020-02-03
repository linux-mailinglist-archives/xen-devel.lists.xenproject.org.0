Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631611507E8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:03:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycHR-0001zC-6x; Mon, 03 Feb 2020 14:00:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HIUd=3X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iycHP-0001z3-G8
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:00:47 +0000
X-Inumbo-ID: 9353e4c4-468d-11ea-8e5a-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9353e4c4-468d-11ea-8e5a-12813bfff9fa;
 Mon, 03 Feb 2020 14:00:46 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j104so18286639wrj.7
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2020 06:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=282nBwfZJphiE65L4T2+372W8zllJ7xFV6pYAMgvPN0=;
 b=Nx8CBxZ9cI/NWJjI0WSe3ymiHUEFzvvkvjQxV3PN+dL70ZzVujHM8q34sOj0jHbt7q
 Cz9w4iSUoeMzvTqz3rJpWDlaKpQoCaztJuR1xi70PhVMGl9+HUzJYKtp1BvRsFrVy6EA
 U194Q8UNO40P0CZtNklHjjgnDM0RxD4aVZwhzVHBXwI2zaIdUto2e4y9NxhvnqRmGv3B
 9TdFJi/VuFFAsGg/Xl4uLMrMJ9P593V7wvZOxK8v82OglZ/qLlVKgIbEQSjG0+XK8ad3
 bLemg9wqZWKaZJRPd9N8HB2dKprvinhBAqGhZBBX+S5oMUT9FUbezHYrgSJ5azMW3ias
 1zuQ==
X-Gm-Message-State: APjAAAUwF/LkbZtANs04pkGMWWZcqZLvqaE5R6O41mCG/5gbr3HkPWFc
 ug0xJUDHj6UY6epSB32i9w0=
X-Google-Smtp-Source: APXvYqxxzDhztP2kLiR+agfMUr49qUDfeewfuodSnUW0HiXsHZWiYSnCIreMxNA71aEOXX/r2G/n/g==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr15836660wrx.102.1580738446059; 
 Mon, 03 Feb 2020 06:00:46 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id h2sm26253648wrt.45.2020.02.03.06.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 06:00:45 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-5-dwmw2@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <4eb039f7-597c-cc07-3fa9-29b60646ae7e@xen.org>
Date: Mon, 3 Feb 2020 14:00:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-5-dwmw2@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 5/8] xen/vmap: allow vmap() to be called
 during early boot
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGF2aWQsCgpPbiAwMS8wMi8yMDIwIDAwOjMzLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4g
RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCkkgYW0gYSBiaXQgY29u
Y2VybmVkIHdpdGggdGhpcyBjaGFuZ2UsIHBhcnRpY3VsYXJseSB0aGUgY29uc2VxdWVuY2UgdGhp
cyAKaGF2ZSBmb3IgdGhlIHBhZ2UtdGFibGVzLiBUaGVyZSBpcyBhbiBhc3N1bXB0aW9uIHRoYXQg
aW50ZXJtZWRpYXRlIApwYWdlLXRhYmxlcyBhbGxvY2F0ZWQgdmlhIHRoZSBib290IGFsbG9jYXRv
ciB3aWxsIG5ldmVyIGJlIGZyZWVkLgoKT24geDg2LCBhIGNhbGwgdG8gdnVubWFwKCkgd2lsbCBu
b3QgZnJlZSBwYWdlLXRhYmxlcywgYnV0IGEgc3Vic2VxdWVudCAKY2FsbCB0byB2bWFwKCkgbWF5
IGZyZWUgaXQgZGVwZW5kaW5nIG9uIHRoZSBtYXBwaW5nIHNpemUuIFNvIHdlIHdvdWxkIApjYWxs
IGZyZWVfZG9taGVhcF9wYWdlcygpIHJhdGhlciB0aGFuIGluaXRfaGVhcF9wYWdlcygpLgoKSSBh
bSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IGlzIHRoZSBmdWxsIGNvbnNlcXVlbmNlLCBidXQgSSB0
aGluayB0aGlzIGlzIAphIGNhbGwgZm9yIGludmVzdGlnYXRpb24gYW5kIHdyaXRlIGl0IGRvd24g
YSBzdW1tYXJ5IGluIHRoZSBjb21taXQgbWVzc2FnZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
