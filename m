Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C22970C3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 15:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10994.29190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVxH7-00055N-M1; Fri, 23 Oct 2020 13:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10994.29190; Fri, 23 Oct 2020 13:38:33 +0000
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
	id 1kVxH7-00054y-Io; Fri, 23 Oct 2020 13:38:33 +0000
Received: by outflank-mailman (input) for mailman id 10994;
 Fri, 23 Oct 2020 13:38:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXPM=D6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kVxH6-00054t-Lk
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:38:32 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baae3058-49e9-4e82-9e4e-d6c9268e788f;
 Fri, 23 Oct 2020 13:38:31 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NDYJeI087810;
 Fri, 23 Oct 2020 13:38:12 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34ak16uh2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 23 Oct 2020 13:38:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NDZlV4073341;
 Fri, 23 Oct 2020 13:38:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 348ah20hea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Oct 2020 13:38:11 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09NDc2iq013614;
 Fri, 23 Oct 2020 13:38:03 GMT
Received: from [10.74.86.114] (/10.74.86.114)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 23 Oct 2020 06:38:02 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qXPM=D6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kVxH6-00054t-Lk
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:38:32 +0000
X-Inumbo-ID: baae3058-49e9-4e82-9e4e-d6c9268e788f
Received: from userp2120.oracle.com (unknown [156.151.31.85])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id baae3058-49e9-4e82-9e4e-d6c9268e788f;
	Fri, 23 Oct 2020 13:38:31 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NDYJeI087810;
	Fri, 23 Oct 2020 13:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=f68vJI26CdskCy/ucIn4jhkM8wmlpjwl4MW/M1mNHhg=;
 b=PfdBGxLVfz4qeCvoJmnJEqhZdQbNZ1LH0KcIGHn1uWllnU0bExSIMwArZ086J/bcI0W/
 npbxmjzJIXAymSYSw4RZGVPRw67Xw55VB709eHh7kQqajaNOa3OcdyEw0CXukKX+gEoR
 9l3An1MhlDJtG6SnH4BISnKpCZw8L5/jiN5sXX/lqToCvdGdRA3VSIb5immyNSYw8Hmz
 hiefXPzRYqCbkt9ORvymaTfBnr4oJ3Vgk6xEUxJnOQCs9/nek1LRZ1t+eWjfHvZWl90I
 1gj0dj1JEg5ZmPDBOhgbKaLDNS3DAGm3FRMav1auuVyhqeydK5wgRrj4J23ZzPsiOb9R KA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 34ak16uh2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Oct 2020 13:38:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NDZlV4073341;
	Fri, 23 Oct 2020 13:38:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3020.oracle.com with ESMTP id 348ah20hea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Oct 2020 13:38:11 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09NDc2iq013614;
	Fri, 23 Oct 2020 13:38:03 GMT
Received: from [10.74.86.114] (/10.74.86.114)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 23 Oct 2020 06:38:02 -0700
Subject: Re: [PATCH v2 0/5] xen: event handling cleanup
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-doc@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>
References: <20201022094907.28560-1-jgross@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <71ea84e2-31d8-328d-fce6-fafb2010a229@oracle.com>
Date: Fri, 23 Oct 2020 09:37:59 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201022094907.28560-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010230095


On 10/22/20 5:49 AM, Juergen Gross wrote:
> Do some cleanups in Xen event handling code.
>
> Changes in V2:
> - addressed comments
>
> Juergen Gross (5):
>   xen: remove no longer used functions
>   xen/events: make struct irq_info private to events_base.c
>   xen/events: only register debug interrupt for 2-level events
>   xen/events: unmask a fifo event channel only if it was masked
>   Documentation: add xen.fifo_events kernel parameter description
>
>  .../admin-guide/kernel-parameters.txt         |  7 ++
>  arch/x86/xen/smp.c                            | 19 ++--
>  arch/x86/xen/xen-ops.h                        |  2 +
>  drivers/xen/events/events_2l.c                |  7 +-
>  drivers/xen/events/events_base.c              | 94 +++++++++++++------
>  drivers/xen/events/events_fifo.c              |  9 +-
>  drivers/xen/events/events_internal.h          | 70 ++------------
>  include/xen/events.h                          |  8 --
>  8 files changed, 102 insertions(+), 114 deletions(-)
>

Applied to for-linus-5.10b.


-boris


