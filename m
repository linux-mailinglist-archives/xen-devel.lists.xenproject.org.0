Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901812346E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 19:08:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihHEh-0002b0-OA; Tue, 17 Dec 2019 18:06:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jRFD=2H=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ihHEg-0002au-4e
 for xen-devel@lists.xen.org; Tue, 17 Dec 2019 18:06:18 +0000
X-Inumbo-ID: eaee91a4-20f7-11ea-8f4d-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaee91a4-20f7-11ea-8f4d-12813bfff9fa;
 Tue, 17 Dec 2019 18:06:16 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBHI524Y084487;
 Tue, 17 Dec 2019 18:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=T+GnWQ1AKZOIs5s0xU8NEiourpCMeoVx+dHg7sen55I=;
 b=JMg4G6wMki8gozIoQ2/uuHN4c+yy4H4tUcA+UlWC8jpjsViVbG4qaPOMtzkO8jP98ANa
 /8nxn3LuTULapjXgOA84gf3ozbAkIAemnieRpJ59iS+0xZ+EJMxzd8q6DWXH+KdwiEm4
 HrG9aeDvN3Gk9EO2AH4OjdLpVn7wzh/AcBJeGin2dXXElLa7hjrVo91Iy/+WtA5uWGAN
 YYcmsXXp4qiQMtt93jMTYoSeCFIzj3HfUiJXsTZngyvrd/ji+fqA78viHrVECf45hUY6
 aqsCjD8N/RsVwBMIhIiTv907Ja/GOTlZmOxDmBw55MpEN8VBDG33DrWK7BtqDgD1h5R3 0w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2wvq5ugh4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 18:06:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBHI3PGR012618;
 Tue, 17 Dec 2019 18:06:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2wxm5nmcm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 18:06:10 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBHI68Gi017125;
 Tue, 17 Dec 2019 18:06:08 GMT
Received: from [10.39.197.155] (/10.39.197.155)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 17 Dec 2019 10:06:08 -0800
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Boris Ostrovsky <BORIS.OSTROVSKY@ORACLE.COM>
In-Reply-To: <20191217140804.27364-1-sergey.dyasli@citrix.com>
Date: Tue, 17 Dec 2019 13:06:05 -0500
Message-Id: <7301D02C-D33F-4205-BB32-C3E61015D26E@ORACLE.COM>
References: <20191217140804.27364-1-sergey.dyasli@citrix.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912170142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912170142
Subject: Re: [Xen-devel] [RFC PATCH 0/3] basic KASAN support for Xen PV
 domains
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, xen-devel@lists.xen.org,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 George Dunlap <george.dunlap@citrix.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIERlYyAxNywgMjAxOSwgYXQgOTowOCBBTSwgU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5
YXNsaUBjaXRyaXguY29tPiB3cm90ZToKPiAKPiBUaGlzIHNlcmllcyBhbGxvd3MgdG8gYm9vdCBh
bmQgcnVuIFhlbiBQViBrZXJuZWxzIChEb20wIGFuZCBEb21VKSB3aXRoCj4gQ09ORklHX0tBU0FO
PXkuIEl0IGhhcyBiZWVuIHVzZWQgaW50ZXJuYWxseSBmb3Igc29tZSB0aW1lIG5vdyB3aXRoIGdv
b2QKPiByZXN1bHRzIGZvciBmaW5kaW5nIG1lbW9yeSBjb3JydXB0aW9uIGlzc3VlcyBpbiBEb20w
IGtlcm5lbC4KPiAKPiBPbmx5IE91dGxpbmUgaW5zdHJ1bWVudGF0aW9uIGlzIHN1cHBvcnRlZCBh
dCB0aGUgbW9tZW50Lgo+IAo+IFBhdGNoIDEgaXMgb2YgUkZDIHF1YWxpdHkKPiBQYXRjaGVzIDIt
MyBhcmUgaW5kZXBlbmRlbnQgYW5kIHF1aXRlIHNlbGYtY29udGFpbmVkLgoKCkRvbuKAmXQgeW91
IG5lZWQgdG8gaW5pdGlhbGl6ZSBrYXNhbiBiZWZvcmUsIGZvciBleGFtcGxlLCBjYWxsaW5nIGth
c2FuX2FsbG9jX3BhZ2VzKCkgaW4gcGF0Y2ggMj8KCi1ib3JpcwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
