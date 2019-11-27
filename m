Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E2E10B6F4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 20:44:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia3CK-0008RG-JX; Wed, 27 Nov 2019 19:42:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zG0R=ZT=amazon.com=prvs=22792133f=jgrall@srs-us1.protection.inumbo.net>)
 id 1ia3CJ-0008RB-Ne
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 19:41:59 +0000
X-Inumbo-ID: f9ff3900-114d-11ea-a3be-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9ff3900-114d-11ea-a3be-12813bfff9fa;
 Wed, 27 Nov 2019 19:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574883720; x=1606419720;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=k5hkFlSO/mCMTpBtl2pDXCy53O45HB/kUjVZwxLN088=;
 b=rMkbDAEWvdAcTU+Avfc2+9LtgmaWua7iw7SipS+tp6RC/YSZcS5ZnsBe
 DztN0x3HB00XKqIUbpYv+c3gBGQqHzqcGj3mKBGAtGsSRQOVm5e/huVHP
 c71c1cU86ntX0MNdoB0xtqIo7i/+Rl8v8RatOFeUNuVRfA30IstZtJYDL c=;
IronPort-SDR: rtd1odIzXRORgQcxG5dM3RxmXb++qqDBZYmdP9lgL9ZLij2+Ya0fYy2rCIvqvDxGMnpeEZIVa9
 +hOgS2k4leaQ==
X-IronPort-AV: E=Sophos;i="5.69,250,1571702400"; 
   d="scan'208";a="6074541"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 27 Nov 2019 19:41:59 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 95AFDA1A87; Wed, 27 Nov 2019 19:41:56 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 19:41:55 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 19:41:54 +0000
Received: from a483e7b01a66.ant.amazon.com (10.95.116.22) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 27 Nov 2019 19:41:52 +0000
To: Paul Durrant <pdurrant@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20191127120046.1246-1-pdurrant@amazon.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <55f189b6-2db4-e4ff-aa3a-64875678051d@amazon.com>
Date: Wed, 27 Nov 2019 19:41:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191127120046.1246-1-pdurrant@amazon.com>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDI3LzExLzIwMTkgMTI6MDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiBGcm9t
OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+IAo+IEEgZ3Vlc3Qgd2lsbCBzZXR1
cCBhIHNoYXJlZCBwYWdlIHdpdGggdGhlIGh5cGVydmlzb3IgZm9yIGVhY2ggdkNQVSB2aWEKPiBY
RU5QTVVfaW5pdC4gVGhlIHBhZ2Ugd2lsbCB0aGVuIGdldCBtYXBwZWQgaW4gdGhlIGh5cGVydmlz
b3IgYW5kIG9ubHkKPiByZWxlYXNlZCB3aGVuIFhFTlBNVV9maW5pc2ggaXMgY2FsbGVkLgo+IAo+
IFRoaXMgbWVhbnMgdGhhdCBpZiB0aGUgZ3Vlc3QgZmFpbHMgdG8gaW52b2tlIFhFTlBNVV9maW5p
c2gsIGUuZyBpZiBpdCBpcwo+IGRlc3Ryb3llZCByYXRoZXIgdGhhbiBjbGVhbmx5IHNodXQgZG93
biwgdGhlIHBhZ2Ugd2lsbCBzdGF5IG1hcHBlZCBpbiB0aGUKPiBoeXBlcnZpc29yLiBPbmUgb2Yg
dGhlIGNvbnNlcXVlbmNlcyBpcyB0aGUgZG9tYWluIGNhbiBuZXZlciBiZSBmdWxseQo+IGRlc3Ry
b3llZCBhcyBhIHBhZ2UgcmVmZXJlbmNlIGlzIHN0aWxsIGhlbGQuCj4gCj4gQXMgWGVuIHNob3Vs
ZCBuZXZlciByZWx5IG9uIHRoZSBndWVzdCB0byBjb3JyZWN0bHkgY2xlYW4tdXAgYW55Cj4gYWxs
b2NhdGlvbiBpbiB0aGUgaHlwZXJ2aXNvciwgd2Ugc2hvdWxkIGFsc28gdW5tYXAgc3VjaCBwYWdl
cyBkdXJpbmcgdGhlCj4gZG9tYWluIGRlc3RydWN0aW9uIGlmIHRoZXJlIGFyZSBhbnkgbGVmdC4K
PiAKPiBXZSBjYW4gcmUtdXNlIHRoZSBzYW1lIGxvZ2ljIGFzIGluIHB2cG11X2ZpbmlzaCgpLiBU
byBhdm9pZAo+IGR1cGxpY2F0aW9uLCBtb3ZlIHRoZSBsb2dpYyBpbiBhIG5ldyBmdW5jdGlvbiB0
aGF0IGNhbiBhbHNvIGJlIGNhbGxlZAo+IGZyb20gdnBtdV9kZXN0cm95KCkuCj4gCj4gTk9URTog
VGhlIGNhbGwgdG8gdnBtdV9kZXN0cm95KCkgbXVzdCBhbHNvIGJlIG1vdmVkIGZyb20KPiAgICAg
ICAgYXJjaF92Y3B1X2Rlc3Ryb3koKSBpbnRvIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygp
IHN1Y2ggdGhhdCB0aGUKPiAgICAgICAgcmVmZXJlbmNlIG9uIHRoZSBtYXBwZWQgcGFnZSBkb2Vz
IG5vdCBwcmV2ZW50IGRvbWFpbl9kZXN0cm95KCkgKHdoaWNoCj4gICAgICAgIGNhbGxzIGFyY2hf
dmNwdV9kZXN0cm95KCkpIGZyb20gYmVpbmcgY2FsbGVkLgo+ICAgICAgICBBbHNvLCB3aGlscyBp
dCBhcHBlYXJzIHRoYXQgdnBtdV9hcmNoX2Rlc3Ryb3koKSBpcyBpZGVtcG90ZW50IGl0IGlzCj4g
ICAgICAgIGJ5IG5vIG1lYW5zIG9idmlvdXMuIEhlbmNlIG1vdmUgbWFuaXB1bGF0aW9uIG9mIHRo
ZQo+ICAgICAgICBWUE1VX0NPTlRFWFRfQUxMT0NBVEVEIGZsYWcgb3V0IG9mIGltcGxlbWVudGF0
aW9uIHNwZWNpZmljIGNvZGUgYW5kCj4gICAgICAgIG1ha2Ugc3VyZSBpdCBpcyBjbGVhcmVkIGF0
IHRoZSBlbmQgb2YgdnBtdV9hcmNoX2Rlc3Ryb3koKS4KCklmIHlvdSByZXNlbmQgdGhlIHBhdGNo
LCBpdCBtaWdodCBiZSB3b3J0aCB0byBhZGQgYSBsaW5lIGFib3V0IHRoZSBsYWNrIApvZiBYU0Eu
IFNvbWV0aGluZyBsaWtlOgoKVGhlcmUgaXMgbm8gYXNzb2NpYXRlZCBYU0EgYmVjYXVzZSB2UE1V
ICBpcyBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkIChzZWUgClhTQS0xNjMpLgoKQ2hlZXJzLAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
