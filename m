Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0E79A9C2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599589.935068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfitV-0005yQ-QO; Mon, 11 Sep 2023 15:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599589.935068; Mon, 11 Sep 2023 15:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfitV-0005wg-NO; Mon, 11 Sep 2023 15:32:09 +0000
Received: by outflank-mailman (input) for mailman id 599589;
 Mon, 11 Sep 2023 15:32:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qfitU-0005wa-6W
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:32:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfitT-00026E-5Q; Mon, 11 Sep 2023 15:32:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfitS-0002o1-Vx; Mon, 11 Sep 2023 15:32:07 +0000
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
	bh=kwGpUryFMYGxz/FXbkKY3k8Xzbnyxko5a+b6qKzQ2Pc=; b=mmty9ARkZ0P0oJAKtEps7TqrNe
	MKngnbolcgWqBRExxcDqt5abma+87f8G4UW8K9ApcYzXWCPG7B2n3hG5xQmYtaZkt/mnQaXA3yZXs
	wFND718h4yornIQ2AOXQvUvKCXL+fpVG9Avu60j1b0bi9sTe81zU/lABW8XRAY5tTB+0=;
Message-ID: <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
Date: Mon, 11 Sep 2023 16:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230908230318.1719290-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230908230318.1719290-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/09/2023 00:03, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> During the discussions that led to the acceptance of Rule 2.1, we
> decided on a few exceptions that were not properly recorded in
> rules.rst. Add them now.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Nicola, does this work with ECLAIR?
> 
> I am referring to the locations of the SAF-2-safe tag on top of
> call_psci_system_off, BUG, etc.
> 
> Changes in v3:
> - added SAF-2-safe to safe.json
> - added a few SAF-2-safe examples
> ---
>   docs/misra/rules.rst    | 13 ++++++++++++-
>   docs/misra/safe.json    |  8 ++++++++
>   xen/arch/arm/psci.c     |  1 +
>   xen/arch/x86/shutdown.c |  1 +
>   xen/include/xen/bug.h   |  2 ++
>   5 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 34916e266a..82de4c645d 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -107,7 +107,18 @@ maintainers if you want to suggest a change.
>      * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
>        - Required
>        - A project shall not contain unreachable code
> -     -
> +     - The following are allowed:
> +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
> +         - Switch with a controlling value statically determined not to
> +           match one or more case statements
> +         - Functions that are intended to be referenced only from
> +           assembly code (e.g. 'do_trap_fiq')
> +         - Deliberate unreachability caused by certain macros/functions,
> +           e.g. BUG, assert_failed, panic, etc. See safe.json.
> +         - asm-offsets.c, as they are not linked deliberately, because
> +           they are used to generate definitions for asm modules
> +         - Declarations without initializer are safe, as they are not
> +           executed
>   
>      * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
>        - Advisory
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 39c5c056c7..fc96a99fd5 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -20,6 +20,14 @@
>           },
>           {
>               "id": "SAF-2-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R2.1"
> +            },
> +            "name": "Rule 2.1: deliberate unreachability",
> +            "text": "Macro or function designed to be unreachable."
> +        },
> +        {
> +            "id": "SAF-3-safe",
>               "analyser": {},
>               "name": "Sentinel",
>               "text": "Next ID to be used"
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 695d2fa1f1..2a8527cacc 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -59,6 +59,7 @@ void call_psci_cpu_off(void)
>       }
>   }
>   
> +/* SAF-2-safe */

I think any use of SAF-2-safe should be accompanied with an attribute...

>   void call_psci_system_off(void)

... noreturn for function or ...

>   {
>       if ( psci_ver > PSCI_VERSION(0, 1) )
> diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
> index 7619544d14..47e0f59024 100644
> --- a/xen/arch/x86/shutdown.c
> +++ b/xen/arch/x86/shutdown.c
> @@ -118,6 +118,7 @@ static inline void kb_wait(void)
>               break;
>   }
>   
> +/* SAF-2-safe */
>   static void noreturn cf_check __machine_halt(void *unused)
>   {
>       local_irq_disable();
> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> index e8a4eea71a..d47c54f034 100644
> --- a/xen/include/xen/bug.h
> +++ b/xen/include/xen/bug.h
> @@ -117,6 +117,7 @@ struct bug_frame {
>   #endif
>   
>   #ifndef BUG
> +/* SAF-2-safe */
>   #define BUG() do {                                              \
>       BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
>       unreachable();                                              \

... unreachable for macros. But the /* SAF-2-safe */ feels a little bit 
redundant when a function is marked as 'noreturn'.

Is there any way to teach eclair about noreturn?

Cheers,

-- 
Julien Grall

