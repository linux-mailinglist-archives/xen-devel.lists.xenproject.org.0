Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58F168823
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 21:13:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5EdG-0007dE-4o; Fri, 21 Feb 2020 20:10:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oA+m=4J=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1j5EdF-0007d4-3e
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 20:10:41 +0000
X-Inumbo-ID: 3aecd27a-54e6-11ea-86ec-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3aecd27a-54e6-11ea-86ec-12813bfff9fa;
 Fri, 21 Feb 2020 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582315839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sjOmSCHMfvrvRVy91WQ7NLjtvUcMcmS76ybToQDiQc=;
 b=Yzftz08GsPfECnGM1ORs/dMnoC6bVVg+nve15DDAMBifCcO4iAU70BsLL0X6r6uas4zhx9
 DzeNADrC2G4pSmHaQkVO3XGu4YmqVzs98IV6yaJsdHfBxKqIxfVgziT8pWkv+SquEL5NTf
 L+zdiOjgwH4IFZDDiNyYD+KJN/EYz2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-LxNFeqckMxOPWnh1Ktw5Eg-1; Fri, 21 Feb 2020 15:10:31 -0500
X-MC-Unique: LxNFeqckMxOPWnh1Ktw5Eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F77B107ACC5;
 Fri, 21 Feb 2020 20:10:15 +0000 (UTC)
Received: from [10.3.116.90] (ovpn-116-90.phx2.redhat.com [10.3.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E1279077F;
 Fri, 21 Feb 2020 20:10:08 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-2-vsementsov@virtuozzo.com>
 <87d0a88k6d.fsf@dusky.pond.sub.org>
 <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b7c3dc22-99fd-6165-75e5-f148157e5e8d@redhat.com>
Date: Fri, 21 Feb 2020 08:25:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v7 01/11] qapi/error: add (Error **errp)
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

T24gMi8yMS8yMCAzOjIwIEFNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOgoK
Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgd2Fybl9yZXBvcnRfZXJycChFcnJvciAqKmVycnApCj4+
PiArewo+Pj4gK8KgwqDCoCBhc3NlcnQoZXJycCAmJiAqZXJycCk7Cj4+PiArwqDCoMKgIHdhcm5f
cmVwb3J0X2VycigqZXJycCk7Cj4+PiArwqDCoMKgICplcnJwID0gTlVMTDsKPj4+ICt9Cj4+PiAr
Cj4+PiArCj4+PiDCoCAvKgo+Pj4gwqDCoCAqIEp1c3QgbGlrZSBlcnJvcl9zZXRnKCksIGV4Y2Vw
dCB5b3UgZ2V0IHRvIHNwZWNpZnkgdGhlIGVycm9yIGNsYXNzLgo+Pj4gwqDCoCAqIE5vdGU6IHVz
ZSBvZiBlcnJvciBjbGFzc2VzIG90aGVyIHRoYW4gRVJST1JfQ0xBU1NfR0VORVJJQ19FUlJPUiBp
cwo+Pgo+PiBUaGVzZSBhcHBlYXIgdG8gYmUgdW51c2VkIGFwYXJ0IGZyb20gdGhlIENvY2NpbmVs
bGUgc2NyaXB0IGluIFBBVENIIDAzLgo+Pgo+PiBUaGV5IGFyZSB1c2VkIGluIHRoZSBmdWxsICJb
UkZDIHY1IDAwMC8xMjZdIGVycm9yOiBhdXRvIHByb3BhZ2F0ZWQKPj4gbG9jYWxfZXJyIiBzZXJp
ZXMuwqAgT3B0aW9uczoKPj4KPj4gMS4gUGljayBhIGZldyBtb3JlIHBhdGNoZXMgaW50byB0aGlz
IHBhcnQgSSBzZXJpZXMsIHNvIHRoZXNlIGd1eXMgY29tZQo+PiDCoMKgwqAgd2l0aCB1c2Vycy4K
PiAKPiBJdCBuZWVkcyBzb21lIGFkZGl0aW9uYWwgZWZmb3J0IGZvciB0aGlzIHNlcmllcy4uIEJ1
dCBpdCdzIHBvc3NpYmxlLiBTdGlsbCwKPiBJIHRoaW5rIHRoYXQgd2UgYXQgbGVhc3Qgc2hvdWxk
IG5vdCBwdWxsIG91dCBwYXRjaGVzIHdoaWNoIHNob3VsZCBiZSBpbgo+IGZ1dHVyZSBzZXJpZXMg
KGZvciBleGFtcGxlIGZyb20gcHBjIG9yIGJsb2NrLykuLgo+IAoKPj4gMi4gUHVudCB0aGlzIHBh
dGNoIHRvIHRoZSBmaXJzdCBwYXJ0IHRoYXQgaGFzIHVzZXJzLCBhbG9uZyB3aXRoIHRoZQo+PiDC
oMKgwqAgcGFydCBvZiB0aGUgQ29jY2luZWxsZSBzY3JpcHQgdGhhdCBkZWFscyB3aXRoIHRoZW0u
Cj4gCj4gQnV0IGNvY2NpbmVsbGUgc2NyaXB0IHdvdWxkIGJlIHdyb25nLCBpZiB3ZSBkcm9wIHRo
aXMgcGFydCBmcm9tIGl0LiBJIAo+IHRoaW5rLAo+IHRoYXQgYWZ0ZXIgY29tbWl0IHdoaWNoIGFk
ZHMgY29jY2luZWxsZSBzY3JpcHQsIGl0IHNob3VsZCB3b3JrIHdpdGggYW55IAo+IGZpbGUsCj4g
bm90IG9ubHkgc3Vic2V0IG9mIHRoZXNlIHNlcmllcy4KPiAKPiBTbywgaXQncyBwcm9iYWJseSBP
SyBmb3Igbm93IHRvIGRyb3AgdGhlc2UgZnVuY3Rpb25zLCBmb3JjaW5nIHRoZWlyIAo+IGFkZGl0
aW9uIGlmCj4gY29jY2luZWxsZSBzY3JpcHQgd2lsbCBiZSBhcHBsaWVkIHdoZXJlIHRoZXNlIGZ1
bmN0aW9ucyBhcmUgbmVlZGVkLiBXZSAKPiBjYW4sIGZvcgo+IGV4YW1wbGUgY29tbWVudCB0aGVz
ZSB0aHJlZSBmdW5jdGlvbnMuCj4gCj4gU3BsaXR0aW5nIGNvY2NpbmVsbGUgc2NyaXB0IGludG8g
dHdvIHBhcnRzLCB3aGljaCB3aWxsIGJlIGluIGRpZmZlcmVudCAKPiBzZXJpZXMgd2lsbAo+IG5v
dCBoZWxwIGFueSBwYXRjaC1wb3J0aW5nIHByb2Nlc3Nlcy4KClNwbGl0dGluZyB0aGUgY29jY2lu
ZWxsZSBzY3JpcHQgYWNyb3NzIG11bHRpcGxlIHBhdGNoZXMgaXMgYWN0dWFsbHkgCnF1aXRlIHJl
dmlld2FibGUsIGFuZCBzdGlsbCBlYXN5IHRvIGJhY2twb3J0LiAgQ29uc2lkZXIgdGhpcyBzZXJp
ZXMgYnkgClBoaWxpcHBlOgoKaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11
LWRldmVsLzIwMjAtMDIvbXNnMDU1NTQuaHRtbAoKd2hpY2ggbWFrZXMgbXVsdGlwbGUgYWRkaXRp
b25zIHRvIHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpIApvdmVyIHRoZSBj
b3Vyc2Ugb2YgdGhlIHNlcmllcy4KCi0tIApFcmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUg
RW5naW5lZXIKUmVkIEhhdCwgSW5jLiAgICAgICAgICAgKzEtOTE5LTMwMS0zMjI2ClZpcnR1YWxp
emF0aW9uOiAgcWVtdS5vcmcgfCBsaWJ2aXJ0Lm9yZwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
