Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ADD637D0E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 16:36:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447983.704695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyEFv-0002Pr-Iq; Thu, 24 Nov 2022 15:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447983.704695; Thu, 24 Nov 2022 15:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyEFv-0002NN-FX; Thu, 24 Nov 2022 15:35:15 +0000
Received: by outflank-mailman (input) for mailman id 447983;
 Thu, 24 Nov 2022 15:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/mcz=3Y=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oyEFu-0002NH-Ij
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 15:35:14 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95ae97d0-6c0d-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 16:35:13 +0100 (CET)
Received: from zn.tnic (p200300ea9733e75b329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e75b:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8157A1EC0495;
 Thu, 24 Nov 2022 16:35:11 +0100 (CET)
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
X-Inumbo-ID: 95ae97d0-6c0d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1669304111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=uMdYplkUhfbHCUEJKpVOLbcUaHxlg1ZFtwfDCnP26Bg=;
	b=WIgJDIo+92EfSC2B053Gj/BryQ7+Y+NS138sgK/+xOVLE8AHeSHvMJvtcHBo1QIMUG6/xL
	kkKiZ2CObE7ZikcuycW7R3451oknrVPhB8NnY9vrnxKus9T15Bcxd01BfrN94x4zMdgLqF
	+BGpYYVLkK6KtrFXUA4+tmgrj88uFhM=
Date: Thu, 24 Nov 2022 16:35:07 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/boot: skip realmode init code when running as Xen
 PV guest
Message-ID: <Y3+PK23tdXIMtuSE@zn.tnic>
References: <20221123114523.3467-1-jgross@suse.com>
 <Y39xcnKCkbYQZjaE@zn.tnic>
 <a1fc1d88-2112-2b81-52bc-cbfb6736edf0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a1fc1d88-2112-2b81-52bc-cbfb6736edf0@suse.com>

On Thu, Nov 24, 2022 at 02:30:39PM +0100, Juergen Gross wrote:
> Looking at the date when 084ee1c641a0 went in I don't think it _needs_
> to go in now, but I wouldn't complain ...

So if you don't have a particular and specific reason, I won't queue it
for stable at all.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

