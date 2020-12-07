Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7BC2D1097
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 13:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46453.82437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFgf-0007RF-SX; Mon, 07 Dec 2020 12:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46453.82437; Mon, 07 Dec 2020 12:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFgf-0007Qt-PJ; Mon, 07 Dec 2020 12:32:17 +0000
Received: by outflank-mailman (input) for mailman id 46453;
 Mon, 07 Dec 2020 12:32:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmFgd-0007Qo-MS
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 12:32:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8455dca-2113-4c98-bda9-2ed1c283df70;
 Mon, 07 Dec 2020 12:32:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E8E2AB63;
 Mon,  7 Dec 2020 12:32:12 +0000 (UTC)
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
X-Inumbo-ID: d8455dca-2113-4c98-bda9-2ed1c283df70
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607344332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yeb2J/POhdCK8JJbUDoyJ67Va85k6Y65cXrZDPBUImQ=;
	b=EuITZBfFFnnuVoXk0qExFvbzmlzl0IIK2wqqpd+1pfCM0qiP05+nB3WhtPlyHVa/Bi6z9C
	7HrInX5p+feEZ8631ZGKrRP5EvOSWyDXbMe7Ns+L0xLTphoa4x0ypQOaCnaMMDTC48TJRf
	eMcs/+kI0tCgO0+ClKjvia7F+egvqu4=
Subject: Re: [PATCH V3 11/23] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, Paul Durrant <paul@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-12-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <742899b6-964b-be75-affc-31342c07133a@suse.com>
Date: Mon, 7 Dec 2020 13:32:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-12-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -142,8 +142,8 @@ void hvmemul_cancel(struct vcpu *v)
>  {
>      struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
>  
> -    vio->io_req.state = STATE_IOREQ_NONE;
> -    vio->io_completion = HVMIO_no_completion;
> +    v->io.req.state = STATE_IOREQ_NONE;
> +    v->io.completion = IO_no_completion;
>      vio->mmio_cache_count = 0;
>      vio->mmio_insn_bytes = 0;
>      vio->mmio_access = (struct npfec){};
> @@ -159,7 +159,7 @@ static int hvmemul_do_io(
>  {
>      struct vcpu *curr = current;
>      struct domain *currd = curr->domain;
> -    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
> +    struct vcpu_io *vio = &curr->io;

Taking just these two hunks: "vio" would now stand for two entirely
different things. I realize the name is applicable to both, but I
wonder if such naming isn't going to risk confusion. Despite being
relatively familiar with the involved code, I've been repeatedly
unsure what exactly "vio" covers, and needed to go back to the
header. So together with the name possible adjustment mentioned
further down, maybe "vcpu_io" also wants it name changed, such that
the variable then also could sensibly be named (slightly)
differently? struct vcpu_io_state maybe? Or alternatively rename
variables of type struct hvm_vcpu_io * to hvio or hio? Otoh the
savings aren't very big for just ->io, so maybe better to stick to
the prior name with the prior type, and not introduce local
variables at all for the new field, like you already have it in the
former case?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -145,6 +145,21 @@ void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy */
>  
>  struct waitqueue_vcpu;
>  
> +enum io_completion {
> +    IO_no_completion,
> +    IO_mmio_completion,
> +    IO_pio_completion,
> +#ifdef CONFIG_X86
> +    IO_realmode_completion,
> +#endif
> +};

I'm not entirely happy with io_ / IO_ here - they seem a little
too generic. How about ioreq_ / IOREQ_ respectively?

> +struct vcpu_io {
> +    /* I/O request in flight to device model. */
> +    enum io_completion   completion;
> +    ioreq_t              req;
> +};
> +
>  struct vcpu
>  {
>      int              vcpu_id;
> @@ -256,6 +271,10 @@ struct vcpu
>      struct vpci_vcpu vpci;
>  
>      struct arch_vcpu arch;
> +
> +#ifdef CONFIG_IOREQ_SERVER
> +    struct vcpu_io io;
> +#endif
>  };

I don't have a good solution in mind, and I'm also not meaning to
necessarily request a change here, but I'd like to point out that
this does away (for this part of it only, of course) with the
overlaying of the PV and HVM sub-structs on x86. As long as the
HVM part is the far bigger one, that's not a problem, but I wanted
to mention the aspect nevertheless.

Jan

