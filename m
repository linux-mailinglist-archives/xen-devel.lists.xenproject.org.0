Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74196D47D1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 20:46:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIzqr-0001Al-2n; Fri, 11 Oct 2019 18:41:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aTTN=YE=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iIzqp-0001Ag-GB
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 18:41:19 +0000
X-Inumbo-ID: b673f9a8-ec56-11e9-8aca-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b673f9a8-ec56-11e9-8aca-bc764e2007e4;
 Fri, 11 Oct 2019 18:41:18 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BIdaJ8049496;
 Fri, 11 Oct 2019 18:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=q+1C5Mtn23BF1SUx+RWPFEV8zs3fXl/8LqWIqbp/bIE=;
 b=YmT7Pvemj9GSVzgF5YKzbCzsXUu1HgLCCz70z9IZ2m02RqMz1f8TliBIZCc72vV9r8wY
 k37BxKQ2NxjvwM5Rdn3fvbahdL4o45zl3V2txJaXhg/8tC720bmu95RDsUG2khp1ASXj
 ZtBQJUJH/7vLM0Q0/68B1DCDBkwzpupKR3gGbwvaVjLEHWAbHRU31FEZ+ylaaRuf/JBM
 R3kKU4v7F0ESTudEzAXcexQtH3H11szLvmh8FOVJhsI6vAp/cwu/Is+97tVY7yLcR/Mz
 G7djLQ730xW0Ec1uAcEZ3i2CMKsxxzH7WgZqGvcSN4LDCGfCAajfMqiiOMcfL/cVRWaD wQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2vekts35vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 18:40:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BIc9m3173341;
 Fri, 11 Oct 2019 18:40:42 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2vje2yhmns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 18:40:41 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9BIeeLN002646;
 Fri, 11 Oct 2019 18:40:40 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Oct 2019 18:40:39 +0000
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 0061F6A00F3; Fri, 11 Oct 2019 14:43:57 -0400 (EDT)
Date: Fri, 11 Oct 2019 14:43:57 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20191011184357.GI691@char.us.oracle.com>
References: <20191009105358.32256-1-daniel.kiper@oracle.com>
 <20191009105358.32256-2-daniel.kiper@oracle.com>
 <181249b6-5833-6f29-7d38-6dacc3f8ee62@infradead.org>
 <20191010094349.la3sjiuiikmegjck@tomti.i.net-space.pl>
 <cb5bcff5-e787-82c4-790d-71695291d552@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb5bcff5-e787-82c4-790d-71695291d552@infradead.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9407
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=985
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910110156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9407
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910110156
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/boot: Introduce the kernel_info
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
Cc: jgross@suse.com, corbet@lwn.net, linux-efi@vger.kernel.org, hpa@zytor.com,
 ard.biesheuvel@linaro.org, peterz@infradead.org, ross.philipson@oracle.com,
 Daniel Kiper <daniel.kiper@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com,
 bp@alien8.de, luto@kernel.org, eric.snowberg@oracle.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+Pj4gK2JlIHByZWZpeGVkIHdpdGggaGVhZGVyL21hZ2ljIGFuZCBpdHMgc2l6ZSwgZS5nLjoK
PiA+Pj4gKwo+ID4+PiArICBrZXJuZWxfaW5mbzoKPiA+Pj4gKyAgICAgICAgICAuYXNjaWkgICJM
VG9QIiAgICAgICAgICAvKiBIZWFkZXIsIExpbnV4IHRvcCAoc3RydWN0dXJlKS4gKi8KPiA+Pj4g
KyAgICAgICAgICAubG9uZyAgIGtlcm5lbF9pbmZvX3Zhcl9sZW5fZGF0YSAtIGtlcm5lbF9pbmZv
Cj4gPj4+ICsgICAgICAgICAgLmxvbmcgICBrZXJuZWxfaW5mb19lbmQgLSBrZXJuZWxfaW5mbwo+
ID4+PiArICAgICAgICAgIC5sb25nICAgMHgwMTIzNDU2NyAgICAgIC8qIFNvbWUgZml4ZWQgc2l6
ZSBkYXRhIGZvciB0aGUgYm9vdGxvYWRlcnMuICovCj4gPj4+ICsgIGtlcm5lbF9pbmZvX3Zhcl9s
ZW5fZGF0YToKPiA+Pj4gKyAgZXhhbXBsZV9zdHJ1Y3Q6ICAgICAgICAgICAgICAgICAvKiBTb21l
IHZhcmlhYmxlIHNpemUgZGF0YSBmb3IgdGhlIGJvb3Rsb2FkZXJzLiAqLwo+ID4+PiArICAgICAg
ICAgIC5hc2NpaSAgIkVzVFQiICAgICAgICAgIC8qIEhlYWRlci9NYWdpYy4gKi8KPiA+Pj4gKyAg
ICAgICAgICAubG9uZyAgIGV4YW1wbGVfc3RydWN0X2VuZCAtIGV4YW1wbGVfc3RydWN0Cj4gPj4+
ICsgICAgICAgICAgLmFzY2lpICAiU3RydWN0Igo+ID4+PiArICAgICAgICAgIC5sb25nICAgMHg4
OTAxMjM0NQo+ID4+PiArICBleGFtcGxlX3N0cnVjdF9lbmQ6Cj4gPj4+ICsgIGV4YW1wbGVfc3Ry
aW5nczogICAgICAgICAgICAgICAgLyogU29tZSB2YXJpYWJsZSBzaXplIGRhdGEgZm9yIHRoZSBi
b290bG9hZGVycy4gKi8KPiA+Pj4gKyAgICAgICAgICAuYXNjaWkgICJFc1RzIiAgICAgICAgICAv
KiBIZWFkZXIvTWFnaWMuICovCj4gPj4KPiA+PiBXaGVyZSBkbyB0aGUgTWFnaWMgdmFsdWVzICJF
c1RUIiBhbmQgIkVzVHMiIGNvbWUgZnJvbT8KPiA+PiB3aGVyZSBhcmUgdGhleSBkZWZpbmVkPwo+
ID4gCj4gPiBFc1RUID09IEV4YW1wbGUgU1RydWNUCj4gPiBFc1RzID09IEV4YW1wbGUgU1RyaW5n
Uwo+ID4gCj4gPiBBbnl3YXksIGl0IGNhbiBiZSBhbnl0aGluZyB3aGljaCBkb2VzIG5vdCBjb2xs
aWRlIHdpdGggZXhpc3RpbmcgdmFyaWFibGUKPiA+IGxlbmd0aCBkYXRhIG1hZ2ljcy4gVGhlcmUg
YXJlIG5vbmUgcmlnaHQgbm93LiBTbywgaXQgY2FuIGJlIGFueXRoaW5nLgo+ID4gTWF5YmUgSSBz
aG91bGQgYWRkIHNvbWV0aGluZyBzYXlpbmcgdGhhdC4KPiAKPiBZZXMsIHBsZWFzZS4KCk9yIG1h
a2UgaXQgdmVyeSBjbGVhciB0aGV5IGFyZSBleGFtcGxlcywgc2F5cyAiMTIzNCIgb3IgIkFCQ0Qi
IG9yIHN1Y2guCgo+IAo+IHRoYW5rcy4KPiAtLSAKPiB+UmFuZHkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
