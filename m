Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2106A521DF3
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325781.548510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRau-0006i8-F6; Tue, 10 May 2022 15:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325781.548510; Tue, 10 May 2022 15:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRau-0006fh-BF; Tue, 10 May 2022 15:16:12 +0000
Received: by outflank-mailman (input) for mailman id 325781;
 Tue, 10 May 2022 15:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0hsl=VS=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1noRat-0006fb-3P
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:16:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e26c3bb-d074-11ec-a406-831a346695d4;
 Tue, 10 May 2022 17:16:08 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 88D9E21BB4;
 Tue, 10 May 2022 15:16:07 +0000 (UTC)
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2901B2C141;
 Tue, 10 May 2022 15:16:06 +0000 (UTC)
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
X-Inumbo-ID: 1e26c3bb-d074-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652195767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OZqtmv8UjkqRBSiOYZ6ar9KDyJT6hDNxXl9SSULCXTQ=;
	b=fGhdvJlPt//dq0KQAtVijfj/ESEJ/OC2EKpevE2XN9mzQ9A1L9iCAxeXNQ+pUyb1Mv1UlE
	HCruB1nKt1ZaJRQk1txzbCvkQt9XnVOQap2jC6oxObMWliWuUvAfiBCulbtCmC4sio8+xa
	+ZqWsGMsijF1KXpHWJf4ANyjUo2sNOU=
Date: Tue, 10 May 2022 17:16:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
	halves@canonical.com, fabiomirmar@gmail.com,
	alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com,
	arnd@arndb.de, bp@alien8.de, corbet@lwn.net,
	d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
	dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
	mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com,
	jgross@suse.com, john.ogness@linutronix.de, keescook@chromium.org,
	luto@kernel.org, mhiramat@kernel.org, mingo@redhat.com,
	paulmck@kernel.org, peterz@infradead.org, rostedt@goodmis.org,
	senozhatsky@chromium.org, stern@rowland.harvard.edu,
	tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com,
	will@kernel.org
Subject: Re: [PATCH 14/30] panic: Properly identify the panic event to the
 notifiers' callbacks
Message-ID: <YnqBsXBImU64PAOL@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-15-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-15-gpiccoli@igalia.com>

On Wed 2022-04-27 19:49:08, Guilherme G. Piccoli wrote:
> The notifiers infrastructure provides a way to pass an "id" to the
> callbacks to determine what kind of event happened, i.e., what is
> the reason behind they getting called.
> 
> The panic notifier currently pass 0, but this is soon to be
> used in a multi-targeted notifier, so let's pass a meaningful
> "id" over there.
>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  include/linux/panic_notifier.h | 5 +++++
>  kernel/panic.c                 | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> index 41e32483d7a7..07dced83a783 100644
> --- a/include/linux/panic_notifier.h
> +++ b/include/linux/panic_notifier.h
> @@ -9,4 +9,9 @@ extern struct atomic_notifier_head panic_notifier_list;
>  
>  extern bool crash_kexec_post_notifiers;
>  
> +enum panic_notifier_val {
> +	PANIC_UNUSED,
> +	PANIC_NOTIFIER = 0xDEAD,
> +};

Hmm, this looks like a hack. PANIC_UNUSED will never be used.
All notifiers will be always called with PANIC_NOTIFIER.

The @val parameter is normally used when the same notifier_list
is used in different situations.

But you are going to use it when the same notifier is used
in more lists. This is normally distinguished by the @nh
(atomic_notifier_head) parameter.

IMHO, it is a bad idea. First, it would confuse people because
it does not follow the original design of the parameters.
Second, the related code must be touched anyway when
the notifier is moved into another list so it does not
help much.

Or do I miss anything, please?

Best Regards,
Petr

