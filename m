Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0929B664
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 16:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12957.33448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXQph-0003Yq-VD; Tue, 27 Oct 2020 15:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12957.33448; Tue, 27 Oct 2020 15:24:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXQph-0003YR-Rj; Tue, 27 Oct 2020 15:24:21 +0000
Received: by outflank-mailman (input) for mailman id 12957;
 Tue, 27 Oct 2020 15:24:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXQpf-0003YM-QY
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 15:24:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 772fbcc8-0320-4c46-b379-da3ec11fb5ad;
 Tue, 27 Oct 2020 15:24:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B57B7ACF3;
 Tue, 27 Oct 2020 15:24:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXQpf-0003YM-QY
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 15:24:19 +0000
X-Inumbo-ID: 772fbcc8-0320-4c46-b379-da3ec11fb5ad
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 772fbcc8-0320-4c46-b379-da3ec11fb5ad;
	Tue, 27 Oct 2020 15:24:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603812256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8683Ro2k05l4yvE9DeZmnIto4ZGZzqKcEzAUrqe+O4=;
	b=tvB1HMWEg+PsBjR6EgLEVO0+WyUP6MPzu+3vThxFFxEOxc8M8X+91neQOUWB3NT7/C8Tti
	hWbszOMm+2E7wzDU7BoAEQQpSxtDwVBnkTKux1yOhJq/hNMey28RVy8PbXJG/QvZi+4Kee
	6ldtC9L4+9jIpGyWUdJEtTVot0Hv5Ec=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B57B7ACF3;
	Tue, 27 Oct 2020 15:24:16 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: Merge hsa and host_vmcb to reduce memory
 overhead
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201026135043.15560-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec123127-786a-02e9-07dd-351f30b6a5b3@suse.com>
Date: Tue, 27 Oct 2020 16:24:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026135043.15560-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 14:50, Andrew Cooper wrote:
> The format of the Host State Area is, and has always been, a VMCB.  It is
> explicitly safe to put the host VMSAVE data in.

Nit: The PM calls this "Host Save Area" or "Host State Save Area"
afaics.

I recall us discussing this option in the past, and not right
away pursuing it because of it not having been explicit at the
time. What place in the doc has made this explicit? The main
uncertainty (without any explicit statement) on my part would be
the risk of VMSAVE writing (for performance reasons) e.g. full
cache lines, i.e. more than exactly the bits holding the state
to be saved, without first bringing old contents in from memory.

Of course, with the VMSAVE gone from svm_ctxt_switch_to() the
only one left is in _svm_cpu_up(), i.e. long before the first
VM exit, but then the same consideration could apply the other
way around (VM exit writing full cache lines, assuming the
other parts of the HSA are unused).

And then of course, if in fact this isn't spelled out anywhere,
there's the forward compatibility question.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -72,11 +72,10 @@ static void svm_update_guest_efer(struct vcpu *);
>  static struct hvm_function_table svm_function_table;
>  
>  /*
> - * Physical addresses of the Host State Area (for hardware) and vmcb (for Xen)
> - * which contains Xen's fs/gs/tr/ldtr and GSBASE/STAR/SYSENTER state when in
> - * guest vcpu context.
> + * Host State Area.  This area is used by the processor in non-root mode, and
> + * contains Xen's fs/gs/tr/ldtr and GSBASE/STAR/SYSENTER state required to
> + * leave guest vcpu context.
>   */
> -static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, hsa);
>  static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, host_vmcb);

The comment now applies to host_vmcb, so making the dual purpose
more obvious would imo be helpful. This would in particular mean
not starting with (only) "Host State Area" (unless here you really
mean to use a term different from the PM, to express the superset,
but then one less easy to mix up with Host Save Area would likely
be better), and not solely referring to non-root mode. Albeit
maybe you mean root mode by saying "contains Xen's"? If so,
perhaps "..., and also contains"?

Jan

