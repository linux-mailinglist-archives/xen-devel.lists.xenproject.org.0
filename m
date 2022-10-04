Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54455F3E33
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 10:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415233.659752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdCy-0008Gc-Ea; Tue, 04 Oct 2022 08:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415233.659752; Tue, 04 Oct 2022 08:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdCy-0008Dk-Bb; Tue, 04 Oct 2022 08:23:20 +0000
Received: by outflank-mailman (input) for mailman id 415233;
 Tue, 04 Oct 2022 08:23:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCCr=2F=amazon.de=prvs=26955097f=graf@srs-se1.protection.inumbo.net>)
 id 1ofdCw-0008BG-OE
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 08:23:18 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb41431d-43bd-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 10:23:17 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-5c4a15b1.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 08:22:27 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-5c4a15b1.us-west-2.amazon.com (Postfix) with
 ESMTPS id A219D44FBC; Tue,  4 Oct 2022 08:22:22 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 4 Oct 2022 08:22:22 +0000
Received: from [10.95.66.18] (10.43.160.124) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.12; Tue, 4 Oct
 2022 08:22:16 +0000
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
X-Inumbo-ID: cb41431d-43bd-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1664871798; x=1696407798;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LJNqYgt9+EkQuB9NNZOVvoJbSMyT9Vb0J5NzwhljRLA=;
  b=NfSXmVFPOKGY/PbHLQzceucw6CBHuMbgPYbuu7d3WGNKlaUYmilpuYGH
   FthoVDdvFilZlnVcb2wZvPDEisUUQwiIICvXnf8eRLya/eKkWVaTn31wb
   3yD4lW0ZMsuQDV5uoADT7VwruzBbTm/aPDPfz1veC1hGtmm7wtiIhbkqI
   A=;
X-IronPort-AV: E=Sophos;i="5.93,367,1654560000"; 
   d="scan'208";a="136675810"
Message-ID: <f1a7e603-2e64-fd2a-1100-f2898060e3f7@amazon.com>
Date: Tue, 4 Oct 2022 10:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Content-Language: en-US
To: Nadav Amit <namit@vmware.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
	Srivatsa Bhat <srivatsab@vmware.com>, "srivatsa@csail.mit.edu"
	<srivatsa@csail.mit.edu>, Alexey Makhalov <amakhalov@vmware.com>, "Vasavi
 Sirnapalli" <vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
	<er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "acrn-dev@lists.projectacrn.org"
	<acrn-dev@lists.projectacrn.org>, "helgaas@kernel.org" <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, Thomas Gleixner
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
X-Originating-IP: [10.43.160.124]
X-ClientProxiedBy: EX13D06UWC004.ant.amazon.com (10.43.162.97) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGV5IE5hZGF2LAoKT24gMDMuMTAuMjIgMTk6MzQsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gT24gT2N0
IDMsIDIwMjIsIGF0IDg6MDMgQU0sIFZpdGFseSBLdXpuZXRzb3YgPHZrdXpuZXRzQHJlZGhhdC5j
b20+IHdyb3RlOgo+Cj4+IE5vdCBteSBidXQgcmF0aGVyIFBDSSBtYWludGFpbmVyJ3MgY2FsbCBi
dXQgSU1ITyBkcm9wcGluZyAnY29uc3QnIGlzCj4+IGJldHRlciwgaW50cm9kdWNpbmcgYSBuZXcg
Z2xvYmFsIHZhciBpcyBvdXIgJ2xhc3QgcmVzb3J0JyBhbmQgc2hvdWxkIGJlCj4+IGF2b2lkZWQg
d2hlbmV2ZXIgcG9zc2libGUuIEFsdGVybmF0aXZlbHksIHlvdSBjYW4gYWRkIGEKPj4gcmF3X3Bj
aV9leHRfb3BzX3ByZWZlcnJlZCgpIGZ1bmN0aW9uIGNoZWNraW5nIHNvbWV0aGluIHdpdGhpbiAn
c3RydWN0Cj4+IGh5cGVydmlzb3JfeDg2JyBidXQgSSdtIHVuc3VyZSBpZiBpdCdzIGJldHRlci4K
Pj4KPj4gQWxzbywgcGxlYXNlIGNoZWNrIEFsZXgnIHF1ZXN0aW9uL3N1Z2dlc3Rpb24uCj4gSGVy
ZSBpcyBteSB0YWtlIChhbmQgQWpheSBrbm93cyBwcm9iYWJseSBtb3JlIHRoYW4gbWUpOgo+Cj4g
TG9va2luZyBicmllZmx5IG9uIE1DRkcsIEkgZG8gbm90IHNlZSBhIGNsZWFuIHdheSBvZiB1c2lu
ZyB0aGUgQUNQSSB0YWJsZS4KPiBUaGUgdHdvIG9wdGlvbnMgYXJlIGVpdGhlciB0byB1c2UgYSBy
ZXNlcnZlZCBmaWVsZCAod2hpY2ggd2hvIGtub3dzLCBtaWdodAo+IGJlIHVzZWQgb25lIGRheSkg
b3Igc29tZSBPRU0gSUQuIEkgYW0gYWxzbyBub3QgZmFtaWxpYXIgd2l0aAo+IFBDSV9DT01NQU5E
Lk1FTU9SWT0wLCBzbyBBamF5IGNhbiBob3BlZnVsbHkgZ2l2ZSBzb21lIGFuc3dlciBhYm91dCB0
aGF0Lgo+Cj4gQW55aG93LCBJIHVuZGVyc3RhbmQgKGFsdGhvdWdoIG5vdCByZWxhdGUpIHRvIHRo
ZSBvYmplY3Rpb24gZm9yIGEgbmV3IGdsb2JhbAo+IHZhcmlhYmxlLiBIb3cgYWJvdXQgZXhwbGlj
aXRseSBjYWxsaW5nIHRoaXMgaGFyZHdhcmUgYnVnIGEg4oCcYnVn4oCdIGFuZCB1c2luZwo+IHRo
ZSBwcm9wZXIgaW5mcmFzdHJ1Y3R1cmU/IENhbGxpbmcgaXQgZXhwbGljaXRseSBhIGJ1ZyBtYXkg
ZXZlbiBwdXNoIHdob2V2ZXIKPiBjYW4gdG8gcmVzb2x2ZSBpdC4KCgpJIGFtIGEgbG90IG1vcmUg
Y29uY2VybmVkIHdpdGggaG93IHdlIHByb3BhZ2F0ZSBpdCBleHRlcm5hbGx5IHRoYW4gCndpdGhp
biBMaW51eC4gSWYgd2UgaGFyZCBjb2RlIHRoYXQgYWxsIExpbnV4IGtlcm5lbHMgNi4yKyB0aGF0
IGFyZSAKcnVubmluZyBpbiBWTXdhcmUgcHJlZmVyIEVDQU0gb3ZlciBQSU8sIHdlIGxvY2sgb3Vy
c2VsdmVzIGludG8gdGhhdCAKc3RhbmNlIGZvciBiZXR0ZXIgb3Igd29yc2UsIHdoaWNoIG1lYW5z
OgoKKiBBbGwgcGFzdCBhbmQgZnV0dXJlIHZlcnNpb25zIG9mIGFueSBWTXdhcmUgaHlwZXJ2aXNv
ciBwcm9kdWN0IGhhdmUgdG8gCmFsd2F5cyBhbGxvdyBFQ0FNIGFjY2VzcyBmb3IgYW55IFBDSWUg
Y29uZmlnIHNwYWNlIHdyaXRlCiogTm8gb3RoZXIgaHlwZXJ2aXNvciBiZW5lZml0cyBmcm9tIGFu
eSBvZiB0aGlzIHdpdGhvdXQgdXBzdHJlYW0gY29kZSBjaGFuZ2UKKiBObyByZWFsIGhhcmR3YXJl
IHBsYXRmb3JtIGJlbmVmaXRzIGZyb20gdGhpcyB3aXRob3V0IHVwc3RyZWFtIGNvZGUgY2hhbmdl
CgpCeSBtb3ZpbmcgaXQgaW50byBNQ0ZHLCB3ZSBjYW4gY3JlYXRlIGEgcGF0aCBmb3IgdGhlIG91
dHNpZGUgZW52aXJvbm1lbnQgCnRvIHRlbGwgdGhlIE9TIHdoZXRoZXIgaXQncyBzYWZlIHRvIHVz
ZSBFQ0FNIGFsd2F5cy4gVGhpcyBvYnZpb3VzbHkgCmRvZXNuJ3Qgd29yayB3aXRoIE1DRkcgYXMg
aXQgc3RhbmRzIHRvZGF5LCB3ZSdkIGhhdmUgdG8gcHJvcG9zZSBhbiBNQ0ZHIApzcGVjIGNoYW5n
ZSB0byB0aGUgUENJIFNJRydzICJQQ0kgRmlybXdhcmUgU3BlY2lmaWNhdGlvbiIgdG8gYWRkIHRo
ZSAKcmVzcGVjdGl2ZSBmaWVsZC4gRnV0dXJlIFZNd2FyZSB2ZXJzaW9ucyBjb3VsZCB0aGVuIGFs
d2F5cyBleHBvc2UgdGhlIApmbGFnIC0gYW5kIGlmIHlvdSBmaW5kIGl0IGJyb2tlbiwgcmVtb3Zl
IGl0IGFnYWluLgoKUHV0dGluZyBhbGwgb2YgdGhlIGxvZ2ljIG9uIHdoaWNoIHN5c3RlbSBwb3Rl
bnRpYWxseSBwcmVmZXJzIEVDQU0gb3ZlciAKUElPIGNvbmZpZyBzcGFjZSBhY2Nlc3MgaW50byBM
aW51eCBpcyBqdXN0IGEgYmlnIGhhY2sgdGhhdCB3ZSBzaG91bGQgCmF2b2lkIGFzIG11Y2ggYXMg
cG9zc2libGUuCgoKQWxleAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdt
YkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0
aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQg
Q2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERF
IDI4OSAyMzcgODc5CgoK


