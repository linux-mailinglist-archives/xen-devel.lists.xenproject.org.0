Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0755A7E7E28
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 18:32:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630701.983813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1VMT-0002kB-AV; Fri, 10 Nov 2023 17:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630701.983813; Fri, 10 Nov 2023 17:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1VMT-0002hk-69; Fri, 10 Nov 2023 17:32:05 +0000
Received: by outflank-mailman (input) for mailman id 630701;
 Fri, 10 Nov 2023 17:32:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r1VMR-0002gB-GH
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 17:32:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VMP-0004ve-9H; Fri, 10 Nov 2023 17:32:01 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.148.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VMP-0004BV-0y; Fri, 10 Nov 2023 17:32:01 +0000
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
	bh=Do7H+IVkCpHR+LOl9TYx8Sh8Oxj6Tp4sWKImX9dZBMk=; b=cu3NldjPAM8Vq8wNvXojoKhSMP
	ah2sNvuqk57a6keCNOZDH3KPha6tLcgnfoEom5Qa9S7d2PRNCxzhoyz4c1MOFfY29g6t2JH7D/G3t
	w1cnq/9c20IdIaDsS9gPw3ngSpmLAdMYUIi3e8nVEiBf02ZZK9uykI61kmzdxdJhY/H4=;
Message-ID: <adc25dc4-9ba6-41d4-87a0-cf6ad5777b1f@xen.org>
Date: Fri, 10 Nov 2023 17:31:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/29] tools/xenstored: add early_init() function
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-22-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231110160804.29021-22-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/11/2023 16:07, Juergen Gross wrote:
> Some xenstored initialization needs to be done in the daemon case only,
> so split it out into a new early_init() function being a stub in the
> stubdom case.

It is not entirely clear to me how you decided the split. For example...

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> V2:
> - rename function
> - move patch earlier in the series
> ---
>   tools/xenstored/core.c   |  6 +-----
>   tools/xenstored/core.h   |  3 +++
>   tools/xenstored/minios.c |  3 +++
>   tools/xenstored/posix.c  | 11 +++++++++++
>   4 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index edd07711db..0c14823fb0 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -2933,11 +2933,7 @@ int main(int argc, char *argv[])
>   	if (optind != argc)
>   		barf("%s: No arguments desired", argv[0]);
>   
> -	reopen_log();
> -
> -	/* Make sure xenstored directory exists. */
> -	/* Errors ignored here, will be reported when we open files */
> -	mkdir(xenstore_daemon_rundir(), 0755);
> +	early_init();
>   
>   	if (dofork) {
>   		openlog("xenstored", 0, LOG_DAEMON);

For stubdom we would not fork, so I would expect the call to openlog() 
not necessary. Same for the init_pipe() below.

> diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
> index 480b0f5f7b..d0ac587f8f 100644
> --- a/tools/xenstored/core.h
> +++ b/tools/xenstored/core.h
> @@ -35,6 +35,8 @@
>   #include "list.h"
>   #include "hashtable.h"
>   
> +#define XENSTORE_LIB_DIR	XEN_LIB_DIR "/xenstore"
> +
>   #ifndef O_CLOEXEC
>   #define O_CLOEXEC 0
>   /* O_CLOEXEC support is needed for Live Update in the daemon case. */
> @@ -384,6 +386,7 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
>   
>   /* Return the event channel used by xenbus. */
>   evtchn_port_t get_xenbus_evtchn(void);
> +void early_init(void);
>   
>   /* Write out the pidfile */
>   void write_pidfile(const char *pidfile);
> diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
> index 0779efbf91..0cdec3ae51 100644
> --- a/tools/xenstored/minios.c
> +++ b/tools/xenstored/minios.c
> @@ -54,3 +54,6 @@ void unmap_xenbus(void *interface)
>   	xengnttab_unmap(*xgt_handle, interface, 1);
>   }
>   
> +void early_init(void)
> +{
> +}
> diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
> index 7e03dd982d..fcb7791bd7 100644
> --- a/tools/xenstored/posix.c
> +++ b/tools/xenstored/posix.c
> @@ -22,6 +22,7 @@
>   #include <fcntl.h>
>   #include <stdlib.h>
>   #include <sys/mman.h>
> +#include <xen-tools/xenstore-common.h>
>   
>   #include "utils.h"
>   #include "core.h"
> @@ -157,3 +158,13 @@ void *xenbus_map(void)
>   
>   	return addr;
>   }
> +
> +void early_init(void)
> +{
> +	reopen_log();
> +
> +	/* Make sure xenstored directories exist. */
> +	/* Errors ignored here, will be reported when we open files */
> +	mkdir(xenstore_daemon_rundir(), 0755);
> +	mkdir(XENSTORE_LIB_DIR, 0755);

The addition of the second mkdir() doesn't seem to be explained in the 
commit message.

Cheers,

-- 
Julien Grall

