Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FFD2C6AE
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 14:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVbI3-0005Ig-Mn; Tue, 28 May 2019 12:33:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fP1p=T4=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hVbI1-0005Ib-3w
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 12:33:13 +0000
X-Inumbo-ID: bf56cd48-8144-11e9-a600-f77e2fc1b059
Received: from mail4.protonmail.ch (unknown [185.70.40.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf56cd48-8144-11e9-a600-f77e2fc1b059;
 Tue, 28 May 2019 12:33:08 +0000 (UTC)
Date: Tue, 28 May 2019 12:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1559046787;
 bh=s8lk0khbsvRaUJ1NhmHxgO+B00ZOUAISUdu3W9sj/Z0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=LTzEbB1NqUI+bHftld0jAlaMDQYU1j9MF7BzFl1CK2ii64x9gepIOkm29KtTj8xwg
 doDqzubHbvnrIYiof3e4IDhoUyv0pJBva2ij80VphxM+CvN/mRGuoyS5NfJnxl+8ly
 qGvdB9d/WhAe3IqQkHHhOuBvtaOMQRddOjqfJaps=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID: <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
In-Reply-To: <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKPiA+IFRoZSBidWcgaXMgc3RpbGwgaGVyZSwgc28gd2UgY2FuIGV4Y2x1ZGUg
YSBtaWNyb2NvZGUgaXNzdWUuCj4KPiBHb29kIC0gdGhhdCBpcyBvbmUgZnVydGhlciBhbmdsZSBl
eGNsdWRlZC7CoCBBbHdheXMgbWFrZSBzdXJlIHlvdSBhcmUKPiBydW5uaW5nIHdpdGggdXAtdG8t
ZGF0ZSBtaWNyb2NvZGUsIGJ1dCBpdCBsb29rcyBsaWtlIHdlIGJhY2sgdG8KPiBpbnZlc3RpZ2F0
aW5nIGEgbG9naWNhbCBidWcgaW4gbGlidm1pIG9yIFhlbi4KCgpJIHJlaW1wbGVtZW50ZWQgYSBz
bWFsbCB0ZXN0LCB3aXRob3V0IHRoZSBEcmFrdnVmL0xpYnZtaSBsYXllcnMsIHRoYXQgd2lsbCBp
bmplY3QgdHJhcHMgb24gb25lIEFQSSBpbiBXaW5kb3dzIChOdENyZWF0ZVVzZXJQcm9jZXNzKSwK
aW4gdGhlIHNhbWUgd2F5IHRoYXQgRHJha3Z1ZiBkb2VzLgoKSSBkaWQgc29tZSBxdWljayB0ZXN0
aW5nIHllc3RlcmRheSwgd2l0aCBhIFB5dGhvbiBzY3JpcHQgdGhhdCB3YXMgcmVwZWF0ZWRseQpz
dGFydGluZyB0aGUgYmluYXJ5IHRvIG1vbml0b3IgdGhlIEFQSSwgYW5kIGF0IHRoZSBzYW1lIHRp
bWUgc3RhcnRpbmcgQW5zaWJsZQp0byBydW4gImM6XFdpbmRvd3Ncc3lzdGVtMzJccmVnLmV4ZSAv
PyIgdmlhIFdpblJNLCB0byB0cmlnZ2VyIHNvbWUgcHJvY2VzcyBjcmVhdGlvbi4KClRoZSB0cmFw
cyBhcmUgd29ya2luZywgSSBzZWUgdGhlIHNvZnR3YXJlIGJyZWFrcG9pbnQgaGl0LCBzd2l0Y2hp
bmcgdG8gdGhlIGRlZmF1bHQKdmlldyBmb3Igc2luZ2xlc3RlcHBpbmcsIGFuZCBzd2l0Y2hpbmcg
YmFjayB0byB0aGUgZXhlY3V0aW9uIHZpZXcsIHNvIHRoYXQncyBhbHJlYWR5IGdvb2QuCgpBZnRl
ciBhIHNlcmllcyBvZiB0ZXN0cyBvbiAxIG9yIDQgVkNQVXMsIG15IGRvbWFpbiBlbmQgdXAgaW4g
MiBwb3NzaWJsZSBzdGF0ZXM6Ci0gZnJvemVuOiB0aGUgbW91c2UgZG9lc24ndCBtb3ZlOiBzbyBJ
IHdvdWxkIGd1ZXNzIHRoZSBWQ1BVIGFyZSBibG9ja2VkLgoKSSdtIGNhbGxpbmcgdGhlIHhjXyh1
bilwYXVzZV9kb21haW4gQVBJcyBtdWx0aXBsZSB0aW1lcyB3aGVuIEkgd3JpdGUgdG8gdGhlIHNo
YWRvdyBjb3BpZXMsCmJ1dCBJdCdzIGFsd2F5cyBzeW5jaHJvbm91cywgc28gSSBkb3VidCB0aGF0
IHRoZXkgaW50ZXJmZXJlZCBhbmQgInBhdXNlZCIgdGhlIGRvbWFpbi4KCkFsc28sIHRoZSBsb2cg
b3V0cHV0IEkgaGF2ZSBiZWZvcmUgSSBkZXRlY3QgdGhhdCBBbnNpYmxlIGZhaWxlZCB0byBleGVj
dXRlIGlzIHRoYXQgdGhlIHJlc3VtZSBzdWNjZWRlZCBhbmQKWGVuIGlzIHJlYWR5IHRvIHByb2Nl
c3MgVk1JIGV2ZW50cy4KCi0gQlNPRDogdGhhdCdzIHRoZSBzZWNvbmQgcG9zc2liaWxpdHksIGFw
cGFyZW50bHkgSSdtIGNvcnJ1cHRpbmcgY3JpdGljYWwgZGF0YSBzdHJ1Y3R1cmUgaW4gdGhlIG9w
ZXJhdGluZyBzeXN0ZW0sCmFuZCB0aGUgV2luZGJnIGFuYWx5c2lzIGlzIGluY29uY2x1c2l2ZSwg
c28gSSBjYW4ndCB0ZWxsIG11Y2guCgpFaXRoZXIgd2F5LCBJIGNhbid0IGV4ZWN1dGUgdGhpcyB0
ZXN0IHNlcXVlbnRpYWxseSAxMCAwMDAgdGltZXMgd2l0aG91dCBhIGNyYXNoLgoKLT4gQ291bGQg
eW91IGxvb2sgYXQgdGhlIGltcGxlbWVudGF0aW9uLCBhbmQgdGVsbCBtZSBpZiBJIG1pc3VzZWQg
dGhlIEFQSXMgc29tZXdoZXJlID8KaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vbXRhcnJhbC9kOTlj
ZTU1MjRjZmNmYjUyOTBlYWEwNTcwMmMzZThlNwoKSSB1c2VkIHRoZSBjb21wYXQgQVBJcywgbGlr
ZSBEcmFrdnVmIGRvZXMuCgpAVGFtYXMsIGlmIHlvdSBjb3VsZCBjaGVjayB0aGUgdHJhcHMgaW1w
bGVtZW50YXRpb24uCgpZb3UgYWxzbyBoYXZlIHN0cmVzcy10ZXN0LnB5LCB3aGljaCBpcyB0aGUg
c21hbGwgdGVzdCBzdWl0ZSB0aGF0IEkgdXNlZCwgYW5kCnRoZSBzY3JlZW5zaG90IHNob3dpbmcg
dGhlIHN0ZG91dCBwcmVjZWRpbmcgYSB0ZXN0IGZhaWx1cmUsCndoZW4gQW5zaWJsZSBjb3VsZG4n
dCBjb250YWN0IFdpblJNIHNlcnZpY2UgYmVjYXVzZSB0aGUgZG9tYWluIHdhcyBmcm96ZW4uCgpO
b3RlOiBJIHN0b2xlIHNvbWUgY29kZSBmcm9tIGxpYnZtaSwgdG8gaGFuZGxlIHBhZ2UgcmVhZC93
cml0ZSBpbiBYZW4uCgpQUzogaW4gdGhlIGNhc2Ugd2hlcmUgdGhlIGRvbWFpbiBpcyBmcm96ZW4s
IGFuZCBJIGRlc3Ryb3kgdGhlIGRvbWFpbiwgYSAobnVsbCkgZW50cnkgd2lsbCByZW1haW4KaW4g
eGwgbGlzdCwgZGVzcGl0ZSB0aGF0IG15IHN0cmVzcy10ZXN0LnB5IHByb2Nlc3MgaXMgYWxyZWFk
eSBkZWFkLgoKSSBoYXZlIDQgb2YgdGhlc2UgZW50cmllcyBpbiBteSB4bCBsaXN0IHJpZ2h0IG5v
dy4KTWlnaHQgYmUgd29ydGggbG9va2luZyBpbnRvIGl0IGFsc28uCgpCZXN0IHJlZ2FyZHMsCk1h
dGhpZXUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
