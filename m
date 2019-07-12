Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E223A67027
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 15:34:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlvcy-0001Iu-GC; Fri, 12 Jul 2019 13:30:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyeD=VJ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hlvcx-0001Il-55
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 13:30:19 +0000
X-Inumbo-ID: 2deadd9e-a4a9-11e9-96db-eb7d434f6c8b
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2deadd9e-a4a9-11e9-96db-eb7d434f6c8b;
 Fri, 12 Jul 2019 13:30:14 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CDTN2F065928;
 Fri, 12 Jul 2019 13:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=a6v2i4o0/d3/tu6OS7p26YjmZ0yJxxNnTxrAorw0AkI=;
 b=RdENEnth5r3rN+092WaWZ4wWZg8o34OFZgo7KFaTbIeiEZAHMAI9DGKMrN36TJx/tqpc
 m9E78XSEKKH3ubCl+hYeOA08aUKmzyJmSM6KQDGLrZZRGFy9ShKjzFbHu3fGY5ad9bLo
 xlv6f322+q0ZnGsy3yzaGJnVk607GKFywlFIIvabc1DnJqJ1f7HLaFMs8+MWeenO9n2V
 oK4bsLFvS3rVg7/zuTbtqr/kllXdtXoWzAYhvdyDX7OSRm8RUAS+2REtFZLSO7NsU9vZ
 5uVzWh3rHlyyjQgmEDoSyZo7HbuTSwhu1sz2zuGqyFbH/8CF4g2QBSy+SoJJQfmAkv1Y Tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2tjk2u5pxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 13:29:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CDS7Gv038338;
 Fri, 12 Jul 2019 13:29:51 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2tn1j255db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 13:29:51 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6CDTohJ025527;
 Fri, 12 Jul 2019 13:29:50 GMT
Received: from [10.191.19.109] (/10.191.19.109)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 12 Jul 2019 06:27:55 -0700
To: Peter Zijlstra <peterz@infradead.org>
References: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
 <20190712120626.GW3402@hirez.programming.kicks-ass.net>
 <a5f5ea4c-f30d-122e-0161-be7b1cb4877c@oracle.com>
 <20190712130916.GR3419@hirez.programming.kicks-ass.net>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <6b47b7d1-b85f-e757-50dd-1e97157fd44d@oracle.com>
Date: Fri, 12 Jul 2019 21:27:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190712130916.GR3419@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=998
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120145
Subject: Re: [Xen-devel] [PATCH v2] xen/pv: Fix a boot up hang revealed by
 int3 self test
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, srinivas.eeda@oracle.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS83LzEyIDIxOjA5LCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiBPbiBGcmksIEp1bCAx
MiwgMjAxOSBhdCAwOTowNDoyMlBNICswODAwLCBaaGVuemhvbmcgRHVhbiB3cm90ZToKPj4gT24g
MjAxOS83LzEyIDIwOjA2LCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPj4+IE9uIFRodSwgSnVsIDEx
LCAyMDE5IGF0IDA0OjE1OjIxUE0gKzA4MDAsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+Pj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX3B2LmMKPj4+PiBpbmRleCA0NzIyYmEyLi4yMTM4ZDY5IDEwMDY0NAo+Pj4+IC0tLSBh
L2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+Pj4+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxp
Z2h0ZW5fcHYuYwo+Pj4+IEBAIC01OTYsNyArNTk2LDcgQEAgc3RydWN0IHRyYXBfYXJyYXlfZW50
cnkgewo+Pj4+ICAgIHN0YXRpYyBzdHJ1Y3QgdHJhcF9hcnJheV9lbnRyeSB0cmFwX2FycmF5W10g
PSB7Cj4+Pj4gICAgCXsgZGVidWcsICAgICAgICAgICAgICAgICAgICAgICB4ZW5feGVuZGVidWcs
ICAgICAgICAgICAgICAgICAgICB0cnVlIH0sCj4+Pj4gLQl7IGludDMsICAgICAgICAgICAgICAg
ICAgICAgICAgeGVuX3hlbmludDMsICAgICAgICAgICAgICAgICAgICAgdHJ1ZSB9LAo+Pj4+ICsJ
eyBpbnQzLCAgICAgICAgICAgICAgICAgICAgICAgIHhlbl9pbnQzLCAgICAgICAgICAgICAgICAg
ICAgICAgIHRydWUgfSwKPj4+PiAgICAJeyBkb3VibGVfZmF1bHQsICAgICAgICAgICAgICAgIHhl
bl9kb3VibGVfZmF1bHQsICAgICAgICAgICAgICAgIHRydWUgfSwKPj4+PiAgICAjaWZkZWYgQ09O
RklHX1g4Nl9NQ0UKPj4+PiAgICAJeyBtYWNoaW5lX2NoZWNrLCAgICAgICAgICAgICAgIHhlbl9t
YWNoaW5lX2NoZWNrLCAgICAgICAgICAgICAgIHRydWUgfSwKPj4+IEknbSBjb25mdXNlZCBvbiB0
aGUgcHVycG9zZSBvZiB0cmFwX2FycmF5W10sIGNvdWxkIHlvdSBlbHVjaWRhdGUgbWU/Cj4+IFVz
ZWQgdG8gcmVwbGFjZSB0cmFwIGhhbmRsZXIgYWRkcmVzc2VzIGJ5IFhlbiBzcGVjaWZpYyBvbmVz
IGFuZCBzYW5pdHkgY2hlY2sKPj4KPj4gaWYgdGhlcmUncyBhbiB1bmV4cGVjdGVkIElTVC11c2lu
ZyBmYXVsdCBoYW5kbGVyLgo+IGdpdCBncmVwIHhlbl9pbnQzLCBmYWlsZWQgbWUuIFdoZXJlIGRv
ZXMgdGhhdCBzeW1ib2wgY29tZSBmcm9tPwoKR2VuZXJhdGVkIGJ5ICJ4ZW5fcHZfdHJhcCBpbnQz
IiBpbiBhcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TCgpaaGVuemhvbmcKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
