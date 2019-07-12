Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0869866FB0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 15:09:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlvFC-0007a7-V3; Fri, 12 Jul 2019 13:05:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyeD=VJ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hlvFB-0007a2-DG
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 13:05:45 +0000
X-Inumbo-ID: c1a732e6-a4a5-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c1a732e6-a4a5-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 13:05:44 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CD3atj056300;
 Fri, 12 Jul 2019 13:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=qOLg9xgYxsV/ZwUmUTuUecdlU8I8iB1a3J//G2IC8pM=;
 b=D4vBjFwWBqMlhP4bD9xc/+YOAW6pToQQXg17DMHHS5N9GHhfK2XiJjh/U3tR8CbZtUI9
 JfJS/dqiQg0sBj+AtwwCsdwq16W6I3yE7lGsIzR0bRIMccWrLEtr7cl1NLPYnbeWRjM5
 woXePH0IWOYpyXxPFHN+lJtaNCmmCCRBcEL0a1BQbowpuSwPuCPnZMw9ChGVqVWLYZtV
 gaYenpabcZg+QGJVqAD7TX//wLuxBZOjv1hQzcIMw18O2rwcYxRo4v11h1RhEa8NQsMK
 DddsIlMxJV6cXI7T3uqkn2MvGW36tNSbug3+8rfhMkOB8rTEbKdWpM2cbRbEIyT97HP2 9g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2tjm9r5g2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 13:05:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CD2qMC054568;
 Fri, 12 Jul 2019 13:05:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2tnc8u4s9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 13:05:24 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6CD5M4q010785;
 Fri, 12 Jul 2019 13:05:22 GMT
Received: from [10.191.23.138] (/10.191.23.138)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 12 Jul 2019 06:04:28 -0700
To: Peter Zijlstra <peterz@infradead.org>
References: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
 <20190712120626.GW3402@hirez.programming.kicks-ass.net>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <a5f5ea4c-f30d-122e-0161-be7b1cb4877c@oracle.com>
Date: Fri, 12 Jul 2019 21:04:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190712120626.GW3402@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120143
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

Ck9uIDIwMTkvNy8xMiAyMDowNiwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gT24gVGh1LCBKdWwg
MTEsIDIwMTkgYXQgMDQ6MTU6MjFQTSArMDgwMCwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX3B2LmMKPj4gaW5kZXggNDcyMmJhMi4uMjEzOGQ2OSAxMDA2NDQKPj4gLS0tIGEvYXJj
aC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
cHYuYwo+PiBAQCAtNTk2LDcgKzU5Niw3IEBAIHN0cnVjdCB0cmFwX2FycmF5X2VudHJ5IHsKPj4g
ICAKPj4gICBzdGF0aWMgc3RydWN0IHRyYXBfYXJyYXlfZW50cnkgdHJhcF9hcnJheVtdID0gewo+
PiAgIAl7IGRlYnVnLCAgICAgICAgICAgICAgICAgICAgICAgeGVuX3hlbmRlYnVnLCAgICAgICAg
ICAgICAgICAgICAgdHJ1ZSB9LAo+PiAtCXsgaW50MywgICAgICAgICAgICAgICAgICAgICAgICB4
ZW5feGVuaW50MywgICAgICAgICAgICAgICAgICAgICB0cnVlIH0sCj4+ICsJeyBpbnQzLCAgICAg
ICAgICAgICAgICAgICAgICAgIHhlbl9pbnQzLCAgICAgICAgICAgICAgICAgICAgICAgIHRydWUg
fSwKPj4gICAJeyBkb3VibGVfZmF1bHQsICAgICAgICAgICAgICAgIHhlbl9kb3VibGVfZmF1bHQs
ICAgICAgICAgICAgICAgIHRydWUgfSwKPj4gICAjaWZkZWYgQ09ORklHX1g4Nl9NQ0UKPj4gICAJ
eyBtYWNoaW5lX2NoZWNrLCAgICAgICAgICAgICAgIHhlbl9tYWNoaW5lX2NoZWNrLCAgICAgICAg
ICAgICAgIHRydWUgfSwKPiBJJ20gY29uZnVzZWQgb24gdGhlIHB1cnBvc2Ugb2YgdHJhcF9hcnJh
eVtdLCBjb3VsZCB5b3UgZWx1Y2lkYXRlIG1lPwoKVXNlZCB0byByZXBsYWNlIHRyYXAgaGFuZGxl
ciBhZGRyZXNzZXMgYnkgWGVuIHNwZWNpZmljIG9uZXMgYW5kIHNhbml0eSBjaGVjawoKaWYgdGhl
cmUncyBhbiB1bmV4cGVjdGVkIElTVC11c2luZyBmYXVsdCBoYW5kbGVyLgoKPgo+IFRoZSBzb2xl
IHVzZXIgc2VlbXMgdG8gYmUgZ2V0X3RyYXBfYWRkcigpIGFuZCB0aGF0IHRhbGtzIGFib3V0IElT
VHMsIGJ1dAo+ICNCUCBpc24ndCBhbiBJU1QgYW55bW9yZSwgc28gd2h5IGRvZXMgaXQgaGF2ZSBp
c3Rfb2theT10cnVlPwoKT2gsIHllcywgSSBtaXNzZWQgdGhhdCBib29sZWFuLCB0aGFua3MuIEkn
bGwgdHJ5IGlzdF9va2V5PWZhbHNlIGZvciBpbnQzIAphbmQgdGVzdCBpdCB0b21vcnJvdy4KClpo
ZW56aG9uZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
