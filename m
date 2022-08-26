Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3865A28BF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 15:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393892.633088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRZaW-0000DM-26; Fri, 26 Aug 2022 13:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393892.633088; Fri, 26 Aug 2022 13:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRZaV-00009k-Ul; Fri, 26 Aug 2022 13:41:31 +0000
Received: by outflank-mailman (input) for mailman id 393892;
 Fri, 26 Aug 2022 13:41:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ooZY=Y6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oRZaT-00009e-Oj
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 13:41:29 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6e8892e-2544-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 15:41:27 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1661521277809115.91390181082215;
 Fri, 26 Aug 2022 06:41:17 -0700 (PDT)
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
X-Inumbo-ID: c6e8892e-2544-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1661521282; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mX0clpkTlQEnrqNiJ4ouPPs/DO812uqEVflmjGNaso3sKzQuD9Ju98We85BekS8emQwhtenVKVRCypqX2TlvtO9lrE7/CIsy9EL/7PsVfkRod0M0l5XV6u+FFhI1vVRl/1j7ZDY7KYckq9aunvoifL1834u1hC0Xl7+wUsoTqi4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661521282; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=g5CkyHHy4HTk2CiBzhtk6AvN1dey5wMabu9AKWDtSdM=; 
	b=UjC4x6KdfCjCvVhX7XOyUbqkbj+h8P4uuRT2hGB2MaPNtiK0VnvnVRGxX8yLN1wJ5YyzQZUTBD5vgGsG3Le2HXjYmdOGa4Gl6Vz2REurxxYX3ZP/XZWJ9OWab1lYZtV/vLJvDJt+a0d35nA3+L6UcZftClz9k7P2b87vBHpckPQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661521282;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=g5CkyHHy4HTk2CiBzhtk6AvN1dey5wMabu9AKWDtSdM=;
	b=uIVImSWAFNroGAdBkmmHC+d1oYgIJ4bBjY/V6UssVWapbprHov7AOhop8JRnN5X/
	LJujxWYIWkjdeTP1l1qsVDGllSW3Xbv8DyR2JDmglkK7ftLP2qvR4X3iL4cskJ2Du9p
	sJzVsUgT4EPwg81uxaOs2x/dnbfJo4Z9HQCGIEOY=
Message-ID: <12862a73-770c-f320-bcff-fc3a46e0663f@apertussolutions.com>
Date: Fri, 26 Aug 2022 09:41:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/7] xsm/flask: sidtab: Fix MISRA C 2012 Rule 20.7
 violations
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <20220819194359.1196539-3-burzalodowa@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220819194359.1196539-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 8/19/22 15:43, Xenia Ragiadakou wrote:
> In macros SIDTAB_HASH(), INIT_SIDTAB_LOCK(), SIDTAB_LOCK() and SIDTAB_UNLOCK(),
> add parentheses around the macro parameter to prevent against unintended
> expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>  xen/xsm/flask/ss/sidtab.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
> index 74babfac9c..69fc3389b3 100644
> --- a/xen/xsm/flask/ss/sidtab.c
> +++ b/xen/xsm/flask/ss/sidtab.c
> @@ -14,11 +14,11 @@
>  #include "security.h"
>  #include "sidtab.h"
>  
> -#define SIDTAB_HASH(sid) (sid & SIDTAB_HASH_MASK)
> +#define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
>  
> -#define INIT_SIDTAB_LOCK(s) spin_lock_init(&s->lock)
> -#define SIDTAB_LOCK(s) spin_lock(&s->lock)
> -#define SIDTAB_UNLOCK(s) spin_unlock(&s->lock)
> +#define INIT_SIDTAB_LOCK(s) spin_lock_init(&(s)->lock)
> +#define SIDTAB_LOCK(s) spin_lock(&(s)->lock)
> +#define SIDTAB_UNLOCK(s) spin_unlock(&(s)->lock)
>  
>  int sidtab_init(struct sidtab *s)
>  {

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

