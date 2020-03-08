Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B3617D8D2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 06:22:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBAnh-0003cD-9a; Mon, 09 Mar 2020 05:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n6iV=4Z=crudebyte.com=qemu_oss@srs-us1.protection.inumbo.net>)
 id 1jB1ZS-00011c-4F
 for xen-devel@lists.xenproject.org; Sun, 08 Mar 2020 19:26:42 +0000
X-Inumbo-ID: bc83dcc8-6172-11ea-8eb5-bc764e2007e4
Received: from kylie.crudebyte.com (unknown [5.189.157.229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc83dcc8-6172-11ea-8eb5-bc764e2007e4;
 Sun, 08 Mar 2020 19:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=birF46cwsW7C6DhQDRE9C+H8AQVRyDMCb4zehSH4F/s=; b=OItPfyrWlkKge220ZyC5tY92fJ
 alkWr36lOR3DVJq/+AXYApAyPYL9p2p8M4JC87AsINnxoCCKzYNLAXw+PiY3MVHTyc976beNkYDZN
 dQ2qB8Trd0R3ni5YW1iE8Yb1+uh3VBxBhn1e9jzojPHlrmviMOtTriqCzMntPmz+FG3fiyRT629W7
 1dFcYkmg+05uBq0nqpxbrpdn/t3LwQcB8MayaECXCseVijFYDeEKV7SM/K+JBzovia6WxWFJguA17
 cXHKvmd9rAp7/tlUgz5gG4QXqrQSade8ZrUaE5RmgeAssPW3LVxViIS6BM6S0XYOTzdvYR+5Q9hqD
 +iBaDXddyuJJ7vb7VWxIcMa+RtOANGcb1VqcP3cMySoTzri0gAy2DBWBrttebQ3JPI600YWEQdyZA
 fqIzoWbrudapC/Gz3V4Y0lx+EBZoZP5IP067sIt4y8XGRYowsOwdTSLp9FqqanbzNoOqeKx6rQqzT
 RTs6dqyFysf3DqOaJK81hJ5jcD1NHCmNWle2hUITLFq+Es44DpwCtPch5R9iXSm/4ERC3zBz56KnQ
 ufnA2wgAwbB3JD6D/5bgAwkwh0ppa8QczIoBbm5R7FaZP1yaNvAGEbPGUwRi1l2dkkvrpKcnYLQ1A
 QPSqT/H05L9QC/bqfBGrt6B4UfYgKNnF3vofEfbIs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Date: Sun, 08 Mar 2020 20:09:45 +0100
Message-ID: <2464375.yLZ1CyT5Wr@silver>
In-Reply-To: <20200306051536.27803-3-vsementsov@virtuozzo.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Mar 2020 05:18:00 +0000
Subject: Re: [Xen-devel] [PATCH v8 02/10] scripts: add coccinelle script to
 use auto propagated errp
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Greg Kurz <groug@kaod.org>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJlaXRhZywgNi4gTcOkcnogMjAyMCAwNjoxNToyOCBDRVQgVmxhZGltaXIgU2VtZW50c292
LU9naWV2c2tpeSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8t
cHJvcGFnYXRlZC1lcnJwLmNvY2NpCj4gYi9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdh
dGVkLWVycnAuY29jY2kgbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5i
ZmYyNzRiZDZkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3NjcmlwdHMvY29jY2luZWxsZS9hdXRv
LXByb3BhZ2F0ZWQtZXJycC5jb2NjaQo+IEBAIC0wLDAgKzEsMjMxIEBACj4gKy8vIFVzZSBFUlJQ
X0FVVE9fUFJPUEFHQVRFIChzZWUgaW5jbHVkZS9xYXBpL2Vycm9yLmgpCj4gKy8vCj4gKy8vIENv
cHlyaWdodCAoYykgMjAyMCBWaXJ0dW96em8gSW50ZXJuYXRpb25hbCBHbWJILgoKSnVzdCBpbiBj
YXNlOgoKV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlO
VEFJTkVSUyBuZWVkIHVwZGF0aW5nPwoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4gU2Nob2VuZWJl
Y2sKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
