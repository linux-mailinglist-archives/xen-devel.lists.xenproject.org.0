Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D68319E61
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 13:30:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84238.157908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAXZ9-0006tg-4I; Fri, 12 Feb 2021 12:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84238.157908; Fri, 12 Feb 2021 12:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAXZ9-0006tH-0y; Fri, 12 Feb 2021 12:28:55 +0000
Received: by outflank-mailman (input) for mailman id 84238;
 Fri, 12 Feb 2021 12:28:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMbC=HO=amazon.de=prvs=670783a61=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lAXZ7-0006tC-7X
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 12:28:53 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6a9bbcb-0706-4323-ab86-a111a7e2f1a1;
 Fri, 12 Feb 2021 12:28:51 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 12 Feb 2021 12:28:43 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id C6BC5A0578; Fri, 12 Feb 2021 12:28:41 +0000 (UTC)
Received: from u6fc700a6f3c650.ant.amazon.com (10.43.161.244) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 12 Feb 2021 12:28:38 +0000
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
X-Inumbo-ID: f6a9bbcb-0706-4323-ab86-a111a7e2f1a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1613132931; x=1644668931;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=FlCGlrIFwMKIzKmNKLPPm3SDShs71E05RQYdouStyoY=;
  b=sHtRyBr0iyu63deDojPzBid3/lKkoArdkv5gIC9bqU+L5OaUkBiwRquE
   eCpL5ZPcr6jAjjkyQuJTDpQwfLoeldUJS3Q/Yw+inZFZodRXsfbw5bMib
   ui3AP09Dg4b4KYjOlnMMpPOXu5b6sZtIq/w2IVbThY1lnHmsekq2IM9xK
   o=;
X-IronPort-AV: E=Sophos;i="5.81,173,1610409600"; 
   d="scan'208";a="85043428"
Subject: Re: [PATCH HVM v2 1/1] hvm: refactor set param
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	<xen-devel@lists.xenproject.org>
References: <20210205203905.8824-1-nmanthey@amazon.de>
 <edf1cd78-2192-2679-9a34-804c5d7b75c5@suse.com>
 <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
 <b8529792-3d99-2e0d-7ebe-31c2c406145f@suse.com>
 <9f753ee9-73c5-aa2c-3c68-eed7e0c2608b@amazon.de>
 <a52cb2ac-fa85-73cd-0c53-3ee002d6b3ea@suse.com>
 <adee7548-0a60-d7d1-731f-474a585edf6c@amazon.de>
 <1a50a8c3-44f5-9ea9-7ff1-0d716bc05ebd@suse.com>
 <d2a5c3a5-d163-3ee9-50ff-0083bd52c374@amazon.de>
 <a48464da-659a-1dea-0b1f-fdd264b1db69@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <2633df5f-df68-4a16-bc5c-522b2a589b00@amazon.de>
Date: Fri, 12 Feb 2021 13:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a48464da-659a-1dea-0b1f-fdd264b1db69@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.43.161.244]
X-ClientProxiedBy: EX13D12UWA001.ant.amazon.com (10.43.160.163) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Content-Transfer-Encoding: base64

Ck9uIDIvMTIvMjEgMTE6MDQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IENBVVRJT046IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0
aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4KPgo+Cj4gT24gMTEuMDIu
MjAyMSAyMTo0NiwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+PiBJIGFncmVlIHdpdGggdGhlIHN5
bW1ldHJ5IGZvciBnZXQgYW5kIHNldC4gVGhpcyBpcyB3aGF0IEknZCBhaW0gZm9yOgo+Pgo+PiAg
MS4gaHZtb3Bfc2V0X3BhcmFtIGFuZCBodm1vcF9nZXRfcGFyYW0gKHN0YXRpYykgYm90aCBjaGVj
ayBmb3IgdGhlCj4+IGluZGV4LCBhbmQgYWZ0ZXJ3YXJkcyB1c2UgdGhlIGlzX2h2bV9kb21haW4o
ZCkgZnVuY3Rpb24gd2l0aCBpdHMgYmFycmllcgo+PiAgMi4gaHZtX3NldF9wYXJhbSAoc3RhdGlj
KSBhbmQgaHZtX2dldF9wYXJhbSBib3RoIGNhbGwgdGhlaXIgYWxsb3cKPj4gaGVscGVyIGZ1bmN0
aW9uLCBldmFsdWF0ZSB0aGUgcmV0dXJuIGNvZGUsIGFuZCBhZnRlcndhcmRzIGJsb2NrIHNwZWN1
bGF0aW9uLgo+PiAgMi4xLiBodm1fZ2V0X3BhcmFtIGlzIGRlY2xhcmVkIGluIGEgcHVibGljIGhl
YWRlciwgYW5kIGNhbm5vdCBiZSB0dXJuZWQKPj4gaW50byBhIHN0YXRpYyBmdW5jdGlvbiwgaGVu
Y2UgbmVlZHMgdGhlIGluZGV4IGNoZWNrCj4gQnV0IGJvdGggZnVydGhlciBjYWxsIHNpdGVzIGFy
ZSBpbiBib3VuZGVkIGxvb3BzLCB3aXRoIHRoZSBib3VuZHMgbm90Cj4gZ3Vlc3QgY29udHJvbGxl
ZC4gSXQgY2FuIHJlbHkgb24gdGhlIGNhbGxlcnMganVzdCBhcyBtdWNoIGFzIC4uLgpPa2F5LCBz
byBJIHdpbGwgbm90IGFkZCB0aGUgY2hlY2sgdGhlcmUgZWl0aGVyLiBJIHRob3VnaHQgYWJvdXQg
ZnV0dXJlCm1vZGlmaWNhdGlvbnMgdGhhdCBhbGxvdyB0byBjYWxsIHRoYXQgZnVuY3Rpb24gZnJv
bSBvdGhlciBwbGFjZXMsIG9yCm1vZGlmaWVkIGNhbGwgZW52aXJvbm1lbnRzIHdpdGggZXZlbnR1
YWxseSBndWVzdCBjb250cm9sIC0gYnV0IEkgYW0gZmluZQp0byBub3QgY29uc2lkZXIgdGhlc2Uu
Cj4KPj4gIDIuMi4gaHZtX3NldF9wYXJhbSBpcyBvbmx5IGNhbGxlZCBmcm9tIGh2bW9wX3NldF9w
YXJhbSwgYW5kIGluZGV4IGlzCj4+IGFscmVhZHkgY2hlY2tlZCB0aGVyZSwgaGVuY2UsIGRvIG5v
dCBhZGQgY2hlY2sKPiAuLi4gdGhpcy4KPgo+PiAgMy4gaHZtX2FsbG93X3NldF9wYXJhbSAoc3Rh
dGljKSBhbmQgaHZtX2FsbG93X2dldF9wYXJhbSAoc3RhdGljKSBkbyBub3QKPj4gdmFsaWRhdGUg
dGhlIGluZGV4IHBhcmFtZXRlcgo+PiAgMy4xLiBodm1fYWxsb3dfc2V0X3BhcmFtIGJsb2NrcyBz
cGVjdWxhdGl2ZSBleGVjdXRpb24gd2l0aCBhIGJhcnJpZXIKPj4gYWZ0ZXIgZG9tYWluIHBlcm1p
c3Npb25zIGhhdmUgYmVlbiBldmFsdWF0ZWQsIGJlZm9yZSBhY2Nlc3NpbmcgdGhlCj4+IHBhcmFt
ZXRlcnMgb2YgdGhlIGRvbWFpbi4gaHZtX2FsbG93X2dldF9wYXJhbSBkb2VzIG5vdCBhY2Nlc3Mg
dGhlIHBhcmFtcwo+PiBtZW1iZXIgb2YgdGhlIGRvbWFpbiwgYW5kIGhlbmNlIGRvZXMgbm90IHJl
cXVpcmUgYWRkaXRpb25hbCBwcm90ZWN0aW9uLgo+Pgo+PiBUbyBzaW1wbGlmeSB0aGUgY29kZSwg
SSBwcm9wb3NlIHRvIGZ1cnRoZXJtb3JlIG1ha2UgdGhlIGh2bW9wX3NldF9wYXJhbQo+PiBmdW5j
dGlvbiBzdGF0aWMgYXMgd2VsbC4KPiBZZXMgLSB0aGlzIG5vdCBiZWluZyBzbyBhbHJlYWR5IGlz
IGxpa2VseSBzaW1wbHkgYW4gb3ZlcnNpZ2h0LAo+IHN1cHBvcnRlZCBieSB0aGUgZmFjdCB0aGF0
IHRoZXJlJ3Mgbm8gZGVjbGFyYXRpb24gaW4gYW55IGhlYWRlci4KCk9rYXkuCgpCZXN0LApOb3Ji
ZXJ0CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3Ry
LiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2Vy
LCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVy
ZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkK
Cgo=


