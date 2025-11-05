Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23797C3699F
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 17:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156282.1485499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGg8Q-0002Y9-2X; Wed, 05 Nov 2025 16:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156282.1485499; Wed, 05 Nov 2025 16:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGg8P-0002VO-VA; Wed, 05 Nov 2025 16:13:21 +0000
Received: by outflank-mailman (input) for mailman id 1156282;
 Wed, 05 Nov 2025 16:13:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m6Tr=5N=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1vGg8N-0002VI-OL
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 16:13:19 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55ca2364-ba62-11f0-980a-7dc792cee155;
 Wed, 05 Nov 2025 17:13:16 +0100 (CET)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A54HYRj019236;
 Wed, 5 Nov 2025 16:12:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mra2tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Nov 2025 16:12:27 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A5FVr3J003755;
 Wed, 5 Nov 2025 16:12:27 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mra2tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Nov 2025 16:12:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A5Fg5qS009863;
 Wed, 5 Nov 2025 16:12:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1kgw7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Nov 2025 16:12:26 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 5A5GCOji52167096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Nov 2025 16:12:24 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3071320043;
 Wed,  5 Nov 2025 16:12:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 136CC20040;
 Wed,  5 Nov 2025 16:12:23 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.155.204.135])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  5 Nov 2025 16:12:23 +0000 (GMT)
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
X-Inumbo-ID: 55ca2364-ba62-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=hoOO0E96ahCdATo2vQq4UFuH8BQoyW
	GvRJ67v+d6zmY=; b=SGkprtBRmnhHNGgfbF3sg7Go+c8inCeDqeC9AZjQfWNjqP
	UlImdvXnB2eMzCk0pwDJKkF+IyFhEL/jEE8u1kZi8IReERwiQ1FVxGw+w2LhH+sy
	2G0xn4JOOstfTzc1c06KaQNGCHeOXa9vK9rwN0ha3pMsSVpC2jcrtdLnZUA5XPvR
	m+dXvo/F5oe8kUj+LdeKJtJbBvr0BqSaBvx8WxcuOGrxYtiM/WL6KzUAgfQRUPkh
	RrK27EIk9Nv7KGFJk1CZtMDciaSlLsrEXmshoHrTVS3KKkC1OsBwg3P57glcc1m8
	Yx7AzbSh81g2JkUW5G52BRvU1+355886S8zrCK3Q==
Date: Wed, 5 Nov 2025 17:12:21 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        David Woodhouse <dwmw2@infradead.org>,
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
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
Message-ID: <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <87ms5050g0.ritesh.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ms5050g0.ritesh.list@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0NFs_GrYa4zcH0BLNom4mOsajrCSPUxj
X-Authority-Analysis: v=2.4 cv=MKhtWcZl c=1 sm=1 tr=0 ts=690b776c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CPQ9TFRCZcvXz5jfQC4A:9 a=CjuIK1q_8ugA:10 a=DXsff8QfwkrTrK3sU8N1:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-ORIG-GUID: NNqKmXG2tTtHuvXhjQOh-riRMNlVPLAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwMSBTYWx0ZWRfX2KnrArcnBxcH
 TeGoejtsfYJDuRV3FbvjuDEBFMmDeOQEbaaSQExJ7765sDaLesq0lIorOycsEibo64TNmmHRSNz
 6XIuQLSaO5SrKkE/QNnJd3smjWHr0HSQ+uA+bMkugv+Df6gPVeHmGXHRAMUP3/n0rbDuuZ3m9UR
 Vw/WmiOn8NrnsxKTvVsuwmGs5I8kM0QBGFJCMl0xuCoTJbnjBxb2U37aEnIf2iT73qQhw1Rsaku
 Qftv0wlHgsh4K3kTYYn5/INUGE4LK5ev6oQVqwHTw5VhjuNirNmgcqWMIXq1s/3gqUc/RmuAgWN
 rH1ZA/5Add3j27sIoKtigY6uE1hzOktXQSO9iyvuDIkbiOtgLSq15NhyhwbIusKnV/r5/eZHbpi
 xbMKu5ZjKQ3ntqUuRquH+Yb1K/SdzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010001

On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
> > + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
> > + * currently enabled.
> >   */
> >  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> >  static inline void lazy_mmu_mode_enable(void)
> >  {
> > -	arch_enter_lazy_mmu_mode();
> > +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> > +
> > +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
> > +	/* enable() must not be called while paused */
> > +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
> > +
> > +	if (state->nesting_level++ == 0) {
> > +		state->active = true;
> > +		arch_enter_lazy_mmu_mode();
> > +	}
> >  }
> 
> Some architectures disables preemption in their
> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.

Do you have some scenario in mind that could cause an issue?
IOW, what could go wrong if the process is scheduled to another
CPU before preempt_disable() is called?

>   static inline void lazy_mmu_mode_enable(void)
>   {
>  -	arch_enter_lazy_mmu_mode();
>  +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>  +
>  +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>  +	/* enable() must not be called while paused */
>  +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>  +
>  +	if (state->nesting_level++ == 0) {
>  +		arch_enter_lazy_mmu_mode();
>  +		state->active = true;
>  +	}
>   }
> 
> ... I think it make more sense to enable the state after the arch_**
> call right.

But then in_lazy_mmu_mode() would return false if called from
arch_enter_lazy_mmu_mode(). Not big problem, but still..

> >  static inline void lazy_mmu_mode_disable(void)
> >  {
> > -	arch_leave_lazy_mmu_mode();
> > +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> > +
> > +	VM_WARN_ON_ONCE(state->nesting_level == 0);
> > +	VM_WARN_ON(!state->active);
> > +
> > +	if (--state->nesting_level == 0) {
> > +		state->active = false;
> > +		arch_leave_lazy_mmu_mode();
> > +	} else {
> > +		/* Exiting a nested section */
> > +		arch_flush_lazy_mmu_mode();
> > +	}
> >  }
> 
> This looks ok though.
> 
> >  
> >  static inline void lazy_mmu_mode_pause(void)
> >  {
> > +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> > +
> > +	VM_WARN_ON(state->nesting_level == 0 || !state->active);
> > +
> > +	state->active = false;
> >  	arch_leave_lazy_mmu_mode();
> >  }
> >  
> >  static inline void lazy_mmu_mode_resume(void)
> >  {
> > +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> > +
> > +	VM_WARN_ON(state->nesting_level == 0 || state->active);
> > +
> > +	state->active = true;
> >  	arch_enter_lazy_mmu_mode();
> >  }
> 
> Ditto.
> 
> -ritesh

