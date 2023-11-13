Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543237EA60E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632053.985975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fNX-0007LM-Uv; Mon, 13 Nov 2023 22:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632053.985975; Mon, 13 Nov 2023 22:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fNX-0007I1-Rl; Mon, 13 Nov 2023 22:25:59 +0000
Received: by outflank-mailman (input) for mailman id 632053;
 Mon, 13 Nov 2023 22:25:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r2fNW-0007Hq-6s
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:25:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2fNV-0003FS-HE; Mon, 13 Nov 2023 22:25:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2fNV-0003kN-C8; Mon, 13 Nov 2023 22:25:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vvZ2viGteRV69glW4T1aaXk0RXANUFvIhGRydt855kw=; b=fUCGn1HLcWib1k0o3M7pnN/7dx
	3lOjysWp4sSAo5Z8wmQdBjNggy1b4HsxoP3wnWoe2CikSlYna/KvGo3znPir+JKbu89euaarDSfiF
	PnTrWvF1fuPot1Ur++dHAqXbHZ+laFpzXCSIyNEPWSUrr9U75rmc82bVaGiQj4HU44Eg=;
Message-ID: <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
Date: Mon, 13 Nov 2023 22:25:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename
 handling
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-28-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231110160804.29021-28-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/11/2023 16:08, Juergen Gross wrote:
> Add some helpers for handling filenames which might need different
> implementations between stubdom and daemon environments:
> 
> - expansion of relative filenames (those are not really defined today,
>    just expand them to be relative to /var/lib/xen/xenstore)
> - expansion of xenstore_daemon_rundir() (used e.g. for saving the state
>    file in case of live update - needs to be unchanged in the daemon
>    case, but should result in /var/lib/xen/xenstore for stubdom)
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>   tools/xenstored/core.c      | 9 ++++++++-
>   tools/xenstored/core.h      | 3 +++
>   tools/xenstored/lu_daemon.c | 4 ++--
>   tools/xenstored/minios.c    | 5 +++++
>   tools/xenstored/posix.c     | 5 +++++
>   5 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index 4a9d874f17..77befd24c9 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -158,6 +158,13 @@ void trace_destroy(const void *data, const char *type)
>   		trace("obj: DESTROY %s %p\n", type, data);
>   }
>   
> +char *absolute_filename(const void *ctx, const char *filename)

Can the return be const?

> +{
> +	if (filename[0] != '/')
> +		return talloc_asprintf(ctx, XENSTORE_LIB_DIR "/%s", filename);

Looking at the rest of patch, you will be using xenstore_rundir(). I 
wonder whether it would not be better to switch to xenstore_rundir() so...

> +	return talloc_strdup(ctx, filename);
> +}
> +
>   /**
>    * Signal handler for SIGHUP, which requests that the trace log is reopened
>    * (in the main loop).  A single byte is written to reopen_log_pipe, to awaken
> @@ -2983,7 +2990,7 @@ int main(int argc, char *argv[])
>   
>   	signal(SIGHUP, trigger_reopen_log);
>   	if (tracefile)
> -		tracefile = talloc_strdup(NULL, tracefile);
> +		tracefile = absolute_filename(NULL, tracefile);
>   
>   #ifndef NO_LIVE_UPDATE
>   	/* Read state in case of live update. */
> diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
> index a0d3592961..51e1dddb22 100644
> --- a/tools/xenstored/core.h
> +++ b/tools/xenstored/core.h
> @@ -393,6 +393,9 @@ void early_init(void);
>   void mount_9pfs(void);
>   #endif
>   
> +const char *xenstore_rundir(void);
> +char *absolute_filename(const void *ctx, const char *filename);
> +
>   /* Write out the pidfile */
>   void write_pidfile(const char *pidfile);
>   
> diff --git a/tools/xenstored/lu_daemon.c b/tools/xenstored/lu_daemon.c
> index 71bcabadd3..6351111ab0 100644
> --- a/tools/xenstored/lu_daemon.c
> +++ b/tools/xenstored/lu_daemon.c
> @@ -24,7 +24,7 @@ void lu_get_dump_state(struct lu_dump_state *state)
>   	state->size = 0;
>   
>   	state->filename = talloc_asprintf(NULL, "%s/state_dump",
> -					  xenstore_daemon_rundir());
> +					  xenstore_rundir());

... call and ...

>   	if (!state->filename)
>   		barf("Allocation failure");
>   
> @@ -65,7 +65,7 @@ FILE *lu_dump_open(const void *ctx)
>   	int fd;
>   
>   	filename = talloc_asprintf(ctx, "%s/state_dump",
> -				   xenstore_daemon_rundir());
> +				   xenstore_rundir());

... this one could be replaced with absolute_filename().

>   	if (!filename)
>   		return NULL;
>   
> diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
> index fddbede869..cfc2377857 100644
> --- a/tools/xenstored/minios.c
> +++ b/tools/xenstored/minios.c
> @@ -98,3 +98,8 @@ void mount_9pfs(void)
>   {
>   	create_thread("mount-9pfs", mount_thread, NULL);
>   }
> +
> +const char *xenstore_rundir(void)
> +{
> +	return XENSTORE_LIB_DIR;
> +}
> diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
> index fcb7791bd7..76f5c9ab84 100644
> --- a/tools/xenstored/posix.c
> +++ b/tools/xenstored/posix.c
> @@ -168,3 +168,8 @@ void early_init(void)
>   	mkdir(xenstore_daemon_rundir(), 0755);
>   	mkdir(XENSTORE_LIB_DIR, 0755);
>   }
> +
> +const char *xenstore_rundir(void)
> +{
> +	return xenstore_daemon_rundir();
> +}

Cheers,

-- 
Julien Grall

