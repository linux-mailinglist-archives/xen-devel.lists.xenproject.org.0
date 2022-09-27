Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD75EC234
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 14:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412548.655915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od9TG-0000vH-Nc; Tue, 27 Sep 2022 12:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412548.655915; Tue, 27 Sep 2022 12:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od9TG-0000sZ-L1; Tue, 27 Sep 2022 12:13:54 +0000
Received: by outflank-mailman (input) for mailman id 412548;
 Tue, 27 Sep 2022 12:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IkIR=Z6=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1od9TF-0000sT-Lo
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 12:13:53 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9119d62-3e5d-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 14:13:52 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e757329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e757:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E2EF31EC059D;
 Tue, 27 Sep 2022 14:13:46 +0200 (CEST)
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
X-Inumbo-ID: d9119d62-3e5d-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1664280827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=Ah2YylUqJ6ePHReTwtNwsklHRpA9yYcUn3VnDUrl9G8=;
	b=faXXp2C2YqbilpcwkRScIXZgbOjDpTReMjQkNlUZfceUKISvMlNsTGBbvNetCJw93XSF6c
	l3A/svhkj02teNBCzB10lRJuCpR/yiPAb9ZOyj5I8lDCRy1pDbcoT7AqAffW62FOzejYjF
	I81SOtQYZk4iBObhVgbTldjiWT88jBM=
Date: Tue, 27 Sep 2022 14:13:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 08/10] x86/mtrr: let cache_aps_delayed_init replace
 mtrr_aps_delayed_init
Message-ID: <YzLo9IFDYW1T8BVZ@zn.tnic>
References: <20220908084914.21703-1-jgross@suse.com>
 <20220908084914.21703-9-jgross@suse.com>
 <YzIVfj/lvzQrK15Y@zn.tnic>
 <ce8cb1d3-a7d2-7484-26eb-60d3e29fa369@suse.com>
 <YzLMKk4OK9FtjjKQ@zn.tnic>
 <c0872933-e046-0c5e-b63f-861d2d343794@suse.com>
 <YzLcSOS6ZLIoPwBl@zn.tnic>
 <d3cd5c50-24e7-ffba-de2d-cf00400f6e38@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d3cd5c50-24e7-ffba-de2d-cf00400f6e38@suse.com>

On Tue, Sep 27, 2022 at 01:25:47PM +0200, Juergen Gross wrote:
> You mean by replacing it with "(system_state != SYSTEM_RUNNING)" ?

Right, or maybe even something more elegant. I've been meaning to ask
tglx about it as I needed it for the microcode loader too.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

