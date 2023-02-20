Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA369D695
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 23:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498429.769309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUF60-0005bP-Es; Mon, 20 Feb 2023 22:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498429.769309; Mon, 20 Feb 2023 22:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUF60-0005YD-Bh; Mon, 20 Feb 2023 22:57:20 +0000
Received: by outflank-mailman (input) for mailman id 498429;
 Mon, 20 Feb 2023 22:57:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pUF5z-0005Wc-Kg
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 22:57:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUF5y-0006J0-Uy; Mon, 20 Feb 2023 22:57:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUF5y-0000C3-QB; Mon, 20 Feb 2023 22:57:18 +0000
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
	bh=P2VuiSuaQPlXf0MR8koO4AUur0W8TiPJsxED2RFblPY=; b=IA3HFXVqZAVfjC2uRrqAmhklC9
	Zjl4RIe4xrWLezFY1nKlAND09tJCCAh2XMB80SlvlNF59gJoneX1kkBeqEXu4Cf89XBmuWt/WCdj4
	aZmsHwPdNngw8CZo53REvkYthtGyz2IAH3ZOhwIO0bQFCvAz3aO4MBE4HK9jRfaJ5+Uw=;
Message-ID: <b1cc767e-b3c0-f021-f386-27bcde3cc5c9@xen.org>
Date: Mon, 20 Feb 2023 22:57:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 08/13] tools/xenstore: add accounting trace support
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230120100028.11142-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 20/01/2023 10:00, Juergen Gross wrote:
> Add a new trace switch "acc" and the related trace calls.
> 
> The "acc" switch is off per default.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

With one reamrk (see below):

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
>   tools/xenstore/xenstored_core.c   |  2 +-
>   tools/xenstore/xenstored_core.h   |  1 +
>   tools/xenstore/xenstored_domain.c | 10 ++++++++++
>   3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 6ef60179fa..558ef491b1 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2746,7 +2746,7 @@ static void set_quota(const char *arg, bool soft)
>   
>   /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
>   const char *const trace_switches[] = {
> -	"obj", "io", "wrl",
> +	"obj", "io", "wrl", "acc",
>   	NULL
>   };
>   
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 1f811f38cb..3e0734a6c6 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -302,6 +302,7 @@ extern unsigned int trace_flags;
>   #define TRACE_OBJ	0x00000001
>   #define TRACE_IO	0x00000002
>   #define TRACE_WRL	0x00000004
> +#define TRACE_ACC	0x00000008
>   extern const char *const trace_switches[];
>   int set_trace_switch(const char *arg);
>   
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index b1e29edb7e..d461fd8cc8 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -538,6 +538,12 @@ static struct domain *find_domain_by_domid(unsigned int domid)
>   	return (d && d->introduced) ? d : NULL;
>   }
>   
> +#define trace_acc(...)				\

The indentation of '\' looks odd.

> +do {						\
> +	if (trace_flags & TRACE_ACC)		\
> +		trace("acc: " __VA_ARGS__);	\
> +} while (0)
> +
>   int acc_fix_domains(struct list_head *head, bool update)
>   {
>   	struct changed_domain *cd;
> @@ -602,6 +608,8 @@ static int acc_add_changed_dom(const void *ctx, struct list_head *head,
>   		return 0;
>   
>   	errno = 0;
> +	trace_acc("local change domid %u: what=%u %d add %d\n", domid, what,
> +		  cd->acc[what], val);
>   	cd->acc[what] += val;
>   
>   	return cd->acc[what];
> @@ -1114,6 +1122,8 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
>   		return domain_acc_add_chk(d, what, ret, domid);
>   	}
>   
> +	trace_acc("global change domid %u: what=%u %u add %d\n", domid, what,
> +		  d->acc[what], add);
>   	d->acc[what] = domain_acc_add_chk(d, what, add, domid);
>   
>   	return d->acc[what];
Cheers,

-- 
Julien Grall

