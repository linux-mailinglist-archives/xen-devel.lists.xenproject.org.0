Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23E2F69C3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 19:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67476.120479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07Xm-0001gQ-He; Thu, 14 Jan 2021 18:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67476.120479; Thu, 14 Jan 2021 18:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07Xm-0001g1-EQ; Thu, 14 Jan 2021 18:40:26 +0000
Received: by outflank-mailman (input) for mailman id 67476;
 Thu, 14 Jan 2021 18:40:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI/j=GR=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1l07Xk-0001fw-SY
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 18:40:24 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7409bdaa-3d1e-400a-90ed-2463393de392;
 Thu, 14 Jan 2021 18:40:22 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1aa900e8e9bea65a049b95.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f1a:a900:e8e9:bea6:5a04:9b95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B5AAB1EC026D;
 Thu, 14 Jan 2021 19:40:21 +0100 (CET)
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
X-Inumbo-ID: 7409bdaa-3d1e-400a-90ed-2463393de392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1610649621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2/CB4ABPbBP1pW0IHsNbg4sOTm1wt6DrSPmMYPRbnU=;
	b=n0DECMJBD+hRD5D+iJkaXzpobjvEpELqD0R/Fz0hEUw8JJh9zA2jL0CgOSJX/ORDYzl91p
	9AXA5RNhHacP4LLsbnYYjiwDc+fVe8HmSOJiaAztxeCiAfb3JsfcsV5PvAdpc0ztuyQb+C
	IxHDnh6e6d/SVResNuJ0O4cx+Eo3tQg=
Date: Thu, 14 Jan 2021 19:40:21 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: kernel test robot <lkp@intel.com>, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	kbuild-all@lists.01.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 08/15] x86: add new features for paravirt patching
Message-ID: <20210114184021.GG12284@zn.tnic>
References: <20201217093133.1507-9-jgross@suse.com>
 <202012172021.VSDLPK5D-lkp@intel.com>
 <20210114183024.GF12284@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114183024.GF12284@zn.tnic>

On Thu, Jan 14, 2021 at 07:30:24PM +0100, Borislav Petkov wrote:
> On Thu, Dec 17, 2020 at 09:12:57PM +0800, kernel test robot wrote:
> >    ld: arch/x86/kernel/alternative.o: in function `paravirt_set_cap':
> > >> arch/x86/kernel/alternative.c:605: undefined reference to `pv_is_native_spin_unlock'
> > >> ld: arch/x86/kernel/alternative.c:608: undefined reference to `pv_is_native_vcpu_is_preempted'
> 
> Looks like alternative.c needs #include <asm/paravirt.h>.

Nah, that needs paravirt_set_cap() to be inside
CONFIG_PARAVIRT_SPINLOCKS-enabled ifdeffery.

Jürgen, why don't you move it to arch/x86/kernel/paravirt.c? That
should keep the ifdeffery low.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

