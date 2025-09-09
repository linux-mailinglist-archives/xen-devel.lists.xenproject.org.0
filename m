Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106DB4A862
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 11:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116053.1462474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuqp-0002SY-Uu; Tue, 09 Sep 2025 09:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116053.1462474; Tue, 09 Sep 2025 09:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuqp-0002Qk-SJ; Tue, 09 Sep 2025 09:41:23 +0000
Received: by outflank-mailman (input) for mailman id 1116053;
 Tue, 09 Sep 2025 09:41:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZzH=3U=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1uvuqp-0002Qe-7T
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 09:41:23 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2452ae64-8d61-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 11:41:22 +0200 (CEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58983LO1017978;
 Tue, 9 Sep 2025 09:40:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acqxs3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Sep 2025 09:40:44 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5899HIXj021030;
 Tue, 9 Sep 2025 09:40:43 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acqxs3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Sep 2025 09:40:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5896bOAX008428;
 Tue, 9 Sep 2025 09:40:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49109pjf7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Sep 2025 09:40:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 5899eexO52167112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Sep 2025 09:40:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 604B32004D;
 Tue,  9 Sep 2025 09:40:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D98620043;
 Tue,  9 Sep 2025 09:40:38 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.87.149.210])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Sep 2025 09:40:38 +0000 (GMT)
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
X-Inumbo-ID: 2452ae64-8d61-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=zWcQIXAgSZE3jCftx8qMBMf1VpUurI
	YqH9HodqEjE0k=; b=ERAKr2/0b+85Gl0gJGPChBwQF66LW3Oi2PTpVHT0S9O3cT
	Ogh6Obsb22mSDB6RKtFvicQxQH7Em5A8oD0I5nxAwaNb8/uo3nlQzflgWHoDaI73
	HJYbO2EM++BmL63dYswiKyf3DCl4sC43LQKUJvgYSzJoqo9flhIr4HpJX5FgSugx
	nxkpTZzhMCKXzjU82MrRkLPjYDbZe873Vx7Wql1XT2f1I7N0MW1XZjVRPa59K2LD
	VV7jPCPICsB1PgyR4Skp/kJKJN0V5UfeoBSNtFq2eg9a3cWAGVbhYaW2tp1HOhpP
	+lYn2f2O6UcFcD/48WOX69CsC02e71Jd9O9OLeiA==
Date: Tue, 9 Sep 2025 11:40:37 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
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
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CdA-H8SVNxdbZ5nTnrwiW_1I0UR-iy8D
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68bff61c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=xmnICLmBNk8AszDsb_MA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: uTrJRk-Nt5us74ILiXCJ7SL_HOQZhnLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXy71df+5jjUw/
 ntr+yICfUeQPRObSlyN3Yh1y4xhRnHGHhZFfRZCcvuRAacCykIbiLJkHQ30eUBJKOGl10TSIS42
 +3nIeLTG23/y6JszEVZ1Ed+b1iNk9DDxZsvwkIfCXfzVoNJXgV1cawSe1+N/vBFlEkK7ENOmW+P
 5QFev+/ePpqxVRniHssrBkwoaFfvkZZLW/2f9hVQyEtzMR8VsnBMkGYw6WFkufIgIXN5VkhAYVQ
 X+97jjddjBhYGKbSAHhaXMbOCL2qCKM7v5sv/V5bw5Wl8DJ9XDeAuCQ/41VgYzOkHMOtqD+ztQw
 0x/7e9psYHEV7vlYlvzJw+aRJnWLrm5gVwmA8e51Z46BZm3hlJcuLkZtLVQrCNNUZn7EXpW7Hgp
 /9u+P9X3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000

On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
> On 08.09.25 09:39, Kevin Brodsky wrote:
> > arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> > (taking and returning no value). This is proving problematic in
> > situations where leave() needs to restore some context back to its
> > original state (before enter() was called). In particular, this
> > makes it difficult to support the nesting of lazy_mmu sections -
> > leave() does not know whether the matching enter() call occurred
> > while lazy_mmu was already enabled, and whether to disable it or
> > not.
> > 
> > This patch gives all architectures the chance to store local state
> > while inside a lazy_mmu section by making enter() return some value,
> > storing it in a local variable, and having leave() take that value.
> > That value is typed lazy_mmu_state_t - each architecture defining
> > __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> > For now we define it as int everywhere, which is sufficient to
> > support nesting.
...
> > {
> > + lazy_mmu_state_t lazy_mmu_state;
> > ...
> > - arch_enter_lazy_mmu_mode();
> > + lazy_mmu_state = arch_enter_lazy_mmu_mode();
> > ...
> > - arch_leave_lazy_mmu_mode();
> > + arch_leave_lazy_mmu_mode(lazy_mmu_state);
> > ...
> > }
> > 
> > * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
> >    lazy_mmu is already enabled, and it temporarily disables it by
> >    calling leave() and then enter() again. Here we want to ensure
> >    that any operation between the leave() and enter() calls is
> >    completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
> >    leave() to fully disable lazy_mmu. enter() will then re-enable it
> >    - this achieves the expected behaviour, whether nesting occurred
> >    before that function was called or not.
> > 
> > Note: it is difficult to provide a default definition of
> > lazy_mmu_state_t for architectures implementing lazy_mmu, because
> > that definition would need to be available in
> > arch/x86/include/asm/paravirt_types.h and adding a new generic
> >   #include there is very tricky due to the existing header soup.
> 
> Yeah, I was wondering about exactly that.
> 
> In particular because LAZY_MMU_DEFAULT etc resides somewehere compeltely
> different.
> 
> Which raises the question: is using a new type really of any benefit here?
> 
> Can't we just use an "enum lazy_mmu_state" and call it a day?

I could envision something completely different for this type on s390,
e.g. a pointer to a per-cpu structure. So I would really ask to stick
with the current approach.

> -- 
> Cheers
> 
> David / dhildenb

Thanks!

