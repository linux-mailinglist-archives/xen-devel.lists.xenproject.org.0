Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBA281446B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 10:29:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654979.1022582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4V5-0005rD-1b; Fri, 15 Dec 2023 09:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654979.1022582; Fri, 15 Dec 2023 09:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4V4-0005pC-VE; Fri, 15 Dec 2023 09:28:54 +0000
Received: by outflank-mailman (input) for mailman id 654979;
 Fri, 15 Dec 2023 09:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cTjp=H2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rE4V3-0005p6-OA
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 09:28:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c71ab82-9b2c-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 10:28:52 +0100 (CET)
Received: from [172.20.10.2] (unknown [37.160.44.52])
 by support.bugseng.com (Postfix) with ESMTPSA id AA4D94EE073C;
 Fri, 15 Dec 2023 10:28:51 +0100 (CET)
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
X-Inumbo-ID: 5c71ab82-9b2c-11ee-98ea-6d05b1d4d9a1
Message-ID: <796d26d3-5479-40f8-b640-bdb704347139@bugseng.com>
Date: Fri, 15 Dec 2023 10:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: update configuration of MISRA
 C:2012 Rule 5.6
Content-Language: en-US, it
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <ea8f782e7695b3ee235a89a8575a0af018bc85e4.1702629422.git.federico.serafini@bugseng.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <ea8f782e7695b3ee235a89a8575a0af018bc85e4.1702629422.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/12/23 10:12, Federico Serafini wrote:
> Deviate typedef names that are delberately defined multiple times.
> 
> Update docs/misra/deviations.rst accordingly.
> 
> Tag Rule 5.6 as clean.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>   automation/eclair_analysis/ECLAIR/tagging.ecl    | 2 +-
>   docs/misra/deviations.rst                        | 7 +++++++
>   3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 683f2bbfe8..195ddddde8 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -90,6 +90,12 @@ depending on the guest."
>   -config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
>   -doc_end
>   
> +-doc_begin="On X86, the types \"guest_intpte_t\", \"guest_l1e_t\" and
> +\"guest_l2e_t\" are deliberately defined multiple times, depending on the
> +number of guest paging levels."
> +-config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/include/asm/guest_pt\\.h$)))&&any_area(any_loc(text(^.*(guest_intpte_t|guest_l[12]e_t).*$)))"}
> +-doc_end
> +
>   -doc_begin="The following files are imported from the gnu-efi package."
>   -file_tag+={adopted_r5_6,"^xen/include/efi/.*$"}
>   -file_tag+={adopted_r5_6,"^xen/arch/.*/include/asm/.*/efibind\\.h$"}
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index d5d3bff396..900c532196 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -30,7 +30,7 @@
>   
>   -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
>   
> --service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
> +-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
>   }
>   
>   -setq=target,getenv("XEN_TARGET_ARCH")
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index eda3c8100c..5632685190 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -103,6 +103,13 @@ Deviations related to MISRA C:2012 Rules:
>          type of guest to service.
>        - Tagged as `deliberate` for ECLAIR.
>   
> +   * - R5.6
> +     - On X86, some types are deliberately defined multiple times, depending on
> +       the number of guest paging levels.
> +     - Tagged as `deliberate` for ECLAIR. Such types are:
> +         - guest_intpte

Typo: missing "_t"

> +         - guest_l[12]e_t
> +
>      * - R5.6
>        - Some files are not subject to respect MISRA rules at
>          the moment, but, among these out-of-scope files, there are definitions

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

