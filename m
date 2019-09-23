Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF84BB705
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 16:43:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCPWU-0008IS-2v; Mon, 23 Sep 2019 14:41:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCPWT-0008IM-7u
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 14:41:05 +0000
X-Inumbo-ID: 2afa540c-de10-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2afa540c-de10-11e9-b76c-bc764e2007e4;
 Mon, 23 Sep 2019 14:41:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AEC86AE1B;
 Mon, 23 Sep 2019 14:41:02 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <14624609-019f-2993-261c-d4f45ce78cbe@suse.com>
 <20190923142253.dqvbg2tsfke3mmtc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db9b21f5-108b-eee4-692b-199d25c02b10@suse.com>
Date: Mon, 23 Sep 2019 16:41:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923142253.dqvbg2tsfke3mmtc@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 3/8] x86/PCI: read maximum MSI vector
 count early
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxNjoyMiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBT
ZXAgMTksIDIwMTkgYXQgMDM6MjI6NTRQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFJh
dGhlciB0aGFuIGRvaW5nIHRoaXMgZXZlcnkgdGltZSB3ZSBzZXQgdXAgaW50ZXJydXB0cyBmb3Ig
YSBkZXZpY2UKPj4gYW5ldyAoYW5kIHRoZW4gaW4gc2V2ZXJhbCBwbGFjZXMpIGZpbGwgdGhpcyBp
bnZhcmlhbnQgZmllbGQgcmlnaHQgYWZ0ZXIKPj4gYWxsb2NhdGluZyBzdHJ1Y3QgcGNpX2Rldi4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+
IExHVE06Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKVGhhbmtzLgoKPiBKdXN0IG9uZSBuaXQgYmVsb3cuCj4gCj4+IEBAIC03MTEsNyAr
NzEwLDcgQEAgc3RhdGljIGludCBtc2lfY2FwYWJpbGl0eV9pbml0KHN0cnVjdCBwYwo+PiAgCj4+
ICAgICAgICAgIC8qIEFsbCBNU0lzIGFyZSB1bm1hc2tlZCBieSBkZWZhdWx0LCBNYXNrIHRoZW0g
YWxsICovCj4+ICAgICAgICAgIG1hc2tiaXRzID0gcGNpX2NvbmZfcmVhZDMyKGRldi0+c2JkZiwg
bXBvcyk7Cj4+IC0gICAgICAgIG1hc2tiaXRzIHw9IH4odTMyKTAgPj4gKDMyIC0gbWF4dmVjKTsK
Pj4gKyAgICAgICAgbWFza2JpdHMgfD0gfih1MzIpMCA+PiAoMzIgLSBkZXYtPm1zaV9tYXh2ZWMp
Owo+IAo+IEdFTk1BU0sgd291bGQgYmUgc2xpZ2h0bHkgZWFzaWVyIHRvIHBhcnNlIElNTyAoaGVy
ZSBhbmQgYmVsb3cpLgoKQmVzaWRlcyB0aGlzIGJlaW5nIGFuIHVucmVsYXRlZCBjaGFuZ2UsIEkn
bSBhZnJhaWQgSSdtIGdvaW5nIHRvCm9iamVjdCB0byB1c2Ugb2YgYSBtYWNybyB3aGVyZSBpdCdz
IHVuY2xlYXIgd2hhdCBpdHMgcGFyYW1ldGVycwptZWFuOiBFdmVuIHRoZSBleGFtcGxlIGluIHhl
bi9iaXRvcHMuaCBpcyBzbyBjb25mdXNpbmcgdGhhdCBJCmNhbid0IHRlbGwgd2hldGhlciAiaCIg
aXMgbWVhbnQgdG8gYmUgZXhjbHVzaXZlIG9yIGluY2x1c2l2ZQoobG9va3MgbGlrZSB0aGUgbGF0
dGVyIGlzIGludGVuZGVkKS4gVG8gbWUgdGhlIHR3byBwYXJhbWV0ZXJzCmFsc28gbG9vayByZXZl
cnNlZCAtIEknZCBleHBlY3QgImxvdyIgZmlyc3QgYW5kICJoaWdoIiBzZWNvbmQuCihJU1RSIGhh
dmluZyB2b2ljZWQgcmVzZXJ2YXRpb25zIGFnYWluc3QgaXRzIGludHJvZHVjdGlvbiwgYW5kCkkn
bSBoYXBweSB0byBzZWUgdGhhdCBpdCdzIHVzZWQgaW4gQXJtIGNvZGUgb25seS4pCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
