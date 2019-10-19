Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AC7DDA8F
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2019 20:56:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLtos-0007HH-Jf; Sat, 19 Oct 2019 18:51:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1+AQ=YM=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1iLtor-0007HC-CZ
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2019 18:51:17 +0000
X-Inumbo-ID: 6de5ad34-f2a1-11e9-beca-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6de5ad34-f2a1-11e9-beca-bc764e2007e4;
 Sat, 19 Oct 2019 18:51:16 +0000 (UTC)
Received: from localhost (unknown [64.79.112.2])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 606A9148F63AD;
 Sat, 19 Oct 2019 11:51:15 -0700 (PDT)
Date: Sat, 19 Oct 2019 11:51:14 -0700 (PDT)
Message-Id: <20191019.115114.563831481451365693.davem@davemloft.net>
To: jgross@suse.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191018074549.4778-1-jgross@suse.com>
References: <20191018074549.4778-1-jgross@suse.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 19 Oct 2019 11:51:15 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH] xen/netback: fix error path of
 xenvif_connect_data()
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
Cc: wei.liu@kernel.org, paul@xen.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiBGcmksIDE4IE9jdCAy
MDE5IDA5OjQ1OjQ5ICswMjAwCgo+IHhlbnZpZl9jb25uZWN0X2RhdGEoKSBjYWxscyBtb2R1bGVf
cHV0KCkgaW4gY2FzZSBvZiBlcnJvci4gVGhpcyBpcwo+IHdyb25nIGFzIHRoZXJlIGlzIG5vIHJl
bGF0ZWQgbW9kdWxlX2dldCgpLgo+IAo+IFJlbW92ZSB0aGUgc3VwZXJmbHVvdXMgbW9kdWxlX3B1
dCgpLgo+IAo+IEZpeGVzOiAyNzlmNDM4ZTM2YzBhNyAoInhlbi1uZXRiYWNrOiBEb24ndCBkZXN0
cm95IHRoZSBuZXRkZXYgdW50aWwgdGhlIHZpZiBpcyBzaHV0IGRvd24iKQo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwYXVsQHhlbi5vcmc+CgpBcHBsaWVkIGFuZCBxdWV1ZWQgdXAgZm9yIC1zdGFibGUu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
