Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA9814A16
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 15:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655123.1022814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE8rf-0004oq-QO; Fri, 15 Dec 2023 14:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655123.1022814; Fri, 15 Dec 2023 14:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE8rf-0004lX-NK; Fri, 15 Dec 2023 14:08:31 +0000
Received: by outflank-mailman (input) for mailman id 655123;
 Fri, 15 Dec 2023 14:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqNh=H2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rE8re-0004lR-SA
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 14:08:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b800b87-9b53-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 15:08:28 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0A38A4EE073C;
 Fri, 15 Dec 2023 15:08:28 +0100 (CET)
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
X-Inumbo-ID: 6b800b87-9b53-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Fri, 15 Dec 2023 15:08:28 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
In-Reply-To: <add58ef45d9cb970c2447f22443f50c8@bugseng.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
 <240c97ed-ce27-406d-84ad-68b72e999294@xen.org>
 <5ad1c008182bc9f23e1b37b0d6e35e4c@bugseng.com>
 <2b4eec7c-3657-4542-96b9-56b272e8723b@xen.org>
 <alpine.DEB.2.22.394.2312141418160.3175268@ubuntu-linux-20-04-desktop>
 <add58ef45d9cb970c2447f22443f50c8@bugseng.com>
Message-ID: <c70f5399c36e364f06c525eed3058789@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien,

>> Yes, I would go with 3., replace advance_pc with domain_crash. 
>> Assuming
>> that it would also solve the violation in ECLAIR.
> 
> It needs to be prefixed with an ASSERT_UNREACHABLE(), though, because 
> it's still a violation if there is no execution path leading to 
> domain_crash(), but other than that it seems the safest choice.

Assuming there are no objections to going forward with this proposal, 
would you mind telling me how can I do the proper domain_crash call. 
Most of the examples get a "struct domain *" from a parameter or from 
the macro "current", so I was thinking of

domain_crash(current->domain);

but I'm not so sure about this, as there are no other uses in vcpreg.c. 
You can also submit the patch yourself, if you prefer.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

