Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE9F432A56
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 01:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212569.370465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcc0g-00041f-Pt; Mon, 18 Oct 2021 23:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212569.370465; Mon, 18 Oct 2021 23:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcc0g-0003zs-M6; Mon, 18 Oct 2021 23:25:38 +0000
Received: by outflank-mailman (input) for mailman id 212569;
 Mon, 18 Oct 2021 23:25:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/eG=PG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mcc0f-0003zm-6c
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 23:25:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2121ca2-306a-11ec-82ec-12813bfff9fa;
 Mon, 18 Oct 2021 23:25:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 191C460F9D;
 Mon, 18 Oct 2021 23:25:35 +0000 (UTC)
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
X-Inumbo-ID: b2121ca2-306a-11ec-82ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634599535;
	bh=hFE2XMKZEEaE0AdOIMQvOnc3ShElY8i3tLDTQ1Yuopg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k/Rrfxg3zYqRhHlyTdVxFNYK/s52dV93ICn1Ee9k50KveyLLbbujLkYaZn89CTlbL
	 AZivkgG9KhdmMhYusuHMP5fQlwS5jiWoTJue/uZTTLxRE8y7G93PEmv5XU+VXKOdWD
	 ZHsPSlGiSX+jGaO7WNUB+g3YMm2TvVYNcs2J0vL+qcCSpCahohUtdICyttJak5NZbo
	 CRXfJwe/HTsOUNy5LylWt9L2CrJzAR6gkIFf7pRyh7+TLwwU0i8e8gH54+MUdELdaU
	 B7mmPWNDKVh8haGxbyowjfwFfWrSYe3JC+5uFx3iGBzb91MJqmmG+Jm/Enh6coXTb+
	 rslSQl76X2VlQ==
Date: Mon, 18 Oct 2021 16:25:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
In-Reply-To: <20211012134148.6280-2-jgross@suse.com>
Message-ID: <alpine.DEB.2.21.2110181616400.21467@sstabellini-ThinkPad-T480s>
References: <20211012134148.6280-1-jgross@suse.com> <20211012134148.6280-2-jgross@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Juergen, Ian,

This patch broke gitlab-ci:

https://gitlab.com/xen-project/xen/-/jobs/1690080806

---
 * Executing: /lib/rc/sh/openrc-run.sh /lib/rc/sh/openrc-run.sh /etc/init.d/local start
 * Starting local ... *   Executing "/etc/local.d/xen.start" .../etc/xen/scripts/launch-xenstore: line 64: * 10: syntax error: operand expected (error token is "* 10")

illegal value daemon for XENSTORETYPE
---

See below about what the issue is and a potential fix.


On Tue, 12 Oct 2021, Juergen Gross wrote:
> Xenstored is absolutely mandatory for a Xen host and it can't be
> restarted, so being killed by OOM-killer in case of memory shortage is
> to be avoided.
> 
> Set /proc/$pid/oom_score_adj (if available) per default to -500 (this
> translates to 50% of dom0 memory size) in order to allow xenstored to
> use large amounts of memory without being killed.
> 
> The percentage of dom0 memory above which the oom killer is allowed to
> kill xenstored can be set via XENSTORED_OOM_MEM_THRESHOLD in
> xencommons.
> 
> Make sure the pid file isn't a left-over from a previous run delete it
> before starting xenstored.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Ian Jackson <iwj@xenproject.org>
> ---
> V2:
> - set oom score from launch script (Julien Grall)
> - split off open file descriptor limit setting (Julien Grall)
> V3:
> - make oom killer threshold configurable (Julien Grall)
> V4:
> - extend comment (Ian Jackson)
> ---
>  tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 9 +++++++++
>  tools/hotplug/Linux/launch-xenstore.in             | 6 ++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
> index 00cf7f91d4..b83101ab7e 100644
> --- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
> +++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
> @@ -48,6 +48,15 @@ XENSTORED_ARGS=
>  # Only evaluated if XENSTORETYPE is "daemon".
>  #XENSTORED_TRACE=[yes|on|1]
>  
> +## Type: integer
> +## Default: 50
> +#
> +# Percentage of dom0 memory size the xenstore daemon can use before the
> +# OOM killer is allowed to kill it.
> +# The specified value is multiplied by -10 and echoed to
> +# /proc/PID/oom_score_adj.
> +#XENSTORED_OOM_MEM_THRESHOLD=50
> +
>  ## Type: string
>  ## Default: @LIBEXEC@/boot/xenstore-stubdom.gz
>  #
> diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
> index 019f9d6f4d..1747c96065 100644
> --- a/tools/hotplug/Linux/launch-xenstore.in
> +++ b/tools/hotplug/Linux/launch-xenstore.in
> @@ -59,11 +59,17 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
>  		echo "No xenstored found"
>  		exit 1
>  	}
> +	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=50
> +	XS_OOM_SCORE=-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))

These are the problematic lines. They don't work with busybox's bash
implementation. Originally I thought it was an issue with busybox bash
implementation but it looks like they don't even work with normal bash.
Specifically the first line is an issue, it should be:

if [ -z "$XENSTORED_OOM_MEM_THRESHOLD" ]
then
    XENSTORED_OOM_MEM_THRESHOLD=50
fi

Right?

