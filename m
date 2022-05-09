Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD60951FF52
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 16:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324600.546724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no49f-0003YF-VU; Mon, 09 May 2022 14:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324600.546724; Mon, 09 May 2022 14:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no49f-0003Vq-Ry; Mon, 09 May 2022 14:14:31 +0000
Received: by outflank-mailman (input) for mailman id 324600;
 Mon, 09 May 2022 14:14:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11C1=VR=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1no49d-0003Vk-Qn
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 14:14:30 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55351a32-cfa2-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 16:14:27 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1no48z-000Acu-NN; Mon, 09 May 2022 16:13:50 +0200
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
X-Inumbo-ID: 55351a32-cfa2-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=21Vuf08H7s2roER44d4b0UgJl5trrJFyPVjW1sFjFZE=; b=ruDiqyoExl2jG8ttjj8Kva7F0Z
	0gmy1ZjUnSZw1kESJcz3XDyEnMdDBnsUYP/IGGe7AdFcEsabz8oUBo80VtrFGlI8cQnzWF9UlpBBK
	4aFG0PgEAjxrGpxgz2rOXDVYxrjQeGb+FiM0Mo8j9WOU5B7iKslK22FH7g8xu7/o+vhoBdIcLeTVq
	TXR8EZtHjX3vb/+hbwrFc/UcTSPrqLuaLvGSeO7jUEfo1fKsk4NXM02lMULpMgFIGTd5/R8izOFMK
	smJXU8ctgfXKSVE5XSrKVK5cDdrQAjusLpX81WYReyDmurYDvxkw6DQoXAKa1dqFr5Ui2vHbk0ezv
	WsObUf8Q==;
Message-ID: <f6def662-5742-b3a8-544f-bf15c636d83d@igalia.com>
Date: Mon, 9 May 2022 11:13:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 10/30] alpha: Clean-up the panic notifier code
Content-Language: en-US
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, rth@gcc.gnu.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, bhe@redhat.com, kexec@lists.infradead.org,
 linux-edac@vger.kernel.org, pmladek@suse.com, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
 fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
 dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
 peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
 vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-11-gpiccoli@igalia.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220427224924.592546-11-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> The alpha panic notifier has some code issues, not following
> the conventions of other notifiers. Also, it might halt the
> machine but still it is set to run as early as possible, which
> doesn't seem to be a good idea.
> 
> This patch cleans the code, and set the notifier to run as the
> latest, following the same approach other architectures are doing.
> Also, we remove the unnecessary include of a header already
> included indirectly.
> 
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  arch/alpha/kernel/setup.c | 36 +++++++++++++++---------------------
>  1 file changed, 15 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
> index b4fbbba30aa2..d88bdf852753 100644
> --- a/arch/alpha/kernel/setup.c
> +++ b/arch/alpha/kernel/setup.c
> @@ -41,19 +41,11 @@
>  #include <linux/sysrq.h>
>  #include <linux/reboot.h>
>  #endif
> -#include <linux/notifier.h>
>  #include <asm/setup.h>
>  #include <asm/io.h>
>  #include <linux/log2.h>
>  #include <linux/export.h>
>  
> -static int alpha_panic_event(struct notifier_block *, unsigned long, void *);
> -static struct notifier_block alpha_panic_block = {
> -	alpha_panic_event,
> -        NULL,
> -        INT_MAX /* try to do it first */
> -};
> -
>  #include <linux/uaccess.h>
>  #include <asm/hwrpb.h>
>  #include <asm/dma.h>
> @@ -435,6 +427,21 @@ static const struct sysrq_key_op srm_sysrq_reboot_op = {
>  };
>  #endif
>  
> +static int alpha_panic_event(struct notifier_block *this,
> +			     unsigned long event, void *ptr)
> +{
> +	/* If we are using SRM and serial console, just hard halt here. */
> +	if (alpha_using_srm && srmcons_output)
> +		__halt();
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block alpha_panic_block = {
> +	.notifier_call = alpha_panic_event,
> +	.priority = INT_MIN, /* may not return, do it last */
> +};
> +
>  void __init
>  setup_arch(char **cmdline_p)
>  {
> @@ -1427,19 +1434,6 @@ const struct seq_operations cpuinfo_op = {
>  	.show	= show_cpuinfo,
>  };
>  
> -
> -static int
> -alpha_panic_event(struct notifier_block *this, unsigned long event, void *ptr)
> -{
> -#if 1
> -	/* FIXME FIXME FIXME */
> -	/* If we are using SRM and serial console, just hard halt here. */
> -	if (alpha_using_srm && srmcons_output)
> -		__halt();
> -#endif
> -        return NOTIFY_DONE;
> -}
> -
>  static __init int add_pcspkr(void)
>  {
>  	struct platform_device *pd;


Hi folks, I'm updating Richard's email and re-sending the V1, any
reviews are greatly appreciated!

Cheers,


Guilherme

