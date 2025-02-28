Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE8A49427
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 09:57:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898531.1307060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwAt-0006kJ-QZ; Fri, 28 Feb 2025 08:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898531.1307060; Fri, 28 Feb 2025 08:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwAt-0006hd-ND; Fri, 28 Feb 2025 08:56:51 +0000
Received: by outflank-mailman (input) for mailman id 898531;
 Fri, 28 Feb 2025 08:56:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tnwAs-0006hE-4i
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 08:56:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tnwAs-00ADmv-0B;
 Fri, 28 Feb 2025 08:56:49 +0000
Received: from [2a02:8012:3a1:0:493f:83e7:39ed:f66c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tnwAr-00EbFQ-1x;
 Fri, 28 Feb 2025 08:56:49 +0000
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
	bh=TtKVPXrmU2Dv0RcEThQzquhzJ1WVtt5IrzOyHUmHvbo=; b=jtCT40QbUYEYZwmaGJ0O8/zvol
	r8XBFGfIRmFTtWWTAJIrB9Eoj3kwZegRsRP909GALztoz3CxBNKIbDfxZ6h6/cj5ZA+9erQT3z4wh
	OzBI6WfBIzbogaTEQtEtqlvZ2Ctf+zSUOzyTCvvzta0etv4J7ScSfo7rl/xWKE0HVQsw=;
Message-ID: <9e52cffd-6286-442b-88d7-06eb07de3213@xen.org>
Date: Fri, 28 Feb 2025 08:56:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/02/2025 15:09, Ayan Kumar Halder wrote:
> In the current patch, we have defined the requirements which are common for
> all the commands.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
> 
> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not return
> 0 for success in all the cases.
> 2. Reworded the requirements so as to write them from Xen's perspective (not
> domain's perspective).
> 
>   .../fusa/reqs/design-reqs/arm64/hypercall.rst | 55 +++++++++++++++++
>   docs/fusa/reqs/index.rst                      |  2 +
>   docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>   .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
>   4 files changed, 134 insertions(+)
>   create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>   create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
> 
> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> new file mode 100644
> index 0000000000..ffd883260c
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall
> +=========
> +
> +Instruction
> +-----------
> +
> +`XenSwdgn~arm64_hyp_instr~1`
> +
> +Description:
> +Xen shall treat domain hypercall exception as hypercall requests.
> +
> +Rationale:
> +
> +Comments:
> +Hypercall is one of the communication mechanism between Xen and domains.
> +Domains use hypercalls for various requests to Xen.
> +Domains use 'hvc' instruction to invoke hypercalls.

Are you trying to describe any hypercalls (e.g. SMCCC, Xen...) or just 
the Xen one? If the latter, only "hvc #0xEA1" will be used for Xen 
hypercalls. Other immediate/space will be used for something different 
(i.e. #0 is used for SMCCC).

 > +> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +
> +Parameters
> +----------
> +
> +`XenSwdgn~arm64_hyp_param~1`
> +
> +Description:
> +Xen shall use x0 to read the first parameter, x1 for second parameter and so
> +on, for domain hypercall requests.

This implies we are supporting a large number of parameters. However, 
Xen is only support 5 arguments. So I would just list all the registers.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +

You don't seem to describe how the hypercall number is passed. Is this 
intended?

> +Return value
> +------------
> +
> +`XenSwdgn~arm64_ret_val~1`
> +
> +Description:
> +Xen shall store the return value in x0 register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_ret_val~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 1088a51d52..d8683edce7 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -10,5 +10,7 @@ Requirements documentation
>      market-reqs/reqs
>      product-reqs/reqs
>      product-reqs/arm64/reqs
> +   product-reqs/version_hypercall
>      design-reqs/arm64/generic-timer
>      design-reqs/arm64/sbsa-uart
> +   design-reqs/arm64/hypercall
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
> index 2d297ecc13..0e29fe5362 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -79,3 +79,19 @@ Comments:
>   
>   Needs:
>    - XenProd
> +
> +Version hypercall
> +-----------------
> +
> +`XenMkt~version_hypercall~1`
> +
> +Description:
> +Xen shall provide an interface for the domains to retrieve Xen's version, type
> +and compilation information.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..03221f70c3
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version hypercall
> +=================
> +
> +First Parameter
> +---------------
> +
> +`XenProd~version_hyp_first_param~1`
> +
> +Description:
> +Xen shall treat the first argument (as an integer) to denote the command number
> +for the hypercall.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Second Parameter
> +----------------
> +
> +`XenProd~version_hyp_second_param~1`
> +
> +Description:
> +Xen shall treat the second argument as a virtual address to buffer in domain's
> +memory.

We don't support any VA. The VA will need to be mapped with specifc 
attributes (see include/public/arch-arm.h). Should this be mentioned in 
the requirement?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Return Value
> +------------
> +
> +`XenProd~version_hyp_ret_val~1`
> +
> +Description:
> +In case the hypercall fails, Xen shall return one of the error codes defined
> +in http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/errno.h.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> \ No newline at end of file

-- 
Julien Grall


