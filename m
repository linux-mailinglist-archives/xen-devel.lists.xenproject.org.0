Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDD2B2118
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 17:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26771.55251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcM4-0000BV-7E; Fri, 13 Nov 2020 16:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26771.55251; Fri, 13 Nov 2020 16:55:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcM4-0000B5-45; Fri, 13 Nov 2020 16:55:20 +0000
Received: by outflank-mailman (input) for mailman id 26771;
 Fri, 13 Nov 2020 16:55:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgAG=ET=amazon.de=prvs=579e99c79=doebel@srs-us1.protection.inumbo.net>)
 id 1kdcM1-0000B0-Uj
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 16:55:18 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4431a71c-c10c-4d78-96a7-949b7e31aeac;
 Fri, 13 Nov 2020 16:55:17 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 13 Nov 2020 16:55:11 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id EAD62A1F8A; Fri, 13 Nov 2020 16:55:09 +0000 (UTC)
Received: from [192.168.31.251] (10.43.161.55) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Nov 2020 16:55:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=EgAG=ET=amazon.de=prvs=579e99c79=doebel@srs-us1.protection.inumbo.net>)
	id 1kdcM1-0000B0-Uj
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 16:55:18 +0000
X-Inumbo-ID: 4431a71c-c10c-4d78-96a7-949b7e31aeac
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4431a71c-c10c-4d78-96a7-949b7e31aeac;
	Fri, 13 Nov 2020 16:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1605286517; x=1636822517;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=0cW9/0mnolwA1dO33wTeIFRKYLG4E2BWKZ1kWv8/TwA=;
  b=UctwvzuRejkdwDid2w9xGNqBpcpGh9pU0qiFzd1Rb2OE9O7ML8k8/W/s
   yYCm54rdzwj1jvXu1pkwFsHXCTnhInsRm/jXqOXBwwb9kAeo6QtfxSG/n
   kQV355lcwUAgnAhQl32uc7HyLGoMi1o32LIUJvUudKDa8ahHSGPHTMx2y
   g=;
X-IronPort-AV: E=Sophos;i="5.77,476,1596499200"; 
   d="scan'208";a="63707561"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 13 Nov 2020 16:55:11 +0000
Received: from EX13D03EUC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS id EAD62A1F8A;
	Fri, 13 Nov 2020 16:55:09 +0000 (UTC)
Received: from [192.168.31.251] (10.43.161.55) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Nov
 2020 16:55:05 +0000
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.co.uk>, Eslam Elnikety <elnikety@amazon.de>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20201113141823.58712-1-doebel@amazon.de>
 <de06e7ce-65cd-95fb-5862-0135e2110a99@citrix.com>
From: Bjoern Doebel <doebel@amazon.de>
Message-ID: <c216f07a-df70-ddb5-46fd-7b61e36fa6fc@amazon.de>
Date: Fri, 13 Nov 2020 17:55:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <de06e7ce-65cd-95fb-5862-0135e2110a99@citrix.com>
Content-Language: en-GB
X-Originating-IP: [10.43.161.55]
X-ClientProxiedBy: EX13D35UWB001.ant.amazon.com (10.43.161.47) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDEzLjExLjIwIDE1OjMwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDEzLzExLzIwMjAg
MTQ6MTgsIEJqb2VybiBEb2ViZWwgd3JvdGU6Cj4+IFJpZ2h0IG5vdyB3ZSBkbyBub3QgaGF2ZSBh
IG1lY2hhbmlzbSB0byBkZXRlcm1pbmUgdGhlIHZlcnNpb24gb2YgdGhlCj4+IGN1cnJlbnRseSBy
dW5uaW5nIHhlbnN0b3JlZCBhdCBydW50aW1lLiBBcyB4ZW5zdG9yZWQgcnVucyB0aHJvdWdob3V0
IHRoZQo+PiBsaWZldGltZSBvZiBhIFhlbiBob3N0LCB0aGlzIG1heSBsZWFkIHRvIHByb2JsZW1z
IHdoZW4gbmV3ZXIgdXNlciBzcGFjZQo+PiBidWlsZHMgYXJlIHN0YWdlZC4gVGhlbiwgdGhlIHJ1
bm5pbmcgeGVuc3RvcmVkIHdpbGwgbm8gbG9uZ2VyIG1hdGNoIHRoZQo+PiB2ZXJzaW9uIG9mIHRo
ZSBpbnN0YWxsZWQgeGVuc3RvcmVkLgo+Pgo+PiBUbyBhbGxvdyB1c2VycyB0byBhbHdheXMgaWRl
bnRpZnkgdGhlIHJ1bm5pbmcgdmVyc2lvbiBvZiB4ZW5zdG9yZWQsIGFkZAo+PiBhIGxpbmtlci1n
ZW5lcmF0ZWQgdW5pcXVlIGJ1aWxkIElEIHRvIGV2ZXJ5IHhlbnN0b3JlZCBidWlsZC4gQWRkCj4+
IGZ1bmN0aW9uYWxpdHkgdG8gbG9nIHRoaXMgYnVpbGQgSUQgaW50byBhIGZpbGUgdXBvbiBzZXJ2
aWNlIHN0YXJ0dXAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBh
bWF6b24uZGU+Cj4+IFJldmlld2VkLWJ5OiBNYXJ0aW4gTWF6ZWluIDxhbWF6ZWluQGFtYXpvbi5k
ZT4KPj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+
IEkgdW5kZXJzdGFuZCB0aGUgcHJvYmxlbSB5b3UncmUgdHJ5aW5nIHRvIHNvbHZlLCBidXQgd2h5
IGlzIHRoaXMKPiBhbnl0aGluZyBtb3JlIHRoYW4ganVzdCBlbmFibGluZyBidWlsZC1pZCdzIGJ5
IGRlZmF1bHQgYWNyb3NzIHRvb2xzLyA/Cj4KPiBUaGVyZSBhcmUgYWxyZWFkeSBzdGFuZGFyZCB3
YXlzIG9mIGludGVyYWN0aW5nIHdpdGggdGhlIGJ1aWxkIGlkIG9mCj4gcnVubmluZyBleGVjdXRh
YmxlcyBvbiB0aGUgc3lzdGVtLiAgSSdkIHN0cm9uZ2x5IGRpc2NvdXJhZ2UgZG9pbmcKPiBhbnl0
aGluZyBjdXN0b20gaW4geGVuc3RvcmVkIHNwZWNpZmljYWxseS4KTWF5IEkgYXNrIHdoYXQgdG9v
bGluZyB5b3Ugd291bGQgdXNlIHRvIGludGVyYWN0IHdpdGggYSBydW5uaW5nIHByb2Nlc3MnIApi
dWlsZGlkPwo+IH5BbmRyZXcKCkJqb2VybgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBH
ZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVu
ZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10
c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpV
c3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


