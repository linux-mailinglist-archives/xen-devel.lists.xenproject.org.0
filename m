Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1586C177830
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 15:04:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j987n-0004mq-V6; Tue, 03 Mar 2020 14:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wYci=4U=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j987m-0004ml-0I
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 14:02:18 +0000
X-Inumbo-ID: 97524846-5d57-11ea-8efe-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97524846-5d57-11ea-8efe-bc764e2007e4;
 Tue, 03 Mar 2020 14:02:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so3326222wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2020 06:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cr8W78+Tsmh9LFzvalzVs167hhjnv+OLAiax2sjGsHU=;
 b=AL5ylBE+459+xCDneiUEVIp3jd5rco6HmS5/xV5xJhYzMjH1xsc83qkgvehWlo3NvQ
 /AAsP0fLZf3Ygb4nlQzYKjMqoAKRiWMDyFiTcps7Yh/zUubxQQCyHkX0BRk3WySYlWS6
 gPQS5X77rD5QR8544i9Y2/uIATYY2whrm2hdLK+yjy/da9C2zZ/75CljnhBrXDjy9CyA
 C4N2bFYw4OPxIMMnDfV1HAn0Woz1tu3cKSqqzy7CEYsmPszLZSoIKOPUQxe52lBVe9tK
 jitaGnOeliSs6+zyIOCVOre/EJ7hPgFeHTdfonySgeAds4cEg04DJuSvtOadCCrAS1fG
 S29w==
X-Gm-Message-State: ANhLgQ3KWFUZJzUGdVCDDcd/IyfGiKUZPuvxwS2ihnsOfqetA0/89uT7
 oOLQ3JiIY+rx4dTbwo0upJw=
X-Google-Smtp-Source: ADFU+vsMR//f/uA0Daktw7+t22dlirD4FAIapPtyVTCMRTLqdw+/7AXFStyutDnFeR8rsdzKOjyTmQ==
X-Received: by 2002:a05:600c:301:: with SMTP id
 q1mr2215891wmd.182.1583244136706; 
 Tue, 03 Mar 2020 06:02:16 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id k7sm34413245wrq.12.2020.03.03.06.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 06:02:15 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204130614.15166-1-julien@xen.org>
 <20200204130614.15166-3-julien@xen.org>
 <3c1f1f91-6350-57de-2134-ab98bd4186d4@xen.org>
 <447cdd4f-cb30-d4ec-3cb9-852ff41c86f6@xen.org>
 <ebc81484-6596-13a6-7afe-d9406aa5945e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5250485f-a059-141c-e591-bedae191c373@xen.org>
Date: Tue, 3 Mar 2020 14:02:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ebc81484-6596-13a6-7afe-d9406aa5945e@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMy8wMy8yMDIwIDEzOjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwMy4wMy4yMDIw
IDEzOjIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFBpbmcgYWdhaW4uCj4gCj4gVG8gYmUgaG9u
ZXN0LCB3aXRoIHRoZSByZWNlbnQgbWFpbnRhaW5lciBjaGFuZ2UgaXQgd291bGQgcHJvYmFibHkK
PiBoYXZlIGJlZW4gaGVscGZ1bCBpZiB5b3UgaGFkIHNpbXBseSByZS1zZW50IHRoZSBwYXRjaC4K
CldlbGwsIEkgZG9uJ3QgdGhpbmsgeW91IGNhbiBleHBlY3QgYSBjb250cmlidXRvciB0byByZXNl
bmQgYSBwYXRjaCAKYmVjYXVzZSB0aGUgbWFpbnRhaW5lcnMgaGFzIGNoYW5nZWQuIEl0IHdvdWxk
IGhhdmUgYmVlbiBuaWNlciBpZiB0aGVyZSAKd2FzIGFuIGhhbmRvdmVyIHdpdGggdGhlIGxpc3Qg
b2YgcGVuZGluZyBwYXRjaGVzLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
