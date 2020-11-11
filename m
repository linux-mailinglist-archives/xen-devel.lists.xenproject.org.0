Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB362AE75A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 05:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24185.51324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kchae-0003Ng-Ga; Wed, 11 Nov 2020 04:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24185.51324; Wed, 11 Nov 2020 04:18:36 +0000
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
	id 1kchae-0003NH-DD; Wed, 11 Nov 2020 04:18:36 +0000
Received: by outflank-mailman (input) for mailman id 24185;
 Wed, 11 Nov 2020 04:18:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nWKd=ER=oracle.com=martin.petersen@srs-us1.protection.inumbo.net>)
 id 1kchad-0003NC-4A
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 04:18:35 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8eb0979-0d4d-4e67-89c5-c86ef86b693d;
 Wed, 11 Nov 2020 04:18:33 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AB49Tbn187079;
 Wed, 11 Nov 2020 04:18:21 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34p72en941-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 04:18:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AB4Arf2138947;
 Wed, 11 Nov 2020 04:18:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 34p5g179j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Nov 2020 04:18:20 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AB4IBdx000879;
 Wed, 11 Nov 2020 04:18:11 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Nov 2020 20:18:09 -0800
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nWKd=ER=oracle.com=martin.petersen@srs-us1.protection.inumbo.net>)
	id 1kchad-0003NC-4A
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 04:18:35 +0000
X-Inumbo-ID: e8eb0979-0d4d-4e67-89c5-c86ef86b693d
Received: from userp2120.oracle.com (unknown [156.151.31.85])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e8eb0979-0d4d-4e67-89c5-c86ef86b693d;
	Wed, 11 Nov 2020 04:18:33 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AB49Tbn187079;
	Wed, 11 Nov 2020 04:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=EwuOibuX72u5GW/vr3IZET1mbk4Qqp2f1lpQhsZMo3U=;
 b=rdxx8bfCoz66U7/JxdRXyqosHLyk6104gocou3/pxKr+MBaHN9z+JG22xyBjdFrs/toj
 u8kyE9Mnx40f+onFhQWnASdg9eewdpqao7JjD8N8PDe0bDGwb4iBUgCzzxwXH2tPfd4b
 ZewD9ZDiq4ttMBKnV5hFCYBDOG9JBlIzwIQL8q1J/Y6q7a+0GcQKjASc2OGvEo13qqVS
 YW2PdJ4GC1fZvqx8aM04P1FnQraTmrtlR84Q48lCpCKfWOIJkugsvGV1CkUq/whUbI2D
 eu9b4yGyWVKNklkWbsL8Eg4w7p+siPP69BiWWD0dUAtW6doZkGUQe3KqPOb7wn/WWPSd sQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 34p72en941-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2020 04:18:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AB4Arf2138947;
	Wed, 11 Nov 2020 04:18:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 34p5g179j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Nov 2020 04:18:20 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AB4IBdx000879;
	Wed, 11 Nov 2020 04:18:11 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 Nov 2020 20:18:09 -0800
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
        Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        "Michael S. Tsirkin"
 <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Minchan Kim <minchan@kernel.org>, Mike Snitzer
 <snitzer@redhat.com>,
        Song Liu <song@kernel.org>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        dm-devel@redhat.com, linux-block@vger.kernel.org,
        drbd-dev@tron.linbit.com, nbd@other.debian.org,
        ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 04/24] sd: update the bdev size in sd_revalidate_disk
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle
Message-ID: <yq1tutwedcb.fsf@ca-mkp.ca.oracle.com>
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-5-hch@lst.de>
Date: Tue, 10 Nov 2020 23:18:05 -0500
In-Reply-To: <20201106190337.1973127-5-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 6 Nov 2020 20:03:16 +0100")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=887 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110019
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=877 mlxscore=0
 malwarescore=0 suspectscore=1 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110019


Christoph,

> This avoids the extra call to revalidate_disk_size in sd_rescan and
> is otherwise a no-op because the size did not change, or we are in
> the probe path.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

