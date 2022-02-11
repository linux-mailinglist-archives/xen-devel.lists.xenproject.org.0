Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB74B250E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270459.464765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUZe-0002WX-V1; Fri, 11 Feb 2022 11:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270459.464765; Fri, 11 Feb 2022 11:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUZe-0002Tg-RS; Fri, 11 Feb 2022 11:58:50 +0000
Received: by outflank-mailman (input) for mailman id 270459;
 Fri, 11 Feb 2022 11:58:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJSo=S2=amazon.de=prvs=034f27e45=nmanthey@srs-se1.protection.inumbo.net>)
 id 1nIUZc-0002SW-H2
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:58:48 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a291bb-8b31-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 12:58:46 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1e-0bfdb89e.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 11 Feb 2022 11:58:29 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1e-0bfdb89e.us-east-1.amazon.com (Postfix) with
 ESMTPS id 8D9BFE0116; Fri, 11 Feb 2022 11:58:26 +0000 (UTC)
Received: from [192.168.4.205] (10.43.162.202) by EX13D02EUB001.ant.amazon.com
 (10.43.166.150) with Microsoft SMTP Server (TLS) id 15.0.1497.28;
 Fri, 11 Feb 2022 11:58:23 +0000
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
X-Inumbo-ID: f6a291bb-8b31-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1644580727; x=1676116727;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=x426+bmpQfTrZ/ZTSUkxnxM4vfK12dd/uB1OPhp7Ccc=;
  b=ip/H7lqlZlEyurHvd+LiyTLUFgYjfpZ94OBwr0d+yTSUn1vxlllq3o9t
   HjQlQbK4mSHmIUAt3aXFzQmSkew385kC60ccTE/NWRw7bNfuKEdAOWUNV
   0LIP3pQ7cPzTvjxDm+3fzUpo/3ZDcOjcxBdh4RNeY/Kq8gP/ZZ/92R6my
   Y=;
X-IronPort-AV: E=Sophos;i="5.88,360,1635206400"; 
   d="scan'208";a="62347671"
Subject: Re: [PATCH CPU v1] cpuid: initialize cpuinfo with boot_cpu_data
Message-ID: <8f38f316-134c-b884-527c-7869ef6b3425@amazon.de>
Date: Fri, 11 Feb 2022 12:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20220211072327.1213-1-nmanthey@amazon.de>
 <c10ec679-258a-f983-7c5d-b9f536b7ca26@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
In-Reply-To: <c10ec679-258a-f983-7c5d-b9f536b7ca26@suse.com>
X-Originating-IP: [10.43.162.202]
X-ClientProxiedBy: EX13d09UWC003.ant.amazon.com (10.43.162.113) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMi8xMS8yMiAxMTozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMDIuMjAyMiAwODoy
MywgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1aWQuYwo+
PiArKysgYi94ZW4vYXJjaC94ODYvY3B1aWQuYwo+PiBAQCAtNjA5LDcgKzYwOSw3IEBAIHZvaWQg
X19pbml0IGluaXRfZ3Vlc3RfY3B1aWQodm9pZCkKPj4gIGJvb2wgcmVjaGVja19jcHVfZmVhdHVy
ZXModW5zaWduZWQgaW50IGNwdSkKPj4gIHsKPj4gICAgICBib29sIG9rYXkgPSB0cnVlOwo+PiAt
ICAgIHN0cnVjdCBjcHVpbmZvX3g4NiBjOwo+PiArICAgIHN0cnVjdCBjcHVpbmZvX3g4NiBjID0g
Ym9vdF9jcHVfZGF0YTsKPj4gICAgICBjb25zdCBzdHJ1Y3QgY3B1aW5mb194ODYgKmJzcCA9ICZi
b290X2NwdV9kYXRhOwo+PiAgICAgIHVuc2lnbmVkIGludCBpOwo+IFdoaWxlIEkgYWdyZWUgd2l0
aCB0aGUgbmVlZCB0byBpbml0aWFsaXplIHRoZSBsb2NhbCB2YXJpYWJsZSwgSQo+IGRvbid0IHRo
aW5rIGl0IHNob3VsZCBiZSBwcmUtc2VlZGVkIHdpdGggcHJldmlvdXMgaW5kZW50aWZpY2F0aW9u
Cj4gcmVzdWx0czogVGhpcyBjb3VsZCBlbmQgdXAgaGlkaW5nIGJ1Z3MuIEluc3RlYWQgSSdkIHNl
ZSBpdCBzaW1wbHkKPiBiZSB6ZXJvLWZpbGxlZC4KClRoYXQgd29ya3MgZm9yIG1lIGFzIHdlbGws
IEknbGwgc2VuZCBhIHJldi0yIGFjY29yZGluZ2x5LgoKTm9yYmVydAoKCgoKQW1hem9uIERldmVs
b3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdl
c2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWlu
Z2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBC
ClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


