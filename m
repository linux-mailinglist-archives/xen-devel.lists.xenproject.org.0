Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE892FFF8D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72640.130837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2t73-0006mu-NF; Fri, 22 Jan 2021 09:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72640.130837; Fri, 22 Jan 2021 09:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2t73-0006mV-Jh; Fri, 22 Jan 2021 09:52:17 +0000
Received: by outflank-mailman (input) for mailman id 72640;
 Fri, 22 Jan 2021 09:52:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2t71-0006mP-Vv
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:52:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2t6w-0004d7-18; Fri, 22 Jan 2021 09:52:10 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2t6v-0000Xg-Nz; Fri, 22 Jan 2021 09:52:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=fdvHrwlw0XTJuV/RAajMqZOLHQkT3MKdrITaT+zhZ/c=; b=5W8D+CLGQFhC8+puG8tT/o+zlQ
	TcsXJ/kB9rfiNI/cGs7ikaNdR+vgcWO0SLkI7PDfBtcjXfP/rLPJRtl1f63KD7mFbLQiViVgsEl8o
	6KY4dPOXZcOOIN2FJNjFW+w0WujN9ji91i7Xae7bVLhQ9JmRPngzUItYpr1hjmA2oVr0=;
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
From: Julien Grall <julien@xen.org>
Message-ID: <edc67950-7d8f-5551-23c6-7b4a398ec9cf@xen.org>
Date: Fri, 22 Jan 2021 09:52:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Boris,

On 20/01/2021 22:49, Boris Ostrovsky wrote:
> This option allows guest administrator specify what should happen when
> guest accesses an MSR which is not explicitly emulated by the hypervisor.
> 
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
>   docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
>   tools/libs/light/libxl_types.idl |  7 +++++++
>   tools/xl/xl_parse.c              |  7 +++++++
>   3 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index c8e017f950de..96ce97c42cab 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2044,7 +2044,25 @@ Do not provide a VM generation ID.
>   See also "Virtual Machine Generation ID" by Microsoft:
>   L<https://docs.microsoft.com/en-us/windows/win32/hyperv_v2/virtual-machine-generation-identifier>
>   
> -=back
> +=over
> +
> +=item B<ignore_msrs="STRING">
> +
> +Determine hypervisor behavior on accesses to MSRs that are not emulated by the hypervisor.

The description of the feature looks very x86 focus. Yet, it seems to be 
defined as a generic one.

Could you clarify whether this is intended to be re-usable by other 
architectures?

> +
> +=over 4
> +
> +=item B<never>
> +
> +Issue a warning to the log and #GP to the guest. This is default.
> +
> +=item B<silent>
> +
> +MSR reads return 0, MSR writes are ignored. No warnings to the log.
> +
> +=item B<verbose>
> +
> +Similar to B<silent> but a warning is written.
>   
>   =head3 Guest Virtual Time Controls
>   
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 05324736b744..7b5fef771ee8 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -477,6 +477,12 @@ libxl_tee_type = Enumeration("tee_type", [
>       (1, "optee")
>       ], init_val = "LIBXL_TEE_TYPE_NONE")
>   
> +libxl_ignore_msrs = Enumeration("ignore_msrs", [
> +    (0, "never"),
> +    (1, "silent"),
> +    (2, "verbose"),
> +    ], init_val = "LIBXL_IGNORE_MSRS_NEVER")
> +
>   libxl_rdm_reserve = Struct("rdm_reserve", [
>       ("strategy",    libxl_rdm_reserve_strategy),
>       ("policy",      libxl_rdm_reserve_policy),
> @@ -559,6 +565,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>       ("apic",             libxl_defbool),
>       ("dm_restrict",      libxl_defbool),
>       ("tee",              libxl_tee_type),
> +    ("ignore_msrs",      libxl_ignore_msrs),
>       ("u", KeyedUnion(None, libxl_domain_type, "type",
>                   [("hvm", Struct(None, [("firmware",         string),
>                                          ("bios",             libxl_bios_type),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 4ebf39620ae7..942086c3f41d 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2732,6 +2732,13 @@ skip_usbdev:
>           }
>       }
>   
> +    if (!xlu_cfg_get_string(config, "ignore_msrs", &buf, 0)) {
> +        if (libxl_ignore_msrs_from_string(buf, &b_info->ignore_msrs)) {
> +           fprintf(stderr, "ERROR: invalid value \"%s\" for \"ignore_msrs\"\n", buf);
> +           exit(1);
> +        }
> +    }
> +
>       parse_vkb_list(config, d_config);
>   
>       xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
> 

Cheers,

-- 
Julien Grall

