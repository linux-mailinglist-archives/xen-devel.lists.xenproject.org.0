Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F4E12AFA3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 00:21:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikcN7-0001FV-Lc; Thu, 26 Dec 2019 23:16:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jCKE=2Q=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1ikcN5-0001FQ-KX
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2019 23:16:47 +0000
X-Inumbo-ID: c8ae4cac-2835-11ea-88e7-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8ae4cac-2835-11ea-88e7-bc764e2007e4;
 Thu, 26 Dec 2019 23:16:45 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id BE1B81539419A;
 Thu, 26 Dec 2019 15:16:44 -0800 (PST)
Date: Thu, 26 Dec 2019 15:16:44 -0800 (PST)
Message-Id: <20191226.151644.93658401366332934.davem@davemloft.net>
To: pdurrant@amazon.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191223095923.2458-1-pdurrant@amazon.com>
References: <20191223095923.2458-1-pdurrant@amazon.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 26 Dec 2019 15:16:45 -0800 (PST)
Subject: Re: [Xen-devel] [PATCH net-next] xen-netback: support dynamic
 unbind/bind
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
Cc: xen-devel@lists.xenproject.org, wei.liu@kernel.org, paul@xen.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpEYXRlOiBNb24sIDIzIERl
YyAyMDE5IDA5OjU5OjIzICswMDAwCgo+IEJ5IHJlLWF0dGFjaGluZyBSWCwgVFgsIGFuZCBDVEwg
cmluZ3MgZHVyaW5nIGNvbm5lY3QoKSByYXRoZXIgdGhhbgo+IGFzc3VtaW5nIHRoZXkgYXJlIGZy
ZXNobHkgYWxsb2NhdGVkIChpLmUuIGFzc3VtaW5nIHRoZSBjb3VudGVycyBhcmUgemVybyksCj4g
YW5kIGF2b2lkaW5nIGZvcmNpbmcgc3RhdGUgdG8gQ2xvc2VkIGluIG5ldGJhY2tfcmVtb3ZlKCkg
aXQgaXMgcG9zc2libGUKPiBmb3IgdmlmIGluc3RhbmNlcyB0byBiZSB1bmJvdW5kIGFuZCByZS1i
b3VuZCBmcm9tIGFuZCB0byAocmVzcGVjdGl2ZWx5KSBhCj4gcnVubmluZyBndWVzdC4KPiAKPiBE
eW5hbWljIHVuYmluZC9iaW5kIGlzIGEgaGlnaGx5IHVzZWZ1bCBmZWF0dXJlIGZvciBhIGJhY2tl
bmQgbW9kdWxlIGFzIGl0Cj4gYWxsb3dzIGl0IHRvIGJlIHVubG9hZGVkIGFuZCByZS1sb2FkZWQg
KGkuZS4gdXBkYXRlZCkgd2l0aG91dCByZXF1aXJpbmcKPiBkb21VcyB0byBiZSBoYWx0ZWQuCj4g
Cj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgYnkgcnVubmluZyBpcGVyZiBhcyBhIHNlcnZlciBpbiB0
aGUgdGVzdCBWTSBhbmQKPiB0aGVuIHJ1bm5pbmcgYSBjbGllbnQgYWdhaW5zdCBpdCBpbiBhIGNv
bnRpbnVvdXMgbG9vcCwgd2hpbHN0IGFsc28KPiBydW5uaW5nOgo+IAo+IHdoaWxlIHRydWU7Cj4g
ICBkbyBlY2hvIHZpZi0kRE9NSUQtJFZJRiA+dW5iaW5kOwo+ICAgZWNobyBkb3duOwo+ICAgcm1t
b2QgeGVuLW5ldGJhY2s7Cj4gICBlY2hvIHVubG9hZGVkOwo+ICAgbW9kcHJvYmUgeGVuLW5ldGJh
Y2s7Cj4gICBjZCAkKHB3ZCk7Cj4gICBicmN0bCBhZGRpZiB4ZW5icjAgdmlmJERPTUlELiRWSUY7
Cj4gICBpcCBsaW5rIHNldCB2aWYkRE9NSUQuJFZJRiB1cDsKPiAgIGVjaG8gdXA7Cj4gICBzbGVl
cCA1Owo+ICAgZG9uZQo+IAo+IGluIGRvbTAgZnJvbSAvc3lzL2J1cy94ZW4tYmFja2VuZC9kcml2
ZXJzL3ZpZiB0byBjb250aW51b3VzbHkgdW5iaW5kLAo+IHVubG9hZCwgcmUtbG9hZCwgcmUtYmlu
ZCBhbmQgcmUtcGx1bWIgdGhlIGJhY2tlbmQuCj4gCj4gQ2xlYXJseSBhIHBlcmZvcm1hbmNlIGRy
b3Agd2FzIHNlZW4gYnV0IG5vIFRDUCBjb25uZWN0aW9uIHJlc2V0cyB3ZXJlCj4gb2JzZXJ2ZWQg
ZHVyaW5nIHRoaXMgdGVzdCBhbmQgbW9yZW92ZXIgYSBwYXJhbGxlbCBTU0ggY29ubmVjdGlvbiBp
bnRvIHRoZQo+IGd1ZXN0IHJlbWFpbmVkIHBlcmZlY3RseSB1c2FibGUgdGhyb3VnaG91dC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpBcHBs
aWVkLCB0aGFuayB5b3UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
