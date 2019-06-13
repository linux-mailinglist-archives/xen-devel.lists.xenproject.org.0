Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819A44E0F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 23:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbWpB-0005T1-5i; Thu, 13 Jun 2019 20:59:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ivaz=UM=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1hbWpA-0005Sw-1G
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 20:59:56 +0000
X-Inumbo-ID: 317abda8-8e1e-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 317abda8-8e1e-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 20:59:54 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5DKwl5v035890;
 Thu, 13 Jun 2019 20:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=8+yD3FwG9Y1XnQgQlCXkn8Fzt0JxwkdjIsC4NHWZX48=;
 b=ue8PMZCWarCa2y6L8dNMUbeIjNb1h/RJ32BMdaFRXuIjAnsa7HOuuDbU8fSunthIzWqk
 W2b4J4Z6gILy0ncGFcjPAbMAXn5lfwQm6XnFsiLOjWTrynIWXhLF4uDvPcG7VAVv/Pcw
 kDZAOZQIeLw8fAln4Q+4/Oq1fp99WuqSpgrJW1UaiK97cweTBvskW8B4qlSZtBBOy80I
 QT4MYqMVu6fTKAI6v5DARKhyXEb+DOfRp5E2WTGFL1IqIX7BD9vCLb/ZntJjq7y59Y11
 0SX/OYNeMeYTfYBTdWZcOHQOrOdoSCcS6l31eh8tLU0ElRhVQnQ9TQJbcFGBlzpmlKPP gg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2t04ynv09f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2019 20:59:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5DKxMJr173234;
 Thu, 13 Jun 2019 20:59:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2t024vrm43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2019 20:59:37 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5DKxXnf013678;
 Thu, 13 Jun 2019 20:59:33 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 13 Jun 2019 13:59:33 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 490DB6A0125; Thu, 13 Jun 2019 17:00:57 -0400 (EDT)
Date: Thu, 13 Jun 2019 17:00:57 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190613210057.GE11920@char.us.oracle.com>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
 <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
 <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
 <alpine.DEB.2.21.1906040949090.14041@sstabellini-ThinkPad-T480s>
 <4e4bef15-3e0a-c4a3-7b82-ddadb687e684@oracle.com>
 <20190605141354.GA16635@char.us.oracle.com>
 <9d5a5e02-842f-fd2e-1b85-dd8a68600704@suse.com>
 <20190613142345.GC456@char.us.oracle.com>
 <e03d1101-3909-3109-c96c-77ab1bb047b9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e03d1101-3909-3109-c96c-77ab1bb047b9@suse.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906130157
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906130158
Subject: Re: [Xen-devel] [PATCH v2] xen/swiotlb: don't initialize swiotlb
 twice on arm64
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
Cc: Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien.Grall@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IAo+ID4gIzIgcGF0Y2ggc2F5czoKPiA+IAo+ID4gCSI+IFRvIGJlIHN5bW1ldHJpYyB3aXRo
IHNldHRpbmcgdGhlIGZsYWcgb25seSBhZnRlciBoYXZpbmcgbWFkZSB0aGUgcmVnaW9uCj4gPiAJ
PiBjb250aWd1b3VzLCBhbmQgdG8gYXZvaWQgKHBlcmhhcHMganVzdCB0aGVvcmV0aWNhbCkgcmFj
ZXMsIHdvdWxkbid0IGl0IGJlCj4gPiAJPiBiZXR0ZXIgdG8gY2xlYXIgdGhlIGZsYWcgYmVmb3Jl
IGNhbGxpbmcgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKT8KPiA+IAk+IEV2ZW4gYmV0
dGVyIHdvdWxkIGJlIGEgVGVzdEFuZENsZWFyLi4uKCkgb3BlcmF0aW9uLgo+ID4gCj4gPiAJSSBs
aWtlIHRoYXQgaWRlYS4KPiA+ICIKPiA+ID8KPiAKPiBJIHdhcyBob3BpbmcgZm9yIGEgY2xhcmlm
aWNhdGlvbiByZWdhcmRpbmcgdGhlIFhlbiBzcGVjaWZpYyBwYWdlIGZsYWcKPiBuYW1lcyBiZWZv
cmUgcG9zdGluZyBWMy4KPiAKPiBBcyBDaHJpc3RvcGggZGlkbid0IHJlYWN0IHdoZW4gSSBwb3N0
ZWQgcG9zc2libGUgc29sdXRpb25zIEkgdGhpbmsgSSdsbAo+IGp1c3QgbW9kaWZ5IHBhdGNoIDMg
YWNjb3JkaW5nIHRvIEphbidzIGNvbW1lbnQgYW5kIHBvc3QgVjMuCgpPSywgd2lsbCBhd2FpdCB0
aGF0IHBhdGNoc2V0LiBUaGFuayB5b3UhCgpCVFcsIHlvdXIgcGF0Y2ggIzEgc2hvdWxkIGJlIHVw
c3RyZWFtIG5vdy4KPiAKPiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
