Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CADE17BB23
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 12:05:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAAkf-0004Sh-UU; Fri, 06 Mar 2020 11:02:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gV9R=4X=igalia.com=berto@srs-us1.protection.inumbo.net>)
 id 1jAAkd-0004Sc-OX
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 11:02:44 +0000
X-Inumbo-ID: ff74cf90-5f99-11ea-a7a2-12813bfff9fa
Received: from fanzine.igalia.com (unknown [178.60.130.6])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff74cf90-5f99-11ea-a7a2-12813bfff9fa;
 Fri, 06 Mar 2020 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=DeL0a7YjU2R9PbdSA9cay0PiC0uIWJp67ePHFkkGUpA=; 
 b=if5D5cksjzYicETnVSWnbWdBScQ7kqcsh1L1qAEa6/FQp+buTYYMKmjRQbm3CnZTUwRVC1XiQ2JA310ZeHYljXAnYfBfE6Gd6LziIB0VudPuwkP0NaiDfDDG5WvJdbBX0wGkKHxj/JC//iIhn2tsVtCtYGa+0zu+68uTQ9BAmVrxPh8DUWTlBIraewXw5q6AuLcxAry0vDShqHInbViwgSral/EHuzSxZkTeqHgiipGR5gAWWlsiIxP+Hbmj+dpWZthtVM0+RZZKcJx56jUSZPqYhCZYwOofE0Pyk/iuwOtp3v1P19+/5jgDmSH3PQGWWg7B9v2GXfq7DGVTAxDlQQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jAAkI-0004u0-No; Fri, 06 Mar 2020 12:02:22 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1jAAkI-0005as-DF; Fri, 06 Mar 2020 12:02:22 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
In-Reply-To: <20200306051536.27803-2-vsementsov@virtuozzo.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 06 Mar 2020 12:02:22 +0100
Message-ID: <w51mu8tsq4h.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 01/10] error: auto propagated local_err
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 armbru@redhat.com, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpIDA2IE1hciAyMDIwIDA2OjE1OjI3IEFNIENFVCwgVmxhZGltaXIgU2VtZW50c292LU9n
aWV2c2tpeSB3cm90ZToKClNvcnJ5IEkganVzdCBnYXZlIGEgcXVpY2sgbG9vayBhdCB0aGVzZSBw
YXRjaGVzIGFuZCBub3RpY2VkIHRoaXM6Cgo+ICsgKiBGdW5jdGlvbiBtYXkgdXNlIGVycm9yIHN5
c3RlbSB0byByZXR1cm4gZXJyb3JzLiBJbiB0aGlzIGNhc2UgZnVuY3Rpb24KPiArICogZGVmaW5l
cyBFcnJvciAqKmVycnAgcGFyYW1ldGVyLCB3aGljaCBzaG91bGQgYmUgdGhlIGxhc3Qgb25lIChl
eGNlcHQgZm9yCj4gKyAqIGZ1bmN0aW9ucyB3aGljaCB2YXJpZGljIGFyZ3VtZW50IGxpc3QpLCB3
aGljaCBoYXMgdGhlIGZvbGxvd2luZyBBUEk6CgpJIGRvbid0IHRoaW5rIHRoYXQgImZ1bmN0aW9u
cyB3aGljaCB2YXJpZGljIGFyZ3VtZW50IGxpc3QiIGlzIGNvcnJlY3QKRW5nbGlzaC4gUGVyaGFw
cyBzb21ldGhpbmcgbGlrZSAiZXhjZXB0IGZvciB2YXJpYWRpYyBmdW5jdGlvbnMiIG9yCiJleGNl
cHQgZm9yIGZ1bmN0aW9ucyB3aXRoIGEgdmFyaWFibGUgbnVtYmVyIG9mIGFyZ3VtZW50cyIuCgpC
ZXJ0bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
