Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F7BA9C400
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 11:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967609.1357370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8FZZ-0006tR-Do; Fri, 25 Apr 2025 09:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967609.1357370; Fri, 25 Apr 2025 09:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8FZZ-0006rf-BJ; Fri, 25 Apr 2025 09:42:17 +0000
Received: by outflank-mailman (input) for mailman id 967609;
 Fri, 25 Apr 2025 09:42:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u8FZX-0006rZ-GQ
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 09:42:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u8FZV-003jMm-0k;
 Fri, 25 Apr 2025 09:42:13 +0000
Received: from lfbn-gre-1-199-136.w90-112.abo.wanadoo.fr ([90.112.161.136]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u8FZU-000ab9-2U;
 Fri, 25 Apr 2025 09:42:12 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=WCgYwtS6sH/0hupOA7tJzv1wMClgBMpdYk9QAVfY7nI=; b=V83fLX9H8djmFtLJQYjCwyDTHb
	jfhKip2KbcISSpiNNvnJqG3jnBxTgfZX0GeeScNLnEZlGxK4Y2yj/WxUWBP3qJgsCrUQzr2KTDjXD
	lM3BfRFvv5u8c1y8uXagDt0edh4syrwHYoia/2E+1R386x/6Qa29ir8pYuwIduqQ1TcA=;
Date: Fri, 25 Apr 2025 11:42:10 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>, Hongbo <hehongbo@mail.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/1] tools/libxl: search PATH for QEMU if
 `QEMU_XEN_PATH` is not absolute
Message-ID: <aAtY8n5xF6SExmDJ@l14>
References: <20241223031753.13709-1-hehongbo@mail.com>
 <20250330160304.20899-1-hehongbo@mail.com>
 <54d1d04a-e2b5-449e-97d9-8888e5b0f5eb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54d1d04a-e2b5-449e-97d9-8888e5b0f5eb@suse.com>

On Tue, Apr 08, 2025 at 12:38:16PM +0200, Jan Beulich wrote:
> On 30.03.2025 18:03, Hongbo wrote:
> > +                {
> > +                    char *path_dup = libxl__strdup(gc, path_env);
> > +                    char *saveptr;
> > +
> > +                    char *path = strtok_r(path_dup, ":", &saveptr);
> 
> Main reason I'm replying here is this one though, where CI found gcc to
> object:
> 
> libxl_dm.c: In function 'libxl__domain_device_model':
> libxl_dm.c:356:31: error: 'saveptr' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>                          char *candidate = libxl__abs_path(gc, configured_dm, path);
>                                ^
> cc1: all warnings being treated as errors
> 
> The compiler can't know that path_dup is guaranteed non-NULL. Hence, if it
> can see (part of) the implementation of strtok_r(), it would observe that
> it's possible that the continuation-invocation path is taken, where
> saveptr necessarily is consumed.

I'll recommit this patch again with `saveptr` initialised to NULL. My
man page says some implementation requires this anyway.

Cheers,

-- 
Anthony PERARD

