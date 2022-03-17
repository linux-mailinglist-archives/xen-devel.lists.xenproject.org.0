Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3284DC72B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 14:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291552.494895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUpkP-0007bs-T6; Thu, 17 Mar 2022 13:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291552.494895; Thu, 17 Mar 2022 13:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUpkP-0007Z9-Q4; Thu, 17 Mar 2022 13:00:57 +0000
Received: by outflank-mailman (input) for mailman id 291552;
 Thu, 17 Mar 2022 13:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMEa=T4=amazon.de=prvs=068cc946c=doebel@srs-se1.protection.inumbo.net>)
 id 1nUpkN-0007Z3-2o
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 13:00:55 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45e4f5a0-a5f2-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 14:00:53 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-1box-2b-eee1d651.us-west-2.amazon.com)
 ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 17 Mar 2022 13:00:36 +0000
Received: from EX13D03EUC004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-1box-2b-eee1d651.us-west-2.amazon.com (Postfix)
 with ESMTPS id 1F959A2843; Thu, 17 Mar 2022 13:00:35 +0000 (UTC)
Received: from EX13D03EUC002.ant.amazon.com (10.43.164.60) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Thu, 17 Mar 2022 13:00:33 +0000
Received: from EX13D03EUC002.ant.amazon.com ([10.43.164.60]) by
 EX13D03EUC002.ant.amazon.com ([10.43.164.60]) with mapi id 15.00.1497.033;
 Thu, 17 Mar 2022 13:00:33 +0000
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
X-Inumbo-ID: 45e4f5a0-a5f2-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1647522054; x=1679058054;
  h=from:to:cc:subject:date:message-id:content-id:
   mime-version:content-transfer-encoding;
  bh=Oykx6Xr9eN4B2fuq+DK664PJgkxbCJddImWn58sKRGI=;
  b=m0mWWNr3csk31Pd0Tvko51ahVEDUjOk2PltnuSnA/eaJfSoZjn5Ly52e
   shvskT39j3s7sasbmWV9wO8gLbkJuhGw84ca/x+ObffBDKCZWNF7sTOpz
   shpip40KfPx00uvMs7bv9d9tA7ovnR1II07doetfr0TW6Zp3R9gkMZi2u
   I=;
X-IronPort-AV: E=Sophos;i="5.90,188,1643673600"; 
   d="scan'208";a="203074535"
From: "Doebel, Bjoern" <doebel@amazon.de>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 0/2] livepatch: fix handling of (some) relocations
Thread-Topic: [PATCH 0/2] livepatch: fix handling of (some) relocations
Thread-Index: AQHYOf78x9OeSa8tZk2PAY3sLThVew==
Date: Thu, 17 Mar 2022 13:00:33 +0000
Message-ID: <B3193B65-7512-4A69-834B-0ADF3DC6B9BF@amazon.com>
Accept-Language: en-US, de-DE
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.95]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B152D95046C9784E9D05EF1A68E61C20@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64

DQoNCu+7v09uIDE3LjAzLjIyLCAxMjoxMCwgIlhlbi1kZXZlbCBvbiBiZWhhbGYgb2YgUm9nZXIg
UGF1IE1vbm5lIiA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmcgb24gYmVo
YWxmIG9mIHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCg0KDQogICAgSGVsbG8sDQoNCiAg
ICBSZWxvY2F0aW9ucyB0aGF0IHJlZmVyZW5jZSBzeW1ib2xzIHRoYXQgYmVsb25nIHRvIHNlY3Rp
b25zIHdpdGggYSBzaXplDQogICAgb2YgMCBhcmUgbm90IHByb3Blcmx5IHJlc29sdmVkLCBhcyB0
aGUgYWRkcmVzcyBvZiB0aG9zZSBzeW1ib2xzIHdvbid0IGJlDQogICAgcmVzb2x2ZWQgaW4gdGhl
IGZpcnN0IHBsYWNlLg0KDQogICAgRml4IHRoaXMgYnkgbm90IGlnbm9yaW5nIHNlY3Rpb25zIHdp
dGggYSBzaXplIG9mIDAsIHdoaWxlIHN0aWxsIHByb3Blcmx5DQogICAgaGFuZGxpbmcgdGhlIGRl
dGVjdGlvbiBvZiB3aGV0aGVyIGEgbGl2ZXBhdGNoIGNhbiBiZSByZWFwcGxpZWQgYWZ0ZXINCiAg
ICBiZWluZyByZXZlcnRlZCAocGF0Y2ggMSkuDQoNCiAgICBBbHNvIGRldGVjdCB3aGV0aGVyIGFu
eSByZWxvY2F0aW9ucyByZWZlcmVuY2UgdW5yZXNvbHZlZCBzeW1ib2xzIGFuZA0KICAgIGVycm9y
IG91dCBpbiB0aGF0IGNhc2UsIGFzIHRob3NlIHJlbG9jYXRpb25zIGNhbm5vdCBiZSByZXNvbHZl
ZCAocGF0Y2gNCiAgICAyKS4NCg0KICAgIEkgd29uZGVyIHdoZXRoZXIgaXQncyBwb3NzaWJsZSB0
byBoYXZlIHVucmVzb2x2ZWQgc3ltYm9scyBpZiB3ZSBvbmx5DQogICAgaWdub3JlIG5vbiBTSEZf
QUxMT0Mgc2VjdGlvbnMsIHNvIHdlIGNvdWxkIG1heWJlIGVycm9yIG91dCBlYXJsaWVyIGlmIHdl
DQogICAgZm91bmQgYSBzeW1ib2xzIHRoYXQgYmVsb25ncyB0byBhIG5vbiBTSEZfQUxMT0Mgc2Vj
dGlvbiBpbg0KICAgIGxpdmVwYXRjaF9lbGZfcmVzb2x2ZV9zeW1ib2xzLiAgVGhlIGN1cnJlbnQg
YXBwcm9hY2ggaXMgbW9yZSBjb25zZXJ2YXRpdmUNCiAgICBhcyB3ZSB3b3VsZCBvbmx5IHJlcG9y
dCBhbiBlcnJvciBpZiB3ZSBoYXZlIHVucmVzb2x2ZWQgc3ltYm9scyB0aGF0IGFyZQ0KICAgIHJl
ZmVyZW5jZWQgaW4gcmVsb2NhdGlvbnMuDQoNCiAgICBUaGFua3MsIFJvZ2VyLg0KDQogICAgUm9n
ZXIgUGF1IE1vbm5lICgyKToNCiAgICAgIGxpdmVwYXRjaDogZG8gbm90IGlnbm9yZSBzZWN0aW9u
cyB3aXRoIDAgc2l6ZQ0KICAgICAgbGl2ZXBhdGNoOiBhdm9pZCByZWxvY2F0aW9ucyByZWZlcmVu
Y2luZyBpZ25vcmVkIHNlY3Rpb24gc3ltYm9scw0KDQogICAgIHhlbi9hcmNoL2FybS9hcm0zMi9s
aXZlcGF0Y2guYyAgfCAgNyArKysrKysrDQogICAgIHhlbi9hcmNoL2FybS9hcm02NC9saXZlcGF0
Y2guYyAgfCAgNyArKysrKysrDQogICAgIHhlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYyAgICAgICAg
fCAgNyArKysrKysrDQogICAgIHhlbi9jb21tb24vbGl2ZXBhdGNoLmMgICAgICAgICAgfCAxNiAr
KysrKysrKysrKy0tLS0tDQogICAgIHhlbi9jb21tb24vbGl2ZXBhdGNoX2VsZi5jICAgICAgfCAg
NiArKysrKysNCiAgICAgeGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9lbGYuaCB8ICAzICsrLQ0K
ICAgICA2IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoN
CiAgICAtLQ0KICAgIDIuMzQuMQ0KDQpJIGNoZWNrZWQgdGhlIHg4NiBwYXJ0IGFuZCBjb25maXJt
ZWQgdGhhdCBteSBwcmV2aW91c2x5IG5vbi13b3JraW5nIGxpdmVwYXRjaCBsb2FkcyBub3cuDQoN
ClRlc3RlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4NCg0KCgoKQW1hem9u
IERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVy
bGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vp
c3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0
OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


