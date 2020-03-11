Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B2718155A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 10:55:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBy3b-0008MS-VF; Wed, 11 Mar 2020 09:53:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=At4r=44=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jBy3a-0008MM-4M
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:53:42 +0000
X-Inumbo-ID: 2fd51ed2-637e-11ea-b34e-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2fd51ed2-637e-11ea-b34e-bc764e2007e4;
 Wed, 11 Mar 2020 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583920420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bESiMku8TmFQt39cgSrDgQZghN+zd590SeDODKnG+Lo=;
 b=EiOIJQ7cfVDSIwIWW5lLMTYKYhyr7r2RM76gUCnVODPbrsP8kb3BCoz6EpCpCreuZGu2BD
 xIbnRC5pkJuEt5U9O4hFcoBqL1hno0xOm+oCVcXsLjarcXAe4LQDlnr1FTT+wKkAUTcsKd
 SUb6Oe6RJTKmAwShN+66iTPW1djZ9l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-k4J3371hOFaBH1HxO5BfPg-1; Wed, 11 Mar 2020 05:53:38 -0400
X-MC-Unique: k4J3371hOFaBH1HxO5BfPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC034800D50;
 Wed, 11 Mar 2020 09:53:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47FD08882D;
 Wed, 11 Mar 2020 09:53:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C340511386A6; Wed, 11 Mar 2020 10:53:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
Date: Wed, 11 Mar 2020 10:53:29 +0100
In-Reply-To: <20200306051536.27803-3-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 6 Mar 2020 08:15:28 +0300")
Message-ID: <87r1xzfc9y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

SSB0aGluayBhIHY5IG1ha2VzIHNlbnNlIG5vdy4KCklmIGFueSBvZiB0aGUgaW1wcm92ZW1lbnQg
aWRlYXMgc2hvdWxkIHR1cm4gaW50byB0aW1lIHNpbmtzIGZvciB5b3UsCmxldCdzIHRhbGsuICBX
ZSBkb24ndCBuZWVkIHBlcmZlY3Rpb24sIHdlIG9ubHkgbmVlZCB0byBnZXQgdG8gdGhlIHBvaW50
CndoZXJlIHdlIHRydXN0IHRoZSBzY3JpcHQgdG8gZG8gd2hhdCB3ZSBiZWxpZXZlIGl0IGRvZXMs
IHVuZGVyc3RhbmQgaXRzCmxpbWl0YXRpb25zLCBhbmQga25vdyBob3cgdG8gY29tcGVuc2F0ZSBm
b3IgdGhlbS4KClJpZ2h0IG5vdyBJJ20gb3B0aW1pc3RpYyB2OSB3aWxsIGJlIHJlYWR5IGZvciBt
ZXJnaW5nLCBwZXJoYXBzIHdpdGggc29tZQptaW5vciB0d2Vha2luZyBpbiBteSB0cmVlLgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
