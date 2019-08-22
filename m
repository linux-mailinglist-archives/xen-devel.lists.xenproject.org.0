Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B65999DE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 19:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0qZ6-0000aI-9f; Thu, 22 Aug 2019 17:08:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i0qZ4-0000a9-R1
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 17:07:58 +0000
X-Inumbo-ID: 63503166-c4ff-11e9-addb-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63503166-c4ff-11e9-addb-12813bfff9fa;
 Thu, 22 Aug 2019 17:07:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2AA4233FC;
 Thu, 22 Aug 2019 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566493677;
 bh=a9rT7rFkHVrw1IxJYoGA42ViYuu46OCOZSFSarnJk4M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=aj50/Yfv2a8oJwRYLMUOfSWrB5qitxGtkdiPXqPIeWqXqeirs7Ig3qYIdw2AJMfaQ
 O9eaTHcdAELZZh15ty7lmx+Ky8elUPjsg9ZWk1YIXXmOSylOeKaJJnVSz3o+Nxghed
 aJiNlGuB0h5hxFEtCqIhfRVzw6zgzC7hwjux+yBc=
Date: Thu, 22 Aug 2019 10:07:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190812173019.11956-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1908221007390.22783@sstabellini-ThinkPad-T480s>
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-2-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 01/28] xen/arm: lpae: Allow more LPAE
 helpers to be used in assembly
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMiBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEEgZm9sbG93LXVwIHBh
dGNoIHdpbGwgcmVxdWlyZSB0byB1c2UgKl90YWJsZV9vZmZzZXQoKSBhbmQgKl9NQVNLIGhlbHBl
cnMKPiBmcm9tIGFzc2VtYmx5LiBUaGlzIGNhbiBiZSBhY2hpZXZlZCBieSB1c2luZyBfQVQoKSBt
YWNybyB0byByZW1vdmUgdGhlIHR5cGUKPiB3aGVuIGNhbGxlZCBmcm9tIGFzc2VtYmx5Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tl
ZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0t
Cj4gICAgIENoYW5nZXMgaW4gdjM6Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4gLS0tCj4gIHhl
bi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oIHwgMTAgKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20tYXJtL2xwYWUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oCj4gaW5k
ZXggYzIyNzgwZjhmMy4uNDc5N2Y5Y2VlNCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20t
YXJtL2xwYWUuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oCj4gQEAgLTI0NSwx
OSArMjQ1LDE5IEBAIFRBQkxFX09GRlNFVF9IRUxQRVJTKDY0KTsKPiAgCj4gICNkZWZpbmUgVEhJ
UkRfU0hJRlQgICAgKFBBR0VfU0hJRlQpCj4gICNkZWZpbmUgVEhJUkRfT1JERVIgICAgKFRISVJE
X1NISUZUIC0gUEFHRV9TSElGVCkKPiAtI2RlZmluZSBUSElSRF9TSVpFICAgICAoKHBhZGRyX3Qp
MSA8PCBUSElSRF9TSElGVCkKPiArI2RlZmluZSBUSElSRF9TSVpFICAgICAoX0FUKHBhZGRyX3Qs
IDEpIDw8IFRISVJEX1NISUZUKQo+ICAjZGVmaW5lIFRISVJEX01BU0sgICAgICh+KFRISVJEX1NJ
WkUgLSAxKSkKPiAgI2RlZmluZSBTRUNPTkRfU0hJRlQgICAoVEhJUkRfU0hJRlQgKyBMUEFFX1NI
SUZUKQo+ICAjZGVmaW5lIFNFQ09ORF9PUkRFUiAgIChTRUNPTkRfU0hJRlQgLSBQQUdFX1NISUZU
KQo+IC0jZGVmaW5lIFNFQ09ORF9TSVpFICAgICgocGFkZHJfdCkxIDw8IFNFQ09ORF9TSElGVCkK
PiArI2RlZmluZSBTRUNPTkRfU0laRSAgICAoX0FUKHBhZGRyX3QsIDEpIDw8IFNFQ09ORF9TSElG
VCkKPiAgI2RlZmluZSBTRUNPTkRfTUFTSyAgICAofihTRUNPTkRfU0laRSAtIDEpKQo+ICAjZGVm
aW5lIEZJUlNUX1NISUZUICAgIChTRUNPTkRfU0hJRlQgKyBMUEFFX1NISUZUKQo+ICAjZGVmaW5l
IEZJUlNUX09SREVSICAgIChGSVJTVF9TSElGVCAtIFBBR0VfU0hJRlQpCj4gLSNkZWZpbmUgRklS
U1RfU0laRSAgICAgKChwYWRkcl90KTEgPDwgRklSU1RfU0hJRlQpCj4gKyNkZWZpbmUgRklSU1Rf
U0laRSAgICAgKF9BVChwYWRkcl90LCAxKSA8PCBGSVJTVF9TSElGVCkKPiAgI2RlZmluZSBGSVJT
VF9NQVNLICAgICAofihGSVJTVF9TSVpFIC0gMSkpCj4gICNkZWZpbmUgWkVST0VUSF9TSElGVCAg
KEZJUlNUX1NISUZUICsgTFBBRV9TSElGVCkKPiAgI2RlZmluZSBaRVJPRVRIX09SREVSICAoWkVS
T0VUSF9TSElGVCAtIFBBR0VfU0hJRlQpCj4gLSNkZWZpbmUgWkVST0VUSF9TSVpFICAgKChwYWRk
cl90KTEgPDwgWkVST0VUSF9TSElGVCkKPiArI2RlZmluZSBaRVJPRVRIX1NJWkUgICAoX0FUKHBh
ZGRyX3QsIDEpIDw8IFpFUk9FVEhfU0hJRlQpCj4gICNkZWZpbmUgWkVST0VUSF9NQVNLICAgKH4o
WkVST0VUSF9TSVpFIC0gMSkpCj4gIAo+ICAvKiBDYWxjdWxhdGUgdGhlIG9mZnNldHMgaW50byB0
aGUgcGFnZXRhYmxlcyBmb3IgYSBnaXZlbiBWQSAqLwo+IEBAIC0yNjYsNyArMjY2LDcgQEAgVEFC
TEVfT0ZGU0VUX0hFTFBFUlMoNjQpOwo+ICAjZGVmaW5lIHNlY29uZF9saW5lYXJfb2Zmc2V0KHZh
KSAoKHZhKSA+PiBTRUNPTkRfU0hJRlQpCj4gICNkZWZpbmUgdGhpcmRfbGluZWFyX29mZnNldCh2
YSkgKCh2YSkgPj4gVEhJUkRfU0hJRlQpCj4gIAo+IC0jZGVmaW5lIFRBQkxFX09GRlNFVChvZmZz
KSAoKHVuc2lnbmVkIGludCkob2ZmcykgJiBMUEFFX0VOVFJZX01BU0spCj4gKyNkZWZpbmUgVEFC
TEVfT0ZGU0VUKG9mZnMpIChfQVQodW5zaWduZWQgaW50LCBvZmZzKSAmIExQQUVfRU5UUllfTUFT
SykKPiAgI2RlZmluZSBmaXJzdF90YWJsZV9vZmZzZXQodmEpICBUQUJMRV9PRkZTRVQoZmlyc3Rf
bGluZWFyX29mZnNldCh2YSkpCj4gICNkZWZpbmUgc2Vjb25kX3RhYmxlX29mZnNldCh2YSkgVEFC
TEVfT0ZGU0VUKHNlY29uZF9saW5lYXJfb2Zmc2V0KHZhKSkKPiAgI2RlZmluZSB0aGlyZF90YWJs
ZV9vZmZzZXQodmEpICBUQUJMRV9PRkZTRVQodGhpcmRfbGluZWFyX29mZnNldCh2YSkpCj4gLS0g
Cj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
