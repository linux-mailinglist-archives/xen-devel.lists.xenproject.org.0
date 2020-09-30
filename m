Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D314427EAB1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739.2490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcp1-00082o-IP; Wed, 30 Sep 2020 14:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739.2490; Wed, 30 Sep 2020 14:11:07 +0000
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
	id 1kNcp1-00082P-F9; Wed, 30 Sep 2020 14:11:07 +0000
Received: by outflank-mailman (input) for mailman id 739;
 Wed, 30 Sep 2020 14:11:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4L7U=DH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kNcoz-00082K-Hh
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:11:05 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 118d81d1-862e-44ad-a740-410b33e7a812;
 Wed, 30 Sep 2020 14:11:03 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UE41ir152392;
 Wed, 30 Sep 2020 14:11:00 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 33su5b0t1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 14:10:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UEAngu185133;
 Wed, 30 Sep 2020 14:10:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 33tfdtyuu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 14:10:58 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08UEAviB028625;
 Wed, 30 Sep 2020 14:10:57 GMT
Received: from [10.74.86.12] (/10.74.86.12)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 30 Sep 2020 07:10:57 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4L7U=DH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kNcoz-00082K-Hh
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:11:05 +0000
X-Inumbo-ID: 118d81d1-862e-44ad-a740-410b33e7a812
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 118d81d1-862e-44ad-a740-410b33e7a812;
	Wed, 30 Sep 2020 14:11:03 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UE41ir152392;
	Wed, 30 Sep 2020 14:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=vzEB3YJL3N7wUcPuw7796PUa/Oe8OTJqZE6lGZWzKqY=;
 b=hvDPSp5EhGQJBANchZKLY9BN/2RajUpy7MAOl1FT0qS96URst14atzsaQLLhOVBEkgie
 Ife4/GwLspGlEAynhNApm5lGyMegsZbhvnf0akBK3ufi6ekM3s8sPmRIxxma9zqNaih5
 fJN68a9WI3Tzk/Q/XeawZyZMpUgII6nSHcF5m2176cXHwJvTuunYua0sEaLNkwYARGmp
 i43Th00WXm/PpFfGHAz5i97/ysflCIx52mGX9uHrl0kdxppPpkS4QE5QE55n9ce/c4sE
 oIQFiqlX/LWn+liIGnSE7GRnb51oNQCx2PSJLJP3yX6SCH9rtP+rSmBWBoAbEq0d5O8l Lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 33su5b0t1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Sep 2020 14:10:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UEAngu185133;
	Wed, 30 Sep 2020 14:10:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 33tfdtyuu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2020 14:10:58 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08UEAviB028625;
	Wed, 30 Sep 2020 14:10:57 GMT
Received: from [10.74.86.12] (/10.74.86.12)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 30 Sep 2020 07:10:57 -0700
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
 <a3df6cac-4d29-a5cf-2bb2-35a8834aef64@oracle.com>
 <CAFqt6za1JzbnxK1nuYZhGaj_MxRc33cbTXo7MyP+CgXTfYRXfg@mail.gmail.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <e4a103cd-d244-8f9c-b717-ca3795f6b8dc@oracle.com>
Date: Wed, 30 Sep 2020 10:10:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFqt6za1JzbnxK1nuYZhGaj_MxRc33cbTXo7MyP+CgXTfYRXfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009300113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300112



On 9/29/20 10:14 PM, Souptick Joarder wrote:
> On Tue, Sep 29, 2020 at 6:00 PM <boris.ostrovsky@oracle.com> wrote:
>>
>>
>> On 9/29/20 8:09 AM, Souptick Joarder wrote:
>>> On Fri, Sep 11, 2020 at 8:12 PM <boris.ostrovsky@oracle.com> wrote:
>>>>
>>>> On 9/6/20 2:51 AM, Souptick Joarder wrote:
>>>>> In 2019, we introduced pin_user_pages*() and now we are converting
>>>>> get_user_pages*() to the new API as appropriate. [1] & [2] could
>>>>> be referred for more information. This is case 5 as per document [1].
>>>>>
>>>>> [1] Documentation/core-api/pin_user_pages.rst
>>>>>
>>>>> [2] "Explicit pinning of user-space pages":
>>>>>         https://lwn.net/Articles/807108/
>>>>>
>>>>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
>>>>> Cc: John Hubbard <jhubbard@nvidia.com>
>>>>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>>>> Cc: Juergen Gross <jgross@suse.com>
>>>>> Cc: David Vrabel <david.vrabel@citrix.com>
>>>>
>>>> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> Are these 2 patches queued for 5.10-rc1 ?
>>
>>
>> Yes, I am preparing the branch. (BTW, your second patch appears to have been either manually edited or not generated on top of the first patch. Please don't do this next time)
> 
> I created it on top of the first one and didn't edit manually.
> I was able to apply it in my local repository.
> What was the error ?
> 


Patch 1:

+		if (batch->writeable && !PageDirty(batch->pages[i]))


Patch 2:

-		if(batch->writeable && !PageDirty(batch->pages[i]))



This doesn't look to me like usual whitespace damage in-flight. Anyway, this has been applied to for-linus-5.10


-boris

