Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6594D1C04
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287121.486954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbye-0005Wi-TW; Tue, 08 Mar 2022 15:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287121.486954; Tue, 08 Mar 2022 15:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbye-0005TS-Pa; Tue, 08 Mar 2022 15:42:20 +0000
Received: by outflank-mailman (input) for mailman id 287121;
 Tue, 08 Mar 2022 15:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMfM=TT=amazon.de=prvs=0590b4220=doebel@srs-se1.protection.inumbo.net>)
 id 1nRbyc-0005TF-FS
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:42:19 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53eb03ee-9ef6-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 16:42:16 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 08 Mar 2022 15:42:04 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com (Postfix) with
 ESMTPS id 2A4B2A278E; Tue,  8 Mar 2022 15:42:03 +0000 (UTC)
Received: from [192.168.10.142] (10.43.164.135) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Tue, 8 Mar 2022 15:41:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 53eb03ee-9ef6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646754136; x=1678290136;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=nznqvmyXKXWlS7v/k/49rRVcTeAnSNTd+dFv3pmeqOw=;
  b=qe/4bpI8DLpdpsT2kNc2KzccXFvrpAIk2B8OtVLiS7Jq873S8qDU9QN8
   JT9R1Qh+gD78wTi3RqPh3T1QsNHG4g3lPupIaStGi8vlqEGlfUqE7QuwY
   Qny9QF5/Cy0eoFOb0kbRIZwo/L0ALaJljlLsfKkLpVhlbFq6varaH6oLe
   k=;
X-IronPort-AV: E=Sophos;i="5.90,165,1643673600"; 
   d="scan'208";a="182691847"
Subject: Re: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Message-ID: <e380b32a-2267-0514-53ef-00657c0ce46e@amazon.de>
Date: Tue, 8 Mar 2022 16:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <453c6e5decb315109a4fbf0065cc364129dca195.1646735357.git.doebel@amazon.de>
 <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
 <PH0PR03MB63822464CF42ECDC06A3510BF0099@PH0PR03MB6382.namprd03.prod.outlook.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <PH0PR03MB63822464CF42ECDC06A3510BF0099@PH0PR03MB6382.namprd03.prod.outlook.com>
X-Originating-IP: [10.43.164.135]
X-ClientProxiedBy: EX13D09EUC004.ant.amazon.com (10.43.164.115) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAwOC4wMy4yMiAxNjoyNSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gQ0FVVElPTjogVGhp
cyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJt
IHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPiAKPiAKPiAKPj4gRnJv
bTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4KPj4gU2VudDogVHVlc2RheSwgTWFy
Y2ggOCwgMjAyMiAxMDoyOSBBTQo+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4+IENjOiBNaWNoYWVsIEt1cnRoIDxt
a3VAYW1hem9uLmRlPjsgTWFydGluIFBvaGxhY2sgPG1wb2hsYWNrQGFtYXpvbi5kZT47IFJvZ2Vy
IFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPjsgQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT47IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFJvc3MgTGFnZXJ3
YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMi8y
XSB4ZW4veDg2OiBMaXZlcGF0Y2g6IHN1cHBvcnQgcGF0Y2hpbmcgQ0VULWVuaGFuY2VkIGZ1bmN0
aW9ucwo+Pgo+PiBYZW4gZW5hYmxlZCBDRVQgZm9yIHN1cHBvcnRpbmcgYXJjaGl0ZWN0dXJlcy4g
VGhlIGNvbnRyb2wgZmxvdyBhc3BlY3Qgb2YKPj4gQ0VUIGV4cGVjdHMgZnVuY3Rpb25zIHRoYXQg
Y2FuIGJlIGNhbGxlZCBpbmRpcmVjdGx5IChpLmUuLCB2aWEgZnVuY3Rpb24KPj4gcG9pbnRlcnMp
IHRvIHN0YXJ0IHdpdGggYW4gRU5EQlI2NCBpbnN0cnVjdGlvbi4gT3RoZXJ3aXNlIGEgY29udHJv
bCBmbG93Cj4+IGV4Y2VwdGlvbiBpcyByYWlzZWQuCj4+Cj4+IFRoaXMgZXhwZWN0YXRpb24gYnJl
YWtzIGxpdmVwYXRjaGluZyBmbG93cyBiZWNhdXNlIHdlIHBhdGNoIGZ1bmN0aW9ucyBieQo+PiBv
dmVyd3JpdGluZyB0aGVpciBmaXJzdCA1IGJ5dGVzIHdpdGggYSBKTVAgKyA8b2Zmc2V0PiwgdGh1
cyBicmVha2luZyB0aGUKPj4gRU5EQlI2NC4gV2UgZml4IHRoaXMgYnkgY2hlY2tpbmcgdGhlIHN0
YXJ0IG9mIGEgcGF0Y2hlZCBmdW5jdGlvbiBmb3IKPj4gYmVpbmcgRU5EQlI2NC4gSW4gdGhlIHBv
c2l0aXZlIGNhc2Ugd2UgbW92ZSB0aGUgbGl2ZXBhdGNoIEpNUCB0byBzdGFydAo+PiBiZWhpbmQg
dGhlIEVOREJSNjQgaW5zdHJ1Y3Rpb24uCj4+Cj4+IFRvIGF2b2lkIGhhdmluZyB0byBndWVzcyB0
aGUgRU5EQlI2NCBvZmZzZXQgYWdhaW4gb24gcGF0Y2ggcmV2ZXJzYWwKPj4gKHdoaWNoIG1pZ2h0
IHJhY2Ugd2l0aCBvdGhlciBtZWNoYW5pc21zIGFkZGluZy9yZW1vdmluZyBFTkRCUgo+PiBkeW5h
bWljYWxseSksIHVzZSB0aGUgbGl2ZXBhdGNoIG1ldGFkYXRhIHRvIHN0b3JlIHRoZSBjb21wdXRl
ZCBvZmZzZXQKPj4gYWxvbmcgd2l0aCB0aGUgc2F2ZWQgYnl0ZXMgb2YgdGhlIG92ZXJ3cml0dGVu
IGZ1bmN0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1h
em9uLmRlPgo+PiBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPgo+PiBDQzogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4+
IC0tLS0KPj4gTm90ZSB0aGF0IG9uIHRvcCBvZiBsaXZlcGF0Y2hpbmcgZnVuY3Rpb25zLCBYZW4g
c3VwcG9ydHMgYW4gYWRkaXRpb25hbAo+PiBtb2RlIHdoZXJlIHdlIGNhbiAicmVtb3ZlIiBhIGZ1
bmN0aW9uIGJ5IG92ZXJ3cml0aW5nIGl0IHdpdGggTk9Qcy4gVGhpcwo+PiBpcyBvbmx5IHN1cHBv
cnRlZCBmb3IgZnVuY3Rpb25zIHVwIHRvIDMxIGJ5dGVzIGluIHNpemUgYW5kIHRoaXMgcGF0Y2gK
Pj4gcmVkdWNlcyB0aGlzIGxpbWl0IHRvIDMwIGJ5dGVzLgo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHIx
Ogo+PiAqIHVzZSBzaXplb2ZfZmllbGQoKSB0byBhdm9pZCB1bnVzZWQgdmFyaWFibGUgd2Fybmlu
Zwo+PiAqIG1ha2UgbWV0YWRhdGEgdmFyaWFibGUgY29uc3QgaW4gYXJjaF9saXZlcGF0Y2hfcmV2
ZXJ0Cj4+IC0tLQo+PiAgIHhlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYyB8IDYxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNTMgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9saXZlcGF0Y2guYyBiL3hlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYwo+PiBpbmRleCA2NTUzMGMx
ZTU3Li4wZmQ5N2YyYTAwIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMK
Pj4gKysrIGIveGVuL2FyY2gveDg2L2xpdmVwYXRjaC5jCj4+IEBAIC0xNCwxMSArMTQsMjkgQEAK
Pj4gICAjaW5jbHVkZSA8eGVuL3ZtX2V2ZW50Lmg+Cj4+ICAgI2luY2x1ZGUgPHhlbi92aXJ0dWFs
X3JlZ2lvbi5oPgo+Pgo+PiArI2luY2x1ZGUgPGFzbS9lbmRici5oPgo+PiAgICNpbmNsdWRlIDxh
c20vZml4bWFwLmg+Cj4+ICAgI2luY2x1ZGUgPGFzbS9ubWkuaD4KPj4gICAjaW5jbHVkZSA8YXNt
L2xpdmVwYXRjaC5oPgo+PiAgICNpbmNsdWRlIDxhc20vc2V0dXAuaD4KPj4KPj4gKy8qCj4+ICsg
KiBDRVQgaG90cGF0Y2hpbmcgc3VwcG9ydDogV2UgbWF5IGhhdmUgZnVuY3Rpb25zIHN0YXJ0aW5n
IHdpdGggYW4gRU5EQlI2NAo+PiArICogaW5zdHJ1Y3Rpb24gdGhhdCBNVVNUIHJlbWFpbiB0aGUg
Zmlyc3QgaW5zdHJ1Y3Rpb24gb2YgdGhlIGZ1bmN0aW9uLCBoZW5jZQo+PiArICogd2UgbmVlZCB0
byBtb3ZlIGFueSBob3RwYXRjaCB0cmFtcG9saW5lIGZ1cnRoZXIgaW50byB0aGUgZnVuY3Rpb24u
IEZvciB0aGF0Cj4+ICsgKiB3ZSBuZWVkIHRvIGtlZXAgdHJhY2sgb2YgdGhlIHBhdGNoaW5nIG9m
ZnNldCB1c2VkIGZvciBhbnkgbG9hZGVkIGhvdHBhdGNoCj4+ICsgKiAodG8gYXZvaWQgcmFjaW5n
IGFnYWluc3Qgb3RoZXIgZml4dXBzIGFkZGluZy9yZW1vdmluZyBFTkRCUjY0IG9yIHNpbWlsYXIK
Pj4gKyAqIGluc3RydWN0aW9ucykuCj4+ICsgKgo+PiArICogV2UgZG8gc28gYnkgbWFraW5nIHVz
ZSBvZiB0aGUgZXhpc3Rpbmcgb3BhcXVlIG1ldGFkYXRhIGFyZWEuIFdlIHVzZSBpdHMKPj4gKyAq
IGZpcnN0IDQgYnl0ZXMgdG8gdHJhY2sgdGhlIG9mZnNldCBpbnRvIHRoZSBmdW5jdGlvbiB1c2Vk
IGZvciBwYXRjaGluZyBhbmQKPj4gKyAqIHRoZSByZW1haW5kZXIgb2YgdGhlIGRhdGEgdG8gc3Rv
cmUgb3ZlcndyaXR0ZW4gY29kZSBieXRlcy4KPj4gKyAqLwo+PiArc3RydWN0IHg4Nl9saXZlcGF0
Y2hfbWV0YSB7Cj4+ICsgICAgdWludDhfdCBwYXRjaF9vZmZzZXQ7Cj4+ICsgICAgdWludDhfdCBp
bnN0cnVjdGlvbltMSVZFUEFUQ0hfT1BBUVVFX1NJWkUgLSBzaXplb2YodWludDhfdCldOwo+PiAr
fTsKPj4gKwo+IAo+IEkgdGhpbmsgaXQgd291bGQgbWFrZSB0aGluZ3MgYSBiaXQgc2ltcGxlciB0
byB1c2Ugb25lIG9mIHRoZSBzcGFyZSBfcGFkIGJpdHMKPiBmcm9tIHN0cnVjdCBsaXZlcGF0Y2hf
ZnVuYyAgYXRoZXIgdGhhbiBoYWNraW5nIGl0IGludG8gdGhlIG9wYXF1ZSBhcmVhLiBJcwo+IHRo
ZXJlIGEgcmVhc29uIHlvdSBjaG9zZSB0aGlzIGFwcHJvYWNoPwoKTm8gc3BlY2lmaWMgcmVhc29u
LiBBcmUgeW91IHN1Z2dlc3RpbmcgdXBkYXRpbmcgdGhlIHB1YmxpYyBsaXZlcGF0Y2ggCmludGVy
ZmFjZSB0byBhZGQgYSBuZXcgbWVtYmVyIGFuZCByZWR1Y2UgdGhlIHBhZGRpbmcgc2l6ZSBieSAx
IGJ5dGU/IEkgCmd1ZXNzIHRoYXQgd2lsbCBhbHNvIHJlcXVpcmUgYSBwYXRjaCB0byBsaXZlcGF0
Y2gtYnVpbGQtdG9vbHM/CgpCam9lcm4KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJt
YW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzog
Q2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CgoK


