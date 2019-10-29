Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37FBE8604
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 11:46:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPOwn-0005n7-Ri; Tue, 29 Oct 2019 10:41:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lo1b=YW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iPOwm-0005n2-G5
 for xen-devel@lists.xen.org; Tue, 29 Oct 2019 10:41:56 +0000
X-Inumbo-ID: b9cfe252-fa38-11e9-bbab-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9cfe252-fa38-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572345715;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=K3AoWuVzCtSd6P+koxzHTqbkvH6UNRKPaeNjgXxhyhU=;
 b=EiS1YfiFh2EdAchS9XqB5x30Hsya4N4oxUMhFxEt+BejsDuoT2kqa7+u
 YObVhZr0XxKuKS5eRhF9/m47+cymxV54e+mmtxDGGbxWOs6P28xGvKo5s
 KDzYBhZ1KhKNClid+rsGNxllEPLWJ2VyMCkCPmdVU3+cqLuYlG7+0xzwd 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ELGiSjuhz7ifeXvrIJyg0g2xkKEpGkmEh2daM1WqP26TnYmDClpijxEZOUoVI29pk6Ar5+RW1o
 +vm0AUd1/EmZXdnF9gUa5a0TYr0R3qATuiy3YhLhH4C+z9mvSEzgGZqT8deyC9t/fIrcWnNvR4
 AlhXqp66f2NBq5e/TEhfkSzvuK3HHS/BZkdEiJXVB9KydFG56g1Zaylxcxu+EV7r5EVEPJmkOy
 fQ0i3JbU8VvCTmHmhbE+PUVWQFYSs8mQkp0eK3wWRA77DAUegYkneB1l7+bM18xGYZWbKSG43H
 UKc=
X-SBRS: 2.7
X-MesageID: 7914564
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,243,1569297600"; 
   d="scan'208";a="7914564"
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191028085603.32037-1-sergey.dyasli@citrix.com>
 <e55613e7-179d-ee5c-34a4-bc3e41997869@suse.com>
 <19a597f0-1694-02fb-2c01-3446407b35a9@citrix.com>
 <28c68c6f-2812-eb48-5cac-c7a5b05dd3bd@suse.com>
 <7a4dc34f-a817-e2ee-5ded-407ffc86db22@citrix.com>
 <d901c775-4122-6c37-c3c8-2ace1a6251ad@suse.com>
 <1d35b969-c1c4-d58c-abc7-ae6865c9577a@citrix.com>
 <0fabcc47-f029-0024-bd4c-9ca8c56650f0@citrix.com>
 <b2a9fac9-538b-62cb-2051-1cb8ef37eaef@citrix.com>
 <79ed1b08-22c3-4703-0d09-06d3a3ba628f@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8394804c-5e89-e6f2-2bff-7e93dca4ac43@citrix.com>
Date: Tue, 29 Oct 2019 10:41:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <79ed1b08-22c3-4703-0d09-06d3a3ba628f@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for 4.13] x86/shim: don't reserve 640k - 1M
 region in E820
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
Cc: Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTAvMjAxOSAxMDo0MCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAyOS8xMC8yMDE5
IDEwOjE5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyOS8xMC8yMDE5IDEwOjE3LCBTZXJn
ZXkgRHlhc2xpIHdyb3RlOgo+Pj4gT24gMjgvMTAvMjAxOSAxMTozMywgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4+PiBGb3Igbm93LCBob3cgYWJvdXQgY3B1X2hhc19oeXBlcnZpc29yID8KPj4+Pgo+
Pj4+IFdoYXRldmVyIHRoZSB2aXJ0dWFsIGVudmlyb25tZW50LCB3ZSBzaG91bGQgdHJ1c3QgdGhl
IHByb3ZpZGVkIG1lbW9yeSBtYXAuCj4+PiBVbmZvcnR1bmF0ZWx5LCB0aGlzIHBsYW4gaGFzIGZh
aWxlZDogaW5pdF9lODIwKCkgaXMgY2FsbGVkIHdheSBiZWZvcmUKPj4+IGVhcmx5X2NwdV9pbml0
KCkgYW5kIHRlc3RpbmcgY3B1X2hhc19oeXBlcnZpc29yIGlzIG1lYW5pbmdsZXNzIHRoZXJlLgo+
Pj4KPj4+IEkgZ3Vlc3MgSSdsbCBnbyBmb3IgIXB2aF9ib290IGNoZWNrIGZvciBub3cuCj4+IE9w
ZW5jb2RlIGl0IHdpdGggY3B1aWRfZWN4KDEpIGZvciBub3csIGFzIHdlJ3ZlIGRvbmUgZWxzZXdo
ZXJlLgo+Pgo+PiBJJ3ZlIGdvdCBhIHBhdGNoIGluIG15IG5vdC1wcm9ncmVzc2luZy12ZXJ5LXF1
aWNrbHkgc2VyaWVzIHRvIHJlbW92ZSB0aGUKPj4gYm9vdCB0aW1lIG1hcHBpbmcgYXQgMCB3aGlj
aCBjbGVhbnMgdXAgZWFybHkgQ1BVSUQgaGFuZGxpbmcgc28gdGhpcyBjYW4KPj4gdHVybiBpbnRv
IGNwdV9oYXNfaHlwZXJ2aXNvciwgYnV0IHRoYXQgaXMgZGVmaW5pdGVseSBwb3N0LTQuMTMgbWF0
ZXJpYWwKPj4gcmlnaHQgbm93Lgo+IExvb2tpbmcgY2xvc2VseSBhdCBlYXJseV9jcHVfaW5pdCgp
LCBJIGRvbid0IHNlZSBhbnl0aGluZyB0aGVyZSB0aGF0Cj4gd291bGQgcHJldmVudCBwbGFjaW5n
IGl0IG5lYXIgdGhlIHRvcCBvZiBfX3N0YXJ0X3hlbigpLiBJdCB3b3JrcyBmb3IKPiBwdi1zaGlt
LCBidXQgSSBuZWVkIHRvIGFsc28gZG8gc29tZSBiYXJlIG1ldGFsIHRlc3Rpbmcgd2l0aCB0aGlz
IGNoYW5nZS4KPgo+IERvIHlvdSBrbm93IG9mIGFueXRoaW5nIHRoYXQgd291bGQgcHJldmVudCBp
dD8KClllcyAtIG1pY3JvY29kZSBsb2FkaW5nLsKgIFRoYXQgc2VxdWVuY2Ugb2YgdGhpbmdzIGlu
IF9fc3RhcnRfeGVuKCkgaXMKdmVyeSBwb3NpdGlvbiBzZW5zaXRpdmUuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
