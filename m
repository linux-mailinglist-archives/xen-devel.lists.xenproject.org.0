Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234097E801B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 19:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630735.983881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Vsu-0003qs-75; Fri, 10 Nov 2023 18:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630735.983881; Fri, 10 Nov 2023 18:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Vsu-0003ow-3c; Fri, 10 Nov 2023 18:05:36 +0000
Received: by outflank-mailman (input) for mailman id 630735;
 Fri, 10 Nov 2023 18:05:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r1Vss-0003nW-WC
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 18:05:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1Vsq-0005v7-H8; Fri, 10 Nov 2023 18:05:32 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.148.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1Vsq-0005e5-Aw; Fri, 10 Nov 2023 18:05:32 +0000
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
	bh=Mk3fDxX0UNBD88IjxvXDo2KnrOZTtXhwi/1ClBvndbM=; b=VOM/VFNnfjZ6wrsmL3mWNQHpVC
	SHmWK4/iFdAOOna9knzknrHgA5P7EWSHLn6XNzk2xwwoEVdaW5r2jJUtc8CIBRRrRMn0fyNhEfQ1h
	/Mcfk8ckbyvJXr18KEiyJ+vDs2XnzOlER94KfNTAjNAZCtd1cWcLEIjmLwAi2Qtdmb6A=;
Message-ID: <b84878ff-59f6-424b-9ca6-89c957d963ee@xen.org>
Date: Fri, 10 Nov 2023 18:05:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/29] tools/xenstored: split domain_init()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-25-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231110160804.29021-25-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/11/2023 16:07, Juergen Gross wrote:
> Today domain_init() is called either just before calling dom0_init()
> in case no live update is being performed, or it is called after
> reading the global state from read_state_global(), as the event
> channel fd is needed.
> 
> Split up domain_init() into a preparation part which can be called
> unconditionally, and in a part setting up the event channel handle.

Looking at the code, domain_init() may not be called if -D is passed to 
Xen. With your change, part of it would not be called unconditionally.

So does -D actually make sense? Did it actually work before your change? 
Should it be removed?

> 
> Note that there is no chance that chk_domain_generation() can be
> called now before xc_handle has been setup, so there is no need for
> the related special case anymore.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstored/core.c   |  2 ++
>   tools/xenstored/domain.c | 12 ++++++------
>   tools/xenstored/domain.h |  1 +
>   3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index 8e271e31f9..b9ec50b34c 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -2960,6 +2960,8 @@ int main(int argc, char *argv[])
>   
>   	init_pipe(reopen_log_pipe);
>   
> +	domain_static_init();

NIT: I find 'static' a bit confusing. How about using 'early' instead to 
match 'early_init()'?

> +
>   	/* Listen to hypervisor. */
>   	if (!no_domain_init && !live_update) {
>   		domain_init(-1);
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index 58b0942043..fa17f68618 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -1224,10 +1224,8 @@ static int domeq_fn(const void *key1, const void *key2)
>   	return *(const unsigned int *)key1 == *(const unsigned int *)key2;
>   }
>   
> -void domain_init(int evtfd)
> +void domain_static_init(void)
>   {
> -	int rc;
> -
>   	/* Start with a random rather low domain count for the hashtable. */
>   	domhash = create_hashtable(NULL, "domains", domhash_fn, domeq_fn, 0);
>   	if (!domhash)
> @@ -1258,6 +1256,11 @@ void domain_init(int evtfd)
>   	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);
>   
>   	talloc_set_destructor(xgt_handle, close_xgt_handle);
> +}
> +
> +void domain_init(int evtfd)
> +{
> +	int rc;
>   
>   	if (evtfd < 0)
>   		xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
> @@ -1291,9 +1294,6 @@ static bool chk_domain_generation(unsigned int domid, uint64_t gen)
>   {
>   	struct domain *d;
>   
> -	if (!xc_handle && domid == dom0_domid)
> -		return true;
> -
>   	d = find_domain_struct(domid);
>   
>   	return d && d->generation <= gen;
> diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
> index 7625dca8cd..6c00540311 100644
> --- a/tools/xenstored/domain.h
> +++ b/tools/xenstored/domain.h
> @@ -82,6 +82,7 @@ int do_get_domain_path(const void *ctx, struct connection *conn,
>   int do_reset_watches(const void *ctx, struct connection *conn,
>   		     struct buffered_data *in);
>   
> +void domain_static_init(void);
>   void domain_init(int evtfd);
>   void dom0_init(void);
>   void domain_deinit(void);

Cheers,

-- 
Julien Grall

