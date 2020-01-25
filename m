Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3A14927A
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2020 02:12:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv9xB-0003Db-1g; Sat, 25 Jan 2020 01:09:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8SrB=3O=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1iv9x9-0003DW-8S
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2020 01:09:35 +0000
X-Inumbo-ID: 598f5ee2-3f0f-11ea-aecd-bc764e2007e4
Received: from mail-yw1-xc44.google.com (unknown [2607:f8b0:4864:20::c44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 598f5ee2-3f0f-11ea-aecd-bc764e2007e4;
 Sat, 25 Jan 2020 01:09:34 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id 10so1804205ywv.5
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 17:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4hVDXesdLOne+N7ysu+xdZeLT9JcPwIEN94mlT9+yjQ=;
 b=ZiSvL9PS850M7PKBxpFQtUfcYvXC9aMnibvUBcsyf0LKMF0dqpzik6RG6Q1218sRkh
 3+LzBW6KHwiiiY4YxNtX0hje2DVD9QNJ2udSv+mS7t+TdligZAvFEMXxohrFl9Trcqag
 0SP5UKWXEMB2IIRvXPyxhc4Pj2K43u6ujtxiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4hVDXesdLOne+N7ysu+xdZeLT9JcPwIEN94mlT9+yjQ=;
 b=FghoIyhE7+aWw4XVtnRPzG35keD8IJHvIwHsAfWH7tlavMbe37uO97ujHeVWFtE1bF
 4BVfqtroVYZ64JFX68TYgvczOh92clEtaKL0RgGaL+oRPWrhPReR3wmTHWdmX9pOWnqL
 xNpxofil/MUgw4DUPMck8tbroO+lj1BVoSCbMQJyJSkd6YWM2zMmdVPqLRksy8wfv9ov
 IUlvW12rPuxL4afN5FmqXt404mamLyskK8LAPTFPAhOXcXIBmMGoUE52tUj1tnr2uLZY
 MVPZVHCwa3K8A5ykiw0u/+OxUaTCHCgEWQ79Kwujf0E+rZAMfVJ8tRFIC8Ws3ye887Nx
 nAsA==
X-Gm-Message-State: APjAAAWTQKkBVp4baYtfgLlfc4Xut7DeglAD/iw1Spr8lnkcXVywtnci
 R7WvKnVdEC8uhfAi9Jng0tkaT3BI8dk=
X-Google-Smtp-Source: APXvYqwXcnxFYPW6RcfpS2P9n6rUZ9c1rENRId1s/mnI8Yhf8Kz+7npz+kDv0EOr47C+SJn7S3hX8A==
X-Received: by 2002:a81:a314:: with SMTP id a20mr4373978ywh.130.1579914574284; 
 Fri, 24 Jan 2020 17:09:34 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:e1ae:1c18:9094:78e3])
 by smtp.gmail.com with ESMTPSA id
 e187sm3060048ywd.7.2020.01.24.17.09.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 17:09:33 -0800 (PST)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
 <20200120115053.1010739-2-anthony.perard@citrix.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <74881ed3-03d9-42a5-5282-bc2149bb7c10@cardoe.com>
Date: Fri, 24 Jan 2020 19:09:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200120115053.1010739-2-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH 1/3] automation: Only build QEMU if
 Python >= 3.5
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzIwLzIwIDU6NTAgQU0sIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFJlY2VudCB2ZXJz
aW9uIG9mIFFFTVUgd2lsbCBub3QgYnVpbGQgYW55bW9yZSBpZiBQeXRob24gPCAzLjUuCj4gVGhh
dCBpcywgUUVNVSA0LjMgbm90IHJlbGVhc2VkIHlldC4KPiAKPiBUaGF0IGNoZWNrIHdvdWxkIGFs
c28gcHJldmVudCB0aGUgR2l0TGFiIENJIGZyb20gYnVpbGRpbmcgUUVNVSBpZgo+IHB5dGhvbjMg
YmluYXJ5IGlzbid0IHByZXNlbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogRG91ZyBHb2xkc3RlaW4gPGNh
cmRvZUBjYXJkb2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
