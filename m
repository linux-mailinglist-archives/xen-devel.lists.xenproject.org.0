Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEAC27CBAD
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159.363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEmJ-0008GI-Dr; Tue, 29 Sep 2020 12:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159.363; Tue, 29 Sep 2020 12:30:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEmJ-0008Fr-AM; Tue, 29 Sep 2020 12:30:43 +0000
Received: by outflank-mailman (input) for mailman id 159;
 Tue, 29 Sep 2020 12:30:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CkLP=DG=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kNEmH-0008Fl-6j
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:30:41 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bf6ecd1-c1a6-40ae-a3ca-85039f4e3af9;
 Tue, 29 Sep 2020 12:30:39 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TCU42M162921;
 Tue, 29 Sep 2020 12:30:35 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 33swkktcgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 12:30:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TCTiP1051028;
 Tue, 29 Sep 2020 12:30:35 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 33tfjwmawj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Sep 2020 12:30:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08TCUX0l011674;
 Tue, 29 Sep 2020 12:30:33 GMT
Received: from [10.74.86.231] (/10.74.86.231)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Sep 2020 05:30:33 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CkLP=DG=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kNEmH-0008Fl-6j
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:30:41 +0000
X-Inumbo-ID: 9bf6ecd1-c1a6-40ae-a3ca-85039f4e3af9
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9bf6ecd1-c1a6-40ae-a3ca-85039f4e3af9;
	Tue, 29 Sep 2020 12:30:39 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TCU42M162921;
	Tue, 29 Sep 2020 12:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=mURocJg4aGJzNKsZw1W/x0nPR+UVj4K2kJtnPNURiU8=;
 b=H4BkzIxZhjVBIH2ne5xsO2mLMTQftXS1evUX6WfPYEO4AfKxH3BsWOB0JDq378hE6SrP
 UUkigvKYtWyjLB7fWaUVQPGahJ3bkSUgRrkXzOEIYB9T17briqCv3zPGjviv9P6d46CY
 LbrDFegyxtGXOj95F85zqtDrImUXE+9D5MPcafcKA9IS5KoxvKZ7+nHQ+3ITCvJ5xBAd
 6EYzsmJV0bUSw9BGxWX5bVLokoNUCx4vmZzU9jQh/dlUnSbU6hvPnm/fOL+UjT+bwbcC
 uJZT5MzF4gUwtVoNhoeVCB038QLsu2dWs/lvjkhnxexQM6ngYIaR3e4LUzJupPa3HMQu +A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 33swkktcgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Sep 2020 12:30:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TCTiP1051028;
	Tue, 29 Sep 2020 12:30:35 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 33tfjwmawj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Sep 2020 12:30:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08TCUX0l011674;
	Tue, 29 Sep 2020 12:30:33 GMT
Received: from [10.74.86.231] (/10.74.86.231)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 29 Sep 2020 05:30:33 -0700
Subject: Re: [PATCH 2/2] xen/gntdev.c: Convert get_user_pages*() to
 pin_user_pages*()
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
        John Hubbard <jhubbard@nvidia.com>
References: <1599375114-32360-1-git-send-email-jrdr.linux@gmail.com>
 <1599375114-32360-2-git-send-email-jrdr.linux@gmail.com>
 <8a608871-af25-fee6-24ea-24d78010cd6c@oracle.com>
 <CAFqt6zbKdzFDq6TTadQqQhwZPsZKJLW0LE9ER-qTHm7y3raw9w@mail.gmail.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <a3df6cac-4d29-a5cf-2bb2-35a8834aef64@oracle.com>
Date: Tue, 29 Sep 2020 08:30:30 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAFqt6zbKdzFDq6TTadQqQhwZPsZKJLW0LE9ER-qTHm7y3raw9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290111


On 9/29/20 8:09 AM, Souptick Joarder wrote:
> On Fri, Sep 11, 2020 at 8:12 PM <boris.ostrovsky@oracle.com> wrote:
>>
>> On 9/6/20 2:51 AM, Souptick Joarder wrote:
>>> In 2019, we introduced pin_user_pages*() and now we are converting
>>> get_user_pages*() to the new API as appropriate. [1] & [2] could
>>> be referred for more information. This is case 5 as per document [1].
>>>
>>> [1] Documentation/core-api/pin_user_pages.rst
>>>
>>> [2] "Explicit pinning of user-space pages":
>>>         https://lwn.net/Articles/807108/
>>>
>>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
>>> Cc: John Hubbard <jhubbard@nvidia.com>
>>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> Cc: Juergen Gross <jgross@suse.com>
>>> Cc: David Vrabel <david.vrabel@citrix.com>
>>
>> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Are these 2 patches queued for 5.10-rc1 ?


Yes, I am preparing the branch. (BTW, your second patch appears to have been either manually edited or not generated on top of the first patch. Please don't do this next time)


-boris


