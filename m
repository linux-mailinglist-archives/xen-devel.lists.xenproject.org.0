Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19936B487
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 04:31:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnZgc-0003DX-Mu; Wed, 17 Jul 2019 02:28:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fedf=VO=oracle.com=martin.petersen@srs-us1.protection.inumbo.net>)
 id 1hnZgb-0003DS-PQ
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 02:28:53 +0000
X-Inumbo-ID: 9b8d8df8-a83a-11e9-9376-db01d0ec5632
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b8d8df8-a83a-11e9-9376-db01d0ec5632;
 Wed, 17 Jul 2019 02:28:48 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6H2O2b4074080;
 Wed, 17 Jul 2019 02:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=x0TkQOL90rKxjjC6Of7Ba76QmcmKOQRx6t2pSFqNMjI=;
 b=t6OqAWSHi7kmp+rGZNtsNE7jL3XrH89bgCBfz+fz24gaswR/MG5Dghzhm74zg4TTMF0n
 Y+24tSUaWebG3clzOXCOOngRVOjy0zeyDc67URn2dX9Ho/usZThsJZFRl7UMPuJ5QxND
 rpXBBrsoJKVBQJdOBR16KzFQyq5JpHLGb+q8fjUTSYHgQ3J8djt9+OmpcOyV38lO0X7a
 u/vNvLC5BI+HzPpfEaB4jqrm2uGjK3cGbKgXRo29A9tqVSfGyC1RdQAZ/ncVbfbXM+sz
 2pEIzp6jH65OiGkVisBgfS8u3hS3lzONsCqLEWPFIHFZbzrxxgGtxc/8cEmSeIXivVeB Mw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2tq6qtqux7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 02:28:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6H2RYQ3106662;
 Wed, 17 Jul 2019 02:28:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2tq5bcr1sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 02:28:36 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6H2SYgN021673;
 Wed, 17 Jul 2019 02:28:34 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 17 Jul 2019 02:28:33 +0000
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
 <20190708184711.2984-2-chaitanya.kulkarni@wdc.com>
 <yq18st457yb.fsf@oracle.com>
 <BYAPR04MB5749AF90A9E9C81B4A6857F386F20@BYAPR04MB5749.namprd04.prod.outlook.com>
Date: Tue, 16 Jul 2019 22:28:30 -0400
In-Reply-To: <BYAPR04MB5749AF90A9E9C81B4A6857F386F20@BYAPR04MB5749.namprd04.prod.outlook.com>
 (Chaitanya Kulkarni's message of "Fri, 12 Jul 2019 16:09:56 +0000")
Message-ID: <yq1sgr5z969.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=930
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907170029
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=983 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907170028
Subject: Re: [Xen-devel] [PATCH V4 1/9] block: add a helper function to read
 nr_setcs
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-btrace@vger.kernel.org" <linux-btrace@vger.kernel.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuchao0@huawei.com" <yuchao0@huawei.com>, "colyli@suse.de" <colyli@suse.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "kent.overstreet@gmail.com" <kent.overstreet@gmail.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkNoYWl0YW55YSwKCj4gVGhpcyBzZXJpZXMganVzdCByZXBsYWNlcyB0aGUgZXhpc3RpbmcgYWNj
ZXNzZXMgd2l0aG91dCBjaGFuZ2luZwo+IGFueXRoaW5nLgo+Cj4gU28gaWYgYW55IG9mIHRoZSBl
eGl0aW5nIGNvZGUgaGFzIHRoYXQgYnVnIHRoZW4gaXQgd2lsbCBibG93IHVwCj4gbmljZWx5Lgo+
Cj4gRm9yIGZ1dHVyZSBjYWxsZXJzIEkgZG9uJ3QgbWluZCBhZGRpbmcgYSBuZXcgY2hlY2sgYW5k
IHJlc2VuZCB0aGUKPiBzZXJpZXMuCj4KPiBXb3VsZCB5b3UgcHJlZmVyIGFkZGluZyBhIGNoZWNr
ID8KCkkgY2hlY2tlZCB5b3VyIGNhbGwgc2l0ZXMgYW5kIHRoZXkgbG9vayBmaW5lLiBBbHNvLCBJ
IGRvbid0IHRoaW5rCnJldHVybmluZyBhIGNhcGFjaXR5IG9mIDAgb24gZXJyb3IgaXMgZ29pbmcg
dG8gaGVscCB1cyBtdWNoLgoKUmV2aWV3ZWQtYnk6IE1hcnRpbiBLLiBQZXRlcnNlbiA8bWFydGlu
LnBldGVyc2VuQG9yYWNsZS5jb20+CgotLSAKTWFydGluIEsuIFBldGVyc2VuCU9yYWNsZSBMaW51
eCBFbmdpbmVlcmluZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
