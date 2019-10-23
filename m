Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174BEE1D39
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:47:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGwo-0002v5-Jn; Wed, 23 Oct 2019 13:45:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNGwm-0002ux-VC
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:45:08 +0000
X-Inumbo-ID: 535ea84c-f59b-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 535ea84c-f59b-11e9-a531-bc764e2007e4;
 Wed, 23 Oct 2019 13:45:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B4E2B7EF;
 Wed, 23 Oct 2019 13:45:07 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-11-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f46b7b7f-b19c-af92-b171-57c8e1bb056e@suse.com>
Date: Wed, 23 Oct 2019 15:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023130013.32382-11-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 10/11] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6MDAsIElhbiBKYWNrc29uIHdyb3RlOgo+IExJQlhMX1BBU1NUSFJPVUdI
X1VOS05PV04gKGFrYSAiRU5BQkxFRCIgaW4gYW4gZWFybGllciB1bmNvbW1pdHRlZAo+IHZlcnNp
b24gb2YgdGhpcyBjb2RlKSBpcyBkb2luZyBkb3VibGUgZHV0eS4gIFdlIGFjdHVhbGx5IG5lZWQg
YWxsIG9mCj4gdGhlIGZvbGxvd2luZyB0byBiZSBzcGVjaWZpYWJsZToKPiAgICAqICJkZWZhdWx0
IjogZW5hYmxlIFBUIGlmZiB3ZSBoYXZlIGRldmljZXMgdG8KPiAgICAgIHBhc3MgdGhyb3VnaCBz
cGVjaWZpZWQgaW4gdGhlIGluaXRpYWwgY29uZmlnIGZpbGUuCj4gICAgKiAiZW5hYmxlZCIgKGFu
ZCBmYWlsIGlmIHRoZSBwbGF0Zm9ybSBkb2Vzbid0IHN1cHBvcnQgaXQpLgo+ICAgICogImRpc2Fi
bGVkIiAoYW5kIHJlamVjdCBmdXR1cmUgUFQgaG90cGx1ZykuCj4gICAgKiAic2hhcmVfcHQiLyJz
eW5jX3B0IjogZW5hYmxlIFBUIGFuZCBzZXQgYSBzcGVjaWZpYyBQVCBtb2RlLgo+IAo+IERlZmF1
bHRpbmcgYW5kIGVycm9yIGNoZWNraW5nIHNob3VsZCBiZSBkb25lIGluIGxpYnhsLiAgU28sIHdl
IG1ha2UKPiBzZXZlcmFsIGNoYW5nZXMgaGVyZS4KPiAKPiBXZSBpbnRyb2R1Y2UgImVuYWJsZWQi
LCBhbmQgcmVuYW1lICJ1bmtub3duIiB0byAiZGVmYXVsdCIuCj4gCj4gV2UgbW92ZSBhbGwgb2Yg
dGhlIGVycm9yIGNoZWNraW5nIGFuZCBkZWZhdWx0aW5nIGNvZGUgZnJvbSB4bCBpbnRvCj4gbGli
eGwuICBOb3csIGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQgaGFzIGFsbCBvZiB0aGUg
bmVjZXNzYXJ5Cj4gaW5mb3JtYXRpb24gdG8gZ2V0IHRoaXMgcmlnaHQuICBTbyB3ZSBjYW4gZG8g
aXQgYWxsIHRoZXJlLiAgQ2hvb3NpbmcKPiB0aGUgc3BlY2lmaWMgbW9kZSBpcyBhcmNoLXNwZWNp
ZmljLgo+IAo+IFdlIGNhbiBhbHNvIGFycmFuZ2UgdG8gaGF2ZSBvbmx5IG9uZSBwbGFjZSBlYWNo
IHdoaWNoIGNhbGN1bGF0ZXMKPiAoaSkgd2hldGhlciBwYXNzdGhyb3VnaCBuZWVkcyB0byBiZSBl
bmFibGVkIGJlY2F1c2UgcHQgZGV2aWNlcyB3ZXJlCj4gc3BlY2lmaWVkIChpaSkgd2hldGhlciBw
dF9zaGFyZSBjYW4gYmUgdXNlZCAoZm9yIGVhY2ggYXJjaCkuCj4gCj4geGwgbm93IG9ubHkgaGFz
IHRvIHBhcnNlIHRoZSBlbnVtIGluIHRoZSBzYW1lIHdheSBhcyBpdCBwYXJzZXMgYWxsCj4gb3Ro
ZXIgZW51bXMuCj4gCj4gVGhpcyBjaGFuZ2UgZml4ZXMgYSByZWdyZXNzaW9uIGZyb20gZWFybGll
ciA0LjEzLXByZTogdW50aWwgcmVjZW50Cj4gY2hhbmdlcywgcGFzc3Rocm91Z2ggd2FzIG9ubHkg
ZW5hYmxlZCBieSBkZWZhdWx0IGlmIHBhc3N0aHJvdWdoCj4gZGV2aWNlcyB3ZXJlIHNwZWNpZmll
ZC4gIFdlIHJlc3RvcmUgdGhpcyBiZWhhdmlvdXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
