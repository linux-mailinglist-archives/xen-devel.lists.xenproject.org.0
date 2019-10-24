Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C91E2C69
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 10:45:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNYgo-0003O0-3U; Thu, 24 Oct 2019 08:41:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNYgn-0003Nv-B3
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 08:41:49 +0000
X-Inumbo-ID: 1c3aa88b-f63a-11e9-9498-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c3aa88b-f63a-11e9-9498-12813bfff9fa;
 Thu, 24 Oct 2019 08:41:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 254E4B4E4;
 Thu, 24 Oct 2019 08:41:46 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191015154736.19882-1-roger.pau@citrix.com>
 <20191015154736.19882-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7c93d7b-e2ff-3342-351d-5b48756bf100@suse.com>
Date: Thu, 24 Oct 2019 10:42:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015154736.19882-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/4] x2APIC: simplify resume
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
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTAuMjAxOSAxNzo0NywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZXJlJ3Mgbm8g
bmVlZCB0byBzYXZlIGFuZCByZXN0b3JlIHRoZSBJTy1BUElDIGVudHJpZXMsIHRoZSBlbnRyaWVz
Cj4gcHJpb3IgdG8gc3VzcGVuc2lvbiBoYXZlIGFscmVhZHkgYmVlbiBzYXZlZCBieSBpb2FwaWNf
c3VzcGVuZCwgYW5kCj4gd2lsbCBiZSByZXN0b3JlZCBieSBpb2FwaWNfcmVzdW1lLiBOb3RlIHRo
YXQgYXQgdGhlIHBvaW50IHdoZXJlCj4gcmVzdW1lX3gyYXBpYyBnZXRzIGNhbGxlZCB0aGUgSU8t
QVBJQyBoYXMgbm90IHlldCByZXN1bWVkLCBhbmQgaGVuY2UKPiBhbGwgZW50cmllcyBzaG91bGQg
YmUgbWFza2VkLgo+IAo+IE5vdGUgdGhpcyBzaG91bGRuJ3QgaW50cm9kdWNlIGFueSBmdW5jdGlv
bmFsIGNoYW5nZS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
