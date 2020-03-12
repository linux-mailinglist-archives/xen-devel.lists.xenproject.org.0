Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115D71832EF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:26:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCOlV-0006j5-MF; Thu, 12 Mar 2020 14:24:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mwCM=45=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jCOlT-0006iz-OU
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:24:47 +0000
X-Inumbo-ID: 39d79190-646d-11ea-bec1-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 39d79190-646d-11ea-bec1-bc764e2007e4;
 Thu, 12 Mar 2020 14:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584023087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbZoVTcHQAQqonGG8sHUAE9VwF/9TwX3MkH6fa2Qjxg=;
 b=BqzOhKXSQAMqDXVC3diGmgou/cTtHFEmaL8T38jacZunTlHWTCahLu+Nh+K2H+AFGZHfTK
 q7Re8O3NSuJSx9XYWgV6j69WJZnYxo6sJxeD1WuRA1chgBdJLZAVj9e7WHWEKHmM7ET++T
 y2fF6EDms32Y8SALcXHmkSiRgNhYXrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-hq-5C0cRNVyDq_aQfYvHuA-1; Thu, 12 Mar 2020 10:24:39 -0400
X-MC-Unique: hq-5C0cRNVyDq_aQfYvHuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CC3E19251A3;
 Thu, 12 Mar 2020 14:24:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6EE290795;
 Thu, 12 Mar 2020 14:24:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33EDB11386A6; Thu, 12 Mar 2020 15:24:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
Date: Thu, 12 Mar 2020 15:24:30 +0100
In-Reply-To: <20200312085936.9552-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 12 Mar 2020 11:59:26 +0300")
Message-ID: <87y2s5ps69.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v9 00/10] error: auto propagated local_err
 part I
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cgo+IHY5Cj4gMDE6IEEgbG90IG9mIHJld29yZGluZ3MgW3RoYW5rcyB0byBFcmljXQo+
ICAgICBTdGlsbCwga2VlcCBhbGwgci1iIG1hcmtzLCBhc3N1bWluZyB0aGF0IHRoZXkgYXJlIG1v
c3RseSBhYm91dCBtYWNybyBkZWZpbml0aW9uCj4gMDI6IHNpZ25pZmljYW50IGNoYW5nZXMgYXJl
Ogo+ICAgICAxLiBEbyBub3QgbWF0Y2ggZG91YmxlIHByb3BhZ2F0aW9uIHBhdHRlcm4gaW4gRVJS
UF9BVVRPX1BST1BBR0FURS1hZGRpbmcgcnVsZQo+ICAgICAyLiBJbnRyb2R1Y2UgZXJycC0+X19f
Xy0+ZXJycCBzY2hlbWUgdG8gbWF0Y2ggb25seSBmdW5jdGlvbnMgbWF0Y2hlZCBieSBydWxlMQo+
ICAgICAgICBpbiBydWxlcyBpbmhlcml0ZWQgZnJvbSBydWxlMQo+ICAgICAzLiBBZGQgcnVsZXMg
dG8gd2FybiBhYm91dCB1bnVzdWFsIHBhdHRlcm5zCj4KPiAgICAgQWxzbywgYWRkIGxpbmUgdG8g
TUFJTlRBSU5FUlMgdG8ga2VlcCBlcnJvciByZWxhdGVkIGNvY2NpbmVsbGUgc2NyaXB0cyB1bmRl
cgo+ICAgICBFcnJvciBzZWN0aW9uLgo+IDA3OiBhZGQgQ2hyaXN0aWFuJ3Mgci1iCj4gMDk6IGFk
ZCBFcmljJ3Mgci1iCj4gMTA6IGEgYml0IG9mIGNvbnRleHQgaW4geGVuX2Jsb2NrX2lvdGhyZWFk
X2NyZWF0ZSAgYW5kIHFtcF9vYmplY3RfYWRkKCkKPiAgICAgc2lnbmF0dXJlIGFyZSBjaGFuZ2Vk
LiBQYXRjaCBjaGFuZ2UgaXMgb2J2aW91cywgc28gSSBrZWVwIFBhdWwncyByLWIKPgo+IHY5IGlz
IGF2YWlsYWJsZSBhdAo+ICBodHRwczovL3NyYy5vcGVudnoub3JnL3NjbS9+dnNlbWVudHNvdi9x
ZW11LmdpdCAjdGFnIHVwLWF1dG8tbG9jYWwtZXJyLXBhcnRJLXY5CgpEaWQgeW91IGZvcmdldCB0
byBwdXNoIHRoZSB0YWc/Cgo+IHY4IGlzIGF2YWlsYWJsZSBhdAo+ICBodHRwczovL3NyYy5vcGVu
dnoub3JnL3NjbS9+dnNlbWVudHNvdi9xZW11LmdpdCAjdGFnIHVwLWF1dG8tbG9jYWwtZXJyLXBh
cnRJLXY4ClsuLi5dCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
