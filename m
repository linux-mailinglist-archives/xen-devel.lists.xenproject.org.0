Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95262D6AEC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 00:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49977.88379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knVFz-0000g3-1r; Thu, 10 Dec 2020 23:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49977.88379; Thu, 10 Dec 2020 23:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knVFy-0000fQ-Ty; Thu, 10 Dec 2020 23:21:54 +0000
Received: by outflank-mailman (input) for mailman id 49977;
 Thu, 10 Dec 2020 23:21:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EOQ=FO=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1knVFw-0000el-P0
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 23:21:52 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a86c38ee-5b62-4c94-a66e-7ae73e4d210e;
 Thu, 10 Dec 2020 23:21:52 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BANJcxD076282;
 Thu, 10 Dec 2020 23:21:08 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35825mg2bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 23:21:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BANKtw7149340;
 Thu, 10 Dec 2020 23:21:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 358m42f5be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 23:21:07 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BANKp8g025210;
 Thu, 10 Dec 2020 23:20:51 GMT
Received: from [10.39.227.125] (/10.39.227.125)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Dec 2020 15:20:51 -0800
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
X-Inumbo-ID: a86c38ee-5b62-4c94-a66e-7ae73e4d210e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=g9HQMgG8/lH1Xl7UdSJNvDAMRQCo3FWW7Bk60ydYMFM=;
 b=yiiSqUT1ul8LHgAfKjBlIB4yYYSpi+fGANCSKFFlOWkOUouS3Dv2O9HSPvMZHyva2HLa
 t2URiRpBCtd04nx9Lq/bUlqBSfAvdgny9AZ7r99NqQl+3SLxNcNacBmNDpvbnkmq+RJf
 tkHuWp0PFf1OqSZUrQZdo1op9pLE6PCegbVRzlACJRrfsJakcoaM7H+sCwUihUEMr2fQ
 dVrKn7O2B0uCiKt4l0ihiQonSCwdjdrSogLQz8qpbD6/3t1pwKq6cTqj0HVlsjBYL0mf
 j+yxZxQYgeFZOyVTmAVytFe3f0zAIJgGCpXDL4UlTLva10Xtrln9de8y9hZfow66cFAT Dg== 
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu
 interrupts
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>,
        Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
        linux-ntb@googlegroups.com,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Michal Simek <michal.simek@xilinx.com>, linux-pci@vger.kernel.org,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-rdma@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194045.250321315@linutronix.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com>
Date: Thu, 10 Dec 2020 18:20:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194045.250321315@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100149
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100149


On 12/10/20 2:26 PM, Thomas Gleixner wrote:
> All event channel setups bind the interrupt on CPU0 or the target CPU for
> percpu interrupts and overwrite the affinity mask with the corresponding
> cpumask. That does not make sense.
>
> The XEN implementation of irqchip::irq_set_affinity() already picks a
> single target CPU out of the affinity mask and the actual target is stored
> in the effective CPU mask, so destroying the user chosen affinity mask
> which might contain more than one CPU is wrong.
>
> Change the implementation so that the channel is bound to CPU0 at the XEN
> level and leave the affinity mask alone. At startup of the interrupt
> affinity will be assigned out of the affinity mask and the XEN binding will
> be updated. 


If that's the case then I wonder whether we need this call at all and instead bind at startup time.


-boris


> Only keep the enforcement for real percpu interrupts.

