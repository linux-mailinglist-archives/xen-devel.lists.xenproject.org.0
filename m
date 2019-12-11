Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F0D11A9B5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:14:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieztF-0007hv-2N; Wed, 11 Dec 2019 11:10:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kfv1=2B=amazon.com=prvs=2419b2bc4=jgrall@srs-us1.protection.inumbo.net>)
 id 1ieztD-0007hq-Si
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:10:43 +0000
X-Inumbo-ID: df68b42c-1c06-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df68b42c-1c06-11ea-b6f1-bc764e2007e4;
 Wed, 11 Dec 2019 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576062644; x=1607598644;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9G5Yw/pHeBfOjlsKLkiPrXvR1FoHoFQHO4i79ZyUqsw=;
 b=SawBVA7EEtD5zgu9aZfsdZ6LjOZwrIeebj6EpYHO8XEfHrRY/NpUVe79
 5zOoInsuxNNVRj0xiL9w03+aIJkT2oTNj0Cjwhfqrl9caB7anA2pCW3+p
 tfevYMm+RUrvjc6RCxzf9nPpTdiuGGpdrnVlzTU4DGKQiQ6qtEkGqXK1D s=;
IronPort-SDR: gil/tPxbS3f+jIOquWGO5zO04CHXqk9Itpi3Ci/XqhO4yE/cG9yZ4hrUvdH8FNVn5oCvFCRQHF
 xJ7L+HFjT7TQ==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="8594729"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 11 Dec 2019 11:10:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1E0F8A274C; Wed, 11 Dec 2019 11:10:41 +0000 (UTC)
Received: from EX13D37EUA002.ant.amazon.com (10.43.165.200) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:10:40 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D37EUA002.ant.amazon.com (10.43.165.200) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:10:39 +0000
Received: from a483e7b01a66.ant.amazon.com (10.95.102.159) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 11 Dec 2019 11:10:36 +0000
To: "Xia, Hongyan" <hongyxia@amazon.com>, "jbeulich@suse.com"
 <jbeulich@suse.com>
References: <cover.1575891620.git.hongyxia@amazon.com>
 <3375af1e708b4ec3205f493a17da6e0369249096.1575891620.git.hongyxia@amazon.com>
 <3ab3715f-487c-8351-726f-5155c5454d83@suse.com>
 <477a3393debd18473fd15a4ec28a31d76376d320.camel@amazon.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <d365aecc-0611-dc17-d63c-850e0a3363da@amazon.com>
Date: Wed, 11 Dec 2019 11:10:36 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <477a3393debd18473fd15a4ec28a31d76376d320.camel@amazon.com>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSG9uZ3lhbiwKCk9uIDExLzEyLzIwMTkgMTA6MjgsIFhpYSwgSG9uZ3lhbiB3cm90ZToKPiBP
biBUdWUsIDIwMTktMTItMTAgYXQgMTY6MjAgKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pgo+
PiAgICAgICAgICBvbDJlID0gbDJlX2Zyb21faW50cHRlKAo+PiAgICAgICAgICAgICAgICAgICAg
IGwyZV9nZXRfaW50cHRlKG9sMmUpICsgKFBBR0VfU0laRSA8PAo+PiBQQUdFVEFCTEVfT1JERVIp
KTsKPj4KPj4gT2YgY291cnNlLCBhcyBtZW50aW9uZWQgYmVmb3JlLCBJJ20gbm90IG92ZXJseSBo
YXBweSB0byBzZWUgdHlwZQo+PiBzYWZldHkgbG9zdCBpbiBjYXNlIGxpa2UgdGhpcyBvbmUsIHdo
ZXJlIGl0J3Mgbm90IG5lZWRlZCBsaWtlIGUuZy4KPj4gZnVydGhlciB1cCB0byBjb252ZXJ0IGZy
b20gTDMgdG8gTDIgZW50cnkuCj4+Cj4gCj4gT2theSwgc28gSSBkaWQgYSBjb21wYXJpc29uIGJl
dHdlZW4gdGhlIGVmZmljaWVuY3kgb2YgdGhlIGFzc2VtYmx5Cj4gdW5kZXIgYSByZWxlYXNlIGJ1
aWxkLgo+IAo+IFRoZSBvbGQgInR5cGUtc2FmZSIgd2F5IHJlcXVpcmVzIDE2IGluc3RydWN0aW9u
cyB0byBwcmVwYXJlIHRoZSBmaXJzdAo+IGwyZSwgYW5kIGVhY2ggaXRlcmF0aW9uIG9mIHRoZSBp
bm5lciBsb29wIG9mIHBvcHVsYXRpbmcgbDJ0IHJlcXVpcmVzIDcKPiBpbnN0cnVjdGlvbnMuCj4g
Cj4gVGhlIG5ldyB0eXBlLXVuc2FmZSB3YXkgcmVxdWlyZXMgNiB0byBwcmVwYXJlIHRoZSBmaXJz
dCBsMmUsIGFuZCBlYWNoCj4gaXRlcmF0aW9uIG9mIHBvcHVsYXRpbmcgbDJ0IHRha2VzIDUgaW5z
dHJ1Y3Rpb25zLgo+IAo+IFNvIHRoZSBkaWZmZXJlbmNlIG9mIHBvcHVsYXRpbmcgbDJ0IGlzIDM2
MDAgdnMuIDI1NjYgaW5zdHJ1Y3Rpb25zLAo+IHdoaWNoIGlzIG5vdCB2ZXJ5IHNtYWxsLgpXaGls
ZSB0aGlzIGludm9sdmVzIG1vcmUgaW5zdHJ1Y3Rpb25zLCBob3cgb2Z0ZW4gZG8gd2UgZXhwZWN0
IHRoZSBjb2RlIAp0byBiZSBjYWxsZWQ/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
