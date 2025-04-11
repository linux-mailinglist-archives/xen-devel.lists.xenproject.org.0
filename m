Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23374A85C6E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 14:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947289.1344945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3D83-0001HR-Hz; Fri, 11 Apr 2025 12:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947289.1344945; Fri, 11 Apr 2025 12:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3D83-0001GV-F3; Fri, 11 Apr 2025 12:05:03 +0000
Received: by outflank-mailman (input) for mailman id 947289;
 Fri, 11 Apr 2025 12:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MhXW=W5=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1u3D81-0001GP-SU
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 12:05:01 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31055c04-16cd-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 14:05:00 +0200 (CEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4Hwbv028306;
 Fri, 11 Apr 2025 12:04:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xj5xmbq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Apr 2025 12:04:49 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53BBvsIB009672;
 Fri, 11 Apr 2025 12:04:49 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xj5xmbq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Apr 2025 12:04:49 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B8Brgm029520;
 Fri, 11 Apr 2025 12:04:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45x1k78q3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Apr 2025 12:04:48 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 53BC4kR641484682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Apr 2025 12:04:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8519420043;
 Fri, 11 Apr 2025 12:04:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 975B920040;
 Fri, 11 Apr 2025 12:04:45 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.171.62.45]) by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 11 Apr 2025 12:04:45 +0000 (GMT)
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
X-Inumbo-ID: 31055c04-16cd-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=PnqGyYgzHT0Sz+5k6BXWUk5N9daIOA
	t0miBGvgSDKAY=; b=rg6+7yX1oIY/hrDNoGj3DwccvaTK1QnKM/d3OmrcztqEDp
	j4j5yfP62lfxD/7TrZFOhfyN/XMIoQfZ9vBMmaXQZiQxsA6GTPDm833Y+/EC3OIe
	EVs/aJqbsqOqPuf9GkcCGI+TAuCYbMSXC3WAuwom/mXn7fzwJevaJwo4QojGds41
	jOG6NWCKAmBMEP3STFTm8r6lvpkCTgDuZRyy1CUREkt2rgPkvaChg17e2Fifu4mj
	LsxtUVPM4U+FemCOiNrQDNqf6JSM0VFG10GCRlIJZfrAUB7AhisPET/LTJCs7Vcx
	K2jP6Vv5ysev6rq9j6y5SM7EnQ6SgRS4oy8ulnNA==
Date: Fri, 11 Apr 2025 14:04:44 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Hugh Dickins <hughd@google.com>, Guenter Roeck <linux@roeck-us.net>,
        Juergen Gross <jgross@suse.com>, Jeremy Fitzhardinge <jeremy@goop.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v1 0/4] mm: Fix apply_to_pte_range() vs lazy MMU mode
Message-ID: <Z/kFXDwneQ9yHiJl@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <D93MFO5IGN4M.2FWKFWQ9G807P@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D93MFO5IGN4M.2FWKFWQ9G807P@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G_BAGoiaaveYky3440tvomTW6sZpx75k
X-Proofpoint-ORIG-GUID: 0HKwRFIDMdOHgUv5TCoToIJxhDHz4gm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 mlxlogscore=591 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110077

On Fri, Apr 11, 2025 at 05:12:28PM +1000, Nicholas Piggin wrote:
...
> Huh. powerpc actually has some crazy code in __switch_to() that is
> supposed to handle preemption while in lazy mmu mode. So we probably
> don't even need to disable preemption, just use the raw per-cpu
> accessors (or keep disabling preemption and remove the now dead code
> from context switch).

Well, I tried to do the latter ;)
https://lore.kernel.org/linuxppc-dev/3b4e3e28172f09165b19ee7cac67a860d7cc1c6e.1742915600.git.agordeev@linux.ibm.com/
Not sure how it is aligned with the current state (see below).

> IIRC all this got built up over a long time with some TLB flush
> rules changing at the same time, we could probably stay in lazy mmu
> mode for a longer time until it was discovered we really need to
> flush before dropping the PTL.
> 
> ppc64 and sparc I think don't even need lazy mmu mode for kasan (TLBs
> do not require flushing) and will function just fine if not in lazy
> mode (they just flush one TLB at a time), not sure about xen. We could
> actually go the other way and require that archs operate properly when
> not in lazy mode (at least for kernel page tables) and avoid it for
> apply_to_page_range()?

Ryan Roberts hopefully brought some order to the topic:
https://lore.kernel.org/linux-mm/20250303141542.3371656-1-ryan.roberts@arm.com/

> Thanks,
> Nick

