Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CACC3A6A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 18:25:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFKus-0005Xm-Th; Tue, 01 Oct 2019 16:22:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mU0R=X2=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iFKuq-0005Xh-Ne
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 16:22:20 +0000
X-Inumbo-ID: a3df18d2-e467-11e9-97fb-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by localhost (Halon) with ESMTPS
 id a3df18d2-e467-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 16:22:19 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91GEY00180100;
 Tue, 1 Oct 2019 16:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=Kkp9fyDwPlLySZAQuFQs7wtDBNHu7cD5K3bWsiBeFWE=;
 b=kAZNYy0zaBwf3H3pha7p3Xlb7j5v+n7t83FRwsmuDd5SWy/dvb6B888V3SPYsRZmlhGU
 o9lZMYZlCQdCTRHHKOFlAeToirNWvmIkoVATq75zqrArWrGXMq8F6oNg3Pzlqwa2cJqy
 kYR625+tuWPYOjeJr4Tam46lGdHKAGLkl6Wt9II3gmmYEZhVoPBI6yGFl/eCyNcSM7Cy
 X3Oh7odo2dSBaXAY6cjnQ1TLQKF0OqGENvcTIDlbKp5GY3S5/WcrbEArh1oQ1HCLJGHL
 MIK7AOSTimZPEtpTtyYQIv4LlPGemwDU0HdYzTrtswg/T5fJThgsPJ78nIVmUY4fZvpA hw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2v9yfq77sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 16:22:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91GETsB133093;
 Tue, 1 Oct 2019 16:22:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2vbmpyw35n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 16:22:17 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x91GMFLg023439;
 Tue, 1 Oct 2019 16:22:16 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Oct 2019 09:22:15 -0700
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <20190913103335.ijzx6tuy4iwb5dt5@Air-de-Roger>
 <89c9c9b5-a99f-bfdb-c42c-df64e308a98e@oracle.com>
 <20190924154242.nwhetdvkgmkhjgph@Air-de-Roger>
 <8a81e76c-b342-05b5-b592-c7e6912e6a9f@oracle.com>
 <20191001160109.zq4jlrru6xl5pnpf@Air-de-Roger>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <394a7fb3-e400-d859-10db-cb350ebdf2fd@oracle.com>
Date: Tue, 1 Oct 2019 09:22:07 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001160109.zq4jlrru6xl5pnpf@Air-de-Roger>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910010140
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910010140
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMS8xOSA5OjAxIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IENhbiB5b3UgZ2l2
ZSBhIHRyeSB0byB0aGUgcGF0Y2ggYWJvdmU/IEkgZG9uJ3QgaGF2ZSB0aGUgaGFyZHdhcmUgdG8K
PiB0ZXN0IGFueSBvZiB0aGlzIEFUTSwgc28geW91ciBoZWxwIHdvdWxkIGJlIGFwcHJlY2lhdGVk
LgoKSSdkIGxpa2UgdG8gdGVzdCB0aGlzIHBhdGNoLCBidXQgbm93IHRoZXJlIGlzIGhhcmR3YXJl
IGlzc3VlLCBvbmNlIHRoZQpteSB0ZXN0IGVudiBpcyBhdmFpbGFibGUgSSdsbCB0ZXN0IGl0IGFu
ZCB1cGRhdGUgeW91IHJlc3VsdC4KClRoYW5rcywKSm9lCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
