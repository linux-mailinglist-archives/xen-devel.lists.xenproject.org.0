Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF17E3EE5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 13:44:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628810.980655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0LR9-0001Jb-Pz; Tue, 07 Nov 2023 12:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628810.980655; Tue, 07 Nov 2023 12:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0LR9-0001Hn-NC; Tue, 07 Nov 2023 12:44:07 +0000
Received: by outflank-mailman (input) for mailman id 628810;
 Tue, 07 Nov 2023 12:44:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0LR8-0001Hf-Fr
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 12:44:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0LR7-0002Ql-MW; Tue, 07 Nov 2023 12:44:05 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.15.180]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0LR7-0005WQ-Gr; Tue, 07 Nov 2023 12:44:05 +0000
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
	bh=oky95MX67gcdvuUE/bTl6AkrRH7y0x0Qc8B1UpR57Mk=; b=VP6nNmBGPkcqSZIoHUaFpqimm2
	kpv3E4NrWcSAYXivCdB5+21QHDHuC47RUZfGzXRu36/9o2mj7NRlmSPBr0DJlLstq1Ng2JhRZB3ST
	L0iXwpDlxOUAQ/uOns5pNG5iELCoddakvR5XZeFA2wvcws9yhAty01X38FXe2723olj4=;
Message-ID: <a95c6666-dbf3-4f1f-9618-b1f31bf47710@xen.org>
Date: Tue, 7 Nov 2023 12:44:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] automation/eclair: add deviation for certain
 backwards goto
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
 <306ca49d5d63ea0614bbcef470efec9234d1a018.1699295113.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <306ca49d5d63ea0614bbcef470efec9234d1a018.1699295113.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 07/11/2023 10:33, Nicola Vetrini wrote:
> As explained in the deviation record, code constructs such as
> "goto retry" and "goto again" are sometimes the best balance between
> code complexity and the understandability of the control flow
> by developers; as such, these construct are allowed to deviate
> from Rule 15.2.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>   automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++++++
>   docs/misra/deviations.rst                        | 10 ++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index fa56e5c00a27..8b1f622f8f82 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -270,6 +270,16 @@ statements are deliberate"
>   -config=MC3R1.R14.3,statements={deliberate , "wrapped(any(),node(if_stmt))" }
>   -doc_end
>   
> +#
> +# Series 15
> +#
> +
> +-doc_begin="The additional complexity introduced in the code by using control flow structures other than backwards goto-s
> +were deemed not to justify the possible prevention of developer confusion, given the very torough review process estabilished

Typoes: s/torough/thorough/ s/estabilished/established/

> +in the community."
> +-config=MC3R1.R15.2,reports+={deliberate, "any_area(any_loc(text(^.*goto (again|retry).*$)))"}
> +-doc_end
> +
>   #
>   # Series 20.
>   #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 8511a189253b..7d1e1f0d09b3 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -208,6 +208,16 @@ Deviations related to MISRA C:2012 Rules:
>          statements are deliberate.
>        - Project-wide deviation; tagged as `disapplied` for ECLAIR.
>   
> +   * - R15.2
> +     - The possible prevention of developer confusion as a result of using
> +       control flow structures other than backwards goto-s in some instances was
> +       deemed not strong enough to justify the additional complexity introduced
> +       in the code. Such instances are the uses of the following labels:
> +
> +       - again
> +       - retry

Have you investigated the possibility to use SAF-X in the code? If so, 
what's the problem to use them?

Cheers,

-- 
Julien Grall

