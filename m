Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D0B4D41D6
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 08:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288146.488599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDGF-0008SC-6J; Thu, 10 Mar 2022 07:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288146.488599; Thu, 10 Mar 2022 07:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDGF-0008PS-3E; Thu, 10 Mar 2022 07:30:59 +0000
Received: by outflank-mailman (input) for mailman id 288146;
 Thu, 10 Mar 2022 07:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UgV8=TV=amazon.de=prvs=06149a43a=doebel@srs-se1.protection.inumbo.net>)
 id 1nSDGC-0008PM-BW
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 07:30:57 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03ae7716-a044-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 08:30:54 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-5feb294a.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 10 Mar 2022 07:30:37 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-5feb294a.us-west-2.amazon.com (Postfix) with
 ESMTPS id 2DF9087C8A; Thu, 10 Mar 2022 07:30:36 +0000 (UTC)
Received: from [192.168.12.40] (10.43.164.135) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 10 Mar 2022 07:30:34 +0000
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
X-Inumbo-ID: 03ae7716-a044-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646897455; x=1678433455;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=ufwgmHbCfdgMRniaRjH5zBe3Ep9acz7kM8WGhwF8Iuw=;
  b=dp8B/LFR4O8sR2dheItO2IdrG4urLoiHTY/+nVPIxMto2E4+uauqdwt4
   MMyYHjhhfi7UTQagchmEeq8Brkqc1Z1qNAq3YXWXCqiMNI13eOSp46E43
   zumdix9tvPi1hyW4rVVTxNixxTuUUBVLzLb6kPvqdW/qmTf/cvyjWQ3fG
   A=;
X-IronPort-AV: E=Sophos;i="5.90,169,1643673600"; 
   d="scan'208";a="69573389"
Subject: Re: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Message-ID: <1c4fa029-44a9-1e0a-bb09-458ad8d28a64@amazon.de>
Date: Thu, 10 Mar 2022 08:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20220308140126.8815-1-andrew.cooper3@citrix.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <20220308140126.8815-1-andrew.cooper3@citrix.com>
X-Originating-IP: [10.43.164.135]
X-ClientProxiedBy: EX13D23EUC004.ant.amazon.com (10.43.164.201) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAwOC4wMy4yMiAxNTowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDQVVUSU9OOiBUaGlz
IGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0g
dGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+IAo+IAo+IAo+IEZvciBs
aXZlcGF0Y2hpbmcsIHdlIG5lZWQgdG8gbG9vayBhdCBhIHBvdGVudGlhbGx5IGNsb2JiZXJlZCBm
dW5jdGlvbiBhbmQKPiBkZXRlcm1pbmUgd2hldGhlciBpdCB1c2VkIHRvIGhhdmUgYW4gRU5EQlI2
NCBpbnN0cnVjdGlvbi4KPiAKPiBVc2UgYSBub24tZGVmYXVsdCA0LWJ5dGUgUDYgbG9uZyBub3As
IG5vdCBlbWl0dGVkIGJ5IHRvb2xjaGFpbnMsIGFuZCBpbnRyb2R1Y2UKPiB0aGUgd2FzX2VuZGJy
NjQoKSBwcmVkaWNhdGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBD
QzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpv
bi5kZT4KPiBDQzogTWljaGFlbCBLdXJ0aCA8bWt1QGFtYXpvbi5kZT4KPiBDQzogTWFydGluIFBv
aGxhY2sgPG1wb2hsYWNrQGFtYXpvbi5kZT4KPiAKPiBCam9lcm46IEZvciB0aGUgbGl2ZXBhdGNo
aW5nIGNvZGUsIEkgdGhpbmsgeW91IHdhbnQ6Cj4gCj4gICAgaWYgKCBpc19lbmRicjY0KC4uLikg
fHwgd2FzX2VuZGJyNjQoLi4uKSApCj4gICAgICAgIG5lZWRlZCArPSBFTkRCUjY0X0xFTjsKPiAt
LS0KPiAgIHhlbi9hcmNoL3g4Ni9hbHRlcm5hdGl2ZS5jICAgICAgIHwgMTAgKysrKysrKysrLQo+
ICAgeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2VuZGJyLmggfCAxMiArKysrKysrKysrKysKPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYWx0ZXJuYXRpdmUuYyBiL3hlbi9hcmNoL3g4Ni9hbHRl
cm5hdGl2ZS5jCj4gaW5kZXggZDQxZWVlZjFiY2FmLi5mZmIxYjFkOTYwYzggMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L2FsdGVybmF0aXZlLmMKPiArKysgYi94ZW4vYXJjaC94ODYvYWx0ZXJu
YXRpdmUuYwo+IEBAIC0zNjIsNyArMzYyLDE1IEBAIHN0YXRpYyB2b2lkIGluaXRfb3JfbGl2ZXBh
dGNoIF9hcHBseV9hbHRlcm5hdGl2ZXMoc3RydWN0IGFsdF9pbnN0ciAqc3RhcnQsCj4gICAgICAg
ICAgICAgICBpZiAoICFpc19rZXJuZWxfdGV4dChwdHIpIHx8ICFpc19lbmRicjY0KHB0cikgKQo+
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IAo+IC0gICAgICAgICAgICBhZGRfbm9wcyhw
dHIsIEVOREJSNjRfTEVOKTsKPiArICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICogQ2Fu
J3QgdXNlIGFkZF9ub3BzKCkgaGVyZS4gIEVOREJSNjRfUE9JU09OIGlzIHNwZWNpZmljYWxseQo+
ICsgICAgICAgICAgICAgKiBkaWZmZXJlbnQgdG8gTk9QNCBzbyBpdCBjYW4gYmUgc3BvdHRlZCBh
ZnRlciB0aGUgZmFjdC4KPiArICAgICAgICAgICAgICoKPiArICAgICAgICAgICAgICogQWxsIENF
VC1jYXBhYmxlIGhhcmR3YXJlIHVzZXMgUDYgTk9QUyAobm8gbmVlZCB0byBwbHVtYiB0aHJvdWdo
Cj4gKyAgICAgICAgICAgICAqIGlkZWFsX25vcHMpLCBhbmQgZG9lc24ndCByZXF1aXJlIGEgYnJh
bmNoIHRvIHN5bmNocm9uaXNlIHRoZQo+ICsgICAgICAgICAgICAgKiBpbnN0cnVjdGlvbiBzdHJl
YW0uCj4gKyAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICBtZW1jcHkocHRyLCBFTkRCUjY0
X1BPSVNPTiwgRU5EQlI2NF9MRU4pOwo+ICAgICAgICAgICAgICAgY2xvYmJlcmVkKys7Cj4gICAg
ICAgICAgIH0KPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2VuZGJy
LmggYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vZW5kYnIuaAo+IGluZGV4IDYwOTBhZmViMGJk
OC4uNWUxZTU1Y2I0NjdkIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9l
bmRici5oCj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2VuZGJyLmgKPiBAQCAtNTIs
NCArNTIsMTYgQEAgc3RhdGljIGlubGluZSB2b2lkIHBsYWNlX2VuZGJyNjQodm9pZCAqcHRyKQo+
ICAgICAgICoodWludDMyX3QgKilwdHIgPSBnZW5fZW5kYnI2NCgpOwo+ICAgfQo+IAo+ICsvKgo+
ICsgKiBBZnRlciBjbG9iYmVyaW5nIEVOREJSNjQsIHdlIG1heSBuZWVkIHRvIGNvbmZpcm0gdGhh
dCB0aGUgc2l0ZSB1c2VkIHRvCj4gKyAqIGNvbnRhaW4gYW4gRU5EQlI2NCBpbnN0cnVjdGlvbi4g
IFVzZSBhbiBlbmNvZGluZyB3aGljaCBpc24ndCB0aGUgZGVmYXVsdAo+ICsgKiBQNl9OT1A0Lgo+
ICsgKi8KPiArI2RlZmluZSBFTkRCUjY0X1BPSVNPTiAiXHg2Nlx4MGZceDFmXHgwMCIgLyogb3Nw
IG5vcGwgKCVyYXgpICovCj4gKwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgd2FzX2VuZGJyNjQoY29u
c3Qgdm9pZCAqcHRyKQo+ICt7Cj4gKyAgICByZXR1cm4gKihjb25zdCB1aW50MzJfdCAqKXB0ciA9
PSAweDAwMWYwZjY2Owo+ICt9Cj4gKwo+ICAgI2VuZGlmIC8qIFhFTl9BU01fRU5EQlJfSCAqLwo+
IC0tCj4gMi4xMS4wCgpSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5k
ZT4KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4g
MzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwg
Sm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcg
dW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


