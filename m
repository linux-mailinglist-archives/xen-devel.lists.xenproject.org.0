Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB6ED8F02
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 13:11:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKh9N-0003kP-PV; Wed, 16 Oct 2019 11:07:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N+pu=YJ=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iKh9M-0003kK-7K
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 11:07:28 +0000
X-Inumbo-ID: 23739a0c-f005-11e9-bbab-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23739a0c-f005-11e9-bbab-bc764e2007e4;
 Wed, 16 Oct 2019 11:07:27 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9GB47jo131252;
 Wed, 16 Oct 2019 11:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=aWHhLYwSawiorx+Po3WUPkLbtnXvsVxnqtcmobZcGC8=;
 b=bJIkwwcHuHE3suC8BGZ3JOjcpOQL6l0zoXgHJGQZbQquOA5MAxRBEVpxXLMxIR5gl2wf
 BzuMl819pP84XBq4+YgEhOzRBp3RuxrT0vB7xBVd39/SlTOvR5Ely4dTNHU2SPxx6DyM
 bYpN/2EN/rogOnwUJwyiaiDrhLAGUFk2qb5ZVzbk4IUaQQCT3v5cQ+epN8llR1D3hqan
 9ylP+3KNLSiA/jAqV8TifV1xu9BIi9ZeB2MVwURUk0eVLpBVly5+zmT570h20J6NI8og
 360AuzuR4T7YcZEE0536ojYSWbstq6Tu3kAAq0ooOv0k3UP2iALuOZRBKnt5VpAYiYYP uQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2vk68up352-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 11:07:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9GB2a8w136503;
 Wed, 16 Oct 2019 11:07:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2vnxv9dsxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 11:07:03 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9GB6nED022214;
 Wed, 16 Oct 2019 11:06:55 GMT
Received: from tomti.i.net-space.pl (/10.175.219.98)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Oct 2019 11:06:48 +0000
Date: Wed, 16 Oct 2019 13:06:42 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <20191016110642.5q3bm73vi6o6gn5r@tomti.i.net-space.pl>
References: <20191009105358.32256-1-daniel.kiper@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009105358.32256-1-daniel.kiper@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9411
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=727
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910160100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9411
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=812 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910160100
Subject: Re: [Xen-devel] [PATCH v3 0/3] x86/boot: Introduce the kernel_info
 et consortes
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
Cc: jgross@suse.com, eric.snowberg@oracle.com, ard.biesheuvel@linaro.org,
 konrad.wilk@oracle.com, corbet@lwn.net, peterz@infradead.org,
 ross.philipson@oracle.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 bp@alien8.de, luto@kernel.org, hpa@zytor.com, boris.ostrovsky@oracle.com,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMTI6NTM6NTVQTSArMDIwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IEhpLAo+Cj4gRHVlIHRvIHZlcnkgbGltaXRlZCBzcGFjZSBpbiB0aGUgc2V0dXBfaGVh
ZGVyIHRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgbmV3Cj4ga2VybmVsX2luZm8gc3RydWN0
IHdoaWNoIHdpbGwgYmUgdXNlZCB0byBjb252ZXkgaW5mb3JtYXRpb24gZnJvbSB0aGUga2VybmVs
IHRvCj4gdGhlIGJvb3Rsb2FkZXIuIFRoaXMgd2F5IHRoZSBib290IHByb3RvY29sIGNhbiBiZSBl
eHRlbmRlZCByZWdhcmRsZXNzIG9mIHRoZQo+IHNldHVwX2hlYWRlciBsaW1pdGF0aW9ucy4gQWRk
aXRpb25hbGx5LCB0aGUgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgc29tZQo+IGNvbnZlbmllbmNl
IGZlYXR1cmVzIGxpa2UgdGhlIHNldHVwX2luZGlyZWN0IHN0cnVjdCBhbmQgdGhlCj4ga2VybmVs
X2luZm8uc2V0dXBfdHlwZV9tYXggZmllbGQuCj4KPiBEYW5pZWwKPgo+ICBEb2N1bWVudGF0aW9u
L3g4Ni9ib290LnJzdCAgICAgICAgICAgICB8IDE2OCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
YXJjaC94ODYvYm9vdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgYXJjaC94
ODYvYm9vdC9jb21wcmVzc2VkL01ha2VmaWxlICAgICAgfCAgIDQgKy0KPiAgYXJjaC94ODYvYm9v
dC9jb21wcmVzc2VkL2thc2xyLmMgICAgICAgfCAgMTIgKysrKysrCj4gIGFyY2gveDg2L2Jvb3Qv
Y29tcHJlc3NlZC9rZXJuZWxfaW5mby5TIHwgIDIyICsrKysrKysrKysrCj4gIGFyY2gveDg2L2Jv
b3QvaGVhZGVyLlMgICAgICAgICAgICAgICAgIHwgICAzICstCj4gIGFyY2gveDg2L2Jvb3QvdG9v
bHMvYnVpbGQuYyAgICAgICAgICAgIHwgICA1ICsrKwo+ICBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkv
YXNtL2Jvb3RwYXJhbS5oICB8ICAxNiArKysrKysrLQo+ICBhcmNoL3g4Ni9rZXJuZWwvZTgyMC5j
ICAgICAgICAgICAgICAgICB8ICAxMSArKysrKysKPiAgYXJjaC94ODYva2VybmVsL2tkZWJ1Z2Zz
LmMgICAgICAgICAgICAgfCAgMjAgKysrKysrKystLQo+ICBhcmNoL3g4Ni9rZXJuZWwva3N5c2Zz
LmMgICAgICAgICAgICAgICB8ICAzMCArKysrKysrKysrLS0tLQo+ICBhcmNoL3g4Ni9rZXJuZWwv
c2V0dXAuYyAgICAgICAgICAgICAgICB8ICAgNCArKwo+ICBhcmNoL3g4Ni9tbS9pb3JlbWFwLmMg
ICAgICAgICAgICAgICAgICB8ICAxMSArKysrKysKPiAgMTMgZmlsZXMgY2hhbmdlZCwgMjkyIGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4gRGFuaWVsIEtpcGVyICgzKToKPiAgICAg
ICB4ODYvYm9vdDogSW50cm9kdWNlIHRoZSBrZXJuZWxfaW5mbwo+ICAgICAgIHg4Ni9ib290OiBJ
bnRyb2R1Y2UgdGhlIGtlcm5lbF9pbmZvLnNldHVwX3R5cGVfbWF4Cj4gICAgICAgeDg2L2Jvb3Q6
IEludHJvZHVjZSB0aGUgc2V0dXBfaW5kaXJlY3QKCmhwYSwgcGluZz8KCkRhbmllbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
