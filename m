Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8514567BF7E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 23:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484606.751262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKnpx-0008Ja-4w; Wed, 25 Jan 2023 22:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484606.751262; Wed, 25 Jan 2023 22:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKnpx-0008Hh-1Z; Wed, 25 Jan 2023 22:01:45 +0000
Received: by outflank-mailman (input) for mailman id 484606;
 Wed, 25 Jan 2023 22:01:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a83O=5W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKnpv-0008Hb-RX
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 22:01:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d959978d-9cfb-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 23:01:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3546E616C2;
 Wed, 25 Jan 2023 22:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BA5C433D2;
 Wed, 25 Jan 2023 22:01:39 +0000 (UTC)
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
X-Inumbo-ID: d959978d-9cfb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674684100;
	bh=Z8Z+kV8zvQPaDPI2dAWyQXmqy22O8fHjplm46zAzBBY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OYQzzHlz6UEq1bihNNY79A4KseLIpdDOw/8yuhwDfoTgoIXbNoc3QyW7p2oBAb1+M
	 qRudygQYHXR53MBv6o1G3v+dvCtawgUbMWEnpdmbxPMrb1zw4ZupEF/ccb/tVFxsEw
	 4NHjdO9XomyyAI2mvFE5B0vBB+M5+p2vVgDAebSG6QZlSbv3dvvNDLE53BkxlopI+0
	 5fJpAn5wHvkHRPAnoX3Y1baotdFFzGL8rpmtAcwLn1TJZ+eX0Xh1Md+RbDyDMUiIMh
	 oBrh+OlWxWJzlciHoZkcpV4qWGl2K6Q5/SpnuooGPhp6Bjxg1Byax5dYcHY+USt+Xo
	 em3rWPl+NqwIg==
Date: Wed, 25 Jan 2023 14:01:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
    stefano.stabellini@amd.com, alex.bennee@linaro.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [QEMU][PATCH v4 06/10] hw/xen/xen-hvm-common: skip ioreq creation
 on ioreq registration failure
In-Reply-To: <20230125085407.7144-7-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301251400500.1978264@ubuntu-linux-20-04-desktop>
References: <20230125085407.7144-1-vikram.garhwal@amd.com> <20230125085407.7144-7-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jan 2023, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails continue
> to the PV backends initialization.
> 
> Also, moved the IOREQ registration and mapping subroutine to new function
> xen_do_ioreq_register().
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

as per my previous reply, even though I am listed as co-author, for
tracking that I did review this version of the patch:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-hvm-common.c | 53 ++++++++++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index e748d8d423..94dbbe97ed 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -777,25 +777,12 @@ err:
>      exit(1);
>  }
>  
> -void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> -                        MemoryListener xen_memory_listener)
> +static void xen_do_ioreq_register(XenIOState *state,
> +                                           unsigned int max_cpus,
> +                                           MemoryListener xen_memory_listener)
>  {
>      int i, rc;
>  
> -    state->xce_handle = xenevtchn_open(NULL, 0);
> -    if (state->xce_handle == NULL) {
> -        perror("xen: event channel open");
> -        goto err;
> -    }
> -
> -    state->xenstore = xs_daemon_open();
> -    if (state->xenstore == NULL) {
> -        perror("xen: xenstore open");
> -        goto err;
> -    }
> -
> -    xen_create_ioreq_server(xen_domid, &state->ioservid);
> -
>      state->exit.notify = xen_exit_notifier;
>      qemu_add_exit_notifier(&state->exit);
>  
> @@ -859,12 +846,44 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
>      QLIST_INIT(&state->dev_list);
>      device_listener_register(&state->device_listener);
>  
> +    return;
> +
> +err:
> +    error_report("xen hardware virtual machine initialisation failed");
> +    exit(1);
> +}
> +
> +void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> +                        MemoryListener xen_memory_listener)
> +{
> +    int rc;
> +
> +    state->xce_handle = xenevtchn_open(NULL, 0);
> +    if (state->xce_handle == NULL) {
> +        perror("xen: event channel open");
> +        goto err;
> +    }
> +
> +    state->xenstore = xs_daemon_open();
> +    if (state->xenstore == NULL) {
> +        perror("xen: xenstore open");
> +        goto err;
> +    }
> +
> +    rc = xen_create_ioreq_server(xen_domid, &state->ioservid);
> +    if (!rc) {
> +        xen_do_ioreq_register(state, max_cpus, xen_memory_listener);
> +    } else {
> +        warn_report("xen: failed to create ioreq server");
> +    }
> +
>      xen_bus_init();
>  
>      xen_register_backend(state);
>  
>      return;
> +
>  err:
> -    error_report("xen hardware virtual machine initialisation failed");
> +    error_report("xen hardware virtual machine backend registration failed");
>      exit(1);
>  }
> -- 
> 2.17.0
> 
> 

