Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872264D5CAB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 08:47:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288811.489864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZz6-0002Ps-OM; Fri, 11 Mar 2022 07:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288811.489864; Fri, 11 Mar 2022 07:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZz6-0002O3-L7; Fri, 11 Mar 2022 07:46:48 +0000
Received: by outflank-mailman (input) for mailman id 288811;
 Fri, 11 Mar 2022 07:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hT2a=TW=amazon.de=prvs=062ebc15f=doebel@srs-se1.protection.inumbo.net>)
 id 1nSZz3-0002Nx-Re
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 07:46:46 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 641735f3-a10f-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 08:46:44 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-87b71607.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 11 Mar 2022 07:46:24 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-87b71607.us-east-1.amazon.com (Postfix) with
 ESMTPS id BFD39140FF4; Fri, 11 Mar 2022 07:46:23 +0000 (UTC)
Received: from [192.168.11.20] (10.43.165.105) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 11 Mar 2022 07:46:22 +0000
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
X-Inumbo-ID: 641735f3-a10f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646984804; x=1678520804;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=UefNS3sWcK2bd0zhcSvwZf+MbcZJY0pomDwhuvZFq7M=;
  b=CnMHnrjcyNMt4tdm4tlDF56oLf4cJtaVjgeE0+GGZG69R1TkiKtoHeHb
   yuLFUmeVzcUOYb7r8sZsYaIL/vBi9fmIea/hrQJupgCA9gHX8XCdV5I9/
   4nrCtOJ9jY2UTNAh1H0T8Co9uzVNgqX5Yf3EqKTjCz+lg+oThXy+h0XFE
   E=;
X-IronPort-AV: E=Sophos;i="5.90,173,1643673600"; 
   d="scan'208";a="70089535"
Message-ID: <be931738-facf-a6ae-e028-f561d6cb5e4c@amazon.de>
Date: Fri, 11 Mar 2022 08:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: alternatives+livepatch testing
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Michael
 Kurth <mku@amazon.de>, "Pohlack, Martin" <mpohlack@amazon.de>
References: <09e936c8-1110-a67b-cc67-9cf5ed5a3615@citrix.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <09e936c8-1110-a67b-cc67-9cf5ed5a3615@citrix.com>
X-Originating-IP: [10.43.165.105]
X-ClientProxiedBy: EX13D13EUA004.ant.amazon.com (10.43.165.22) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGksCgo+IEhlbGxvLAo+IAo+IFRoZSByZWNlbnQgaGljY3VwIHdpdGggQ0VULUlCVCwgYW5kIGRp
c2NvdmVyeSB0aGF0IGxpdmVwYXRjaC1idWlsZC10b29scwo+IGhhdmUgYmVlbiBicm9rZW4gZm9y
IHNldmVyYWwgcmVsZWFzZXMsIGRlbW9uc3RyYXRlcyB0aGF0IHdlIGRvIG5vdCBoYXZlCj4gcmVt
b3RlbHkgYWRlcXVhdGUgdGVzdGluZyBpbiBwbGFjZS4gIFdlIG5lZWQgdG8gYWRkcmVzcywgYW5k
IGVuc3VyZSB3ZQo+IGRvbid0IGVuZCB1cCBpbiB0aGUgc2FtZSBwb3NpdGlvbiBhZ2Fpbi4KPiAK
PiBBbHRlcm5hdGl2ZXMgYW5kIExpdmVwYXRjaGluZyBoYXZlIGEgbnVtYmVyIG9mIG92ZXJsYXBw
aW5nIHRlc3QKPiByZXF1aXJlbWVudHMsIHNvIGhvdyBhYm91dCB0aGUgZm9sbG93aW5nIHBsYW46
Cj4gCj4gMSkgSW50cm9kdWNlIGEgbmV3ICRhcmNoL3NjbS10ZXN0cy5jLCB3aXRoIHNvbWV0aGlu
ZyBha2luIHRvIHRoZQo+IGV4aXN0aW5nIHN0dWJfc2VsZnRlc3QoKS4gIEknbSB0ZW1wdGVkIHRv
IG1vdmUgc3R1Yl9zZWxmdGVzdCgpIG91dCBvZgo+IGluaXRjYWxsIGFuZCBjYWxsIGl0IGZyb20g
aW5pdF9kb25lKCkgKGJlZm9yZSB3ZSBjbG9iYmVyIC5pbml0LnRleHQpCj4gYmVjYXVzZSB0aGF0
IGdldHMgc2hzdGsgdGVzdGluZyBpbmNsdWRlZC4KPiAKPiBFdmVuIHdpdGhvdXQgbGl2ZXBhdGNo
aW5nLCB3ZSd2ZSBnb3QgdmFyaW91cyByZXF1aXJlbWVudHMgc3VjaCBhcwo+IGVuZGJyJ3Mgb25s
eSBleGlzdGluZyB3aGVyZSBleHBlY3RlZCwgYW5kIGdldHRpbmcgY2xvYmJlcmVkIHdoZW4KPiBz
dWl0YWJseSBhbm5vdGF0ZWQsIGFuZCBhbHRjYWxscyB0dXJuaW5nIGludG8gVUQgZm9yIGEgc3Rp
bGwtTlVMTCBwb2ludGVyLgo+IAo+IEl0ZW1zIG5vdCB5ZXQgdXBzdHJlYW0gYnV0IG9uIHRoZSBy
YWRhciBpbmNsdWRlIGlubGluaW5nIG9mIHJldHBvbGluZQo+IHRodW5rcyBhbmQgU0xTIHdvcmth
cm91bmRzLCB3aGljaCB3b3VsZCBhbHNvIGZpdCBpbnRvIHRoaXMuCj4gCj4gMikgUHJvdmlkZSAo
aW4geGVuLmdpdCkgYSBwYXRjaCB0byBzY20tdGVzdHMuYyB3aGljaCBPU1NUZXN0L290aGVyIGNh
bgo+IHVzZSBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMgb24gdG8gZ2VuZXJhdGUgYSByZWFsIGxpdmVw
YXRjaCwgYW5kIGEgbmV3Cj4gbGl2ZXBhdGNoaW5nIHN1Ym9wIHdoaWNoIGNhbiBiZSBpbnZva2Vk
IGZyb20geGVuLWxpdmVwYXRjaCBpbiB1c2Vyc3BhY2UKPiB0aGF0IHdpbGwgcnVuIHRoZSBzYW1l
IGtpbmQgb2YgY29uc2lzdGVuY3kgY2hlY2tzIGFzIDEpIG9uIHRoZSBwYXRjaGVkCj4gY29udGVu
dC4KPiAKPiBUaGlzIGxldHMgdXMgY3JlYXRlIHNwZWNpZmljIGNvbnN0cnVjdHMgYW5kIGNvbmZp
cm0gdGhhdCB0aGV5IGdldAo+IHBhdGNoZWQgY29ycmVjdGx5LCB3aXRob3V0IGhhdmluZyB0byBz
cGVjaWZpY2FsbHkgZXhlY3V0ZSB0aGUgcmVzdWx0LiAgSQo+ICh0aGluaykgd2UgY2FuIGRvIGV2
ZXJ5dGhpbmcgbmVlZGVkIHdpdGhvdXQgcmVmZXJlbmNlIHRvIHRoZSBsaXZlcGF0Y2gKPiBtZXRh
ZGF0YSwgd2hpY2ggc2ltcGxpZmllcyB0aGluZ3MuCj4gCj4gUHJvdmlkaW5nIGEgcGF0Y2ggaXNu
J3QgdG90YWxseSBpZGVhbCBmcm9tIGEgIm1haW50YWluaW5nIHhlbiIgcG9pbnQgb2YKPiB2aWV3
LCBidXQgSSB0aGluayB3ZSBjYW4gaGF2ZSBhIGJ1aWxkLXRpbWUgdGVzdCB3aGljaCBjb25maXJt
cyB0aGUgcGF0Y2gKPiBpcyBzdGlsbCBnb29kLCBhbmQgaXQgaXMgZGVmaW5pdGVseSB0aGUgcmln
aHQgcHJpbWl0aXZlIHRvIHVzZSBmb3IgdGhlCj4gZW5kLXRvLWVuZCB0ZXN0aW5nLgoKSSBjYW4g
c2hhcmUgYSBiaXQgd2hhdCB3ZSBhcmUgZG9pbmcgd2l0aCBvdXIgaW50ZXJuYWwgbGl2ZXBhdGNo
IHRlc3Rpbmc6CgoqIFdlIGhhdmUgYSBzaW1wbGUgdGVzdCBsaXZlcGF0Y2gsIHNpbWlsYXIgdG8g
Cnhlbi90ZXN0L2xpdmVwYXRjaC94ZW5fcHJlcG9zdF9ob29rcy5jLiBXZSBidWlsZCBhbmQgbG9h
ZCB0aGlzIGxpdmVwYXRjaCAKYm90aCBpbiBvdXIgbmlnaHRseSB0ZXN0IHNldHVwIGFzIHdlbGwg
YXMgd2hlbiB0ZXN0aW5nIHByb2R1Y3Rpb24gCmJ1aWxkcy4gVGhpcyB0ZXN0IG9ubHkgdmFsaWRh
dGVzIGxpdmVwYXRjaCBmdW5jdGlvbmFsaXR5IGluIHRoZSAKaHlwZXJ2aXNvciB3b3JrcyBhbmQg
SSB0aGluayBpdCB3b3VsZCBub3QgaGF2ZSBkZXRlY3RlZCB0aGUgYnVpbGQgcHJvYmxlbS4KCiog
VG8gZGV0ZWN0IHRoZSBidWlsZCBpc3N1ZSwgd2UgbmVlZCBhbiBhY3R1YWwgZGlmZi1iYXNlZCBs
aXZlcGF0Y2guIFdlIAphcmUgYWN0dWFsbHkgdXNpbmcgYSBub24tdHJpdmlhbCBwYXRjaCBoZXJl
LCB3aGljaCBlbmFibGVzIEZFUCBpbiBYZW4gYXQgCmxvYWQgdGltZSwgYmVjYXVzZSB3ZSBoYXZl
IHRlc3RzIHRoYXQgbWFrZSB1c2Ugb2YgRkVQIGxhdGVyIG9uLgoKKiBJZiB5b3UgYXJlIGNvbmNl
cm5lZCBhYm91dCBtYWludGFpbmFiaWxpdHksIEknZCBnbyBmb3IgYSB2ZXJ5IHNpbXBsZSAKZGlm
ZiB0byBhIGxvY2F0aW9uIHRoYXQgd29uJ3QgY2hhbmdlIGEgbG90LiBGb3IgbXkgQ0VULUlCVCBh
ZGFwdGlvbiwgSSAKd2VudCBmb3IKCi0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCkBAIC00MDUsNiArNDA1LDggQEAgc3RhdGlj
IGludCBjZl9jaGVjayB2bXhfZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IApkb21haW4gKmQpCiAg
ICAgICAgICAudGFpbCA9IHZteF9kb19yZXN1bWUsCiAgICAgIH07CgorICAgIHByaW50aygidm14
X2RvbWFpbl9pbml0aWFsaXNlIGNhbGxlZFxuIik7CisKICAgICAgZC0+YXJjaC5jdHh0X3N3aXRj
aCA9ICZjc3c7CgogICAgICAvKgoKPT0+IFRoaXMgaGFzIHRoZSBkaXNhZHZhbnRhZ2Ugb2YgYmVp
bmcgYXJjaC1zcGVjaWZpYy4gVGhlcmUgYXJlIGxpa2VseSAKbW9yZSBnZW5lcmljIGxvY2F0aW9u
cyBpbiBYZW4gdGhhdCBoYXZlbid0IGJlZW4gY2hhbmdlZCBmb3IgeWVhcnMsIAppbmRpY2F0aW5n
IGxpa2VsaWhvb2Qgb2Ygbm90IHJlcXVpcmluZyB0b28gbWFueSB1cGRhdGVzIGluIHRoZSBmdXR1
cmUuCgoqIEZyb20gYSB0ZXN0aW5nIHBlcnNwZWN0aXZlIGl0IGlzIGEgZ29vZCBpZGVhIHRvIGhh
dmUgYSBwYXRjaCBsaWtlIHRoZSAKb25lIGFib3ZlIHdpdGggYSB2aXNpYmxlIHNpZGUgZWZmZWN0
LCBiZWNhdXNlIHRoYXQgYWxsb3dzIHlvdSB0byBsYXRlciAKYWxzbyBoYXZlIHRlc3RpbmcgdGhh
dCBsb2FkcyB0aGF0IGFjdHVhbCBwYXRjaCBhbmQgdHJpZ2dlcnMgdGhlIApmdW5jdGlvbmFsaXR5
IHRvIG9ic2VydmUgdGhlIHNpZGUgZWZmZWN0LgoKU28gaW4gc3VtbWFyeSwgeW91ciBwbGFuIHNv
dW5kcyByZWFzb25hYmxlLgoKQmpvZXJuCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6
IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNn
ZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0
LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


