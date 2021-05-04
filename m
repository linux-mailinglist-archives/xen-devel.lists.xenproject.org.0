Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA5372A9E
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122345.230741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduiN-0000L7-SP; Tue, 04 May 2021 13:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122345.230741; Tue, 04 May 2021 13:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduiN-0000Ke-PJ; Tue, 04 May 2021 13:03:51 +0000
Received: by outflank-mailman (input) for mailman id 122345;
 Tue, 04 May 2021 13:03:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1lduiM-0000Jn-NH
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:03:50 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dfb8e11-3890-4c33-9d0f-d3eadac30016;
 Tue, 04 May 2021 13:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id E9C72140;
 Tue,  4 May 2021 15:03:45 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ka3Jwbg04sll; Tue,  4 May 2021 15:03:45 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 0C8B2AF;
 Tue,  4 May 2021 15:03:44 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lduiF-00Fp58-VK; Tue, 04 May 2021 15:03:43 +0200
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
X-Inumbo-ID: 1dfb8e11-3890-4c33-9d0f-d3eadac30016
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 15:03:43 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 2/9] vtpmmgr: Print error code to aid debugging
Message-ID: <20210504130343.dwhvlewrphufjd7d@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-3-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504124842.220445-3-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: E9C72140
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

Jason Andryuk, le mar. 04 mai 2021 08:48:35 -0400, a ecrit:
> tpm_get_error_name returns "Unknown Error Code" when an error string
> is not defined.  In that case, we should print the Error Code so it can
> be looked up offline.  tpm_get_error_name returns a const string, so
> just have the two callers always print the error code so it is always
> available.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/tpm.c  | 2 +-
>  stubdom/vtpmmgr/tpm2.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/tpm.c b/stubdom/vtpmmgr/tpm.c
> index 779cddd64e..83b2bc16b2 100644
> --- a/stubdom/vtpmmgr/tpm.c
> +++ b/stubdom/vtpmmgr/tpm.c
> @@ -109,7 +109,7 @@
>  			UINT32 rsp_status; \
>  			UNPACK_OUT(TPM_RSP_HEADER, &rsp_tag, &rsp_len, &rsp_status); \
>  			if (rsp_status != TPM_SUCCESS) { \
> -				vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s\n", tpm_get_error_name(rsp_status)); \
> +				vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s (%x)\n", tpm_get_error_name(rsp_status), rsp_status); \
>  				status = rsp_status; \
>  				goto abort_egress; \
>  			} \
> diff --git a/stubdom/vtpmmgr/tpm2.c b/stubdom/vtpmmgr/tpm2.c
> index c9f1016ab5..655e6d164c 100644
> --- a/stubdom/vtpmmgr/tpm2.c
> +++ b/stubdom/vtpmmgr/tpm2.c
> @@ -126,7 +126,7 @@
>      ptr = unpack_TPM_RSP_HEADER(ptr, \
>            &(tag), &(paramSize), &(status));\
>      if ((status) != TPM_SUCCESS){ \
> -        vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s\n", tpm_get_error_name(status));\
> +        vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s (%x)\n", tpm_get_error_name(status), (status));\
>          goto abort_egress;\
>      }\
>  } while(0)
> -- 
> 2.30.2
> 

