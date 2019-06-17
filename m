Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC20483C5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 15:22:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcrWH-00041Q-2B; Mon, 17 Jun 2019 13:17:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CmRm=UQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hcrWF-00041L-FB
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 13:17:55 +0000
X-Inumbo-ID: 50864706-9102-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 50864706-9102-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 13:17:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1560777473; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=KDFxJqGULiUivMvO8GTLJTk3oDPYxpBq+LMcHpS1KRM=;
 b=eK7OEoqw8rCYxNRLKDYKyguiAAebWkYat5DXpoCqYgmj4SDyFwZ8xo9IQaz8WxsAuiyiASWJ
 /YzXQxa4rmzBxijVNnAN0FwARLd02Nk+HTN6brgwKOLc59vb8sPkAwJEfmwqqT62YvdSZH3c
 4GVgi81LmhRuozNai4ZyWMA1OAM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mxa.mailgun.org with ESMTP id 5d0784f1.7f3002e467b0-smtp-out-n02;
 Mon, 17 Jun 2019 12:17:53 -0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id x4so9703214wrt.6
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2019 05:17:52 -0700 (PDT)
X-Gm-Message-State: APjAAAXQ3DPjkQ6etC6QMu4UeqprVnAunT1tDmz3//4OR+bzf1oEJlOH
 DVdUfcKAkMI+JfiPpVVq7dsgLPlN3KVX1ilJymM=
X-Google-Smtp-Source: APXvYqw7gq0lEzE06F0s1c37SbD5a8MJaZfhv5n9ej5++cdYSS2R0dKuO6Q2SycxytQkeqSPw+FN2nFZgMsNV8ri7qI=
X-Received: by 2002:a5d:4b43:: with SMTP id w3mr11387412wrs.166.1560773872218; 
 Mon, 17 Jun 2019 05:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-4-tamas@tklengyel.com>
In-Reply-To: <20190516213752.1701-4-tamas@tklengyel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 17 Jun 2019 14:17:15 +0200
X-Gmail-Original-Message-ID: <CABfawhmf9odMmfb42xUKy6viUD384Pd_u2BNjzR1H8x99FFbzw@mail.gmail.com>
Message-ID: <CABfawhmf9odMmfb42xUKy6viUD384Pd_u2BNjzR1H8x99FFbzw@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [PATCH v5 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MzggUE0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPiB3cm90ZToKPgo+IERpc2FibGUgaXQgYnkgZGVmYXVsdCBhcyBpdCBpcyBv
bmx5IGFuIGV4cGVyaW1lbnRhbCBzdWJzeXN0ZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBL
IExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpQYXRjaCBwaW5nLCBhcmUgYW55IG1vcmUg
YWNrJ3MgbWlzc2luZyBvbiB0aGlzIG9uZT8gQ3VycmVudCB0YWxseSBpczoKCkFja2VkLWJ5OiBS
YXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CkFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkFja2VkLWJ5OiBEYW5pZWwgRGUgR3JhYWYgPGRn
ZGVncmFAdHljaG8ubnNhLmdvdj4KClRoaXMgcGF0Y2ggY291bGQgYmUgbWVyZ2VkIHNlcGFyYXRl
IGZyb20gdGhlIHNlcmllcyBJIHBvc3RlZCBpdCBhcyBwYXJ0IG9mLgoKVGhhbmtzLApUYW1hcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
