Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B252692593
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 19:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493526.763491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYNH-0001Ve-P2; Fri, 10 Feb 2023 18:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493526.763491; Fri, 10 Feb 2023 18:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYNH-0001Tp-LU; Fri, 10 Feb 2023 18:43:55 +0000
Received: by outflank-mailman (input) for mailman id 493526;
 Fri, 10 Feb 2023 18:43:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qATP=6G=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pQYNF-0001Te-GE
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 18:43:53 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbbb633f-a972-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 19:43:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 6A2A62015E;
 Fri, 10 Feb 2023 19:43:49 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UulWY7rJiZS1; Fri, 10 Feb 2023 19:43:49 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 1FD4C20152;
 Fri, 10 Feb 2023 19:43:49 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pQYNA-006gMI-2V;
 Fri, 10 Feb 2023 19:43:48 +0100
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
X-Inumbo-ID: dbbb633f-a972-11ed-93b5-47a8fe42b414
Date: Fri, 10 Feb 2023 19:43:48 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 1/7] Mini-OS: xenbus: add support for reading node
 from directory
Message-ID: <20230210184348.mbbxhuroralr7q64@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210104628.14374-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 10 févr. 2023 11:46:22 +0100, a ecrit:
> Especially PV device drivers often need to read multiple Xenstore
> nodes from a common directory. Add support for reading a string or an
> unsigned value by specifying the directory and the node.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - check sscanf() return value (Samuel Thibault)
> ---
>  include/xenbus.h |  6 ++++++
>  xenbus.c         | 40 +++++++++++++++++++++++++++++++++++++---
>  2 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/include/xenbus.h b/include/xenbus.h
> index 3871f358..c0fc0ac5 100644
> --- a/include/xenbus.h
> +++ b/include/xenbus.h
> @@ -108,6 +108,12 @@ int xenbus_read_integer(const char *path);
>   * read and parsing were successful, 0 if not */
>  int xenbus_read_uuid(const char* path, unsigned char uuid[16]);
>  
> +/* Support functions for reading values from directory/node tuple. */
> +char *xenbus_read_string(xenbus_transaction_t xbt, const char *dir,
> +                         const char *node, char **value);
> +char *xenbus_read_unsigned(xenbus_transaction_t xbt, const char *dir,
> +                           const char *node, unsigned int *value);
> +
>  /* Contraction of snprintf and xenbus_write(path/node). */
>  char* xenbus_printf(xenbus_transaction_t xbt,
>                                    const char* node, const char* path,
> diff --git a/xenbus.c b/xenbus.c
> index 81e9b65d..923e8181 100644
> --- a/xenbus.c
> +++ b/xenbus.c
> @@ -936,16 +936,21 @@ int xenbus_read_uuid(const char *path, unsigned char uuid[16])
>      return 1;
>  }
>  
> +#define BUFFER_SIZE 256
> +static void xenbus_build_path(const char *dir, const char *node, char *res)
> +{
> +    BUG_ON(strlen(dir) + strlen(node) + 1 >= BUFFER_SIZE);
> +    sprintf(res,"%s/%s", dir, node);
> +}
> +
>  char *xenbus_printf(xenbus_transaction_t xbt, const char* node,
>                      const char* path, const char* fmt, ...)
>  {
> -#define BUFFER_SIZE 256
>      char fullpath[BUFFER_SIZE];
>      char val[BUFFER_SIZE];
>      va_list args;
>  
> -    BUG_ON(strlen(node) + strlen(path) + 1 >= BUFFER_SIZE);
> -    sprintf(fullpath,"%s/%s", node, path);
> +    xenbus_build_path(node, path, fullpath);
>      va_start(args, fmt);
>      vsprintf(val, fmt, args);
>      va_end(args);
> @@ -964,6 +969,35 @@ domid_t xenbus_get_self_id(void)
>      return ret;
>  }
>  
> +char *xenbus_read_string(xenbus_transaction_t xbt, const char *dir,
> +                         const char *node, char **value)
> +{
> +    char path[BUFFER_SIZE];
> +
> +    xenbus_build_path(dir, node, path);
> +
> +    return xenbus_read(xbt, path, value);
> +}
> +
> +char *xenbus_read_unsigned(xenbus_transaction_t xbt, const char *dir,
> +                           const char *node, unsigned int *value)
> +{
> +    char path[BUFFER_SIZE];
> +    char *msg;
> +    char *str;
> +
> +    xenbus_build_path(dir, node, path);
> +    msg = xenbus_read(xbt, path, &str);
> +    if ( msg )
> +        return msg;
> +
> +    if ( sscanf(str, "%u", value) != 1 )
> +        msg = strdup("EINVAL");
> +    free(str);
> +
> +    return msg;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

