Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B317338B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:12:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7bef-00066P-Lx; Fri, 28 Feb 2020 09:09:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vg/s=4Q=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7bee-00066K-EO
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:09:56 +0000
X-Inumbo-ID: 157a92b0-5a0a-11ea-98d9-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 157a92b0-5a0a-11ea-98d9-12813bfff9fa;
 Fri, 28 Feb 2020 09:09:54 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id m13so2500781edb.6
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 01:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ETc87VMe+lyZp0hogeDH/T8Nj3OwH2T1s2PQI2utfv0=;
 b=L+riGGeM5yUqclYyyIr98GOLTUP+xAEfXNkjGowd9DA0eazEuA5HLhsMjia4Po3pWs
 xhYa6Q8h5mD3wS//h9l9ls5f61vFyJ48IssdM9LNvfgEQoVxDErQKGDvD1ff8M9/45jH
 s7MYg9dHZL1dBTWnoTipPIdAZcxBMZst9VjV+wkdtD8MWs92k1kZ8IvGOOgCjotyDj9z
 1t6D3Bhd35AOh1X4MP4IeUB4bEGugrPhAhBKO/pfFUCj5XhHa0kbtYZNPpGFBN0m/LpU
 n09mzfdVUMfnyb5jPcGMlYjWlWzdoJrGi4ywI54k7MI5RLu6+4NgQfjQuUBoT3CbxDQ3
 J6CQ==
X-Gm-Message-State: APjAAAXxvOMqAV6ikK/xRh6UStH8OjT/gNMufP2gItY8ORyCN25RUym9
 JZNmVSD479b5bNbjiP3xI2g=
X-Google-Smtp-Source: APXvYqzFJXA3WHd69SFFCQvrJKhXSNoN3Qz/iTt/YOFxqoOXKCyAKf77LiXpBR1XnbqulXNt0R+ZbA==
X-Received: by 2002:a17:906:8247:: with SMTP id
 f7mr3308177ejx.320.1582880994046; 
 Fri, 28 Feb 2020 01:09:54 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id p16sm510334edr.83.2020.02.28.01.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 01:09:53 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20200227184602.28282-1-andrew.cooper3@citrix.com>
 <7a55cd17-e006-ea81-0242-7a982aa89861@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3c361cbd-06f3-9178-054b-131f91c28c72@xen.org>
Date: Fri, 28 Feb 2020 09:09:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7a55cd17-e006-ea81-0242-7a982aa89861@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/grant: Fix signed/unsigned comparisons
 issues
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjgvMDIvMjAyMCAwODo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcu
MDIuMjAyMCAxOTo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRWFjaCBmdW5jdGlvbiB0YWtl
cyBhbiB1bnNpZ25lZCBjb3VudCwgYW5kIGxvb3BzIGJhc2VkIG9uIGEgc2lnbmVkIGkuICBUaGlz
Cj4+IGNhdXNlcyBwcm9ibGVtcyB3aGVuIGJldHdlZW4gMiBhbmQgNCBiaWxsaW9uIG9wZXJhdGlv
bnMgYXJlIHJlcXVlc3RlZC4KPiAKPiBJIGNhbiBzZWUgcHJvYmxlbXMsIGJ1dCBub3QgKGFzIHRo
ZSB0aXRsZSBzYXlzKSB3aXRoIGNvbXBhcmlzb24gaXNzdWVzCj4gKHRoZSBzaWduZWQgaSBnZXRz
IGNvbnZlcnRlZCB0byB1bnNpZ25lZCBmb3IgdGhlIHB1cnBvc2Ugb2YgdGhlCj4gY29tcGFyaXNv
bikuCj4gCj4+IEluIHByYWN0aWNlLCBzaWduZWQtbmVzcyBpc3N1ZXMgYXJlbid0IHBvc3NpYmxl
IGJlY2F1c2UgY291bnQgZXhjZWVkaW5nCj4+IElOVF9NQVggaXMgZXhjbHVkZWQgZWFybGllciBp
biBkb19ncmFudF9vcCgpLCBidXQgdGhlIGNvZGUgcmVhZHMgYXMgaWYgaXQgaXMKPj4gYnVnZ3ks
IGFuZCBHQ0Mgb2J2aW91c2x5IGNhbid0IHNwb3QgdGhpcyBlaXRoZXIuCj4+Cj4+IEJsb2F0LW8t
bWV0ZXIgcmVwb3J0czoKPj4gICAgYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAwLzQgdXAv
ZG93bjogMC8tOTUgKC05NSkKPj4gICAgRnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQo+PiAgICBkb19ncmFudF90YWJsZV9vcCAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDcxNTUgICAgNzE0MCAgICAgLTE1Cj4+ICAgIGdudHRh
Yl90cmFuc2ZlciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjczMiAgICAyNzE2ICAgICAt
MTYKPj4gICAgZ250dGFiX3VubWFwX2dyYW50X3JlZiAgICAgICAgICAgICAgICAgICAgICAgNzcx
ICAgICA3MzkgICAgIC0zMgo+PiAgICBnbnR0YWJfdW5tYXBfYW5kX3JlcGxhY2UgICAgICAgICAg
ICAgICAgICAgICA3NzEgICAgIDczOSAgICAgLTMyCj4+ICAgIFRvdGFsOiBCZWZvcmU9Mjk5NjM2
NCwgQWZ0ZXI9Mjk5NjI2OSwgY2hnIC0wLjAwJQo+Pgo+PiBhbmQgaW5zcGVjdGlvbiBvZiBnbnR0
YWJfdW5tYXBfZ3JhbnRfcmVmKCkgYXQgbGVhc3QgcmV2ZWFscyBvbmUgZmV3ZXIgbG9jYWwKPj4g
dmFyaWFibGVzIG9uIHRoZSBzdGFjay4KPiAKPiBUaGlzIGlzIGEgZ29vZCB0aGluZyBmb3IgeDg2
LiBIb3dldmVyLCBoYXZpbmcgc3RhcnRlZCB0byBmYW1pbGlhcml6ZQo+IG15c2VsZiBhIHRpbnkg
Yml0IHdpdGggUklTQy1WLCBJJ20gbm8gbG9uZ2VyIGNlcnRhaW4gb3VyIHByZXNlbnQgd2F5Cj4g
b2YgcHJlZmVycmluZyB1bnNpZ25lZCBpbnQgZm9yIGFycmF5IGluZGV4aW5nIHZhcmlhYmxlIGFu
ZCBhbGlrZSBpcwo+IGFjdHVhbGx5IGEgZ29vZCB0aGluZyB3aXRob3V0IGZ1cnRoZXIgYWJzdHJh
Y3Rpb24uIE5ldmVydGhlbGVzcywgdGhpcwo+IGlzbid0IGFuIGltbWVkaWF0ZSBpc3N1ZSwgc28g
Li4uCgpXb3VsZCB5b3UgbWluZCBleHBhbmRpbmcgYSBiaXQgbW9yZSBhYm91dCB0aGlzIGNvbW1l
bnQgaGVyZT8gSG93IAp1bnNpZ25lZCBpbnQgaXMgZ29pbmcgdG8gbWFrZSB0aGluZ3Mgd29yc2Ug
b24gUklTQy1WPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
