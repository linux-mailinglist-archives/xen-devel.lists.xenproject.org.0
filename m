Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A32B6756BA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 15:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481812.746953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIs9Z-0006IB-7r; Fri, 20 Jan 2023 14:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481812.746953; Fri, 20 Jan 2023 14:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIs9Z-0006Fv-4v; Fri, 20 Jan 2023 14:14:01 +0000
Received: by outflank-mailman (input) for mailman id 481812;
 Fri, 20 Jan 2023 14:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uODy=5R=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1pIs9X-0006Fn-J6
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 14:13:59 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac5948f4-98cc-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 15:13:56 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1674224029482241.5489273099247;
 Fri, 20 Jan 2023 06:13:49 -0800 (PST)
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
X-Inumbo-ID: ac5948f4-98cc-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; t=1674224033; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XZh3rC7FHAof0N08XiWZ/CfdL/0rVKOP2tG0BHe39eY7DomE+aYBHzYrT8spYbEVhrBFCxX0umgL2Vd9pkDHvhCcGcgQqT9js3aPYwooXMGfm4Trx6VYwDkQ5mEPW3ODDOLUTD9mmOWHrDtFyfpAZAjq+sb8xofhUrBiK5a1Q18=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674224033; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9ix9s84QpeY8dDxVbIX3sXORNpGtaeroYBcT4xnkZeg=; 
	b=mwSLHIP4cG9pExY3Oyok780YiqY9LZYBo757qhxPNd99LkBB3AkoBOsNoMwgxT7bnDOioQNperYjma5k2pvNSpzRCHLBIiAN29jqlol01XvKa3OYKW6O/cp6PfGlfhDcinyqK5pteKUw5TuDovJ62V9/owBJtqXz4iECqF2KsZI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674224033;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=9ix9s84QpeY8dDxVbIX3sXORNpGtaeroYBcT4xnkZeg=;
	b=ZObQBl7Wjez72p6x3Ngkho+w+PeSLBvGzF/km8oDVKaRXcTI/mZoqUKHY/a+p0xq
	H6J0sCr0t+v0t3yDgAqWXX6Q7P5InFNqTInYLFZNrAIvf0+c4ExFu54OoY7GnO08EAQ
	NkiQ22MR65ORMXOyIN0q7TgzN/Y0ZIFwjBQGYJe8=
Message-ID: <c3e4b2f6-b2b9-b496-a4a3-6292433f695d@apertussolutions.com>
Date: Fri, 20 Jan 2023 09:13:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [XEN PATCH] build: fix building flask headers before descending
 in flask/ss/
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230120133626.55680-1-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20230120133626.55680-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/20/23 08:36, Anthony PERARD wrote:
> Unfortunatly, adding prerequisite to "$(obj)/ss/built_in.o" doesn't
> work because we have "$(obj)/%/built_in.o: $(obj)/% ;" in Rules.mk.
> So, make is allow to try to build objects in "xsm/flask/ss/" before
> generating the headers.
> 
> Adding a prerequisite on "$(obj)/ss" instead will fix the issue has
> that the target used to run make in this subdirectory.
> 
> Unfortunatly, that target is also used when running `make clean`, so
> we need to ignore it in this case. $(MAKECMDGOALS) can't be used in
> this case as it is empty, but we can guess which operation is done by
> looking at the list of loaded makefiles.
> 
> Fixes: 7a3bcd2babcc ("build: build everything from the root dir, use obj=$subdir")
> Reported-by: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>   xen/xsm/flask/Makefile | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index d25312f4fa..2d24346ee3 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -16,7 +16,11 @@ FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
>   AV_H_FILES := av_perm_to_string.h av_permissions.h
>   ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
>   
> -$(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
> +# Adding prerequisite to descending into ss/ folder only when not running `make
> +# clean`.
> +ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
> +$(addprefix $(obj)/,$(obj-y)) $(obj)/ss: $(addprefix $(obj)/,$(ALL_H_FILES))
> +endif
>   extra-y += $(ALL_H_FILES)
>   
>   mkflask := $(srcdir)/policy/mkflask.sh

It builds for me, but I also do not have a large enough system to do a 
`-j16` to confirm it at the scale for which it occurred. Regardless, I 
will ack it.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

