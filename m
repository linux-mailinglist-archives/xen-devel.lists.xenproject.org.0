Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE5279E944
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 15:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601302.937297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPt4-00055J-Iw; Wed, 13 Sep 2023 13:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601302.937297; Wed, 13 Sep 2023 13:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPt4-00053W-Ez; Wed, 13 Sep 2023 13:26:34 +0000
Received: by outflank-mailman (input) for mailman id 601302;
 Wed, 13 Sep 2023 13:26:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EPZ8=E5=goodmis.org=rostedt@kernel.org>)
 id 1qgPt2-00053Q-Qa
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 13:26:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2649cc88-5239-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 15:26:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12B846192D;
 Wed, 13 Sep 2023 13:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFCFC433C7;
 Wed, 13 Sep 2023 13:26:27 +0000 (UTC)
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
X-Inumbo-ID: 2649cc88-5239-11ee-8786-cb3800f73035
Date: Wed, 13 Sep 2023 09:26:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, Ajay Kaher <akaher@vmware.com>, Alexey
 Makhalov <amakhalov@vmware.com>, VMware PV-Drivers Reviewers
 <pv-drivers@vmware.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/3] x86/xen: move paravirt lazy code
Message-ID: <20230913092646.5b087871@gandalf.local.home>
In-Reply-To: <20230913113828.18421-3-jgross@suse.com>
References: <20230913113828.18421-1-jgross@suse.com>
	<20230913113828.18421-3-jgross@suse.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Sep 2023 13:38:27 +0200
Juergen Gross <jgross@suse.com> wrote:

> diff --git a/include/trace/events/xen.h b/include/trace/events/xen.h
> index 44a3f565264d..0577f0cdd231 100644
> --- a/include/trace/events/xen.h
> +++ b/include/trace/events/xen.h
> @@ -6,26 +6,26 @@
>  #define _TRACE_XEN_H
>  
>  #include <linux/tracepoint.h>
> -#include <asm/paravirt_types.h>
> +#include <asm/xen/hypervisor.h>
>  #include <asm/xen/trace_types.h>
>  
>  struct multicall_entry;
>  
>  /* Multicalls */
>  DECLARE_EVENT_CLASS(xen_mc__batch,
> -	    TP_PROTO(enum paravirt_lazy_mode mode),
> +	    TP_PROTO(enum xen_lazy_mode mode),
>  	    TP_ARGS(mode),
>  	    TP_STRUCT__entry(
> -		    __field(enum paravirt_lazy_mode, mode)
> +		    __field(enum xen_lazy_mode, mode)
>  		    ),
>  	    TP_fast_assign(__entry->mode = mode),
>  	    TP_printk("start batch LAZY_%s",
> -		      (__entry->mode == PARAVIRT_LAZY_MMU) ? "MMU" :
> -		      (__entry->mode == PARAVIRT_LAZY_CPU) ? "CPU" : "NONE")
> +		      (__entry->mode == XEN_LAZY_MMU) ? "MMU" :
> +		      (__entry->mode == XEN_LAZY_CPU) ? "CPU" : "NONE")

There's helper functions that make the above easier to implement as well as
exports the symbols so that user space can parse this better:

TRACE_DEFINE_ENUM(XEN_LAZY_NONE);
TRACE_DEFINE_ENUM(XEN_LAZY_MMU);
TRACE_DEFINE_ENUM(XEN_LAZY_CPU);

[..]

  	    TP_printk("start batch LAZY_%s",
		      __print_symbolic(mode,
				       { XEN_LAZY_NONE, "NONE" },
				       { XEN_LAZY_MMU,  "MMU   },
				       { XEN_LAZY_CPU,  "CPU"  }))

Then user space parsers that read the raw data can convert these events
into something humans can read.

-- Steve

>  	);
>  #define DEFINE_XEN_MC_BATCH(name)			\
>  	DEFINE_EVENT(xen_mc__batch, name,		\
> -		TP_PROTO(enum paravirt_lazy_mode mode),	\
> +		TP_PROTO(enum xen_lazy_mode mode),	\
>  		     TP_ARGS(mode))
>  
>  DEFINE_XEN_MC_BATCH(xen_mc_batch);

