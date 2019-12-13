Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38E911E5CC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:44:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifm9J-0006Il-1w; Fri, 13 Dec 2019 14:42:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifm9I-0006Ig-2Y
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:42:32 +0000
X-Inumbo-ID: ca2ba9ca-1db6-11ea-8f24-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca2ba9ca-1db6-11ea-8f24-12813bfff9fa;
 Fri, 13 Dec 2019 14:42:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 537E8B16C;
 Fri, 13 Dec 2019 14:42:30 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
 <52ba5440212540e691d0e998ff44448c@EX13D32EUC003.ant.amazon.com>
 <d050059e-adc7-7142-e933-b569ea34bac2@suse.com>
 <9d0e481b-b5e9-72a5-829a-847472fff0ec@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df7fd15a-1c36-291f-6bb2-e38f2cb164f2@suse.com>
Date: Fri, 13 Dec 2019 15:42:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9d0e481b-b5e9-72a5-829a-847472fff0ec@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxNToyOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMy4xMi4xOSAx
NToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEzLjEyLjIwMTkgMTQ6NTMsIER1cnJhbnQs
IFBhdWwgd3JvdGU6Cj4+PiBTaW5jZSAqbm90KiBoYXZpbmcgdGhlICdzaW5rJyBwYWdlIGFsbG93
cyBhIGd1ZXN0IHB1bGwgb2ZmIGEgaG9zdCBEb1MKPj4+IGluIHRoZSBwcmVzZW5jZSBvZiBzdWNo
IGgvdywgc2VjdXJpdHkgaXMgc3VyZWx5IGluY3JlYXNlZCBieSBoYXZpbmcgaXQ/Cj4+Cj4+IGhv
c3QJCWRldmljZQkJcmVzdWx0IHcvbyBzaW5rCQlyZXN1bHQgdy8gc2luawo+PiBnb29kCQlnb29k
CQlnb29kCQkJZ29vZAo+PiBnb29kCQliYWJibGluZwlnb29kIAkJCWdvb2QKPj4gd2VkZ2Ugb24g
ZmF1bHQJZ29vZAkJRG9TIChydW50aW1lKQkJRG9TIChydW50aW1lKQo+IAo+IEkgZ3Vlc3MgdGhl
IERvUyBjYXNlcyBoZXJlIGFyZSBkdWUgdG8gbWFsaWNpb3VzIGd1ZXN0IGFjdGlvbnM/CgpZZXMu
Cgo+PiB3ZWRnZSBvbiBmYXVsdAliYWJibGluZwlEb1MgKHJ1bnRpbWUvbGF0ZSkJRG9TIChydW50
aW1lIG9ubHksIHNpbGVudCkKPiAKPiBBbmQgd2h5IGlzIHRoZSBzaW5rIHBhZ2UgcmVzdWx0aW5n
IGluIGEgc2lsZW50IERvUyBoZXJlPwoKU29ycnksIHNwYWNlIHJlc3RyaWN0aW9ucyBtYXkgaGF2
ZSBsZWFkIHRvIHRoaXMgYmVpbmcgYW1iaWd1b3VzOgpUaGVyZSdzIHN0aWxsIHRoZSBydW50aW1l
IERvUzsgdGhlIHdvdWxkLWJlLURvUyBhZnRlciBkZWFzc2lnbm1lbnQKd2lsbCBnbyBlbnRpcmVs
eSBzaWxlbnQgKGkuZS4gd2l0aG91dCBtYWtpbmcgdGhlIGFkbWluIGF3YXJlIG9mCnRoZSBzaXR1
YXRpb24sIG5vdCBhbGxvd2luZyB0aGVtIHRvIHRha2UgcHJlY2F1dGlvbnMgYWdhaW5zdCB0aGUK
cnVudGltZSBhc3BlY3RzIG9mIHRoaXMpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
