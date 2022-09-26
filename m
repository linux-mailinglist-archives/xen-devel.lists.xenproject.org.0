Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F95EB2E7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 23:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412099.655273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocvO9-0003hc-J4; Mon, 26 Sep 2022 21:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412099.655273; Mon, 26 Sep 2022 21:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocvO9-0003e9-GW; Mon, 26 Sep 2022 21:11:41 +0000
Received: by outflank-mailman (input) for mailman id 412099;
 Mon, 26 Sep 2022 21:11:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZcVL=Z5=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1ocvO8-0003e3-08
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 21:11:40 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd29504a-3ddf-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 23:11:38 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e74d329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e74d:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 15B201EC026E;
 Mon, 26 Sep 2022 23:11:30 +0200 (CEST)
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
X-Inumbo-ID: cd29504a-3ddf-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1664226690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=O4LMN3S2OFxEuL98rqNj8vUSOAZXBDFs/bg9a/ub9fA=;
	b=o4RF8pFNgH5nnML9hM8RFzrcIG5JMloUgd20rtKM9fXBuE6dF57S+p/C5y9y7J0qRj2c0j
	v1FwO+5n9Q0EBALFCLkpQ9Teoaw84m5E/UWZ3O05GZUkTYo4HfOi856UZIqW5aX54olvan
	TCm5vkNRC8OUBdzCAR0eJ21WpIqdra4=
Date: Mon, 26 Sep 2022 23:11:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 08/10] x86/mtrr: let cache_aps_delayed_init replace
 mtrr_aps_delayed_init
Message-ID: <YzIVfj/lvzQrK15Y@zn.tnic>
References: <20220908084914.21703-1-jgross@suse.com>
 <20220908084914.21703-9-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908084914.21703-9-jgross@suse.com>

On Thu, Sep 08, 2022 at 10:49:12AM +0200, Juergen Gross wrote:
> -void set_mtrr_aps_delayed_init(void)
> -{
> -	if (!cache_generic)
> -		return;
> -
> -	mtrr_aps_delayed_init = true;
> -}
> -

Except that you've removed the accessors and made that bool global.
Which is less pretty than it was before...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

