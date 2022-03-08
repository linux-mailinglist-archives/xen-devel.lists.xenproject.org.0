Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3F4D1222
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286598.486174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRV7t-0001LK-Bx; Tue, 08 Mar 2022 08:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286598.486174; Tue, 08 Mar 2022 08:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRV7t-0001JR-7B; Tue, 08 Mar 2022 08:23:25 +0000
Received: by outflank-mailman (input) for mailman id 286598;
 Tue, 08 Mar 2022 08:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMfM=TT=amazon.de=prvs=0590b4220=doebel@srs-se1.protection.inumbo.net>)
 id 1nRV7q-0001JL-Uz
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:23:23 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 026b8193-9eb9-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 09:23:20 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 08 Mar 2022 08:23:02 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com (Postfix) with
 ESMTPS id 751788175F; Tue,  8 Mar 2022 08:22:59 +0000 (UTC)
Received: from [192.168.29.124] (10.43.164.135) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Tue, 8 Mar 2022 08:22:58 +0000
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
X-Inumbo-ID: 026b8193-9eb9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646727801; x=1678263801;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=VXhup/Ur94jPGiSw8W5fS2DtLWn5X7Fx2+CaWLbs/Uw=;
  b=UopnQW2G1ZJ1TJLvz3CUZNL0FcT3Kbih69U/hxc/YJoBnvHXK0aoDHpt
   7xTs4lu9SZATj1rQGFgyA0nyjmL+RuJJmQnkJkcO5l1mL/7cbpiU5+OVc
   I1EsSV9aUsg0LRKkFb6T2FURCbJyx+ABQ9V1x0VeIePmtMnPegsRfKgub
   E=;
X-IronPort-AV: E=Sophos;i="5.90,163,1643673600"; 
   d="scan'208";a="68886882"
Subject: Re: [PATCH v2 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Message-ID: <d8fb0a0c-d723-65b9-e309-aa880780fc01@amazon.de>
Date: Tue, 8 Mar 2022 09:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, <xen-devel@lists.xenproject.org>
References: <15b092bb3af6e32f72ee8fca45317687d23b8be4.1646687495.git.doebel@amazon.de>
 <862e888468a1d9923a6e6bef4061ac0caeb9274d.1646687495.git.doebel@amazon.de>
 <ce1ced4e-b9f7-fadc-9f18-b66445c02cdf@suse.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <ce1ced4e-b9f7-fadc-9f18-b66445c02cdf@suse.com>
X-Originating-IP: [10.43.164.135]
X-ClientProxiedBy: EX13D05EUC001.ant.amazon.com (10.43.164.118) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAwOC4wMy4yMiAwOTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQ0FVVElPTjogVGhpcyBl
bWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRo
ZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPiAKPiAKPiAKPiBPbiAwNy4w
My4yMDIyIDIyOjEzLCBCam9lcm4gRG9lYmVsIHdyb3RlOgo+PiBAQCAtMTU5LDcgKzIwMCwxMSBA
QCB2b2lkIG5vaW5saW5lIGFyY2hfbGl2ZXBhdGNoX2FwcGx5KHN0cnVjdCBsaXZlcGF0Y2hfZnVu
YyAqZnVuYykKPj4gICAgKi8KPj4gICB2b2lkIG5vaW5saW5lIGFyY2hfbGl2ZXBhdGNoX3JldmVy
dChjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgKmZ1bmMpCj4+ICAgewo+PiAtICAgIG1lbWNw
eShmdW5jLT5vbGRfYWRkciwgZnVuYy0+b3BhcXVlLCBsaXZlcGF0Y2hfaW5zbl9sZW4oZnVuYykp
Owo+PiArICAgIHN0cnVjdCB4ODZfbGl2ZXBhdGNoX21ldGEgKmxwOwo+IAo+IFJlcGVhdGluZyBt
eSBjb21tZW50IGhlcmUgYSAzcmQgdGltZSAoc29ycnkpOiBjb25zdCBwbGVhc2UgKGFuZAo+IGdl
bmVyYWxseSB3aGVyZXZlciBwb3NzaWJsZSkuCgpUaGF0J3MgZW1iYXJyYXNzaW5nLi4uIDspIFNv
cnJ5LiBXaWxsIGZpeC4KCkJqb2VybgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1h
bnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBD
aHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2Vy
aWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1J
RDogREUgMjg5IDIzNyA4NzkKCgo=


