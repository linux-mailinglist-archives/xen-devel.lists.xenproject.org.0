Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B211F1713
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 12:58:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiFTn-0006pZ-0f; Mon, 08 Jun 2020 10:58:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiFTm-0006pU-7d
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 10:58:10 +0000
X-Inumbo-ID: ef497734-a976-11ea-b263-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef497734-a976-11ea-b263-12813bfff9fa;
 Mon, 08 Jun 2020 10:58:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6BEFCAAC3;
 Mon,  8 Jun 2020 10:58:10 +0000 (UTC)
Subject: Re: [PATCH-for-4.14] ioreq: handle pending emulation racing with
 ioreq server destruction
To: Paul Durrant <paul@xen.org>
References: <20200608094619.28336-1-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d63c9c7-f4e8-4c56-7778-df17b3c5254b@suse.com>
Date: Mon, 8 Jun 2020 12:58:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200608094619.28336-1-paul@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.06.2020 11:46, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> When an emulation request is initiated in hvm_send_ioreq() the guest vcpu is
> blocked on an event channel until that request is completed. If, however,
> the emulator is killed whilst that emulation is pending then the ioreq
> server may be destroyed. Thus when the vcpu is awoken the code in
> handle_hvm_io_completion() will find no pending request to wait for, but will
> leave the internal vcpu io_req.state set to IOREQ_READY and the vcpu shutdown
> deferall flag in place (because hvm_io_assist() will never be called). The
> emulation request is then completed anyway. This means that any subsequent call
> to hvmemul_do_io() will find an unexpected value in io_req.state and will
> return X86EMUL_UNHANDLEABLE, which in some cases will result in continuous
> re-tries.
> 
> This patch fixes the issue by moving the setting of io_req.state and clearing
> of shutdown deferral (as will as MSI-X write completion) out of hvm_io_assist()
> and directly into handle_hvm_io_completion().
> 
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a question:

> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -109,15 +109,7 @@ static void hvm_io_assist(struct hvm_ioreq_vcpu *sv, uint64_t data)
>      ioreq_t *ioreq = &v->arch.hvm.hvm_io.io_req;
>  
>      if ( hvm_ioreq_needs_completion(ioreq) )
> -    {
> -        ioreq->state = STATE_IORESP_READY;
>          ioreq->data = data;
> -    }
> -    else
> -        ioreq->state = STATE_IOREQ_NONE;
> -
> -    msix_write_completion(v);
> -    vcpu_end_shutdown_deferral(v);
>  
>      sv->pending = false;
>  }

With this, is the function worth keeping at all?

Also I assume the patch has your implied R-a-b?

Jan

