Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9F1372ABD
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122367.230789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldusd-0001dL-Pz; Tue, 04 May 2021 13:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122367.230789; Tue, 04 May 2021 13:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldusd-0001cy-Mz; Tue, 04 May 2021 13:14:27 +0000
Received: by outflank-mailman (input) for mailman id 122367;
 Tue, 04 May 2021 13:14:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1ldusc-0001cq-Nz
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:14:26 +0000
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9020e9be-d7b3-485b-bff9-8b16bd45550e;
 Tue, 04 May 2021 13:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 0CFDF319;
 Tue,  4 May 2021 15:14:25 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3U7TsUZRm3T1; Tue,  4 May 2021 15:14:24 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 30AE4301;
 Tue,  4 May 2021 15:14:24 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1ldusZ-00FpWx-8n; Tue, 04 May 2021 15:14:23 +0200
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
X-Inumbo-ID: 9020e9be-d7b3-485b-bff9-8b16bd45550e
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 15:14:23 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 5/9] vtpmmgr: Move vtpmmgr_shutdown
Message-ID: <20210504131423.52sqzrnn3yu34r2u@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-6-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504124842.220445-6-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 0CFDF319
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Jason Andryuk, le mar. 04 mai 2021 08:48:38 -0400, a ecrit:
> Reposition vtpmmgr_shutdown so it can call flush_tpm2 without a forward
> declaration.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/init.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index c01d03e9f4..569b0dd1dc 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -503,20 +503,6 @@ egress:
>     return status;
>  }
>  
> -void vtpmmgr_shutdown(void)
> -{
> -   /* Cleanup TPM resources */
> -   TPM_TerminateHandle(vtpm_globals.oiap.AuthHandle);
> -
> -   /* Close tpmback */
> -   shutdown_tpmback();
> -
> -   /* Close tpmfront/tpm_tis */
> -   close(vtpm_globals.tpm_fd);
> -
> -   vtpmloginfo(VTPM_LOG_VTPM, "VTPM Manager stopped.\n");
> -}
> -
>  /* TPM 2.0 */
>  
>  static void tpm2_AuthArea_ctor(const char *authValue, UINT32 authLen,
> @@ -797,3 +783,17 @@ abort_egress:
>  egress:
>      return status;
>  }
> +
> +void vtpmmgr_shutdown(void)
> +{
> +   /* Cleanup TPM resources */
> +   TPM_TerminateHandle(vtpm_globals.oiap.AuthHandle);
> +
> +   /* Close tpmback */
> +   shutdown_tpmback();
> +
> +   /* Close tpmfront/tpm_tis */
> +   close(vtpm_globals.tpm_fd);
> +
> +   vtpmloginfo(VTPM_LOG_VTPM, "VTPM Manager stopped.\n");
> +}
> -- 
> 2.30.2
> 

