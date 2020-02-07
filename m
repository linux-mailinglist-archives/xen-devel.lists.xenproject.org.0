Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306B61559CB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 15:39:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j04kH-000353-Kp; Fri, 07 Feb 2020 14:36:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Msp=33=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1j04kG-00034V-3u
 for xen-devel@lists.xen.org; Fri, 07 Feb 2020 14:36:36 +0000
X-Inumbo-ID: 3d9f7c8c-49b7-11ea-b2cb-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d9f7c8c-49b7-11ea-b2cb-bc764e2007e4;
 Fri, 07 Feb 2020 14:36:35 +0000 (UTC)
Received: from localhost (unknown [IPv6:2001:982:756:1:57a7:3bfd:5e85:defb])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id AD9F515AD7E0D;
 Fri,  7 Feb 2020 06:36:31 -0800 (PST)
Date: Fri, 07 Feb 2020 15:36:30 +0100 (CET)
Message-Id: <20200207.153630.1432371073271757175.davem@davemloft.net>
To: sergey.dyasli@citrix.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200207142652.670-5-sergey.dyasli@citrix.com>
References: <20200207142652.670-1-sergey.dyasli@citrix.com>
 <20200207142652.670-5-sergey.dyasli@citrix.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 07 Feb 2020 06:36:34 -0800 (PST)
Subject: Re: [Xen-devel] [PATCH v3 4/4] xen/netback: fix grant copy across
 page boundary
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
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org,
 ross.lagerwall@citrix.com, netdev@vger.kernel.org, george.dunlap@citrix.com,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 xen-devel@lists.xen.org, paul@xen.org, linux-mm@kvack.org, glider@google.com,
 aryabinin@virtuozzo.com, boris.ostrovsky@oracle.com, akpm@linux-foundation.org,
 dvyukov@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgpEYXRlOiBGcmks
IDcgRmViIDIwMjAgMTQ6MjY6NTIgKzAwMDAKCj4gRnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3Mu
bGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4gCj4gV2hlbiBLQVNBTiAob3IgU0xVQl9ERUJVRykgaXMg
dHVybmVkIG9uLCB0aGVyZSBpcyBhIGhpZ2hlciBjaGFuY2UgdGhhdAo+IG5vbi1wb3dlci1vZi10
d28gYWxsb2NhdGlvbnMgYXJlIG5vdCBhbGlnbmVkIHRvIHRoZSBuZXh0IHBvd2VyIG9mIDIgb2YK
PiB0aGUgc2l6ZS4gVGhlcmVmb3JlLCBoYW5kbGUgZ3JhbnQgY29waWVzIHRoYXQgY3Jvc3MgcGFn
ZSBib3VuZGFyaWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxh
Z2Vyd2FsbEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdl
eS5keWFzbGlAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5v
cmc+CgpUaGlzIGlzIHBhcnQgb2YgYSBsYXJnZXIgcGF0Y2ggc2VyaWVzIHRvIHdoaWNoIG5ldGRl
diB3YXMgbm90IENDOidkCgpXaGVyZSBpcyB0aGlzIHBhdGNoIHRhcmdldHRlZCB0byBiZSBhcHBs
aWVkPwoKRG8geW91IGV4cGVjdCBhIG5ldHdvcmtpbmcgQUNLIG9uIHRoaXM/CgpQbGVhc2UgZG8g
bm90IHN1Ym1pdCBwYXRjaGVzIGluIHN1Y2ggYW4gYW1iaWd1b3VzIG1hbm5lciBsaWtlIHRoaXMK
aW4gdGhlIGZ1dHVyZSwgdGhhbmsgeW91LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
