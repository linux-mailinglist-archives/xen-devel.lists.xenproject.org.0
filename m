Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4261C7E7E2B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 18:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630705.983823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1VQP-00049n-Sj; Fri, 10 Nov 2023 17:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630705.983823; Fri, 10 Nov 2023 17:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1VQP-000477-Pn; Fri, 10 Nov 2023 17:36:09 +0000
Received: by outflank-mailman (input) for mailman id 630705;
 Fri, 10 Nov 2023 17:36:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r1VQO-00045v-Rn
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 17:36:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VQO-000592-7Z; Fri, 10 Nov 2023 17:36:08 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.148.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VQO-0004UT-25; Fri, 10 Nov 2023 17:36:08 +0000
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
	bh=2MGsrNsAlUk450k1+fL1047vMLHGwRNB8HfDaRganrk=; b=1MHWqdDy4LZXraWxlq4AWzgCrn
	JlVay9hIqetnTxEAVYZDpfvUlE3pUEAJkEZKoqij8RT4MsKTT1dBiPjp61UjyR2AXLZltjPoir9oi
	8r82hBHGzZk3tts12/aGLOa6I2rKOmIvuCVP9Ydx5u2K5Tm8KcPIH45zGlrJeaW2iIR8=;
Message-ID: <430273e6-529b-4cb2-8998-97dc73e72f1b@xen.org>
Date: Fri, 10 Nov 2023 17:36:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/29] tools/xenstored: get own domid in stubdom case
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-23-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231110160804.29021-23-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/11/2023 16:07, Juergen Gross wrote:
> Obtain the own domid from the Xenstore special grant entry when running
> as stubdom.
The commit message says we would use the grant entry but ...

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - replacement of V1 patch (ANdrew Cooper)
> ---
>   tools/xenstored/core.c   | 1 +
>   tools/xenstored/core.h   | 1 +
>   tools/xenstored/minios.c | 5 +++++
>   3 files changed, 7 insertions(+)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index 0c14823fb0..8e271e31f9 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -2738,6 +2738,7 @@ static struct option options[] = {
>   int dom0_domid = 0;
>   int dom0_event = 0;
>   int priv_domid = 0;
> +int stub_domid = -1;
>   
>   static unsigned int get_optval_uint(const char *arg)
>   {
> diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
> index d0ac587f8f..3c28007d11 100644
> --- a/tools/xenstored/core.h
> +++ b/tools/xenstored/core.h
> @@ -361,6 +361,7 @@ do {						\
>   extern int dom0_domid;
>   extern int dom0_event;
>   extern int priv_domid;
> +extern int stub_domid;
>   extern bool keep_orphans;
>   
>   extern unsigned int timeout_watch_event_msec;
> diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
> index 0cdec3ae51..202d70387a 100644
> --- a/tools/xenstored/minios.c
> +++ b/tools/xenstored/minios.c
> @@ -19,6 +19,8 @@
>   #include <sys/mman.h>
>   #include "core.h"
>   #include <xen/grant_table.h>
> +#include <mini-os/events.h>
> +#include <mini-os/gnttab.h>
>   
>   void write_pidfile(const char *pidfile)
>   {
> @@ -56,4 +58,7 @@ void unmap_xenbus(void *interface)
>   
>   void early_init(void)
>   {
> +	stub_domid = evtchn_get_domid();

... the function is called evtchn_*. So the commit message doesn't seem 
to match the code.

Also, you seem to include mini-os/gnttab.h when you don't add any 
function that seems to be related.

Lastly, shouldn't this helper be called get_domain_id() (or similar) 
because the domid is not specific to the event channel subsystem?

Cheers,

-- 
Julien Grall

