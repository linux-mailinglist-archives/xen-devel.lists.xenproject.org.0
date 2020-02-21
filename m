Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC34C168824
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 21:13:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Ed4-0007cJ-QM; Fri, 21 Feb 2020 20:10:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oA+m=4J=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1j5Ed2-0007cC-CA
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 20:10:28 +0000
X-Inumbo-ID: 33a8d45a-54e6-11ea-ade5-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 33a8d45a-54e6-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582315827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zde20pgsMLHMvVL3qmplhL/PnwnuNoaKndBghhwWpA=;
 b=eJK+jK4tTkY0GsfGDceyPg9LZHCG1YQKayyb0W+Jxy/Q7wARJNa2+j6fDRMNj33w1Kr5pz
 rXpK3ErTPC8V8phMxjayMMiXrZtgXRo6nnGRizsk3yHQ6C8rZ93457OlRE29BfJBEseLzH
 1vAa5w3yDRhkkguysiGKps/YZDMXluQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-3Oj7uv-0OqCQflE6sGzLqw-1; Fri, 21 Feb 2020 15:10:23 -0500
X-MC-Unique: 3Oj7uv-0OqCQflE6sGzLqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB23C107ACC7;
 Fri, 21 Feb 2020 20:10:21 +0000 (UTC)
Received: from [10.3.116.90] (ovpn-116-90.phx2.redhat.com [10.3.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA12E5C1D4;
 Fri, 21 Feb 2020 20:10:15 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-3-vsementsov@virtuozzo.com>
 <87mu9c70x1.fsf@dusky.pond.sub.org>
 <278458e5-c62c-8eaa-672f-cc70bbc15304@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0e367f8d-2292-a493-a65a-06e92d7b779e@redhat.com>
Date: Fri, 21 Feb 2020 08:29:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <278458e5-c62c-8eaa-672f-cc70bbc15304@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v7 02/11] error: auto propagated local_err
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
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8yMS8yMCAzOjQyIEFNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOgoK
Pj4+ICsjZGVmaW5lIEVSUlBfQVVUT19QUk9QQUdBVEUoKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+PiArwqDCoMKg
IGdfYXV0byhFcnJvclByb3BhZ2F0b3IpIF9hdXRvX2VycnBfcHJvcCA9IHsuZXJycCA9IGVycnB9
O8KgIFwKPj4+ICvCoMKgwqAgZXJycCA9ICgoZXJycCA9PSBOVUxMIHx8ICplcnJwID09IGVycm9y
X2ZhdGFsKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA/ICZfYXV0b19lcnJwX3Byb3AubG9jYWxfZXJyIDogZXJycCkKPj4+ICsKPj4+IMKgIC8q
Cj4+PiDCoMKgICogU3BlY2lhbCBlcnJvciBkZXN0aW5hdGlvbiB0byBhYm9ydCBvbiBlcnJvci4K
Pj4+IMKgwqAgKiBTZWUgZXJyb3Jfc2V0ZygpIGFuZCBlcnJvcl9wcm9wYWdhdGUoKSBmb3IgZGV0
YWlscy4KPj4KPj4gKmVycnAgPT0gZXJyb3JfZmF0YWwgdGVzdHMgKmVycnAgPT0gTlVMTCwgd2hp
Y2ggaXMgbm90IHdoYXQgeW91IHdhbnQuCj4+IFlvdSBuZWVkIHRvIHRlc3QgZXJycCA9PSAmZXJy
b3JfZmF0YWwsIGp1c3QgbGlrZSBlcnJvcl9oYW5kbGVfZmF0YWwoKS4KPiAKPiBPb3BzLCBncmVh
dCBidWcpIEFuZCBub2JvZHkgbm90aWNlZCBiZWZvcmUpIE9mIGNvdXJzZSwgeW91IGFyZSByaWdo
dC4KClNvcnJ5IEkgbWlzc2VkIGl0IGluIG15IGVhcmxpZXIgbG9va3MuCgo+IAo+Pgo+PiBTdXBl
cmZsdW91cyBwYXJlbnRoZXNpcyBhcm91bmQgdGhlIGZpcnN0IG9wZXJhbmQgb2YgPzouCj4+Cj4+
IFdvdWxkbid0Cj4+Cj4+IMKgwqDCoCAjZGVmaW5lIEVSUlBfQVVUT19QUk9QQUdBVEUoKcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4+IMKgwqDCoMKgwqDCoMKgIGdfYXV0byhFcnJvclByb3BhZ2F0b3IpIF9hdXRvX2Vy
cnBfcHJvcCA9IHsuZXJycCA9IGVycnB9O8KgIFwKPj4gwqDCoMKgwqDCoMKgwqAgaWYgKCFlcnJw
IHx8IGVycnAgPT0gJmVycm9yX2ZhdGFsKSB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVycnAgPSAmX2F1dG9f
ZXJycF9wcm9wLmxvY2FsX2VycjvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPj4gwqDCoMKgwqDCoMKgwqAgfQo+Pgo+PiBiZSBjbGVhcmVyPwo+Pgo+IAo+IEhtbSwg
bm90YXRpb24gd2l0aCAiaWYiIHdpbGwgYWxsb3cgb21pdHRpbmcgJzsnIGFmdGVyIG1hY3JvIGlu
dm9jYXRpb24sIAo+IHdoaWNoIHNlZW1zIG5vdCBnb29kLi4KClRoZW4gd3JhcCBpdDoKCmdfYXV0
byhFcnJvclByb3BhZ2F0b3IpIF9hdXRvX2VycnBfcHJvcCA9IHsuZXJycCA9IGVycnB9OyBcCmRv
IHsgXAogICBpZiAoIWVycnAgfHwgZXJycCA9PSAmZXJyb3JfZmF0YSkgewogICAgIGVycnAgPSAm
X2F1dG9fZXJycF9wcm9wLmxvY2FsX2VycjsgXAogICB9IFwKd2hpbGUgKDApCgoKPiBBbmQgaWYg
SSdtIG5vdCB3cm9uZyB3ZSd2ZSBhbHJlYWR5IGRpc2N1c3NlZCBpdCBzb21ld2hlcmUgaW4gcHJl
dmlvdXMgCj4gdmVyc2lvbnMuCgpUaGUgb3JpZ2luYWwgdXNlIG9mID86IHN0ZW1zIGZyb20gbXkg
c3VnZ2VzdGlvbiBvbiBhbiBlYXJsaWVyIHJldmlzaW9uIAp3aGVuIHdlIHdlcmUgc3RpbGwgdHJ5
aW5nIHRvIHBhY2sgZXZlcnl0aGluZyBpbnRvIHR3byBjb25zZWN1dGl2ZSAKZGVjbGFyYXRpb24g
bGluZXMsIHJhdGhlciB0aGFuIGEgZGVjbGFyYXRpb24gYW5kIGEgc3RhdGVtZW50IChhcyA/OiBp
cyAKbmVjZXNzYXJ5IGZvciBjb25kaXRpb25hbHMgaW4gZGVjbGFyYXRpb25zKS4gIEJ1dCBzaW5j
ZSB0aGVuLCB3ZSBkZWNpZGVkIAp0byBnbyB3aXRoIGEgc3RhdGVtZW50ICh3ZSByZXF1aXJlIGEg
Qzk5IGNvbXBpbGVyLCBzbyBkZWNsYXJhdGlvbiBhZnRlciAKc3RhdGVtZW50IGlzIHN1cHBvcnRl
ZCBieSBvdXIgY29tcGlsZXIsIGV2ZW4gaWYgb3VyIGNvZGluZyBzdHlsZSAKY3VycmVudGx5IGF2
b2lkcyBpdCB3aGVyZSBwb3NzaWJsZSksIHNvIGFzIGxvbmcgYXMgd2Ugc3VwcG9ydCAKc3RhdGVt
ZW50cywgd2UgbWlnaHQgYXMgd2VsbCBnbyB3aXRoIGEgbGVnaWJsZSBzdGF0ZW1lbnQgaW5zdGVh
ZCBvZiAKaW5zaXN0aW5nIG9uIHRoZSBjb21wYWN0ID86IGZvcm0uCgotLSAKRXJpYyBCbGFrZSwg
UHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVyClJlZCBIYXQsIEluYy4gICAgICAgICAgICsxLTkx
OS0zMDEtMzIyNgpWaXJ0dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5vcmcKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
