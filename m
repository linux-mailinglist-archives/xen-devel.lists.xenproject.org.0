Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451B43DB94C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 15:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162559.298078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9SWm-0004Bt-3q; Fri, 30 Jul 2021 13:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162559.298078; Fri, 30 Jul 2021 13:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9SWm-0004A4-0k; Fri, 30 Jul 2021 13:26:16 +0000
Received: by outflank-mailman (input) for mailman id 162559;
 Fri, 30 Jul 2021 13:26:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9SWk-00049y-Ct
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 13:26:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9SWk-0003gs-AI
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 13:26:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9SWk-0001aa-8x
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 13:26:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m9SWh-0006Fs-52; Fri, 30 Jul 2021 14:26:11 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=yuEO8ApPC/0FjI0OG9bYRRW/CLXN2+sYnf5zwTakl2o=; b=jYbgbCY+q6AHp+dLTx6iNy6QN7
	IiXt9yjH7sEqU6QtiFzT5s9WuAW/AuRpKGQkoD+0e6ObWywAKtl645OJrec6GsGWKzpJyOXr1epWl
	MmIr8+9GZusEZI4s34Hjlz0E51+hHaYOqLeKnmltUyKZ7a6sZPtDUNeBfcaFKz7SVYx4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24835.65010.870849.479582@mariner.uk.xensource.com>
Date: Fri, 30 Jul 2021 14:26:10 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    julien@xen.org,
    Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] tools/xenstore: set oom score for xenstore daemon on Linux
In-Reply-To: <20210730122643.2043-2-jgross@suse.com>
References: <20210730122643.2043-1-jgross@suse.com>
	<20210730122643.2043-2-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v3 1/2] tools/xenstore: set oom score for xenstore daemon on Linux"):
> Xenstored is absolutely mandatory for a Xen host and it can't be
> restarted, so being killed by OOM-killer in case of memory shortage is
> to be avoided.
> 
> Set /proc/$pid/oom_score_adj (if available) per default to -500 (this
> translates to 50% of dom0 memory size) in order to allow xenstored to
> use large amounts of memory without being killed.
...
> +## Type: integer
> +## Default: 50
> +#
> +# Percentage of dom0 memory size the xenstore daemon can use before the
> +# OOM killer is allowed to kill it.
> +#XENSTORED_OOM_MEM_THRESHOLD=50
> +
>  ## Type: string
>  ## Default: @LIBEXEC@/boot/xenstore-stubdom.gz

Thanks for working on this.  I approve of the principle.

I have one question about detail:

>  	}
> +	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=50
> +	XS_OOM_SCORE=-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))
> +
> +	rm -f @XEN_RUN_DIR@/xenstored.pid
...
> +	XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
> +	echo $XS_OOM_SCORE >/proc/$XS_PID/oom_score_adj

The effect of all this is that the value specified in
XENSTORED_OOM_MEM_THRESHOLD is transformed before being echoed into
/proc, by being multiplied by -10.

Of course an alternative would be to ask the user to specify the
tuneable directly but given its rather more obscure semantics I think
it is reasonable to have this done by the script.

But maybe we could add something to the doc comment ?

Eg
  # (The specified value is multiplied by -10 and echoed into
  # /proc/PID/oom_score_adj.)

?

Thanks,
Ian.

