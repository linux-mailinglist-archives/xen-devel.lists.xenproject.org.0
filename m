Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF392F6987
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 19:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67471.120466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07OG-0000d7-K9; Thu, 14 Jan 2021 18:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67471.120466; Thu, 14 Jan 2021 18:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07OG-0000cl-Gt; Thu, 14 Jan 2021 18:30:36 +0000
Received: by outflank-mailman (input) for mailman id 67471;
 Thu, 14 Jan 2021 18:30:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI/j=GR=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1l07OE-0000ce-AF
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 18:30:34 +0000
Received: from mail.skyhub.de (unknown [2a01:4f8:190:11c2::b:1457])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddfd7dbf-8fa4-4c4c-9a34-6a300781c403;
 Thu, 14 Jan 2021 18:30:31 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1aa900e8e9bea65a049b95.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f1a:a900:e8e9:bea6:5a04:9b95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5BEDA1EC03CA;
 Thu, 14 Jan 2021 19:30:30 +0100 (CET)
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
X-Inumbo-ID: ddfd7dbf-8fa4-4c4c-9a34-6a300781c403
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1610649030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=evMHSJs6OGwjgkwoX2qZJxB5+p4EsGCVCBCvs1NxTpo=;
	b=jNOZmutTqW+cfYEjryLRyzbm9kOBDQmgyb6h/iz8w29CoZH4xPBW+gUnTW51jZz/5yGtl6
	J4YSg7ufLzTupVUiP2CEfrcd7uJycHcUd1fC9rsuDksbfRgleMAN4Ov2XwpO/ALiMDCN2t
	D9TJSPp6xXwtf/ToITomTjAr8cVZZh8=
Date: Thu, 14 Jan 2021 19:30:24 +0100
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	kbuild-all@lists.01.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 08/15] x86: add new features for paravirt patching
Message-ID: <20210114183024.GF12284@zn.tnic>
References: <20201217093133.1507-9-jgross@suse.com>
 <202012172021.VSDLPK5D-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202012172021.VSDLPK5D-lkp@intel.com>

On Thu, Dec 17, 2020 at 09:12:57PM +0800, kernel test robot wrote:
>    ld: arch/x86/kernel/alternative.o: in function `paravirt_set_cap':
> >> arch/x86/kernel/alternative.c:605: undefined reference to `pv_is_native_spin_unlock'
> >> ld: arch/x86/kernel/alternative.c:608: undefined reference to `pv_is_native_vcpu_is_preempted'

Looks like alternative.c needs #include <asm/paravirt.h>.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

