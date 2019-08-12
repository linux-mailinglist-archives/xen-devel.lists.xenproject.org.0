Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D48A0A8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 16:21:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxB9z-00063h-3p; Mon, 12 Aug 2019 14:18:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hSrg=WI=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1hxB9y-00063c-3f
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 14:18:54 +0000
X-Inumbo-ID: 1bda28c2-bd0c-11e9-8980-bc764e045a96
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1bda28c2-bd0c-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 14:18:51 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id b13so49766253pfo.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2019 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7rrMGWz+cOb7SutGzZqKRd+swOkY9Fr7uDlylm/LIEA=;
 b=Kk64r5VS2ussB1Th19KWQGM0tqg1CvhoXPzjTJeq2UhXZTRgzlKj2xRBylyqZp/Ji4
 XYspgHHlaMvUnCk6Vs+98dbPKx3L06DdBpKGgm5KO3X47SxEg64u8j1tQZSVJPH8TiR5
 akPX2w8NvMur/EGP1HYpH6N3i82x2laj6lSYHtkK4WRMqsOXUmthMfNDrZDzzf7wvB6q
 HtXguBSt7WGu4vKb/MV6ONqSRWNqz5tMgMXBDcj5qJhToi5HpK26fW/upGOc52ncqLfd
 ISP8EcrhIOlLyBQg5Cb6qTVx4NjXMrNwiqstVb8JgfSqbSKNm8EWLv3PUzUmdQLfM2TR
 ExSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7rrMGWz+cOb7SutGzZqKRd+swOkY9Fr7uDlylm/LIEA=;
 b=e8nMJbhm4cb4SoXhYoDV2Xyx4CvRsr8EOKmzBb7wJNpPRMSqdH+3fcAQmZSg6SjZ07
 5+Kx2PCiyXW8od62AtszCsk24kKO6cNPJsg7F/PLAe9XR4JROs343Puggti6RHgadn2m
 MLfdybOenGPQMemzRjPL3ndoRPodxe2BEebSIWZeRl3xqlQY3oUNPKy/NgSmGjpONiU0
 7qAjkTPGhJI09twyPS0Ebq4s0uyR6RssPXy60887dHGrH+EvrjqXd4/bnZyc3yfVWe1q
 0qBwLtmM5YwmwfszNQeQWtiB1PYEpjonJF6uScc+s3aNQDj9XuxvuaA0IRxDTyqwIQhI
 h90A==
X-Gm-Message-State: APjAAAUEyz7CvJi6e9GGJJoCC+QpeIVFLq6R3Af8W9OdHUIL60cRpY25
 M5xApX6+qKiG20GgXLUCKvXFNQ==
X-Google-Smtp-Source: APXvYqzbxyx0fmxJS1Ju4I3T95etCWQ9Tx7GsBM119oZzixfSTVP+n/gCY/etw1wPdiR6UM5OdrXjw==
X-Received: by 2002:aa7:8108:: with SMTP id b8mr16421518pfi.197.1565619531291; 
 Mon, 12 Aug 2019 07:18:51 -0700 (PDT)
Received: from [192.168.1.188] (66.29.164.166.static.utbb.net. [66.29.164.166])
 by smtp.gmail.com with ESMTPSA id o9sm70853775pgv.19.2019.08.12.07.18.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 07:18:50 -0700 (PDT)
To: Wenwen Wang <wenwen@cs.uga.edu>
References: <1565544202-3927-1-git-send-email-wenwen@cs.uga.edu>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <0b0bce35-a735-2484-37fa-11d7d3570a1b@kernel.dk>
Date: Mon, 12 Aug 2019 08:18:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565544202-3927-1-git-send-email-wenwen@cs.uga.edu>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/blkback: fix memory leaks
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
Cc: "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 "moderated list:XEN BLOCK SUBSYSTEM" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xMS8xOSAxMDoyMyBBTSwgV2Vud2VuIFdhbmcgd3JvdGU6Cj4gSW4gcmVhZF9wZXJfcmlu
Z19yZWZzKCksIGFmdGVyICdyZXEnIGFuZCByZWxhdGVkIG1lbW9yeSByZWdpb25zIGFyZQo+IGFs
bG9jYXRlZCwgeGVuX2Jsa2lmX21hcCgpIGlzIGludm9rZWQgdG8gbWFwIHRoZSBzaGFyZWQgZnJh
bWUsIGlycSwgYW5kCj4gZXRjLiBIb3dldmVyLCBpZiB0aGlzIG1hcHBpbmcgcHJvY2VzcyBmYWls
cywgbm8gY2xlYW51cCBpcyBwZXJmb3JtZWQsCj4gbGVhZGluZyB0byBtZW1vcnkgbGVha3MuIFRv
IGZpeCB0aGlzIGlzc3VlLCBpbnZva2UgdGhlIGNsZWFudXAgYmVmb3JlCj4gcmV0dXJuaW5nIHRo
ZSBlcnJvci4KCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApKZW5zIEF4Ym9lCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
