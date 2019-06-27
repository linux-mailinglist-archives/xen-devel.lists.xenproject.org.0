Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800C57F60
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 11:32:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgQiZ-0008QT-Er; Thu, 27 Jun 2019 09:29:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ndTn=U2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hgQiY-0008QO-OQ
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 09:29:22 +0000
X-Inumbo-ID: 0a62a966-98be-11e9-8f02-6fd238960400
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0a62a966-98be-11e9-8f02-6fd238960400;
 Thu, 27 Jun 2019 09:29:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B87C2B;
 Thu, 27 Jun 2019 02:29:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A94B53F718;
 Thu, 27 Jun 2019 02:29:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-16-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261153580.5851@sstabellini-ThinkPad-T480s>
 <218cf497-cbb5-7213-7678-6294ac3e0882@arm.com>
Message-ID: <4d2fc214-4e8c-6c40-68ec-c35b6f9e5dab@arm.com>
Date: Thu, 27 Jun 2019 10:29:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <218cf497-cbb5-7213-7678-6294ac3e0882@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 15/17] xen/arm64: head: Rework and document
 setup_fixmap()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMjA6MzAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBP
biA2LzI2LzE5IDg6MDEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gTW9uLCAx
MCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gQXQgdGhlIG1vbWVudCwgdGhlIGZp
eG1hcCB0YWJsZSBpcyBvbmx5IGhvb2tlZCB3aGVuIGVhcmx5cHJpbnRrIGlzIHVzZWQuCj4+PiBU
aGlzIGlzIGZpbmUgdG9kYXkgYmVjYXVzZSBpbiBDIGxhbmQsIHRoZSBmaXhtYXAgaXMgbm90IHVz
ZWQgYnkgYW55b25lCj4+PiB1bnRpbCB0aGUgdGhlIGJvb3QgQ1BVIGlzIHN3aXRjaGluZyB0byB0
aGUgcnVudGltZSBwYWdlLXRhYmxlcy4KPj4+Cj4+PiBJbiB0aGUgZnV0dXJlLCB0aGUgYm9vdCBD
UFUgd2lsbCBub3Qgc3dpdGNoIGJldHdlZW4gcGFnZS10YWJsZXMgdG8gYXZvaWQKPj4+IFRMQiBj
b25mbGljdC4gVGhpcyBtZWFucyB0aGUgZml4bWFwIHRhYmxlIHdpbGwgbmVlZCB0byBiZSBob29r
ZWQgYmVmb3JlCj4+PiBhbnkgdXNlLiBGb3Igc2ltcGxpY2l0eSwgc2V0dXBfZml4bWFwKCkgd2ls
bCBub3cgZG8gdGhhdCBqb2IuCj4+Cj4+IENhbiBJIGFzayB5b3UgdG8gcmV3b3JkIHRoaXMgc2xp
Z2h0bHksIGVzcGVjaWFsbHkgdGhlIGxhc3Qgc2VudGVuY2U/IEl0Cj4+IHRvb2sgbWUgYSB3aGls
ZSB0byB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW50LiBJIHN1Z2dlc3Q6Cj4+Cj4+IMKgIEluIHRo
ZSBmdXR1cmUsIHRoZSBib290IENQVSB3aWxsIG5vdCBzd2l0Y2ggYmV0d2VlbiBwYWdlLXRhYmxl
cyB0bwo+PiDCoCBhdm9pZCBhbnkgVExCIGNvbmZsaWN0cy4gVGh1cywgdGhlIGZpeG1hcCB0YWJs
ZSB3aWxsIG5lZWQgdG8gYmUgYWx3YXlzCj4+IMKgIGhvb2tlZCBiZWZvcmUgYW55IHVzZS4gTGV0
J3Mgc3RhcnQgZG9pbmcgaXQgbm93IGluIHNldHVwX2ZpeG1hcCgpLgo+Pgo+IAo+IEkgd2lsbCB1
cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlLgoKSSByZWFsaXplZCB0aGUgY29tbWl0IG1lc3NhZ2Ug
SSB3cm90ZSBpcyBpbmFjY3VyYXRlIGFuZCByZWZsZWN0ZWQgdG8geW91ciByZXdvcmRpbmcuCgpO
b3QgYWxsIHRoZSBwbGF0Zm9ybXMgd2lsbCBnZW5lcmF0ZSBhIFRMQiBjb25mbGljdCBhYm9ydC4g
U29tZSBvZiB0aGVtIG1heSBqdXN0IApkZWNpZGUgdG8gdXNlIGFuIGFtYWxnYW1hdGlvbiBvZiB0
d28gZW50cmllcyAoc2VlICJUTEIgbWF0Y2hpbmciIHBhZ2UgRDUtMjUwMCBpbiAKQVJNIERESSAw
NDg3RC5iKS4KCkkgd2lsbCByZXBsYWNlICJhbnkgVExCIGNvbmZsaWN0cyIgYnkgIlRMQiBpbmNv
aGVyZW5jeSIuCgo+IAo+PiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPiA+CgpMZXQgbWUga25vdyBpZiB5b3UgYXJlIGhhcHB5IHdpdGggdGhlIGNo
YW5nZSBzdWdnZXN0ZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
