Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA7AB453B2
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 11:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111557.1460218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuT2a-0004OQ-5X; Fri, 05 Sep 2025 09:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111557.1460218; Fri, 05 Sep 2025 09:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuT2a-0004LK-2D; Fri, 05 Sep 2025 09:47:32 +0000
Received: by outflank-mailman (input) for mailman id 1111557;
 Fri, 05 Sep 2025 09:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJZl=3Q=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1uuT2Y-0004LE-GO
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 09:47:30 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5275ef4b-8a3d-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 11:47:24 +0200 (CEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858E7UF022544;
 Fri, 5 Sep 2025 09:46:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usurfkcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Sep 2025 09:46:31 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5859bi0p009310;
 Fri, 5 Sep 2025 09:46:30 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usurfkc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Sep 2025 09:46:30 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5856Gg3M013959;
 Fri, 5 Sep 2025 09:46:29 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3rk09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Sep 2025 09:46:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 5859kQ0M52101484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Sep 2025 09:46:26 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCE5220040;
 Fri,  5 Sep 2025 09:46:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF00220063;
 Fri,  5 Sep 2025 09:46:24 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.111.88.103])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri,  5 Sep 2025 09:46:24 +0000 (GMT)
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
X-Inumbo-ID: 5275ef4b-8a3d-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=6wm0ttcidOnuuW+7W5s4enprUWnKXF
	XXBpVS5cSOiYc=; b=VMha2oUbllfJfLMtOLr57qJJz6vzFJD7LJ8gk5XShnJjc7
	IbrZHVpXb0CrQB5ykpgaxxSFsvvfNEanPBHuuHOGbETD14NXO2pqfL1MNf784mVy
	uvjiyf12/QVwQ2mZmkqASP9O1WaaViYltK6jPW1ia7fc4z77ZZIcxHNd6zZP5Nha
	CbH/zL34/kidtMFkhDHPIOsMEJbRBMwe8T8wEPT/Ddq6WBOoaLYfsZ8bm+i7vTSv
	P1GmCBCUdyPpWD67R2YaTENZDIlFGnxT+oj4rEpMuGkVtfQCqHsL9/re90DkKZLP
	0DLbyK939ud6LvSGoOT7rBnWZkhI2AUGLtGlCZgg==
Date: Fri, 5 Sep 2025 11:46:23 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/7] Nesting support for lazy MMU mode
Message-ID: <9fd076c7-f163-4b92-8201-d8a259a338c1-agordeev@linux.ibm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904125736.3918646-1-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMCBTYWx0ZWRfX0b7vKa9wIqUd
 15JIKVxY/eFyoNy0/rx0rVDv/Yc4PB6ogniG6U5JZlC8qyn8Y0NgFv6oYYbeCaWjZF7P/Etub/q
 /XnEYzafYNkoOrYQMbqj6nFHYpYxymufPYjcGAjaRnVt2jxUzS3zPb6lpNjC6s5Oxrs0WYMRvbR
 dBvy+J/7pMy+teTA+x9T/E6ggkXyizQGe//4AxcBxcrhCKNqzem6rRKcxJLTefmrfU0CU2VW6uC
 5x2JqlOAMSNtXM1AfGSytrxIFOr2S3XPEdTEP1QyOTNlKzTtGtrjaWkIbxQVZc7XyWa9Ggbdnl8
 wkgYg373aI71Rh0ZOzmEr1tWX4M68Yz9HwoQbCiqMpeXkMBa3EZ9mW+HowhL506x5+1yPvl4rLU
 90pIQxaV
X-Proofpoint-GUID: NmMecPGQNEFV5Z6yet56qjNF4vqqAdRy
X-Proofpoint-ORIG-GUID: 1xCeVzb0bz4EbY7yd5ySncyf5nvF03Hn
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=68bab177 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=PE-dCK3ueRk4C2obWmcA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300030

On Thu, Sep 04, 2025 at 01:57:29PM +0100, Kevin Brodsky wrote:

Hi Kevin,

> When the lazy MMU mode was introduced eons ago, it wasn't made clear
> whether such a sequence was legal:
> 
> 	arch_enter_lazy_mmu_mode()
> 	...
> 		arch_enter_lazy_mmu_mode()
> 		...
> 		arch_leave_lazy_mmu_mode()
> 	...
> 	arch_leave_lazy_mmu_mode()

I did not take too deep - sorry if you already answered this.
Quick question - whether a concern Ryan expressed is addressed
in general case?

https://lore.kernel.org/all/3cad01ea-b704-4156-807e-7a83643917a8@arm.com/

	enter_lazy_mmu
		for_each_pte {
			read/modify-write pte

			alloc_page
				enter_lazy_mmu
					make page valid
				exit_lazy_mmu

			write_to_page
		}
	exit_lazy_mmu

<quote>
This example only works because lazy_mmu doesn't support nesting. The "make page
valid" operation is completed by the time of the inner exit_lazy_mmu so that the
page can be accessed in write_to_page. If nesting was supported, the inner
exit_lazy_mmu would become a nop and write_to_page would explode.
</quote>

...

Thanks!

