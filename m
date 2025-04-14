Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E421FA883C3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 16:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950341.1346697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KR7-0006Nf-4a; Mon, 14 Apr 2025 14:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950341.1346697; Mon, 14 Apr 2025 14:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KR7-0006M1-1r; Mon, 14 Apr 2025 14:05:21 +0000
Received: by outflank-mailman (input) for mailman id 950341;
 Mon, 14 Apr 2025 14:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMrm=XA=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1u4KR6-0006Lv-A4
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 14:05:20 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e7b1f8f-1939-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 16:05:18 +0200 (CEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EA4ATV027370;
 Mon, 14 Apr 2025 14:04:44 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46109f167h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Apr 2025 14:04:44 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53EDcZPO016703;
 Mon, 14 Apr 2025 14:04:42 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 460571x6a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Apr 2025 14:04:42 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 53EE4f4G48300418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Apr 2025 14:04:41 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 212F720043;
 Mon, 14 Apr 2025 14:04:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30D1920040;
 Mon, 14 Apr 2025 14:04:40 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.171.13.82]) by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 14 Apr 2025 14:04:40 +0000 (GMT)
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
X-Inumbo-ID: 7e7b1f8f-1939-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=mR/z8wqlahqEQEIdoTwi+iagtqGDJe
	kWvs0xnEoJMPE=; b=DpyD6Udw88tqaPr0fYcs3CazdQ5QWENJPynzyhJZnbNOi5
	zY0G9Hu7PEsJ3TjJG7rVrb/GbHvfITN3AIbtoLh/H0aKWaZX+1eKMHjVLpwTeAUE
	lRbqHvx0K9kSyQT0HXlbLRn1suq7p1N21lpak5cyhNJDX+1kLb81jLSzQe19TM2X
	xKrKJV6i/xFFC2mKilEeszzr+tgbhoVNSPBwhEulRvMdF1Ct68oZPbXVDMaG0p/U
	WXYRkSiwc4AJlRENzE7s4q7aNYIHCvE9+ZUHe6U9seSlEUrtTlhISJ0ht+Fdm4uA
	x4K+2XDTVTvm98SnPR0wm7k4SM2+vbROYs8t7LSA==
Date: Mon, 14 Apr 2025 16:04:38 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Fix lazy mmu mode
Message-ID: <Z/0V9r6rjEjSH3fh@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
 <912c7a32-b39c-494f-a29c-4865cd92aeba@agordeev.local>
 <5b0609c9-95ee-4e48-bb6d-98f57c5d2c31@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b0609c9-95ee-4e48-bb6d-98f57c5d2c31@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xm9MkOqhRW8-TUfXNY7yPIc4SjJFzfI0
X-Proofpoint-ORIG-GUID: Xm9MkOqhRW8-TUfXNY7yPIc4SjJFzfI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 clxscore=1015 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504140102

On Mon, Apr 14, 2025 at 02:22:53PM +0100, Ryan Roberts wrote:
> On 10/04/2025 17:07, Alexander Gordeev wrote:
> >> I'm planning to implement lazy mmu mode for arm64 to optimize vmalloc. As part
> >> of that, I will extend lazy mmu mode to cover kernel mappings in vmalloc table
> >> walkers. While lazy mmu mode is already used for kernel mappings in a few
> >> places, this will extend it's use significantly.
> >>
> >> Having reviewed the existing lazy mmu implementations in powerpc, sparc and x86,
> >> it looks like there are a bunch of bugs, some of which may be more likely to
> >> trigger once I extend the use of lazy mmu.
> > 
> > Do you have any idea about generic code issues as result of not adhering to
> > the originally stated requirement:
> > 
> >   /*
> >    ...
> >    * the PTE updates which happen during this window.  Note that using this
> >    * interface requires that read hazards be removed from the code.  A read
> >    * hazard could result in the direct mode hypervisor case, since the actual
> >    * write to the page tables may not yet have taken place, so reads though
> >    * a raw PTE pointer after it has been modified are not guaranteed to be
> >    * up to date.
> >    ...
> >    */
> > 
> > I tried to follow few code paths and at least this one does not look so good:
> > 
> > copy_pte_range(..., src_pte, ...)
> > 	ret = copy_nonpresent_pte(..., src_pte, ...)
> > 		try_restore_exclusive_pte(..., src_pte, ...)	// is_device_exclusive_entry(entry)
> > 			restore_exclusive_pte(..., ptep, ...)
> > 				set_pte_at(..., ptep, ...)
> > 					set_pte(ptep, pte);	// save in lazy mmu mode
> > 
> > 	// ret == -ENOENT
> > 
> > 	ptent = ptep_get(src_pte);				// lazy mmu save is not observed
> > 	ret = copy_present_ptes(..., ptent, ...);		// wrong ptent used
> > 
> > I am not aware whether the effort to "read hazards be removed from the code"
> > has ever been made and the generic code is safe in this regard.
> > 
> > What is your take on this?
> 
> Hmm, that looks like a bug to me, at least based on the stated requirements.
> Although this is not a "read through a raw PTE *pointer*", it is a ptep_get().
> The arch code can override that so I guess it has an opportunity to flush. But I
> don't think any arches are currently doing that.
> 
> Probably the simplest fix is to add arch_flush_lazy_mmu_mode() before the
> ptep_get()?

Which would completely revert the very idea of the lazy mmu mode?
(As one would flush on every PTE page table iteration).

> It won't be a problem in practice for arm64, since the pgtables are always
> updated immediately. I just want to use these hooks to defer/batch barriers in
> certain cases.
> 
> And this is a pre-existing issue for the arches that use lazy mmu with
> device-exclusive mappings, which my extending lazy mmu into vmalloc won't
> exacerbate.
> 
> Would you be willing/able to submit a fix?

Well, we have a dozen of lazy mmu cases and I would guess it is not the
only piece of code that seems affected. I was thinking about debug feature
that could help spotting all troubled locations.

Then we could assess and decide if it is feasible to fix. Just turning the
code above into the PTE read-modify-update pattern is quite an exercise...

> Thanks,
> Ryan

