Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E447A10500B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 11:08:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXjKc-0002oU-C9; Thu, 21 Nov 2019 10:04:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXjKb-0002oM-1N
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:04:57 +0000
X-Inumbo-ID: 5dd8fd6a-0c46-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dd8fd6a-0c46-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 10:04:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87FF4AFBB;
 Thu, 21 Nov 2019 10:04:54 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96d8cb00-7263-d89f-b944-2438a3f16f7b@suse.com>
Date: Thu, 21 Nov 2019 11:04:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/2] x86/cpu: maintain a parked CPU bitmap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAwMDowNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2
L2NwdS9jb21tb24uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKPiBAQCAtMzM3
LDcgKzMzNywxMSBAQCB2b2lkIF9faW5pdCBlYXJseV9jcHVfaW5pdCh2b2lkKQo+ICAJfQo+ICAK
PiAgCWlmICghKGMtPng4Nl92ZW5kb3IgJiAoWDg2X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZ
R09OKSkpCj4gKwl7Cj4gIAkJcGFya19vZmZsaW5lX2NwdXMgPSBvcHRfbWNlOwo+ICsJCWlmIChw
YXJrX29mZmxpbmVfY3B1cyAmJiAhemFsbG9jX2NwdW1hc2tfdmFyKCZjcHVfcGFya2VkX21hcCkp
Cj4gKwkJCXBhbmljKCJObyBtZW1vcnkgZm9yIENQVSBwYXJrZWQgbWFwXG4iKTsKPiArCX0KCk1h
eWJlIHNob3J0ZXIgYXMKCglpZiAoIShjLT54ODZfdmVuZG9yICYgKFg4Nl9WRU5ET1JfQU1EIHwg
WDg2X1ZFTkRPUl9IWUdPTikpICYmIG9wdF9tY2UpCgl7CgkJaWYgKCF6YWxsb2NfY3B1bWFza192
YXIoJmNwdV9wYXJrZWRfbWFwKSkKCQkJcGFuaWMoIk5vIG1lbW9yeSBmb3IgQ1BVIHBhcmtlZCBt
YXBcbiIpOwoJCXBhcmtfb2ZmbGluZV9jcHVzID0gdHJ1ZTsKCX0KCj8KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
