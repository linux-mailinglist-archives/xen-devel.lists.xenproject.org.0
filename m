Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B788C6F85
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722704.1126925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P0e-00032C-3W; Thu, 16 May 2024 00:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722704.1126925; Thu, 16 May 2024 00:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P0e-0002zj-0p; Thu, 16 May 2024 00:30:12 +0000
Received: by outflank-mailman (input) for mailman id 722704;
 Thu, 16 May 2024 00:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7P0c-0002zb-NL
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:30:10 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 707c00c7-131b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:30:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 958DCCE1808;
 Thu, 16 May 2024 00:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4667FC116B1;
 Thu, 16 May 2024 00:29:57 +0000 (UTC)
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
X-Inumbo-ID: 707c00c7-131b-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715819398;
	bh=q95dNPvd+2hCI4U/34Jz0uKLv0pHekZk6C/qrWY/vEg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rNyn0vu3alstK8Hqtl9AvfDkjHp41m/cGOnSZAcdPlmdEt9kk6KMnV8zhkPkw7UNa
	 /IGC+I8+jPyjX7dkzNRwh65gNZnUBue6JyRiWiPJ8CV6Rxtuzv6GHLBhUzrM9PZAUT
	 HqUIQsT5xJtvKm6IS916XX56fPcUm1AZG1g5/GdZZWXr4P8UKFuZKAKJibfZW9arhm
	 2UA96VyCm8pMz3vd1/TdEY/V1g/GjX3ZVvplKq8thyAcGKK9LsmPQoUGvaglRcaD+v
	 eCMkSLDWCxtWRfX1sx7jrahO8OhelhYxpWfDEd2E1armDWuerJUQ25VB+ypH6vNU5U
	 iXTEtXOoSXobA==
Date: Wed, 15 May 2024 17:29:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [XEN PATCH v2 02/15] x86/monitor: guard altp2m usage
In-Reply-To: <01767c3f98a88999d4b8ed3ae742ad66a0921ba3.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151729470.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <01767c3f98a88999d4b8ed3ae742ad66a0921ba3.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> Explicitly check whether altp2m is on for domain when getting altp2m index.
> If explicit call to altp2m_active() always returns false, DCE will remove
> call to altp2m_vcpu_idx().
> 
> The puspose of that is later to be able to disable altp2m support and
> exclude its code from the build completely, when not supported by target
> platform (as of now it's supported for VT-d only).
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> CC: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> changes in v2:
>  - patch description changed, removed VMX mentioning
>  - guard by altp2m_active() instead of hvm_altp2m_supported()
> ---
>  xen/arch/x86/hvm/monitor.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> index 2a8ff07ec9..74621000b2 100644
> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -262,6 +262,8 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>      struct vcpu *curr = current;
>      vm_event_request_t req = {};
>      paddr_t gpa = (gfn_to_gaddr(gfn) | (gla & ~PAGE_MASK));
> +    unsigned int altp2m_idx = altp2m_active(curr->domain) ?
> +                              altp2m_vcpu_idx(curr) : 0;
>      int rc;
>  
>      ASSERT(curr->arch.vm_event->send_event);
> @@ -270,7 +272,7 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>       * p2m_get_mem_access() can fail from a invalid MFN and return -ESRCH
>       * in which case access must be restricted.
>       */
> -    rc = p2m_get_mem_access(curr->domain, gfn, &access, altp2m_vcpu_idx(curr));
> +    rc = p2m_get_mem_access(curr->domain, gfn, &access, altp2m_idx);
>  
>      if ( rc == -ESRCH )
>          access = XENMEM_access_n;
> -- 
> 2.25.1
> 

