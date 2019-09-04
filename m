Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D898A7EF1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:11:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5RHP-0001AZ-9r; Wed, 04 Sep 2019 09:08:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5RHN-0001AK-BU
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 09:08:41 +0000
X-Inumbo-ID: 95f6332e-cef3-11e9-abad-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95f6332e-cef3-11e9-abad-12813bfff9fa;
 Wed, 04 Sep 2019 09:08:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 703BEB667;
 Wed,  4 Sep 2019 09:08:39 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52fe7f67-ffd0-2d22-90fb-f3462ea059cd@suse.com>
Date: Wed, 4 Sep 2019 11:08:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAwMjoyMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gSWYgTUNGRyBhcmVh
IGlzIG5vdCByZXNlcnZlZCBpbiBFODIwLCBYZW4gYnkgZGVmYXVsdCB3aWxsIGRlZmVyIGl0cyB1
c2FnZQo+IHVudGlsIERvbTAgcmVnaXN0ZXJzIGl0IGV4cGxpY2l0bHkgYWZ0ZXIgQUNQSSBwYXJz
ZXIgcmVjb2duaXplcyBpdCBhcwo+IGEgcmVzZXJ2ZWQgcmVzb3VyY2UgaW4gRFNEVC4gSGF2aW5n
IGl0IHJlc2VydmVkIGluIEU4MjAgaXMgbm90Cj4gbWFuZGF0b3J5IGFjY29yZGluZyB0byAiUENJ
IEZpcm13YXJlIFNwZWNpZmljYXRpb24sIHJldiAzLjIiIChwYXIuIDQuMS4yKQo+IGFuZCBmaXJt
d2FyZSBpcyBmcmVlIHRvIGtlZXAgYSBob2xlIEU4MjAgaW4gdGhhdCBwbGFjZS4gWGVuIGRvZXNu
J3Qga25vdwo+IHdoYXQgZXhhY3RseSBpcyBpbnNpZGUgdGhpcyBob2xlIHNpbmNlIGl0IGxhY2tz
IGZ1bGwgQUNQSSB2aWV3IG9mIHRoZQo+IHBsYXRmb3JtIHRoZXJlZm9yZSBpdCdzIHBvdGVudGlh
bGx5IGhhcm1mdWwgdG8gYWNjZXNzIE1DRkcgcmVnaW9uCj4gd2l0aG91dCBhZGRpdGlvbmFsIGNo
ZWNrcyBhcyBzb21lIG1hY2hpbmVzIGFyZSBrbm93biB0byBwcm92aWRlCj4gaW5jb25zaXN0ZW50
IGluZm9ybWF0aW9uIG9uIHRoZSBzaXplIG9mIHRoZSByZWdpb24uCgpJcnJlc3BlY3RpdmUgb2Yg
dGhpcyBiZWluZyBhIGdvb2QgY2hhbmdlLCBJJ3ZlIGhhZCBhbm90aGVyIHRob3VnaHQKd2hpbGUg
cmVhZGluZyB0aGlzIHBhcmFncmFwaCwgZm9yIGEgaHlwZXJ2aXNvciBzaWRlIGNvbnRyb2w6IExp
bnV4CmhhcyBhICJtZW1vcHQ9IiBjb21tYW5kIGxpbmUgb3B0aW9uIGFsbG93aW5nIGZpbmUgZ3Jh
aW5lZCBjb250cm9sCm92ZXIgdGhlIEU4MjAgbWFwLiBXZSBjb3VsZCBoYXZlIHNvbWV0aGluZyBz
aW1pbGFyIHRvIGFsbG93Cmluc2VydGluZyBhbiBFODIwX1JFU0VSVkVEIHJlZ2lvbiBpbnRvIGEg
aG9sZSAoaXQgd291bGQgYmUgdGhlCnJlc3BvbnNpYmlsaXR5IG9mIHRoZSBhZG1pbiB0byBndWFy
YW50ZWUgbm8gb3RoZXIgY29uZmxpY3RzLCBpLmUuCml0IHNob3VsZCBnZW5lcmFsbHkgYmUgdXNl
ZCBvbmx5IGlmIGUuZy4gdGhlIE1DRkcgaXMgaW5kZWVkIGtub3duCnRvIGxpdmUgYXQgdGhlIHNw
ZWNpZmllZCBwbGFjZSwgYW5kIGJlaW5nIHByb3Blcmx5IHJlcHJlc2VudGVkIGluCnRoZSBBQ1BJ
IHRhYmxlcykuIFRob3VnaHRzPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
