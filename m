Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD933F9E2C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 19:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173902.317283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfrZ-0005RQ-Jx; Fri, 27 Aug 2021 17:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173902.317283; Fri, 27 Aug 2021 17:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfrZ-0005Nx-Fz; Fri, 27 Aug 2021 17:41:57 +0000
Received: by outflank-mailman (input) for mailman id 173902;
 Fri, 27 Aug 2021 17:41:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5dR=NS=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1mJfrY-0005Np-UG
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 17:41:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 124385fe-075e-11ec-aaf9-12813bfff9fa;
 Fri, 27 Aug 2021 17:41:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7637B60EE4;
 Fri, 27 Aug 2021 17:41:52 +0000 (UTC)
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
X-Inumbo-ID: 124385fe-075e-11ec-aaf9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630086115;
	bh=ZsFbmBg1xrV855YRdCxqtna6KwKkyi+rrK0yjGIPz1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tAoRxLGO5DnbrNK6U9xEs9WlHAvzjRip71ZReY2rVojbEHBxz5UZCAhzNuSfQrq+H
	 NW+m9//bXB9q8WmPpnjwe7GaHGSsWoaCI2kiaLUV22U2rWtqqEyfxPGxudzsUZIsk1
	 7ymJ9YdMdMPv0H2UDG2Oy5uVcz9iAViPwTG6WK/0=
Date: Fri, 27 Aug 2021 19:41:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	joro@8bytes.org, davem@davemloft.net, kuba@kernel.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com, arnd@arndb.de,
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
	brijesh.singh@amd.com, thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com, pgonda@google.com,
	martin.b.radev@gmail.com, akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com, rppt@kernel.org,
	hannes@cmpxchg.org, aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, rientjes@google.com,
	ardb@kernel.org, michael.h.kelley@microsoft.com,
	iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
	vkuznets@redhat.com, parri.andrea@gmail.com, dave.hansen@intel.com
Subject: Re: [PATCH V4 05/13] hyperv: Add Write/Read MSR registers via ghcb
 page
Message-ID: <YSkj2kvYoYW8kDiF@kroah.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
 <20210827172114.414281-6-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827172114.414281-6-ltykernel@gmail.com>

On Fri, Aug 27, 2021 at 01:21:03PM -0400, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> Hyperv provides GHCB protocol to write Synthetic Interrupt
> Controller MSR registers in Isolation VM with AMD SEV SNP
> and these registers are emulated by hypervisor directly.
> Hyperv requires to write SINTx MSR registers twice. First
> writes MSR via GHCB page to communicate with hypervisor
> and then writes wrmsr instruction to talk with paravisor
> which runs in VMPL0. Guest OS ID MSR also needs to be set
> via GHCB page.
> 
> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> ---
> Change since v1:
>          * Introduce sev_es_ghcb_hv_call_simple() and share code
>            between SEV and Hyper-V code.
> Change since v3:
>          * Pass old_msg_type to hv_signal_eom() as parameter.
> 	 * Use HV_REGISTER_* marcro instead of HV_X64_MSR_*
> 	 * Add hv_isolation_type_snp() weak function.
> 	 * Add maros to set syinc register in ARM code.
> ---
>  arch/arm64/include/asm/mshyperv.h |  23 ++++++
>  arch/x86/hyperv/hv_init.c         |  36 ++--------
>  arch/x86/hyperv/ivm.c             | 112 ++++++++++++++++++++++++++++++
>  arch/x86/include/asm/mshyperv.h   |  80 ++++++++++++++++++++-
>  arch/x86/include/asm/sev.h        |   3 +
>  arch/x86/kernel/sev-shared.c      |  63 ++++++++++-------
>  drivers/hv/hv.c                   | 112 ++++++++++++++++++++----------
>  drivers/hv/hv_common.c            |   6 ++
>  include/asm-generic/mshyperv.h    |   4 +-
>  9 files changed, 345 insertions(+), 94 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
> index 20070a847304..ced83297e009 100644
> --- a/arch/arm64/include/asm/mshyperv.h
> +++ b/arch/arm64/include/asm/mshyperv.h
> @@ -41,6 +41,29 @@ static inline u64 hv_get_register(unsigned int reg)
>  	return hv_get_vpreg(reg);
>  }
>  
> +#define hv_get_simp(val)	{ val = hv_get_register(HV_REGISTER_SIMP); }
> +#define hv_set_simp(val)	hv_set_register(HV_REGISTER_SIMP, val)
> +
> +#define hv_get_siefp(val)	{ val = hv_get_register(HV_REGISTER_SIEFP); }
> +#define hv_set_siefp(val)	hv_set_register(HV_REGISTER_SIEFP, val)
> +
> +#define hv_get_synint_state(int_num, val) {			\
> +	val = hv_get_register(HV_REGISTER_SINT0 + int_num);	\
> +	}
> +
> +#define hv_set_synint_state(int_num, val)			\
> +	hv_set_register(HV_REGISTER_SINT0 + int_num, val)
> +
> +#define hv_get_synic_state(val) {			\
> +	val = hv_get_register(HV_REGISTER_SCONTROL);	\
> +	}
> +
> +#define hv_set_synic_state(val)			\
> +	hv_set_register(HV_REGISTER_SCONTROL, val)
> +
> +#define hv_signal_eom(old_msg_type)		 \
> +	hv_set_register(HV_REGISTER_EOM, 0)

Please just use real inline functions and not #defines if you really
need it.

thanks,

greg k-h

