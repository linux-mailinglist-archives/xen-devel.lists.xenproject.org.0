Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5F521EA2
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325794.548531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRn2-0000fs-Tm; Tue, 10 May 2022 15:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325794.548531; Tue, 10 May 2022 15:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRn2-0000dG-QV; Tue, 10 May 2022 15:28:44 +0000
Received: by outflank-mailman (input) for mailman id 325794;
 Tue, 10 May 2022 15:28:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0hsl=VS=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1noRn2-0000d6-42
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:28:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e01460ca-d075-11ec-a406-831a346695d4;
 Tue, 10 May 2022 17:28:43 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BDCE21F8C1;
 Tue, 10 May 2022 15:28:42 +0000 (UTC)
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 913582C141;
 Tue, 10 May 2022 15:28:41 +0000 (UTC)
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
X-Inumbo-ID: e01460ca-d075-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652196522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e4wukkdgHyYEEL082h2+8MXPywOa6STdjbSVdRIKUGE=;
	b=rR4mS/+oT4jH07pNjBmARAg7zdRtaoeIif/UACNxEBTH30BjG7Bppc3qvkDfJRoCh4TawW
	6luoRejPAMFZr+z9Kvz9iubCA5AxZw1bIiLsMXPqeMDKaF9ra8TkGI7FOIFKW72kOoldt+
	xkdV40YW6dtF4zTHXKWuKX4kUttIYC0=
Date: Tue, 10 May 2022 17:28:40 +0200
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
	will@kernel.org, Brian Norris <computersforpeace@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 15/30] bus: brcmstb_gisb: Clean-up panic/die notifiers
Message-ID: <YnqEqDnMfUgC4dM6@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-16-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-16-gpiccoli@igalia.com>

On Wed 2022-04-27 19:49:09, Guilherme G. Piccoli wrote:
> This patch improves the panic/die notifiers in this driver by
> making use of a passed "id" instead of comparing pointer
> address; also, it removes an useless prototype declaration
> and unnecessary header inclusion.
> 
> This is part of a panic notifiers refactor - this notifier in
> the future will be moved to a new list, that encompass the
> information notifiers only.
> 
> --- a/drivers/bus/brcmstb_gisb.c
> +++ b/drivers/bus/brcmstb_gisb.c
> @@ -347,25 +346,14 @@ static irqreturn_t brcmstb_gisb_bp_handler(int irq, void *dev_id)
>  /*
>   * Dump out gisb errors on die or panic.
>   */
> -static int dump_gisb_error(struct notifier_block *self, unsigned long v,
> -			   void *p);
> -
> -static struct notifier_block gisb_die_notifier = {
> -	.notifier_call = dump_gisb_error,
> -};
> -
> -static struct notifier_block gisb_panic_notifier = {
> -	.notifier_call = dump_gisb_error,
> -};
> -
>  static int dump_gisb_error(struct notifier_block *self, unsigned long v,
>  			   void *p)
>  {
>  	struct brcmstb_gisb_arb_device *gdev;
> -	const char *reason = "panic";
> +	const char *reason = "die";
>  
> -	if (self == &gisb_die_notifier)
> -		reason = "die";
> +	if (v == PANIC_NOTIFIER)
> +		reason = "panic";

IMHO, the check of the @self parameter was the proper solution.

"gisb_die_notifier" list uses @val from enum die_val.
"gisb_panic_notifier" list uses @val from enum panic_notifier_val.

These are unrelated types. It might easily break when
someone defines the same constant also in enum die_val.

Best Regards,
Petr

