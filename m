Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D9AC296
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 00:35:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6MmR-00085g-Aa; Fri, 06 Sep 2019 22:32:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8+Lr=XB=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1i6MmQ-00085b-J7
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 22:32:34 +0000
X-Inumbo-ID: 37ece657-d0f6-11e9-abfd-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37ece657-d0f6-11e9-abfd-12813bfff9fa;
 Fri, 06 Sep 2019 22:32:33 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x86MTQH6069244;
 Fri, 6 Sep 2019 22:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=UerYB1ggL6/XjQr3CgCgHjIEWFFZYBxglI2LwGsKgtk=;
 b=Ot85eYRO4thqBbbuWL69U6+FKj0lVXCYgG3m90uA1BZt/V5/i3KxACbbLULmJu89FDCj
 uxMre3KKllFy/k3HZjgu1LdKLWiDxN7a139ZoUShPX1Jh008UcGNjfXRagjcGuTRdoB4
 QqWD/ITgZyLmvEQowIEcGDzgvIbJb7gfUpXREgIq81eF79Rjzo/E20bV6IgitqnLUURj
 VeGPoAHfdldlRXWYyXdoo9LmxAzWUXPaG/GjiConxIb+X17K2ju24fto7Bg/sWkDcdv3
 Y8SwNw3f90ru/Qumh+lRdmqWXe8IuhZ6dYoTn4U2e3+RuHcHRKdRQuLZUt1VJIv2qdNn UQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2uv04f8137-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Sep 2019 22:32:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x86MTBXC121161;
 Fri, 6 Sep 2019 22:30:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2uum4hqb2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Sep 2019 22:30:28 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x86MURrW017351;
 Fri, 6 Sep 2019 22:30:27 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 06 Sep 2019 15:30:27 -0700
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
Date: Fri, 6 Sep 2019 18:30:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9372
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=961
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909060222
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9372
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909060222
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

T24gOS8zLzE5IDg6MjAgUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IElmIE1DRkcgYXJlYSBp
cyBub3QgcmVzZXJ2ZWQgaW4gRTgyMCwgWGVuIGJ5IGRlZmF1bHQgd2lsbCBkZWZlciBpdHMgdXNh
Z2UKPiB1bnRpbCBEb20wIHJlZ2lzdGVycyBpdCBleHBsaWNpdGx5IGFmdGVyIEFDUEkgcGFyc2Vy
IHJlY29nbml6ZXMgaXQgYXMKPiBhIHJlc2VydmVkIHJlc291cmNlIGluIERTRFQuIEhhdmluZyBp
dCByZXNlcnZlZCBpbiBFODIwIGlzIG5vdAo+IG1hbmRhdG9yeSBhY2NvcmRpbmcgdG8gIlBDSSBG
aXJtd2FyZSBTcGVjaWZpY2F0aW9uLCByZXYgMy4yIiAocGFyLiA0LjEuMikKPiBhbmQgZmlybXdh
cmUgaXMgZnJlZSB0byBrZWVwIGEgaG9sZSBFODIwIGluIHRoYXQgcGxhY2UuIFhlbiBkb2Vzbid0
IGtub3cKPiB3aGF0IGV4YWN0bHkgaXMgaW5zaWRlIHRoaXMgaG9sZSBzaW5jZSBpdCBsYWNrcyBm
dWxsIEFDUEkgdmlldyBvZiB0aGUKPiBwbGF0Zm9ybSB0aGVyZWZvcmUgaXQncyBwb3RlbnRpYWxs
eSBoYXJtZnVsIHRvIGFjY2VzcyBNQ0ZHIHJlZ2lvbgo+IHdpdGhvdXQgYWRkaXRpb25hbCBjaGVj
a3MgYXMgc29tZSBtYWNoaW5lcyBhcmUga25vd24gdG8gcHJvdmlkZQo+IGluY29uc2lzdGVudCBp
bmZvcm1hdGlvbiBvbiB0aGUgc2l6ZSBvZiB0aGUgcmVnaW9uLgo+Cj4gTm93IHhlbl9tY2ZnX2xh
dGUoKSBydW5zIGFmdGVyIGFjcGlfaW5pdCgpIHdoaWNoIGlzIHRvbyBsYXRlIGFzIHNvbWUgYmFz
aWMKPiBQQ0kgZW51bWVyYXRpb24gc3RhcnRzIGV4YWN0bHkgdGhlcmUuIFRyeWluZyB0byByZWdp
c3RlciBhIGRldmljZSBwcmlvcgo+IHRvIE1DRkcgcmVzZXJ2YXRpb24gY2F1c2VzIG11bHRpcGxl
IHByb2JsZW1zIHdpdGggUENJZSBleHRlbmRlZAo+IGNhcGFiaWxpdHkgaW5pdGlhbGl6YXRpb25z
IGluIFhlbiAoZS5nLiBTUi1JT1YgVkYgQkFSIHNpemluZykuIFRoZXJlIGFyZQo+IG5vIGNvbnZl
bmllbnQgaG9va3MgZm9yIHVzIHRvIHN1YnNjcmliZSB0byBzbyB0cnkgdG8gcmVnaXN0ZXIgTUNG
Rwo+IGFyZWFzIGVhcmxpZXIgdXBvbiB0aGUgZmlyc3QgaW52b2NhdGlvbiBvZiB4ZW5fYWRkX2Rl
dmljZSgpLiAKCgpXaGVyZSBpcyBNQ0ZHIHBhcnNlZD8gcGNpX2FyY2hfaW5pdCgpPwoKLWJvcmlz
CgoKPiBLZWVwIHRoZQo+IGV4aXN0aW5nIGluaXRjYWxsIGluIGNhc2UgaW5mb3JtYXRpb24gb2Yg
TUNGRyBhcmVhcyBpcyB1cGRhdGVkIGxhdGVyCj4gaW4gYWNwaV9pbml0KCkuCj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
