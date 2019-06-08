Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A2F39B3D
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jun 2019 07:07:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZTUI-0005bN-Qt; Sat, 08 Jun 2019 05:01:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/yG=UH=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hZTUH-0005bI-RV
 for xen-devel@lists.xenproject.org; Sat, 08 Jun 2019 05:01:53 +0000
X-Inumbo-ID: 84a4bcc8-89aa-11e9-a3c6-0701fea8c579
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84a4bcc8-89aa-11e9-a3c6-0701fea8c579;
 Sat, 08 Jun 2019 05:01:47 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x584xk27074161;
 Sat, 8 Jun 2019 05:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=iekzr2MQdPk3SDaxbZ1003Sw3EsU+tQlu1SJLk3qzkE=;
 b=aA36vdZUbKpVadR8J3OuJ5awvlQML0GkP2l5izNB6IAtGdz36BY2rV+apJAvO/Mr1nfW
 5vXVJKfxSrHdj7lgPKwPdxvV8tt8HLEw5JvVomshJmPhMyILYqAhQikogWdJ6zkz7g9z
 ATAgdF8wH81scaymHxxQH1kt4Nal2TOI9jIl9/0sis4EUY1+cHdpid1gFnFIOR9a58x6
 O+HtO31TJp+AyVKYgbuHo18k+njbnyLcltlmnz+HKU/dk1AvL5vdqHEeTy1oiS4pWtvG
 L8mG25b9D5SgAh9cIRjSqXXa09AsZ7KQ1t1ULb65/kta9fMPPnKHohvZUXU7e/eb5ZoJ iQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 2t02he8c39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Jun 2019 05:01:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x58518rL118548;
 Sat, 8 Jun 2019 05:01:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2t024t2sj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Jun 2019 05:01:44 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5851hDF029132;
 Sat, 8 Jun 2019 05:01:43 GMT
Received: from [192.168.0.110] (/70.36.60.91)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 Jun 2019 22:01:42 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-7-ankur.a.arora@oracle.com>
 <97d41abd-3717-1f78-4d5e-dfa74261e9c7@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <71126f1a-ad50-cf4e-2cc8-5a778a7ecbb4@oracle.com>
Date: Fri, 7 Jun 2019 22:01:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <97d41abd-3717-1f78-4d5e-dfa74261e9c7@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906080037
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906080037
Subject: Re: [Xen-devel] [RFC PATCH 06/16] x86/xen: add shared_info support
 to xenhost_t
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wNi0wNyA4OjA4IGEubS4sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDkuMDUu
MTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+PiBIWVBFUlZJU09SX3NoYXJlZF9pbmZvIGlz
IHVzZWQgZm9yIGlycS9ldnRjaG4gY29tbXVuaWNhdGlvbiBiZXR3ZWVuIHRoZQo+PiBndWVzdCBh
bmQgdGhlIGhvc3QuIEFic3RyYWN0IG91dCB0aGUgc2V0dXAvcmVzZXQgaW4geGVuaG9zdF90IHN1
Y2ggdGhhdAo+PiBuZXN0ZWQgY29uZmlndXJhdGlvbnMgY2FuIHVzZSBib3RoIHhlbmhvc3RzIHNp
bXVsdGFuZW91c2x5Lgo+IAo+IEkgaGF2ZSBtaXhlZCBmZWVsaW5ncyBhYm91dCB0aGlzIHBhdGNo
LiBNb3N0IG9mIHRoZSBzaGFyZWRfaW5mbyBzdHVmZiB3ZQo+IGRvbid0IG5lZWQgZm9yIHRoZSBu
ZXN0ZWQgY2FzZS4gSW4gdGhlIGVuZCBvbmx5IHRoZSBldmVudCBjaGFubmVscyBtaWdodAo+IGJl
IGludGVyZXN0aW5nLCBidXQgd2Ugb2J2aW91c2x5IHdhbnQgdGhlbSBub3QgZm9yIGFsbCB2Y3B1
cyBvZiB0aGUgTDEKPiBoeXBlcnZpc29yLCBidXQgZm9yIHRob3NlIG9mIHRoZSBjdXJyZW50IGd1
ZXN0LgpBZ3JlZWQgYWJvdXQgdGhlIG1peGVkIGZlZWxpbmdzIHBhcnQuIHNoYXJlZF9pbmZvIGRv
ZXMgZmVlbCBmYXIgdG9vCmhlYXZ5IHRvIGRyYWcgYWxvbmcganVzdCBmb3IgdGhlIGV2ZW50LWNo
YW5uZWwgc3RhdGUuCkluZmFjdCwgb24gdGhpbmtpbmcgYSBiaXQgbW9yZSwgYSBiZXR0ZXIgYWJz
dHJhY3Rpb24gZm9yIG5lc3RlZApldmVudC1jaGFubmVscyB3b3VsZCBoYXZlIGJlZW4gYXMgYW4g
ZXh0ZW5zaW9uIHRvIHRoZSBwcmltYXJ5Cnhlbmhvc3QncyBldmVudC1jaGFubmVsIGJpdHMuCihU
aGUgbmVzdGVkIHVwY2FsbHMgYWxzbyBnbyB2aWEgdGhlIHByaW1hcnkgeGVuaG9zdCBpbiBwYXRj
aC04LikKCkFua3VyCgo+IAo+IFNvIEkgdGhpbmsganVzdCBkcm9wIHRoYXQgcGF0Y2ggZm9yIG5v
dy4gV2UgY2FuIGRpZyBpdCBvdXQgbGF0ZXIgaW4gY2FzZSA+IG5lc3Rpbmcgd2FudHMgaXQgYWdh
aW4uCj4gCj4gCj4gSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
