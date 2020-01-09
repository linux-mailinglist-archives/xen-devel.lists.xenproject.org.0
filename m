Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269BA1363DD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 00:33:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iphFV-0005Gp-RB; Thu, 09 Jan 2020 23:29:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LS9B=26=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iphFU-0005Gj-HA
 for xen-devel@lists.xen.org; Thu, 09 Jan 2020 23:29:56 +0000
X-Inumbo-ID: f0cc68c4-3337-11ea-bb10-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0cc68c4-3337-11ea-bb10-12813bfff9fa;
 Thu, 09 Jan 2020 23:29:54 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 009NSmIg192998;
 Thu, 9 Jan 2020 23:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=mRGveEf/LQllrkPFYbXImW1JYkM5dZmKgDk7Iei+h40=;
 b=CpkVOYU9UV1Jn+6qMnVxcNliqaJLEUd6hxRgnL3K0t24lWIbFvXNxIRBF+c8lqHPIcL1
 EaAXUPde6GIjtfIrlD+u/W2JV91wDskz0OyAJifree2/rfo8BuAaC1VUYYdR/3I7+6bO
 Dmq8Sp75019nvV0YQuV7JQ0yEnWpgeADWEkGrB+Vg96d5YHT31kRmlUl0ZX4E1hMIFd5
 Kd7siMsjgAN/3VrAFg6B3OqMXP0QFEHCOz+jY4efWZ6zkVcZ8f76oVmvuZM1VTV2+uGG
 O3kkAIXRD5Q1CYXuz/hskyfM9grCnNH7U+q93qDmVBq2pq+gA0VQ5EG3ovJMfHaG4Tcm xA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2xaj4ue779-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 23:29:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 009NO7Bt063938;
 Thu, 9 Jan 2020 23:27:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2xdms0aay4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 23:27:43 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 009NReTB004699;
 Thu, 9 Jan 2020 23:27:40 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 09 Jan 2020 15:27:40 -0800
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
 <20200108152100.7630-3-sergey.dyasli@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <5214cb54-1719-f93b-130f-90c5da31e22a@oracle.com>
Date: Thu, 9 Jan 2020 18:27:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200108152100.7630-3-sergey.dyasli@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9495
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001090195
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9495
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001090196
Subject: Re: [Xen-devel] [PATCH v1 2/4] x86/xen: add basic KASAN support for
 PV kernel
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
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzgvMjAgMTA6MjAgQU0sIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gQEAgLTE5NDMsNiAr
MTk3MywxNSBAQCB2b2lkIF9faW5pdCB4ZW5fc2V0dXBfa2VybmVsX3BhZ2V0YWJsZShwZ2RfdCAq
cGdkLCB1bnNpZ25lZCBsb25nIG1heF9wZm4pCj4gICAJaWYgKGkgJiYgaSA8IHBnZF9pbmRleChf
X1NUQVJUX0tFUk5FTF9tYXApKQo+ICAgCQlpbml0X3RvcF9wZ3RbaV0gPSAoKHBnZF90ICopeGVu
X3N0YXJ0X2luZm8tPnB0X2Jhc2UpW2ldOwo+ICAgCj4gKyNpZmRlZiBDT05GSUdfS0FTQU4KPiAr
CS8qCj4gKwkgKiBDb3B5IEtBU0FOIG1hcHBpbmdzCj4gKwkgKiBmZmZmZWMwMDAwMDAwMDAwIC0g
ZmZmZmZiZmZmZmZmZmZmZiAoPTQ0IGJpdHMpIGthc2FuIHNoYWRvdyBtZW1vcnkgKDE2VEIpCj4g
KwkgKi8KPiArCWZvciAoaSA9IDB4ZWMwID4+IDM7IGkgPCAweGZjMCA+PiAzOyBpKyspCgpBcmUg
eW91IHJlZmVycmluZyBoZXJlIHRvwqAgS0FTQU5fU0hBRE9XX1NUQVJUIGFuZCBLQVNBTl9TSEFE
T1dfRU5EPyBJZiAKc28sIGNhbiB5b3UgdXNlIHRoZW0gaW5zdGVhZD8KCi1ib3JpcwoKPiArCQlp
bml0X3RvcF9wZ3RbaV0gPSAoKHBnZF90ICopeGVuX3N0YXJ0X2luZm8tPnB0X2Jhc2UpW2ldOwo+
ICsjZW5kaWYKPiArCj4gICAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
