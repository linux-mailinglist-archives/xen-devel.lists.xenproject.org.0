Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A953771AE
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 14:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124296.234587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfLzy-00083n-3z; Sat, 08 May 2021 12:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124296.234587; Sat, 08 May 2021 12:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfLzy-00081Z-0R; Sat, 08 May 2021 12:23:58 +0000
Received: by outflank-mailman (input) for mailman id 124296;
 Sat, 08 May 2021 12:23:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wEz=KD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1lfLzx-00081N-1V
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 12:23:57 +0000
Received: from sonata.ens-lyon.org (unknown [140.77.166.138])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ec5bebd-6b78-4268-a098-437666b28ae0;
 Sat, 08 May 2021 12:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id D2D8C201B0;
 Sat,  8 May 2021 13:44:05 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qla649ug3nDo; Sat,  8 May 2021 13:44:05 +0200 (CEST)
Received: from begin (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id B2625201AE;
 Sat,  8 May 2021 13:44:05 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lfLNN-00BMUY-6T; Sat, 08 May 2021 13:44:05 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Sat, 8 May 2021 13:44:05 +0200
Resent-Message-ID: <20210508114405.vo7inlbci2iwcjqo@begin>
Resent-To: jandryuk@gmail.com, xen-devel@lists.xenproject.org,
 dgdegra@tycho.nsa.gov, quan.xu0@gmail.com
Received: from samy by begin with local (Exim 4.94.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lellQ-006BIt-J4; Thu, 06 May 2021 23:42:32 +0200
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
X-Inumbo-ID: 2ec5bebd-6b78-4268-a098-437666b28ae0
Date: Thu, 6 May 2021 23:42:32 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH v2 12/13] vtpmmgr: Check req_len before unpacking command
Message-ID: <20210506214232.qv6ft4giyfoujsie@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-13-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506135923.161427-13-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jason Andryuk, le jeu. 06 mai 2021 09:59:22 -0400, a ecrit:
> vtpm_handle_cmd doesn't ensure there is enough space before unpacking
> the req buffer.  Add a minimum size check.  Called functions will have
> to do their own checking if they need more data from the request.
> 
> The error case is tricky since abort_egress wants to rely with a
> corresponding tag.  Just hardcode TPM_TAG_RQU_COMMAND since the vtpm is
> sending in malformed commands in the first place.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/vtpm_cmd_handler.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/stubdom/vtpmmgr/vtpm_cmd_handler.c b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> index c879b24c13..5586be6997 100644
> --- a/stubdom/vtpmmgr/vtpm_cmd_handler.c
> +++ b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> @@ -840,6 +840,12 @@ TPM_RESULT vtpmmgr_handle_cmd(
>  	UINT32 size;
>  	TPM_COMMAND_CODE ord;
>  
> +	if (tpmcmd->req_len < sizeof_TPM_RQU_HEADER(tpmcmd->req)) {
> +		status = TPM_BAD_PARAMETER;
> +		tag = TPM_TAG_RQU_COMMAND;
> +		goto abort_egress;
> +	}
> +
>  	unpack_TPM_RQU_HEADER(tpmcmd->req,
>  			&tag, &size, &ord);
>  
> -- 
> 2.30.2
> 

-- 
Samuel
j'etais en train de nettoyer ma souris et le coup est parti...
 -+- s sur #ens-mim - et en plus c vrai... -+-

