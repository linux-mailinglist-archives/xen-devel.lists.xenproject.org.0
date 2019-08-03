Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A67B806D6
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 16:51:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htvKz-0002Ew-11; Sat, 03 Aug 2019 14:48:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPa+=V7=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1htvKx-0002El-Uv
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 14:48:47 +0000
X-Inumbo-ID: cc69a09d-b5fd-11e9-8980-bc764e045a96
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc69a09d-b5fd-11e9-8980-bc764e045a96;
 Sat, 03 Aug 2019 14:48:47 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id x188so5672360yba.8
 for <xen-devel@lists.xenproject.org>; Sat, 03 Aug 2019 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=de8cCOkYOwpZc7pyS7CVRSM3TjphGM6S9KdlFfAj6Lw=;
 b=id822DBWbuSZakf12+fmPrKS/5vSygtNK+Sqh3pq/jGS+YxZu5+A6h/GU9HgUY0l8L
 g+295/CVrF+4OVX12GL055CD0rMIikNXWeJRyu7CJvrjix7co7qApP9vfvuxaSG/Wxjk
 9JgmQWSIyxJE9i9tHwz1ssVCrhsLcO5VsLmo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=de8cCOkYOwpZc7pyS7CVRSM3TjphGM6S9KdlFfAj6Lw=;
 b=O0oJjlGBQSB45+Pz9Lv21hkoQIMiAUeFB/Pd+MJIB1XYWhQDhV4sABdRqaQo78sGDu
 95zUNZntYSgpLOhhs2lS7xTm12F9G2c5lfbioX14VnfDiGeIj3B3e9vMbnU0qnyHd4/u
 e0yg/+wWdkmK9ZI2MpgBKZga1H8rVDM3zlmqOsL6GcMvl3Z9pDTlsRevbC74GEsYAZ3O
 1KWOSztrslk29rf0kIxVfc9KvB2Qx6CPVqJsyU5Tl/l9YPYzt4gpIs9DZ6I+MIOZqdcv
 APJQExsNnUodGtKruOGC3HO5NHdA3ywDMYxE5GBI/s+ssd941USde9GCv2Wugugg5OXS
 eJDQ==
X-Gm-Message-State: APjAAAUy8Im5aBi6KOYhswtNB3C34EE1rkRCcxrJmB1L5WJbHmFHikbo
 ek+ru736kAPDryhlBOmfnBI=
X-Google-Smtp-Source: APXvYqzdfg+XDJ+laL8wlrYuAS42ZNfonZiQGGjXQtD3KHd6bgmhrYWOmH8yq/kOdN2oa7AoV/babA==
X-Received: by 2002:a05:6902:4e1:: with SMTP id
 w1mr79068895ybs.247.1564843727039; 
 Sat, 03 Aug 2019 07:48:47 -0700 (PDT)
Received: from MacBook-Pro.localdomain
 ([2600:1700:7b90:52f0:a01d:69c7:44ec:418c])
 by smtp.gmail.com with ESMTPSA id v68sm18474723ywe.23.2019.08.03.07.48.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 03 Aug 2019 07:48:46 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
 <156459233172.7075.6811919592319549670.stgit@Palanthas>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <e01810fe-cd62-05e8-91a3-eddc0b3743cc@cardoe.com>
Date: Sat, 3 Aug 2019 09:48:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156459233172.7075.6811919592319549670.stgit@Palanthas>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] automation: build in openSUSE Tumbleweed
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

T24gNy8zMS8xOSAxMTo1OCBBTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cgo+IFNpZ25lZC1vZmYt
Ynk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+CkFja2VkLWJ5OiBEb3VnIEdv
bGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
