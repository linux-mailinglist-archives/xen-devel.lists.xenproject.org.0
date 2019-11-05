Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7133CF023F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 17:06:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS1Jv-0003JV-EP; Tue, 05 Nov 2019 16:04:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7zjB=Y5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iS1Ju-0003JN-6B
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 16:04:38 +0000
X-Inumbo-ID: f70e6ac8-ffe5-11e9-b678-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f70e6ac8-ffe5-11e9-b678-bc764e2007e4;
 Tue, 05 Nov 2019 16:04:37 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA5FxDa3076337;
 Tue, 5 Nov 2019 16:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=HnuiyXyL+o/Y07bB7lFrorYtw+SorhVkj9wARIJqfkk=;
 b=BLFws5lmLJSyDGy1LeJZv22T/wdgOExwyW2XRbSQ+A3sxDQv59t5kbkN7YBl9HPxuAJF
 BVhKGryKIWkrH2qZpYvkL2QxfBNwInUYIJnyM2qvoFSnu9vcC/JgLUp0SCHR6eeAroUh
 zFbCsSRi5D0Ny1xhq6NQg9eVzDrHFnHOBHamFEY7z+Xc8FYNCv6awLCIWv1+SLU5A7oq
 McszNBn2gnGE0e/fKaWZp2dAimAAANXpxXuhc3fFKaXqwRQa65ZIO6oy6u10dkVmvfHK
 7NiLCh4RtZWh9dwhgDBPblBquWijecawL0RwtIm474ue6MneJ74cnBGLhvSJPAt/faC3 pA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2w117tykdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Nov 2019 16:03:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA5G3VE6028710;
 Tue, 5 Nov 2019 16:03:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2w333vf417-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Nov 2019 16:03:46 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA5G3NnY013682;
 Tue, 5 Nov 2019 16:03:25 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Nov 2019 08:03:23 -0800
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-10-david@redhat.com>
 <4b88ebd7-255d-4f02-a347-5a6c0f4f4ac4@oracle.com>
 <eba1a63f-c786-edc0-dc6d-2791eb034f33@redhat.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <ad0b002b-f58c-f3f2-0353-07cc0ae37645@oracle.com>
Date: Tue, 5 Nov 2019 11:06:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <eba1a63f-c786-edc0-dc6d-2791eb034f33@redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=846
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911050132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=945 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911050131
Subject: Re: [Xen-devel] [PATCH v1 09/10] mm/memory_hotplug: Don't mark
 pages PG_reserved when initializing the memmap
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Mel Gorman <mgorman@techsingularity.net>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvNS8xOSA1OjE4IEFNLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiBPbiAwNC4xMS4x
OSAyMzo0NCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAxMC8yNC8xOSA4OjA5IEFNLCBE
YXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9iYWxs
b29uLmMgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKPj4+IGluZGV4IDRmMmU3OGE1ZTRkYi4uYWY2
OWYwNTc5MTNhIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4+PiArKysg
Yi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKPj4+IEBAIC0zNzQsNiArMzc0LDEzIEBAIHN0YXRpYyB2
b2lkIHhlbl9vbmxpbmVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwKPj4+IHVuc2lnbmVkIGludCBv
cmRlcikKPj4+IMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmYmFsbG9vbl9tdXRleCk7Cj4+PiDCoMKg
wqDCoMKgIGZvciAoaSA9IDA7IGkgPCBzaXplOyBpKyspIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBwID0gcGZuX3RvX3BhZ2Uoc3RhcnRfcGZuICsgaSk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgLyoK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogVE9ETzogVGhlIGNvcmUgdXNlZCB0byBtYXJrIHRoZSBw
YWdlcyByZXNlcnZlZC4gTW9zdAo+Pj4gcHJvYmFibHkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICog
d2UgY2FuIHN0b3AgZG9pbmcgdGhhdCBub3cuIEhvd2V2ZXIsIGVzcGVjaWFsbHkKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgICogYWxsb2NfeGVuYmFsbG9vbmVkX3BhZ2VzKCkgbGVmdCBQR19yZXNlcnZl
ZCBzZXQKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICogb24gcGFnZXMgdGhhdCBjYW4gZ2V0IG1hcHBl
ZCB0byB1c2VyIHNwYWNlLgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4+ICvCoMKgwqDCoMKg
wqDCoCBfX1NldFBhZ2VSZXNlcnZlZChwKTsKPj4KPj4gSSBzdXNwZWN0IHRoaXMgaXMgbm90IG5l
ZWRlZC4gUGFnZXMgY2FuIGdldCBpbnRvIGJhbGxvb24gZWl0aGVyIGZyb20KPj4gaGVyZSBvciBm
cm9tIG5vbi1ob3RwbHVnIHBhdGggKGUuZy4gZGVjcmVhc2VfcmVzZXJ2YXRpb24oKSkgYW5kIHNv
IHdoZW4KPj4gd2UgZ2V0IGEgcGFnZSBmcm9tIHRoZSBiYWxsb29uIHdlIHdvdWxkIGdldCBhIHJh
bmRvbSBwYWdlIHRoYXQgbWF5IG9yCj4+IG1heSBub3QgaGF2ZSBSZXNlcnZlZCBiaXQgc2V0Lgo+
Cj4gWWVhaCwgSSBhbHNvIHRoaW5rIGl0IGlzIGZpbmUuIElmIHlvdSBhZ3JlZSwgSSdsbCBkcm9w
IHRoaXMgaHVuayBhbmQKPiBhZGQgZGV0YWlscyB0byB0aGUgcGF0Y2ggZGVzY3JpcHRpb24uCj4K
PgoKClllcywgbGV0J3MgZG8gdGhhdC4gVGhhbmtzLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
