Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A82FCBEDB0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 10:45:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPN9-0005lz-9D; Thu, 26 Sep 2019 08:43:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDPN7-0005lt-W4
 for Xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 08:43:34 +0000
X-Inumbo-ID: b8a089fe-e039-11e9-bf31-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id b8a089fe-e039-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569487413; x=1601023413;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GSLvIDFiXlbDzQ/GJV3AZlcmj4lIoimIWC76VG1Rlf4=;
 b=eOvIngIkaafC0Ad7bP6/dkiCSEzpgPDuF1F7CCDf8mDkWJEUrhT2Wh/q
 a6PFL3HkSL9E5mjJM0mB8CiQhHhtXbq2103tIVBRf5OPCOz34bFoAHMn1
 HNI2H0UxMZvYJEiEKiDUoIz7qvqozscJ3m1yswdTSxoeWtBXI2QNrKk9v Y=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836972861"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 08:42:23 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id F2677A18D9; Thu, 26 Sep 2019 08:42:09 +0000 (UTC)
Received: from EX13D25UWB002.ant.amazon.com (10.43.161.44) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 08:42:09 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D25UWB002.ant.amazon.com (10.43.161.44) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 08:42:09 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 08:42:08 +0000
To: Wei Liu <wl@xen.org>
References: <20190925143410.26661-1-hongyax@u9d785c4ba99158.ant.amazon.com>
 <20190925151349.43fqwaf6roh5627s@debian>
 <20190925152543.d53lje2i6ti32hr7@debian>
From: <hongyax@amazon.com>
Message-ID: <05d678ee-3818-ba1e-0b7c-7cb729cc5644@amazon.com>
Date: Thu, 26 Sep 2019 09:42:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925152543.d53lje2i6ti32hr7@debian>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 00/84] Remove direct map from Xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBhbSB1cGRhdGluZyBteSBnaXQgZW1haWwgc2V0dGluZ3MgdG8gY29tcGx5IHdpdGggdGhlIFhl
biBkZXZlbG9wbWVudCBndWlkZWxpbmVzLiBJIGFtIGFsc28gYXNraW5nIG15IG1hbmFnZXIgZm9y
IHBlcm1pc3Npb25zIHRvIHNldCB1cCBnaXQgdHJlZXMgb24geGVuLm9yZy4gT25jZSB0aG9zZSBh
cmUgZG9uZSwgSSB3aWxsIHJlcG9zdCB0aGUgc2VyaWVzLiBIb3BlZnVsbHkgaXQgd2lsbCBiZSBs
ZXNzIG1lc3N5IHRoYW4gdGhpcyByb3VuZC4KCkhvbmd5YW4KCk9uIDI1LzA5LzIwMTkgMTY6MjUs
IFdlaSBMaXUgd3JvdGU6Cj4gT25lIHRoaW5nIEkgZm9yZ290IHRvIGFzazogY2FuIHlvdSBwdWJs
aXNoIGEgZ2l0IGJyYW5jaCBmb3IgdGhpcwo+IHNlcmllcz8KPiAKPiBUaGFua3MsCj4gV2VpLgo+
IAo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDA0OjEzOjQ5UE0gKzAxMDAsIFdlaSBMaXUgd3Jv
dGU6Cj4+IEhpIEhvbmd5YW4KPj4KPj4gVGhhbmtzIGZvciBwaWNraW5nIHVwIHRoaXMgd29yay4K
Pj4KPj4gUGxlYXNlIENDIHJlbGV2YW50IG1haW50YWluZXJzIGFuZCByZXZpZXdlcnMgaW4gdGhl
IGZ1dHVyZS4gSSBoYXZlIGRvbmUKPj4gdGhpcyBmb3IgdGhpcyBjb3ZlciBsZXR0ZXIuCj4+Cj4+
IFRoZSBGcm9tOiBmaWVsZCBvZiB5b3VyIGVtYWlscyBpcyBub3QgY29ycmVjdC4gVGhpcyBtYWtl
cyBwZW9wbGUgbm90Cj4+IGFibGUgdG8gcmVwbHkgdG8geW91IGRpcmVjdGx5LiBZb3UgbWF5IHdh
bnQgdG8gY2hlY2sgeW91ciBlbWFpbAo+PiBzZXR0aW5ncy4KPj4KPj4gT24gV2VkLCBTZXAgMjUs
IDIwMTkgYXQgMDM6MzI6NDZQTSArMDEwMCwgaG9uZ3lheCB3cm90ZToKPj4+IFByZXZpb3VzbHks
IFdlaSBMaXUgaGFzIGNyZWF0ZWQgdGhlIHBhdGNoIHNlcmllcyB0byBzd2l0Y2ggdG8KPj4+IGFs
bG9jL21hcC91bm1hcC9mcmVlIEFQSXMgZm9yIFhlbiBwYWdlIHRhYmxlcyBzbyB0aGF0IFhlbiBw
YWdlIHRhYmxlcwo+Pj4gYXJlIG1hcHBlZCB3aXRoIG1hcF9kb21haW5fcGFnZSgpLiBUaGlzIGlz
IHRoZSBmaXJzdCBzdGVwIHRvd2FyZHMKPj4+IHJlbW92aW5nIHRoZSBkaXJlY3QgbWFwLiBJIGlt
cGxlbWVudGVkIHBhdGNoZXMgb24gdG9wIG9mIFdlaSdzIHRvIHJlbW92ZQo+Pj4gdGhlIGRpcmVj
dCBtYXAgY29tcGxldGVseS4KPj4+Cj4+PiBJbiBhZGRpdGlvbiB0byBXZWkncywgbXkgcGF0Y2hl
czoKPj4+IC0gaW1wbGVtZW50IGEgcHJvcGVyIFBNQVAgaW5mcmFzdHJ1Y3R1cmUgZm9yIGJvb3Rz
dHJhcHBpbmcKPj4+IC0gcmVtb3ZlIGRpcmVjdCBtYXAgY29kZSBpbiBtYXBfZG9tYWluX3BhZ2Uo
KSBhbmQgdXNlIG1hcGNhY2hlLCB1c2UgUE1BUAo+Pj4gICAgd2hlbiBtYXBjYWNoZSBub3QgcmVh
ZHkKPj4+IC0gbWFwL3VubWFwIHhlbmhlYXAgYWxsb2NhdGlvbnMgdG8gdGhlIGRpcmVjdCBtYXAg
cmVnaW9uIHNvIHRoYXQgdmE8LT5wYQo+Pj4gICAgbWFjcm9zIHN0aWxsIHdvcmsKPj4+IC0gaW5z
dGFsbCBkdW1teSBtYXBwaW5ncyAobm8gcGVybWlzc2lvbnMsIElOVkFMSURfTUZOKSBpbnN0ZWFk
IG9mIGFjdHVhbAo+Pj4gICAgMToxIG1hcHBpbmdzIGR1cmluZyBib290LCBzbyB0aGUgZGlyZWN0
IG1hcCBubyBsb25nZXIgZXhpc3RzCj4+PiAtIGZpeCBtYW55IHBsYWNlcyB3aGVyZSBjb2RlIGlu
Y29ycmVjdGx5IGFzc3VtZXMgYSBkaXJlY3QgbWFwCj4+Pgo+Pgo+PiBJIHRoaW5rIHRoZSBzZXJp
ZXMgd2lsbCBuZWVkIHNvbWUgcmVvcmRlcmluZyBqdXN0IGJ5IGxvb2tpbmcgYXQgdGhlCj4+IHRo
aW5ncyBsaXN0ZWQgaGVyZSBhbmQgdGhlIGNvbW1pdCBzdWJqZWN0cy4gIEkgd2lsbCB0cnkgdG8g
aGF2ZSBhIGNsb3Nlcgo+PiBsb29rIGF0IHNvbWUgcG9pbnQuICBQbGVhc2UgYWxzbyBhbGxvdyBz
b21lIHRpbWUgZm9yIG90aGVyIHBlb3BsZSB0bwo+PiBoYXZlIHRoZWlyIHNheS4gWGVuIGlzIGFi
b3V0IHRvIGZyZWV6ZSAob3IgZnJvemVuIGFscmVhZHk/KSBzbyBwZW9wbGUKPj4gbWF5IG5vdCBn
ZXQgYXJvdW5kIHRvIHRoaXMgbGFyZ2Ugc2VyaWVzIGFueSB0aW1lIHNvb24uCj4+Cj4+IEFuZCBp
biBjYXNlIHlvdSBkb24ndCBrbm93LCB0aGVyZSBpcyBhIHdpa2kgcGFnZSBbMF0gZm9yIHN1Ym1p
dHRpbmcgWGVuCj4+IHBhdGNoZXMuIEluIGl0IHRoZXJlIGlzIGEgc2VjdGlvbiBhYm91dCBhZGRf
bWFpbnRhaW5lcnMucGwuIFlvdSBjYW4gdXNlCj4+IHRoYXQgc2NyaXB0IHRvIGFkZCByZWxldmFu
dCBtYWludGFpbmVycy4KPj4KPj4gVGhhbmtzLAo+PiBXZWkuCj4+Cj4+IFswXTogaHR0cHM6Ly93
aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvU3VibWl0dGluZ19YZW5fUHJvamVjdF9QYXRjaGVzCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
