Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75346F5859
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 14:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529185.823289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC1a-00007E-WE; Wed, 03 May 2023 12:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529185.823289; Wed, 03 May 2023 12:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC1a-00004r-T9; Wed, 03 May 2023 12:56:02 +0000
Received: by outflank-mailman (input) for mailman id 529185;
 Wed, 03 May 2023 12:56:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puC1Z-0008WR-UJ
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 12:56:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puC1Y-0002NG-OU; Wed, 03 May 2023 12:56:00 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puC1Y-0003Mq-H3; Wed, 03 May 2023 12:56:00 +0000
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
	bh=cYThjRTWIYId03gPcjqSu6mJI5Pz9knWhki2c3eBCtU=; b=wWalS9+sdX1DLpgcrnF/f0iA98
	G+9MGwv3GLwBSAVb/bBofMDglFJmUGCnJT/u57Fo4hTy9UrjUXKTBvNupyGcIypG6N1sWOTZXdWzj
	aVasbntlDK14kJTwR9nnA+oPDob8AP0x8GHbudXRTeTpQ7MJWtAcQ6KHfFj9ROzFi7Qc=;
Message-ID: <8d91f57b-41ed-2939-94e8-9f73f0d523a6@xen.org>
Date: Wed, 3 May 2023 13:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/13] tools/xenstore: do some cleanup of hashtable.c
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230330085011.9170-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/03/2023 09:50, Juergen Gross wrote:
> Do the following cleanups:
> - hashtable_count() isn't used at all, so remove it
> - replace prime_table_length and max_load_factor with macros
> - make hash() static
> - add a loadlimit() helper function
> - remove the /***/ lines between functions
> - do some style corrections
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/hashtable.c | 71 ++++++++++++++------------------------
>   tools/xenstore/hashtable.h | 10 ------
>   2 files changed, 26 insertions(+), 55 deletions(-)
> 
> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
> index 3d4466b597..c1b11743bb 100644
> --- a/tools/xenstore/hashtable.c
> +++ b/tools/xenstore/hashtable.c
> @@ -40,22 +40,25 @@ static const unsigned int primes[] = {
>   50331653, 100663319, 201326611, 402653189,
>   805306457, 1610612741
>   };
> -const unsigned int prime_table_length = sizeof(primes)/sizeof(primes[0]);
> -const unsigned int max_load_factor = 65; /* percentage */
>   
> -/*****************************************************************************/
> -/* indexFor */
> -static inline unsigned int
> -indexFor(unsigned int tablelength, unsigned int hashvalue) {
> +#define PRIME_TABLE_LEN   ARRAY_SIZE(primes)
> +#define MAX_LOAD_PERCENT  65
> +
> +static inline unsigned int indexFor(unsigned int tablelength,
> +                                    unsigned int hashvalue)
> +{
>       return (hashvalue % tablelength);
>   }
>   
> -/*****************************************************************************/
> -struct hashtable *
> -create_hashtable(const void *ctx, unsigned int minsize,
> -                 unsigned int (*hashf) (const void *),
> -                 int (*eqf) (const void *, const void *),
> -                 unsigned int flags)
> +static unsigned int loadlimit(unsigned int pindex)
> +{
> +    return ((uint64_t)primes[pindex] * MAX_LOAD_PERCENT) / 100;
> +}
> +
> +struct hashtable *create_hashtable(const void *ctx, unsigned int minsize,
> +                                   unsigned int (*hashf) (const void *),
> +                                   int (*eqf) (const void *, const void *),
> +                                   unsigned int flags)
>   {
>       struct hashtable *h;
>       unsigned int pindex, size = primes[0];
> @@ -64,7 +67,7 @@ create_hashtable(const void *ctx, unsigned int minsize,
>       if (minsize > (1u << 30)) return NULL;
>   
>       /* Enforce size as prime */
> -    for (pindex=0; pindex < prime_table_length; pindex++) {
> +    for (pindex=0; pindex < PRIME_TABLE_LEN; pindex++) {

As you fix the style, how about adding a space before/after '=' and...

>           if (primes[pindex] > minsize) { size = primes[pindex]; break; }

... break this line in multiple ones?

With or without this included here:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

