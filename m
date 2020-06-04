Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F28E1EDD64
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 08:44:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgjbF-00039y-UX; Thu, 04 Jun 2020 06:43:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jgjbE-00039t-36
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 06:43:36 +0000
X-Inumbo-ID: b629319d-a62e-11ea-ae1e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b629319d-a62e-11ea-ae1e-12813bfff9fa;
 Thu, 04 Jun 2020 06:43:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC70CACA3;
 Thu,  4 Jun 2020 06:43:37 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/shim: Fix defconfig selection and trim the
 build further
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200603170908.13239-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a158ff8-e11e-432c-236d-ff884602d48a@suse.com>
Date: Thu, 4 Jun 2020 08:43:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200603170908.13239-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.06.2020 19:09, Andrew Cooper wrote:
> Several options (TBOOT, XENOPROF, Scheduler) depend on EXPERT to be able to
> deselect/configure.
> 
> Enabling EXPERT now causes the request of the Credit1 scheduler to be honoured
> (rather than giving us Credit2), but take this opportunity to switch to Null,
> as the previously problematic issues are now believed to be fixed.
> 
> Enabling EXPERT also allows XEN_SHSTK to be selected, and we don't want this
> being built for shim.  We also don't want TRACEBUFFER or GDBSX either.
> 
> Take this oppotunity to swap the disable of HVM_FEP for a general disable of
> HVM (likely to have wider impliciations in the future), and disable ARGO (will
> necesserily need plumbing work to function in shim).

Odd. I was quite sure this is the case already; in particular my
own build test of a shim config has this already.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I have a question though (without implying the patch here needs
adjusting, but rather with a look towards after 4.14):

> --- a/xen/arch/x86/configs/pvshim_defconfig
> +++ b/xen/arch/x86/configs/pvshim_defconfig
> @@ -5,19 +5,25 @@ CONFIG_PVH_GUEST=y
>  CONFIG_PV_SHIM=y
>  CONFIG_PV_SHIM_EXCLUSIVE=y
>  CONFIG_NR_CPUS=32
> +CONFIG_EXPERT=y
> +CONFIG_SCHED_NULL=y
>  # Disable features not used by the PV shim
> +# CONFIG_HVM is not set
> +# CONFIG_XEN_SHSTK is not set
>  # CONFIG_HYPFS is not set
>  # CONFIG_SHADOW_PAGING is not set
>  # CONFIG_BIGMEM is not set
> -# CONFIG_HVM_FEP is not set
>  # CONFIG_TBOOT is not set
>  # CONFIG_KEXEC is not set
>  # CONFIG_XENOPROF is not set
>  # CONFIG_XSM is not set
> +# CONFIG_ARGO is not set
> +# CONFIG_SCHED_CREDIT is not set
>  # CONFIG_SCHED_CREDIT2 is not set
>  # CONFIG_SCHED_RTDS is not set
>  # CONFIG_SCHED_ARINC653 is not set
> -# CONFIG_SCHED_NULL is not set
>  # CONFIG_LIVEPATCH is not set
>  # CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
> +# CONFIG_TRACEBUFFER is not set
>  # CONFIG_DEBUG is not set
> +# CONFIG_GDBSX is not set

I assume both the "enable" and "disable" sections here are ordered
like they would be in a resulting full .config. But this being two
separate sections, doing so doesn't help e.g. diff-ing. How about
we sort both sections alphabetically (short of other good sorting
criteria, yet better than entirely unsorted)?

Jan

