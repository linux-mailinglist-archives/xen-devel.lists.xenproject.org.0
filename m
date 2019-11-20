Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB610408D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 17:18:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXSeC-00012L-3L; Wed, 20 Nov 2019 16:16:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXSeA-00012G-8y
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 16:16:02 +0000
X-Inumbo-ID: 0b0bd23c-0bb1-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b0bd23c-0bb1-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 16:16:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 917E2B2FA8;
 Wed, 20 Nov 2019 16:16:00 +0000 (UTC)
To: Hongyan Xia <hongyax@amazon.com>, Wei Liu <wl@xen.org>
References: <cover.1570034362.git.hongyax@amazon.com>
 <11d0e9d423772a7ddbd7d239a5029952d8b0c132.1570034362.git.hongyax@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <764209fe-9cd3-00bb-e801-6d2d92bba60d@suse.com>
Date: Wed, 20 Nov 2019 17:16:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <11d0e9d423772a7ddbd7d239a5029952d8b0c132.1570034362.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/9] x86/mm: introduce l{1,
 2}t local variables to modify_xen_mappings
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gRnJvbTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUaGUgcGwyZSBhbmQgcGwxZSB2YXJpYWJsZXMgYXJl
IGhlYXZpbHkgKGFiKXVzZWQgaW4gdGhhdCBmdW5jdGlvbi4gIEl0Cj4gaXMgZmluZSBhdCB0aGUg
bW9tZW50IGJlY2F1c2UgYWxsIHBhZ2UgdGFibGVzIGFyZSBhbHdheXMgbWFwcGVkIHNvCj4gdGhl
cmUgaXMgbm8gbmVlZCB0byB0cmFjayB0aGUgbGlmZSB0aW1lIG9mIGVhY2ggdmFyaWFibGUuCj4g
Cj4gV2Ugd2lsbCBzb29uIGhhdmUgdGhlIHJlcXVpcmVtZW50IHRvIG1hcCBhbmQgdW5tYXAgcGFn
ZSB0YWJsZXMuIFdlCj4gbmVlZCB0byB0cmFjayB0aGUgbGlmZSB0aW1lIG9mIGVhY2ggdmFyaWFi
bGUgdG8gYXZvaWQgbGVha2FnZS4KPiAKPiBJbnRyb2R1Y2Ugc29tZSBsezEsMn10IHZhcmlhYmxl
cyB3aXRoIGxpbWl0ZWQgc2NvcGUgc28gdGhhdCB3ZSBjYW4KPiB0cmFjayBsaWZlIHRpbWUgb2Yg
cG9pbnRlcnMgdG8geGVuIHBhZ2UgdGFibGVzIG1vcmUgZWFzaWx5Lgo+IAo+IE5vIGZ1bmN0aW9u
YWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CgpXaXRoIGFkanVzdG1lbnRzIHNpbWlsYXIgdG8gd2hhdGV2ZXIgZ2V0cyBkb25lIGZvciBw
YXRjaCAzCihpLmUuIG1pbmltYWxseSBjb25zdC1uZXNzKQpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
