Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F427455D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 17:35:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKkJj-0006B2-4Q; Tue, 22 Sep 2020 15:34:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q5Ya=C7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kKkJh-0006Ax-Fo
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 15:34:53 +0000
X-Inumbo-ID: b2cbef69-6311-4345-816b-12205a0f3645
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2cbef69-6311-4345-816b-12205a0f3645;
 Tue, 22 Sep 2020 15:34:52 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08MFXZ4A115377;
 Tue, 22 Sep 2020 15:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=SQUZRxKbOrj7C5f6uXB0QaPDAWtQi5hHWGb3AMCGwok=;
 b=vXNxTqEaODuD+fyU1jUL8sgHm/70CoNspaljF2CVJy8YCkwoU79BXOLKh267UZHkplF8
 8gDxgeFrbFB3MPy3LpGLNkXfd1SvSHwK+Aa1BHsHL6vvwsYit9kqi55PmIfQ5VEjTtfj
 xYG2uDen9YZs91OrBwjVJcj7oFo6Mv3iUblQ43Pm81r+jgqhZ/1Tcx8D1VYYb7+x69fb
 n+qGpLjCo2XbRGqid1wVg1IbrdOhxG/60xd/nbbzTVHN4KXX5ILRDFS7r3qd1qqYr6Ez
 qQJnMwFLIBPdG4ZIkFCq9APz0yHuY8A6pTbvyMU5RcXkzUXKRKPdNqjFklU4rSPXqE1a Hw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 33ndnudj4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Sep 2020 15:34:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08MFURVL072451;
 Tue, 22 Sep 2020 15:34:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 33nujncaex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Sep 2020 15:34:41 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08MFYdJl019605;
 Tue, 22 Sep 2020 15:34:39 GMT
Received: from [10.74.86.236] (/10.74.86.236)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Sep 2020 08:34:38 -0700
Subject: Re: [PATCH 6/6] x86/xen: open code alloc_vm_area in arch_gnttab_valloc
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-7-hch@lst.de>
 <0833b9a8-5096-d105-a850-1336150eada1@oracle.com>
 <20200922145819.GA28420@lst.de>
 <ebd69ba1-fc06-3cc7-348e-3cb0004c2a34@oracle.com>
 <20200922152706.GA30633@lst.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <a3daaf31-d1cd-2bf1-5b2f-aaae32baa7f6@oracle.com>
Date: Tue, 22 Sep 2020 11:34:35 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200922152706.GA30633@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009220121
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


On 9/22/20 11:27 AM, Christoph Hellwig wrote:
> On Tue, Sep 22, 2020 at 11:24:20AM -0400, boris.ostrovsky@oracle.com wrote:
>> On 9/22/20 10:58 AM, Christoph Hellwig wrote:
>>> On Mon, Sep 21, 2020 at 04:44:10PM -0400, boris.ostrovsky@oracle.com wrote:
>>>> This will end up incrementing area->ptes pointer. So perhaps something like
>>>>
>>>>
>>>> pte_t **ptes = area->ptes;
>>>>
>>>> if (apply_to_page_range(&init_mm, (unsigned long)area->area->addr,
>>>>                         PAGE_SIZE * nr_frames, gnttab_apply, &ptes)) {
>>>>
>>>>        ...
>>> Yeah.  What do you think of this version? 
>>
>> Oh yes, this is way better. This now can actually be read without trying to mentally unwind triple pointers. (You probably want to initialize idx to zero before calling apply_to_page_range(), I am not sure it's guaranteed to be zero).
> Both instances are static variables, thus in .bss and initialized.
> So unless you insist I don't think we need a manual one.


Yes, you are right. (I thought perhaps this code could be called more than once but no, it can't).


-boris


