Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E939A999A5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965332.1355922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7h1U-000205-U3; Wed, 23 Apr 2025 20:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965332.1355922; Wed, 23 Apr 2025 20:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7h1U-0001yO-R2; Wed, 23 Apr 2025 20:48:48 +0000
Received: by outflank-mailman (input) for mailman id 965332;
 Wed, 23 Apr 2025 20:48:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u7h1T-0001yF-J6
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:48:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u7h1S-00HI9z-1V;
 Wed, 23 Apr 2025 20:48:46 +0000
Received: from [2a02:8012:3a1:0:752c:956a:3e76:876d]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u7h1S-007MJA-0t;
 Wed, 23 Apr 2025 20:48:46 +0000
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
	bh=99X0+FUIM4sZ+ADCor552omGYZhJTFq7zryGUC3zAMo=; b=MwrtgjJzhsnzw83oNzELVUTeVs
	cG1Sxiy23POOfXEdKx5mwbN3IVODi/KlSDHetY9DzUnzNN63yrxGLED7Ir/uLF1A1HNYVOpZQu6CO
	0ycn4YmtQ4WQ/9G1nCTie7+cy+QrcWS96ZIoR2l4ix3tJxFip578LDvJGkn8pl5XnwW0=;
Message-ID: <afdb0197-6f0f-47a7-88cb-83e014f09914@xen.org>
Date: Wed, 23 Apr 2025 21:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation of Rule 10.1 for unary minus
Content-Language: en-GB
To: victorm.lira@amd.com, xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Victor,

On 23/04/2025 18:54, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> MISRA C Rule 10.1 states:
> "Operands shall not be of an inappropriate essential type"
> 
> The unary minus operator applied to an unsigned quantity has
> a semantics (wrap around) that is well-known to all Xen developers.
> Thus, this operation is deemed safe.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> Changes v1:
> - add rule title to commit message
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Federico Serafini <federico.serafini@bugseng.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>   docs/misra/deviations.rst                        | 6 ++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 303b06203a..2cfce850bd 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -347,6 +347,12 @@ constant expressions are required.\""
>     "any()"}
>   -doc_end
> 
> +-doc_begin="Unary minus operations on non-negative integers have a semantics (wrap around) that is well-known to all Xen developers."
> +-config=MC3A2.R10.1,etypes+={safe,
> +  "stmt(node(unary_operator)&&operator(minus))",
> +  "src_expr(definitely_in(0..))"}
> +-doc_end
> +
>   #
>   # Series 11
>   #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index cfdd1a9838..c5897e31c5 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -321,6 +321,12 @@ Deviations related to MISRA C:2012 Rules:
>          If no bits are set, 0 is returned.
>        - Tagged as `safe` for ECLAIR.
> 
> +   * - R10.1
> +     - Applying the unary minus operator to an unsigned quantity has a
> +       semantics (wrap around) that is well-known to all Xen developers.
> +       For this reason, the operation is safe.

I have realized we use similar wording in the rest of the deviations, 
but this is rather fragile argument. "well-known" is very subjective and 
could change over time.

How many violations do we have? Could we deviate them one by one?

Cheers,

-- 
Julien Grall


