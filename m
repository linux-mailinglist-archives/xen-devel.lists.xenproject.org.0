Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D62FB5F8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 13:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70320.126154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1pmf-0000Th-62; Tue, 19 Jan 2021 12:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70320.126154; Tue, 19 Jan 2021 12:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1pmf-0000TI-2V; Tue, 19 Jan 2021 12:06:53 +0000
Received: by outflank-mailman (input) for mailman id 70320;
 Tue, 19 Jan 2021 12:06:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lh40=GW=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1l1pmc-0000TD-S1
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 12:06:51 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26a1d525-130f-4702-afdf-170a6c90ff1e;
 Tue, 19 Jan 2021 12:06:48 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0bca001beaf3e1446171b7.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:ca00:1bea:f3e1:4461:71b7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7DADA1EC05EE;
 Tue, 19 Jan 2021 13:06:47 +0100 (CET)
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
X-Inumbo-ID: 26a1d525-130f-4702-afdf-170a6c90ff1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1611058007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IPXx7ay2V44AgCssSyLw2TWN0kEvnnYpYLyIi2rGm9E=;
	b=VfgYL0z6AhrXAsCdTYExDc3qsl4GrIJx5YeHyG28zEDvLJP5MPmdhBUihH4Hz2uesBl7+f
	HVbxLA6k7FMZqSDIz7TqmfH7jSQai3jOAZ/5wU/hnxP0f2NrqYofRnn9xa0TN8eu0SOPyl
	M5JOobSpu2Jc1F7Iyvq5GvNya9vPZ64=
Date: Tue, 19 Jan 2021 13:06:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 07/15] x86/alternative: support "not feature" and
 ALTERNATIVE_TERNARY
Message-ID: <20210119120647.GJ27433@zn.tnic>
References: <20201217093133.1507-1-jgross@suse.com>
 <20201217093133.1507-8-jgross@suse.com>
 <20210107190819.GI14697@zn.tnic>
 <5ed34a1d-86c4-ed03-4c92-b275a555c41c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ed34a1d-86c4-ed03-4c92-b275a555c41c@suse.com>

On Tue, Jan 19, 2021 at 12:35:42PM +0100, Jürgen Groß wrote:
> In fact this should rather be named "X86_FEATURE_TRUE", as this is its
> semantics.
>
> And I think I can define it to the value 0xffff instead of using a
> "real" bit for it.

A real bit is cheap - a special value to pay attention to in the future
not so much. Also we do have X86_FEATURE_ALWAYS already which has a
similar purpose...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

