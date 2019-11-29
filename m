Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C5310D131
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 07:02:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaZJG-0002vf-Uq; Fri, 29 Nov 2019 05:59:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaZJF-0002va-3a
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 05:59:17 +0000
X-Inumbo-ID: 5fb5ac00-126d-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fb5ac00-126d-11ea-b155-bc764e2007e4;
 Fri, 29 Nov 2019 05:59:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29988ACE0;
 Fri, 29 Nov 2019 05:59:14 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20191128084545.13831-1-jgross@suse.com>
 <b0a86e66-2366-ff94-e867-2fc5cfdae38d@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6483de2d-963c-3b5e-150a-641e070e3d0e@suse.com>
Date: Fri, 29 Nov 2019 06:59:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b0a86e66-2366-ff94-e867-2fc5cfdae38d@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/events: remove event handling
 recursion detection
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMTkgMjI6MzcsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAxMS8yOC8xOSAz
OjQ1IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiAtCj4+ICAgc3RhdGljIHZvaWQgX194ZW5f
ZXZ0Y2huX2RvX3VwY2FsbCh2b2lkKQo+PiAgIHsKPj4gICAJc3RydWN0IHZjcHVfaW5mbyAqdmNw
dV9pbmZvID0gX190aGlzX2NwdV9yZWFkKHhlbl92Y3B1KTsKPj4gLQlpbnQgY3B1ID0gZ2V0X2Nw
dSgpOwo+PiAtCXVuc2lnbmVkIGNvdW50Owo+PiArCWludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lk
KCk7Cj4+ICAgCj4+ICAgCWRvIHsKPj4gICAJCXZjcHVfaW5mby0+ZXZ0Y2huX3VwY2FsbF9wZW5k
aW5nID0gMDsKPj4gICAKPj4gLQkJaWYgKF9fdGhpc19jcHVfaW5jX3JldHVybih4ZWRfbmVzdGlu
Z19jb3VudCkgLSAxKQo+PiAtCQkJZ290byBvdXQ7Cj4+IC0KPj4gICAJCXhlbl9ldnRjaG5faGFu
ZGxlX2V2ZW50cyhjcHUpOwo+PiAgIAo+PiAgIAkJQlVHX09OKCFpcnFzX2Rpc2FibGVkKCkpOwo+
PiAgIAo+PiAtCQljb3VudCA9IF9fdGhpc19jcHVfcmVhZCh4ZWRfbmVzdGluZ19jb3VudCk7Cj4+
IC0JCV9fdGhpc19jcHVfd3JpdGUoeGVkX25lc3RpbmdfY291bnQsIDApOwo+PiAtCX0gd2hpbGUg
KGNvdW50ICE9IDEgfHwgdmNwdV9pbmZvLT5ldnRjaG5fdXBjYWxsX3BlbmRpbmcpOwo+PiAtCj4+
IC1vdXQ6Cj4+ICsJCXJtYigpOyAvKiBIeXBlcnZpc29yIGNhbiBzZXQgdXBjYWxsIHBlbmRpbmcu
ICovCj4gCj4gdmlydF9ybWIoKSBwZXJoYXBzIHRoZW4/CgpZZXMsIHRoYXQncyBiZXR0ZXIuCgoK
SnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
