Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BAD520FB3
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 10:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325295.547803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noLDS-000787-2E; Tue, 10 May 2022 08:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325295.547803; Tue, 10 May 2022 08:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noLDR-00075A-Ud; Tue, 10 May 2022 08:27:33 +0000
Received: by outflank-mailman (input) for mailman id 325295;
 Tue, 10 May 2022 08:27:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noLDQ-00073H-9r
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 08:27:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noLDP-0000xF-Uu; Tue, 10 May 2022 08:27:31 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noLDP-0001ov-P2; Tue, 10 May 2022 08:27:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=BVaGfHciAAfijaGQQ902PnINeeOqwpNqMN0kNSEUiuE=; b=40xdfE8vVRbaeuRTaPdOKpIVSI
	LXU5Pm7QPtHDsxfY6B89rx6qhLYZChBb5DUc59S89chiAail4qwL+wo5ZjJ2RyGRux4rNqVmKWvu9
	qlcsyGC7C42hp8k0vOKG6+Jyf036bGIUwurYItUbownLxgPpFeQDaTteEz6y9WYV1LD4=;
Message-ID: <e790fa9f-6b13-112f-6849-24fc46a91a89@xen.org>
Date: Tue, 10 May 2022 09:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK
To: Michal Orzel <michal.orzel@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220505115906.380416-1-michal.orzel@arm.com>
 <YnO/bIw/bG8hMNx+@arm.com> <a96bc62d-8bf8-1507-5838-8e29297bc775@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a96bc62d-8bf8-1507-5838-8e29297bc775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/05/2022 07:49, Michal Orzel wrote:
> On 05.05.2022 14:13, Catalin Marinas wrote:
>> On Thu, May 05, 2022 at 01:59:06PM +0200, Michal Orzel wrote:
>>> Value of macro MIDR_IMPLEMENTOR_MASK exceeds the range of integer
>>> and can lead to overflow. Currently there is no issue as it is used
>>> in an expression implicitly casted to u32 in MIDR_IS_CPU_MODEL_RANGE.
>>> To avoid possible problems, fix the macro.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> Link: https://lore.kernel.org/r/20220426070603.56031-1-michal.orzel@arm.com
>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Origin: git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git (48e6f22e25a4)
>>> ---
>>> Changes since v1:
>>> - add Origin tag as the patch was merged in upstream arm64 linux tree
>>
>> Note that there's always a risk that the commit Id will be changed
>> before it hits mainline (Linus' tree).
>>
> 
> This commit is now in linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=48e6f22e25a44e43952db5fbb767dea0c9319cb2
> so we can be sure that the SHA will stay unmodified there (and will be the same in Linus' tree).

AFAIK, linux-next branch is just a merge of all the maintainers branch 
and often rewritten. So there are no guarantee a commit id is valid 
until it reached Linus' tree.

> 
> Question to maintainers:
> Do you want me to update Origin to point to linux-next?
So we have a link to the patch and a name. This should be sufficient to 
find the commit.

Therefore, I would simply on top of Origin:

[The commit ID may be different in linus' tree]

-- 
Julien Grall

