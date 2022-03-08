Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683674D1DD5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287239.487162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd6c-0007lV-Gb; Tue, 08 Mar 2022 16:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287239.487162; Tue, 08 Mar 2022 16:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd6c-0007hx-Bn; Tue, 08 Mar 2022 16:54:38 +0000
Received: by outflank-mailman (input) for mailman id 287239;
 Tue, 08 Mar 2022 16:54:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMfM=TT=amazon.de=prvs=0590b4220=doebel@srs-se1.protection.inumbo.net>)
 id 1nRd6Z-0007eg-Q0
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:54:36 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d1c327c-9f00-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 17:54:33 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-22c2b493.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 08 Mar 2022 16:54:18 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-22c2b493.us-west-2.amazon.com (Postfix) with
 ESMTPS id 22F8141C6A; Tue,  8 Mar 2022 16:54:17 +0000 (UTC)
Received: from [192.168.10.142] (10.43.164.135) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Tue, 8 Mar 2022 16:54:15 +0000
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
X-Inumbo-ID: 6d1c327c-9f00-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646758474; x=1678294474;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=sCms4UFIgp3AvYArXWOLb19sRjUgKO1qpX48hNXz3gs=;
  b=cBXypmsp6fVg2wOLir/gS01zZhArmsWYvB1jVjdGMq3zwbsibKByU6jG
   /MrEc0iOCxGmfyXdmJvYOzvEbViVWBPpG+7CHtLtsRPvdCare47Zf/fs2
   tbai+3Xxb3Dz5QPx7d+xxMxhrtSurDqOF/VxQra1N/wUe0vPArG4epRJD
   s=;
X-IronPort-AV: E=Sophos;i="5.90,165,1643673600"; 
   d="scan'208";a="200464889"
Subject: Re: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Message-ID: <5b60cbd1-6e15-e07f-d747-edded14e710a@amazon.de>
Date: Tue, 8 Mar 2022 17:54:14 +0100
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
 <e380b32a-2267-0514-53ef-00657c0ce46e@amazon.de>
 <PH0PR03MB63820AB55264C57717C81675F0099@PH0PR03MB6382.namprd03.prod.outlook.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <PH0PR03MB63820AB55264C57717C81675F0099@PH0PR03MB6382.namprd03.prod.outlook.com>
X-Originating-IP: [10.43.164.135]
X-ClientProxiedBy: EX13D33EUC001.ant.amazon.com (10.43.164.13) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAwOC4wMy4yMiAxNzowMSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gQ0FVVElPTjogVGhp
cyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJt
IHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPiAKPiAKPiAKPj4gRnJv
bTogRG9lYmVsLCBCam9lcm4gPGRvZWJlbEBhbWF6b24uZGU+Cj4+IFNlbnQ6IFR1ZXNkYXksIE1h
cmNoIDgsIDIwMjIgMzo0MSBQTQo+PiBUbzogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxs
QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcgPHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4gQ2M6IE1pY2hhZWwgS3VydGggPG1rdUBhbWF6b24uZGU+
OyBNYXJ0aW4gUG9obGFjayA8bXBvaGxhY2tAYW1hem9uLmRlPjsgUm9nZXIgUGF1IE1vbm5lIDxy
b2dlci5wYXVAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi8yXSB4ZW4veDg2OiBMaXZlcGF0Y2g6IHN1cHBvcnQg
cGF0Y2hpbmcgQ0VULWVuaGFuY2VkIGZ1bmN0aW9ucwo+Pgo+Pgo+PiBPbiAwOC4wMy4yMiAxNjoy
NSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4+PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0
ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQg
a25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+Pj4KPj4+Cj4+Pgo+Pj4+IEZyb206IEJqb2VybiBE
b2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4+Pj4gU2VudDogVHVlc2RheSwgTWFyY2ggOCwgMjAy
MiAxMDoyOSBBTQo+Pj4+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcgPHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4+PiBDYzogTWljaGFlbCBLdXJ0aCA8bWt1QGFt
YXpvbi5kZT47IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0BhbWF6b24uZGU+OyBSb2dlciBQYXUg
TW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT47IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+OyBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBSb3NzIExhZ2Vyd2FsbCA8
cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KPj4+PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMi8yXSB4
ZW4veDg2OiBMaXZlcGF0Y2g6IHN1cHBvcnQgcGF0Y2hpbmcgQ0VULWVuaGFuY2VkIGZ1bmN0aW9u
cwo+Pj4+Cj4+Pj4gWGVuIGVuYWJsZWQgQ0VUIGZvciBzdXBwb3J0aW5nIGFyY2hpdGVjdHVyZXMu
IFRoZSBjb250cm9sIGZsb3cgYXNwZWN0IG9mCj4+Pj4gQ0VUIGV4cGVjdHMgZnVuY3Rpb25zIHRo
YXQgY2FuIGJlIGNhbGxlZCBpbmRpcmVjdGx5IChpLmUuLCB2aWEgZnVuY3Rpb24KPj4+PiBwb2lu
dGVycykgdG8gc3RhcnQgd2l0aCBhbiBFTkRCUjY0IGluc3RydWN0aW9uLiBPdGhlcndpc2UgYSBj
b250cm9sIGZsb3cKPj4+PiBleGNlcHRpb24gaXMgcmFpc2VkLgo+Pj4+Cj4+Pj4gVGhpcyBleHBl
Y3RhdGlvbiBicmVha3MgbGl2ZXBhdGNoaW5nIGZsb3dzIGJlY2F1c2Ugd2UgcGF0Y2ggZnVuY3Rp
b25zIGJ5Cj4+Pj4gb3ZlcndyaXRpbmcgdGhlaXIgZmlyc3QgNSBieXRlcyB3aXRoIGEgSk1QICsg
PG9mZnNldD4sIHRodXMgYnJlYWtpbmcgdGhlCj4+Pj4gRU5EQlI2NC4gV2UgZml4IHRoaXMgYnkg
Y2hlY2tpbmcgdGhlIHN0YXJ0IG9mIGEgcGF0Y2hlZCBmdW5jdGlvbiBmb3IKPj4+PiBiZWluZyBF
TkRCUjY0LiBJbiB0aGUgcG9zaXRpdmUgY2FzZSB3ZSBtb3ZlIHRoZSBsaXZlcGF0Y2ggSk1QIHRv
IHN0YXJ0Cj4+Pj4gYmVoaW5kIHRoZSBFTkRCUjY0IGluc3RydWN0aW9uLgo+Pj4+Cj4+Pj4gVG8g
YXZvaWQgaGF2aW5nIHRvIGd1ZXNzIHRoZSBFTkRCUjY0IG9mZnNldCBhZ2FpbiBvbiBwYXRjaCBy
ZXZlcnNhbAo+Pj4+ICh3aGljaCBtaWdodCByYWNlIHdpdGggb3RoZXIgbWVjaGFuaXNtcyBhZGRp
bmcvcmVtb3ZpbmcgRU5EQlIKPj4+PiBkeW5hbWljYWxseSksIHVzZSB0aGUgbGl2ZXBhdGNoIG1l
dGFkYXRhIHRvIHN0b3JlIHRoZSBjb21wdXRlZCBvZmZzZXQKPj4+PiBhbG9uZyB3aXRoIHRoZSBz
YXZlZCBieXRlcyBvZiB0aGUgb3ZlcndyaXR0ZW4gZnVuY3Rpb24uCj4+Pj4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgo+Pj4+IENDOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4+Pj4gQ0M6IFJvc3MgTGFn
ZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+Pj4+IC0tLS0KPj4+PiBOb3RlIHRo
YXQgb24gdG9wIG9mIGxpdmVwYXRjaGluZyBmdW5jdGlvbnMsIFhlbiBzdXBwb3J0cyBhbiBhZGRp
dGlvbmFsCj4+Pj4gbW9kZSB3aGVyZSB3ZSBjYW4gInJlbW92ZSIgYSBmdW5jdGlvbiBieSBvdmVy
d3JpdGluZyBpdCB3aXRoIE5PUHMuIFRoaXMKPj4+PiBpcyBvbmx5IHN1cHBvcnRlZCBmb3IgZnVu
Y3Rpb25zIHVwIHRvIDMxIGJ5dGVzIGluIHNpemUgYW5kIHRoaXMgcGF0Y2gKPj4+PiByZWR1Y2Vz
IHRoaXMgbGltaXQgdG8gMzAgYnl0ZXMuCj4+Pj4KPj4+PiBDaGFuZ2VzIHNpbmNlIHIxOgo+Pj4+
ICogdXNlIHNpemVvZl9maWVsZCgpIHRvIGF2b2lkIHVudXNlZCB2YXJpYWJsZSB3YXJuaW5nCj4+
Pj4gKiBtYWtlIG1ldGFkYXRhIHZhcmlhYmxlIGNvbnN0IGluIGFyY2hfbGl2ZXBhdGNoX3JldmVy
dAo+Pj4+IC0tLQo+Pj4+ICAgIHhlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYyB8IDYxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwg
NTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMgYi94ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMKPj4+PiBp
bmRleCA2NTUzMGMxZTU3Li4wZmQ5N2YyYTAwIDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9saXZlcGF0Y2guYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYwo+Pj4+IEBA
IC0xNCwxMSArMTQsMjkgQEAKPj4+PiAgICAjaW5jbHVkZSA8eGVuL3ZtX2V2ZW50Lmg+Cj4+Pj4g
ICAgI2luY2x1ZGUgPHhlbi92aXJ0dWFsX3JlZ2lvbi5oPgo+Pj4+Cj4+Pj4gKyNpbmNsdWRlIDxh
c20vZW5kYnIuaD4KPj4+PiAgICAjaW5jbHVkZSA8YXNtL2ZpeG1hcC5oPgo+Pj4+ICAgICNpbmNs
dWRlIDxhc20vbm1pLmg+Cj4+Pj4gICAgI2luY2x1ZGUgPGFzbS9saXZlcGF0Y2guaD4KPj4+PiAg
ICAjaW5jbHVkZSA8YXNtL3NldHVwLmg+Cj4+Pj4KPj4+PiArLyoKPj4+PiArICogQ0VUIGhvdHBh
dGNoaW5nIHN1cHBvcnQ6IFdlIG1heSBoYXZlIGZ1bmN0aW9ucyBzdGFydGluZyB3aXRoIGFuIEVO
REJSNjQKPj4+PiArICogaW5zdHJ1Y3Rpb24gdGhhdCBNVVNUIHJlbWFpbiB0aGUgZmlyc3QgaW5z
dHJ1Y3Rpb24gb2YgdGhlIGZ1bmN0aW9uLCBoZW5jZQo+Pj4+ICsgKiB3ZSBuZWVkIHRvIG1vdmUg
YW55IGhvdHBhdGNoIHRyYW1wb2xpbmUgZnVydGhlciBpbnRvIHRoZSBmdW5jdGlvbi4gRm9yIHRo
YXQKPj4+PiArICogd2UgbmVlZCB0byBrZWVwIHRyYWNrIG9mIHRoZSBwYXRjaGluZyBvZmZzZXQg
dXNlZCBmb3IgYW55IGxvYWRlZCBob3RwYXRjaAo+Pj4+ICsgKiAodG8gYXZvaWQgcmFjaW5nIGFn
YWluc3Qgb3RoZXIgZml4dXBzIGFkZGluZy9yZW1vdmluZyBFTkRCUjY0IG9yIHNpbWlsYXIKPj4+
PiArICogaW5zdHJ1Y3Rpb25zKS4KPj4+PiArICoKPj4+PiArICogV2UgZG8gc28gYnkgbWFraW5n
IHVzZSBvZiB0aGUgZXhpc3Rpbmcgb3BhcXVlIG1ldGFkYXRhIGFyZWEuIFdlIHVzZSBpdHMKPj4+
PiArICogZmlyc3QgNCBieXRlcyB0byB0cmFjayB0aGUgb2Zmc2V0IGludG8gdGhlIGZ1bmN0aW9u
IHVzZWQgZm9yIHBhdGNoaW5nIGFuZAo+Pj4+ICsgKiB0aGUgcmVtYWluZGVyIG9mIHRoZSBkYXRh
IHRvIHN0b3JlIG92ZXJ3cml0dGVuIGNvZGUgYnl0ZXMuCj4+Pj4gKyAqLwo+Pj4+ICtzdHJ1Y3Qg
eDg2X2xpdmVwYXRjaF9tZXRhIHsKPj4+PiArICAgIHVpbnQ4X3QgcGF0Y2hfb2Zmc2V0Owo+Pj4+
ICsgICAgdWludDhfdCBpbnN0cnVjdGlvbltMSVZFUEFUQ0hfT1BBUVVFX1NJWkUgLSBzaXplb2Yo
dWludDhfdCldOwo+Pj4+ICt9Owo+Pj4+ICsKPj4+Cj4+PiBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ug
dGhpbmdzIGEgYml0IHNpbXBsZXIgdG8gdXNlIG9uZSBvZiB0aGUgc3BhcmUgX3BhZCBiaXRzCj4+
PiBmcm9tIHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAgYXRoZXIgdGhhbiBoYWNraW5nIGl0IGludG8g
dGhlIG9wYXF1ZSBhcmVhLiBJcwo+Pj4gdGhlcmUgYSByZWFzb24geW91IGNob3NlIHRoaXMgYXBw
cm9hY2g/Cj4+Cj4+IE5vIHNwZWNpZmljIHJlYXNvbi4gQXJlIHlvdSBzdWdnZXN0aW5nIHVwZGF0
aW5nIHRoZSBwdWJsaWMgbGl2ZXBhdGNoCj4+IGludGVyZmFjZSB0byBhZGQgYSBuZXcgbWVtYmVy
IGFuZCByZWR1Y2UgdGhlIHBhZGRpbmcgc2l6ZSBieSAxIGJ5dGU/IEkKPj4gZ3Vlc3MgdGhhdCB3
aWxsIGFsc28gcmVxdWlyZSBhIHBhdGNoIHRvIGxpdmVwYXRjaC1idWlsZC10b29scz8KPj4KPj4g
QmpvZXJuCj4gCj4gc3RydWN0IGxpdmVwYXRjaF9mdW5jIGNvbnRhaW5zIGluZm8gdGhhdCB0aGUg
YnVpbGQgdG9vbCBuZWVkcyB0bwo+IGNvbW11bmljYXRlIHRvIFhlbiBhcyB3ZWxsIGFzIHNwYWNl
IGZvciBYZW4ncyBpbnRlcm5hbCBib29rIGtlZXBpbmcKPiB3aGlsZSB0aGUgbGl2ZSBwYXRjaCBp
cyBhcHBsaWVkLiBUaGlzIGluY2x1ZGVzIHRoZSBhcnJheSBmb3Igc3RvcmluZwo+IGluc3RydWN0
aW9ucywgdGhlIGFwcGxpZWQgZmxhZywgYW5kIG5vdyBhZGRpdGlvbmFsbHkgdGhlIHBhdGNoIG9m
ZnNldC4KPiAoSXQncyBhIHNvbWV3aGF0IG9kZCBhcnJhbmdlbWVudCBidXQgaXQncyB3aGF0IHdl
J3ZlIGdvdC4uLikKPiAKPiBUaGUgYnVpbGQgdG9vbCBkb2VzIG5vdCBuZWVkIHRvIGtub3cgdGhl
IGRldGFpbHMgYWJvdXQgYW55IG9mIFhlbidzIGludGVybmFsCj4gYm9vayBrZWVwaW5nLiBTbyBt
eSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIGhhdmUgcGF0Y2hfb2Zmc2V0IGFzIGFuIGFkZGl0aW9u
YWwKPiBtZW1iZXIgbmV4dCB0byBhcHBsaWVkIChyZWR1Y2luZyBwYWRkaW5nIGJ5IDEpIGFuZCB0
aGVuIGluIGxpdmVwYXRjaC1idWlsZC10b29scwo+IHJlcGxhY2U6Cj4gCj4gICAgICAgICAgdW5z
aWduZWQgY2hhciBwYWRbTUFYX1JFUExBQ0VNRU5UX1NJWkVdOwo+ICAgICAgICAgIHVpbnQ4X3Qg
YXBwbGllZDsKPiAgICAgICAgICB1aW50OF90IF9wYWRbN107Cj4gCj4gd2l0aCBzaW1wbHk6Cj4g
Cj4gICAgICAgICAgdWludDhfdCBvcGFxdWVbMzldOwo+IAo+IAo+IFdoYXQgZG8geW91IHRoaW5r
PwoKVGhhdCB3aWxsIHNpbXBsaWZ5IHRoaXMgcGF0Y2ggLSBJIGxpa2UgaXQuIFdpbGwgc2VuZCB1
cGRhdGUgKyAKbGl2ZXBhdGNoLWJ1aWxkIHBhdGNoLgoKQmpvZXJuCgoKCkFtYXpvbiBEZXZlbG9w
bWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNj
aGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdl
dHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpT
aXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


