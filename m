Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9589630EFE4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 10:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81199.149584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bE6-0008Tt-NV; Thu, 04 Feb 2021 09:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81199.149584; Thu, 04 Feb 2021 09:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bE6-0008TU-KT; Thu, 04 Feb 2021 09:47:02 +0000
Received: by outflank-mailman (input) for mailman id 81199;
 Thu, 04 Feb 2021 09:47:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7bE4-0008TP-Vt
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 09:47:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29729db5-bde4-4c78-a718-f8a211562610;
 Thu, 04 Feb 2021 09:46:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9F8EAD19;
 Thu,  4 Feb 2021 09:46:58 +0000 (UTC)
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
X-Inumbo-ID: 29729db5-bde4-4c78-a718-f8a211562610
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612432018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXBAmXDyWvASwTdZ/4WeYaO3EVbd/jk45fhEDCSunYQ=;
	b=YqvSWO/MUCuHQZAdSuYe17qtjvXASMK+mvv1DHp7aVyI+2WM8AtC0G203RqvQVO/P1nAVU
	lHUiUfD4RORiAIP0z5fA2c+RG7aeN+RIZQ4q8sp8UGjOemRLQO6yhHaIySk4s3wrpcowax
	Yr44OMPAC8H6JBX1f/wyrxgxJLXLVlM=
Subject: Re: [PATCH for-4.15] autoconf: check endian.h include path
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20210204093833.91190-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26522f21-4714-c29d-5ca4-baf012c51ac8@suse.com>
Date: Thu, 4 Feb 2021 10:46:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204093833.91190-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.02.2021 10:38, Roger Pau Monne wrote:
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -74,6 +74,7 @@ m4_include([../m4/ax_compare_version.m4])
>  m4_include([../m4/paths.m4])
>  m4_include([../m4/systemd.m4])
>  m4_include([../m4/golang.m4])
> +m4_include([../m4/header.m4])
>  
>  AX_XEN_EXPAND_CONFIG()
>  
> @@ -517,4 +518,6 @@ AC_ARG_ENABLE([pvshim],
>  ])
>  AC_SUBST(pvshim)
>  
> +AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])

Instead of a new macro, can't you use AC_CHECK_HEADERS()?

I'm also not certain about the order of checks - what if both
exist?

Jan

