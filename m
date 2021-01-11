Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14D12F1D74
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 19:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65321.115725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1aJ-00011M-Ta; Mon, 11 Jan 2021 18:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65321.115725; Mon, 11 Jan 2021 18:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1aJ-00010w-QF; Mon, 11 Jan 2021 18:06:31 +0000
Received: by outflank-mailman (input) for mailman id 65321;
 Mon, 11 Jan 2021 18:06:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lUW4=GO=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1kz1aI-00010r-77
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 18:06:30 +0000
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dd7ceb7-8090-496f-bf3c-6ddda1c2544d;
 Mon, 11 Jan 2021 18:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 61DCF450;
 Mon, 11 Jan 2021 19:06:26 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VTWAye_pr_kn; Mon, 11 Jan 2021 19:06:25 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 7C80E112;
 Mon, 11 Jan 2021 19:06:25 +0100 (CET)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1kz1aB-002EbD-Uj; Mon, 11 Jan 2021 19:06:23 +0100
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
X-Inumbo-ID: 8dd7ceb7-8090-496f-bf3c-6ddda1c2544d
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Mon, 11 Jan 2021 19:06:23 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH v20210111 01/39] stubdom: fix tpm_version
Message-ID: <20210111180623.7dfzykss6mcz6hkd@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210111174224.24714-1-olaf@aepfle.de>
 <20210111174224.24714-2-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111174224.24714-2-olaf@aepfle.de>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 61DCF450
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
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Olaf Hering, le lun. 11 janv. 2021 18:41:46 +0100, a ecrit:
> It is just a declaration, not a variable.
> 
> ld: /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpm_cmd_handler.o):(.bss+0x0): multiple definition of `tpm_version'; /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpmmgr.o):(.bss+0x0): first defined here
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/vtpmmgr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubdom/vtpmmgr/vtpmmgr.h b/stubdom/vtpmmgr/vtpmmgr.h
> index 2e6f8de9e4..f40ca9fd67 100644
> --- a/stubdom/vtpmmgr/vtpmmgr.h
> +++ b/stubdom/vtpmmgr/vtpmmgr.h
> @@ -53,7 +53,7 @@
>  enum {
>      TPM1_HARDWARE = 1,
>      TPM2_HARDWARE,
> -} tpm_version;
> +};
>  
>  struct tpm_hardware_version {
>      int hw_version;
> 


