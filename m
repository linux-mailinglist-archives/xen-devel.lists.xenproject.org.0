Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3118BAAF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:11:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEwlZ-0001gy-WB; Thu, 19 Mar 2020 15:07:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3tZN=5E=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jEwlY-0001gt-EC
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:07:24 +0000
X-Inumbo-ID: 5656bd24-69f3-11ea-bc24-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5656bd24-69f3-11ea-bc24-12813bfff9fa;
 Thu, 19 Mar 2020 15:07:23 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02JEwwgE124196;
 Thu, 19 Mar 2020 15:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=tEtZwW7IpOSLSvQnsgQ8J66cJvp62R3ApNSmRuGT2WQ=;
 b=O/4NOfJOo9aAmZNgtfpBkmebfoNeXdUSGWKDSaPJAG2VVWaDHsbfaIhyeVNcHjoK94Kv
 OJ98WJEs3tcFgvQmtSIaYPkvApBpXGGI9LX/PaHYLkbukt8og1hjbj/ZAvZNmUi7m6Y+
 sP+s1zfx6uf2OSSOylP3PX2Tp/tCrrH+fjK8QLXeuDl6xVUoJcdu4v3ph9B8VhoMnSEV
 jBsmMnJtwjV7gfqVKVfx5njwf5zRz0JgH498L94OKhJoGk01lcqAvzk7clAudGyhjpGs
 xidrCBNirB0N0ATxPYMXBWOJ2pBZQyvJvp6rAjKnz8Jct1cVVdLlFsUx64sdacYkz+65 1g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2yrpprgwf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 15:07:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02JEv5tt185228;
 Thu, 19 Mar 2020 15:07:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2ys8tw5xt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 15:07:15 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02JF7EUX002914;
 Thu, 19 Mar 2020 15:07:14 GMT
Received: from [10.39.245.129] (/10.39.245.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Mar 2020 08:07:14 -0700
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20200319040648.10396-1-marmarek@invisiblethingslab.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <e6c48552-9866-497c-7d2f-62849122f867@oracle.com>
Date: Thu, 19 Mar 2020 11:07:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319040648.10396-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=847 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=912 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190067
Subject: Re: [Xen-devel] [PATCH] xen-pciback: fix INTERRUPT_TYPE_* defines
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
 Simon Gaiser <simon@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDMvMTkvMjAgMTI6MDYgQU0sIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToK
PiBJTlRFUlJVUFRfVFlQRV9OT05FIHNob3VsZCBiZSAwLAoKCldvdWxkCgogwqAgcmV0dXJuIHJl
dCA/OiBJTlRFUlJVUFRfVFlQRV9OT05FCgppbiB4ZW5fcGNpYmtfZ2V0X2ludGVycnVwdF90eXBl
KCkgd29yaz8KCgpJIHRoaW5rIGl0J3MgYmV0dGVyIG5vdCB0byB0aWUgbWFjcm8gbmFtZSB0byBh
IHBhcnRpY3VsYXIgdmFsdWUuCgoKLWJvcmlzCgoKPiAgIGFzIGl0IGlzIGFzc3VtZWQgaW4KPiB4
ZW5fcGNpYmtfZ2V0X2ludGVycnVwdF90eXBlKCkuIEZpeCB0aGUgZGVmaW5pdGlvbiwgYW5kIGFs
c28gc2hpZnQgb3RoZXIKPiB2YWx1ZXMgdG8gbm90IGxlYXZlIGhvbGVzLgo+IEJ1dCBhbHNvIHVz
ZSBJTlRFUlJVUFRfVFlQRV9OT05FIGluIHhlbl9wY2lia19nZXRfaW50ZXJydXB0X3R5cGUoKSB0
bwo+IGF2b2lkIHNpbWlsYXIgY29uZnVzaW9ucyBpbiB0aGUgZnV0dXJlLgo+Cj4gRml4ZXM6IDQ3
Njg3OGU0YjJiZSAoInhlbi1wY2liYWNrOiBvcHRpb25hbGx5IGFsbG93IGludGVycnVwdCBlbmFi
bGUgZmxhZyB3cml0ZXMiKQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7Ny
ZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPgo+ICAgCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
