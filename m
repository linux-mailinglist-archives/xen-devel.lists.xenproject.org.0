Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF72E9B5C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61387.107978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwT6W-0007Ap-PF; Mon, 04 Jan 2021 16:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61387.107978; Mon, 04 Jan 2021 16:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwT6W-0007AQ-Lb; Mon, 04 Jan 2021 16:53:12 +0000
Received: by outflank-mailman (input) for mailman id 61387;
 Mon, 04 Jan 2021 16:53:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yCAg=GH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kwT6V-0007AL-DH
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:53:11 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3132754d-2fb1-40ca-8a8b-8085e50fe943;
 Mon, 04 Jan 2021 16:53:10 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104GnK1a098957;
 Mon, 4 Jan 2021 16:53:00 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35tg8qw6c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 16:53:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104GoLQ4071848;
 Mon, 4 Jan 2021 16:50:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 35v4rad74j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 16:50:59 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 104GovLu004300;
 Mon, 4 Jan 2021 16:50:57 GMT
Received: from [10.39.231.107] (/10.39.231.107)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 08:50:56 -0800
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
X-Inumbo-ID: 3132754d-2fb1-40ca-8a8b-8085e50fe943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=dIKUNFQXfKBLzwh06y3u/YF6xxzMrgkIGvxKrRgqYgA=;
 b=aIG0FeGjxOJtsruOwX4G69QifAoHMvGCA1UUWlmpAipf+1VO9AOSXua3w2TICEufqGpL
 fhIOb8NvGQQBfJreaHZG0g7kcvWrilZTmbd6J4teLCTFMmYHAGEb3MKIbZPca0SS2Uq9
 rw0rrigIjgT2Ali0kY+esDeNy7OvJ+mLxuGyPY3DYpp6YC+81Snf0V0Nlw4Vg23KVCLJ
 o0mXNBsqzEBYvIA4v1FO4ZTkkmn2NtsoNgRxY7kuk0VysMW/oly5Zbjavyt5ZVG9yXr2
 aSatIe9Aq4G2aj1fta0CLoa19dYZamI2O8UhoYN+yivnMQfH0XK0bJ+4N4pQEWUK5Z6W cg== 
Subject: Re: [PATCH 4/5] x86/xen: Don't register Xen IPIs when they aren't
 going to be used
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
 <20201224115323.3540130-5-dwmw2@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <a683f09b-30c9-bae2-7cc3-709196a90d9b@oracle.com>
Date: Mon, 4 Jan 2021 11:50:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224115323.3540130-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040109


On 12/24/20 6:53 AM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> In the case where xen_have_vector_callback is false, we still register
> the IPI vectors in xen_smp_intr_init() for the secondary CPUs even
> though they aren't going to be used. Stop doing that.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/xen/enlighten_hvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index a1c07e0c888e..7a6ef517e81a 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -164,10 +164,10 @@ static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>  	else
>  		per_cpu(xen_vcpu_id, cpu) = cpu;
>  	rc = xen_vcpu_setup(cpu);


Without vector callback we will not be calling xen_vcpu_setup(0) so why should we still call it here for APs?


-boris


> -	if (rc)
> +	if (rc || !xen_have_vector_callback)
>  		return rc;
>  
> -	if (xen_have_vector_callback && xen_feature(XENFEAT_hvm_safe_pvclock))
> +	if (xen_feature(XENFEAT_hvm_safe_pvclock))
>  		xen_setup_timer(cpu);
>  
>  	rc = xen_smp_intr_init(cpu);

