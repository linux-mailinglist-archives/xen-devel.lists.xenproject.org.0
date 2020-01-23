Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E94146D60
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:52:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iueko-00036X-N8; Thu, 23 Jan 2020 15:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuekn-00036H-F6
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:50:45 +0000
X-Inumbo-ID: 18cb0edc-3df8-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18cb0edc-3df8-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 15:50:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1B35DADB5;
 Thu, 23 Jan 2020 15:50:36 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-8-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <830a2332-81c3-eb82-b336-963d0bda0e5c@suse.com>
Date: Thu, 23 Jan 2020 16:50:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200122202343.5703-8-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 7/7] x86/hyperv: setup VP assist page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExpdSB3cm90ZToKPiBAQCAtMTQyLDE1ICsxNDMsNDAg
QEAgc3RhdGljIHZvaWQgc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKHZvaWQpCj4gICAgICB0aGlz
X2NwdShodl92cF9pbmRleCkgPSB2cF9pbmRleF9tc3I7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lk
IHNldHVwX3ZwX2Fzc2lzdCh2b2lkKQo+ICt7Cj4gKyAgICB2b2lkICptYXBwaW5nOwo+ICsgICAg
dWludDY0X3QgdmFsOwo+ICsKPiArICAgIG1hcHBpbmcgPSB0aGlzX2NwdShodl92cF9hc3Npc3Qp
Owo+ICsKPiArICAgIGlmICggIW1hcHBpbmcgKQo+ICsgICAgewo+ICsgICAgICAgIG1hcHBpbmcg
PSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsKPiArICAgICAgICBpZiAoICFtYXBwaW5nICkKPiArICAg
ICAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBhbGxvY2F0ZSB2cF9hc3Npc3QgcGFnZSBmb3IgQ1BV
JXVcbiIsCj4gKyAgICAgICAgICAgICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSk7CgpRdWl0ZSBv
YnZpb3VzbHkgdGhlIHNhbWUgQVAvQlNQIHJlbGF0ZWQgcmVtYXJrIGhlcmUgYXMgd2FzIGdpdmVu
IGZvcgpwYXRjaCA1LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
