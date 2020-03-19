Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE218BBD3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 17:04:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jExbl-0008VB-Hj; Thu, 19 Mar 2020 16:01:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3tZN=5E=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jExbk-0008V6-FL
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 16:01:20 +0000
X-Inumbo-ID: df29621c-69fa-11ea-bec1-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df29621c-69fa-11ea-bec1-bc764e2007e4;
 Thu, 19 Mar 2020 16:01:20 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02JFtwdC062863;
 Thu, 19 Mar 2020 16:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=tHGRux1eakIQEtpuMlP/9xx4wD3CXDV5MuFjhTwSK1w=;
 b=nW7so1kVOtpmW0J0VkL+8AD9DSPH6SU0jaVq3+sEU0BrSKvKQ7IMpUCVibikPONIUK0u
 6Qpgnyx+QnJdJv9Npx4Iq4H4JGMNjGNZaHaAFaDgHRAhIhleWyxkJ7gIOaIXoGuFDzKk
 RiUSaAa6zpo1gOvdIRvHOJP5JEPxvBOQ7BHz05iiGTc0YDGr/cZ09dFb5T72ZZh/TECy
 HbOTygrbw7dWPeERIDJ49fh2A7XoqA0IYXmrlsKhw/EP0dt1uWtfDZwty+IOcWe7jlkY
 N28nShWYTtOS43lInrJHV0eSenJ/70UQpgzviKicBS4F3hHmwNVwEi1Cx45yljN56mHX hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2yub27925p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 16:01:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02JFnqMD136226;
 Thu, 19 Mar 2020 16:01:14 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2ys92mgbkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 16:01:13 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02JG1AmM014111;
 Thu, 19 Mar 2020 16:01:11 GMT
Received: from [10.39.245.129] (/10.39.245.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Mar 2020 09:01:10 -0700
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200319071428.12115-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <1f8aab2c-dddc-494c-708d-85087c8d4e57@oracle.com>
Date: Thu, 19 Mar 2020 12:01:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319071428.12115-1-jgross@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190069
Subject: Re: [Xen-devel] [PATCH] xen/events: avoid NULL pointer dereference
 in evtchn_from_irq()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDMvMTkvMjAgMzoxNCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGVyZSBoYXZlIGJl
ZW4gcmVwb3J0cyBvZiByYWNlcyBpbiBldnRjaG5fZnJvbV9pcnEoKSB3aGVyZSB0aGUgaW5mbwo+
IHBvaW50ZXIgaGFzIGJlZW4gTlVMTC4KCgpEbyB5b3UgaGF2ZSBhbiBleGFtcGxlIG9mIGhvdyB0
aGlzIHJhY2UgaGFwcGVucyAoYW5kIGhvdyBtb3Zpbmcga2ZyZWUgdG8gCnJjdSB3aWxsIGhlbHAp
PwoKKEkgYW0gbW9zdGx5IHdvbmRlcmluZyB3aGV0aGVyIHdlJ2QgYmUgbWFza2luZyBhIG1vcmUg
c2VyaW91cyBwcm9ibGVtKQoKLWJvcmlzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
