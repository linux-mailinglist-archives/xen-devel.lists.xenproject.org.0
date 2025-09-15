Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1AB57045
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 08:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124190.1466683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy2iq-0005Tc-Sj; Mon, 15 Sep 2025 06:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124190.1466683; Mon, 15 Sep 2025 06:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy2iq-0005RA-PT; Mon, 15 Sep 2025 06:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1124190;
 Mon, 15 Sep 2025 06:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0os=32=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1uy2ip-0005R4-MS
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 06:29:55 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 634e9ed2-91fd-11f0-9d13-b5c5bf9af7f9;
 Mon, 15 Sep 2025 08:29:53 +0200 (CEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EH2k6T008844;
 Mon, 15 Sep 2025 06:29:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y0tk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 06:29:00 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F6NRje019684;
 Mon, 15 Sep 2025 06:29:00 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y0tk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 06:29:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F2ZLlc029484;
 Mon, 15 Sep 2025 06:28:58 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb0n5uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 06:28:58 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 58F6SuNA58458606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Sep 2025 06:28:56 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B80F20043;
 Mon, 15 Sep 2025 06:28:56 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5171820040;
 Mon, 15 Sep 2025 06:28:54 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.87.136.34]) by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Sep 2025 06:28:54 +0000 (GMT)
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
X-Inumbo-ID: 634e9ed2-91fd-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=M/xuln
	62q5zfY1XqnOkzluoH/jhmqhYNwkmp3WpUxjM=; b=jaZLS26lBDtzg2fecSZHqg
	vv5wXs+Q/QWPzoKutrrQc6JlTQgh9S++0kG1xYTEEhhACxrSaEwrVcmFNUrm5aqi
	OtK0MYRXJHIvOwUxdJDVmGllntU+dWQ/n1X9T0qND7U13HpIsA/bx3E95xS6zSiA
	G61SjiM2ehKgCwcxj/d9UyDG2/tPRNmRQ1Hbt9E+RCa/4Ymom5k7ti/+qmaBBf+f
	VEyzVGOhzGaTidXPVx4X8SSv3dIj5Oxjs0qsGj5K8mF92mOvsSCfHnnElObmQvvm
	y7XvEJjXSIurhHceuMaFZFx9Txg7BTX7q6CqqSlAH22dER7OpbB+bhODUu/v3N6w
	==
Date: Mon, 15 Sep 2025 08:28:52 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        Mark Rutland <Mark.Rutland@arm.com>
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
Message-ID: <5a0818bb-75d4-47df-925c-0102f7d598f4-agordeev@linux.ibm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
 <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
 <338ef811-1dab-4c4e-bc5f-8ebd8cb68435@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <338ef811-1dab-4c4e-bc5f-8ebd8cb68435@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMCBTYWx0ZWRfX4Cx2ngBEYL5c
 roZzmS41YuVlUSpSRef2KxL4WggODwY/soRMJpx2gg7kNLdYMyZvXNoqxYULYholGjNDiAVT4t6
 ukIUbG+OX0a4imqOK2lAsyx5041sIs8EVQMQ06NsJGnBzkaxygCee6tTvsutuzI9wnG+eg3PA/v
 F5e7gPnCVAvuDEchpnbMPDdE4TzdeZAArCZTLOmkY9Xd7mYwn00cbVETqAT3ckHgDdrWLphTxSN
 y5ALHiTawyw3ojSiUQHSaHqzU+geaiqg5gb2LGGBqmnxp5igHqNKf3fjoaJ0BgJ2I38Ya10WbMS
 bYUlmQ5btypMVlGwBcuKVUODKwIOxTQn2bBDW8olvvXBnB4V+w9kPSd+TVwMJmnqFMZo71QBQkH
 T1vGkEV/
X-Authority-Analysis: v=2.4 cv=OPYn3TaB c=1 sm=1 tr=0 ts=68c7b22c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=8nJEP1OIZ-IA:10 a=yJojWOMRYYMA:10 a=nkFB8puKy1KDrdvMtSoA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: dbH_inTMwHRH6BHBdGMtY8_aObQAr3rR
X-Proofpoint-ORIG-GUID: XMRhk7th-c6XacqgLmk45pWkcqEsR17O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130020

On Fri, Sep 12, 2025 at 05:25:27PM +0200, Kevin Brodsky wrote:

Hi Kevin,

> Based on the outcome of the discussion with David on patch 2 [1p], there
> is indeed an alternative approach that we should seriously consider. In
> summary:
> 
> * Keep the API stateless, handle nesting with a counter in task_struct
> * Introduce new functions to temporarily disable lazy_mmu without
> impacting nesting, track that with a bool in task_struct (addresses the
> situation in mm/kasan/shadow.c and possibly some x86 cases too)
> * Move as much handling from arch_* to generic functions
> 
> What the new generic infrastructure would look like:
> 
> struct task_struct {
>     ...
> #ifdef CONFIG_ARCH_LAZY_MMU
>     struct {
>         uint8_t count;
>         bool enabled; /* or paused, see below */
>     } lazy_mmu_state;
> #endif
> }
> 
> * lazy_mmu_mode_enable():

This helper is parameter-free, assuming the MMU unit does not need any
configuration other than turning it on/off. That is currently true, but
(as I noted in my other mail) I am going to introduce a friend enable
function that accepts parameters, creates an arch-specific state and
uses it while the lazy mmu mode is active.

That does not impact your design (AFAICT), except one change below.

>     if (!lazy_mmu_state.count) {
>         arch_enter_lazy_mmu_mode();
>         lazy_mmu_state.enabled = true;
>     }
>     lazy_mmu_state.count++;
> 
> * lazy_mmu_mode_disable():
>     lazy_mmu_count--;
>     if (!lazy_mmu_state.count) {
>         lazy_mmu_state.enabled = false;
>         arch_leave_lazy_mmu_mode();
>     } else {
>         arch_flush_lazy_mmu_mode();
>     }
> 
> * lazy_mmu_mode_pause():
>     lazy_mmu_state.enabled = false;
>     arch_leave_lazy_mmu_mode();

This needs to be arch_pause_lazy_mmu_mode(), otherwise the arch-specific
state will be lost.

> * lazy_mmu_mode_resume();
>     arch_enter_lazy_mmu_mode();

Conversely, this needs to be arch_resume_lazy_mmu_mode(). And it can not
be arch_enter_lazy_mmu_mode(), since a lazy_mmu_mode_resume() caller does
not know the parameters passed to the lazy_mmu_mode_enable(...)-friend.

>     lazy_mmu_state.enabled = true;
...

Thanks!

