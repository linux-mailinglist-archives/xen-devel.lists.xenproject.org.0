Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE817377365
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 19:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124392.234683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfQpy-0005ze-EO; Sat, 08 May 2021 17:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124392.234683; Sat, 08 May 2021 17:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfQpy-0005wb-At; Sat, 08 May 2021 17:33:58 +0000
Received: by outflank-mailman (input) for mailman id 124392;
 Sat, 08 May 2021 17:33:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wEz=KD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1lfQpx-0005wP-1q
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 17:33:57 +0000
Received: from sonata.ens-lyon.org (unknown [140.77.166.138])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c563adcd-48fa-48a0-9146-944e56fd711e;
 Sat, 08 May 2021 17:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id EC72B201A6;
 Sat,  8 May 2021 13:34:51 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7WusLwhDq2v; Sat,  8 May 2021 13:34:51 +0200 (CEST)
Received: from begin (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id CD0EC201A5;
 Sat,  8 May 2021 13:34:51 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lfLER-00BM8R-90; Sat, 08 May 2021 13:34:51 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Sat, 8 May 2021 13:34:51 +0200
Resent-Message-ID: <20210508113451.l7byctvejcxw3ab4@begin>
Resent-To: jandryuk@gmail.com, xen-devel@lists.xenproject.org,
 dgdegra@tycho.nsa.gov, quan.xu0@gmail.com
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
X-Inumbo-ID: c563adcd-48fa-48a0-9146-944e56fd711e
Date: Thu, 6 May 2021 23:41:54 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH v2 11/13] vtpmmgr: Fix owner_auth & srk_auth parsing
Message-ID: <20210506214154.ssot4jwf64k22wth@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-12-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506135923.161427-12-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jason Andryuk, le jeu. 06 mai 2021 09:59:21 -0400, a ecrit:
> Argument parsing only matches to before ':' and then the string with
> leading ':' is passed to parse_auth_string which fails to parse.  Extend
> the length to include the seperator in the match.
> 
> While here, switch the seperator to "=".  The man page documented "="
> and the other tpm.* arguments already use "=".  Since it didn't work
> before, we don't need to worry about backwards compatibility.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/init.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index 4ae34a4fcb..62dc5994de 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -289,16 +289,16 @@ int parse_cmdline_opts(int argc, char** argv, struct Opts* opts)
>     memcpy(vtpm_globals.srk_auth, WELLKNOWN_AUTH, sizeof(TPM_AUTHDATA));
>  
>     for(i = 1; i < argc; ++i) {
> -      if(!strncmp(argv[i], "owner_auth:", 10)) {
> -         if((rc = parse_auth_string(argv[i] + 10, vtpm_globals.owner_auth)) < 0) {
> +      if(!strncmp(argv[i], "owner_auth=", 11)) {
> +         if((rc = parse_auth_string(argv[i] + 11, vtpm_globals.owner_auth)) < 0) {
>              goto err_invalid;
>           }
>           if(rc == 1) {
>              opts->gen_owner_auth = 1;
>           }
>        }
> -      else if(!strncmp(argv[i], "srk_auth:", 8)) {
> -         if((rc = parse_auth_string(argv[i] + 8, vtpm_globals.srk_auth)) != 0) {
> +      else if(!strncmp(argv[i], "srk_auth=", 9)) {
> +         if((rc = parse_auth_string(argv[i] + 9, vtpm_globals.srk_auth)) != 0) {
>              goto err_invalid;
>           }
>        }
> -- 
> 2.30.2
> 

-- 
Samuel
c> ah (on trouve fluide glacial sur le net, ou il faut aller dans le monde reel ?)
s> dans le monde reel
c> zut

