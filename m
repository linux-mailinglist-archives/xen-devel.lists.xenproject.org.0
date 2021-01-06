Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901B2EBFD1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 15:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62524.110786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxA9I-0008Aw-6r; Wed, 06 Jan 2021 14:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62524.110786; Wed, 06 Jan 2021 14:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxA9I-0008AX-3c; Wed, 06 Jan 2021 14:50:56 +0000
Received: by outflank-mailman (input) for mailman id 62524;
 Wed, 06 Jan 2021 14:50:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OkmI=GJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxA9G-0008AS-JK
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 14:50:54 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e399b297-4e01-4ff5-9ab6-38e8a468edfa;
 Wed, 06 Jan 2021 14:50:53 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106EojSE090402;
 Wed, 6 Jan 2021 14:50:47 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35wcuxrjpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 14:50:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106EePdu173807;
 Wed, 6 Jan 2021 14:48:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 35w3qs3p2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 14:48:04 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 106Em3u0009608;
 Wed, 6 Jan 2021 14:48:03 GMT
Received: from [10.39.201.28] (/10.39.201.28)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 14:48:03 +0000
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
X-Inumbo-ID: e399b297-4e01-4ff5-9ab6-38e8a468edfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=MUFR7sJVr2fQx5Q1VUWYy5SkIXs9bBXxJWdfZ2qkLkw=;
 b=JQP0CC8QpPXYZVuLuOKfGk7Pkms2Uhqjs4lawszqovZ6feUCFkDMiwxbFhy/s+k5K4NI
 xVgwmwqwxP3Oe9j0ympV+IYaLZIw6REnCw5kD2ZjoRRrwnQXTLY0qlxIgbvbB8+yQmNV
 PHNJbJ1AykWJXDbK7ta180DdzLHZ/XkIgoGYH7Xx+/OUapsIZ0CG8iUaMO74av5fCD+1
 fb8QCMtPpvgF2TzcsMmQ9OrtJcTNnC8AQK6bykktPRLy2y3RtcHfyQ8Yr0QPM6cDgAFG
 lZkRzxtR7fGT91lGsBA5JOYPOc0PaeGTM7MOeJsUGnUhR6YE8EzFH2ueFGNQP+ahFku1 gg== 
Subject: Re: [PATCH v2 5/5] x86/xen: Fix xen_hvm_smp_init() when vector
 callback not available
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20210105235736.326797-1-dwmw2@infradead.org>
 <20210105235736.326797-6-dwmw2@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <c85cfd20-cd69-5cea-5be1-2186763c3e26@oracle.com>
Date: Wed, 6 Jan 2021 09:48:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105235736.326797-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101060093


On 1/5/21 6:57 PM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Only the IPI-related functions in the smp_ops should be conditional
> on the vector callback being available. The rest should still happen:
>
>  • xen_hvm_smp_prepare_boot_cpu()
>
>    This function does two things, both of which should still happen if
>    there is no vector callback support.
>
>    The call to xen_vcpu_setup() for vCPU0 should still happen as it just
>    sets up the vcpu_info for CPU0. That does happen for the secondary
>    vCPUs too, from xen_cpu_up_prepare_hvm().
>
>    The second thing it does is call xen_init_spinlocks(), which perhaps
>    counter-intuitively should *also* still be happening in the case
>    without vector callbacks, so that it can clear its local xen_pvspin
>    flag and disable the virt_spin_lock_key accordingly.
>
>    Checking xen_have_vector_callback in xen_init_spinlocks() itself
>    would affect PV guests, so set the global nopvspin flag in
>    xen_hvm_smp_init() instead, when vector callbacks aren't available.
>
>  • xen_hvm_smp_prepare_cpus()
>
>    This does some IPI-related setup by calling xen_smp_intr_init() and
>    xen_init_lock_cpu(), which can be made conditional. And it sets the
>    xen_vcpu_id to XEN_VCPU_ID_INVALID for all possible CPUS, which does
>    need to happen.
>
>  • xen_smp_cpus_done()
>
>    This offlines any vCPUs which doesn't fit in the global shared_info
>    page, if separate vcpu_info placement isn't available. That part also
>    needs to happen regardless of vector callback support.
>
>  • xen_hvm_cpu_die()
>
>    This doesn't actually do anything other than commin_cpu_die() right
>    right now in the !vector_callback case; all three teardown functions
>    it calls should be no-ops. But to guard against future regressions
>    it's useful to call it anyway, and for it to explicitly check for
>    xen_have_vector_callback before calling those additional functions.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


