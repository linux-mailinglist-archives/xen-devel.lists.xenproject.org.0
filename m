Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87B5140A94
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:19:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRUu-0002c9-56; Fri, 17 Jan 2020 13:17:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E2+z=3G=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1isRUr-0002c4-Pq
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 13:17:10 +0000
X-Inumbo-ID: a90aa3bc-392b-11ea-b51a-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a90aa3bc-392b-11ea-b51a-12813bfff9fa;
 Fri, 17 Jan 2020 13:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579267026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGZbk7MNFUyLpmRP6A69f7QL/mb48H/ao779vSGLJSM=;
 b=VszoQfjnbRYWLlkxNj3wXRKrRBqo3nmhFC6OKc0xlRR+/Yzz0ybOhuGswZDLybRFaU7RvU
 IwKF7KTK+xWzrPkFY6i6yP+08OolO0Kj4HoQ8Bv8QotVwoSBeGYKX+tyzWCcJ2QqCxBH8Q
 f42twy8ISVoJRenmtud4uG1yazqbCWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-Uv8FDETbNSa9YJrIIY77Nw-1; Fri, 17 Jan 2020 08:15:54 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 778FE477;
 Fri, 17 Jan 2020 13:15:52 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A89880F40;
 Fri, 17 Jan 2020 13:15:44 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <20200110194158.14190-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8d937add-260f-dbc5-b747-3934858c30e9@redhat.com>
Date: Fri, 17 Jan 2020 07:15:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200110194158.14190-2-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Uv8FDETbNSa9YJrIIY77Nw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v6 01/11] qapi/error: add (Error **errp)
 cleaning APIs
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
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xMC8yMCAxOjQxIFBNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOgo+
IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZA
dmlydHVvenpvLmNvbT4KPiAtLS0KClNwYXJzZSBjb21taXQgbWVzc2FnZTsgaXQgbWlnaHQgYmUg
bmljZSAoZm9yIGZ1dHVyZSAnZ2l0IGxvZycgCmdyZXBwYWJpbGl0eSkgdG8gYXQgbGVhc3QgbWVu
dGlvbiB0aGUgbmFtZXMgb2YgdGhlIGZ1bmN0aW9ucyBiZWluZyBhZGRlZC4KCj4gICAKPiArLyoK
PiArICogRnVuY3Rpb25zIHRvIGNsZWFuIEVycm9yICoqZXJycDogY2FsbCBjb3JyZXNwb25kaW5n
IEVycm9yICplcnIgY2xlYW5pbmcKPiArICogZnVuY3Rpb24gYW4gc2V0IHBvaW50ZXIgdG8gTlVM
TAoKcy8gYW4vLCB0aGVuLwoKTWlzc2luZyBhICcuJyBhdCB0aGUgZW5kIG9mIHRoZSBzZW50ZW5j
ZS4KCk90aGVyd2lzZSwKUmV2aWV3ZWQtYnk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29t
PgoKLS0gCkVyaWMgQmxha2UsIFByaW5jaXBhbCBTb2Z0d2FyZSBFbmdpbmVlcgpSZWQgSGF0LCBJ
bmMuICAgICAgICAgICArMS05MTktMzAxLTMyMjYKVmlydHVhbGl6YXRpb246ICBxZW11Lm9yZyB8
IGxpYnZpcnQub3JnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
