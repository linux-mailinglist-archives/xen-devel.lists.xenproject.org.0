Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E5806D2
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 16:50:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htvJw-00027n-6v; Sat, 03 Aug 2019 14:47:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPa+=V7=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1htvJt-00027f-S6
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 14:47:41 +0000
X-Inumbo-ID: a4c07e11-b5fd-11e9-8980-bc764e045a96
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a4c07e11-b5fd-11e9-8980-bc764e045a96;
 Sat, 03 Aug 2019 14:47:40 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id y123so24804783yby.10
 for <xen-devel@lists.xenproject.org>; Sat, 03 Aug 2019 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6CC2T1rkkU6YkMnwJ8CLZmrzTtwN394zBH0avqrKcSg=;
 b=OYGpJivEJb3CY2eLamjzhK1I/UlHsvU3MV+4pgNW/mY2Yxnp5Smj/yi57/9Ge70/Qz
 FAhwQCVNoKBeBCRK+wKfvo0OPNPrJGJ591ePJucGvVVavvjW6MgaEnIgx1k6I3ZKAhLZ
 aUoN/Wyha1HN/cX/e5hwhrxkfBOFBWELIgNS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6CC2T1rkkU6YkMnwJ8CLZmrzTtwN394zBH0avqrKcSg=;
 b=PwLWY1aPFbeSAT3+YyF5xi2fVN3N8KGo2n1fpPkyF2xZR3K5gZMkyYUtOw+ErXQ+/B
 Mhyus6Bp19u0HaKVskxVCNMvMd7lIl7KnercG2dtIlpOK9OZSpwJiD3XNzct1kTs8zyg
 SNbOqvSKNeNu40M9o0koTC/XZSBBN7OIug71BJEO5kK6wzFe1qMgg3BWdtAQtUgA3dGz
 L8qNPRGb7yDpfG/3mGfrGIqivIplWDOyvpFJetaRMCRiW8cE8CfpsGtia4bj74oSmqBa
 wiVt0jegtCdBhPkSoOXAUGhgGPQQzaMO4flFJpsQAMnpDp6EnBxvH5ZmyQ2AlbtHvypR
 WyrA==
X-Gm-Message-State: APjAAAV0Pt0p5DzQAzGhEboZjORHQgR8f0M8/mIhDZcWq65wsl2kCe8a
 ynwoT+BRurFtwaKqJfWyOa0=
X-Google-Smtp-Source: APXvYqywR3lF3t34y+i6G/bdzPcu4K0Dz+WEGQPk8zM7N3UEB2hGerDvgJ2tGss/xnafd9wS2rmgHg==
X-Received: by 2002:a25:d196:: with SMTP id i144mr6100019ybg.514.1564843660526; 
 Sat, 03 Aug 2019 07:47:40 -0700 (PDT)
Received: from MacBook-Pro.localdomain
 ([2600:1700:7b90:52f0:a01d:69c7:44ec:418c])
 by smtp.gmail.com with ESMTPSA id y3sm18083006ywa.47.2019.08.03.07.47.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 03 Aug 2019 07:47:39 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
 <156459232072.7075.5517516860417287661.stgit@Palanthas>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <8ea46b9a-5ad1-3ea9-0d06-35d3c7081b0e@cardoe.com>
Date: Sat, 3 Aug 2019 09:47:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156459232072.7075.5517516860417287661.stgit@Palanthas>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] automation: try to keep openSUSE Leap
 image a little smaller
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
Cc: Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8zMS8xOSAxMTo1OCBBTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cgo+IFVzaW5nIGAtLW5v
LXJlY29tbWVuZHNgIHdoZW4gdXBkYXRpbmcgb3IgaW5zdGFsbGluZyBjb21tYW5kcyBzaG91bGQK
PiBwcmV2ZW50IG5vbiBzdHJpY3RseSBuZWNlc3NhcnkgcGFja2FnZXMgdG8gYmUgaW5zdGFsbGVk
Lgo+Cj4gZG9pbmcgYSBgY2xlYW4gLWFgIGFmdGVyIGluc3RhbGxpbmcgYWxsIHRoZSBwYWNrYWdl
cywgc2hvdWxkLCBpbgo+IHRoZW9yeSwgZnJlZSBtb3JlIHNwYWNlIChhcyBvcHBvc2VkIHRvIHVz
aW5nIGp1c3QgYGNsZWFuYCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZh
Z2dpb2xpQHN1c2UuY29tPgpBY2tlZC1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2Uu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
