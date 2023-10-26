Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669617D80B6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 12:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623661.971713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxYA-0003j1-2c; Thu, 26 Oct 2023 10:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623661.971713; Thu, 26 Oct 2023 10:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxY9-0003gA-Vh; Thu, 26 Oct 2023 10:25:13 +0000
Received: by outflank-mailman (input) for mailman id 623661;
 Thu, 26 Oct 2023 10:25:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvxY8-0003g4-Oj
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 10:25:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvxY7-0008Dt-OP; Thu, 26 Oct 2023 10:25:11 +0000
Received: from [15.248.2.156] (helo=[10.24.67.24])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvxY7-0007gG-HH; Thu, 26 Oct 2023 10:25:11 +0000
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
	bh=6/ildjtjBN0BirJpnbC/yPoJgbHPN7XPRNXhTxgs3nc=; b=ZUCznRuO65dTlq9/UaehJUBwB+
	maRC4DCOHt3rypB82r7DEiTn7jFlT4X3rrOmMvRI4qvHyJFMzvUXawNxO838NoyGQda0i0aLOjZPL
	hSHyfCov5OFJ0xOKa5NjkLsQWhbh2FdxHrFrL0pl0KnvfLFFjSVdbZjFFTLqMUdj00/g=;
Message-ID: <662e9080-5648-47eb-95e6-41fcb618c68f@xen.org>
Date: Thu, 26 Oct 2023 11:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: add deviations for MISRA C:2012
 Rule 8.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <1c146f28cb19607ddd6741de4f7de051894a3381.1698314415.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1c146f28cb19607ddd6741de4f7de051894a3381.1698314415.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/10/2023 11:04, Federico Serafini wrote:
> Update ECLAIR configuration to deviate Rule 8.3 ("All declarations of
> an object or function shall use the same names and type qualifiers")
> for the following functions: guest_walk_tables_[0-9]+_levels().
> Update file docs/misra/deviations.rst accordingly.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
>    - removed set_px_pminfo() from the scope of the deviation;
>    - fixed tag of the commit.
> ---
>   automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>   docs/misra/deviations.rst                        | 6 ++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d8170106b4..b99dfdafd6 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -204,6 +204,10 @@ const-qualified."
>   -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_mpparse_r8_3)))&&any_area(any_loc(file(^xen/arch/x86/include/asm/mpspec\\.h$)))"}
>   -doc_end
>   
> +-doc_begin="For functions guest_walk_tables_[0-9]+_levels(), parameter names of definitions deliberately differ from the ones used in the corresponding declarations."
> +-config=MC3R1.R8.3,declarations={deliberate,"^guest_walk_tables_[0-9]+_levels\\(const struct vcpu\\*, struct p2m_domain\\*, unsigned long, walk_t\\*, uint32_t, gfn_t, mfn_t, void\\*\\)$"}
> +-doc_end
> +
>   -doc_begin="The following variables are compiled in multiple translation units
>   belonging to different executables and therefore are safe."
>   -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 8511a18925..9423b5cd6b 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -121,6 +121,12 @@ Deviations related to MISRA C:2012 Rules:
>            - xen/common/unxz.c
>            - xen/common/unzstd.c
>   
> +   * - R8.3
> +     - In some cases, parameter names used in the function definition
> +       deliberately differ from the ones used in the corresponding declaration.

It would be helpful to provide a bit more reasoning in your commit 
message why this was desired. At least for Arm and common code, I would 
not want anyone to do that because it adds more confusion.

> +     - Tagged as `deliberate` for ECLAIR. Such functions are:
> +         - guest_walk_tables_[0-9]+_levels()

I think you want to be a bit mores specific. Other arch may have such 
function in the function and we don't want to deviate them from the start.

Cheers,

-- 
Julien Grall

