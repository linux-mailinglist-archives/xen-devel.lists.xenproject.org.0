Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F5670B83
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 23:15:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479867.743965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuEa-0001TH-CV; Tue, 17 Jan 2023 22:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479867.743965; Tue, 17 Jan 2023 22:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuEa-0001R3-9s; Tue, 17 Jan 2023 22:15:12 +0000
Received: by outflank-mailman (input) for mailman id 479867;
 Tue, 17 Jan 2023 22:15:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHuEZ-0001Qx-6b
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 22:15:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHuEZ-00050I-1A; Tue, 17 Jan 2023 22:15:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHuEY-0000cU-SC; Tue, 17 Jan 2023 22:15:10 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=05ZsLxnhrqrBYV1uktE+uGxMIsTLyXZRe+iL0UodKt0=; b=r/gKfkfBr8ZlBD9XR9myvmIOp5
	0wbmDGDyCneDgHV0bv+TtpQfEwjc4OWUVYBql5Pfj8xPS0SLMBiR8ncZMbIXQ/2xf45uDv6UL+r5i
	eVJrCBLwSR7UqUAAtaHKYpykyihgmzQNIB5Z71cOvWyEda19ziNsV9bhtBeQ+ydzNG/M=;
Message-ID: <2ab20725-4bb9-66ac-a87f-01dca92f9453@xen.org>
Date: Tue, 17 Jan 2023 22:15:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-16-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 15/17] tools/xenstore: introduce trace classes
In-Reply-To: <20230117091124.22170-16-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
> @@ -2604,6 +2607,8 @@ static void usage(void)
>   "  -N, --no-fork           to request that the daemon does not fork,\n"
>   "  -P, --output-pid        to request that the pid of the daemon is output,\n"
>   "  -T, --trace-file <file> giving the file for logging, and\n"
> +"      --trace-control=+<switch> activate a specific <switch>\n"
> +"      --trace-control=-<switch> deactivate a specific <switch>\n"
>   "  -E, --entry-nb <nb>     limit the number of entries per domain,\n"
>   "  -S, --entry-size <size> limit the size of entry per domain, and\n"
>   "  -W, --watch-nb <nb>     limit the number of watches per domain,\n"
> @@ -2647,6 +2652,7 @@ static struct option options[] = {
>   	{ "output-pid", 0, NULL, 'P' },
>   	{ "entry-size", 1, NULL, 'S' },
>   	{ "trace-file", 1, NULL, 'T' },
> +	{ "trace-control", 1, NULL, 1 },
>   	{ "transaction", 1, NULL, 't' },
>   	{ "perm-nb", 1, NULL, 'A' },
>   	{ "path-max", 1, NULL, 'M' },
> @@ -2721,6 +2727,43 @@ static void set_quota(const char *arg, bool soft)
>   		barf("unknown quota \"%s\"\n", arg);
>   }
>   
> +/* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
> +const char *trace_switches[] = {

AFAICT, this array is not meant to be modified. So you want a second const.

> +	"obj", "io", "wrl",
> +	NULL
> +};

[...]

> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 3b96ecd018..c85b15515c 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -287,6 +287,12 @@ extern char **orig_argv;
>   
>   extern char *tracefile;
>   extern int tracefd;
> +extern unsigned int trace_flags;
> +#define TRACE_OBJ	0x00000001
> +#define TRACE_IO	0x00000002
> +#define TRACE_WRL	0x00000004
I would add a comment on top to explain that the value should be kept in 
sync with trace_switches.

Cheers,

-- 
Julien Grall

