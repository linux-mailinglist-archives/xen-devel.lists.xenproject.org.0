Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6922745CD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 17:53:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKkbC-0008Jx-Nt; Tue, 22 Sep 2020 15:52:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKkbB-0008Js-O8
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 15:52:57 +0000
X-Inumbo-ID: cf41280b-ef76-4ce3-82bd-d76b563bccd1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf41280b-ef76-4ce3-82bd-d76b563bccd1;
 Tue, 22 Sep 2020 15:52:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600789975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTJ7e6edhls5c1PC+1a5L8zoMSR0i95Tam2+kryT4Tc=;
 b=qLDaVnJ8N9ihmyvBW6XfrVkXw9cgb28/75O6Gm3GsluVzVT84OvnEMM85SJFcg06URF6b+
 pL9iulGgoA8DBXDbDmb1BARwXIcoh/KadtfPHH5k3x/A9tljmKI8tvRnwdHb3K+LjnRKcf
 hiDJk/A1iRoiK/hyn85Tp/DLW/ngf9E=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D677B1D8;
 Tue, 22 Sep 2020 15:53:32 +0000 (UTC)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
 <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
 <bf128337-699f-5942-b387-aa896000700c@suse.com>
 <97b48017-55e1-8464-031a-b54dd8e4e474@gmail.com>
 <d7d6d211-1a24-b452-d1ea-efb0105995b7@suse.com>
 <7bffd6ec-8c41-202a-655d-df2240c1491a@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e59dd52-71ea-6c63-8f63-13928813bb2f@suse.com>
Date: Tue, 22 Sep 2020 17:52:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7bffd6ec-8c41-202a-655d-df2240c1491a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.09.2020 17:05, Oleksandr wrote:
> 2. *arch.hvm.params*: Two functions that use it 
> (hvm_alloc_legacy_ioreq_gfn/hvm_free_legacy_ioreq_gfn) either go into 
> arch code completely or
>      specific macro is used in common code:
> 
>     #define ioreq_get_params(d, i) ((d)->arch.hvm.params[i])

If Arm has the concept of params, then perhaps. But I didn't think
Arm does ...

>     I would prefer macro than moving functions to arch code (which are 
> equal and should remain in sync).

Yes, if the rest of the code is identical, I agree it's better to
merely abstract away small pieces like this one.

> 3. *arch.hvm.hvm_io*: We could also use the following:
> 
>     #define ioreq_get_io_completion(v) ((v)->arch.hvm.hvm_io.io_completion)
>     #define ioreq_get_io_req(v) ((v)->arch.hvm.hvm_io.io_req)
> 
>     This way struct hvm_vcpu_io won't be used in common code as well.

But if Arm needs similar field, why keep them in arch.hvm.hvm_io?

> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -194,7 +194,7 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu 
> *sv, ioreq_t *p)
>   bool handle_hvm_io_completion(struct vcpu *v)
>   {
>       struct domain *d = v->domain;
> -    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
> +    ioreq_t io_req = ioreq_get_io_req(v);
>       struct hvm_ioreq_server *s;
>       struct hvm_ioreq_vcpu *sv;
>       enum hvm_io_completion io_completion;
> @@ -209,14 +209,14 @@ bool handle_hvm_io_completion(struct vcpu *v)
>       if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
>           return false;
> 
> -    vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
> +    io_req.state = hvm_ioreq_needs_completion(&io_req) ?
>           STATE_IORESP_READY : STATE_IOREQ_NONE;

This is unlikely to be correct - you're now updating an on-stack
copy of the ioreq_t instead of what vio points at.

>       msix_write_completion(v);
>       vcpu_end_shutdown_deferral(v);
> 
> -    io_completion = vio->io_completion;
> -    vio->io_completion = HVMIO_no_completion;
> +    io_completion = ioreq_get_io_completion(v);
> +    ioreq_get_io_completion(v) = HVMIO_no_completion;

I think it's at least odd to have an lvalue with this kind of a
name. Perhaps want to drop "get" if it's really meant to be used
like this.

> @@ -247,7 +247,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct 
> hvm_ioreq_server *s)
>       for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>       {
>           if ( !test_and_clear_bit(i, &d->ioreq_gfn.legacy_mask) )
> -            return _gfn(d->arch.hvm.params[i]);
> +            return _gfn(ioreq_get_params(d, i));
>       }
> 
>       return INVALID_GFN;
> @@ -279,7 +279,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct 
> hvm_ioreq_server *s,
> 
>       for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>       {
> -        if ( gfn_eq(gfn, _gfn(d->arch.hvm.params[i])) )
> +        if ( gfn_eq(gfn, _gfn(ioreq_get_params(d, i))) )
>                break;
>       }
>       if ( i > HVM_PARAM_BUFIOREQ_PFN )

And these two are needed by Arm? Shouldn't Arm exclusively use
the new model, via acquire_resource?

Jan

