Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B45304017
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 15:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75113.135163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PEH-0007Jp-Pi; Tue, 26 Jan 2021 14:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75113.135163; Tue, 26 Jan 2021 14:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PEH-0007JQ-MS; Tue, 26 Jan 2021 14:22:01 +0000
Received: by outflank-mailman (input) for mailman id 75113;
 Tue, 26 Jan 2021 14:22:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4PEH-0007JL-0S
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 14:22:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c5a56e5-8867-4cd9-a42a-c9f109f69296;
 Tue, 26 Jan 2021 14:21:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 132C0AB9F;
 Tue, 26 Jan 2021 14:21:59 +0000 (UTC)
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
X-Inumbo-ID: 2c5a56e5-8867-4cd9-a42a-c9f109f69296
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611670919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+YBJ9fC/72cDsXLQxZFpBUhyCz/gjhD5X1FX39LzZI=;
	b=L8Rkc5V/DXvNOkbvQhjahSJ+QASVIbyBLYyxSd00Tu4mYKI3vEXAEWvxpTALwvcVzP5zP9
	ajhHpbJ35+EaivgufviaC807uKLXWh2VlOIAnB0yjfcEqZBZgYQpY1oS3dvnTbIKLCRX6m
	wqn6fxyAn9vz60ARWkBAPBZor3ZdvPw=
Subject: Re: [PATCH v7 09/10] xen/vmtrace: support for VM forks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-10-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c6a7e20-cd34-2bb5-d5c7-c1d6c41919f0@suse.com>
Date: Tue, 26 Jan 2021 15:21:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121212718.2441-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 22:27, Andrew Cooper wrote:
> From: Tamas K Lengyel <tamas.lengyel@intel.com>
> 
> Implement vmtrace_reset_pt function. Properly set IPT
> state for VM forks.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit it strikes me as somewhat odd that ...

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2408,6 +2408,16 @@ static int vmtrace_output_position(struct vcpu *v, uint64_t *pos)
>      return v->arch.hvm.vmx.ipt_active;
>  }
>  
> +static int vmtrace_reset(struct vcpu *v)
> +{
> +    if ( !v->arch.hvm.vmx.ipt_active )
> +        return -EINVAL;
> +
> +    v->arch.msrs->rtit.output_offset = 0;
> +    v->arch.msrs->rtit.status = 0;
> +    return 0;
> +}

... the function/hook return non-void, yet ...

> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1632,6 +1632,8 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
>              copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
>          }
>  
> +        hvm_vmtrace_reset(cd_vcpu);

... the only caller doesn't care.

Jan

