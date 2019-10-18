Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EEDDC74A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 16:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLT98-0001XS-Bb; Fri, 18 Oct 2019 14:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y6N8=YL=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iLT97-0001XN-FD
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 14:22:25 +0000
X-Inumbo-ID: ae1a887e-f1b2-11e9-93f5-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae1a887e-f1b2-11e9-93f5-12813bfff9fa;
 Fri, 18 Oct 2019 14:22:14 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9IEJLgx133876;
 Fri, 18 Oct 2019 14:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=sWUDKJfHL37d5TId9X/RSkc2ibEswo39mxGKIv5mcOI=;
 b=Puw9ZYa3XS4prHb8b8mPjVd44d3E5+UHdsCwSsL5QuJ9sXG2VoYUf4EjDBVsF2AqrkWx
 ue7LVR1riENqKpk2nda2yoIMkWw4QEEX3fmjNe3NstpPp6Jdq+Oeyecj/ctKKsu4fg/O
 SX/lWZWWbx6524Y94NjYG/MdyrF+rJ9KACYPEdjK0sAoGGrBE0Sz6BesevUK8AoXim4N
 YvpkOL2pIxpjop1ijqcBMgMyJ+S8ZWmDsS2OuygCKqFRDcrtKCf9PFPTZWShh76cIgrX
 ns7Ckrf+9VJpxP/g36h0IBy3ROYXwCnP0gNEswsqNajmfr1CkjCUPEML/u9rnD1XvJyD NA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2vq0q4c8wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Oct 2019 14:22:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9IEIUtr060141;
 Fri, 18 Oct 2019 14:22:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2vq0ee6dtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Oct 2019 14:22:02 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9IELxw9016396;
 Fri, 18 Oct 2019 14:22:00 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 18 Oct 2019 14:21:59 +0000
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 955AC6A0116; Fri, 18 Oct 2019 10:25:18 -0400 (EDT)
Date: Fri, 18 Oct 2019 10:25:18 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, jgross@suse.com
Message-ID: <20191018142518.GA6040@char.us.oracle.com>
References: <20190928151305.127380-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190928151305.127380-1-wipawel@amazon.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9414
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910180134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9414
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910180134
Subject: Re: [Xen-devel] [PATCH v4 00/12] livepatch: new features and fixes
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
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBTZXAgMjgsIDIwMTkgYXQgMDM6MTI6NTNQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBuZXcgZmVhdHVyZXMgdG8gdGhl
IGxpdmVwYXRjaCBmdW5jdGlvbmFsaXR5IGFzCj4gYnJpZWZseSBkaXNjdXNzZWQgZHVyaW5nIFhl
biBEZXZlbG9wZXIgU3VtbWl0IDIwMTk6IFthXSBhbmQgW2JdLgo+IEl0IGFsc28gcHJvdmlkZXMg
YSBmZXcgZml4ZXMgYW5kIHNvbWUgc21hbGwgaW1wcm92ZW1lbnRzLgoKSGV5YSwKCklzIHRoZXJl
IGFuIHY1IG9mIHRoZSBwYXRjaGVzIHNvbWV3aGVyZSBicmV3aW5nIHNvIHRoYXQgSSBjYW4gZ2l2
ZSB0aGVtCm9uZSBsYXN0IHRlc3Q/CgpKdWVyZ2VuLAoKQXJlIHlvdSBPSyB3aXRoIGdpdmluZyB0
aGVtIGFuIFJlbGVhc2UtQWNrPyBJIHRoaW5rIHRoZXJlIGFyZSBvbmx5IHR3byBtaW5vcgpjaGFu
Z2VzIHRoYXQgSmFuIHJlcXVlc3RlZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
