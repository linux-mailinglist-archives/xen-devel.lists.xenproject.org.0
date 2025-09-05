Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C92B45D16
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 17:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112096.1460527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuYl0-00073G-W7; Fri, 05 Sep 2025 15:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112096.1460527; Fri, 05 Sep 2025 15:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuYl0-00071g-TR; Fri, 05 Sep 2025 15:53:46 +0000
Received: by outflank-mailman (input) for mailman id 1112096;
 Fri, 05 Sep 2025 15:53:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJZl=3Q=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1uuYkz-00071a-7M
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 15:53:45 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f2efbbf-8a70-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 17:53:43 +0200 (CEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858qiX8001199;
 Fri, 5 Sep 2025 15:52:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshfcpx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Sep 2025 15:52:50 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 585Fmcsp012235;
 Fri, 5 Sep 2025 15:52:49 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshfcpwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Sep 2025 15:52:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 585FmxfV019937;
 Fri, 5 Sep 2025 15:52:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48vbmujcy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Sep 2025 15:52:48 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 585Fqke750659768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Sep 2025 15:52:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C56520043;
 Fri,  5 Sep 2025 15:52:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DCE620040;
 Fri,  5 Sep 2025 15:52:45 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.111.48.240])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri,  5 Sep 2025 15:52:45 +0000 (GMT)
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
X-Inumbo-ID: 7f2efbbf-8a70-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=yrKzRKvPlqc1QwFwyTNKlG24n0S3B0
	erGWAU2bVkVqg=; b=qnifUl96cq8S6mdWIUWZY6BIWU8yF2upNweBx/YvMVrUqk
	RurxzzOfjdHTO1vZruHBUGw3vkJ3WeEmWzLy0ib2dt0fUdi9302JluZSn5voqpb9
	tt+K2LZopne4AXw3OGAsBjWP8De3MBm1hwH4/INAMOLsTRAjDmX8jUJ/gKxB4XAc
	KrIlZNUzwzjCaqkU+ZOpln4XrPIJTWESS5y/saIRobaltfDoOVm72NdzSHeS2nKf
	hGMYLo6HZzSBX5xdzjXsfqIsGIlRMWccKTKAhN9S2rP+bQ/qPKUMPRNpVA8A/v6E
	L8fXKTqpSJEYDa6i80pdzLQ72TamFaiRukB8PM0g==
Date: Fri, 5 Sep 2025 17:52:43 +0200
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
Subject: Re: [PATCH 5/7] powerpc/mm: support nested lazy_mmu sections
Message-ID: <074ff6ab-5868-4fde-b5bb-9e17632ad817-agordeev@linux.ibm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-6-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904125736.3918646-6-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lCd6YOMsS3DuDBadSx3AqoWK9sgWIwBw
X-Authority-Analysis: v=2.4 cv=do3bC0g4 c=1 sm=1 tr=0 ts=68bb0752 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=j0AthGTrb4EvYsEn83oA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: f87PfJay9odLOn37oqVwjr2CAlcWWHn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfX6sVQx3QDeZVb
 n0/AHQXDAd1IPDvrbQDAZqWNvYoji1vUEPP9JAjcx2sdZwqxFNT8P6jKDiqCdhkxMnGuyNq6xN0
 S8g8X6OMzE3gSb6sI+vSPcwT7zIQgnHlzsA9jiitgokDLD2w11I2lobQd0RzFFdQVPBFq7gLH2W
 w3OGrenK+wBn0voMSBbmNjp1Fjlqy/CSo5Vh9PvP5VNsOgQXuA9fqz0KJ8mfFGOfUfce75STf2p
 eu65lI0DTVxqmjYKeyaFdLRjc3SxwtmZeh1Pe6KdSGdqawAHM6zOfs0r4Yils+ob60NU/kRnAup
 7+9DLLEmBuvBzuYqwqF9czbkIes2bGJOe8p5YqMQ0X/8i+oJ9lIUH4tj2BythK5q2hT0kmdi9nq
 KtlUPSlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020040

On Thu, Sep 04, 2025 at 01:57:34PM +0100, Kevin Brodsky wrote:
...
>  static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	struct ppc64_tlb_batch *batch;
> +	int lazy_mmu_nested;
>  
>  	if (radix_enabled())
>  		return LAZY_MMU_DEFAULT;
> @@ -39,9 +40,14 @@ static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  	 */
>  	preempt_disable();
>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
> -	batch->active = 1;
> +	lazy_mmu_nested = batch->active;
>  
> -	return LAZY_MMU_DEFAULT;
> +	if (!lazy_mmu_nested) {

Why not just?

	if (!batch->active) {

> +		batch->active = 1;
> +		return LAZY_MMU_DEFAULT;
> +	} else {
> +		return LAZY_MMU_NESTED;
> +	}
>  }
>  
>  static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
> @@ -54,7 +60,10 @@ static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  
>  	if (batch->index)
>  		__flush_tlb_pending(batch);
> -	batch->active = 0;
> +
> +	if (state != LAZY_MMU_NESTED)
> +		batch->active = 0;
> +
>  	preempt_enable();
>  }

Thanks!

