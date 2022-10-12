Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE525FC8C0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 17:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421285.666516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oie3T-0000d5-LM; Wed, 12 Oct 2022 15:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421285.666516; Wed, 12 Oct 2022 15:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oie3T-0000bD-IL; Wed, 12 Oct 2022 15:53:59 +0000
Received: by outflank-mailman (input) for mailman id 421285;
 Wed, 12 Oct 2022 15:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ub8z=2N=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oie3I-0000b4-85
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 15:53:58 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0db92d63-4a46-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 17:53:46 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e705329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e705:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 124591EC0725;
 Wed, 12 Oct 2022 17:53:41 +0200 (CEST)
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
X-Inumbo-ID: 0db92d63-4a46-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1665590021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n37CuGT72/BdjSCMX/SbC87AZ3K1N+NFaoL8bgbkin4=;
	b=nYK7i3NzdisKMQUmD20WD6kGnXBpnm+PARQn5OMi7eRiexD52OcFK/VHEWa8AAZnhtuEiE
	YFqI1WM7Rhb2wTxZkw8tC9l8+WEokLWEvabMA2JVIdzJv91y9b5zoG8/vjbSrZ1Gwf2pu6
	RXRQepIIFkz4H9wTBqQfxKMvc2/0dvk=
Date: Wed, 12 Oct 2022 17:53:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, luto@amacapital.net, dave.hansen@linux.intel.com,
	kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86: Check return values from early_memremap calls
Message-ID: <Y0bjBP6/Eyg8B25k@zn.tnic>
References: <1650035401-22855-1-git-send-email-ross.philipson@oracle.com>
 <1650035401-22855-2-git-send-email-ross.philipson@oracle.com>
 <Y0GTUg1ACpKZYMHY@nazgul.tnic>
 <201850b3-5126-cd79-637f-79f198dd409d@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201850b3-5126-cd79-637f-79f198dd409d@oracle.com>

On Wed, Oct 12, 2022 at 11:13:20AM -0400, Ross Philipson wrote:
> I am already using the pr_* macros in the patches. Are you asking me to do
> something

Yes. You do

pr_X("prefix_string: msg"

while you should set the prefix string and do

pr_X("msg".

As said, grep the tree for examples where pr_fmt() is set.
arch/x86/kernel/cpu/bugs.c is a good example.

> When I was working on the patches I asked Andrew Cooper at Citrix what
> action I should take if any of the calls in the Xen code failed. I
> believe he told me it was basically fatal and that panic() would be
> fine there.

Yes, that should be confirmed by people who know the code and you should
mention in the commit message at least that panicking is the only viable
thing to do in the respective case. If, as Jürgen says, it is actually
better to panic() in those cases, especially if it otherwise would make
debugging harder, then sure, by all means.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

