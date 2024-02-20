Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E331B85C037
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 16:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683605.1063196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcSFi-0006po-JI; Tue, 20 Feb 2024 15:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683605.1063196; Tue, 20 Feb 2024 15:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcSFi-0006nv-Fn; Tue, 20 Feb 2024 15:41:50 +0000
Received: by outflank-mailman (input) for mailman id 683605;
 Tue, 20 Feb 2024 15:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtGB=J5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rcSFg-0006np-TH
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 15:41:48 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d005dda-d006-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 16:41:46 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1708443698629666.9694419562685;
 Tue, 20 Feb 2024 07:41:38 -0800 (PST)
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
X-Inumbo-ID: 8d005dda-d006-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; t=1708443700; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bDC+gZTP7tPVhpHKVnJDkPnHDhDfUjSUnMNofHvMR068ffliKbtNmChmbbszVJ+M9ugAsfIblbVg3cNP3FFPmUvKBeuv4RYAAkoXdDWQMk610EZZLe3524envUgikeipqLx4+mnVecapWayQjPzx0SfFle4HyAMobYUj7+w9RPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1708443700; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=irvYXm4uYz0DwWBjM/Ejk/RAcsYLz7Pr2lEZ9AJYBmg=; 
	b=TWXDdJA2ca1GvQsLipz9QPuZCSFdUZICkjstd26wBMjFomPYD8QJqRh/Pt1I9wsKc6okm/BrXqEdz/IfzKilUjtNtk8wE3OhOPX3A+pqHiS422zED6fcZdhrJnNOwMBL0mu1/+TKYFwNBJqM0+Xvm6o1eDThIZf/n6vOZSt2nrI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1708443700;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=irvYXm4uYz0DwWBjM/Ejk/RAcsYLz7Pr2lEZ9AJYBmg=;
	b=C3macS6wFvyJHuAam1EixoDqvZ2I1GBAiSLHfQM3MpKOia42H4Jmms3HaPqIi5kQ
	ZVFKhzKqzBgy5szpQsYn8IWnX+/g3txiuJ+dRFY17q2J4bV6fjg/vBaakquvhUhxCBB
	cuCq1Z+JgFI/vc3+lqIu2DUhiy+kM/ltcpg/xPAw=
Message-ID: <a2d94dc8-aca3-4fa4-a5a4-1de268010747@apertussolutions.com>
Date: Tue, 20 Feb 2024 10:41:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
 ASSERT_UNREACHABLE() to xen/bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/2/24 13:03, Oleksii Kurochko wrote:
> Move the macros mentioned in the commit subject to their appropriate
> locations.
> Additionally, eliminate the dependency of xen/lib.h from xen/bug.h and
> include "xen/bug.h" in files where xen/bug.h macros are utilized.
> 
> Most of the changes were made because a file requires macros from xen/bug.h,
> except for some files for Arm which require definitions of BUG_OPCODE,
> BUG_INSTR, BUG_FN_REG.
> 
> xen/lib.h was added to list-sort.c ( otherwise compilation errors related
> to {d}printk occur during compilation of list-sort.c. ) as xen/lib.h was
> removed from xen/list.h. Since nothing in xen/list.h depends on xen/lib.h
> functionality and only xen/bug.h is needed.
> 
> cpufeature.h requires the inclusion of <xen/cache.h>;
> otherwise, the following error will occur:
> ld: common/monitor.o:/build/xen/./arch/x86/include/asm/cpufeature.h:41:
> multiple definitions of `__cacheline_aligned';
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---

<snip/>

> diff --git a/xen/xsm/flask/ss/ebitmap.h b/xen/xsm/flask/ss/ebitmap.h
> index bb43de891d..7b2da8179a 100644
> --- a/xen/xsm/flask/ss/ebitmap.h
> +++ b/xen/xsm/flask/ss/ebitmap.h
> @@ -15,6 +15,7 @@
>   #define _SS_EBITMAP_H_
>   
>   #include <xen/bitmap.h>
> +#include <xen/bug.h>
>   
>   #define EBITMAP_UNIT_NUMS	((32 - sizeof(void *) - sizeof(u32))	\
>   					/ sizeof(unsigned long))

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

