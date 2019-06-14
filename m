Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1F6455E9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbgVv-0003LX-Td; Fri, 14 Jun 2019 07:20:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2whC=UN=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hbgVu-0003LS-08
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 07:20:42 +0000
X-Inumbo-ID: e7bdc2a4-8e74-11e9-875e-8bd183a4250e
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7bdc2a4-8e74-11e9-875e-8bd183a4250e;
 Fri, 14 Jun 2019 07:20:37 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5E7JgB6173884;
 Fri, 14 Jun 2019 07:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=9I+ncWkor52T8oCqNraH/iCCFApD8a7mN8UnT5aGO8M=;
 b=RRkaeU9j0O98lbjPYTOH+b76Maf+K81uyZU0mEUY4asywOt34hhuN4tTIDJSbluz/Ogb
 /OHnWnoJcOjiDae81LQXmADxO03SQugEnn3OSu8jhy2x+admu/AOOwwfwtOwQRu+tL8x
 MIkijUVBtxGGLOFYLLU4UeQasNrSPcngxD+bkalmN0utbDJQiGYUAlCxqq5Rmr0bjQwC
 JKCQLz+lGQV6SMyJoZsg5i+0YpoSj5sd8UP8eTNwQVDABN0hjTWnuBloGOt+yPVvXOfi
 kx6Qlr3x+SLbL4IBYXRsmqsDL1be6KnIr9U7y0i8L7u2xcB/2x02ypYhqFbQBzSLr/6y VQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2t05nr5mrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 07:20:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5E7JejA190190;
 Fri, 14 Jun 2019 07:20:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2t024vy053-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 07:20:33 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5E7KVaU023497;
 Fri, 14 Jun 2019 07:20:31 GMT
Received: from [10.159.225.204] (/10.159.225.204)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 Jun 2019 00:20:30 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-5-ankur.a.arora@oracle.com>
 <11f8b620-11ac-7075-019a-30d6bad7583c@citrix.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <fbfc0a0c-3707-7f17-9f2a-6c9d2c7b05b1@oracle.com>
Date: Fri, 14 Jun 2019 00:20:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <11f8b620-11ac-7075-019a-30d6bad7583c@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906140057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906140058
Subject: Re: [Xen-devel] [RFC PATCH 04/16] x86/xen: hypercall support for
 xenhost_t
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
Cc: jgross@suse.com, sstabellini@kernel.org, konrad.wilk@oracle.com,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com, joao.m.martins@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wNi0xMiAyOjE1IHAubS4sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDkvMDUv
MjAxOSAxODoyNSwgQW5rdXIgQXJvcmEgd3JvdGU6Cj4+IEFsbG93IGZvciBkaWZmZXJlbnQgaHlw
ZXJjYWxsIGltcGxlbWVudGF0aW9ucyBmb3IgZGlmZmVyZW50IHhlbmhvc3QgdHlwZXMuCj4+IE5l
c3RlZCB4ZW5ob3N0LCB3aGljaCBoYXMgdHdvIHVuZGVybHlpbmcgeGVuaG9zdHMsIGNhbiB1c2Ug
Ym90aAo+PiBzaW11bHRhbmVvdXNseS4KPj4KPj4gVGhlIGh5cGVyY2FsbCBtYWNyb3MgKEhZUEVS
VklTT1JfKikgaW1wbGljaXRseSB1c2UgdGhlIGRlZmF1bHQgeGVuaG9zdC54Cj4+IEEgbmV3IG1h
Y3JvIChoeXBlcnZpc29yXyopIHRha2VzIHhlbmhvc3RfdCAqIGFzIGEgcGFyYW1ldGVyIGFuZCBk
b2VzIHRoZQo+PiByaWdodCB0aGluZy4KPj4KPj4gVE9ETzoKPj4gICAgLSBNdWx0aWNhbGxzIGZv
ciBub3cgYXNzdW1lIHRoZSBkZWZhdWx0IHhlbmhvc3QKPj4gICAgLSB4ZW5faHlwZXJjYWxsXyog
c3ltYm9scyBhcmUgb25seSBnZW5lcmF0ZWQgZm9yIHRoZSBkZWZhdWx0IHhlbmhvc3QuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEFua3VyIEFyb3JhIDxhbmt1ci5hLmFyb3JhQG9yYWNsZS5jb20+Cj4g
Cj4gQWdhaW4sIHdoYXQgaXMgdGhlIGh5cGVydmlzb3IgbmVzdGluZyBhbmQvb3IgZ3Vlc3QgbGF5
b3V0IGhlcmU/ClR3byBoeXBlcnZpc29ycywgTDAgYW5kIEwxLCBhbmQgdGhlIGd1ZXN0IGlzIGEg
Y2hpbGQgb2YgdGhlIEwxCmh5cGVydmlzb3IgYnV0IGNvdWxkIGhhdmUgUFYgZGV2aWNlcyBhdHRh
Y2hlZCB0byBib3RoIEwwIGFuZCBMMQpoeXBlcnZpc29ycy4KCj4gCj4gSSBjYW4ndCB0aGluayBv
ZiBhbnkgY2FzZSB3aGVyZSBhIHNpbmdsZSBwaWVjZSBvZiBzb2Z0d2FyZSBjYW4KPiBsZWdpdGlt
YXRlbHkgaGF2ZSB0d28gaHlwZXJjYWxsIHBhZ2VzLCBiZWNhdXNlIGlmIGl0IGhhcyBvbmUgd29y
a2luZwo+IG9uZSwgaXQgaXMgYnkgZGVmaW5pdGlvbiBhIGd1ZXN0LCBhbmQgdGhlcmVmb3JlIG5v
dCBwcml2aWxlZ2VkIGVub3VnaCB0bwo+IHVzZSB0aGUgb3V0ZXIgb25lLgpEZXBlbmRpbmcgb24g
d2hpY2ggaHlwZXJjYWxsIHBhZ2UgaXMgdXNlZCwgdGhlIGh5cGVyY2FsbCB3b3VsZAooZXZlbnR1
YWxseSkgbGFuZCBpbiB0aGUgY29ycmVzcG9uZGluZyBoeXBlcnZpc29yLgoKSnVlcmdlbiBlbHNl
d2hlcmUgcG9pbnRlZCBvdXQgcHJveHlpbmcgaHlwZXJjYWxscyBpcyBhIGJldHRlciBhcHByb2Fj
aCwKc28gSSdtIG5vdCByZWFsbHkgY29uc2lkZXJpbmcgdGhpcyBhbnkgbW9yZSBidXQsIGdpdmVu
IHRoaXMgbGF5b3V0LCBhbmQKYXNzdW1pbmcgdGhhdCB0aGUgaHlwZXJjYWxsIHBhZ2VzIGNvdWxk
IGJlIGVuY29kZWQgZGlmZmVyZW50bHkgd291bGQgaXQKc3RpbGwgbm90IHdvcms/CgpBbmt1cgoK
PiAKPiB+QW5kcmV3Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
