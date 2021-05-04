Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CC5372ABF
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122370.230802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldutd-0001lQ-4i; Tue, 04 May 2021 13:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122370.230802; Tue, 04 May 2021 13:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldutd-0001l0-0n; Tue, 04 May 2021 13:15:29 +0000
Received: by outflank-mailman (input) for mailman id 122370;
 Tue, 04 May 2021 13:15:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1ldutc-0001ks-25
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:15:28 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46662dda-9f14-4d1b-bc15-399849c508a0;
 Tue, 04 May 2021 13:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 6C3D4237;
 Tue,  4 May 2021 15:15:26 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rooe7fDGSXGH; Tue,  4 May 2021 15:15:25 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 717481E8;
 Tue,  4 May 2021 15:15:25 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1ldutY-00FpXJ-Ka; Tue, 04 May 2021 15:15:24 +0200
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
X-Inumbo-ID: 46662dda-9f14-4d1b-bc15-399849c508a0
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 15:15:24 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 6/9] vtpmmgr: Flush transient keys on shutdown
Message-ID: <20210504131524.5emfxq2eykdjj6av@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-7-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504124842.220445-7-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 6C3D4237
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

Jason Andryuk, le mar. 04 mai 2021 08:48:39 -0400, a ecrit:
> Remove our key so it isn't left in the TPM for someone to come along
> after vtpmmgr shutsdown.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/init.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index 569b0dd1dc..d9fefa9be6 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -792,6 +792,14 @@ void vtpmmgr_shutdown(void)
>     /* Close tpmback */
>     shutdown_tpmback();
>  
> +    if (hw_is_tpm2()) {
> +        /* Blow away all stale handles left in the tpm*/
> +        if (flush_tpm2() != TPM_SUCCESS) {
> +            vtpmlogerror(VTPM_LOG_TPM,
> +                         "TPM2_FlushResources failed, continuing shutdown..\n");
> +        }
> +    }
> +
>     /* Close tpmfront/tpm_tis */
>     close(vtpm_globals.tpm_fd);
>  
> -- 
> 2.30.2
> 

