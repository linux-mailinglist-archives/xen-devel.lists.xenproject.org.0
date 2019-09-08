Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F974AD13B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 01:37:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i76fx-0003zj-Gg; Sun, 08 Sep 2019 23:32:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X39F=XD=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1i76fw-0003yz-1u
 for xen-devel@lists.xenproject.org; Sun, 08 Sep 2019 23:32:56 +0000
X-Inumbo-ID: fb3aabd4-d290-11e9-b299-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb3aabd4-d290-11e9-b299-bc764e2007e4;
 Sun, 08 Sep 2019 23:32:54 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x88NUJkO184433;
 Sun, 8 Sep 2019 23:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=aivpi0wseaaqNIIvcvaGJpmTSHnnMAk5IurUdb6ttcw=;
 b=aLb2wq80BYlXCX1LZ9C2sN69vGhj+y6L7KKI4Sd4vKwIW/azJNUgvzfVPxMYmDL8PQeL
 ANdFZfRmV62UfPEWAzCSyBvKLkzj+swzLPUrDF4xVSfTsHfb+mPGmo+FO6M8rbcvxIFr
 68zGAlAk3W0tRMcmI7rrP2fTdbWQ829CV5+qFQBKDBv+OOHwe9/3upyPoaryAF1DUfm8
 Yn146XS5k1pvfPpDsqM+/uLjxuQdJ8ju/WH9sOeW82fpcGd/54ZJ20Xa9hgVVGSi3bFs
 I9Cjhl1JxsXkXHNhEzDhgUcWQv5F9pqUXmEPZXqm4nfX1oMap3gUxJ/MACe6FtZNbWJ+ oQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2uw1jk0wub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 08 Sep 2019 23:32:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x88NTBL8001884;
 Sun, 8 Sep 2019 23:30:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2uv2ky5kxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 08 Sep 2019 23:30:51 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x88NUosK014306;
 Sun, 8 Sep 2019 23:30:50 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 08 Sep 2019 16:30:50 -0700
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
Date: Sun, 8 Sep 2019 19:30:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9374
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909080260
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9374
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909080260
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS84LzE5IDU6MTEgUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIDA4LzA5LzIwMTkg
MTk6MjgsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gOS82LzE5IDc6MDAgUE0sIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMDYvMDkvMjAxOSAyMzozMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+Pj4+IFdoZXJlIGlzIE1DRkcgcGFyc2VkPyBwY2lfYXJjaF9pbml0KCk/Cj4+Pj4+
IEl0IGhhcHBlbnMgdHdpY2U6Cj4+PiAxKSBmaXJzdCB0aW1lIGVhcmx5IG9uZSBpbiBwY2lfYXJj
aF9pbml0KCkgdGhhdCBpcyBhcmNoX2luaXRjYWxsIC0gdGhhdAo+Pj4gdGltZSBwY2lfbW1jZmdf
bGlzdCB3aWxsIGJlIGZyZWVkIGltbWVkaWF0ZWx5IHRoZXJlIGJlY2F1c2UgTUNGRyBhcmVhIGlz
Cj4+PiBub3QgcmVzZXJ2ZWQgaW4gRTgyMDsKPj4+IDIpIHNlY29uZCB0aW1lIGxhdGUgb25lIGlu
IGFjcGlfaW5pdCgpIHdoaWNoIGlzIHN1YnN5c3RlbV9pbml0Y2FsbCByaWdodAo+Pj4gYmVmb3Jl
IHdoZXJlIFBDSSBlbnVtZXJhdGlvbiBzdGFydHMgLSB0aGlzIHRpbWUgQUNQSSB0YWJsZXMgd2ls
bCBiZQo+Pj4gY2hlY2tlZCBmb3IgYSByZXNlcnZlZCByZXNvdXJjZSBhbmQgcGNpX21tY2ZnX2xp
c3Qgd2lsbCBiZSBmaW5hbGx5Cj4+PiBwb3B1bGF0ZWQuCj4+Pgo+Pj4gVGhlIHByb2JsZW0gaXMg
dGhhdCBvbiBhIHN5c3RlbSB0aGF0IGRvZXNuJ3QgaGF2ZSBNQ0ZHIGFyZWEgcmVzZXJ2ZWQgaW4K
Pj4+IEU4MjAgcGNpX21tY2ZnX2xpc3QgaXMgZW1wdHkgYmVmb3JlIGFjcGlfaW5pdCgpIGFuZCBv
dXIgUENJIGhvb2tzIGFyZQo+Pj4gY2FsbGVkIGluIHRoZSBzYW1lIHBsYWNlLiBTbyBNQ0ZHIGlz
IHN0aWxsIG5vdCBpbiB1c2UgYnkgWGVuIGF0IHRoaXMKPj4+IHBvaW50IHNpbmNlIHdlIGhhdmVu
J3QgcmVhY2hlZCBvdXIgeGVuX21jZmdfbGF0ZSgpLgo+Pgo+PiBXb3VsZCBpdCBiZSBwb3NzaWJs
ZSBmb3IgdXMgdG8gcGFyc2UgTUNGRyBvdXJzZWx2ZXMgaW4gcGNpX3hlbl9pbml0KCk/IEkKPj4g
cmVhbGl6ZSB0aGF0IHdlJ2QgYmUgZG9pbmcgdGhpcyB0d2ljZSAob3IgbWF5YmUgZXZlbiB0aHJl
ZSB0aW1lcyBzaW5jZQo+PiBhcHBhcmVudGx5IGJvdGggcGNpX2FyY2hfaW5pdCgpwqAgYW5kIGFj
cGlfaW5pKCkgZG8gaXQpLgo+Pgo+IEkgZG9uJ3QgdGhpbmUgaXQgbWFrZXMgc2Vuc2U6Cj4gYSkg
aXQgbmVlZHMgdG8gYmUgZG9uZSBhZnRlciBBQ1BJIGlzIGluaXRpYWxpemVkIHNpbmNlIHdlIG5l
ZWQgdG8gcGFyc2UKPiBpdCB0byBmaWd1cmUgb3V0IHRoZSBleGFjdCByZXNlcnZlZCByZWdpb24g
LSB0aGF0J3Mgd2h5IGl0J3MgY3VycmVudGx5Cj4gZG9uZSBpbiBhY3BpX2luaXQoKSAoc2VlIGNv
bW1pdCBtZXNzYWdlIGZvciB0aGUgcmVhc29ucyB3aHkpCgpIbW0uLi4gV2Ugc2hvdWxkIGJlIGFi
bGUgdG8gcGFyc2UgQUNQSSB0YWJsZXMgYnkgdGhlIHRpbWUKcGNpX2FyY2hfaW5pdCgpIGlzIGNh
bGxlZC4gSW4gZmFjdCwgaWYgeW91IGxvb2sgYXQKcGNpX21tY2ZnX2Vhcmx5X2luaXQoKSB5b3Ug
d2lsbCBzZWUgdGhhdCBpdCBkb2VzIGp1c3QgdGhhdC4KCj4gYikgZ2l2ZW4gKGEpIHdlIGNhbm5v
dCBkbyBpdCBvdXJzZWx2ZXMgYmVmb3JlIGFjcGlfaW5pdCBhbmQgYWZ0ZXIgaXMgdG9vCj4gbGF0
ZSBhcyB3ZSdyZSBhbHJlYWR5IHBhc3QgQUNQSSBQQ0kgZW51bWVyYXRpb24KPiBjKSB3ZSdkIGhh
dmUgdG8gZG8gaXQgaW4gdGhlIHNhbWUgcGxhY2UgSSBjYWxsIHhlbl9tY2ZnX2xhdGUoKSBhbmQg
aXQnZAo+IGJlIGNvZGUgZHVwbGljYXRpb24gb2Ygd2hhdCdzIGFscmVhZHkgZG9uZSBieSB0aGUg
ZXhpc3RpbmcgY29kZS4KCgpJZiB3ZSBtYW5hZ2UgdG8gcGFyc2UgTUNGRyBvdXJzZWx2ZXMgZWFy
bHkgdGhlbiBtYXliZSB3ZSB3b24ndCBub3QgbmVlZAp4ZW5fbWNmZ19sYXRlKCk/IFdlIGNhbiBj
YWxsIFBIWVNERVZPUF9wY2lfbW1jZmdfcmVzZXJ2ZWQgcmlnaHQgYXdheS4KCi1ib3JpcwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
