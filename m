Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BB1C2BF7A
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 14:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155307.1484805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFuHJ-00083B-Jb; Mon, 03 Nov 2025 13:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155307.1484805; Mon, 03 Nov 2025 13:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFuHJ-00080K-Gn; Mon, 03 Nov 2025 13:07:21 +0000
Received: by outflank-mailman (input) for mailman id 1155307;
 Mon, 03 Nov 2025 13:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJ2K=5L=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vFuHI-00080E-65
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 13:07:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf89946-b8b5-11f0-980a-7dc792cee155;
 Mon, 03 Nov 2025 14:07:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id AB57B4EE8C8B;
 Mon,  3 Nov 2025 14:07:00 +0100 (CET)
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
X-Inumbo-ID: fcf89946-b8b5-11f0-980a-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1762175221;
	b=KVSIHJiUphHSluETuCAn8drUJd+QSevuHEAWOT29BJm0mpEd+Hyl/97bQj3JhNGxb8ID
	 Myi3ACs/f9qMGcBHP6NsmRe+lqAmuILluleA6Al2o+OpjWDMOpR7xCGN5VSuQVOq5JMGe
	 wfi/Gd1gTPEthvgXwrgkbqVxt8d5jyX6phSPh0aNHHjHYWVeneAHXuOz4IO+Aj8RS7mdC
	 1UXnj1DlpUwqQ/i3VlfyQ1JzWr6c4tiL1bnke17iJnBTDYeHXviCOOM4XKAU2sgL/hgFg
	 k1Agi/d51EBRFtdfi75EMVw/nonZT6CADqfbbMo6o/F2X3/2rxTZrqKRR09qlK9pFUYR4
	 EI+vxS8gj6iXbLKvy4DrRx13gRctFENrPH2vPdRcN1pI/ba8k5j2FxrtE/LewYlnB1Pdn
	 mOuSoH13kMDM3hMB2Jt+7GoMQaiOiln09rfhCXPjf4PGEwpWEjqcJOxnvIbjaFVhB9bZH
	 eA1D3+vDUJucfw7FVml30J21ZViRHhkFoWsjzk/YtuQwdfO3dI3lr+hGNSTDZkSokr9Vd
	 Z86Fn4VUFZI8wUFuum+g01PnMzIYEVvXpRHonLihWuz+lzE2Pes/8Vk+6ZzEvVb9lEmhM
	 RbP8Lr5WPEpn0PU/HUF17KlP+MJko2xkMcuzHC31DCu8OBPkTW6nRMpz719pZC8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1762175221;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=L0vPos1n2LyqS4BcAgaP2dPupdnaWfIzSSvZRK/wlck=;
	b=dG0bu/oJm610U1j3cLGJUB6zHeIXcJzTQEGQAbAH50Kcn4rjuw/kkvVn9Ag6ORyjNzoa
	 EbWX2f4y04pzUi9Iwon8oqbH9cdR1ct1QaVAuW5ERI4/b6+SS3WzewXnqf6bXLMptgggO
	 Qf5psMuCSHmVswzGFDSg9wJoVha9iKKiHFfHqHBH0+eIGZqmSjlmLnC2AApijO8CvkHva
	 cbODl91iAii/xXSqWTKjJiGfHOYYNFAq4+Pu4LTBLFFtJz5RLUm+nh3pFU9KCbqfWOIAH
	 Eu254TiePcxbvDOMVXv0Oxh/oTNUPiyqH6Nio5+eylu1VQwcvhuCfPVyUvQ4FdXlpkuYx
	 Sl6K8IUL1uFxQ3aIu3X99PZG9lThSKfVwZnxNR+Rm461/iKqplPLSZ39IBDi9cr7xxhVi
	 naxIRCoPmAnHxpIsX7EBEaVRJRsk2FG1kxkXgmDjzHU+RS/GZQMhpe6c+8bPIE/7O01CI
	 YB94+LJ45/2+d2nIIcEr9bnLu9mKL2H5XwMe0Fu19gdWOxs7d90LKomImvaZY/9iDEVIO
	 FyviJ0hwjkshsAFGT3GuaGTxsVEyVbDDURjzRVyPVjDLoVjxBeCIsLF4YfIpxM+QaJhO4
	 ncE5LrkiaXfZwsNqSTvKh2Y3x1H8Mv4NbfrPQAoRwwegombFB7aB4/GArw7jNOM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1762175221; bh=LhTtAJfmMUjw3kxTDlmtLcz4J67zabfSKpo5Pz1FJ/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yMjRZlTM46gFiwCajv/leB1HliJGQF1lkjN3UNn5p6mwziBoPyhlCz5RIjUCgRVqe
	 pa6S+XmgME2bIyJJ44AZ+CafdQ9lWTs7y+Vcr3u0STm+BB/Z7pUwyXu2RIz5oywLvW
	 CYQq88ub2GMR3nTuMm4YWqdF73biEPzBH30l8pjv0rEkYZf/WP+g99O0nHMtUs/ySa
	 wIycisdnwTUlfufLuNej5I3OYC8Y39KnS+cUq9tRKtU5eybxVNd3g695YwNJgtNLui
	 zctcz3ImwkGUcT7+b6g23IrAtCbiLmDwrFpx1R6XoLlhz25xJQc2MPSf/bZpW4H+hf
	 dkPFO7dmfv/bQ==
MIME-Version: 1.0
Date: Mon, 03 Nov 2025 14:07:00 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 xen-devel@lists.xenproject.org, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
 <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] misra: address Rule 11.3 in spin_unlock_common()
In-Reply-To: <7fb6ca46-3806-4aa5-a642-28384d6b944c@citrix.com>
References: <812bf5574cb44727c561e0ebc3a54848823ed490.1762163173.git.dmytro_prokopchuk1@epam.com>
 <7fb6ca46-3806-4aa5-a642-28384d6b944c@citrix.com>
Message-ID: <0dfffc16c4477c2bbd3867e447e7f2ed@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-03 12:26, Andrew Cooper wrote:
> On 03/11/2025 10:11 am, Dmytro Prokopchuk1 wrote:
>> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
>> index 0389293b09..d9dc9998e6 100644
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -367,7 +367,8 @@ static void always_inline 
>> spin_unlock_common(spinlock_tickets_t *t,
>>      LOCK_PROFILE_REL;
>>      rel_lock(debug);
>>      arch_lock_release_barrier();
>> -    add_sized(&t->head, 1);
>> +    BUILD_BUG_ON(sizeof(t->head) != sizeof(uint16_t));
>> +    add_u16_sized(&t->head, 1);
> 
> This is an example where MISRA's opinions actively making the logic 
> less
> safe.
> 
> It's not possible for add_sized() to use the wrong type (as it
> calculates it internally), whereas it's quite possible to update the
> BUILD_BUG_ON() and fail to adjust the add.
> 

I agree, we should devise a way to argue that the casts are safe and 
write a proper deviation. If I recall correctly, {read,write}_atomic 
have exactly the same issues.

> Specifically, you've made it more complicated to reason about, and
> created an opportunity to make an unsafe change where that opportunity
> does not exist in the code as-is.
> 
> Furthermore, read and write atomic have exactly the same internal
> pattern as add_sized(), so how does this not just kick the can down the
> road?
> 
> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

