Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE2AD447
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 09:56:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7EU9-0007BL-Fr; Mon, 09 Sep 2019 07:53:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7EU7-0007BE-SP
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 07:53:15 +0000
X-Inumbo-ID: e066a632-d2d6-11e9-ac09-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e066a632-d2d6-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 07:53:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 669A0B049;
 Mon,  9 Sep 2019 07:53:13 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190909073557.16168-1-jgross@suse.com>
 <20190909073557.16168-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eca805d7-34e3-ad25-d444-3c2746a4cf12@suse.com>
Date: Mon, 9 Sep 2019 09:53:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909073557.16168-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 1/5] xen: fix debugtrace clearing
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAwOTozNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vZHJp
dmVycy9jaGFyL2NvbnNvbGUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4g
QEAgLTExNzMsNiArMTE3Myw3IEBAIHN0YXRpYyBjaGFyICAgICAgICAqZGVidWd0cmFjZV9idWY7
IC8qIERlYnVnLXRyYWNlIGJ1ZmZlciAqLwo+ICBzdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJh
Y2VfcHJkOyAvKiBQcm9kdWNlciBpbmRleCAgICAgKi8KPiAgc3RhdGljIHVuc2lnbmVkIGludCBk
ZWJ1Z3RyYWNlX2tpbG9ieXRlcyA9IDEyOCwgZGVidWd0cmFjZV9ieXRlczsKPiAgc3RhdGljIHVu
c2lnbmVkIGludCBkZWJ1Z3RyYWNlX3VzZWQ7Cj4gK3N0YXRpYyBib29sIGRlYnVndHJhY2VfYnVm
X2VtcHR5OwoKV291bGRuJ3QgaXQgYmUgbW9yZSBsb2dpY2FsIGZvciB0aGlzIHRvIHN0YXJ0IG91
dCBhcyAidHJ1ZSI/CkFuZCBJJ20gZGViYXRpbmcgd2l0aCBteXNlbGYgd2hldGhlciBpdCBtaWdo
dCB3YW50IHRvIGJlCl9fcmVhZF9tb3N0bHkuIEJvdGggY291bGQgYmUgYWRqdXN0ZWQgKGlmIGFn
cmVlbWVudCBjYW4gYmUKcmVhY2hlZCkgd2hpbGUgY29tbWl0dGluZy4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
