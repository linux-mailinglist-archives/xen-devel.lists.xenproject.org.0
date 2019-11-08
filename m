Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C43F4D64
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 14:42:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT4Ul-0005oU-TG; Fri, 08 Nov 2019 13:40:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U++q=ZA=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iT4Uk-0005oP-JG
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 13:40:10 +0000
X-Inumbo-ID: 48049eea-022d-11ea-b678-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48049eea-022d-11ea-b678-bc764e2007e4;
 Fri, 08 Nov 2019 13:40:09 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA8DdJBp173349;
 Fri, 8 Nov 2019 13:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=EN/SCcok43dz7bv91DbkS1Cf4aZc0oMNFHRA92kmMBk=;
 b=ec4plKZTwIJ70M53HTN2vrxpUQlTbWawXoH78zVVd7xv5KQHBovO01FBfvfhKCO2AuBL
 lvaVz/WsLyiMxLpK5y7s975OQslHJ9J038te/d0cV4XdALBup9k5ijXMCuajcMfoa7zW
 5G2pGqtQ9OTKVkZ2ykc1n82NP1VSxjeEKu30lnjkgqE0bCjo/B3AQdahiaIuCMo4cxGP
 hNTC+IfUni0MlRqR1nfMuwWQ45BLaEI+D8LgiFlKr1oUvE9KaFd0v+TBZFjolQ4VQisP
 UHZb7jGUk3MiRKTReK1k6UrngUQ6wHvCpkV6KydGbO6dpxETtlR3pyK+OLKaoyvon4A7 +g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2w41w15b8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 13:39:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA8DdBFa108201;
 Fri, 8 Nov 2019 13:39:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2w41whtvpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 13:39:45 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA8DddH7017631;
 Fri, 8 Nov 2019 13:39:39 GMT
Received: from tomti.i.net-space.pl (/10.175.202.125)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 Nov 2019 05:39:38 -0800
Date: Fri, 8 Nov 2019 14:39:31 +0100
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Borislav Petkov <bp@alien8.de>
Message-ID: <20191108133931.ah2an7o4wqqax6fj@tomti.i.net-space.pl>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
 <20191104151354.28145-3-daniel.kiper@oracle.com>
 <20191108100930.GA4503@zn.tnic>
 <20191108104702.vwfmvehbeuza4j5w@tomti.i.net-space.pl>
 <20191108110703.GB4503@zn.tnic>
 <20191108125248.drmm7xakn7t7oyul@tomti.i.net-space.pl>
 <20191108130338.GD4503@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108130338.GD4503@zn.tnic>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=891
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911080136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=969 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911080136
Subject: Re: [Xen-devel] [PATCH v5 2/3] x86/boot: Introduce the
 kernel_info.setup_type_max
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, corbet@lwn.net, linux-efi@vger.kernel.org,
 tglx@linutronix.de, konrad.wilk@oracle.com, ard.biesheuvel@linaro.org,
 peterz@infradead.org, ross.philipson@oracle.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, eric.snowberg@oracle.com, mingo@redhat.com,
 dave.hansen@linux.intel.com, rdunlap@infradead.org, luto@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDI6MDM6MzhQTSArMDEwMCwgQm9yaXNsYXYgUGV0a292
IHdyb3RlOgo+IE9uIEZyaSwgTm92IDA4LCAyMDE5IGF0IDAxOjUyOjQ4UE0gKzAxMDAsIERhbmll
bCBLaXBlciB3cm90ZToKPiA+IE9LLCBnb3QgeW91ciBjb21tZW50cy4gSSB3aWxsIHJlcG9zdCB0
aGUgcGF0Y2ggc2VyaWVzIHByb2JhYmx5IG9uIFR1ZXNkYXkuCj4gPiBJIGhvcGUgdGhhdCBpdCB3
aWxsIGxhbmQgaW4gNS41IHRoZW4uCj4KPiBJIGRvbid0IHNlZSB3aHkgbm90IGlmIHlvdSBiYXNl
IGl0IG9udG9wIG9mIHRpcDp4ODYvYm9vdCBhbmQgdGVzdCBpdAo+IHByb3Blcmx5IGJlZm9yZSBz
ZW5kaW5nLgoKR3JlYXQhCgo+IE91dCBvZiBjdXJpb3NpdHksIGlzIHRoZXJlIGFueSBwYXJ0aWN1
bGFyIHJlYXNvbiB0aGlzIHNob3VsZCBiZSBpbiA1LjU/CgpKdXN0IHdhbnQgdG8gaGF2ZSBpdCBk
b25lLi4uIDotKSkpIC4uLmFuZCBjb250aW51ZSB3b3JrIG9uIHN0dWZmIHdoaWNoCmRlcGVuZHMg
b24gaXQuCgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
