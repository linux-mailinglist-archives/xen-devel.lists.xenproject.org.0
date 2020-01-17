Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75F140C6C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:27:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSYk-00016b-4u; Fri, 17 Jan 2020 14:25:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E2+z=3G=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1isSYi-00016Q-OB
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:25:12 +0000
X-Inumbo-ID: 2b5dccaa-3935-11ea-b543-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2b5dccaa-3935-11ea-b543-12813bfff9fa;
 Fri, 17 Jan 2020 14:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579271111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8yNx0ZTf2K3z2aWImeXwFN8gQ+h7JLlcAwfIVJBV19w=;
 b=UvF2Hcf79Wmp13MJE8ODPg9N6cjP5gmE4hjEYseholLvL9gpFmEmqhfh5KkUxEY9uZma2e
 5Z8wzZPQbQLX9ggyuD1i7ErCrZKKQiKos2f81Azg6sf5NeWfc/0HDdXljZBPgM5yrmhYx9
 swL9ud4+X86fpSk2AvVuk4w9UfJwLHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-UWirfdaMNpKL8xt8P9glKg-1; Fri, 17 Jan 2020 09:25:06 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60FBA800591;
 Fri, 17 Jan 2020 14:25:04 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1AB56609E;
 Fri, 17 Jan 2020 14:24:55 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <20200110194158.14190-4-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4e41cb43-4efb-9cc9-c685-d25e4ddf8fbb@redhat.com>
Date: Fri, 17 Jan 2020 08:24:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200110194158.14190-4-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: UWirfdaMNpKL8xt8P9glKg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v6 03/11] scripts: add coccinelle script to
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
dmlydHVvenpvLmNvbT4KPiAtLS0KClJhdGhlciBsaWdodCBvbiB0aGUgY29tbWl0IG1lc3NhZ2Uu
IElmIG5vdGhpbmcgZWxzZSwgYSBjb21tZW50IGFib3V0IAp0eXBpY2FsIGNvbW1hbmQtbGluZSB1
c2FnZSB3b3VsZCBiZSBoZWxwZnVsICh5ZXMsIGl0J3MgaW4gdGhlIHBhdGNoIApib2R5LCBidXQg
c29tZXRpbWVzIEkganVzdCByZWZlciB0byBnaXQgbG9nKS4KCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvcWFwaS9lcnJvci5oIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKPiBpbmRleCA1MzJiOWFmYjll
Li5kY2ZiNzdlMTA3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4gKysrIGIv
aW5jbHVkZS9xYXBpL2Vycm9yLmgKPiBAQCAtMTQxLDYgKzE0MSw5IEBACj4gICAgKiAgICAgICAg
IC4uLgo+ICAgICogICAgIH0KPiAgICAqCj4gKyAqIEZvciBtYXNzIGNvbnZlcnNpb24gdXNlIHNj
cmlwdAo+ICsgKiAgIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2Nj
aQo+ICsgKgo+ICAgICoKPiAgICAqIFJlY2VpdmUgYW5kIGFjY3VtdWxhdGUgbXVsdGlwbGUgZXJy
b3JzIChmaXJzdCBvbmUgd2lucyk6Cj4gICAgKiAgICAgRXJyb3IgKmVyciA9IE5VTEwsICpsb2Nh
bF9lcnIgPSBOVUxMOwo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9w
YWdhdGVkLWVycnAuY29jY2kgYi9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVy
cnAuY29jY2kKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjZjNzJh
NTA0OWYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJv
cGFnYXRlZC1lcnJwLmNvY2NpCj4gQEAgLTAsMCArMSwxMzkgQEAKPiArLy8gVXNlIEVSUlBfQVVU
T19QUk9QQUdBVEUgKHNlZSBpbmNsdWRlL3FhcGkvZXJyb3IuaCkKPiArLy8KCj4gKy8vIFVzYWdl
IGV4YW1wbGU6Cj4gKy8vIHNwYXRjaCAtLXNwLWZpbGUgc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8t
cHJvcGFnYXRlZC1lcnJwLmNvY2NpIFwKPiArLy8gIC0tbWFjcm8tZmlsZSBzY3JpcHRzL2NvY2Np
LW1hY3JvLWZpbGUuaCAtLWluLXBsYWNlIC0tbm8tc2hvdy1kaWZmIFwKPiArLy8gIGJsb2NrZGV2
LW5iZC5jIHFlbXUtbmJkLmMge2Jsb2NrL25iZCosbmJkLyosaW5jbHVkZS9ibG9jay9uYmQqfS5b
aGNdCj4gKwo+ICtAQAo+ICsvLyBBZGQgaW52b2NhdGlvbiB0byBlcnJwLWZ1bmN0aW9ucyB3aGVy
ZSBuZWNlc3NhcnkKPiArLy8gV2Ugc2hvdWxkIHNraXAgZnVuY3Rpb25zIHdpdGggIkVycm9yICpj
b25zdCAqZXJycCIKPiArLy8gcGFyYW1ldGVyLCBidXQgaG93IHRvIGRvIGl0IHdpdGggY29jY2lu
ZWxsZT8KPiArLy8gSSBkb24ndCBrbm93LCBzbywgSSBza2lwIHRoZW0gYnkgZnVuY3Rpb24gbmFt
ZSByZWdleC4KPiArLy8gSXQncyBzYWZlOiBpZiB3ZSBub3Qgc2tpcCBzb21lIGZ1bmN0aW9ucyB3
aXRoCgpzL25vdC9kaWQgbm90LwoKPiArLy8gIkVycm9yICpjb25zdCAqZXJycCIsIEVSUlBfQVVU
T19QUk9QQUdBVEUgaW52b2NhdGlvbgo+ICsvLyB3aWxsIGZhaWwgdG8gY29tcGlsZSwgYmVjYXVz
ZSBvZiBjb25zdCB2aW9sYXRpb24uCj4gK2lkZW50aWZpZXIgZm4gIX4gImVycm9yX2FwcGVuZF8u
Kl9oaW50IjsKPiAraWRlbnRpZmllciBsb2NhbF9lcnIsIGVycnA7Cj4gK0BACj4gKwo+ICsgZm4o
Li4uLCBFcnJvciAqKmVycnAsIC4uLikKPiArIHsKPiArKyAgIEVSUlBfQVVUT19QUk9QQUdBVEUo
KTsKPiArICAgIDwrLi4uCj4gKyAgICAgICAgd2hlbiAhPSBFUlJQX0FVVE9fUFJPUEFHQVRFKCk7
Cj4gKygKPiArICAgIGVycm9yX2FwcGVuZF9oaW50KGVycnAsIC4uLik7Cj4gK3wKPiArICAgIGVy
cm9yX3ByZXBlbmQoZXJycCwgLi4uKTsKPiArfAo+ICsgICAgRXJyb3IgKmxvY2FsX2VyciA9IE5V
TEw7Cj4gKykKPiArICAgIC4uLis+Cj4gKyB9Cj4gKwoKTG9va3MgbGlrZSBpdCBzaG91bGQgY2F0
Y2ggYWxsIGZ1bmN0aW9ucyB0aGF0IHJlcXVpcmUgYWRkaW5nIHRoZSBtYWNyby4KCj4gK0BydWxl
MUAKPiArLy8gV2UgZG8gbm90IGluaGVyaXQgZnJvbSBwcmV2aW91cyBydWxlLCBhcyB3ZSB3YW50
IHRvIG1hdGNoCj4gKy8vIGFsc28gZnVuY3Rpb25zLCB3aGljaCBhbHJlYWR5IGhhZCBFUlJQX0FV
VE9fUFJPUEFHQVRFCj4gKy8vIGludm9jYXRpb24uCgpHcmFtbWFyIHN1Z2dlc3Rpb246CgovLyBX
ZSB3YW50IHRvIHBhdGNoIGVycm9yIHByb3BhZ2F0aW9uIGluIGZ1bmN0aW9ucyByZWdhcmRsZXNz
IG9mCi8vIHdoZXRoZXIgdGhlIGZ1bmN0aW9uIGFscmVhZHkgdXNlcyBFUlJQX0FVVE9fUFJPUEFH
QVRFLCBoZW5jZQovLyB0aGlzIG9uZSBkb2VzIG5vdCBpbmhlcml0IGZyb20gdGhlIGZpcnN0IHJ1
bGUuCgpSZXZpZXdlZC1ieTogRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+CgotLSAKRXJp
YyBCbGFrZSwgUHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVyClJlZCBIYXQsIEluYy4gICAgICAg
ICAgICsxLTkxOS0zMDEtMzIyNgpWaXJ0dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5v
cmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
