Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E2E97E90
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 17:22:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0SPW-0003QZ-6U; Wed, 21 Aug 2019 15:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VEBa=WR=gmail.com=bart.vanassche@srs-us1.protection.inumbo.net>)
 id 1i0SPU-0003QU-3x
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 15:20:28 +0000
X-Inumbo-ID: 3406ddc0-c427-11e9-8980-bc764e2007e4
Received: from mail-pl1-f195.google.com (unknown [209.85.214.195])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3406ddc0-c427-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 15:20:27 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id bj8so1506061plb.4
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2019 08:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3MUq+62+q1BeUoRQx7zO7y16Wzsx2TMcCZIVUVIU9eY=;
 b=fBjV52MAk9p3QzIA5oa7LqrfyehGeGwV6eDNCsILiX9yyoYaeRAJV2nn+gVgACgP9r
 ++mlRAsrIFcbvcY43/Y9a1ob0//M52R3lqTcH0LISVm/s45lQId72LIEM1MJL/JUQwe6
 JlczFmyjPAAU1lfvxw513rm3xQEQVhFj/bwtLZ/Hwf8OCln6p1vFp8VbRewF6s5R9xES
 0QMwBgZkaq3kuAgG6ghvafVJ7vc+CvFe/dnSvgyO9F9xunnr3jtJ89B6jutEIMLAGAbs
 TDoQsTLpnW3rcxVQzUh66dWjo3ennCtDul99e2xfDKgldEI2G6bFNVm9tuWUY+NDmyDH
 Je2A==
X-Gm-Message-State: APjAAAUXgczvOihvLU5xVmKtIaSRfdCgqOqTBd1iiklgsbV8OXYaD8K+
 pGt9G3uneN6HMp9WoxFf01I=
X-Google-Smtp-Source: APXvYqx6VTY8SvYnIPYD7H96skDVbqUBUIX20kmnwYVW6I6VpfiIPm7l7ctI4G1jHo6dMIyND4saiQ==
X-Received: by 2002:a17:902:543:: with SMTP id
 61mr34273025plf.20.1566400826268; 
 Wed, 21 Aug 2019 08:20:26 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com
 ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
 by smtp.gmail.com with ESMTPSA id s72sm31859475pgc.92.2019.08.21.08.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2019 08:20:25 -0700 (PDT)
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 linux-block@vger.kernel.org
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <1aaf1d56-c1a2-957c-28b6-048f9965f412@acm.org>
Date: Wed, 21 Aug 2019 08:20:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 0/9] block: use right accessor to read
 nr_sects
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

T24gOC8yMC8xOSAxMToxNCBQTSwgQ2hhaXRhbnlhIEt1bGthcm5pIHdyb3RlOgo+IEluIHRoZSBi
bGstem9uZWQsIGJjYWNoZSwgZjJmcywgdGFyZ2V0LXBzY3NpLCB4ZW4gYW5kIGJsa3RyYWNlCj4g
aW1wbGVtZW50YXRpb24gYmxvY2sgZGV2aWNlLT5oZF9wYXJ0LT5udW1iZXIgb2Ygc2VjdG9ycyBm
aWVsZCBpcwo+IGFjY2Vzc2VkIGRpcmVjdGx5IHdpdGhvdXQgYW55IGFwcHJvcHJpYXRlIGxvY2tp
bmcgb3IgYWNjZXNzb3IgZnVuY3Rpb24uCj4gVGhlcmUgaXMgYW4gZXhpc3RpbmcgYWNjZXNzb3Ig
ZnVuY3Rpb24gcHJlc2VudCBpbiB0aGUgaW4KPiBpbmNsdWRlL2xpbnV4L2dlbmhkLmggd2hpY2gg
c2hvdWxkIGJlIHVzZWQgdG8gcmVhZCB0aGUKPiBiZGV2LT5oZF9wYXJ0LT5ucl9zZWN0cy4KCkZv
ciB0aGUgZW50aXJlIHNlcmllczoKClJldmlld2VkLWJ5OiBCYXJ0IFZhbiBBc3NjaGUgPGJ2YW5h
c3NjaGVAYWNtLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
