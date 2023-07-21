Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE11275D799
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 00:39:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567723.887148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMymM-00012E-2C; Fri, 21 Jul 2023 22:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567723.887148; Fri, 21 Jul 2023 22:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMymL-0000zl-Vp; Fri, 21 Jul 2023 22:39:17 +0000
Received: by outflank-mailman (input) for mailman id 567723;
 Fri, 21 Jul 2023 22:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMymL-0000zN-4f
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 22:39:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a477032-2817-11ee-8611-37d641c3527e;
 Sat, 22 Jul 2023 00:39:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1042961DA7;
 Fri, 21 Jul 2023 22:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0820BC433C7;
 Fri, 21 Jul 2023 22:39:10 +0000 (UTC)
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
X-Inumbo-ID: 6a477032-2817-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689979152;
	bh=fBu2vIAo4FEQzspszeHExPOTex37WWemVOEpVGf/hec=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z8+62XoxyWFBj02nvPyaLwIoYtTZ1TNOEhq1K6kYEqs7BdFz6yCcC/0dAGAb6pHcI
	 g/jRFfb9HXCuY/o6CEGFjZY/uMERwA646/27PIFIivtDLcdr+mAGA6YUxj9HlbnwBt
	 01OU2hbsILtKPNY3f8ejP5XNgkqyk6ew4FRZLvKFGlph7se43zkZ480iNgodCC4voL
	 2WfR8742UGKai0g3n3ka4snpBvBJbBTVHtg5sX3l1jlA7h9rhXhJzTPhk4PSHyRKU3
	 0q/aOPvWmHL+MyxRNMFYujDmJDQEO4Ob46CIwTcQAs6OLSARFZ/oDHCExRqegNM2d+
	 b0YibygKwxKYQ==
Date: Fri, 21 Jul 2023 15:39:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH] x86/cpu-policy: address violations of MISRA C:2012
 Rule 8.3 on parameter names
In-Reply-To: <912cfe8f5b043bddc80cbf9f75cc0b35e02a6ecd.1689929894.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307211539000.3118466@ubuntu-linux-20-04-desktop>
References: <912cfe8f5b043bddc80cbf9f75cc0b35e02a6ecd.1689929894.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jul 2023, Federico Serafini wrote:
> Change parameter names in function declarations to be consistent with
> the ones used in the correponding definitions, thus addressing
> violations of MISRA C:2012 Rule 8.3: "All declarations of an object or
> function shall use the same names and type qualifiers".
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/lib/x86/cpu-policy.h | 29 ++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index 6d5e9edd26..bab3eecda6 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -451,23 +451,24 @@ typedef xen_msr_entry_t msr_entry_buffer_t[];
>   * Serialise the CPUID leaves of a cpu_policy object into an array of cpuid
>   * leaves.
>   *
> - * @param policy     The cpu_policy to serialise.
> - * @param leaves     The array of leaves to serialise into.
> - * @param nr_entries The number of entries in 'leaves'.
> + * @param p            The cpu_policy to serialise.
> + * @param leaves       The array of leaves to serialise into.
> + * @param nr_entries_p The number of entries in 'leaves'.
>   * @returns -errno
>   *
>   * Writes at most CPUID_MAX_SERIALISED_LEAVES.  May fail with -ENOBUFS if the
>   * leaves array is too short.  On success, nr_entries is updated with the
>   * actual number of leaves written.
>   */
> -int x86_cpuid_copy_to_buffer(const struct cpu_policy *policy,
> -                             cpuid_leaf_buffer_t leaves, uint32_t *nr_entries);
> +int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
> +                             cpuid_leaf_buffer_t leaves,
> +                             uint32_t *nr_entries_p);
>  
>  /**
>   * Unserialise the CPUID leaves of a cpu_policy object into an array of cpuid
>   * leaves.
>   *
> - * @param policy      The cpu_policy to unserialise into.
> + * @param p           The cpu_policy to unserialise into.
>   * @param leaves      The array of leaves to unserialise from.
>   * @param nr_entries  The number of entries in 'leaves'.
>   * @param err_leaf    Optional hint for error diagnostics.
> @@ -481,7 +482,7 @@ int x86_cpuid_copy_to_buffer(const struct cpu_policy *policy,
>   * No content validation of in-range leaves is performed.  Synthesised data is
>   * recalculated.
>   */
> -int x86_cpuid_copy_from_buffer(struct cpu_policy *policy,
> +int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
>                                 const cpuid_leaf_buffer_t leaves,
>                                 uint32_t nr_entries, uint32_t *err_leaf,
>                                 uint32_t *err_subleaf);
> @@ -489,22 +490,22 @@ int x86_cpuid_copy_from_buffer(struct cpu_policy *policy,
>  /**
>   * Serialise the MSRs of a cpu_policy object into an array.
>   *
> - * @param policy     The cpu_policy to serialise.
> - * @param msrs       The array of msrs to serialise into.
> - * @param nr_entries The number of entries in 'msrs'.
> + * @param p            The cpu_policy to serialise.
> + * @param msrs         The array of msrs to serialise into.
> + * @param nr_entries_p The number of entries in 'msrs'.
>   * @returns -errno
>   *
>   * Writes at most MSR_MAX_SERIALISED_ENTRIES.  May fail with -ENOBUFS if the
>   * buffer array is too short.  On success, nr_entries is updated with the
>   * actual number of msrs written.
>   */
> -int x86_msr_copy_to_buffer(const struct cpu_policy *policy,
> -                           msr_entry_buffer_t msrs, uint32_t *nr_entries);
> +int x86_msr_copy_to_buffer(const struct cpu_policy *p,
> +                           msr_entry_buffer_t msrs, uint32_t *nr_entries_p);
>  
>  /**
>   * Unserialise the MSRs of a cpu_policy object from an array of msrs.
>   *
> - * @param policy     The cpu_policy object to unserialise into.
> + * @param p          The cpu_policy object to unserialise into.
>   * @param msrs       The array of msrs to unserialise from.
>   * @param nr_entries The number of entries in 'msrs'.
>   * @param err_msr    Optional hint for error diagnostics.
> @@ -518,7 +519,7 @@ int x86_msr_copy_to_buffer(const struct cpu_policy *policy,
>   *
>   * No content validation is performed on the data stored in the policy object.
>   */
> -int x86_msr_copy_from_buffer(struct cpu_policy *policy,
> +int x86_msr_copy_from_buffer(struct cpu_policy *p,
>                               const msr_entry_buffer_t msrs, uint32_t nr_entries,
>                               uint32_t *err_msr);
>  
> -- 
> 2.34.1
> 

