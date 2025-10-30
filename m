Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F167C2137C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 17:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153869.1484125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEVc0-0006Fs-Cb; Thu, 30 Oct 2025 16:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153869.1484125; Thu, 30 Oct 2025 16:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEVc0-0006EQ-9E; Thu, 30 Oct 2025 16:34:56 +0000
Received: by outflank-mailman (input) for mailman id 1153869;
 Thu, 30 Oct 2025 16:34:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FvnV=5H=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1vEVby-0006EK-Uc
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 16:34:54 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59136e6c-b5ae-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 17:34:48 +0100 (CET)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59UDJBKn025673;
 Thu, 30 Oct 2025 16:34:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34afhj8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 16:34:06 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59UGNfcW026454;
 Thu, 30 Oct 2025 16:34:05 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34afhj8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 16:34:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59UGGqRH023873;
 Thu, 30 Oct 2025 16:34:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a33vx9rqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 16:34:04 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 59UGY24U58196474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Oct 2025 16:34:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 510842004B;
 Thu, 30 Oct 2025 16:34:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9ABBB20043;
 Thu, 30 Oct 2025 16:34:01 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.155.204.135])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 30 Oct 2025 16:34:01 +0000 (GMT)
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
X-Inumbo-ID: 59136e6c-b5ae-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=q8xDSEzqv0eO+i7RNgUG5zHxJFTihD
	qYuVwJgL1tFaw=; b=Br1VD/7YTed3oUT2iUZzltz2mPXnVAxgbDNLxlg7erZO0Q
	ndcdnpWoXHoUFilySRRpGIi+3NdaYZvtdrCuNelAEGAtrGqT/WKWkRG0++hqoaLl
	U3DO7TF4/SHlyudz6Ux33YMvs4FeaMwoobkrdswr1iH3NTBoydfGcStuaVfZdbDE
	P4zDXX/kY8AqU9LgWKdjwtpl3Llgg9/j/U/Of4egne0bsg/u40oDkXOy3QPdZquQ
	y0CFgu0n6tzgnJiezISNhw7bNixMWitpOdspE2bn/qlvp7I9fj9I5uAhF0vbAX/g
	Yc4wda7lBmeChb4Nq2HY0X5WFh+YjgYS56JDSgYQ==
Date: Thu, 30 Oct 2025 17:34:00 +0100
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
Message-ID: <46d9bb24-1603-4c75-8723-84a821b3c46c-agordeev@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <ef0cd4bc-1a37-4755-8957-d8a7e5c4564e-agordeev@linux.ibm.com>
 <d0767b70-5686-4f6e-8ca4-10b3f3ff3991@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0767b70-5686-4f6e-8ca4-10b3f3ff3991@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9WxMyXTitAyuhGu3vYNyzE5CUF2jkm71
X-Authority-Analysis: v=2.4 cv=WPhyn3sR c=1 sm=1 tr=0 ts=6903937e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=I6XwYfBBfidvHYRsdD8A:9 a=CjuIK1q_8ugA:10 a=DXsff8QfwkrTrK3sU8N1:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX7zpOZgRsm3FF
 8AnOBLOsvxptlWohzuosbbLPCFjAwF3xq2alPUZgZex8RCwqzG9eoZNV4NIOfsWBFJyYD+ygoAE
 rnoEx4aGNakZqeQ2SGwR0YJxSMuQm2OcteBULwoWnfyU/cMHNt88ZmCD4rU2jE3gxNJmWV7x33E
 oHSSsHXc4rB3cfyO0+d5kIH2YG18f2CCBQDyLSWgcAzaycIeZ5ROXf5OKaBsuvDDXGa4alxNW1z
 RdE+6Uxgxxzst1nDzVaufGD9/ZfHUthevkdMD9SntX+m955wZ+COJtAyQIs64arQ+vraDde5COT
 gqRLVlcqhoG5cbLpwOoCe3250RDdwFTHwZZLlnTZaB4WOK93liI9EHtPlX5NXI4lD6dhjalTaMQ
 w9GXLDeLcNNdyMoMeG4ROtBVzLwnYQ==
X-Proofpoint-ORIG-GUID: 98PgicvhjO7U-L0VCM0jVX32GpXzOiLG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166

On Thu, Oct 30, 2025 at 11:28:53AM +0100, Kevin Brodsky wrote:
> On 29/10/2025 17:41, Alexander Gordeev wrote:
> > On Wed, Oct 29, 2025 at 10:09:04AM +0000, Kevin Brodsky wrote:
> >
> > Hi Kevin,
> >
> >> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> >> +static inline bool in_lazy_mmu_mode(void)
> >> +{
> >> +	return current->lazy_mmu_state.active;
> > Whether (nesting_level > 0) is more correct check?
> > Otherwise, it returns false while in paused mode.
> 
> That's exactly the intention. Lazy MMU is disabled while paused. The
> users of that helper want to know if lazy MMU is currently enabled (to
> decide whether to batch updates for instance); whether this is because
> we are paused or not in any lazy_mmu section (nesting_level == 0) makes
> no difference.
> 
> > May be check both nesting_level and active and also introduce
> > in_lazy_mmu_paused_mode() right away to avoid any confusion?
> 
> Can you think of any situation where a caller would specifically want to
> know that lazy MMU is paused?

I thought I do, but in_lazy_mmu_mode() alone works just fine,
as you described (at least for now).

> - Kevin

Thanks!

