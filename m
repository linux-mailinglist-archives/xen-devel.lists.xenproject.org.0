Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA856178633
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 00:16:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9GjA-00040U-D1; Tue, 03 Mar 2020 23:13:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ubgH=4U=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1j9Gj9-00040P-0D
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 23:13:27 +0000
X-Inumbo-ID: 952dd966-5da4-11ea-a293-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 952dd966-5da4-11ea-a293-12813bfff9fa;
 Tue, 03 Mar 2020 23:13:25 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023N7iN8012710;
 Tue, 3 Mar 2020 23:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=2SlemBkaH65QXaEf4TZL1oysb9wUe7KgyRuvi4NMftE=;
 b=o5gJRadMhquDlhaSlYaNpefpKBZXxKnCf9oAUdtSZZ4vet+VfYguXOBhQoMRCQeK+hco
 fejBtJD+5il3tC7hhH9yWHC1IIwPiBT0pFvkjpR5QIf3cxF7h8BrGlP4vvq64QiQHI1F
 4UhbtUQqWze0JDPSschod6KUJmqZCUNHR7RGQz7/Jk+eBDDayPzDd4v+Emi3/SsVXGu/
 5tOCgrcd4JX1D+40EzxORxioUmuVmnt4siDXDmCk3jRzmjA+yrK1AFAb14k0b1JbOmwy
 UgafaKvviQLN7iQ9RNsemp9OhihFvNOJ3o1bM4JjIUTZYD5fAq6mYAwY3mxV8M4HUvRo Lg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2yffcujmjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 23:13:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023NCeqO070813;
 Tue, 3 Mar 2020 23:13:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2yg1rnkexa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 23:13:21 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 023NDJYL028875;
 Tue, 3 Mar 2020 23:13:19 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Mar 2020 15:13:19 -0800
To: Jan Beulich <jbeulich@suse.com>, Yan Yankovskyi <yyankovskyi@gmail.com>
References: <20200229223035.GA28145@kbp1-lhp-F74019>
 <fba833c4-3173-0094-b4ec-53e9f42bfb3e@suse.com>
 <20200302221826.GA18206@kbp1-lhp-F74019>
 <38739aa0-200e-fd46-ea38-c30a6aa69561@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <2c34f543-f941-10fe-24e6-08fc1a98370c@oracle.com>
Date: Tue, 3 Mar 2020 18:13:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <38739aa0-200e-fd46-ea38-c30a6aa69561@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030150
Subject: Re: [Xen-devel] [PATCH] xen: Use 'unsigned int' instead of
 'unsigned'
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzLzMvMjAgMzozMCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDIuMDMuMjAyMCAy
MzoxOCwgWWFuIFlhbmtvdnNreWkgd3JvdGU6Cj4+IE9uIE1vbiwgTWFyIDIsIDIwMjAgYXQgMTA6
MTEgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAuLi4gZXZ0Y2huX3BvcnRfdCBoZXJlIGFuZCBlbHNl
d2hlcmUuCj4+IFRoZXJlIGFyZSBzb21lIGludGVyZmFjZXMgd2l0aCBzaWduZWQgaW50IGFzIGEg
dHlwZSBmb3IgcG9ydCwgZS5nLiBpbgo+PiBpbmNsdWRlL3hlbi9ldmVudHMuaC4KPj4gU2hvdWxk
IEkgY3JlYXRlIGFkZGl0aW9uYWwgcGF0Y2ggdG8gcmVzb2x2ZSBpbmNvbnNpc3RlbmN5IHdpdGgg
ZXZ0Y2huCj4+IGludGVyZmFjZT8KPj4gT3IgeW91IHN1Z2dlc3QgY29tYmluaW5nIHRoZXNlIGNo
YW5nZXMgaW50byB0aGUgZXhpc3RpbmcgcGF0Y2g/Cj4gU2lnbmVkIDwtPiB1bnNpZ25lZCBjb252
ZXJzaW9ucyB3b3VsZCBwZXJoYXBzIGJldHRlciBnbyBpbnRvIGEKPiBzZXBhcmF0ZSBwYXRjaC4g
QnV0IG5vdGUgSSdtIG5vdCB0aGUgbWFpbnRhaW5lciBvZiB0aGlzIGNvZGUuCj4KPj4gQWxzbyBh
cyBJIHVuZGVyc3RhbmQgJ2V2dGNobicgYW5kICdwb3J0JyBhcmUgZXNzZW50aWFsbHkgdGhlIHNh
bWUKPj4gZW50aXRpZXMgZnJvbSBwZXJzcGVjdGl2ZSBvZiBsb2NhbCBkb21haW4sIHJlbGF0ZWQg
dG8gZWFjaCBvdGhlciByb3VnaGx5Cj4+IGxpa2UgY29ubmVjdGlvbiBhbmQgZmlsZSBkZXNjcmlw
dG9yIHBhaXIuIFdoYXQgZG8geW91IHRoaW5rIGFib3V0Cj4+IHJlbmFtaW5nIGFsbCAnZXZ0Y2hu
JyBhcmd1bWVudHMgYW5kIHZhcmlhYmxlcyB0byAncG9ydCc/Cj4+IEl0IHdpbGwgZWxpbWluYXRl
IGluY29uc2lzdGVuY2llcyBpbiB0aGUgY29kZSwgZm9yIGV4YW1wbGUKPj4gaW4gaW5jbHVkZS94
ZW4vaW50ZXJmYWNlL2V2ZW50X2NoYW5uZWwuaCBhbmQgaW5jbHVkZS94ZW4vZXZlbnRzLmguCj4g
SSdkIHdlbGNvbWUgdGhpcywgYnV0IHRoZSBtYWludGFpbmVycyB3aWxsIGhhdmUgdGhlIGZpbmFs
IHNheS4KClRCSCBJJ2QgcmF0aGVyIHNlZSB0aGUgdGhpbmdzIHRoYXQgSmFuIHBvaW50ZWQgdG8g
Zml4ZWQgdGhhbiByZXBsYWNpbmcKJ3Vuc2lnbmVkJyB3aXRoICd1bnNpZ25lZCBpbnQuJwoKVGhl
IGxhdHRlciBpcyBwdXJlbHkgYSBrZXJuZWwgc3R5bGUgcmVxdWlyZW1lbnQgYW5kIGlzIHR5cGlj
YWxseSBmaXhlZAp3aGVuIHRoZSBsaW5lIGlzIG1vZGlmaWVkIChpbiBmYWN0LCB3ZSBkaWQganVz
dCB0aGF0IGxhc3Qgd2VlaykuCgotYm9yaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
