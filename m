Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22261641929
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 22:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452817.710614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1ZlP-00005X-3r; Sat, 03 Dec 2022 21:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452817.710614; Sat, 03 Dec 2022 21:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1ZlP-0008V1-0u; Sat, 03 Dec 2022 21:09:35 +0000
Received: by outflank-mailman (input) for mailman id 452817;
 Sat, 03 Dec 2022 21:09:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1ZlN-0008Uv-EW
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 21:09:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1ZlN-0003jW-0P; Sat, 03 Dec 2022 21:09:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1ZlM-00047M-Oy; Sat, 03 Dec 2022 21:09:32 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=0zjAPRz0Hc3SqNXmXQ7E0hJH6wvakMWfmVC9Uq7i45c=; b=6KLb1sD2dWjLNYc76DY/5IYJao
	pyx1GHUOSSTv6y/gMoAnsXEXiiH5sO60v+TQUwEjpsoqq5ehWMu1Y+nEYQ+rtZqgKmUjpbasveVDZ
	V3xeFEnicZ2J2+hihbwYX/M6ibxsBhbuGRpoWjQhFlaGPHPTRNreSIOyhjkM7eQb0ksw=;
Message-ID: <34a4ab54-2e61-12d2-f561-9b5462f8c9cb@xen.org>
Date: Sat, 3 Dec 2022 21:09:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, jgrall@amazon.com, burzalodowa@gmail.com
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-8-ayan.kumar.halder@amd.com>
 <0ccfe5e6-960d-2f60-f782-e321c1ea7786@amd.com>
 <bd197b39-a558-7b88-d10d-053846cd5dab@xen.org>
 <110c7534-0b06-9d0d-92f3-56f51a6cb022@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v4 07/11] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
In-Reply-To: <110c7534-0b06-9d0d-92f3-56f51a6cb022@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/12/2022 20:02, Ayan Kumar Halder wrote:
> The definition is different :-
> 
> In xen/arch/arm/include/asm/arm32/sysregs.h
> 
>   "#define __CP32(r, coproc, opc1, crn, crm, opc2) coproc, opc1, r, crn, 
> crm, opc2"   (Note:- it takes 6 arguments)
> 
> And what I have defined in  xen/arch/arm/include/asm/cpregs.h:-
> 
> #define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, crm, 
> opc2 (It takes 5 arguments, also note it has 3 underscores before CP32).

Ah... I missed the 3rd underscore. That's one more reason to not define 
such macro.

[...]

> Would you also review 8/11, 9/11, 10/11 and 10/11 before I re-spin a new 
> series ?

Patch #8, #9 needs ___CP32 to be removed.
Patch #10, some of the use needs to be clarified
Patch #11 have a minor comment

Please note that I'm reviewing these patches in between my main work and 
it can take a while to go through them in detail. So please wait a few 
days before asking for reply.

Cheers,

-- 
Julien Grall

