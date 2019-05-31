Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867AC31084
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 16:47:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWim7-0008E0-S1; Fri, 31 May 2019 14:44:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/r8X=T7=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1hWim6-0008Du-NR
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 14:44:54 +0000
X-Inumbo-ID: a63660e7-83b2-11e9-8980-bc764e045a96
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a63660e7-83b2-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 14:44:53 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4VEiI7M135718;
 Fri, 31 May 2019 14:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding :
 subject : to : cc : from : message-id; s=corp-2018-07-02;
 bh=2Om5stwDArQ6nGqOb7I9JAkeWMfEhcwW5B4qI7FOiB0=;
 b=cLRCeCwZnlsUocnqR6QzeNTw/ws6EKRiVDGt5QG90Hn/e4KTVGWKirkrucWPvBhFQUvU
 v2Ar9cbIhR0DQteupVsa3sD9gytEUUrem5p0dvpG45c/auWqrWM9jKusfY4jekJ93mPM
 yVU3FV1gKzN4vsWQan5e9Vgx85Gd9wQA6aQQlL84DNBFSEHv9Ld/W9P34Psv3faIHBkz
 tvhl6unPvXR/vg/aPQKcZbYPdRJzzyIWTasj6fIVTo6MESGnsA1rnkdLj49ZQAll+Tj8
 yHdJnQAdKrCaso0uk8lLbIvcYujnVdOybEm18+d0Ml+IVaKBURzuOhPzyk/5UHMOzLjp 7w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 2spu7dxyqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2019 14:44:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4VEiTu6146225;
 Fri, 31 May 2019 14:44:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2su61fgc4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2019 14:44:47 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4VEiitL032333;
 Fri, 31 May 2019 14:44:44 GMT
Received: from galaxy-s9.lan (/209.6.36.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 31 May 2019 07:44:43 -0700
Date: Fri, 31 May 2019 10:44:39 -0400
User-Agent: K-9 Mail for Android
In-Reply-To: <ba37b50c-c0ac-5af4-441b-a2d4eda81255@suse.com>
References: <20190503150401.15904-1-roger.pau@citrix.com>
 <f4b944e8-6678-a921-e2b2-aaeb00c0d5e1@suse.com>
 <ba37b50c-c0ac-5af4-441b-a2d4eda81255@suse.com>
MIME-Version: 1.0
To: Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <63D28830-5450-41F5-AC6E-3D5FDE1F80B7@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9273
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905310093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9273
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905310093
Subject: Re: [Xen-devel] [PATCH] xen-blkfront: switch kcalloc to kvcalloc
 for large array allocation
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
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTWF5IDMxLCAyMDE5IDEwOjQxOjE2IEFNIEVEVCwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPk9uIDA2LzA1LzIwMTkgMTA6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4+IE9uIDAzLzA1LzIwMTkgMTc6MDQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IFRoZXJl
J3Mgbm8gcmVhc29uIHRvIHJlcXVlc3QgcGh5c2ljYWxseSBjb250aWd1b3VzIG1lbW9yeSBmb3Ig
dGhvc2UKPj4+IGFsbG9jYXRpb25zLgo+Pj4KPj4+IFJlcG9ydGVkLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AY2l0cml4LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiAKPj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPgo+SmVucywgYXJlIHlvdSBnb2luZyB0byB0a2FlIHRoaXMg
cGF0Y2ggb3Igc2hvdWxkIEkgY2FycnkgaXQgdGhyb3VnaCB0aGUKPlhlbiB0cmVlPwoKVXN1YWxs
eSBJIGVuZGVkIHVwIHBpY2tpbmcgdGhlbSAoYW5kIHRoZW4gYXNraW5nIEplbnMgdG8gZ2l0IHB1
bGwgaW50byBoaXMgYnJhbmNoKSBidXQgaWYgeW91IHdhbnQgdG8gaGFuZGxlIHRoZW0gdGhhdCB3
b3VsZCBiZSBtdWNoIGVhc2llciEKCihBbmQgaWYgc28sIHBsZWFzZSBhZGQgQWNrZWQtYnkgb24g
dGhlbSBmcm9tIG1lKS4KPgo+Cj5KdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
