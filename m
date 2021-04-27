Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104636C8F3
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 17:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118659.224874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQ4u-0005Rh-6o; Tue, 27 Apr 2021 15:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118659.224874; Tue, 27 Apr 2021 15:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQ4u-0005RH-3B; Tue, 27 Apr 2021 15:56:48 +0000
Received: by outflank-mailman (input) for mailman id 118659;
 Tue, 27 Apr 2021 15:56:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbQ4s-0005RC-IF
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 15:56:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f46117b-8939-40b9-9c77-c7f2f4f4544c;
 Tue, 27 Apr 2021 15:56:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9EBDB118;
 Tue, 27 Apr 2021 15:56:44 +0000 (UTC)
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
X-Inumbo-ID: 3f46117b-8939-40b9-9c77-c7f2f4f4544c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619539004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wq/PW9ZB7quAFHCy0XCp53jcNJAonPrfJYOJHlxRxmY=;
	b=uspOmFH6Bn7XFSKpdGM6HdhpjpzfJa5Q/OxSmKHnA9IglDFmoG9auTxES4Ljq2suV/MaP+
	Rz0gqQfZzh7ZN2THB+aMufnLx0IQRghR2Tbprg90Qm81/D8fD6Fe4o3fkn/1w2Uo0KfHFY
	vqUMrCCyHU43QigX3g3PAB93sdfLGBA=
Subject: Re: [PATCH 3/3] x86/VT-x: Enumeration for CET
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d5ae2cf3-1157-d589-6c1d-8717a45a2753@suse.com>
Date: Tue, 27 Apr 2021 17:56:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210426175421.30497-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 19:54, Andrew Cooper wrote:
> VT-x has separate entry/exit control for loading guest/host state.  Saving
> guest state on vmexit is performed unconditionally.

With the latter I find ...

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -2014,6 +2014,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
>      printk("RFLAGS=0x%08lx (0x%08lx)  DR7 = 0x%016lx\n",
>             vmr(GUEST_RFLAGS), regs->rflags,
>             vmr(GUEST_DR7));
> +    if ( vmentry_ctl & VM_ENTRY_LOAD_GUEST_CET )
> +        printk("SSP = 0x%016lx S_CET = 0x%016lx ISST = 0x%016lx\n",
> +               vmr(GUEST_SSP), vmr(GUEST_S_CET), vmr(GUEST_ISST));

... the conditional here a little odd, but I expect the plan is
to have the various bits all set consistently once actually
enabling the functionality.

Jan

