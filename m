Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E066B6B9729
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:04:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509620.785715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5Gf-0001n7-4q; Tue, 14 Mar 2023 14:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509620.785715; Tue, 14 Mar 2023 14:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5Gf-0001kR-12; Tue, 14 Mar 2023 14:04:45 +0000
Received: by outflank-mailman (input) for mailman id 509620;
 Tue, 14 Mar 2023 14:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsFi=7G=yandex.ru=isaikin-dmitry@srs-se1.protection.inumbo.net>)
 id 1pc5Gc-0001kK-UI
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:04:42 +0000
Received: from forward500a.mail.yandex.net (forward500a.mail.yandex.net
 [178.154.239.80]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28525147-c271-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:04:38 +0100 (CET)
Received: from vla1-4c5ff3d0aef5.qloud-c.yandex.net
 (vla1-4c5ff3d0aef5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:230e:0:640:4c5f:f3d0])
 by forward500a.mail.yandex.net (Yandex) with ESMTP id 39BE95ECDA;
 Tue, 14 Mar 2023 17:04:37 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c15:2980:0:640:9e07:0
 [2a02:6b8:c15:2980:0:640:9e07:0])
 by vla1-4c5ff3d0aef5.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 X4jwpY1YG0U1-ZkQBxJ5H; Tue, 14 Mar 2023 17:04:37 +0300
Received: by keakpixodwq4ggpb.vla.yp-c.yandex.net with HTTP;
 Tue, 14 Mar 2023 17:04:36 +0300
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
X-Inumbo-ID: 28525147-c271-11ed-b464-930f4c7d94ae
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1678802676;
	bh=wdTljBAdcz7psNuBdPk1WJphZhDOwQQVTmwBSHBxotE=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=GNNSRFSH+uhcqilIAL1LC/b2+uKhBc6x5bs9Tmy8QB2LjQQDJifEvR4h1qxF5xReY
	 WQmSa48nGLVDD7ILdisWl6D5cBKe9FWmee2c3crbA1Mxj7i3UUW8yRL+OrwlQOaqHP
	 HojIyufQ2tAkeNMdNBc4/xE4kddjuFnW9qXNPqZo=
Authentication-Results: vla1-4c5ff3d0aef5.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: =?utf-8?B?0JTQvNC40YLRgNC40Lkg0JjRgdCw0LnQutC40L0=?= <isaikin-dmitry@yandex.ru>
To: Jan Beulich <jbeulich@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Anton Belousov <abelousov@ptsecurity.com>
In-Reply-To: <8b258946-4fe4-b988-ac25-a99ae1f06806@suse.com>
References: <3f577545b8ee6846ff98c4411cdc96dfe1412b3e.1678505295.git.isaikin-dmitry@yandex.ru>
	 <CABfawhn0+XuByYGM-rAkQy+XL9E4aNiBDfE5irOzvRVesuKMjg@mail.gmail.com> <8b258946-4fe4-b988-ac25-a99ae1f06806@suse.com>
Subject: Re: [XEN PATCH] x86/monitor: Add new monitor event to catch I/O instructions
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 14 Mar 2023 17:04:36 +0300
Message-Id: <3761678802469@mail.yandex.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjEzLjAzLjIwMjMsIDE5OjE1LCAiSmFuIEJl
dWxpY2giICZsdDtqYmV1bGljaEBzdXNlLmNvbSZndDs6PC9kaXY+PGJsb2NrcXVvdGU+PHA+T24g
MTEuMDMuMjAyMyAxNTo1MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOjwvcD48YmxvY2txdW90ZT7C
oE9uIEZyaSwgTWFyIDEwLCAyMDIzIGF0IDEwOjU34oCvUE0gRG1pdHJ5IElzYXlraW4gJmx0Ozxh
IGhyZWY9Im1haWx0bzppc2Fpa2luLWRtaXRyeUB5YW5kZXgucnUiIHJlbD0ibm9vcGVuZXIgbm9y
ZWZlcnJlciI+aXNhaWtpbi1kbWl0cnlAeWFuZGV4LnJ1PC9hPiZndDs8YmxvY2txdW90ZT7CoC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jPGJyIC8+wqArKysgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bXguYzxiciAvPsKgQEAgLTQ1NzksNiArNDU3OSw4IEBAIHZvaWQgdm14X3ZtZXhp
dF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTxiciAvPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB1aW50MTZfdCBwb3J0ID0gKGV4aXRfcXVhbGlmaWNhdGlvbiAmZ3Q7Jmd0
OyAxNikgJmFtcDsgMHhGRkZGOzxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQg
Ynl0ZXMgPSAoZXhpdF9xdWFsaWZpY2F0aW9uICZhbXA7IDB4MDcpICsgMTs8YnIgLz7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IGRpciA9IChleGl0X3F1YWxpZmljYXRpb24gJmFtcDsg
MHgwOCkgPyBJT1JFUV9SRUFEIDo8L2Jsb2NrcXVvdGU+wqBJT1JFUV9XUklURTs8YmxvY2txdW90
ZT7CoCsgaW50IHN0cl9pbnMgPSAoZXhpdF9xdWFsaWZpY2F0aW9uICZhbXA7IDB4MTApID8gMSA6
IDA7PC9ibG9ja3F1b3RlPsKgPGJyIC8+wqBZb3UgYXJlIGFscmVhZHkgaW4gYSBicmFuY2ggaGVy
ZSB3aGVyZSBzdHJfaW5zIGlzIGNoZWNrZWQgYW5kIGtub3duIHRvIGJlIDEuPC9ibG9ja3F1b3Rl
PjxwPjxiciAvPjAgdGhhdCBpcywgaS5lLiBvbmx5IG5vbi1zdHJpbmcgaW5zbnMgd291bGQgcHJl
c2VudGx5IGJlIHJlcG9ydGVkLjxiciAvPjxiciAvPkRtaXRyeSwgeW91IGFsc28gd2FudCB0byBt
YWtlIHRoaXMgdmFyaWFibGUgYW5kIHRoZSBjb3JyZXNwb25kaW5nIGZ1bmN0aW9uPGJyIC8+cGFy
YW1ldGVycyAiYm9vbCIuIFVubGVzcyBvZiBjb3Vyc2UgdGhleSBuZWVkIGNoYW5naW5nIGFueXdh
eSB0byBlLmcuPGJyIC8+Y29tbXVuaWNhdGUgdGhlIGFkZHJlc3Mgb2YgdGhlIGRhdGEgKGFzIGFs
c28gaW5kaWNhdGVkIGJ5IEFuZHJldykuPC9wPjwvYmxvY2txdW90ZT48ZGl2Pk9LLjwvZGl2Pjxi
bG9ja3F1b3RlPjxwPsKgPC9wPjxibG9ja3F1b3RlPjxibG9ja3F1b3RlPsKgKyBodm1faW9faW5z
dHJ1Y3Rpb25faW50ZXJjZXB0KHBvcnQsIGRpciwgYnl0ZXMsIHN0cl9pbnMpOzwvYmxvY2txdW90
ZT7CoDxiciAvPsKgSU1ITyB5b3Ugc2hvdWxkIGhhdmUgdGhpcyBpbnRlcmNlcHQgYmUgY2FsbGVk
IG91dHNpZGUgdGhlIGlmLWVsc2UuIFRoZTxiciAvPsKgZnVuY3Rpb24gYWxyZWFkeSBraW5kLW9m
IGluZGljYXRlcyBzdHJfaW5zIGlzIGFuIGlucHV0IHlldCByaWdodCBub3cgb25seTxiciAvPsKg
Y2FsbGVkIHdoZW4gaXQncyAxLjwvYmxvY2txdW90ZT48cD48YnIgLz5JIGFncmVlLiBRdWVzdGlv
biBpcywgYXMgYWJvdmUsIHdoYXQgZnVydGhlciBkYXRhIG1heSBuZWVkIHN1cHBseWluZyB0bzxi
ciAvPnRoZSBtb25pdG9yIGFnZW50IHRvIG1ha2UgdGhlIGludGVyY2VwdCB1c2VmdWwuIE1lcmVs
eSAlcnNpIC8gJXJkaSBhczxiciAvPkFuZHJldyBzdWdnZXN0ZWQgbWF5IG5vdCBzdWZmaWNlLCBh
cyBlc3BlY2lhbGx5IG91dHNpZGUgb2YgNjQtYml0IG1vZGU8YnIgLz50aGUgaW52b2x2ZWQgc2Vn
bWVudCBiYXNlIG1heSBiZSBub24temVyby48L3A+PC9ibG9ja3F1b3RlPjxkaXY+SSB0aGluayB0
aGF0IGluIHN5bmNocm9ub3VzIG1vZGUgYWxsIG5lY2Vzc2FyeSByZWdpc3RlciBpbmZvcm1hdGlv
biBpcyBhbHJlYWR5IGF2YWlsYWJsZS48L2Rpdj48YmxvY2txdW90ZT48cD48YnIgLz5KYW48L3A+
PC9ibG9ja3F1b3RlPg==

