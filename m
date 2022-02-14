Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0894B5379
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:39:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272379.467195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcUo-0006YL-JR; Mon, 14 Feb 2022 14:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272379.467195; Mon, 14 Feb 2022 14:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcUo-0006W9-GW; Mon, 14 Feb 2022 14:38:30 +0000
Received: by outflank-mailman (input) for mailman id 272379;
 Mon, 14 Feb 2022 14:38:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO+b=S5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nJcUm-0006W3-VP
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:38:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c47dd424-8da3-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 15:38:27 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1644849500356743.2670791339187;
 Mon, 14 Feb 2022 06:38:20 -0800 (PST)
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
X-Inumbo-ID: c47dd424-8da3-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; t=1644849503; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OFyle/9yJTqW69R57Cyruh4yjQXrICtVXzm2duXfTQmH0Ptg79k77xA/LdfsTw4qv9qAJ6AMQbrjGCl4I3Tadh4XIKLWEwqFFK40Cpxc9ISxtI/V7Rp9GwYXAI7aqCkuqe8zBmAFFs5CBxx+qUIm63mvLG+dB4qedo6fpKpGpkA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1644849503; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=YG491Nbb34JgRxwbYnH31xBaKwX7aA4GlBqr7Vr8GQY=; 
	b=R3uMJ/is1SZj0JCN56LiVp/1bw4lqIOrhcasVjfVlL/ra5a5pem5kb9jPoZlgIiSdaFkC+dc6IxUjMpzvAGMPeP0l8UN1Ma6vY83zaJ/RsgRhUrSDtmmba5QzoTbpvIfvbe3LTyRPI061tbK8UZ4qZEy1yy92Pqi5SekCCV/BNk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1644849503;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=YG491Nbb34JgRxwbYnH31xBaKwX7aA4GlBqr7Vr8GQY=;
	b=nIJr8jJpnLziW7xJ/d0SVcu+evfGtH1I6VCJa6tMwRxT4OuZqBKht1jDQS0TxSCX
	1bcyWGbkYCzJNl84A9He4rNJ2ayEbKxuIjmEdHMIUKk+3c3ihELrOHzAdgJuLk6TSPO
	hwhcnRkDmai8hHpHQusMYavr32vidxMqLL01g36o=
Message-ID: <8b493d22-9b07-8ecb-3579-53f50227ee12@apertussolutions.com>
Date: Mon, 14 Feb 2022 09:36:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 03/70] xen/xsm: Move {do,compat}_flask_op()
 declarations into a header
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-4-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220214125127.17985-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/14/22 07:50, Andrew Cooper wrote:
> Declaring sideways like this is unsafe, because the compiler can't check that
> the implementaton in flask_op.c still has the same type.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> 
> v2:
>  * Rework in the face of no useful progress on the better fix.
> ---
>  xen/xsm/flask/flask_op.c | 1 +
>  xen/xsm/flask/hooks.c    | 4 +---
>  xen/xsm/flask/private.h  | 9 +++++++++
>  3 files changed, 11 insertions(+), 3 deletions(-)
>  create mode 100644 xen/xsm/flask/private.h
> 
> diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
> index 221ff00fd3cc..bb3bebc30e01 100644
> --- a/xen/xsm/flask/flask_op.c
> +++ b/xen/xsm/flask/flask_op.c
> @@ -21,6 +21,7 @@
>  #include <avc_ss.h>
>  #include <objsec.h>
>  #include <conditional.h>
> +#include "private.h"
>  
>  #define ret_t long
>  #define _copy_to_guest copy_to_guest
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 3b29f7fde372..6ff1be28e4a4 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -36,6 +36,7 @@
>  #include <avc_ss.h>
>  #include <objsec.h>
>  #include <conditional.h>
> +#include "private.h"
>  
>  static u32 domain_sid(const struct domain *dom)
>  {
> @@ -1742,9 +1743,6 @@ static int flask_argo_send(const struct domain *d, const struct domain *t)
>  
>  #endif
>  
> -long do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
> -int compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
> -
>  static const struct xsm_ops __initconstrel flask_ops = {
>      .security_domaininfo = flask_security_domaininfo,
>      .domain_create = flask_domain_create,
> diff --git a/xen/xsm/flask/private.h b/xen/xsm/flask/private.h
> new file mode 100644
> index 000000000000..73b0de87245a
> --- /dev/null
> +++ b/xen/xsm/flask/private.h
> @@ -0,0 +1,9 @@
> +#ifndef XSM_FLASK_PRIVATE
> +#define XSM_FLASK_PRIVATE
> +
> +#include <public/xen.h>
> +
> +long do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
> +int compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
> +
> +#endif /* XSM_FLASK_PRIVATE */

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>


