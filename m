Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A09798111
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 05:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597751.932088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeSeF-0007eI-B6; Fri, 08 Sep 2023 03:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597751.932088; Fri, 08 Sep 2023 03:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeSeF-0007cs-7p; Fri, 08 Sep 2023 03:59:11 +0000
Received: by outflank-mailman (input) for mailman id 597751;
 Fri, 08 Sep 2023 03:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b+95=EY=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1qeSeD-0007cm-EW
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 03:59:09 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ec204cf-4dfc-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 05:59:07 +0200 (CEST)
Received: from nazgul.tnic (unknown [93.123.97.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 33ECC1EC0645;
 Fri,  8 Sep 2023 05:59:06 +0200 (CEST)
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
X-Inumbo-ID: 0ec204cf-4dfc-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1694145546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=TguoLw/M+pg5pof3m7M+GZki4L6QFruFleEnIMG45oc=;
	b=bQ3kHLjkA3IUe4Dp1awZwI3rjciES9TcnBC66CMvRUmAImo+cb+2bNVZLI3dCEh0qZpvfz
	c7e0LeG0boRzRoKOsTo6egC0n9JGdug1i9KJisqtsEXFFQps2NGXfXye5GCLXWbpSB1tYD
	UnFMbkfLN3+hNmI2FUGR5XaKv0YHgjs=
Date: Fri, 8 Sep 2023 05:59:11 +0200
From: Borislav Petkov <bp@alien8.de>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: smita.koralahallichannabasappa@amd.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, rric@kernel.org,
	james.morse@arm.com, tony.luck@intel.com, yazen.ghannam@amd.com
Subject: Re: [PATCH] Revert "EDAC/mce_amd: Do not load edac_mce_amd module on
 guests"
Message-ID: <20230908035911.GAZPqcD/EjfKZ0ISrZ@fat_crate.local>
References: <20210628172740.245689-1-Smita.KoralahalliChannabasappa@amd.com>
 <ZPqQEHXgmak1LMNh@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZPqQEHXgmak1LMNh@mattapan.m5p.com>

On Thu, Sep 07, 2023 at 08:08:00PM -0700, Elliott Mitchell wrote:
> This reverts commit 767f4b620edadac579c9b8b6660761d4285fa6f9.
> 
> There are at least 3 valid reasons why a VM may see MCE events/registers.

Hmm, so they all read like a bunch of handwaving to me, with those
probable hypothetical "may" formulations.

How about we cut to the chase and you explain what exactly is the
concrete issue you're encountering and trying to solve?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

