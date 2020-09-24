Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32527760F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 17:58:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLTdc-0004zi-Qw; Thu, 24 Sep 2020 15:58:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHfM=DB=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kLTdb-0004zd-97
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 15:58:27 +0000
X-Inumbo-ID: 7d0b461f-6f03-4038-ae0c-6f9722f9ac01
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d0b461f-6f03-4038-ae0c-6f9722f9ac01;
 Thu, 24 Sep 2020 15:58:26 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFZKWg125745;
 Thu, 24 Sep 2020 15:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=TItLMSlmVedz8D60wT2v3Gzregj/492Cx/940qop2ac=;
 b=Wm/rY2eE0euQtNye+YNcOppYVF/IIE0kfCnCnw/ed0fVYmhBz+y8s7IeNNcVaQKYwNpu
 CB96VViQBWoWtr7cwThuzxIhFun6tQrrBzdJVpTmfIC+MPaeFTMNwvWijxQzKxFiRiwn
 GGYwaRBzuTvd5MYZGKgXq5UEY8i0+Wb8YRkuhne6BU8XGZ/daibUwAaUv2nqx1dA/5Iu
 2C/k8b32RIS3BqkIpFAuOvKsXMFFWZJ3pSqSRfc6zczBOmqvJOiWRq205e46K+Ty7ra5
 UVJVd0lGq9bHapx+ylptn1mjqKBmIfZBtGTGawaKWsECQRQGWbb2W6vC/mPTyqSplBcO DQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 33q5rgqgp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 15:58:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFVSk0126419;
 Thu, 24 Sep 2020 15:58:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 33nux303cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 15:58:18 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08OFwGRO022527;
 Thu, 24 Sep 2020 15:58:16 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 08:58:16 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 86D976A0109; Thu, 24 Sep 2020 11:59:46 -0400 (EDT)
Date: Thu, 24 Sep 2020 11:59:46 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: SeongJae Park <sjpark@amazon.com>, SeongJae Park <sjpark@amazon.de>,
 axboe@kernel.dk, aliguori@amazon.com, amit@kernel.org,
 mheyne@amazon.de, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Message-ID: <20200924155946.GB6370@char.us.oracle.com>
References: <20200924101344.GN19254@Air-de-Roger>
 <20200924102714.28141-1-sjpark@amazon.com>
 <20200924104720.GO19254@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924104720.GO19254@Air-de-Roger>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=941 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=954 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240118
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

.snip..
> > For the reason, I'd like to suggest to keep this as is for now and expand it
> > with the 'exceptions list' idea or something better, if a real use case comes
> > out later.
> 
> I agree. I'm happy to take patches to implement more fine grained
> control, but that shouldn't prevent us from having a global policy if
> that's useful to users.

<nods>

