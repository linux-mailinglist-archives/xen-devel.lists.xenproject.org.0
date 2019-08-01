Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48FF7D7FF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 10:47:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht6iK-000282-AI; Thu, 01 Aug 2019 08:45:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9KpE=V5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ht6iJ-00027w-LJ
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 08:45:31 +0000
X-Inumbo-ID: b740ca3b-b438-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b740ca3b-b438-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 08:45:30 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wqd2BkN0Ea0okjOX02cvUky4K5vE7iU9XS9z3mTqSv/fLc2F+Sw7oNX1EpAc4odmvxsbw/o3Ro
 oODnTPcDR2MvZStDfoE4WbdhotHSDwlNst7LfM6nQnCOkgWBjfmrgQ+9kfj1swylYgWHcPGiu9
 HRdYTR2hT8FG3RpHuA434V7BwjCTiM1DMW8lnAV5dXFCMlJhzN6j+QqimlnL0Z5VaC5K0ZRASE
 o9VxujLcZcTN0HzwUG7q79WP3WeIAMxgD4ueh7KAWhXAMVJtQJGtZs93oYQyqEqw/EhGEvY/mS
 kls=
X-SBRS: 2.7
X-MesageID: 3829239
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,333,1559534400"; 
   d="scan'208";a="3829239"
Date: Thu, 1 Aug 2019 10:45:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190801084509.rdfoxya5lkjmoidq@Air-de-Roger>
References: <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
 <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <CAMmSBy85tZjSA7Yd2HG=F4dmK8uzxXPVY20UwAaNGYhJ1LjzKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy85tZjSA7Yd2HG=F4dmK8uzxXPVY20UwAaNGYhJ1LjzKA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTI6MzA6MDRQTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxOjM2IEFNIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEp1bCAzMCwg
MjAxOSBhdCAxMDo1NToyNEFNIC0wNzAwLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+ID4gPiBT
b3JyeSAtLSBnb3QgYSBiaXQgZGlzdHJhY3RlZCB5ZXN0ZXJkYXkuIEF0dGFjaGVkIGlzIHRoZSBs
b2cgd2l0aCBvbmx5Cj4gPiA+IHlvdXIgbGF0ZXN0IHBhdGNoIGF0dGFjaGVkLiBJbnRlcmVzdGlu
Z2x5IGVub3VnaCB0aGUgYm94IGJvb3RlZCBmaW5lCj4gPiA+IHdpdGhvdXQgc2NyZWVuIGFydGlm
YWN0cy4gU28gSSBndWVzcyB3ZSdyZSBnZXR0aW5nIGNsb3Nlci4uLgo+ID4gPgo+ID4gPiBUaGFu
a3MgZm9yIGFsbCB0aGUgaGVscCEKPiA+Cj4gPiBUaGF0J3MgcXVpdGUgd2VpcmQsIHRoZXJlJ3Mg
bm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGJldHdlZW4gdGhlCj4gPiBwcmV2aW91cyBwYXRjaGVzIGFu
ZCB0aGlzIG9uZSwgdGhlIG9ubHkgZGlmZmVyZW5jZSBpcyB0aGF0IHRoaXMgcGF0Y2gKPiA+IGhh
cyBtb3JlIHZlcmJvc2Ugb3V0cHV0Lgo+IAo+IFRoYXQncyBzdXBlciB3ZWlyZCBpbmRlZWQuIEkn
bSByZS10cnlpbmcgeW91ciB2ZXJ5IGZpcnN0IHBhdGNoIHJpZ2h0Cj4gbm93IHRvIHNlZSBpZiBp
dCBtYXkgYmUgYSBwaWxvdCBlcnJvciBvbiBteSBwYXJ0IChob3BlIG5vdCkuCj4gCj4gPiBBcmUg
eW91IHN1cmUgeW91IGRpZG4ndCBoYXZlIGFueSBsb2NhbCBwYXRjaGVzIG9uIHRvcCBvZiBYZW4g
dGhhdAo+ID4gY291bGQgZXhwbGFpbiB0aGlzIGRpZmZlcmVuY2UgaW4gYmVoYXZpb3VyPwo+IAo+
IFByZXR0eSBzdXJlIC0tIGJ1dCBsZXQgbWUgcHVzaCBteSBicmFuY2ggaW4gRVZFIGFuZCBzaG93
IHRvIHlvdSBhbGwKPiAoeW91IHdpbGwgbmVlZCBEb2NrZXIgaW5zdGFsbGVkIHRvIGJ1aWxkIFhl
biB0aGUgd2F5IEVWRSBkb2VzKS4KCkknbSBhZnJhaWQgaXQncyBxdWl0ZSBoYXJkIGZvciBtZSB0
byBmaWd1cmUgb3V0IHdoZXRoZXIgeW91IGhhdmUgYW55CnBhdGNoZXMgb24gdG9wIG9mIFhlbiBv
ciBub3QuCgpGb3IgZnVydGhlciB0ZXN0aW5nIGNhbiB5b3UgbWFrZSBzdXJlIHlvdSBkb24ndCBo
YXZlIGFueSBjdXN0b20KcGF0Y2hlcyBvbiB0b3Agb2YgWGVuIChpZiB5b3UgaW5kZWVkIGhhZCBh
bnkgaW4gdGhlIHByZXZpb3VzCmF0dGVtcHRzKT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
