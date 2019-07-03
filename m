Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08665DDC1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 07:28:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiXlw-00062H-As; Wed, 03 Jul 2019 05:25:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ilX4=VA=gmail.com=minwoo.im.dev@srs-us1.protection.inumbo.net>)
 id 1hiXlu-00062C-BD
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 05:25:34 +0000
X-Inumbo-ID: f9f4b4ac-9d52-11e9-8980-bc764e045a96
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f9f4b4ac-9d52-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 05:25:32 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b7so557739pls.6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2019 22:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=r6I6wc5B3tGetonqRKuXvbIfduj5xwDTVPvTS3gafAE=;
 b=CZQNmmjFRPz2c0ELVDfpA3j7aSVWE+5Qg1vfMOIG2VWjD9mJh1UaZP7ZQpUm45tT4I
 G89/bEHPJDS+5bqZxR0gWH9CPLadIBhjLBtmwSVbNDQlvJJw4w4R+QnuH1Lm+6sibJvt
 VWMU5qjzV4ZMyNpb71v+K4HBk94SUBZnTTJoTAt55EZg7HnXciFXunOBa93B+dqEOrNC
 OVYuwGlsRiBHK07HQd8UIz35gbq+0al/pZfht/zKee9EjcZw9py+3HkGQ8SQ+fNzrxnk
 Lt5R8PzTiN5nfhRKdxyySR177s69/YA/ZQt9f+kD1Gfw9Ouh3SKlNCp85vmzYGaek7Ha
 cb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r6I6wc5B3tGetonqRKuXvbIfduj5xwDTVPvTS3gafAE=;
 b=q93eO7AH74hHEDlQM1XuVB9PJc8jyWzV5Lr8UnTiSGHXzKjDWxP1MIICKFZWVDZYj8
 8bLA+i+v2X0+wbNGbPT+Mru1wkEND3IC2Sf0xZFa7edjcdZQGt/XA8HVXFKNf3t4IeWW
 mCAuVgD42A+9+O5IaCFX1ylmVyURsWDGKqWR7Ie5c/vcnYazOAe5q2gS9d7AZuA0w6Dr
 bXyGaO50pivgVxCiybg/9RonD1+qsZADmviKYvZ62Hy1XTyZECkZvV/pE+jBrDPkcTrG
 iW9gQbSM9JKQ4Dp97A3UWYaZVm+AmXk4ZmjosPDuOsS4GFp7ZIfMAV91ZT8Tigy3/hWa
 30YQ==
X-Gm-Message-State: APjAAAWKRhCkElKLWEg1qf+Gx1n5mB2kaJS/Xc2jLeQmJDo1qSJPyLvU
 Cnm5ybUo01x9FS58qh/jKqY=
X-Google-Smtp-Source: APXvYqyh2xiiI7N7Hxwuc+2RWnCTE22iy7sXtxhYXynsUmnx/rtn6Fz0u+M/S3UPLVrtIJWjrgu02g==
X-Received: by 2002:a17:902:a612:: with SMTP id
 u18mr38729348plq.181.1562131531447; 
 Tue, 02 Jul 2019 22:25:31 -0700 (PDT)
Received: from localhost ([123.213.206.190])
 by smtp.gmail.com with ESMTPSA id h14sm770155pgn.51.2019.07.02.22.25.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 22:25:30 -0700 (PDT)
Date: Wed, 3 Jul 2019 14:25:28 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Message-ID: <20190703052528.GB21258@minwoo-desktop>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
 <20190702174236.3332-5-chaitanya.kulkarni@wdc.com>
 <20190703002347.GE15705@minwoo-desktop>
 <DM6PR04MB5754D27FC41D86E2D419DD6C86FB0@DM6PR04MB5754.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR04MB5754D27FC41D86E2D419DD6C86FB0@DM6PR04MB5754.namprd04.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-btrace@vger.kernel.org" <linux-btrace@vger.kernel.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuchao0@huawei.com" <yuchao0@huawei.com>, "colyli@suse.de" <colyli@suse.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kent.overstreet@gmail.com" <kent.overstreet@gmail.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTktMDctMDMgMDI6Mjk6MzMsIENoYWl0YW55YSBLdWxrYXJuaSB3cm90ZToKPiBPbiA3LzIv
MTkgNToyMyBQTSwgTWlud29vIEltIHdyb3RlOgo+ID4gT24gMTktMDctMDIgMTA6NDI6MzAsIENo
YWl0YW55YSBLdWxrYXJuaSB3cm90ZToKPiA+PiBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIGJsa2Rl
dl9yZXNldF96b25lcygpIHdpdGggbmV3bHkgaW50cm9kdWNlZAo+ID4+IGhlbHBlciBmdW5jdGlv
biB0byByZWFkIHRoZSBucl9zZWN0cyBmcm9tIGJsb2NrIGRldmljZSdzIGhkX3BhcnRzIHdpdGgK
PiA+PiB0aGUgaGVscCBvZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KPiA+IENoYWl0YW55YSwKPiA+
Cj4gPiBBcmUgdGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgc3BsaXQgZm9yIGEgc3BlY2lhbCByZWFz
b24/ICBJTUhPLCBpdCBjb3VsZAo+ID4gYmUgc3F1YXNoZWQgaW50byBhIHNpbmdsZSBvbmUuCj4g
Pgo+ID4gSXQgbG9va3MgZ29vZCB0byBtZSwgYnkgdGhlIHdheS4KPiAKPiBJbiB0aGUgYmxrLXpv
bmVkLmMgaW4gdGhpcyB3YXkgaXQgaXMgZWFzaWVyIHRvIGJpc2VjdCBpZi93aGVuIHRoZSBwcm9i
bGVtCj4gCj4gY29tZXMuCgpPaCBva2F5LiAgVGhhdCBtYWtlcyBzZW5zZS4KClRoYW5rcywgQ2hh
aXRhbnlhLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
