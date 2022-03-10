Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3AE4D5022
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288535.489303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMVN-0006tW-Ue; Thu, 10 Mar 2022 17:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288535.489303; Thu, 10 Mar 2022 17:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMVN-0006rg-Rj; Thu, 10 Mar 2022 17:23:13 +0000
Received: by outflank-mailman (input) for mailman id 288535;
 Thu, 10 Mar 2022 17:23:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UgV8=TV=amazon.de=prvs=06149a43a=doebel@srs-se1.protection.inumbo.net>)
 id 1nSMVM-0006ra-Cq
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:23:13 +0000
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1264e60-a096-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 18:23:10 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-92ba9394.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 10 Mar 2022 17:22:53 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-92ba9394.us-west-2.amazon.com (Postfix) with
 ESMTPS id 07982418BD; Thu, 10 Mar 2022 17:22:53 +0000 (UTC)
Received: from [192.168.12.40] (10.43.164.135) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 10 Mar 2022 17:22:51 +0000
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
X-Inumbo-ID: c1264e60-a096-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646932990; x=1678468990;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=PeRJ7Dq1zgla7eS4PsRQ+YK72cKN0uZOKASSXsgkSs8=;
  b=aPXr+dritpvjKu7rVk6wYKSTUTPD2b7GYG99pBPTyAebTpp3glezZ2jT
   2ln/sBLA6Nv1QCR6pcHX5apBkKNGLd5JJCJkZb+3b1dAhI3rIwoV+jKtM
   eVSuy9xzz9NDvVigEwY/vr19kH8GCVD7hfj+dmxBmAUT6fcyLWadfbyhX
   k=;
X-IronPort-AV: E=Sophos;i="5.90,171,1643673600"; 
   d="scan'208";a="998292950"
Subject: Re: [PATCH 1/3] livepatch: use basename to perform object file matching
Message-ID: <5134560e-ef03-fc37-2234-87186f391d8e@amazon.de>
Date: Thu, 10 Mar 2022 18:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
References: <20220310150834.98815-1-roger.pau@citrix.com>
 <20220310150834.98815-2-roger.pau@citrix.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <20220310150834.98815-2-roger.pau@citrix.com>
X-Originating-IP: [10.43.164.135]
X-ClientProxiedBy: EX13D20EUC003.ant.amazon.com (10.43.164.190) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAxMC4wMy4yMiAxNjowOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IENBVVRJT046IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmly
bSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4gCj4gCj4gCj4gVGhl
IGNoYW5nZXMgaW4gdGhlIFhlbiBidWlsZCBsb2dpYyBoYXMgcmVzdWx0ZWQgaW4gdGhlIGNvbXBp
bGVyIGFuZAo+IG9iamNvcHkgYmVpbmcgY2FsbGVkIGZyb20geGVuLyBpbnN0ZWFkIG9mIHJlbGF0
aXZlIHRvIGVhY2ggb2JqZWN0Cj4gZGlyZWN0b3J5LiBUaGlzIHJlcXVpcmVzIHVzaW5nIGJhc2Vu
YW1lIHNvIHRoYXQgdGhlIGRpcmVjdG9yeSBpcyBub3QKPiB0YWtlbiBpbnRvIGFjY291bnQgd2hl
biBjaGVja2luZyBhZ2FpbnN0IHRoZSBsaXN0IG9mIGZpbGVzIHRvIGJlCj4gZXhwbGljaXRseSBp
Z25vcmVkLgo+IAo+IEFsc28gYWRqdXN0IHRoZSBwYXRocyB1c2VkIHRvIHN0b3JlIHRoZSBkaWZm
ZXJpbmcgb2JqZWN0IGZpbGVzLCBhcwo+IHdpdGggdGhlIGN1cnJlbnQgbG9naWMgdGhlIHJlc3Vs
dGluZyBwYXRoIHdpbGwgYmUgd3Jvbmcgd2hlbiB1c2luZwo+IG5ld2VyIFhlbiB2ZXJzaW9ucywg
Y2hhbmdlZF9vYmpzIHdvdWxkIGVuZCBjb250YWluaW5nIGVudHJpZXMgbGlrZToKPiAKPiB4ZW4v
YXJjaC94ODYvaHZtL3ZteC9hcmNoL3g4Ni9odm0vdm14L3ZteC5vCj4gCj4gU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gICBsaXZl
cGF0Y2gtZ2NjIHwgMTIgKysrKysrKy0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saXZlcGF0Y2gtZ2NjIGIv
bGl2ZXBhdGNoLWdjYwo+IGluZGV4IDkxMzMzZDUuLmZlNzgyZTAgMTAwNzU1Cj4gLS0tIGEvbGl2
ZXBhdGNoLWdjYwo+ICsrKyBiL2xpdmVwYXRjaC1nY2MKPiBAQCAtMzIsMTAgKzMyLDEwIEBAIGlm
IFtbICIkVE9PTENIQUlOQ01EIiA9fiAkR0NDX1JFIF1dIDsgdGhlbgo+ICAgICAgICAgICBpZiBb
ICIkMSIgPSAiLW8iIF07IHRoZW4KPiAgICAgICAgICAgICAgIG9iaj0kMgo+ICAgICAgICAgICAg
ICAgW1sgJDIgPSAqLy50bXBfKi5vIF1dICYmIG9iaj0kezIvLnRtcF8vfQo+IC0gICAgICAgICAg
ICBjYXNlICIkb2JqIiBpbgo+ICsgICAgICAgICAgICBjYXNlICIkKGJhc2VuYW1lICRvYmopIiBp
bgo+ICAgICAgICAgICAgICAgdmVyc2lvbi5vfFwKPiAgICAgICAgICAgICAgIGRlYnVnLm98XAo+
IC0gICAgICAgICAgICBlZmkvY2hlY2sub3xcCj4gKyAgICAgICAgICAgIGNoZWNrLm98XAo+ICAg
ICAgICAgICAgICAgKi54ZW4tc3ltcy4qLm98XAo+ICAgICAgICAgICAgICAgKi54ZW4uZWZpLiou
b3xcCj4gICAgICAgICAgICAgICBidWlsdF9pbi5vfFwKPiBAQCAtNDYsNiArNDYsNyBAQCBpZiBb
WyAiJFRPT0xDSEFJTkNNRCIgPX4gJEdDQ19SRSBdXSA7IHRoZW4KPiAgICAgICAgICAgICAgICou
bykKPiAgICAgICAgICAgICAgICAgICBwYXRoPSIkKHB3ZCkvJChkaXJuYW1lICRvYmopIgo+ICAg
ICAgICAgICAgICAgICAgIGRpcj0iJHtwYXRoIyRMSVZFUEFUQ0hfQlVJTERfRElSfSIKPiArICAg
ICAgICAgICAgICAgIG9iaj0kKGJhc2VuYW1lICRvYmopCj4gICAgICAgICAgICAgICAgICAgaWYg
WyAtbiAiJExJVkVQQVRDSF9DQVBUVVJFX0RJUiIgLWEgLWQgIiRMSVZFUEFUQ0hfQ0FQVFVSRV9E
SVIiIF07IHRoZW4KPiAgICAgICAgICAgICAgICAgICAgICAgZWNobyAiJGRpci8kb2JqIiA+PiAi
JHtMSVZFUEFUQ0hfQ0FQVFVSRV9ESVJ9L2NoYW5nZWRfb2JqcyIKPiAgICAgICAgICAgICAgICAg
ICAgICAga2VlcD15ZXMKPiBAQCAtNjEsMTUgKzYyLDE2IEBAIGlmIFtbICIkVE9PTENIQUlOQ01E
IiA9fiAkR0NDX1JFIF1dIDsgdGhlbgo+ICAgZG9uZQo+ICAgZWxpZiBbWyAiJFRPT0xDSEFJTkNN
RCIgPX4gJE9CSkNPUFlfUkUgXV0gOyB0aGVuCj4gICAgICAgb2JqPSIkeyEjfSIKPiAtICAgIGNh
c2UgIiRvYmoiIGluCj4gKyAgICBjYXNlICIkKGJhc2VuYW1lICRvYmopIiBpbgo+ICAgICAgICAg
ICB2ZXJzaW9uLm98XAo+ICAgICAgICAgICBkZWJ1Zy5vfFwKPiAtICAgICAgICBlZmkvY2hlY2su
b3xcCj4gKyAgICAgICAgY2hlY2sub3xcCj4gICAgICAgICAgIC4qLm8pCj4gICAgICAgICAgICAg
ICA7Owo+ICAgICAgICAgICAqLm8pCj4gICAgICAgICAgICAgICBwYXRoPSIkKHB3ZCkvJChkaXJu
YW1lICRvYmopIgo+ICAgICAgICAgICAgICAgZGlyPSIke3BhdGgjJExJVkVQQVRDSF9CVUlMRF9E
SVJ9Igo+ICsgICAgICAgICAgICBvYmo9JChiYXNlbmFtZSAkb2JqKQo+ICAgICAgICAgICAgICAg
aWYgWyAtbiAiJExJVkVQQVRDSF9DQVBUVVJFX0RJUiIgLWEgLWQgIiRMSVZFUEFUQ0hfQ0FQVFVS
RV9ESVIiIF07IHRoZW4KPiAgICAgICAgICAgICAgICAgICBlY2hvICIkZGlyLyRvYmoiID4+ICIk
e0xJVkVQQVRDSF9DQVBUVVJFX0RJUn0vY2hhbmdlZF9vYmpzIgo+ICAgICAgICAgICAgICAgICAg
IGtlZXA9eWVzCj4gQEAgLTg1LDcgKzg3LDcgQEAgcmV0PSIkPyIKPiAKPiAgIGlmIFtbICIka2Vl
cCIgPSAieWVzIiBdXSA7IHRoZW4KPiAgICAgICBta2RpciAtcCAiJChkaXJuYW1lICRMSVZFUEFU
Q0hfQ0FQVFVSRV9ESVIvJGRpci8kb2JqKSIKPiAtICAgIGNwICIkb2JqIiAiJExJVkVQQVRDSF9D
QVBUVVJFX0RJUi8kZGlyLyRvYmoiCj4gKyAgICBjcCAiJHBhdGgvJG9iaiIgIiRMSVZFUEFUQ0hf
Q0FQVFVSRV9ESVIvJGRpci8kb2JqIgo+ICAgZmkKPiAKPiAgIGV4aXQgIiRyZXQiCj4gLS0KPiAy
LjM0LjEKClJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgoKCgpB
bWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDEx
NyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhh
biBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBI
UkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


