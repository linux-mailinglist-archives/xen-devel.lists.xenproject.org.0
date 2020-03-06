Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E0917BD09
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:46:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACKe-0006ff-US; Fri, 06 Mar 2020 12:44:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FbB0=4X=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1jACKd-0006fa-0P
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:43:59 +0000
X-Inumbo-ID: 25e71d50-5fa8-11ea-a7c1-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 25e71d50-5fa8-11ea-a7c1-12813bfff9fa;
 Fri, 06 Mar 2020 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583498638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/txHChYAsFlVrUHZBgmVdcxpU3iJMCzrGbMnmiY4G8=;
 b=Uu8oqnWw5bb6MUzbNV3NR4uy1fhOGGPAl3Nq3GYlztS4CO015O3IwvZZlEtqRSufox1IA8
 BNQVLc6F1VwcGmEXOfq9gR4Q3BmCbP1CLTLbBFMM1Agrl3FrZF9WwZoNdK5+9utmmkAVzi
 l3oHis2QrMRuxCwecMtIEfsscv/kWHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-nkUAVqrpNFydeiZfafpZ-g-1; Fri, 06 Mar 2020 07:43:54 -0500
X-MC-Unique: nkUAVqrpNFydeiZfafpZ-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A9BD107ACC9;
 Fri,  6 Mar 2020 12:43:52 +0000 (UTC)
Received: from [10.3.117.177] (ovpn-117-177.phx2.redhat.com [10.3.117.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E054746;
 Fri,  6 Mar 2020 12:43:43 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8b4ef7d1-f1dd-91f3-0c34-787818cbecd1@redhat.com>
Date: Fri, 6 Mar 2020 06:43:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306051536.27803-3-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 armbru@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy81LzIwIDExOjE1IFBNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOgo+
IFNjcmlwdCBhZGRzIEVSUlBfQVVUT19QUk9QQUdBVEUgbWFjcm8gaW52b2NhdGlvbiB3aGVyZSBh
cHByb3ByaWF0ZSBhbmQKPiBkb2VzIGNvcnJlc3BvbmRpbmcgY2hhbmdlcyBpbiBjb2RlIChsb29r
IGZvciBkZXRhaWxzIGluCj4gaW5jbHVkZS9xYXBpL2Vycm9yLmgpCj4gCj4gVXNhZ2UgZXhhbXBs
ZToKPiBzcGF0Y2ggLS1zcC1maWxlIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQt
ZXJycC5jb2NjaSBcCj4gICAtLW1hY3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmgg
LS1pbi1wbGFjZSAtLW5vLXNob3ctZGlmZiBcCj4gICBibG9ja2Rldi1uYmQuYyBxZW11LW5iZC5j
IHtibG9jay9uYmQqLG5iZC8qLGluY2x1ZGUvYmxvY2svbmJkKn0uW2hjXQo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpv
LmNvbT4KPiAtLS0KPiAKCkknbGwgbGV0IE1hcmt1cyBkbyB0aGUgZmluYWwgcmV2aWV3IG9mIHRo
aXMsIGJ1dCBteSBwZXJzb25hbCB0YWtlIGlzIAp0aGF0IGlmIHRoZSBzdWJzZXF1ZW50IHBhdGNo
ZXMgY3JlYXRlZCBieSB1c2luZyB0aGlzIHNjcmlwdCBhcmUgCnJlYXNvbmFibGUsIHRoZW4gdGhp
cyBzY3JpcHQgd2FzIGdvb2QgZW5vdWdoLgoKPiArLy8gQWx3YXlzIHVzZSB0aGUgc2FtZSBwYXR0
ZXIgZm9yIGNoZWNraW5nIGVycm9yCgpwYXR0ZXJuCgo+ICtAQAo+ICtpZGVudGlmaWVyIHJ1bGUx
LmZuOwo+ICtzeW1ib2wgZXJycDsKPiArQEAKPiArCj4gKyBmbiguLi4pCj4gKyB7Cj4gKyAgICAg
PC4uLgo+ICstICAgICplcnJwICE9IE5VTEwKPiArKyAgICAqZXJycAo+ICsgICAgIC4uLj4KPiAr
IH0KPiAKCi0tIApFcmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXIKUmVkIEhh
dCwgSW5jLiAgICAgICAgICAgKzEtOTE5LTMwMS0zMjI2ClZpcnR1YWxpemF0aW9uOiAgcWVtdS5v
cmcgfCBsaWJ2aXJ0Lm9yZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
