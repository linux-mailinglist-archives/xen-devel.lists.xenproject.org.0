Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC6C663A1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 04:02:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlkqi-00034S-Te; Fri, 12 Jul 2019 01:59:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=maJd=VJ=oracle.com=martin.petersen@srs-us1.protection.inumbo.net>)
 id 1hlkqh-00034N-9U
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 01:59:47 +0000
X-Inumbo-ID: b6bc8fde-a448-11e9-9745-8b59da9e0e07
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6bc8fde-a448-11e9-9745-8b59da9e0e07;
 Fri, 12 Jul 2019 01:59:42 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C1whwI148502;
 Fri, 12 Jul 2019 01:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=J18F5J67mO4t19yyI3zIbTw8aOC1FGxLd1+xZAbv+II=;
 b=252PRaXX3ARUVHnSa0jdQ8LeA3vZLbJcHVF4+se154ImHvp88xn6Kjcyq2w+kSCvPuF1
 fq85ecDc8eESQE7wzf7P8tZYkIp4pEug9Fl+RkdnoYkqQSu0TsMRkritePlmyRKexskT
 YshM2U47AnjM4/25rt34IgTd8tTmS9BAt1UVmTojLyB77yBQsLuILOF6E6KEZ/do/fJ9
 xsl/EePtn6Me0ilDb/kzpVgRUVHuCVtd+Y5qmV2Gf8K1pQl6D9xgURF10pnZMUhTZ9T9
 +YUQxkpYczqmXHF2RcaaWJyCn8mtc+1hcyAiGAQ5eqtQ/li0xqlqen2XDdTsXF3WuEBZ RQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2tjm9r312q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 01:59:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C1vq19042528;
 Fri, 12 Jul 2019 01:59:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2tn1j1vuk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 01:59:31 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6C1xSPb003774;
 Fri, 12 Jul 2019 01:59:29 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 11 Jul 2019 18:59:27 -0700
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
 <20190708184711.2984-2-chaitanya.kulkarni@wdc.com>
Date: Thu, 11 Jul 2019 21:59:24 -0400
In-Reply-To: <20190708184711.2984-2-chaitanya.kulkarni@wdc.com> (Chaitanya
 Kulkarni's message of "Mon, 8 Jul 2019 11:47:03 -0700")
Message-ID: <yq18st457yb.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=994
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120023
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120023
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com, yuchao0@huawei.com,
 colyli@suse.de, linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 jaegeuk@kernel.org, xen-devel@lists.xenproject.org, kent.overstreet@gmail.com,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIENoYWl0YW55YSwKCj4gK3N0YXRpYyBpbmxpbmUgc2VjdG9yX3QgYmRldl9ucl9zZWN0cyhz
dHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQo+ICt7Cj4gKwlyZXR1cm4gcGFydF9ucl9zZWN0c19y
ZWFkKGJkZXYtPmJkX3BhcnQpOwo+ICt9CgpDYW4gYmRldiBlbmQgdXAgYmVpbmcgTlVMTCBpbiBh
bnkgb2YgdGhlIGNhbGwgc2l0ZXM/CgpPdGhlcndpc2Ugbm8gb2JqZWN0aW9ucy4KCi0tIApNYXJ0
aW4gSy4gUGV0ZXJzZW4JT3JhY2xlIExpbnV4IEVuZ2luZWVyaW5nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
