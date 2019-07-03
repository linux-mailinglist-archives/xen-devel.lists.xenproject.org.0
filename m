Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63C5DD80
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 06:37:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiWy4-0001Wd-F0; Wed, 03 Jul 2019 04:34:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ilX4=VA=gmail.com=minwoo.im.dev@srs-us1.protection.inumbo.net>)
 id 1hiT3x-0007Lm-Cw
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 00:23:53 +0000
X-Inumbo-ID: d58ac2c5-9d28-11e9-8980-bc764e045a96
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d58ac2c5-9d28-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 00:23:52 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id c13so226788pgg.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2019 17:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RHRpDgwuVrgTUZrVeC/DWcppQoZgBwyoX6yUIa5nxw0=;
 b=uEw2tqOOvpzS7lgKZQ1UE6HLk03zu/ltUnP+fEoKgiIzoSOQ1CznTyBFvQHqSe8gWD
 ooB1noO/sOpR9opDZyb5Jhx22qlulHHFhz/w0nQt+2scVy45cKOVFnsEt84G8Hdg8AMh
 bSpT40ce4fwwNLJCExWMA2az+nVBgeQ5DLo0LWdoYGAVesfMxKEBANFUgqEBEJRFmoTZ
 5kO3/0y6ofZ1sHIWaN2fO37s/g37+o1BIqI8uz8d/t4ftbIyBqZwd3TlZYDDcbmlarO7
 tq9YVQo9XHW+Ag8i0wJSx9aQ/oUwsAnop/8u1yIY4a88wjrq3GZtAtDSh9l8mgYyb6ZN
 6v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RHRpDgwuVrgTUZrVeC/DWcppQoZgBwyoX6yUIa5nxw0=;
 b=E4vbWsktC6UAak8peHRmhAiEs0TMwIFiwLY3F0b0bCLNBO8a7MMcGzePz/ibV0mKW9
 x6OWoQj7VLT3m6ll6tolzW/VpTv01mp7/7GNrtw+fbTVWJu9M3rfklTYZI6q7OfmHARK
 bUYkncGr4+kaqG4zxe7CWlvnr4UXpqVOXBUAJ+cyemC2kF+S6fsFDO+16SU4bQiGKoti
 507xdPmJQR6mSJ0wGkoqhckgPzORMsZYNsSvfaC09Ji1cpqsGc18m4jKH17xAfrgo1So
 FiGpoiP69TqzcAbpZ62xBY81sVjKDy9z31wp0rm/syWAl6jdFun6RyPnFQudp74F/sbF
 ou7g==
X-Gm-Message-State: APjAAAWtQyy2KXNdZuzvK/xeSlqWAKDSqs7XcwEVxoPJrhiFjCTlhDBR
 iHqaCaI5d62UJiCRgaXmdRE=
X-Google-Smtp-Source: APXvYqyhFQu0ujFbRWIByTBXPw8+e+SmZdlz5g9lzglnzFcMkXFOtvOW/RoMDBBBeY2YXLDY5aO+Eg==
X-Received: by 2002:a63:296:: with SMTP id 144mr34044286pgc.141.1562113431489; 
 Tue, 02 Jul 2019 17:23:51 -0700 (PDT)
Received: from localhost ([123.213.206.190])
 by smtp.gmail.com with ESMTPSA id t9sm164581pji.18.2019.07.02.17.23.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 17:23:50 -0700 (PDT)
Date: Wed, 3 Jul 2019 09:23:47 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20190703002347.GE15705@minwoo-desktop>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
 <20190702174236.3332-5-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702174236.3332-5-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Wed, 03 Jul 2019 04:34:02 +0000
Subject: Re: [Xen-devel] [PATCH V3 4/9] blk-zoned: update
 blkdev_reset_zones() with helper
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com, yuchao0@huawei.com,
 colyli@suse.de, linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Minwoo Im <minwoo.im.dev@gmail.com>, jaegeuk@kernel.org,
 xen-devel@lists.xenproject.org, kent.overstreet@gmail.com,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTktMDctMDIgMTA6NDI6MzAsIENoYWl0YW55YSBLdWxrYXJuaSB3cm90ZToKPiBUaGlzIHBh
dGNoIHVwZGF0ZXMgdGhlIGJsa2Rldl9yZXNldF96b25lcygpIHdpdGggbmV3bHkgaW50cm9kdWNl
ZAo+IGhlbHBlciBmdW5jdGlvbiB0byByZWFkIHRoZSBucl9zZWN0cyBmcm9tIGJsb2NrIGRldmlj
ZSdzIGhkX3BhcnRzIHdpdGgKPiB0aGUgaGVscCBvZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KCkNo
YWl0YW55YSwKCkFyZSB0aGUgZmlyc3QgdGhyZWUgcGF0Y2hlcyBzcGxpdCBmb3IgYSBzcGVjaWFs
IHJlYXNvbj8gIElNSE8sIGl0IGNvdWxkCmJlIHNxdWFzaGVkIGludG8gYSBzaW5nbGUgb25lLgoK
SXQgbG9va3MgZ29vZCB0byBtZSwgYnkgdGhlIHdheS4KClJldmlld2VkLWJ5OiBNaW53b28gSW0g
PG1pbndvby5pbS5kZXZAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
