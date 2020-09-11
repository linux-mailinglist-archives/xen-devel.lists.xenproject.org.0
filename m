Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4232661FD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 17:20:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGkqM-00065e-Ut; Fri, 11 Sep 2020 15:20:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCNT=CU=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kGkqL-0005zj-Q9
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 15:20:05 +0000
X-Inumbo-ID: c0350e44-7658-4247-9448-dcb5aa7a4875
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0350e44-7658-4247-9448-dcb5aa7a4875;
 Fri, 11 Sep 2020 15:20:03 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08BFF3Zc061529;
 Fri, 11 Sep 2020 15:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=/MeEy7v1R447j4T1klPQoqAF2B+oLO9ldzBbaI8x8Es=;
 b=fjp11hQgk0M2ieGImtTlL3liHO/dyA25V5DntaVVhLX6Ilu+T/TV1XPoOJjeyYixOdXH
 zTu3b7QveAgDRj+O1ApqsEwqbXRl/lzWg7UZjAG6BWw4KrKZiZe0s1mRw0SMpwW/2LfK
 7YUZ5RbrKNusDmRcqbVYffyvdjomq6LGK4rSI1g0g1J8rhlMt28xUhkmSX9FazUWm2G2
 KyuibgxuaFLMs7xnoMXncD3eDGWm9zUul8GDnF48Ys6F2/7Cr3rvA60y7UAHvg4x611m
 A4nS3Z4JPOYu1YNBX3PDlGFv2TnzNlgfcG5BSV+f+eoo0qxkMfUYHDPryr29pkH/p7Bu Ng== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 33c2mmesjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Sep 2020 15:19:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08BFFHDE118910;
 Fri, 11 Sep 2020 15:19:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 33cmkd8cfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Sep 2020 15:19:31 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08BFJK2q027490;
 Fri, 11 Sep 2020 15:19:20 GMT
Received: from [10.74.86.16] (/10.74.86.16)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Sep 2020 08:19:20 -0700
Subject: Re: [PATCH v3 00/11] Fix PM hibernation in Xen guests
To: Anchal Agarwal <anchalag@amazon.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, x86@kernel.org, jgross@suse.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, kamatam@amazon.com,
 sstabellini@kernel.org, konrad.wilk@oracle.com, roger.pau@citrix.com,
 axboe@kernel.dk, davem@davemloft.net, rjw@rjwysocki.net,
 len.brown@intel.com, pavel@ucw.cz, peterz@infradead.org,
 eduval@amazon.com, sblbir@amazon.com, xen-devel@lists.xenproject.org,
 vkuznets@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org
References: <cover.1598042152.git.anchalag@amazon.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <03baf888-5c10-429b-3206-b75d4af1e09e@oracle.com>
Date: Fri, 11 Sep 2020 11:19:13 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1598042152.git.anchalag@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9741
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009110126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9741
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110125
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


On 8/21/20 6:22 PM, Anchal Agarwal wrote:
>
> Known issues:
> 1.KASLR causes intermittent hibernation failures. VM fails to resumes and
> has to be restarted. I will investigate this issue separately and shouldn't
> be a blocker for this patch series.


Is there any change in status for this? This has been noted since January.


-boris


> 2. During hibernation, I observed sometimes that freezing of tasks fails due
> to busy XFS workqueuei[xfs-cil/xfs-sync]. This is also intermittent may be 1
> out of 200 runs and hibernation is aborted in this case. Re-trying hibernation
> may work. Also, this is a known issue with hibernation and some
> filesystems like XFS has been discussed by the community for years with not an
> effectve resolution at this point.
>

