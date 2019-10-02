Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F77C48F4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 09:59:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZUv-00068D-FN; Wed, 02 Oct 2019 07:56:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFZUu-000688-1m
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 07:56:32 +0000
X-Inumbo-ID: 24f43e0c-e4ea-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 24f43e0c-e4ea-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 07:56:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11626AE21;
 Wed,  2 Oct 2019 07:56:30 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
References: <20191001090152.1770-1-david@redhat.com>
 <20191001090152.1770-2-david@redhat.com>
 <be450770-07f6-9fbf-087d-6fc420b6329b@oracle.com>
 <b89e930b-bbf4-9358-97fe-8107e304ee65@redhat.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <25797c40-2ea9-1a3a-eeea-2f6057358481@suse.com>
Date: Wed, 2 Oct 2019 09:56:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b89e930b-bbf4-9358-97fe-8107e304ee65@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/3] xen/balloon: Drop __balloon_append()
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
Cc: linux-mm@kvack.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMTkgMDk6NDcsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDAxLjEwLjE5
IDE5OjQ1LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDEwLzEvMTkgNTowMSBBTSwgRGF2
aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBMZXQncyBzaW1wbHkgdXNlIGJhbGxvb25fYXBwZW5k
KCkgZGlyZWN0bHkuCj4+Pgo+Pj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5
QG9yYWNsZS5jb20+Cj4+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4g
Q2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+IFNpZ25l
ZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+Pgo+PiBGb3Ig
dGhlIHNlcmllcyAoYW5kIHlvdXIgZWFybGllciBwYXRjaCkKPj4KPj4gUmV2aWV3ZWQtYnk6IEJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gCj4gVGhhbmtzISBX
aG8ncyB0aGUgbHVja3kgd2lubmVyIHRvIGV2ZW50dWFsbHkgcGljayB0aGUgZm91ciBwYXRjaGVz
IHVwPyA6KQoKVGhleSB3aWxsIGJlIHRha2VuIHRocm91Z2ggdGhlIFhlbiB0cmVlLgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
