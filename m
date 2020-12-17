Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027F32DD524
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 17:26:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56049.97817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpw66-0001Zb-3J; Thu, 17 Dec 2020 16:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56049.97817; Thu, 17 Dec 2020 16:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpw66-0001ZF-03; Thu, 17 Dec 2020 16:25:46 +0000
Received: by outflank-mailman (input) for mailman id 56049;
 Thu, 17 Dec 2020 16:25:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHkA=FV=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kpw64-0001ZA-BK
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 16:25:44 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5f3b7a1-fbbc-4f4a-9fbd-da28b2f3b71d;
 Thu, 17 Dec 2020 16:25:43 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHGNmiY068507;
 Thu, 17 Dec 2020 16:25:39 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35cntme81n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Dec 2020 16:25:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHGPKCR079930;
 Thu, 17 Dec 2020 16:25:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35d7er3pke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 16:25:39 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BHGPbuN020657;
 Thu, 17 Dec 2020 16:25:37 GMT
Received: from [10.39.250.121] (/10.39.250.121)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 08:25:37 -0800
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f5f3b7a1-fbbc-4f4a-9fbd-da28b2f3b71d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=nLISPQKk9UyzeVhlyH2H8KlkM1pe3JTdt5YkBCjv/ec=;
 b=smet4DJl4It6bfnmWmlZ/a0Y3LlQ2d8gNZdxHR2Vbvu7xnQeUor4UhnKusXes7UuMGxg
 mze8DhefJXImT5YvwWvx5REQBDS2USyafNnf3xGfXMrjnHVlr+7kgEvgS9RQmEMpWBz1
 uRKaTkw/SzuZx0u4cPUd+t1uu2xlSDoXj5V9jba3OME/3SXKzqnS8hgcdCryp9f0Bikj
 NkWubF/ovjZkcmfbA9yBHIHoPN3wb7l+kMcJUuqUtTCEjbtMFpH57Ksu+a/4EhQ34he6
 95B2/bayxy7onIafrY5zz80q0AY2Ga+vQCURnFYy+9WLYtubiu9AuRNHXkBAHJz6w6AJ 9Q== 
From: boris.ostrovsky@oracle.com
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Cheyenne Wills <cheyenne.wills@gmail.com>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
 <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
 <f4ff3d16-40f6-e8a1-fcdd-ca52e1f52ca6@suse.com>
Organization: Oracle Corporation
Message-ID: <c90622c4-f9e0-8b6d-ab46-bba0cbfc0fd9@oracle.com>
Date: Thu, 17 Dec 2020 11:25:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f4ff3d16-40f6-e8a1-fcdd-ca52e1f52ca6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170113


On 12/17/20 2:40 AM, Jan Beulich wrote:
> On 17.12.2020 02:51, boris.ostrovsky@oracle.com wrote:
> I think this is acceptable as a workaround, albeit we may want to
> consider further restricting this (at least on staging), like e.g.
> requiring a guest config setting to enable the workaround. 


Maybe, but then someone migrating from a stable release to 4.15 will have to modify guest configuration.


> But
> maybe this will need to be part of the MSR policy for the domain
> instead, down the road. We'll definitely want Andrew's view here.
>
> Speaking of staging - before applying anything to the stable
> branches, I think we want to have this addressed on the main
> branch. I can't see how Solaris would work there.


Indeed it won't. I'll need to do that as well (I misinterpreted the statement in the XSA about only 4.14- being vulnerable)



-boris


