Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D581504E8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:07:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZY1-0000SS-98; Mon, 03 Feb 2020 11:05:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyZXz-0000SN-TI
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:05:43 +0000
X-Inumbo-ID: 1e7c104e-4675-11ea-a933-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e7c104e-4675-11ea-a933-bc764e2007e4;
 Mon, 03 Feb 2020 11:05:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E475AB1B2;
 Mon,  3 Feb 2020 11:05:41 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200131175659.5nabkw7joiaepku2@debian>
 <397903e741134867a20bbbb92322e5e8@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b057f62-d238-267d-3e99-6c43c416e629@suse.com>
Date: Mon, 3 Feb 2020 12:05:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <397903e741134867a20bbbb92322e5e8@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxMTozOSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4gU2VudDogMzEg
SmFudWFyeSAyMDIwIDE3OjU3Cj4+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnPgo+PiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvLnVrPjsgTWljaGFlbCBLZWxsZXkKPj4gPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBX
ZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdQo+PiA8d2xAeGVuLm9yZz47IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIKPj4gPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0geDg2L2h5cGVydjogc2V0dXAgaHlw
ZXJjYWxsIHBhZ2UKPj4KPj4gKE5vdGUgdG8gc2VsZikKPj4KPj4gT24gRnJpLCBKYW4gMzEsIDIw
MjAgYXQgMDU6NDk6MjRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPj4gWy4uLl0KPj4+ICtzdGF0
aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkKPj4+ICt7Cj4+PiArICAgIHVuaW9u
IGh2X2d1ZXN0X29zX2lkIGlkOwo+Pj4gKwo+Pgo+PiAgICAgICAgaWQucmF3ID0gMDsKPiAKPiBP
ciBqdXN0IHVzZSBhIEM5OSBpbml0aWFsaXplciB0byBzZXQgdGhpbmdzIHVwLiBBIGJpdCBuZWF0
ZXIgSU1PLgoKSWYgeW91IG1lYW4gdGhpcyBmb3IgLi4uCgo+Pj4gKyAgICBpZC52ZW5kb3IgPSBI
Vl9YRU5fVkVORE9SX0lEOwo+Pj4gKyAgICBpZC5tYWpvciA9IHhlbl9tYWpvcl92ZXJzaW9uKCk7
Cj4+PiArICAgIGlkLm1pbm9yID0geGVuX21pbm9yX3ZlcnNpb24oKTsKCi4uLiB0aGVzZSB0aHJl
ZSBmaWVsZHMsIHRoZW4gdGhpcyB3b24ndCB3b3JrIHdpdGggcmF0aGVyIG9sZCBnY2MKd2Ugc3Rp
bGwgcGVybWl0IHRvIGJlIHVzZWQuIFVzaW5nIHsgLnJhdyA9IDAgfSB3b3VsZCB3b3JrIGFmYWlj
dC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
