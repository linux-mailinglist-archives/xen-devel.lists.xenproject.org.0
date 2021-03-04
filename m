Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E1132D5B9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 15:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93321.176147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpRQ-0001Uq-7o; Thu, 04 Mar 2021 14:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93321.176147; Thu, 04 Mar 2021 14:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpRQ-0001UR-4j; Thu, 04 Mar 2021 14:59:04 +0000
Received: by outflank-mailman (input) for mailman id 93321;
 Thu, 04 Mar 2021 14:59:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVVa=IC=amazon.de=prvs=69029ac7a=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lHpRO-0001UM-TV
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:59:02 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2722c3cc-e878-4004-96de-abc9702d16de;
 Thu, 04 Mar 2021 14:59:01 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 04 Mar 2021 14:58:50 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6F722A02DD; Thu,  4 Mar 2021 14:58:48 +0000 (UTC)
Received: from u6fc700a6f3c650.ant.amazon.com (10.43.162.118) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 4 Mar 2021 14:58:44 +0000
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
X-Inumbo-ID: 2722c3cc-e878-4004-96de-abc9702d16de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614869942; x=1646405942;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=Gye21up+a473ZZF07bM1W7OMnqVri8uunRmrXLB55W0=;
  b=EmjTfA//82ojjtMnd9bUjk7nNgnWXzP4/LLK24AFcQpQTaLej1Vd+aPI
   MBapYjrMSnkxNqEaY5yb5h1ej7OfHUu8P5GZbHl2O8XnUeJid9xJEpmR4
   4H7g1DcM72A3hY4g3ppUjMcpJWvDYVlBF1ViPswwAUQU3Au3JjgUzQgSk
   c=;
X-IronPort-AV: E=Sophos;i="5.81,222,1610409600"; 
   d="scan'208";a="94242996"
Subject: Re: [PATCH XENSTORE v1 09/10] xs: handle daemon socket error
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <20210226144144.9252-10-nmanthey@amazon.de>
 <24639.46501.489245.30690@mariner.uk.xensource.com>
From: Norbert Manthey <nmanthey@amazon.de>
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <99bc1eef-7e1f-39b4-f0b7-59b6f52185aa@amazon.de>
Date: Thu, 4 Mar 2021 15:58:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24639.46501.489245.30690@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.43.162.118]
X-ClientProxiedBy: EX13D10UWB003.ant.amazon.com (10.43.161.106) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Content-Transfer-Encoding: base64

T24gMy8zLzIxIDU6MTMgUE0sIElhbiBKYWNrc29uIHdyb3RlOgo+IENBVVRJT046IFRoaXMgZW1h
aWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUg
c2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4KPgo+Cj4gTm9yYmVydCBNYW50
aGV5IHdyaXRlcyAoIltQQVRDSCBYRU5TVE9SRSB2MSAwOS8xMF0geHM6IGhhbmRsZSBkYWVtb24g
c29ja2V0IGVycm9yIik6Cj4+IFdoZW4gc3RhcnRpbmcgdGhlIGRhZW1vbiwgd2UgbWlnaHQgc2Vl
IGEgTlVMTCBwb2ludGVyIGluc3RlYWQgb2YgdGhlCj4+IHBhdGggdG8gdGhlIHNvY2tldC4KVGhp
cyBmaXJzdCBzZW50ZW5jZSBjb3VsZCBiZSBtb3JlIHNwZWNpZmljLCBpLmUuOgoKV2hlbiBjb25u
ZWN0aW5nIHRvIHRoZSBkZWFtb24gaW4geHNfb3BlbiwgdGhlIGZ1bmN0aW9ucyB0aGF0IHJldHVy
biB0aGUKc29ja2V0IG9yIGRldmljZSBsb2NhdGlvbiBtaWdodCByZXR1cm4gTlVMTCBpbiBjb3Ju
ZXIgY2FzZXMuCj4+Cj4+IE9ubHkgcmVsZXZhbnQgaW4gY2FzZSB3ZSBzdGFydCB0aGUgcHJvY2Vz
cyBpbiBhIHZlcnkgZGVlcCBkaXJlY3RvcnkKPj4gcGF0aCwgd2l0aCBhIGxlbmd0aCBjbG9zZSB0
byA0MDk2IHNvIHRoYXQgYXBwZW5kaW5nICIvc29ja2V0IiB3b3VsZAo+PiBleGNlZWQgdGhlIGxp
bWl0LiBIZW5jZSwgc3VjaCBhbiBlcnJvciBpcyB1bmxpa2VseSwgYnV0IHNob3VsZCBzdGlsbCBi
ZQo+PiBmaXhlZCB0byBub3QgcmVzdWx0IGluIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgo+
IFRoaXMgZGVzY3JpcHRpb24gdGFsa3MgYWJvdXQgc3RhcnRpbmcgdGhlIGRhZW1vbiAuLi4KPgo+
PiAtLS0KPj4gIHRvb2xzL2xpYnMvc3RvcmUveHMuYyB8IDMgKysrCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4gQnV0IEkgdGhpbmsgLi4uCj4KPj4gKyAgICAgaWYgKCFjb25u
ZWN0X3RvKQo+PiArICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+PiArCj4gLi4uIHRoaXMgaXMg
Y2xpZW50IGNvZGUgPwoKVGhpcyBpcyBjbGllbnQgY29kZSwgeWVzLiBUaGUgcGF0Y2hlZCAnZ2V0
X2hhbmRsZScgZnVuY3Rpb24gcmVjZWl2ZXMgdGhlCnBhcmFtZXRlciAnY29ubmVjdF90bycgaW4g
dGhlIGZ1bmN0aW9uIHhzX29wZW4uIFRoZXJlLCB0aGUgdmFsdWUgb2YgdGhlCmZ1bmN0aW9ucyAn
eHNfZGVhbW9uX3NvY2tldF9ybycsICd4c19kZWFtb25fc29ja2V0JyBhbmQgJ3hzX2RvbWFpbl9k
ZXYnCmFyZSBwYXNzZWQgdG8gdGhpcyBmdW5jdGlvbiwgd2l0aG91dCBjaGVja2luZyBmb3IgdGhl
IHZhbHVlIE5VTEwuCgpJIGFncmVlIHRoYXQgdGhlIGRlc2NyaXB0aW9uIG1pZ2h0IGJlIGNvbmZ1
c2luZywgYXMgdGhlIGZpeCBpcyBhcHBsaWVkCnRvIGEgZnVuY3Rpb24gdGhhdCBkb2VzIG5vdCBj
YXVzZSB0aGUgYWN0dWFsIHByb2JsZW0uIEhvdyBhYm91dApyZXBocmFzaW5nIHRoZSBmaXJzdCBw
YXJ0IG9mIHRoZSBjb21taXQgbWVzc2FnZSB0byB0aGUgYWJvdmUgcHJvcG9zYWw/CgpCZXN0LApO
b3JiZXJ0Cgo+Cj4gQXBvbG9naWVzIGlmIEkgYW0gY29uZnVzZWQuCj4KPiBJYW4uCgoKCgpBbWF6
b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBC
ZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBX
ZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIg
MTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


