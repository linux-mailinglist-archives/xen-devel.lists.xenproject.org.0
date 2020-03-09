Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6417DCDE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 11:01:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBFC3-0005ks-OZ; Mon, 09 Mar 2020 09:59:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBFC1-0005kn-NX
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 09:59:25 +0000
X-Inumbo-ID: a6ed8416-61ec-11ea-abfa-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6ed8416-61ec-11ea-abfa-12813bfff9fa;
 Mon, 09 Mar 2020 09:59:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D56AEAE79;
 Mon,  9 Mar 2020 09:59:21 +0000 (UTC)
To: paul@xen.org
References: <20200309093511.1727-1-paul@xen.org>
 <20200309093511.1727-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3620303a-149f-36f8-1708-236e4bcbb8f0@suse.com>
Date: Mon, 9 Mar 2020 10:59:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309093511.1727-3-paul@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table...
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxMDozNSwgcGF1bEB4ZW4ub3JnIHdyb3RlOgo+IEZyb206IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiAuLi4gYW5kIHJlcGxhY2Ugd2l0aCBhIGNo
ZWNrIG9mIGRvbWFpbl90b3RfcGFnZXMoKS4KPiAKPiBUaGUgY2hlY2sgb2YgcGFnZV9saXN0IHBy
ZXZlbnRzIHRoZSBwcmlvciBhbGxvY2F0aW9uIG9mIFBHQ19leHRyYSBwYWdlcywKPiB3aGVyZWFz
IHdoYXQgdGhlIGNvZGUgaXMgdHJ5aW5nIHRvIHZlcmlmeSBpcyB0aGF0IHRoZSB0b29sc3RhY2sg
aGFzIG5vdAo+IGFscmVhZHkgUkFNIGZvciB0aGUgZG9tYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KcHJlZmVyYWJseSB3aXRoICJyZW1vdmUiIGluIHRoZSBzdWJqZWN0
IHJlcGxhY2VkIGJ5IHRoZSAicmVwbGFjZSIKY3VycmVudGx5IGF0IHRoZSBiZWdpbm5pbmcgb2Yg
dGhlIGRlc2NyaXB0aW9uLiAoSXQgYWxzbyBsb29rcyBhcwppZiB0aGVyZSB3YXMgImFsbG9jYXRl
ZCIgb3Igc29tZSBzdWNoIG1pc3NpbmcgbmVhciB0aGUgZW5kIG9mIHRoZQpkZXNjcmlwdGlvbi4p
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
