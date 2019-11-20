Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E4B104500
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 21:26:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXWUl-0004sV-WC; Wed, 20 Nov 2019 20:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jra2=ZM=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iXWUk-0004sQ-Qp
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 20:22:34 +0000
X-Inumbo-ID: 7b824a1a-0bd3-11ea-9631-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b824a1a-0bd3-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 20:22:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so1494668wru.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2019 12:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jmjoquFTURE31BNJkqtNwXsxssByhbiJdvpcjdDB2qk=;
 b=A2YFpERVTCiHbyscz+R1B32hOfJoiw8/1lpi6LqRPAWwQzgpvCDYBP//tkV3B9dELi
 NrU0goWFmCrEZGsayYgFVn972ax6DeeC19D6HqdAWoQQBe0cn+UO/UhrPdz4HPiZ4dMH
 veG+ont7JAx20DNRsnjQeKjuNumRG7nQuKvezmDEroWrwpYh0d2SaNxwPJIJ1OcwfJTC
 bQz+s2//KdX6ePa7F5bCZ7zCju+CvyEWsGTf0TP0c59TVA80tAQFNE/ufFpkvy8jKHzs
 58qYAUp6m5boo5t02Iz80aAB8IBc2FmavcBS0mcseDpxLCeSegg8A7faMvJmplPB2e0Q
 E5KQ==
X-Gm-Message-State: APjAAAVsnrBR5kZVWOh4d2onuiXnOASaZal/9ErCrmD60uXHh9GzSM0V
 RB22bScVNlsg2xJp62re1CE=
X-Google-Smtp-Source: APXvYqwY3KCbSX0NeBvlKTy5utTGr+oCDZrpB8bEPxM0HyMuNt6NIIqPoSccTGdKyOr9L+H11a4JPQ==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr5920482wrq.40.1574281352255;
 Wed, 20 Nov 2019 12:22:32 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id t13sm408430wrr.88.2019.11.20.12.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2019 12:22:31 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
 <f2232cd2-4786-2b8e-d649-0635309edb92@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <480f4d49-0a5f-c011-a5b8-85a9fc6352af@xen.org>
Date: Wed, 20 Nov 2019 20:22:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f2232cd2-4786-2b8e-d649-0635309edb92@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 1/2] introduce GFN notification for
 translated domains
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTQvMTEvMjAxOSAxNjo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gb3Jk
ZXIgZm9yIGluZGl2aWR1YWwgSU9NTVUgZHJpdmVycyAoYW5kIGZyb20gYW4gYWJzdHJhY3QgcG92
IGFsc28KPiBhcmNoaXRlY3R1cmVzKSB0byBiZSBhYmxlIHRvIGFkanVzdCwgYWhlYWQgb2YgYWN0
dWFsIG1hcHBpbmcgcmVxdWVzdHMsCj4gdGhlaXIgZGF0YSBzdHJ1Y3R1cmVzIHdoZW4gdGhleSBt
aWdodCBjb3ZlciBvbmx5IGEgc3ViLXJhbmdlIG9mIGFsbAo+IHBvc3NpYmxlIEdGTnMsIGludHJv
ZHVjZSBhIG5vdGlmaWNhdGlvbiBjYWxsIHVzZWQgYnkgdmFyaW91cyBjb2RlIHBhdGhzCj4gcG90
ZW50aWFsbHkgaW5zdGFsbGluZyBhIGZyZXNoIG1hcHBpbmcgb2YgYSBuZXZlciB1c2VkIEdGTiAo
Zm9yIGEKPiBwYXJ0aWN1bGFyIGRvbWFpbikuCgpJZiBJIHVuZGVyc3RhbmQgdGhpcyBjb3JyZWN0
bHksIHRoaXMgaXMgbW9zdGx5IHRhcmdldGluZyBJT01NTlUgZHJpdmVyIAp3aGVyZSBwYWdlLXRh
YmxlIGFyZSBub3Qgc2hhcmVkIHdpdGggdGhlIHByb2Nlc3Nvci4gUmlnaHQ/Cgo+IAo+IE5vdGUg
dGhhdCBiZWZvcmUgdGhpcyBwYXRjaCwgaW4gZ250dGFiX3RyYW5zZmVyKCksIG9uY2UgcGFzdAo+
IGFzc2lnbl9wYWdlcygpLCBmdXJ0aGVyIGVycm9ycyBtb2RpZnlpbmcgdGhlIHBoeXNtYXAgYXJl
IGlnbm9yZWQKPiAocHJlc3VtYWJseSBiZWNhdXNlIGl0IHdvdWxkIGJlIHRvbyBjb21wbGljYXRl
ZCB0byB0cnkgdG8gcm9sbCBiYWNrIGF0Cj4gdGhhdCBwb2ludCkuIFRoaXMgcGF0Y2ggZm9sbG93
cyBzdWl0IGJ5IGlnbm9yaW5nIGZhaWxlZCBub3RpZnlfZ2ZuKClzIG9yCj4gcmFjZXMgZHVlIHRv
IHRoZSBuZWVkIHRvIGludGVybWVkaWF0ZWx5IGRyb3AgbG9ja3MsIHNpbXBseSBwcmludGluZyBv
dXQKPiBhIHdhcm5pbmcgdGhhdCB0aGUgZ2ZuIG1heSBub3QgYmUgYWNjZXNzaWJsZSBkdWUgdG8g
dGhlIGZhaWx1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+IC0tLQo+IHYyOiBJbnRyb2R1Y2UgYXJjaF9ub3RpZnlfZ2ZuKCksIHRvIGludm9r
ZSBnZm5fdmFsaWQoKSBvbiB4ODYgKHRoaXMKPiAgICAgIHVuZm9ydHVuYXRlbHkgbWVhbnMgaXQg
YW5kIG5vdGlmeV9nZm4oKSBub3cgbmVlZCB0byBiZSBtYWNyb3MsIG9yCj4gICAgICBlbHNlIGlu
Y2x1ZGUgZmlsZSBkZXBlbmRlbmNpZXMgZ2V0IGluIHRoZSB3YXksIGFzIGdmbl92YWxpZCgpIGxp
dmVzCj4gICAgICBpbiBwYWdpbmcuaCwgd2hpY2ggd2Ugc2hvdWxkbid0IGluY2x1ZGUgZnJvbSB4
ZW4vc2NoZWQuaCkuIEltcHJvdmUKPiAgICAgIGRlc2NyaXB0aW9uLgo+IAo+IFRCRDogRG9lcyBB
cm0gYWN0dWFsbHkgaGF2ZSBhbnl0aGluZyB0byBjaGVjayBhZ2FpbnN0IGluIGl0cwo+ICAgICAg
IGFyY2hfbm90aWZ5X2dmbigpPwoKSSB1bmRlcnN0YW5kIHRoYXQgd2Ugd2FudCB0byBrZWVwIHRo
ZSBjb2RlIG1vc3RseSBnZW5lcmljLCBidXQgSSBhbSBhIApiaXQgY29uY2VybmVkIG9mIHRoZSBl
eHRyYSBjb3N0IHRvIHVzZSBub3RpZnlfZ2ZuKCkgKGFuZCBpbmRpcmVjdGx5IAppb21tdV9ub3Rp
ZnlfZ2ZuKCkpIGZvciBkb2luZyBub3RoaW5nLgoKSSBjYW4ndCBzZWUgYW55IGRpcmVjdCB1c2Ug
b2YgdGhpcyBmb3IgdGhlIGZvcmVzZWFibGUgZnV0dXJlIG9uIEFybS4gU28gCmNvdWxkIHdlIGdh
dGUgdGhpcyB1bmRlciBhIGNvbmZpZyBvcHRpb24/Cgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vZG9tMF9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiBA
QCAtMTczLDcgKzE3Myw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHB2aF9wb3B1bGF0ZV9tZW1vcnlf
cmEKPiAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICB9Cj4gICAKPiAtICAgICAg
ICByYyA9IGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoZCwgX2dmbihzdGFydCksIHBhZ2VfdG9fbWZu
KHBhZ2UpLAo+ICsgICAgICAgIHJjID0gbm90aWZ5X2dmbihkLCBfZ2ZuKHN0YXJ0ICsgKDFVTCA8
PCBvcmRlcikgLSAxKSkgPzoKPiArICAgICAgICAgICAgIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2Uo
ZCwgX2dmbihzdGFydCksIHBhZ2VfdG9fbWZuKHBhZ2UpLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgb3JkZXIpOwo+ICAgICAgICAgICBpZiAoIHJjICE9IDAgKQo+ICAg
ICAgICAgICB7Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKPiBAQCAtNDMwNCw5ICs0MzA0LDE3IEBAIHN0YXRpYyBpbnQgaHZtb3Bf
c2V0X3BhcmFtKAo+ICAgICAgICAgICBpZiAoIGEudmFsdWUgPiBTSFVURE9XTl9NQVggKQo+ICAg
ICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwo+ICAgICAgICAgICBicmVhazsKPiArCj4gICAgICAg
Y2FzZSBIVk1fUEFSQU1fSU9SRVFfU0VSVkVSX1BGTjoKPiAtICAgICAgICBkLT5hcmNoLmh2bS5p
b3JlcV9nZm4uYmFzZSA9IGEudmFsdWU7Cj4gKyAgICAgICAgaWYgKCBkLT5hcmNoLmh2bS5wYXJh
bXNbSFZNX1BBUkFNX05SX0lPUkVRX1NFUlZFUl9QQUdFU10gKQo+ICsgICAgICAgICAgICByYyA9
IG5vdGlmeV9nZm4oCj4gKyAgICAgICAgICAgICAgICAgICAgIGQsCj4gKyAgICAgICAgICAgICAg
ICAgICAgIF9nZm4oYS52YWx1ZSArIGQtPmFyY2guaHZtLnBhcmFtcwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBbSFZNX1BBUkFNX05SX0lPUkVRX1NFUlZFUl9QQUdFU10g
LSAxKSk7Cj4gKyAgICAgICAgaWYgKCAhcmMgKQo+ICsgICAgICAgICAgICAgZC0+YXJjaC5odm0u
aW9yZXFfZ2ZuLmJhc2UgPSBhLnZhbHVlOwo+ICAgICAgICAgICBicmVhazsKPiArCj4gICAgICAg
Y2FzZSBIVk1fUEFSQU1fTlJfSU9SRVFfU0VSVkVSX1BBR0VTOgo+ICAgICAgIHsKPiAgICAgICAg
ICAgdW5zaWduZWQgaW50IGk7Cj4gQEAgLTQzMTcsNiArNDMyNSw5IEBAIHN0YXRpYyBpbnQgaHZt
b3Bfc2V0X3BhcmFtKAo+ICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwo+ICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICAgIH0KPiArICAgICAgICByYyA9IG5vdGlmeV9nZm4oZCwgX2dm
bihkLT5hcmNoLmh2bS5pb3JlcV9nZm4uYmFzZSArIGEudmFsdWUgLSAxKSk7Cj4gKyAgICAgICAg
aWYgKCByYyApCj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICBmb3IgKCBpID0gMDsg
aSA8IGEudmFsdWU7IGkrKyApCj4gICAgICAgICAgICAgICBzZXRfYml0KGksICZkLT5hcmNoLmh2
bS5pb3JlcV9nZm4ubWFzayk7Cj4gICAKPiBAQCAtNDMzMCw3ICs0MzQxLDExIEBAIHN0YXRpYyBp
bnQgaHZtb3Bfc2V0X3BhcmFtKAo+ICAgICAgICAgICBCVUlMRF9CVUdfT04oSFZNX1BBUkFNX0JV
RklPUkVRX1BGTiA+Cj4gICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoZC0+YXJjaC5odm0u
aW9yZXFfZ2ZuLmxlZ2FjeV9tYXNrKSAqIDgpOwo+ICAgICAgICAgICBpZiAoIGEudmFsdWUgKQo+
IC0gICAgICAgICAgICBzZXRfYml0KGEuaW5kZXgsICZkLT5hcmNoLmh2bS5pb3JlcV9nZm4ubGVn
YWN5X21hc2spOwo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgcmMgPSBub3RpZnlfZ2ZuKGQs
IF9nZm4oYS52YWx1ZSkpOwo+ICsgICAgICAgICAgICBpZiAoICFyYyApCj4gKyAgICAgICAgICAg
ICAgICBzZXRfYml0KGEuaW5kZXgsICZkLT5hcmNoLmh2bS5pb3JlcV9nZm4ubGVnYWN5X21hc2sp
Owo+ICsgICAgICAgIH0KPiAgICAgICAgICAgYnJlYWs7Cj4gICAKPiAgICAgICBjYXNlIEhWTV9Q
QVJBTV9YODdfRklQX1dJRFRIOgo+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+ICsr
KyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+IEBAIC05NDYsNiArOTQ2LDE2IEBAIG1hcF9n
cmFudF9yZWYoCj4gICAgICAgICAgIHJldHVybjsKPiAgICAgICB9Cj4gICAKPiArICAgIGlmICgg
cGFnaW5nX21vZGVfdHJhbnNsYXRlKGxkKSAvKiAmJiAob3AtPmZsYWdzICYgR05UTUFQX2hvc3Rf
bWFwKSAqLyAmJgoKSSB0aGluayB0aGlzIHdhbnRzIGFuIGV4cGxhbmF0aW9uIGluIHRoZSBjb2Rl
IHdoeSB0aGUgY2hlY2sgaXMgY29tbWVudGVkLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
