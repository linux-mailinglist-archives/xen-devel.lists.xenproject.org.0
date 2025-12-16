Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63027CC356D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 14:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187947.1509241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVVQI-0000sy-EV; Tue, 16 Dec 2025 13:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187947.1509241; Tue, 16 Dec 2025 13:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVVQI-0000qs-BI; Tue, 16 Dec 2025 13:49:06 +0000
Received: by outflank-mailman (input) for mailman id 1187947;
 Tue, 16 Dec 2025 13:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vxAe=6W=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1vVVQG-0000qm-UQ
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 13:49:04 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa351610-da85-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 14:49:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6B2DA41674;
 Tue, 16 Dec 2025 13:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A5DC4CEF1;
 Tue, 16 Dec 2025 13:48:55 +0000 (UTC)
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
X-Inumbo-ID: fa351610-da85-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765892940;
	bh=ENgGIlHWOI7j9oryiinlH9PuwlxwZFPAtyFI4Y4Ygjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/6CcZAuqci8q2SjaET3oYExJ5pIDzG6Bkyn9xx/jiXVDV8WBhO9pvXiR2VCyDMlJ
	 emucJpSeQwx5SJHGvWj3ddQOJu5Q4IUGGhmBK9Xrw1iQcs8BQyTsJzY68+xLDGPcWo
	 UTPttdG/15a2H1fpDb9ly8akJ+ncJkijB6d7fIUQVqxM+VX8iQsipyINC7FjrtdVkT
	 XoSSMnlcrtxgAcTz7t6uMJkcSKzInRgepKxiXP3eNJ01tvTMFIUz0rpXxYZA81e/BT
	 4cqROLpKbIdz4FufnE1FjO7Eylum1Ia/Gu4gURVn1g9V+Rm/7wjKcGGF2eD/Blqsph
	 Tz7xB1aE1TW3g==
Date: Tue, 16 Dec 2025 14:48:52 +0100
From: Ingo Molnar <mingo@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Denis Efremov <efremov@linux.com>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 0/5] x86: Cleanups around slow_down_io()
Message-ID: <aUFjRDqbfWMsXvvS@gmail.com>
References: <20251126162018.5676-1-jgross@suse.com>
 <aT5vtaefuHwLVsqy@gmail.com>
 <bff8626d-161e-4470-9cbd-7bbda6852ec3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bff8626d-161e-4470-9cbd-7bbda6852ec3@suse.com>


* Jürgen Groß <jgross@suse.com> wrote:

> > CPUs anymore. Should it cause any regressions, it's easy to bisect to.
> > There's been enough changes around all these facilities that the
> > original timings are probably way off already, so we've just been
> > cargo-cult porting these to newer kernels essentially.
>
> Fine with me.
>
> Which path to removal of io_delay would you (and others) prefer?
>
> 1. Ripping it out immediately.

I'd just rip it out immediately, and see who complains. :-)

Whatever side effects it still may have, I very strongly doubt it has
anything to do with the original purpose of IO delays...

> In cases 2-4 I'd still like to have patch 1 of my series applied, as it will
> make paravirt rework easier.

Sure.

Thanks,

	Ingo


