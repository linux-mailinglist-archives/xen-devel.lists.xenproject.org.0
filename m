Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D59D3476B7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 12:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100915.192556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1H6-0005RU-F1; Wed, 24 Mar 2021 11:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100915.192556; Wed, 24 Mar 2021 11:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1H6-0005R8-Bp; Wed, 24 Mar 2021 11:02:08 +0000
Received: by outflank-mailman (input) for mailman id 100915;
 Wed, 24 Mar 2021 11:02:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP1H5-0005R2-3P
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:02:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP1H5-0007hi-10
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:02:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP1H4-0004rf-VI
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:02:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lP1H1-0004o9-MT; Wed, 24 Mar 2021 11:02:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=/8DsYsAKj7i1cJjt9Q3WvNLx46fhSwfWalCF1UVPgo8=; b=IsyH6ppoqRw1+gbk5rtAAEWUOz
	UiiJO4H54AKzjUcHrp/NQXWkayVa5fERJJnv2k2QDk1rLaBvdciRzw7Kzk4TGigTg9gTQvLKB1cXy
	C+vyTA9BshKfCJpSlbhJTRhG9sLrD1swQNOgzgD+qBwYmjEloZEb1eAAcU3J5OFQfcV8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24667.7211.431280.743192@mariner.uk.xensource.com>
Date: Wed, 24 Mar 2021 11:02:03 +0000
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: [PATCH-for-4.15] tools/libs/store: cleanup libxenstore interface
In-Reply-To: <20210324072645.10596-1-jgross@suse.com>
References: <20210324072645.10596-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH-for-4.15] tools/libs/store: cleanup libxenstore interface"):
> There are some internals in the libxenstore interface which should be
> removed.
> 
> Move those functions into xs_lib.c and the related definitions into
> xs_lib.h. Remove the functions from the mapfile. Add xs_lib.o to
> xenstore_client as some of the internal functions are needed there.

This seems wider in scope than I was expecting.

Reviewing it again makes me think that there are more concers than I
anticipated and I am now doubtful whether I want to take it in 4.15.


I thought at this stage we were just going to fix the
accidentally-exported symbols with improperly namespaced names.  It is
those for which I think that withdrawing them without an ABI soname
bump, in contravention of usual library ABI stability rules, will not
cause trouble in pracice.

My current thoughts are that several of these really ought not to be
withdrawn as they might cause actual trouble:

>  /* Path for various daemon things: env vars can override. */
> -const char *xs_daemon_rootdir(void);
> -const char *xs_domain_dev(void);
> -const char *xs_daemon_tdb(void);

Someone who was writing bindings might have exposed these without
knowing what they were, resulting in linkage to these symbols.

>  bool xs_strings_to_perms(struct xs_permissions *perms, unsigned int num,
>  			 const char *strings);
>  
> -/* Convert permissions to a string (up to len MAX_STRLEN(unsigned int)+1). */
> -bool xs_perm_to_string(const struct xs_permissions *perm,
> -                       char *buffer, size_t buf_len);

Isn't this function potentially useful ?  It seems funny to have only
one of the conversion directions.

> +void unsanitise_value(char *out, unsigned *out_len_r, const char *in)

Is it possible to do sort this out in a more minimal way ?  Eg we
could change the name to namespace it properly.  (I haven't looked at
the code in detail and am still rather under-caffeinated so maybe I am
talking nonsense here.)

Ian.

