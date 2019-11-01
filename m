Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1120DEBDC0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 07:18:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQQDl-00057Y-3F; Fri, 01 Nov 2019 06:15:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ES3X=YZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iQQDk-00057T-3M
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 06:15:40 +0000
X-Inumbo-ID: 05b34f96-fc6f-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05b34f96-fc6f-11e9-bbab-bc764e2007e4;
 Fri, 01 Nov 2019 06:15:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41BBEAF13;
 Fri,  1 Nov 2019 06:15:37 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191031193808.15401-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <42a9ba4b-c6f9-b6d0-545d-3716287a5e6f@suse.com>
Date: Fri, 1 Nov 2019 07:15:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191031193808.15401-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/pv: Fix !CONFIG_PV build following
 XSA-296
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMTkgMjA6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gUFRGXyogYXJlIGRlY2xh
cmVkIHdpdGhpbiBDT05GSUdfUFYsIGFuZCB1c2VkIG91dHNpZGU6Cj4gCj4gICAgbW0uYzogSW4g
ZnVuY3Rpb24g4oCYX3B1dF9wYWdlX3R5cGXigJk6Cj4gICAgbW0uYzoyODE5OjMyOiBlcnJvcjog
4oCYUFRGX3ByZWVtcHRpYmxl4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0
aW9uKQo+ICAgICAgICAgYm9vbCBwcmVlbXB0aWJsZSA9IGZsYWdzICYgUFRGX3ByZWVtcHRpYmxl
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+Cj4g
ICAgbW0uYzoyODE5OjMyOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBv
cnRlZCBvbmx5IG9uY2UgZm9yIGVhY2gKPiAgICBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCj4gICAg
bW0uYzoyODQyOjI0OiBlcnJvcjog4oCYUFRGX3BhcnRpYWxfc2V04oCZIHVuZGVjbGFyZWQgKGZp
cnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgICAgICAgICAgIGlmICggIShmbGFncyAmIFBU
Rl9wYXJ0aWFsX3NldCkgKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fgo+ICAgIG1tLmM6IEluIGZ1bmN0aW9uIOKAmHB1dF9wYWdlX3R5cGVfcHJlZW1wdGlibGXi
gJk6Cj4gICAgbW0uYzozMDkwOjMzOiBlcnJvcjog4oCYUFRGX3ByZWVtcHRpYmxl4oCZIHVuZGVj
bGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgICAgICAgcmV0dXJuIF9wdXRf
cGFnZV90eXBlKHBhZ2UsIFBURl9wcmVlbXB0aWJsZSwgTlVMTCk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+Cj4gICAgbW0uYzogSW4gZnVuY3Rp
b24g4oCYcHV0X29sZF9ndWVzdF90YWJsZeKAmToKPiAgICBtbS5jOjMxMDg6MjU6IGVycm9yOiDi
gJhQVEZfcHJlZW1wdGlibGXigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rp
b24pCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBURl9wcmVlbXB0aWJsZSB8Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+ICAgIG1tLmM6MzExMDoy
NzogZXJyb3I6IOKAmFBURl9wYXJ0aWFsX3NldOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4g
dGhpcyBmdW5jdGlvbikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQVEZfcGFydGlh
bF9zZXQgOiAwICksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+Cj4gICAgbW0uYzogSW4gZnVuY3Rpb24g4oCYcHV0X3BhZ2VfdHlwZV9wcmVlbXB0aWJsZeKA
mToKPiAgICBtbS5jOjMwOTE6MTogZXJyb3I6IGNvbnRyb2wgcmVhY2hlcyBlbmQgb2Ygbm9uLXZv
aWQgZnVuY3Rpb24KPiAgICBbLVdlcnJvcj1yZXR1cm4tdHlwZV0KPiAgICAgfQo+ICAgICBeCj4g
ICAgY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiAKPiBSZXBvc2l0
aW9uIHRoZSBkZWZpbml0aW9ucyB0byBiZSBvdXRzaWRlIG9mIHRoZSAjaWZkZWYgQ09ORklHX1BW
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
