Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F29116C5E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:36:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHIW-0007Z6-Eb; Mon, 09 Dec 2019 11:33:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieHIV-0007Yy-25
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:33:51 +0000
X-Inumbo-ID: c4ca9e86-1a77-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4ca9e86-1a77-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 11:33:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EC5A7AAF1;
 Mon,  9 Dec 2019 11:33:48 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-2-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <38908166-6a4b-9dab-144c-71df691da167@suse.com>
Date: Mon, 9 Dec 2019 12:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191205140123.3817-2-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] xenbus: move xenbus_dev_shutdown() into
 frontend code...
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMTkgMTU6MDEsIFBhdWwgRHVycmFudCB3cm90ZToKPiAuLi5hbmQgbWFrZSBpdCBz
dGF0aWMKPiAKPiB4ZW5idXNfZGV2X3NodXRkb3duKCkgaXMgc2VlbWluZ2x5IGludGVuZGVkIHRv
IGNhdXNlIGNsZWFuIHNodXRkb3duIG9mIFBWCj4gZnJvbnRlbmRzIHdoZW4gYSBndWVzdCBpcyBy
ZWJvb3RlZC4gSW5kZWVkIHRoZSBmdW5jdGlvbiB3YWl0cyBmb3IgYQo+IGNvbnBsZXRpb24gd2hp
Y2ggaXMgb25seSBzZXQgYnkgYSBjYWxsIHRvIHhlbmJ1c19mcm9udGVuZF9jbG9zZWQoKS4KPiAK
PiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIHNodXRkb3duKCkgbWV0aG9kIGZyb20gYmFja2VuZHMg
YW5kIG1vdmVzCj4geGVuYnVzX2Rldl9zaHV0ZG93bigpIGZyb20geGVuYnVzX3Byb2JlLmMgaW50
byB4ZW5idXNfcHJvYmVfZnJvbnRlbmQuYywKPiByZW5hbWluZyBpdCBhcHByb3ByaWF0ZWx5IGFu
ZCBtYWtpbmcgaXQgc3RhdGljLgoKSXMgdGhpcyBhIGdvb2QgbW92ZSBjb25zaWRlcmluZyBkcml2
ZXIgZG9tYWlucz8KCkF0IGxlYXN0IEknZCBleHBlY3QgdGhlIGNvbW1pdCBtZXNzYWdlIGFkZHJl
c3NpbmcgdGhlIGV4cGVjdGVkIGJlaGF2aW9yCndpdGggcmVib290aW5nIGEgZHJpdmVyIGRvbWFp
biBhbmQgd2h5IHRoaXMgcGF0Y2ggaXNuJ3QgbWFraW5nIHRoaW5ncwp3b3JzZS4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
