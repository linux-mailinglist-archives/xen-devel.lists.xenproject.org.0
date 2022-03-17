Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974944DC746
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 14:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291555.494905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUpu2-0000dp-Rn; Thu, 17 Mar 2022 13:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291555.494905; Thu, 17 Mar 2022 13:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUpu2-0000bP-Oc; Thu, 17 Mar 2022 13:10:54 +0000
Received: by outflank-mailman (input) for mailman id 291555;
 Thu, 17 Mar 2022 13:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMEa=T4=amazon.de=prvs=068cc946c=doebel@srs-se1.protection.inumbo.net>)
 id 1nUptz-0000bJ-Vh
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 13:10:52 +0000
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9bcbce8-a5f3-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 14:10:50 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 17 Mar 2022 13:10:34 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com (Postfix) with
 ESMTPS id 29A419EB27; Thu, 17 Mar 2022 13:10:31 +0000 (UTC)
Received: from [192.168.2.253] (10.43.165.112) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 17 Mar 2022 13:10:29 +0000
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
X-Inumbo-ID: a9bcbce8-a5f3-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1647522651; x=1679058651;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RTJb4FKq3FYqOb7fotyFs+v/zo2rFES3uupLVpM2dyE=;
  b=NGozqviscZPmg2muf6SMFVfrtMrn03F/BxOnQscFVla9fdB+t0dZYWmc
   jZv8LG5Axp4yLmo5hsfTkPZxYZtTUtxpOYufzNEMfJOZ05Otr4UjNBXxp
   UJEfxvOWNCBfZQ7Om1e2Mfvzj6LchSJ0iibOUqZC425JyyoeSHnNFic2p
   4=;
X-IronPort-AV: E=Sophos;i="5.90,188,1643673600"; 
   d="scan'208";a="182620630"
Message-ID: <226fa6ba-310d-8083-8d5f-5b5aefa4e70f@amazon.de>
Date: Thu, 17 Mar 2022 14:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Content-Language: en-US
To: Jiamei Xie <Jiamei.Xie@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <03798b67ec3a892a302e6be5d87ea676e6376036.1646837462.git.doebel@amazon.de>
 <5cdd27addcec926eb48fdeab08ad3371e7c3fd7c.1646837462.git.doebel@amazon.de>
 <PH0PR03MB6382E2AD10AEF1BC48C55093F00A9@PH0PR03MB6382.namprd03.prod.outlook.com>
 <VI1PR08MB3056A7F7E5DC1DD68212A57692129@VI1PR08MB3056.eurprd08.prod.outlook.com>
 <VI1PR08MB30562C85CEF556F385DF695F92129@VI1PR08MB3056.eurprd08.prod.outlook.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <VI1PR08MB30562C85CEF556F385DF695F92129@VI1PR08MB3056.eurprd08.prod.outlook.com>
X-Originating-IP: [10.43.165.112]
X-ClientProxiedBy: EX13D33EUC002.ant.amazon.com (10.43.164.234) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAxNy4wMy4yMiAxMTowMCwgSmlhbWVpIFhpZSB3cm90ZToKPgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YKPj4gSmlhbWVpIFhpZQo+PiBTZW50OiAyMDIy
5bm0M+aciDE35pelIDE3OjE3Cj4+IFRvOiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxA
Y2l0cml4LmNvbT47IEJqb2VybiBEb2ViZWwKPj4gPGRvZWJlbEBhbWF6b24uZGU+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4gQ2M6IE1pY2hhZWwgS3VydGggPG1rdUBhbWF6b24u
ZGU+OyBNYXJ0aW4gUG9obGFjawo+PiA8bXBvaGxhY2tAYW1hem9uLmRlPjsgUm9nZXIgUGF1IE1v
bm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47Cj4+IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29w
ZXIzQGNpdHJpeC5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPj4gPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+Cj4+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjUgMi8yXSB4ZW4veDg2OiBMaXZlcGF0
Y2g6IHN1cHBvcnQgcGF0Y2hpbmcgQ0VULQo+PiBlbmhhbmNlZCBmdW5jdGlvbnMKPj4KPj4gSGkg
IEJqb2VybiwKPj4KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+PiBGcm9tOiBYZW4t
ZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYg
T2YKPj4+IFJvc3MgTGFnZXJ3YWxsCj4+PiBTZW50OiAyMDIy5bm0M+aciDEw5pelIDE6MTIKPj4+
IFRvOiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCj4+PiBDYzogTWljaGFlbCBLdXJ0aCA8bWt1QGFtYXpvbi5kZT47IE1hcnRp
biBQb2hsYWNrCj4+PiA8bXBvaGxhY2tAYW1hem9uLmRlPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47Cj4+PiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRy
aXguY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4+PiA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4KPj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi8yXSB4ZW4veDg2OiBMaXZlcGF0Y2g6IHN1
cHBvcnQgcGF0Y2hpbmcgQ0VULQo+Pj4gZW5oYW5jZWQgZnVuY3Rpb25zCj4+Pgo+Pj4+IEZyb206
IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4+Pj4gU2VudDogV2VkbmVzZGF5LCBN
YXJjaCA5LCAyMDIyIDI6NTMgUE0KPj4+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4+Pj4gQ2M6IE1pY2hhZWwgS3Vy
dGggPG1rdUBhbWF6b24uZGU+OyBNYXJ0aW4gUG9obGFjawo+Pj4gPG1wb2hsYWNrQGFtYXpvbi5k
ZT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Owo+Pj4gQW5kcmV3IENv
b3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEJqb2VybiBEb2ViZWwKPj4+IDxkb2Vi
ZWxAYW1hem9uLmRlPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPjsKPj4+IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+Pj4+
IFN1YmplY3Q6IFtQQVRDSCB2NSAyLzJdIHhlbi94ODY6IExpdmVwYXRjaDogc3VwcG9ydCBwYXRj
aGluZyBDRVQtCj4+PiBlbmhhbmNlZCBmdW5jdGlvbnMKPj4+Pgo+Pj4+IFhlbiBlbmFibGVkIENF
VCBmb3Igc3VwcG9ydGluZyBhcmNoaXRlY3R1cmVzLiBUaGUgY29udHJvbCBmbG93IGFzcGVjdCBv
Zgo+Pj4+IENFVCBleHBlY3RzIGZ1bmN0aW9ucyB0aGF0IGNhbiBiZSBjYWxsZWQgaW5kaXJlY3Rs
eSAoaS5lLiwgdmlhIGZ1bmN0aW9uCj4+Pj4gcG9pbnRlcnMpIHRvIHN0YXJ0IHdpdGggYW4gRU5E
QlI2NCBpbnN0cnVjdGlvbi4gT3RoZXJ3aXNlIGEgY29udHJvbCBmbG93Cj4+Pj4gZXhjZXB0aW9u
IGlzIHJhaXNlZC4KPj4+Pgo+Pj4+IFRoaXMgZXhwZWN0YXRpb24gYnJlYWtzIGxpdmVwYXRjaGlu
ZyBmbG93cyBiZWNhdXNlIHdlIHBhdGNoIGZ1bmN0aW9ucyBieQo+Pj4+IG92ZXJ3cml0aW5nIHRo
ZWlyIGZpcnN0IDUgYnl0ZXMgd2l0aCBhIEpNUCArIDxvZmZzZXQ+LCB0aHVzIGJyZWFraW5nIHRo
ZQo+Pj4+IEVOREJSNjQuIFdlIGZpeCB0aGlzIGJ5IGNoZWNraW5nIHRoZSBzdGFydCBvZiBhIHBh
dGNoZWQgZnVuY3Rpb24gZm9yCj4+Pj4gYmVpbmcgRU5EQlI2NC4gSW4gdGhlIHBvc2l0aXZlIGNh
c2Ugd2UgbW92ZSB0aGUgbGl2ZXBhdGNoIEpNUCB0byBzdGFydAo+Pj4+IGJlaGluZCB0aGUgRU5E
QlI2NCBpbnN0cnVjdGlvbi4KPj4+Pgo+Pj4+IFRvIGF2b2lkIGhhdmluZyB0byBndWVzcyB0aGUg
RU5EQlI2NCBvZmZzZXQgYWdhaW4gb24gcGF0Y2ggcmV2ZXJzYWwKPj4+PiAod2hpY2ggbWlnaHQg
cmFjZSB3aXRoIG90aGVyIG1lY2hhbmlzbXMgYWRkaW5nL3JlbW92aW5nIEVOREJSCj4+Pj4gZHlu
YW1pY2FsbHkpLCB1c2UgdGhlIGxpdmVwYXRjaCBtZXRhZGF0YSB0byBzdG9yZSB0aGUgY29tcHV0
ZWQgb2Zmc2V0Cj4+Pj4gYWxvbmcgd2l0aCB0aGUgc2F2ZWQgYnl0ZXMgb2YgdGhlIG92ZXJ3cml0
dGVuIGZ1bmN0aW9uLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQmpvZXJuIERvZWJlbCA8ZG9l
YmVsQGFtYXpvbi5kZT4KPj4+PiBBY2tlZC1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPgo+Pj4+IENDOiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndh
bGxAY2l0cml4LmNvbT4KPj4+Cj4+PiBSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3Mu
bGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4+Cj4+IFRlc3RlZC1ieTogSmlhbWVpIHhpZSA8amlhbWVp
LnhpZUBhcm0uY29tPgo+Pgo+PiBDaGVlcnMsCj4+IEppYW1laQo+IFNvcnJ5IEkgZm9yZ290IHRv
IGFkZCB0aGUgc2NvcGUgSSB0ZXN0ZWQgaW4gbGFzdCBlbWFpbC4gSSB0ZXN0ZWQgaXQgb24gYXJt
djhhLiBJdCB3b3JrZWQgZmluZSBhbmQgIGRpZG4ndCBicmVhayBhcm0uCj4gVGVzdGVkLWJ5OiBK
aWFtZWkgeGllIDxqaWFtZWkueGllQGFybS5jb20+CgpUaGFua3MgSmlhbWVpIQoKQXMgSmFuIGFs
cmVhZHkgcG9pbnRlZCBvdXQgdGhlcmUncyBhIHY2IHBhdGNoIG91dCBhbHJlYWR5LiBJdCBpcyBv
bmx5IApjb3NtZXRpY2FsbHkgZGlmZmVyZW50IGZyb20gdGhpcyBvbmUuIFVubGVzcyB5b3UgaW5z
aXN0LCBJJ2Qgbm90IHJvbGwgYSAKdjcgb25seSB0byBhZGQgdGhpcyB0YWc/CgpCam9lcm4KCgoK
QW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAx
MTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRo
YW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIg
SFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


