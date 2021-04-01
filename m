Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5D93513F3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104371.199601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuyq-00073R-04; Thu, 01 Apr 2021 10:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104371.199601; Thu, 01 Apr 2021 10:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuyp-000732-T1; Thu, 01 Apr 2021 10:55:15 +0000
Received: by outflank-mailman (input) for mailman id 104371;
 Thu, 01 Apr 2021 10:55:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuyo-00072x-2G
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:55:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 382cc294-1cbb-469d-825a-63f79450266c;
 Thu, 01 Apr 2021 10:55:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BBA78AF1F;
 Thu,  1 Apr 2021 10:55:11 +0000 (UTC)
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
X-Inumbo-ID: 382cc294-1cbb-469d-825a-63f79450266c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617274511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FuAGQnGmOZNlSaQzzz/Ce4FNkqpr4tvjcpEDuNr6/A=;
	b=kSlqY0Md4l4/o8If/01DMSOVN1z9snbhCVeJI7MMiSyNt/+dq0Rc2k8r1t+mGVEJRsnfqn
	FXMpzviQ6GTMwu6IY8xeMY9mBY0b/q3kHWJflAg5A09DBI2pXgl0OonJf7wo5dzhHuLD7p
	ezT6OsjlMDnhbf+jbc7Bdf4lO02/wEo=
Subject: Re: [PATCH] x86/viridian: EOI MSR should always happen in affected
 vCPU context
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210401102252.95196-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e59eee89-d799-0b91-2397-dbb3f1811850@suse.com>
Date: Thu, 1 Apr 2021 12:55:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401102252.95196-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 12:22, Roger Pau Monne wrote:
> The HV_X64_MSR_EOI wrmsr should always happen with the target vCPU
> as current, as there's no support for EOI'ing interrupts on a remote
> vCPU.
> 
> While there also turn the unconditional assert at the top of the
> function into an error on non-debug builds.
> 
> No functional change intended.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -79,11 +79,20 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>      struct viridian_vcpu *vv = v->arch.hvm.viridian;
>      struct domain *d = v->domain;
>  
> -    ASSERT(v == current || !v->is_running);
> +    if ( v != current && v->is_running )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return X86EMUL_EXCEPTION;
> +    }
>  
>      switch ( idx )
>      {
>      case HV_X64_MSR_EOI:
> +        if ( v != current )
> +        {
> +            ASSERT_UNREACHABLE();
> +            return X86EMUL_EXCEPTION;
> +        }
>          vlapic_EOI_set(vcpu_vlapic(v));

I suppose this function then also wants to lose its parameter. But
I'll reply to patch 1 of the other series again as well.

Jan

