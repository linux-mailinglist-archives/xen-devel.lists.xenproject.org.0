Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEDE4C2E2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 23:22:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdhyj-00087T-Rf; Wed, 19 Jun 2019 21:18:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdhyi-00087O-AQ
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 21:18:48 +0000
X-Inumbo-ID: d2515e6e-92d7-11e9-ad1e-2f046d703234
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d2515e6e-92d7-11e9-ad1e-2f046d703234;
 Wed, 19 Jun 2019 21:18:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BCEE344;
 Wed, 19 Jun 2019 14:18:45 -0700 (PDT)
Received: from [10.37.8.153] (unknown [10.37.8.153])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C099D3F738;
 Wed, 19 Jun 2019 14:18:43 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-2-git-send-email-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <134d0937-f53c-5e92-5d9c-1f544231f214@arm.com>
Date: Wed, 19 Jun 2019 22:18:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560975087-25632-2-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] xen/link: Cope with .rodata.cst*
 sections
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNi8xOS8xOSA5OjExIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IC5y
b2RhdGEuY3N0KiBzZWN0aW9ucyBhcmUgdXNlZCBmb3IgbWVyZ2FibGUgY29uc3RhbnQgZGF0YSwg
YW5kIHRoZSBjbGFuZy9sbHZtCj4gOCB0b29sY2hhaW4gaGFzIGJlZW4gb2JzZXJ2ZWQgdG8gY3Jl
YXRlIC5yb2RhdGEuY3N0OCBpbiBhIGRlZmF1bHQgWGVuIGJ1aWxkLgo+IAo+IFVuZm9ydHVuYXRl
bHksIHRoaXMgc2VjdGlvbiAoYW5kIGl0cyAuaW5pdCBjb3VudGVycGFydCkgYXJlbid0IGNhcHR1
cmVkIGJ5Cj4gWGVuJ3MgbGlua2VyIGdsb2JzLCBhbmQgZW5kIHVwIGFzIG9ycGhhbmVkIHNlY3Rp
b25zLgo+IAo+IEdlbmVyYWxpc2UgdGhlIGRhdGEgZ2xvYmJpbmcgdG8gcGljayB1cCBjc3QgYW5k
IGZ1dHVyZSBzcGVjaWFsIHNlY3Rpb25zLgo+IAo+IFJlcG9ydGVkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TIHwgOSArKystLS0tLS0K
PiAgIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgfCA5ICsrKy0tLS0tLQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+IGluZGV4IGU2
NjRjNDQuLjMxZDc0YTggMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+ICsr
KyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKPiBAQCAtOTYsOCArOTYsNyBAQCBTRUNUSU9OUwo+
ICAgICAgICAgIF9fc3RhcnRfc2NoZWR1bGVyc19hcnJheSA9IC47Cj4gICAgICAgICAgKiguZGF0
YS5zY2hlZHVsZXJzKQo+ICAgICAgICAgIF9fZW5kX3NjaGVkdWxlcnNfYXJyYXkgPSAuOwo+IC0g
ICAgICAgKiguZGF0YS5yZWwpCj4gLSAgICAgICAqKC5kYXRhLnJlbC4qKQo+ICsgICAgICAgKigu
ZGF0YS4qKQoKTXkga25vd2xlZGdlIG9mIGxpbmtlciBpcyBxdWl0ZSBsaW1pdGVkLCBzbyBJIG1p
Z2h0IGJlIHdyb25nLiBCdXQgd2lsbCAKbm90IHRoaXMgbWF0Y2ggLmRhdGEudmNwaSAmIGNvPwoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
