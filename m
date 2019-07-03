Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952F5DC1F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 04:21:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiUnD-0006qA-U4; Wed, 03 Jul 2019 02:14:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JW9B=VA=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiUnC-0006q5-C8
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 02:14:42 +0000
X-Inumbo-ID: 50b3bdd2-9d38-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 50b3bdd2-9d38-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 02:14:41 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x632DjV5159738;
 Wed, 3 Jul 2019 02:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=TPUr3GVO/Gj7hfmOlod1TVREougro104UwyKk/uRAko=;
 b=LYZGo2NyUqx2WE+YB2OoGuHbvvxESMst1mo3oQ2YsVSNSZ4zjDLUQZKAwdRLd88J+0Un
 BTQgIvKSh+98g85O4jIy2EoMLkR6iXgvPY4wPm0iRWMNkT3UQ5O7U5oBh/S1TINyojQ9
 QMGxl/HWeKd8KGi8j7iiT1knkNsBP5OyZF5T15lJOia5SkUATQlqaJtzk58yxQ6BrNHy
 B6Dh39LreSTEgWs9E/RQ+i6Hkd0SPhPo5zioJS8YjPqCa3AJnilkFs3onZyHhcxEvRej
 aC4I90zch5nvMKPMkUR7nrHbbAtYNFcuBrriCqpzkx2tL6WqhTLKdX0py3Qbk6MzUh3J Pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2te61pxr92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Jul 2019 02:14:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x632Ce9k099569;
 Wed, 3 Jul 2019 02:14:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2tebkuknsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Jul 2019 02:14:27 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x632EP7e016631;
 Wed, 3 Jul 2019 02:14:25 GMT
Received: from [10.191.27.205] (/10.191.27.205)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jul 2019 19:14:25 -0700
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
References: <1561958399-28906-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561958399-28906-6-git-send-email-zhenzhong.duan@oracle.com>
 <603e1c8a-408b-360d-9a84-6d91b5f1db1b@oracle.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <cd07bf77-11e6-5aca-9449-ffad8aea95cb@oracle.com>
Date: Wed, 3 Jul 2019 10:14:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <603e1c8a-408b-360d-9a84-6d91b5f1db1b@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9306
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907030026
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9306
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907030026
Subject: Re: [Xen-devel] [PATCH v4 5/5] xen: Add 'xen_nopv' parameter back
 for backward compatibility
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
Cc: jgross@suse.com, sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwMTkvNy8zIDI6MTMsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiA3LzEvMTkgMTox
OSBBTSwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+IE1hcCAneGVuX25vcHYnIHRvICdub3B2JyBh
bmQgbWFyayAneGVuX25vcHYnIG9ic29sZXRlIGluCj4+IGtlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+
IEkgYW0gbm90IHN1cmUgd2Ugd2FudCBwYXRjaCAjMywgd2h5IG5vdCBkbyBldmVyeXRoaW5nIGlu
IGEgc2luZ2xlIHBhdGNoPwo+ClRoYW5rcyBmb3IgcmV2aWV3LiBJJ2xsIGZpeCBhbGwgdGhvc2Ug
YmFzZWQgb24geW91ciBjb21tZW50cy4KClpoZW56aG9uZwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
