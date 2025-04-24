Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A7BA9B64A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 20:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966792.1356898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u81EK-00080q-E3; Thu, 24 Apr 2025 18:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966792.1356898; Thu, 24 Apr 2025 18:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u81EK-0007yB-Ab; Thu, 24 Apr 2025 18:23:24 +0000
Received: by outflank-mailman (input) for mailman id 966792;
 Thu, 24 Apr 2025 18:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OeN4=XK=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1u81EI-0007xm-In
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 18:23:22 +0000
Received: from outbound.pv.icloud.com
 (p-west1-cluster1-host4-snip4-10.eps.apple.com [57.103.64.123])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a164bb1-2139-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 20:23:06 +0200 (CEST)
Received: from smtpclient.apple (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
 by outbound.pv.icloud.com (Postfix) with ESMTPSA id DC477180042F;
 Thu, 24 Apr 2025 18:23:01 +0000 (UTC)
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
X-Inumbo-ID: 2a164bb1-2139-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=sig1; bh=08nTJUYzj57E/TLMHdYjm/4Q5MV282nWnewKnPEBZFs=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme;
	b=J5e5WESdGLOskLQkjhQyxoCuhlH8LUXKkwOHTnbDCQVCykjKQ1pC2eU0wiV1IijhY
	 +9y0zh7rX5GaTpUT9vGcM+F9HS5g1JM+DVi1IhPZAxHD9qH7r8uoCLRlhoW42cmp5q
	 ar9KbwYsK3vcOD8xobvQZVR+k24lKtxF9ouBxrtLno5Wqqwf5dqT7hM77a/zRwgHnL
	 K0rjLqq7SMZiBLzsGx2ncwoaUVnbbrj5HjTCRtYayUBLIMGDkskxsGkA6JUCdVer1g
	 3S5TILvqUdEe4m9XBNiSzdovGdPnNwnyj2PFpSXf9hvhTCm9nSDtn3mBVWinJ93RiR
	 CHev6cuAJUa3g==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Ariadne Conill <ariadne@ariadne.space>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] x86/hyperv: Adjust hypercall page placement
Date: Thu, 24 Apr 2025 11:22:50 -0700
Message-Id: <002DF04C-A250-4EAD-9834-FC07EFC9D562@ariadne.space>
References: <D9EWZF0G7QUZ.2IDV470T7SYD0@amd.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Alejandro Vallejo <agarciav@amd.com>
In-Reply-To: <D9EWZF0G7QUZ.2IDV470T7SYD0@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: iPhone Mail (22D82)
X-Proofpoint-ORIG-GUID: zEIs1u3Dr-rKkoQOpHht-JeczmWZ9Wjd
X-Proofpoint-GUID: zEIs1u3Dr-rKkoQOpHht-JeczmWZ9Wjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 clxscore=1030 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2504240127

Hi,

> On Apr 24, 2025, at 6:48=E2=80=AFAM, Alejandro Vallejo <agarciav@amd.com> w=
rote:
>=20
> =EF=BB=BFOn Thu Apr 24, 2025 at 1:45 PM BST, Alejandro Vallejo wrote:
>> Xen nowadays crashes under some Hyper-V configurations when
>> paddr_bits>36. At the 44bit boundary we reach an edge case in which the
>> end of the guest physical address space is not representable using 32bit
>> MFNs. Furthermore, it's an act of faith that the tail of the physical
>> address space has no reserved regions already.
>>=20
>> This commit uses the first unused MFN rather than the last, thus
>> ensuring the hypercall page placement is more resilient against such
>> corner cases.
>>=20
>> While at this, add an extra BUG_ON() to explicitly test for the
>> hypercall page being correctly set, and mark hcall_page_ready as
>> __ro_after_init.
>>=20
>> Fixes: 620fc734f854("x86/hyperv: setup hypercall page")
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>=20
> After a side discussion, this seems on the unsafe side of things due to
> potential collision with MMIO. I'll resend (though not today) with the
> page overlapping a RAM page instead. Possibly the last page of actual
> RAM.

We have been working on bringing Xen up on Azure over at Edera, and have enc=
ountered this problem.  Our solution to this problem was to change Xen to ha=
ndle the hypercall trampoline page in the same way as Linux: dynamically all=
ocating a page from the heap and then marking it as executable.

This approach should avoid the issues with MMIO and page overlaps.  Would it=
 be more interesting to start with our patch instead?

Ariadne=

