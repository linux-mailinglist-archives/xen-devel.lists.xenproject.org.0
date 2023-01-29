Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A36800F5
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jan 2023 19:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486409.753756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMCkc-0000H6-Ob; Sun, 29 Jan 2023 18:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486409.753756; Sun, 29 Jan 2023 18:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMCkc-0000C6-Kj; Sun, 29 Jan 2023 18:50:02 +0000
Received: by outflank-mailman (input) for mailman id 486409;
 Sun, 29 Jan 2023 18:50:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=As8j=52=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pMCkb-00007Y-1L
 for xen-devel@lists.xenproject.org; Sun, 29 Jan 2023 18:50:01 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b84e0226-a005-11ed-b8d1-410ff93cb8f0;
 Sun, 29 Jan 2023 19:49:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 4D6B2200FB;
 Sun, 29 Jan 2023 19:49:54 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AaagANKtKKu; Sun, 29 Jan 2023 19:49:54 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 0289A200F9;
 Sun, 29 Jan 2023 19:49:53 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pMCkT-000G6W-1i;
 Sun, 29 Jan 2023 19:49:53 +0100
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
X-Inumbo-ID: b84e0226-a005-11ed-b8d1-410ff93cb8f0
Date: Sun, 29 Jan 2023 19:49:53 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] Mini-OS: move xenbus test code into test.c
Message-ID: <20230129184953.lcfdp23l6pp42c3l@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230127073346.6992-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230127073346.6992-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 27 janv. 2023 08:33:46 +0100, a ecrit:
> The test code in xenbus.c can easily be moved into test.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  test.c   | 108 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  xenbus.c | 113 -------------------------------------------------------
>  2 files changed, 106 insertions(+), 115 deletions(-)
> 
> diff --git a/test.c b/test.c
> index 42a26661..465c54e8 100644
> --- a/test.c
> +++ b/test.c
> @@ -44,6 +44,7 @@
>  #include <fcntl.h>
>  #include <xen/features.h>
>  #include <xen/version.h>
> +#include <xen/io/xs_wire.h>
>  
>  #ifdef CONFIG_XENBUS
>  static unsigned int do_shutdown = 0;
> @@ -52,11 +53,114 @@ static DECLARE_WAIT_QUEUE_HEAD(shutdown_queue);
>  #endif
>  
>  #ifdef CONFIG_XENBUS
> -void test_xenbus(void);
> +/* Send a debug message to xenbus.  Can block. */
> +static void xenbus_debug_msg(const char *msg)
> +{
> +    int len = strlen(msg);
> +    struct write_req req[] = {
> +        { "print", sizeof("print") },
> +        { msg, len },
> +        { "", 1 }};
> +    struct xsd_sockmsg *reply;
> +
> +    reply = xenbus_msg_reply(XS_DEBUG, 0, req, ARRAY_SIZE(req));
> +    printk("Got a reply, type %d, id %d, len %d.\n",
> +           reply->type, reply->req_id, reply->len);
> +}
> +
> +static void do_ls_test(const char *pre)
> +{
> +    char **dirs, *msg;
> +    int x;
> +
> +    printk("ls %s...\n", pre);
> +    msg = xenbus_ls(XBT_NIL, pre, &dirs);
> +    if ( msg )
> +    {
> +        printk("Error in xenbus ls: %s\n", msg);
> +        free(msg);
> +        return;
> +    }
> +
> +    for ( x = 0; dirs[x]; x++ )
> +    {
> +        printk("ls %s[%d] -> %s\n", pre, x, dirs[x]);
> +        free(dirs[x]);
> +    }
> +
> +    free(dirs);
> +}
> +
> +static void do_read_test(const char *path)
> +{
> +    char *res, *msg;
> +
> +    printk("Read %s...\n", path);
> +    msg = xenbus_read(XBT_NIL, path, &res);
> +    if ( msg )
> +    {
> +        printk("Error in xenbus read: %s\n", msg);
> +        free(msg);
> +        return;
> +    }
> +    printk("Read %s -> %s.\n", path, res);
> +    free(res);
> +}
> +
> +static void do_write_test(const char *path, const char *val)
> +{
> +    char *msg;
> +
> +    printk("Write %s to %s...\n", val, path);
> +    msg = xenbus_write(XBT_NIL, path, val);
> +    if ( msg )
> +    {
> +        printk("Result %s\n", msg);
> +        free(msg);
> +    }
> +    else
> +        printk("Success.\n");
> +}
> +
> +static void do_rm_test(const char *path)
> +{
> +    char *msg;
> +
> +    printk("rm %s...\n", path);
> +    msg = xenbus_rm(XBT_NIL, path);
> +    if ( msg )
> +    {
> +        printk("Result %s\n", msg);
> +        free(msg);
> +    }
> +    else
> +        printk("Success.\n");
> +}
>  
>  static void xenbus_tester(void *p)
>  {
> -    test_xenbus();
> +    printk("Doing xenbus test.\n");
> +    xenbus_debug_msg("Testing xenbus...\n");
> +
> +    printk("Doing ls test.\n");
> +    do_ls_test("device");
> +    do_ls_test("device/vif");
> +    do_ls_test("device/vif/0");
> +
> +    printk("Doing read test.\n");
> +    do_read_test("device/vif/0/mac");
> +    do_read_test("device/vif/0/backend");
> +
> +    printk("Doing write test.\n");
> +    do_write_test("device/vif/0/flibble", "flobble");
> +    do_read_test("device/vif/0/flibble");
> +    do_write_test("device/vif/0/flibble", "widget");
> +    do_read_test("device/vif/0/flibble");
> +
> +    printk("Doing rm test.\n");
> +    do_rm_test("device/vif/0/flibble");
> +    do_read_test("device/vif/0/flibble");
> +    printk("(Should have said ENOENT)\n");
>  }
>  #endif
>  
> diff --git a/xenbus.c b/xenbus.c
> index aa1fe7bf..81e9b65d 100644
> --- a/xenbus.c
> +++ b/xenbus.c
> @@ -964,119 +964,6 @@ domid_t xenbus_get_self_id(void)
>      return ret;
>  }
>  
> -#ifdef CONFIG_TEST
> -/* Send a debug message to xenbus.  Can block. */
> -static void xenbus_debug_msg(const char *msg)
> -{
> -    int len = strlen(msg);
> -    struct write_req req[] = {
> -        { "print", sizeof("print") },
> -        { msg, len },
> -        { "", 1 }};
> -    struct xsd_sockmsg *reply;
> -
> -    reply = xenbus_msg_reply(XS_DEBUG, 0, req, ARRAY_SIZE(req));
> -    printk("Got a reply, type %d, id %d, len %d.\n",
> -           reply->type, reply->req_id, reply->len);
> -}
> -
> -static void do_ls_test(const char *pre)
> -{
> -    char **dirs, *msg;
> -    int x;
> -
> -    printk("ls %s...\n", pre);
> -    msg = xenbus_ls(XBT_NIL, pre, &dirs);
> -    if ( msg )
> -    {
> -        printk("Error in xenbus ls: %s\n", msg);
> -        free(msg);
> -        return;
> -    }
> -
> -    for ( x = 0; dirs[x]; x++ )
> -    {
> -        printk("ls %s[%d] -> %s\n", pre, x, dirs[x]);
> -        free(dirs[x]);
> -    }
> -
> -    free(dirs);
> -}
> -
> -static void do_read_test(const char *path)
> -{
> -    char *res, *msg;
> -
> -    printk("Read %s...\n", path);
> -    msg = xenbus_read(XBT_NIL, path, &res);
> -    if ( msg )
> -    {
> -        printk("Error in xenbus read: %s\n", msg);
> -        free(msg);
> -        return;
> -    }
> -    printk("Read %s -> %s.\n", path, res);
> -    free(res);
> -}
> -
> -static void do_write_test(const char *path, const char *val)
> -{
> -    char *msg;
> -
> -    printk("Write %s to %s...\n", val, path);
> -    msg = xenbus_write(XBT_NIL, path, val);
> -    if ( msg )
> -    {
> -        printk("Result %s\n", msg);
> -        free(msg);
> -    }
> -    else
> -        printk("Success.\n");
> -}
> -
> -static void do_rm_test(const char *path)
> -{
> -    char *msg;
> -
> -    printk("rm %s...\n", path);
> -    msg = xenbus_rm(XBT_NIL, path);
> -    if ( msg )
> -    {
> -        printk("Result %s\n", msg);
> -        free(msg);
> -    }
> -    else
> -        printk("Success.\n");
> -}
> -
> -/* Simple testing thing */
> -void test_xenbus(void)
> -{
> -    printk("Doing xenbus test.\n");
> -    xenbus_debug_msg("Testing xenbus...\n");
> -
> -    printk("Doing ls test.\n");
> -    do_ls_test("device");
> -    do_ls_test("device/vif");
> -    do_ls_test("device/vif/0");
> -
> -    printk("Doing read test.\n");
> -    do_read_test("device/vif/0/mac");
> -    do_read_test("device/vif/0/backend");
> -
> -    printk("Doing write test.\n");
> -    do_write_test("device/vif/0/flibble", "flobble");
> -    do_read_test("device/vif/0/flibble");
> -    do_write_test("device/vif/0/flibble", "widget");
> -    do_read_test("device/vif/0/flibble");
> -
> -    printk("Doing rm test.\n");
> -    do_rm_test("device/vif/0/flibble");
> -    do_read_test("device/vif/0/flibble");
> -    printk("(Should have said ENOENT)\n");
> -}
> -#endif /* CONFIG_TEST */
> -
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

