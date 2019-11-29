Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C210D84C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 17:13:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iairR-0006pq-Bc; Fri, 29 Nov 2019 16:11:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iairQ-0006pj-DL
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 16:11:12 +0000
X-Inumbo-ID: dc2cae78-12c2-11ea-a3e7-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc2cae78-12c2-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575043872; x=1606579872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8JXX9izFfLNU+pcdwiIrjjKWli56yVLQ2WKLochbyh8=;
 b=YNZCfZfE7/QDANWuPS5bP4BVUqXETvZptKTOgdvza4/9wAP1XdA96rZu
 drPqJs+5S4SbG2v5wnPxCzbKMTpsDgOPjpFXNtrwZ0fw0es6qkEr1Hpph
 dELEd4oyIDCSkp2RuFsGZLTz9gb8uGGK1iszOUKod+ZuCqT5oLEJfu6zr o=;
IronPort-SDR: LCSeSBnXIsuhBuBjdJT62F0VTeXWabl0mntdRqJtdOb2z2I57dwyGmfAUpUijWyE6m+j9ENdPb
 USOlIJ+NXt2g==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; 
   d="scan'208";a="2196237"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Nov 2019 16:11:05 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 603DEA27A6; Fri, 29 Nov 2019 16:11:01 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 16:11:00 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 16:10:59 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 29 Nov 2019 16:10:59 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH-for-4.13 v5] Rationalize max_grant_frames and
 max_maptrack_frames handling
Thread-Index: AQHVpgw4W1UbyWJxu02lwfLbqnwkDKeiGWCAgAAzAoCAAAKKsIAAA0qAgAAAZyA=
Date: Fri, 29 Nov 2019 16:10:59 +0000
Message-ID: <9b0e395a65434393b253778e0faefb28@EX13D32EUC003.ant.amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <20191129124427.l7wyupz5mcn7nx57@debian>
 <24033.15733.686597.694978@mariner.uk.xensource.com>
 <428ff7e73f654f5c89cd0837f69002dd@EX13D32EUC003.ant.amazon.com>
 <24033.16985.749977.747490@mariner.uk.xensource.com>
In-Reply-To: <24033.16985.749977.747490@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTY6MDgKPiBUbzogRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz47IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgeGVuLQo+IGRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNp
dHJpeC5jb20+Owo+IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBK
YW4gQmV1bGljaAo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPjsgVm9s
b2R5bXlyCj4gQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBSb2dlciBQYXUg
TW9ubmUKPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUkU6IFtQQVRDSC1mb3It
NC4xMyB2NV0gUmF0aW9uYWxpemUgbWF4X2dyYW50X2ZyYW1lcyBhbmQKPiBtYXhfbWFwdHJhY2tf
ZnJhbWVzIGhhbmRsaW5nCj4gCj4gRHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENILWZv
ci00LjEzIHY1XSBSYXRpb25hbGl6ZQo+IG1heF9ncmFudF9mcmFtZXMgYW5kIG1heF9tYXB0cmFj
a19mcmFtZXMgaGFuZGxpbmciKToKPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
ID4gRnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Cj4gLi4uCj4gPiA+
IElzIHRoZXJlIHNvbWUgcmVhc29uIHdlIHdvdWxkbid0IHVzZSB+MCB0byBtZWFuIGRlZmF1bHQg
Pwo+ID4gPgo+ID4gPiBJbiB0aGUgdG9vbHMgYXJlYSB3ZSBub3JtYWxseSBzcGVsbCB0aGlzIGFz
Cj4gPiA+ICAgICAgfihzb21lIGFwcHJvcHJpYXRlIHR5cGUpMAo+ID4gPiB0byBtYWtlIHN1cmUg
aXQgaGFzIHRoZSByaWdodCB3aWR0aC4gIEJ1dCBpZiB3ZSBrbm93IHRoZSB0eXBlIGFuZCBpdAo+
ID4gPiBpcyBvZiBmaXhlZCBsZW5ndGgsIGFzIGhlcmUsIDB4ZmZmZmZmZmZ1IGlzIE9LIHRvby4K
PiA+ID4KPiA+ID4gPiBUaGUgdHlwZSBjaGFuZ2UgaGVyZSBtYWtlcyBtZSBmZWVsIGEgYml0IHVu
Y29tZm9ydGFibGUsIHRob3VnaCBpbgo+ID4gPiA+IHByYWN0aWNlIGl0IG1heSBub3QgbWF0dGVy
LiBJIGRvbid0IHNlZSBhbnlvbmUgd291bGQgc3BlY2lmeSBhIHZhbHVlCj4gPiA+ID4gdGhhdCB3
b3VsZCBiZWNvbWUgbmVnYXRpdmUgd2hlbiBjYXN0IGZyb20gdWludDMyIHRvIGludGVnZXIuCj4g
PiA+Cj4gPiA+IFRoZSBwcm9ibGVtIHdpdGggdGhlIHR5cGUgY2hhbmdlIGlzIHRoYXQgaW4gcHJp
bmNpcGxlIHdlIGhhdmUgdG8gYXVkaXQKPiA+ID4gYWxsIHRoZSBwbGFjZXMgdGhlIHZhcmlhYmxl
cyBhcmUgdXNlZC4KPiA+Cj4gPiBDYW4gYSB0b29sc3RhY2sgbWFpbnRhaW5lciBwbGVhc2UgY29t
ZSB1cCB3aXRoIGEgY29uY3JldGUgc3VnZ2VzdGlvbiBhcwo+IHRvIHdoYXQgdGhlIHBhdGNoIHNo
b3VsZCBkbyB0aGVuPyBJdCdzIG5vdyBhdCB2NiBhbmQgdGltZSBpcyBzaG9ydC4KPiAKPiBJIHRo
aW5rIG91ciBwcm9wb3NhbCBpcyB0byBkcm9wIHRoZSB0eXBlIGNoYW5nZSwgY29udGludWUgdG8g
dXNlCj4gdWludDMyX3QgZXZlcndoZXJlIGZvciB0aGVzZSB2YWx1ZXMsIGFuZCBzcGVjaWZ5IHRo
ZSAidXNlIGRlZmF1bHQiCj4gdmFsdWUgdG8gYmUgYWxsLWJpdHMtc2V0Lgo+IAoKV2hlcmU/IEV2
ZXJ5d2hlcmUgb3IganVzdCBpbiBidWlsZGluZm8/IFRoZSBzd2l0Y2ggZnJvbSB1aW50MzJfdCB0
byBpbnQzMl90IGluIHRoZSBkb21jdGwgZG9lcyBub3QsIG9mIGNvdXJzZSwgY2hhbmdlIHRoZSB3
aWR0aCBhdCBhbGwuCgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
