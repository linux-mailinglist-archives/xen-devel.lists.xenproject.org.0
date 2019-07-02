Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA02F5C6FC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 04:13:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hi8Eh-0001xJ-Np; Tue, 02 Jul 2019 02:09:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5+mQ=U7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hi8Eh-0001xE-23
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 02:09:35 +0000
X-Inumbo-ID: 6ebac430-9c6e-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6ebac430-9c6e-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 02:09:33 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6228pek195172;
 Tue, 2 Jul 2019 02:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=lXB2umxm4Qxv5Jy6JF1w9qFRyfyBm2ed0ppYjC/gkXs=;
 b=czWLyvqqHGd12bl13IG+KBmPKJ1vm3zTRakmWxBDGZo3Z1HQhQY0jOpEstB0hWYp/kHi
 k9pvXt3M1bQhtqYRJO43DgFxfZfM0BnZvCXQ8Hnch78Ehc+t0G2n2+cEhEnct3PPqHVV
 JrVVK59qPNCg6S/vZY6HrsXLU0XK/nbfsuuRls9/31Bi2gdtCBxxNUjXO+rMk+fwpEot
 hBwuekxknCD/cSeIGXa8/wHUekSr28UoAi5AkqXYrSiMDqr9PyPN30cG+FYpt412fzfv
 lG73z9C8s/LG2CKYBtqTq0g8Ew8R8PalL9aXYHFUf5OCvZplWHYrk30HUuMwfxdj9EjC pQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2te61e0nbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 02:09:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6228PI0117335;
 Tue, 2 Jul 2019 02:09:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2tebku060s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 02:09:30 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6229SwQ025233;
 Tue, 2 Jul 2019 02:09:29 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 19:09:28 -0700
Date: Mon, 1 Jul 2019 22:09:51 -0400
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190702020951.GA8003@bostrovs-us.us.oracle.com>
References: <20190621184703.17108-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621184703.17108-1-jgross@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907020019
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907020020
Subject: Re: [Xen-devel] [PATCH] xen/events: fix binding user event channels
 to cpus
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDg6NDc6MDNQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBXaGVuIGJpbmRpbmcgYW4gaW50ZXJkb21haW4gZXZlbnQgY2hhbm5lbCB0byBhIHZj
cHUgdmlhCj4gSU9DVExfRVZUQ0hOX0JJTkRfSU5URVJET01BSU4gbm90IG9ubHkgdGhlIGV2ZW50
IGNoYW5uZWwgbmVlZHMgdG8gYmUKPiBib3VuZCwgYnV0IHRoZSBhZmZpbml0eSBvZiB0aGUgYXNz
b2NpYXRlZCBJUlFpIG11c3QgYmUgY2hhbmdlZCwgdG9vLgo+IE90aGVyd2lzZSB0aGUgSVJRIGFu
ZCB0aGUgZXZlbnQgY2hhbm5lbCB3b24ndCBiZSBtb3ZlZCB0byBhbm90aGVyIHZjcHUKPiBpbiBj
YXNlIHRoZSBvcmlnaW5hbCB2Y3B1IHRoZXkgd2VyZSBib3VuZCB0byBpcyBnb2luZyBvZmZsaW5l
Lgo+IAo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA0LjEzCj4gRml4ZXM6IGM0OGY2
NGFiNDcyMzg5ZGYgKCJ4ZW4tZXZ0Y2huOiBCaW5kIGR5biBldnRjaG46cWVtdS1kbSBpbnRlcnJ1
cHQgdG8gbmV4dCBvbmxpbmUgVkNQVSIpCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
