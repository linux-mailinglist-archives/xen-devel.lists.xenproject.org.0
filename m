Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C54A84944
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 18:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946077.1344093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2uS8-0002OZ-Jt; Thu, 10 Apr 2025 16:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946077.1344093; Thu, 10 Apr 2025 16:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2uS8-0002Ls-GU; Thu, 10 Apr 2025 16:08:32 +0000
Received: by outflank-mailman (input) for mailman id 946077;
 Thu, 10 Apr 2025 16:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kj+o=W4=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1u2uS6-0002Lm-Tw
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 16:08:30 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08e35061-1626-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 18:08:27 +0200 (CEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A9vhWL025345;
 Thu, 10 Apr 2025 16:07:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ww2xettf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 16:07:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53ADaw5Y013858;
 Thu, 10 Apr 2025 16:07:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ufunxs3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 16:07:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 53AG7p5N34996542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Apr 2025 16:07:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3550B2004B;
 Thu, 10 Apr 2025 16:07:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A52D020040;
 Thu, 10 Apr 2025 16:07:50 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Apr 2025 16:07:50 +0000 (GMT)
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
X-Inumbo-ID: 08e35061-1626-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Jmp1TuG2rk5K6Ce5PuPbd2zgfuoBes
	e75oMt4oJEqFw=; b=KeFXTRMrvncRLBLOSZihPcfH8PnGHMOqw/mHIMC9+jcV7r
	3tbCvVZgLf/TazLxRstYbgeSilvo9dnkQrP8GLZmdCLP7hdgfS+pkqs9INITQDkg
	T2HE3mA0tY6cCiOjFIeFG4XrbkilmiOfe4bJ2uXJGkSGYpDWZPzJpRf8Q8UfqalD
	1CebmuMJfdmCLXHOg3FqkHKYI/Ii9HIld7NTTOecyj72tFJzSX9SlqDWmWk5FBk1
	ZqLBZaAIh98rcIrrrmwglOKbYKDbWtxoar9QCagJyJPXCGZkd7ppURgrDNEYz5xA
	RkTJiRkBoXLMNPSqxBNFta7pxtSKrRmzyuagJ/7g==
Date: Thu, 10 Apr 2025 18:07:49 +0200
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
Message-ID: <912c7a32-b39c-494f-a29c-4865cd92aeba@agordeev.local>
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303141542.3371656-1-ryan.roberts@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JX9GiUvvsSXRJxqGU54xz_Dphrw8Y78U
X-Proofpoint-ORIG-GUID: JX9GiUvvsSXRJxqGU54xz_Dphrw8Y78U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=896 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100116

On Mon, Mar 03, 2025 at 02:15:34PM +0000, Ryan Roberts wrote:

Hi Ryan,

> I'm planning to implement lazy mmu mode for arm64 to optimize vmalloc. As part
> of that, I will extend lazy mmu mode to cover kernel mappings in vmalloc table
> walkers. While lazy mmu mode is already used for kernel mappings in a few
> places, this will extend it's use significantly.
> 
> Having reviewed the existing lazy mmu implementations in powerpc, sparc and x86,
> it looks like there are a bunch of bugs, some of which may be more likely to
> trigger once I extend the use of lazy mmu.

Do you have any idea about generic code issues as result of not adhering to
the originally stated requirement:

  /*
   ...
   * the PTE updates which happen during this window.  Note that using this
   * interface requires that read hazards be removed from the code.  A read
   * hazard could result in the direct mode hypervisor case, since the actual
   * write to the page tables may not yet have taken place, so reads though
   * a raw PTE pointer after it has been modified are not guaranteed to be
   * up to date.
   ...
   */

I tried to follow few code paths and at least this one does not look so good:

copy_pte_range(..., src_pte, ...)
	ret = copy_nonpresent_pte(..., src_pte, ...)
		try_restore_exclusive_pte(..., src_pte, ...)	// is_device_exclusive_entry(entry)
			restore_exclusive_pte(..., ptep, ...)
				set_pte_at(..., ptep, ...)
					set_pte(ptep, pte);	// save in lazy mmu mode

	// ret == -ENOENT

	ptent = ptep_get(src_pte);				// lazy mmu save is not observed
	ret = copy_present_ptes(..., ptent, ...);		// wrong ptent used

I am not aware whether the effort to "read hazards be removed from the code"
has ever been made and the generic code is safe in this regard.

What is your take on this?

Thanks!

