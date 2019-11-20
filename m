Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750BB104005
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 16:51:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXSEm-00069r-1c; Wed, 20 Nov 2019 15:49:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXSEk-00069m-BC
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 15:49:46 +0000
X-Inumbo-ID: 5ede5a82-0bad-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ede5a82-0bad-11ea-984a-bc764e2007e4;
 Wed, 20 Nov 2019 15:49:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 571D7B2A94;
 Wed, 20 Nov 2019 15:49:43 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <1573844370-29159-1-git-send-email-igor.druzhinin@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6b444b00-6ebc-31db-9832-7de8f4787e7b@suse.com>
Date: Wed, 20 Nov 2019 16:49:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1573844370-29159-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] passthrough: simplify locking
 and logging
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
Cc: pdurrant@amazon.com, Paul Durrant <paul.durrant@citrix.com>,
 jbeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMTkgMTk6NTksIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IEZyb206IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBEcm9wcGluZyB0aGUgcGNpZGV2cyBsb2Nr
IGJldHdlZW4gY2FsbGluZyBkZXZpY2VfYXNzaWduZWQoKSBhbmQKPiBhc3NpZ25fZGV2aWNlKCkg
bWVhbnMgdGhhdCB0aGUgbGF0dGVyIGhhcyB0byBkbyB0aGUgc2FtZSBjaGVjayBhcyB0aGUKPiBm
b3JtZXIgZm9yIG5vIG9idmlvdXMgZ2Fpbi4gQWxzbywgc2luY2UgbG9uZyBydW5uaW5nIG9wZXJh
dGlvbnMgdW5kZXIKPiBwY2lkZXZzIGxvY2sgYWxyZWFkeSBkcm9wIHRoZSBsb2NrIGFuZCByZXR1
cm4gLUVSRVNUQVJUIHBlcmlvZGljYWxseSB0aGVyZQo+IGlzIGxpdHRsZSBwb2ludCBpbiBpbW1l
ZGlhdGVseSBmYWlsaW5nIGFuIGFzc2lnbm1lbnQgb3BlcmF0aW9uIHdpdGgKPiAtRVJFU1RBUlQg
anVzdCBiZWNhdXNlIHRoZSBwY2lkZXZzIGxvY2sgY291bGQgbm90IGJlIGFjcXVpcmVkIChmb3Ig
dGhlCj4gc2Vjb25kIHRpbWUsIGhhdmluZyBhbHJlYWR5IGJsb2NrZWQgb24gYWNxdWlyaW5nIHRo
ZSBsb2NrIGluCj4gZGV2aWNlX2Fzc2lnbmVkKCkpLgo+IAo+IFRoaXMgcGF0Y2ggaW5zdGVhZCBh
Y3F1aXJlcyB0aGUgbG9jayBvbmNlIGZvciBhc3NpZ25tZW50IChvciB0ZXN0IGFzc2lnbikKPiBv
cGVyYXRpb25zIGRpcmVjdGx5IGluIGlvbW11X2RvX3BjaV9kb21jdGwoKSBhbmQgdGh1cyBjYW4g
cmVtb3ZlIHRoZQo+IGR1cGxpY2F0ZSBkb21haW4gb3duZXJzaGlwIGNoZWNrIGluIGFzc2lnbl9k
ZXZpY2UoKS4gV2hpbHN0IGluIHRoZQo+IG5laWdoYm91cmhvb2QsIHRoZSBwYXRjaCBhbHNvIHJl
bW92ZXMgc29tZSBkZWJ1ZyBsb2dnaW5nIGZyb20KPiBhc3NpZ25fZGV2aWNlKCkgYW5kIGRlYXNz
aWduX2RldmljZSgpIGFuZCByZXBsYWNlcyBpdCB3aXRoIHByb3BlciBlcnJvcgo+IGxvZ2dpbmcs
IHdoaWNoIGFsbG93cyBlcnJvciBsb2dnaW5nIGluIGlvbW11X2RvX3BjaV9kb21jdGwoKSB0byBi
ZQo+IHJlbW92ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6
aGluaW5AY2l0cml4LmNvbT4KCkFzIHRoZSByZWxlYXNlIGlzIGNvbWluZyBuZWFyZXIgSSBkb24n
dCB3YW50IHRvIHRha2UgImNvc21ldGljIiBwYXRjaGVzCmZvciA0LjEzIGFueW1vcmUuCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
