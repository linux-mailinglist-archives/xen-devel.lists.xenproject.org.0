Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60777C544C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 14:50:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615488.956741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYfC-00084B-CQ; Wed, 11 Oct 2023 12:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615488.956741; Wed, 11 Oct 2023 12:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYfC-00082D-8C; Wed, 11 Oct 2023 12:50:10 +0000
Received: by outflank-mailman (input) for mailman id 615488;
 Wed, 11 Oct 2023 12:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJaT=FZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqYfA-00080o-RY
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 12:50:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b47543f6-6834-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 14:50:07 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id AF2754EE0747;
 Wed, 11 Oct 2023 14:50:06 +0200 (CEST)
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
X-Inumbo-ID: b47543f6-6834-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Wed, 11 Oct 2023 14:50:06 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.19] x86/cpu-policy: Adjust
 CPUID_MAX_SERIALISED_LEAVES to placate MISRA
In-Reply-To: <20231010095748.1205365-1-andrew.cooper3@citrix.com>
References: <20231010095748.1205365-1-andrew.cooper3@citrix.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <474253da350796cfd8c212fcc7d81087@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/2023 11:57, Andrew Cooper wrote:
> MISRA doesn't like !!CONST being used in place of a 1 (Rule 10.1).  
> Update the
> expression to just be a plain 1, which still matches the description.
> 
> No functional change.
> 
> Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> After considering the comment several times, I've decided to leave it 
> as is.
> It's slightly awkward grammar but it's ok.
> ---
>  xen/include/xen/lib/x86/cpu-policy.h | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h
> b/xen/include/xen/lib/x86/cpu-policy.h
> index bab3eecda6c1..d5e447e9dc06 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -100,13 +100,14 @@ const char *x86_cpuid_vendor_to_str(unsigned int 
> vendor);
>   * interaction with the toolstack.  (Sum of all leaves in each union, 
> less the
>   * entries in basic which sub-unions hang off of.)
>   */
> -#define CPUID_MAX_SERIALISED_LEAVES                     \
> -    (CPUID_GUEST_NR_BASIC +                             \
> -     CPUID_GUEST_NR_FEAT   - !!CPUID_GUEST_NR_FEAT +    \
> -     CPUID_GUEST_NR_CACHE  - !!CPUID_GUEST_NR_CACHE +   \
> -     CPUID_GUEST_NR_TOPO   - !!CPUID_GUEST_NR_TOPO +    \
> -     CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
> -     CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
> +#define CPUID_MAX_SERIALISED_LEAVES             \
> +    (CPUID_GUEST_NR_BASIC +                     \
> +     CPUID_GUEST_NR_FEAT   - 1 +                \
> +     CPUID_GUEST_NR_CACHE  - 1 +                \
> +     CPUID_GUEST_NR_TOPO   - 1 +                \
> +     CPUID_GUEST_NR_XSTATE - 1 +                \
> +     CPUID_GUEST_NR_EXTD +                      \
> +     2 /* hv_limit and hv2_limit */ )
> 
>  /* Maximum number of MSRs written when serialising a cpu_policy. */
>  #define MSR_MAX_SERIALISED_ENTRIES 2
> 
> base-commit: c035151902689aa5a3765aeb16fa52755917b9ca

Looks good to me.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

