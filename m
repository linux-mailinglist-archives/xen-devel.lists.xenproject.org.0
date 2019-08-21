Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B2983B1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:52:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0VgM-00017D-LF; Wed, 21 Aug 2019 18:50:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1vq=WR=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i0VgL-00010O-KS
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:50:05 +0000
X-Inumbo-ID: 7d00ca46-c444-11e9-ac23-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d00ca46-c444-11e9-ac23-bc764e2007e4;
 Wed, 21 Aug 2019 18:50:04 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIXWBw138614;
 Wed, 21 Aug 2019 18:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=ApAy22WvLsEGlRo9NzFOgTr0cTYLTtK1ng3BsvaMnc8=;
 b=H2CkYi3hZs1zpM3mYKMTOGqXetFbX1V2alSjyWtDMUN5COFBLkK1Tyv0qbjLdB9Ebxq0
 r5mcR7FNChpu9TS4DWomCIyijJgL+xgO4ymvBDL6nL7JEMto1NDd2dskSoszFBnyjUAL
 P21STvzXZ6gWwLcfO50Cz/ZT22WraCCNeZeQezZO1ds2auTfV2rf3zRTh4GQrtEA3rdB
 tEaMjWf7AHVDqws4WIcR2WJEl6FxwRPjwU0r6eFfnMJ4k3MVtCeVjEgFPRmSeXA12Og8
 yQCPQ6LpGmPgmBU34Fl0rzw51XTzyilqFWMJ+IbbY8643kHlvDph2rtYGgH+R4MUs1wD VQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2uea7qyq9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:50:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIXSTB136135;
 Wed, 21 Aug 2019 18:50:00 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2ugj7qs3u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:50:00 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7LInw0S002685;
 Wed, 21 Aug 2019 18:49:58 GMT
Received: from dhcp-10-154-125-129.vpn.oracle.com (/10.154.125.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 11:49:58 -0700
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org
References: <20190821082056.91090-1-wipawel@amazon.de>
 <20190821082056.91090-9-wipawel@amazon.de>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <9154b48a-4b9c-4a64-3b42-38c58bf866d1@oracle.com>
Date: Wed, 21 Aug 2019 14:49:57 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190821082056.91090-9-wipawel@amazon.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210182
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210182
Subject: Re: [Xen-devel] [PATCH 08/20] livepatch-build: detect special
 section group sizes
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wipawel@amazon.com,
 mpohlack@amazon.com, Ross Lagerwall <ross.lagerwall@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gKyAgICAjIFVzaW5nIHhlbi1zeW1zIGJ1aWx0IGluIHRoZSBwcmV2aW91cyBzdGVwIGJ5IGJ1
aWxkX2Z1bGwoKS4KPiArICAgIFNQRUNJQUxfVkFSUz0kKHJlYWRlbGYgLXdpICIkT1VUUFVUL3hl
bi1zeW1zIiB8CgpXaGF0IHZlcnNpb24gb2YgcmVhZGVsZiBzdXBwb3J0cyB0aGlzPyBBc2tpbmcg
YXMgaW4gdGhlIHBhc3QgdGhlcmUgd2VyZSAKc29tZSBvcHRpb25zIHdpdGggYmludXRpbHMgdGhh
dCBoYWQgY29uZmxpY3Rpbmcgb3B0aW9ucyBhbmQgd2UgaGFkIHRvIAphZGQgc29tZSBjdXN0b20g
aGFja2VyeSBjb2RlIHRvIGZpZ3VyZSBvdXQgd2hpY2ggcGFyYW1ldGVyIHRvIHVzZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
