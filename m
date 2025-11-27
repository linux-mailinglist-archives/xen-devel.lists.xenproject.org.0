Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFE6C8E460
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 13:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173774.1498774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObCs-0004Eg-30; Thu, 27 Nov 2025 12:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173774.1498774; Thu, 27 Nov 2025 12:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObCs-0004CH-0N; Thu, 27 Nov 2025 12:34:42 +0000
Received: by outflank-mailman (input) for mailman id 1173774;
 Thu, 27 Nov 2025 12:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkQw=6D=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1vObCp-0004CA-ST
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 12:34:39 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f6b0920-cb8d-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 13:34:38 +0100 (CET)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AR28C0C010976;
 Thu, 27 Nov 2025 12:33:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4w9smjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Nov 2025 12:33:12 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5ARCRff3010922;
 Thu, 27 Nov 2025 12:33:12 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4w9smjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Nov 2025 12:33:12 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AR9paJp030755;
 Thu, 27 Nov 2025 12:33:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4akqgsr7cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Nov 2025 12:33:10 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 5ARCX7Gu41746800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Nov 2025 12:33:07 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00AAE20040;
 Thu, 27 Nov 2025 12:33:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BACC920049;
 Thu, 27 Nov 2025 12:33:05 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.155.204.135])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Nov 2025 12:33:05 +0000 (GMT)
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
X-Inumbo-ID: 6f6b0920-cb8d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=U/SiOGxBruZSPDZESgyMeWRoh9i3M0
	q8OwIPHZ+5svo=; b=J4oL5vFegHjiNGUagzBApHvzd8MR3jsToqRXuYwO6O9Ano
	CfVy3024jZCEuLyMaeUHzi2cgBCQ5T6x4HVWA8NCfO7ZlKXGxRcy5YmZX37Zh2xF
	MzA5rDBMW3cmhVdAQSTeXH+hFh2FRdgAuqx1Jzqmk4tt/2ktJ1SEh2NYPAZO1/7q
	jBIoJv5xvHry1ZrUt9bk/no4UIxF0+pD3jnN2daFgo+pwGrp+lKi0J01wvI25Zwo
	Y+JFSohSzDUkcOH+osfpgqNaWu3TBtAGEL12D2LyBmVKPVw6tBHfq6+fKyW1yPof
	wj8Xue+B/9P6KlMUmOSnnh8qz3jHMVFftGHP1S7Q==
Date: Thu, 27 Nov 2025 13:33:04 +0100
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
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
Message-ID: <4d0eab1a-e1dc-49cf-8640-727c9734233d-agordeev@linux.ibm.com>
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124132228.622678-9-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAyMSBTYWx0ZWRfX9NOF0yN0lw1S
 0SZ2o+OA5NhSGQn0BtdyjjidP8fZgVZF6bKGYqOeYaerArXU5/eYaH6mjoMO836BpL61X8D4vHm
 UI4sk8Hx5RARonWYhreWmyHWARU9ObUiHo1rZ1488kywlyb4p1nLQviUeZWU5jHTK6ubjCRzp3f
 +lzNrZUD6k4MitmXkxXE1FBSz+t2k8OrxvuQ9N1qtEU671rSSdQQZW3OzxL73gwtwodSoKuCAd5
 zVlpdX6K+l3L9DoCrkZWL523cXAZ3K0nqrWUQOBp/3nUGHINn5pOunRbOHLW3tYBKmoRFSshw2u
 kphg/WcqiohDerAKQWOcIW/5lvy2GLS3clWCMDLpqje+49pqSaVI+EbpcYECNk2qFOMpAmxlrdh
 QN7hJqHTshMIrpIpwd78rJv0I72AAQ==
X-Proofpoint-ORIG-GUID: jxCWpMIwO3U273NtNuZU0G48jrPAegj4
X-Proofpoint-GUID: 4fLOgGROG6bc0vkQxWmm4vD-nC0jkq3o
X-Authority-Analysis: v=2.4 cv=TMJIilla c=1 sm=1 tr=0 ts=69284509 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l97El5uum0sds0BcBlYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511220021

On Mon, Nov 24, 2025 at 01:22:24PM +0000, Kevin Brodsky wrote:

Hi Kevin,

...
> +/**
> + * lazy_mmu_mode_pause() - Pause the lazy MMU mode.
> + *
> + * Pauses the lazy MMU mode; if it is currently active, disables it and calls
> + * arch_leave_lazy_mmu_mode().
> + *
> + * Must be paired with a call to lazy_mmu_mode_resume(). Calls to the
> + * lazy_mmu_mode_* API have no effect until the matching resume() call.

Sorry if it was discussed already - if yes, I somehow missed it. If I read
the whole thing correctly enter()/pause() interleaving is not forbidden?

lazy_mmu_mode_enable()
	lazy_mmu_mode_pause()
		lazy_mmu_mode_enable()
		...
		lazy_mmu_mode_disable()
	lazy_mmu_mode_resume()
lazy_mmu_mode_disable()

> + *
> + * Has no effect if called:
> + * - While paused (inside another pause()/resume() pair)
> + * - In interrupt context
> + */
>  static inline void lazy_mmu_mode_pause(void)
>  {
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
>  	if (in_interrupt())
>  		return;
>  
> -	arch_leave_lazy_mmu_mode();
> +	VM_WARN_ON_ONCE(state->pause_count == U8_MAX);
> +
> +	if (state->pause_count++ == 0 && state->enable_count > 0)
> +		arch_leave_lazy_mmu_mode();
>  }
>  
> +/**
> + * lazy_mmu_mode_pause() - Resume the lazy MMU mode.
                    resume() ?
> + *
> + * Resumes the lazy MMU mode; if it was active at the point where the matching
> + * call to lazy_mmu_mode_pause() was made, re-enables it and calls
> + * arch_enter_lazy_mmu_mode().
> + *
> + * Must match a call to lazy_mmu_mode_pause().
> + *
> + * Has no effect if called:
> + * - While paused (inside another pause()/resume() pair)
> + * - In interrupt context
> + */
>  static inline void lazy_mmu_mode_resume(void)
>  {
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
>  	if (in_interrupt())
>  		return;
>  
> -	arch_enter_lazy_mmu_mode();
> +	VM_WARN_ON_ONCE(state->pause_count == 0);
> +
> +	if (--state->pause_count == 0 && state->enable_count > 0)
> +		arch_enter_lazy_mmu_mode();
>  }
...
Thanks!

