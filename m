Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C10C45BF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 03:54:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFTn8-0000Aa-5P; Wed, 02 Oct 2019 01:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SC+b=X3=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1iFTn6-0000AS-UT
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 01:50:56 +0000
X-Inumbo-ID: 12c52102-e4b7-11e9-b588-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by localhost (Halon) with ESMTPS
 id 12c52102-e4b7-11e9-b588-bc764e2007e4;
 Wed, 02 Oct 2019 01:50:56 +0000 (UTC)
Received: from localhost (unknown
 [IPv6:2603:3023:50c:85e1:b5c5:ae11:3e54:6a07])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id E58B51530FB4F;
 Tue,  1 Oct 2019 18:50:54 -0700 (PDT)
Date: Tue, 01 Oct 2019 21:50:54 -0400 (EDT)
Message-Id: <20191001.215054.2217306306286086981.davem@davemloft.net>
To: dongli.zhang@oracle.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <1569938201-23620-1-git-send-email-dongli.zhang@oracle.com>
References: <1569938201-23620-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 01 Oct 2019 18:50:55 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH v2 1/1] xen-netfront: do not use ~0U as
 error return value for xennet_fill_frags()
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
Cc: jgross@suse.com, sstabellini@kernel.org, netdev@vger.kernel.org,
 joe.jin@oracle.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KRGF0ZTogVHVlLCAg
MSBPY3QgMjAxOSAyMTo1Njo0MSArMDgwMAoKPiB4ZW5uZXRfZmlsbF9mcmFncygpIHVzZXMgfjBV
IGFzIHJldHVybiB2YWx1ZSB3aGVuIHRoZSBza19idWZmIGlzIG5vdCBhYmxlCj4gdG8gY2FjaGUg
ZXh0cmEgZnJhZ21lbnRzLiBUaGlzIGlzIGluY29ycmVjdCBiZWNhdXNlIHRoZSByZXR1cm4gdHlw
ZSBvZgo+IHhlbm5ldF9maWxsX2ZyYWdzKCkgaXMgUklOR19JRFggYW5kIDB4ZmZmZmZmZmYgaXMg
YW4gZXhwZWN0ZWQgdmFsdWUgZm9yCj4gcmluZyBidWZmZXIgaW5kZXguCj4gCj4gSW4gdGhlIHNp
dHVhdGlvbiB3aGVuIHRoZSByc3BfY29ucyBpcyBhcHByb2FjaGluZyAweGZmZmZmZmZmLCB0aGUg
cmV0dXJuCj4gdmFsdWUgb2YgeGVubmV0X2ZpbGxfZnJhZ3MoKSBtYXkgYmVjb21lIDB4ZmZmZmZm
ZmYgd2hpY2ggeGVubmV0X3BvbGwoKSAodGhlCj4gY2FsbGVyKSB3b3VsZCByZWdhcmQgYXMgZXJy
b3IuIEFzIGEgcmVzdWx0LCBxdWV1ZS0+cngucnNwX2NvbnMgaXMgc2V0Cj4gaW5jb3JyZWN0bHkg
YmVjYXVzZSBpdCBpcyB1cGRhdGVkIG9ubHkgd2hlbiB0aGVyZSBpcyBlcnJvci4gSWYgdGhlcmUg
aXMgbm8KPiBlcnJvciwgeGVubmV0X3BvbGwoKSB3b3VsZCBiZSByZXNwb25zaWJsZSB0byB1cGRh
dGUgcXVldWUtPnJ4LnJzcF9jb25zLgo+IEZpbmFsbHksIHF1ZXVlLT5yeC5yc3BfY29ucyB3b3Vs
ZCBwb2ludCB0byB0aGUgcnggcmluZyBidWZmZXIgZW50cmllcyB3aG9zZQo+IHF1ZXVlLT5yeF9z
a2JzW2ldIGFuZCBxdWV1ZS0+Z3JhbnRfcnhfcmVmW2ldIGFyZSBhbHJlYWR5IGNsZWFyZWQgdG8g
TlVMTC4KPiBUaGlzIGxlYWRzIHRvIE5VTEwgcG9pbnRlciBhY2Nlc3MgaW4gdGhlIG5leHQgaXRl
cmF0aW9uIHRvIHByb2Nlc3MgcnggcmluZwo+IGJ1ZmZlciBlbnRyaWVzLgo+IAo+IFRoZSBzeW1w
dG9tIGlzIHNpbWlsYXIgdG8gdGhlIG9uZSBmaXhlZCBpbgo+IGNvbW1pdCAwMGIzNjg1MDJkMTgg
KCJ4ZW4tbmV0ZnJvbnQ6IGRvIG5vdCBhc3N1bWUgc2tfYnVmZl9oZWFkIGxpc3QgaXMKPiBlbXB0
eSBpbiBlcnJvciBoYW5kbGluZyIpLgo+IAo+IFRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUgcmV0dXJu
IHR5cGUgb2YgeGVubmV0X2ZpbGxfZnJhZ3MoKSB0byBpbmRpY2F0ZQo+IHdoZXRoZXIgaXQgaXMg
c3VjY2Vzc2Z1bCBvciBmYWlsZWQuIFRoZSBxdWV1ZS0+cngucnNwX2NvbnMgd2lsbCBiZQo+IGFs
d2F5cyB1cGRhdGVkIGluc2lkZSB0aGlzIGZ1bmN0aW9uLgo+IAo+IEZpeGVzOiBhZDRmMTVkYzJj
NzAgKCJ4ZW4vbmV0ZnJvbnQ6IGRvbid0IGJ1ZyBpbiBjYXNlIG9mIHRvbyBtYW55IGZyYWdzIikK
PiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhhbmcgPGRvbmdsaS56aGFuZ0BvcmFjbGUuY29tPgoK
QXBwbGllZCBhbmQgcXVldWVkIHVwIGZvciAtc3RhYmxlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
