Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645C765DDD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 23:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571271.894724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8QD-00077g-90; Thu, 27 Jul 2023 21:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571271.894724; Thu, 27 Jul 2023 21:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8QD-00075b-6Q; Thu, 27 Jul 2023 21:21:21 +0000
Received: by outflank-mailman (input) for mailman id 571271;
 Thu, 27 Jul 2023 21:21:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP8QB-00075V-RF
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 21:21:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP8QA-00008V-Is; Thu, 27 Jul 2023 21:21:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP8QA-0001DV-C2; Thu, 27 Jul 2023 21:21:18 +0000
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
	bh=5zdi4QBqdvXDyrF0kf0+hEysoRrCOprJWOcfuKhuCXk=; b=eu5Yy/qllyJoysOoKQzKepGj43
	zUeM3RvD9nGJaL/wpILJnMaODJrPhToOwWCrGlwcgknodng2/QTKhva+1dNVFtFAwyekFSCbs73xO
	uOmDMluWdhfAQnTCr6LQRJd01dRpvJwPGfnqo5o/lOOboiYO6PKscgxDN7scjpjH0Cfs=;
Message-ID: <de4f8574-c042-e2bb-a3ec-8bcee118a2c0@xen.org>
Date: Thu, 27 Jul 2023 22:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-15-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 14/25] tools/xenstore: change talloc_free() to take a
 const pointer
In-Reply-To: <20230724110247.10520-15-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> With talloc_free() and related functions not taking a ponter to const

typo: s/ponter/pointer/

> it is tedious to use the const attribute for talloc()-ed memory in
> many cases.
> 
> Change the related prototypes to use "const void *" instead of
> "void *".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - new patch
> ---
>   tools/xenstore/talloc.c | 8 ++++----
>   tools/xenstore/talloc.h | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/xenstore/talloc.c b/tools/xenstore/talloc.c
> index 23c3a23b19..4f08dbec59 100644
> --- a/tools/xenstore/talloc.c
> +++ b/tools/xenstore/talloc.c
> @@ -319,7 +319,7 @@ static int talloc_unreference(const void *context, const void *ptr)
>     remove a specific parent context from a pointer. This is a more
>     controlled varient of talloc_free()
>   */
> -int talloc_unlink(const void *context, void *ptr)
> +int talloc_unlink(const void *context, const void *ptr)
>   {
>   	struct talloc_chunk *tc_p, *new_p;
>   	void *new_parent;
> @@ -499,7 +499,7 @@ void *talloc_init(const char *fmt, ...)
>     should probably not be used in new code. It's in here to keep the talloc
>     code consistent across Samba 3 and 4.
>   */
> -static void talloc_free_children(void *ptr)
> +static void talloc_free_children(const void *ptr)
>   {
>   	struct talloc_chunk *tc;
>   
> @@ -539,7 +539,7 @@ static void talloc_free_children(void *ptr)
>      will not be freed if the ref_count is > 1 or the destructor (if
>      any) returns non-zero
>   */
> -int talloc_free(void *ptr)
> +int talloc_free(const void *ptr)
>   {
>   	int saved_errno = errno;
>   	struct talloc_chunk *tc;
> @@ -571,7 +571,7 @@ int talloc_free(void *ptr)
>   			goto err;
>   		}
>   		tc->destructor = (talloc_destructor_t)-1;
> -		if (d(ptr) == -1) {
> +		if (d((void *)ptr) == -1) {

AFAICT, you can't propagate the const because the destructor may need to 
modify the content. I guess this is a necessary evil here but it would 
be good to document it.

Cheers,

-- 
Julien Grall

