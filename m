Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45D277C67
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 01:44:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLau6-0006UJ-Bi; Thu, 24 Sep 2020 23:43:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bm8I=DB=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kLau5-0006UD-Sw
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 23:43:57 +0000
X-Inumbo-ID: 3a68fa54-706f-4358-acf9-5e17e9ca1929
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a68fa54-706f-4358-acf9-5e17e9ca1929;
 Thu, 24 Sep 2020 23:43:57 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08ONZFwE100834;
 Thu, 24 Sep 2020 23:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=4T7MwI86Tdbp1GAwGn7YNnD5aIov6tuCb1xRlBKCjkY=;
 b=CYXf0fTjvhIsR7MRYK2KBGHpbztF/aSBrKi4pyo0Dba7lP1QzffF9CPARQdraZNI73aD
 pdTLv7jyyHQLejhJ4nowJicKzV9gY1GPionBKQtyk/PZ06iumKvC+pD6mk+0hyk7njzC
 GS9T7iPfoRsFXVyUllxOxzYlTSD7hNgYxKidCnPTF5w4IwR+Y6WXV0nJOoWfy5LL8j5G
 DEy3hiWToLa1rsZaobLFJjE5t/9errRxvKU5Y4gsvZV4F6anOfwOMiN+iuLrTmY9HVe8
 BCIHK9AWEb4xKtyvEZG3kf6gdFAhc+AL12nagwzml2CVspzeSy2PiT1xs8T6NG3nU2ow mg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 33ndnuu3fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 23:43:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08ONZTrb163168;
 Thu, 24 Sep 2020 23:43:42 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 33nux3jpv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 23:43:42 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08ONhexi002750;
 Thu, 24 Sep 2020 23:43:40 GMT
Received: from [10.74.109.22] (/10.74.109.22)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 16:43:40 -0700
Subject: Re: [PATCH 10/11] x86/xen: open code alloc_vm_area in
 arch_gnttab_valloc
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,
 Minchan Kim <minchan@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Nitin Gupta <ngupta@vflare.org>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
References: <20200924135853.875294-1-hch@lst.de>
 <20200924135853.875294-11-hch@lst.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <5222d13f-8eff-1536-4e8d-e4013039ecca@oracle.com>
Date: Thu, 24 Sep 2020 19:43:36 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200924135853.875294-11-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240170
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240170
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


On 9/24/20 9:58 AM, Christoph Hellwig wrote:
> Replace the last call to alloc_vm_area with an open coded version using
> an iterator in struct gnttab_vm_area instead of the triple indirection
> magic in alloc_vm_area.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



