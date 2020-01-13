Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711D6139B6B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 22:28:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir7DC-0005i6-NP; Mon, 13 Jan 2020 21:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ajXo=3C=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ir7DB-0005i1-PS
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 21:25:25 +0000
X-Inumbo-ID: 319266b8-364b-11ea-a985-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 319266b8-364b-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 21:25:17 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00DLD57N106965;
 Mon, 13 Jan 2020 21:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=cHsTBdtsjyMBjpEmHOMBIzAOK2aybGLClLw5Dw0FMU4=;
 b=DriF7U/x59tUMa4a+ruGdgyK71k7z75JA6gSo/bwcgE6z1Md1T07cRERw+GQRJBY4wgw
 m0NU/wsqh1AwV7Z8aIrw2cMHbwvmAly1stpAZdtEV3g/3WG4NlYBLmS51aLnUBbD5HYf
 UGhZf+Fgbma4ykUqICsDDIRAlk7mLSGGI0GPrmuuZuuf8cZbEct5FEtsvlhMrnBwIgEs
 bXGw31kI6oH+142j8LLkuoPLcTit1MIYt5rDJT6ia4bq32vgZpvAYcwTqXqPw5VvN85h
 iuXKtnzI1AYgSzzddpNtpVmxcjDeE1aXNZeorJqeZH2Z+uxNoZvS87GN3DumiQaKO5bT QQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2xf73thqs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 21:25:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00DLEnrf174468;
 Mon, 13 Jan 2020 21:25:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2xfrh6qwf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 21:25:07 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00DLP31N022435;
 Mon, 13 Jan 2020 21:25:04 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 13 Jan 2020 13:25:03 -0800
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20200111034347.5270-1-marmarek@invisiblethingslab.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <9ea42829-6a1a-09eb-9d59-67a0487980b6@oracle.com>
Date: Mon, 13 Jan 2020 16:25:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200111034347.5270-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=747
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001130173
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=808 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001130173
Subject: Re: [Xen-devel] [PATCH v3] xen-pciback: optionally allow interrupt
 enable flag writes
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
 Stefano Stabellini <sstabellini@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Simon Gaiser <simon@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzEwLzIwIDEwOjQzIFBNLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6
Cj4gQEAgLTExNyw2ICsxMTcsMjQgQEAgc3RhdGljIGludCBjb21tYW5kX3dyaXRlKHN0cnVjdCBw
Y2lfZGV2ICpkZXYsIGludCBvZmZzZXQsIHUxNiB2YWx1ZSwgdm9pZCAqZGF0YSkKPiAgIAkJcGNp
X2NsZWFyX213aShkZXYpOwo+ICAgCX0KPiAgIAo+ICsJaWYgKGRldl9kYXRhICYmIGRldl9kYXRh
LT5hbGxvd19pbnRlcnJ1cHRfY29udHJvbCkgewo+ICsJCWlmICgoY21kLT52YWwgXiB2YWwpICYg
UENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFKSB7Cj4gKwkJCWlmICh2YWx1ZSAmIFBDSV9DT01NQU5E
X0lOVFhfRElTQUJMRSkgewo+ICsJCQkJcGNpX2ludHgoZGV2LCAwKTsKPiArCQkJfSBlbHNlIHsK
PiArCQkJCS8qIERvIG5vdCBhbGxvdyBlbmFibGluZyBJTlR4IHRvZ2V0aGVyIHdpdGggTVNJIG9y
IE1TSS1YLiAqLwo+ICsJCQkJc3dpdGNoICh4ZW5fcGNpYmtfZ2V0X2ludGVycnVwdF90eXBlKGRl
dikpIHsKPiArCQkJCWNhc2UgSU5URVJSVVBUX1RZUEVfTk9ORToKPiArCQkJCWNhc2UgSU5URVJS
VVBUX1RZUEVfSU5UWDoKPiArCQkJCQlwY2lfaW50eChkZXYsIDEpOwoKSWYgSU5URVJSVVBUX1RZ
UEVfSU5UWCAsIHdoeSBjYWxsIHBjaV9pbnR4KDEpPwoKKEkgdGhpbmsgSSBhc2tlZCB0aGlzIGxh
c3QgdGltZSBhcyB3ZWxsKS4KCgotYm9yaXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
