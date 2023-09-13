Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB0F79F0B2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 19:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601522.937538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgU6D-0002wy-7w; Wed, 13 Sep 2023 17:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601522.937538; Wed, 13 Sep 2023 17:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgU6D-0002tf-58; Wed, 13 Sep 2023 17:56:25 +0000
Received: by outflank-mailman (input) for mailman id 601522;
 Wed, 13 Sep 2023 17:56:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgU6B-0002sK-IG
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 17:56:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgU6A-0004sP-FI; Wed, 13 Sep 2023 17:56:22 +0000
Received: from [15.248.2.159] (helo=[10.24.67.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgU6A-0007ty-7D; Wed, 13 Sep 2023 17:56:22 +0000
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
	bh=ksKg5BLOi+cnp2sS4u+gQyJ5yiZxt1Q9KO8tlPRO0+M=; b=YNNqWsLGbu/UT2QEoyGFMjyIwc
	9BpSDjSoPbNwAfZen3K4HfkXvQZFuKCdZt9IjcPnXFn+72rumSLF3QJQTT8QSWdiNB/8XAm3EJqxM
	Vxm6gySYMsYsh1CgyGBRjp99DRE9OGQw3rCwuTaxWBLGahpL+3A8FPCWA7YpmZSX0OHY=;
Message-ID: <e4ab7415-cf72-4c04-93dd-fd393f49f6f5@xen.org>
Date: Wed, 13 Sep 2023 18:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2023 16:01, Jan Beulich wrote:
> [1] specifies a long list of instructions which are intended to exhibit
> timing behavior independent of the data they operate on. On certain
> hardware this independence is optional, controlled by a bit in a new
> MSR. Provide a command line option to control the mode Xen and its
> guests are to operate in, with a build time control over the default.
> Longer term we may want to allow guests to control this.

If I read correctly the discussion on the previous version. There was 
some concern with this version of patch. I can't find anything public 
suggesting that the concerned were dismissed. Do you have any pointer?

> Since Arm64 supposedly also has such a control, put command line option
> and Kconfig control in common files.
> 
> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
> 
> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This may be viewed as a new feature, and hence be too late for 4.18. It
> may, however, also be viewed as security relevant, which is why I'd like
> to propose to at least consider it.
> 
> Slightly RFC, in particular for whether the Kconfig option should
> default to Y or N.

I am not entirely sure. I understand that DIT will help in the 
cryptographic case but it is not clear to me what is the performance impact.

> 
> I would have wanted to invoke setup_doitm() from cpu_init(), but that
> works only on the BSP. On APs cpu_init() runs before ucode loading.
> Plus recheck_cpu_features() invoking identify_cpu() takes care of the
> BSP during S3 resume.
> ---
> v2: Introduce and use cpu_has_doitm. Add comment "borrowed" from the
>      XenServer patch queue patch providing similar functionality.
>      Re-base.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -788,6 +788,14 @@ Specify the size of the console debug tr
>   additionally a trace buffer of the specified size is allocated per cpu.
>   The debug trace feature is only enabled in debugging builds of Xen.
>   
> +### dit (x86)
> +> `= <boolean>`
> +
> +> Default: `CONFIG_DIT_DEFAULT`
> +
> +Specify whether Xen and guests should operate in Data Independent Timing
> +mode.
> +
>   ### dma_bits
>   > `= <integer>`
>   
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -15,6 +15,7 @@ config X86
>   	select HAS_ALTERNATIVE
>   	select HAS_COMPAT
>   	select HAS_CPUFREQ
> +	select HAS_DIT
>   	select HAS_EHCI
>   	select HAS_EX_TABLE
>   	select HAS_FAST_MULTIPLY
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -204,6 +204,28 @@ void ctxt_switch_levelling(const struct
>   		alternative_vcall(ctxt_switch_masking, next);
>   }
>   
> +static void setup_doitm(void)
> +{
> +    uint64_t msr;
> +
> +    if ( !cpu_has_doitm )

I am not very familiar with the feature. If it is not present, then can 
we guarantee that the instructions will be executed in constant time?

If not, I think we should taint Xen and/or print a message if the admin 
requested to use DIT. This would make clear that the admin is trying to 
do something that doesn't work.

> +        return;
> +
> +    /*
> +     * We don't currently enumerate DOITM to guests.  As a conseqeuence, guest
> +     * kernels will believe they're safe even when they are not.
> +     *
> +     * For now, set it unilaterally.  This prevents otherwise-correct crypto
> +     * code from becoming vulnerable to timing sidechannels.
> +     */
> +
> +    rdmsrl(MSR_UARCH_MISC_CTRL, msr);
> +    msr |= UARCH_CTRL_DOITM;
> +    if ( !opt_dit )
> +        msr &= ~UARCH_CTRL_DOITM;
> +    wrmsrl(MSR_UARCH_MISC_CTRL, msr);
> +}
> +
>   bool opt_cpu_info;
>   boolean_param("cpuinfo", opt_cpu_info);
>   
> @@ -589,6 +611,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>   
>   		mtrr_bp_init();
>   	}
> +
> +	setup_doitm();
>   }
>   
>   /* leaf 0xb SMT level */
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -201,6 +201,7 @@ static inline bool boot_cpu_has(unsigned
>   #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
>   #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
>   #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
> +#define cpu_has_doitm           boot_cpu_has(X86_FEATURE_DOITM)
>   #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
>   #define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
>   #define cpu_has_gds_ctrl        boot_cpu_has(X86_FEATURE_GDS_CTRL)
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -41,6 +41,9 @@ config HAS_COMPAT
>   config HAS_DEVICE_TREE
>   	bool
>   
> +config HAS_DIT # Data Independent Timing
> +	bool
> +
>   config HAS_EX_TABLE
>   	bool
>   
> @@ -175,6 +178,18 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
>   
>   endmenu
>   
> +config DIT_DEFAULT
> +	bool "Data Independent Timing default"
> +	depends on HAS_DIT
> +	help
> +	  Hardware often surfaces instructions the timing of which is dependent
> +	  on the data they process.  Some of these instructions may be used in
> +	  timing sensitive environments, e.g. cryptography.  When such
> +	  instructions exist, hardware may further surface a control allowing
> +	  to make the behavior of such instructions independent of the data
> +	  they act upon.  Choose the default here for when no "dit" command line
> +	  option is present.
> +
>   config HYPFS
>   	bool "Hypervisor file system support"
>   	default y
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -28,6 +28,11 @@ CHECK_feature_info;
>   
>   enum system_state system_state = SYS_STATE_early_boot;
>   
> +#ifdef CONFIG_HAS_DIT
> +bool __ro_after_init opt_dit = IS_ENABLED(CONFIG_DIT_DEFAULT);
> +boolean_param("dit", opt_dit);
> +#endif
> +
>   static xen_commandline_t saved_cmdline;
>   static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
>   
> --- a/xen/include/xen/param.h
> +++ b/xen/include/xen/param.h
> @@ -184,6 +184,8 @@ extern struct param_hypfs __paramhypfs_s
>       string_param(_name, _var); \
>       string_runtime_only_param(_name, _var)
>   
> +extern bool opt_dit;
> +
>   static inline void no_config_param(const char *cfg, const char *param,
>                                      const char *s, const char *e)
>   {

Cheers,

[1] 
https://lore.kernel.org/all/8f07c532-e742-fa02-27ee-b08c56299d09@citrix.com/

-- 
Julien Grall

