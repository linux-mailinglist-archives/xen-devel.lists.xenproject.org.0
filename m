Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9360730BAA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 01:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549276.857719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9a77-0001su-7X; Wed, 14 Jun 2023 23:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549276.857719; Wed, 14 Jun 2023 23:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9a77-0001qB-4O; Wed, 14 Jun 2023 23:41:21 +0000
Received: by outflank-mailman (input) for mailman id 549276;
 Wed, 14 Jun 2023 23:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4vD=CC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9a75-0001q5-ER
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 23:41:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4c93df7-0b0c-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 01:41:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EABF60AB3;
 Wed, 14 Jun 2023 23:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C132C433C8;
 Wed, 14 Jun 2023 23:41:14 +0000 (UTC)
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
X-Inumbo-ID: f4c93df7-0b0c-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686786075;
	bh=4rJL0YZWzfDXmdMIt90oCDaNNdX5eTqmnR4ZJNXaTfY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cs3Yvnf34PLzlBRzLPwhtedtlKpttpbPkzmsl1UeKolU7U2p7UV8s1vJqIfxgjyet
	 vB2GvPTSrGKNhY+9cUx0KACdOJD3PHTKTiWG702FbyvdWic6a+5z6SFhWQuWvpg5Cg
	 q+zXGfeuK5GsAm7GtKsBqXnAXMkN4dED8kN7V3Ei/7hifBdocyt4QMHmE7NfGqJmKD
	 iE0uroJP4hVZUo8USXOMyo6k2ZvGBmnyikzjHeRq5JZZtldWvZ5ey3hCVZTlm4+Y9q
	 hUkhIBV+ht9K5ZLfJ+HUS3xPCgCWrdDyO+qI/Ao1gJyoiY84mch291jotx6zT5HWHy
	 FzoLiknBt/neQ==
Date: Wed, 14 Jun 2023 16:41:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [PATCH] spinlock: alter inlining of _spin_lock_cb()
In-Reply-To: <dd75280a-167c-6a1d-87e4-edbffe12cf3c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306141640250.897208@ubuntu-linux-20-04-desktop>
References: <dd75280a-167c-6a1d-87e4-edbffe12cf3c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jun 2023, Jan Beulich wrote:
> To comply with Misra rule 8.10 ("An inline function shall be declared
> with the static storage class"), convert what is presently
> _spin_lock_cb() to an always-inline (and static) helper, while making
> the function itself a thin wrapper, just like _spin_lock() is.
> 
> While there drop the unlikely() from the callback check, and correct
> indentation in _spin_lock().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -304,7 +304,8 @@ static always_inline u16 observe_head(sp
>      return read_atomic(&t->head);
>  }
>  
> -void inline _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
> +static void always_inline spin_lock_common(spinlock_t *lock,
> +                                           void (*cb)(void *), void *data)
>  {
>      spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
>      LOCK_PROFILE_VAR;
> @@ -316,7 +317,7 @@ void inline _spin_lock_cb(spinlock_t *lo
>      while ( tickets.tail != observe_head(&lock->tickets) )
>      {
>          LOCK_PROFILE_BLOCK;
> -        if ( unlikely(cb) )
> +        if ( cb )
>              cb(data);
>          arch_lock_relax();
>      }
> @@ -327,7 +328,12 @@ void inline _spin_lock_cb(spinlock_t *lo
>  
>  void _spin_lock(spinlock_t *lock)
>  {
> -     _spin_lock_cb(lock, NULL, NULL);
> +    spin_lock_common(lock, NULL, NULL);
> +}
> +
> +void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
> +{
> +    spin_lock_common(lock, cb, data);
>  }
>  
>  void _spin_lock_irq(spinlock_t *lock)
> 

