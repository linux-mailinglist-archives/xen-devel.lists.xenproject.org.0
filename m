Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D9411105
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 10:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190335.340177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEjX-00075J-C7; Mon, 20 Sep 2021 08:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190335.340177; Mon, 20 Sep 2021 08:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEjX-00073A-94; Mon, 20 Sep 2021 08:33:03 +0000
Received: by outflank-mailman (input) for mailman id 190335;
 Mon, 20 Sep 2021 08:33:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sKa=OK=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mSEjV-000734-9P
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 08:33:01 +0000
Received: from forward501p.mail.yandex.net (unknown
 [2a02:6b8:0:1472:2741:0:8b7:120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1029640b-b823-403e-a326-7f5d54bfb2d1;
 Mon, 20 Sep 2021 08:32:58 +0000 (UTC)
Received: from myt6-9503d8936a58.qloud-c.yandex.net
 (myt6-9503d8936a58.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4684:0:640:9503:d893])
 by forward501p.mail.yandex.net (Yandex) with ESMTP id 1C17C6211E86;
 Mon, 20 Sep 2021 11:32:56 +0300 (MSK)
Received: from 2a02:6b8:c12:379f:0:640:4204:cefb
 (2a02:6b8:c12:379f:0:640:4204:cefb [2a02:6b8:c12:379f:0:640:4204:cefb])
 by myt6-9503d8936a58.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 sWXJU75E2Os1-WsEaVVJn; Mon, 20 Sep 2021 11:32:55 +0300
Received: by myt6-4204cefb5b39.qloud-c.yandex.net with HTTP;
 Mon, 20 Sep 2021 11:32:54 +0300
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1029640b-b823-403e-a326-7f5d54bfb2d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1632126775;
	bh=NPhA/tCoKEgQZpIfT+8QCx4jzUUVo2p/wBjLlJqAFYc=;
	h=References:Date:Message-Id:Cc:Subject:In-Reply-To:To:From;
	b=RiLguzLPgcHdqJnooj0QUZC+aoWTpLlSrNw33p/SoTDKxiwxAMkU7ZRaE9WibzZ9G
	 f1f99MzcVPQvmpBHkuCwOU+k2aVFDlow1qApeVhNFl5HfvwVrHMotJHRjzOffeWyVn
	 YtCnFqajEflRklCuw86cE9BG/54h0WwyPhJeX7eU=
Authentication-Results: myt6-9503d8936a58.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
To: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"rjstone@amazon.co.uk" <rjstone@amazon.co.uk>,
	"raphning@amazon.co.uk" <raphning@amazon.co.uk>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c242e3cc-d4ed-73b7-8e38-f94a8c479d20@suse.com>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
	 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
	 <16d43ba8-d45f-021c-0e19-e233cb967938@citrix.com>
	 <f1dda72c-695f-34d3-619e-ec2aa7696bce@suse.com>
	 <01ec71a5-a1f1-b7db-d467-bc4c734db096@xen.org>
	 <0fa0d369-c67c-1cdd-0ff8-1542487ffb8a@citrix.com>
	 <0c860901-0992-74df-4a53-d75a0971d1f3@suse.com>
	 <f6225dc6-0590-3456-8c48-7ab29aa00200@xen.org> <c242e3cc-d4ed-73b7-8e38-f94a8c479d20@suse.com>
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 20 Sep 2021 11:32:54 +0300
Message-Id: <12214401632126774@myt6-4204cefb5b39.qloud-c.yandex.net>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

SSB0aGluayBpdCBjb250ZW5kIG9uIHBhZ2UgaW5zZXJ0aW9uIGludG8gZnJlZSBwYWdlcyBsaXN0
LiBCdXQgSSBkb24ndCBjb25maXJtIG9yIGRlbmllZCB0aGlzIHlldC4gSSdtIG5ldyBpbiBoeXBl
cnZpc29ycy4uLjxiciAvPjxiciAvPjExOjE5LCAyMCDRgdC10L3RgtGP0LHRgNGPIDIwMjEg0LMu
LCBKYW4gQmV1bGljaCAmbHQ7amJldWxpY2hAc3VzZS5jb20mZ3Q7OjxiciAvPjxibG9ja3F1b3Rl
IGNsYXNzPSIyMTBlN2E4NDhlOGZjYjQ1d21pLXF1b3RlIj48cD5PbiAxNy4wOS4yMDIxIDE4OjAx
LCBKdWxpZW4gR3JhbGwgd3JvdGU6PGJyIC8+PC9wPjxibG9ja3F1b3RlIGNsYXNzPSIyMTBlN2E4
NDhlOGZjYjQ1d21pLXF1b3RlIj7CoEkgd2lsbCBxdW90ZSB3aGF0IEhvbmd5YW4gd3JvdGUgYmFj
ayBvbiB0aGUgZmlyc3QgcmVwb3J0OjxiciAvPsKgPGJyIC8+wqAiPGJyIC8+wqBUaGUgYmVzdCBz
b2x1dGlvbiBpcyB0byBtYWtlIHRoZSBoZWFwIHNjYWxhYmxlIGluc3RlYWQgb2YgYSBnbG9iYWw8
YnIgLz7CoGxvY2ssIGJ1dCB0aGF0IGlzIG5vdCBnb2luZyB0byBiZSB0cml2aWFsLjxiciAvPsKg
PGJyIC8+wqBPZiBjb3Vyc2UsIGFub3RoZXIgc29sdXRpb24gaXMgdG8ga2VlcCB0aGUgZG9tY3Rs
IGxvY2sgZHJvcHBlZCBpbjxiciAvPsKgZG9tYWluX2tpbGwoKSBidXQgaGF2ZSBhbm90aGVyIGRv
bWFpbl9raWxsIGxvY2sgc28gdGhhdCBjb21wZXRpbmc8YnIgLz7CoGRvbWFpbl9raWxsKClzIHdp
bGwgdHJ5IHRvIHRha2UgdGhhdCBsb2NrIGFuZCBiYWNrIG9mZiB3aXRoIGh5cGVyY2FsbDxiciAv
PsKgY29udGludWF0aW9uLiBCdXQgdGhpcyBpcyBraW5kIG9mIGhhY2t5ICh3ZSBpbnRyb2R1Y2Ug
YSBsb2NrIHRvIHJlZHVjZTxiciAvPsKgc3BpbmxvY2sgY29udGVudGlvbiBlbHNld2hlcmUpLCB3
aGljaCBpcyBwcm9iYWJseSBub3QgYSBzb2x1dGlvbiBidXQgYTxiciAvPsKgd29ya2Fyb3VuZC48
YnIgLz7CoCI8YnIgLz48L2Jsb2NrcXVvdGU+PHA+PGJyIC8+SW50ZXJlc3RpbmcuIElzIGNvbnRl
bnRpb24gb24gdGhlIGhlYXAgbG9jayBtZXJlbHkgc3VzcGVjdGVkIG9yPGJyIC8+d2FzIHRoYXQg
bG9jayBwcm92ZW4gdG8gYmUgdGhlIHByb2JsZW0gb25lPzxiciAvPjxiciAvPkphbjxiciAvPjxi
ciAvPjwvcD48L2Jsb2NrcXVvdGU+PGJyIC8+PGJyIC8+LS0gPGJyIC8+0J7RgtC/0YDQsNCy0LvQ
tdC90L4g0LjQtyDQvNC+0LHQuNC70YzQvdC+0LPQviDQv9GA0LjQu9C+0LbQtdC90LjRjyDQr9C9
0LTQtdC60YEu0J/QvtGH0YLRiw==

