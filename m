Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44532547B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89875.169722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKKZ-0003dq-Hd; Thu, 25 Feb 2021 17:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89875.169722; Thu, 25 Feb 2021 17:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKKZ-0003dU-EP; Thu, 25 Feb 2021 17:21:39 +0000
Received: by outflank-mailman (input) for mailman id 89875;
 Thu, 25 Feb 2021 17:21:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKKY-0003dP-GP
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:21:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKKY-0005Tg-BR
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:21:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKKY-0001jJ-Ab
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:21:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFKKV-00024q-2W; Thu, 25 Feb 2021 17:21:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=RDMUm1GIH6FXebhsBXlQjycVMdIC2gr2w/QW6l+NXSI=; b=34C8ujWZj6saD8zHFuHnDsxlk0
	sKaNbffvXIhMcU+8uDMo0OffI5PCZ8F05yqkVr6/9H2DXZixwdOyNwgbVEEG2ETerbv9NrKN+tPP3
	BbivHhnY9JAsGkdRQMEf5rg/Kt4zBMi2izMeV+BqLnFnGAj67j98dRZkw4RHJavKo3LQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.56478.814418.802877@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 17:21:34 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.15] dmop: Add XEN_DMOP_nr_vcpus
In-Reply-To: <20210225170946.4297-1-andrew.cooper3@citrix.com>
References: <20210225170946.4297-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] dmop: Add XEN_DMOP_nr_vcpus"):
> Curiously absent from the stable API/ABIs is an ability to query the number of
> vcpus which a domain has.  Emulators need to know this information in
> particular to know how many stuct ioreq's live in the ioreq server mappings.
> 
> In practice, this forces all userspace to link against libxenctrl to use
> xc_domain_getinfo(), which rather defeats the purpose of the stable libraries.

Wat

> For 4.15.  This was a surprise discovery in the massive ABI untangling effort
> I'm currently doing for XenServer's new build system.

Given that this is a new feature at a late stage I am going to say
this:

I will R-A it subject to it getting *two* independent Reviewed-by.

I will try to one of them myself :-).

...

> +/*
> + * XEN_DMOP_nr_vcpus: Query the number of vCPUs a domain has.
> + *
> + * The number of vcpus a domain has is fixed from creation time.  This bound
> + * is applicable to e.g. the vcpuid parameter of XEN_DMOP_inject_event, or
> + * number of struct ioreq objects mapped via XENMEM_acquire_resource.

AIUI from the code, the value is the maximum number of vcpus, in the
sense that they are not necessarily all online.  In which case I think
maybe you want to mention that here ?

> diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
> index 398993d5f4..cbbd20c958 100644
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -107,6 +107,7 @@
>  ?	dm_op_set_pci_intx_level	hvm/dm_op.h
>  ?	dm_op_set_pci_link_route	hvm/dm_op.h
>  ?	dm_op_track_dirty_vram		hvm/dm_op.h
> +?	dm_op_nr_vcpus			hvm/dm_op.h
>  !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op.h
>  ?	vcpu_hvm_context		hvm/hvm_vcpu.h
>  ?	vcpu_hvm_x86_32			hvm/hvm_vcpu.h
> -- 

I have no idea what even.  I read the comment at the top of the file.

So for *everything except the xlat.lst change*
Reviewed-by: Ian Jackson <iwj@xenproject.org>

Thanks,
Ian.

