Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A3768B7E9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 10:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490088.758670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOxNn-0001Eq-UG; Mon, 06 Feb 2023 09:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490088.758670; Mon, 06 Feb 2023 09:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOxNn-0001CB-R3; Mon, 06 Feb 2023 09:01:51 +0000
Received: by outflank-mailman (input) for mailman id 490088;
 Mon, 06 Feb 2023 09:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8JA=6C=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pOxNl-0001AF-E5
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 09:01:49 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0d5c33d-a5fc-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 10:01:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id E85752011C;
 Mon,  6 Feb 2023 10:01:43 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HoOi5yXqfWlB; Mon,  6 Feb 2023 10:01:43 +0100 (CET)
Received: from begin (unknown [89.207.171.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id EA0862010B;
 Mon,  6 Feb 2023 10:01:42 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pOxNb-008wtA-0r;
 Mon, 06 Feb 2023 10:01:39 +0100
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
X-Inumbo-ID: e0d5c33d-a5fc-11ed-93b5-47a8fe42b414
Date: Mon, 6 Feb 2023 10:01:39 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 4/7] Mini-OS: add 9pfs frontend
Message-ID: <20230206090139.ehvf2czoocn6j7nc@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203091809.14478-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 03 févr. 2023 10:18:06 +0100, a ecrit:
> +void *init_9pfront(unsigned int id, const char *mnt)
> +{
[...]
> +    free(xenbus_watch_path_token(XBT_NIL, bepath, bepath, &dev->events));

Better check for errors, otherwise the rest will hang without useful
feedback.

> +    for ( v = version; *v; v++ )
> +    {
> +        if ( strtoul(v, &v, 10) == 1 )
> +        {
> +            v = NULL;
> +            break;

This looks fragile? if version is "2.1" it will accept it apparently? I
guess better check whether strtoul did read a number, and in that case
break the loop anyway, successfully if the number is 1 and with failure
otherwise.

> +        }
> +    }
> +    free(version);
> +    if ( v )
> +    {
> +        reason = "version 1 not supported";
> +        goto err;
> +    }

This looks odd: when number 1 is detected this breaks out successfully,
while the error message otherwise says that it's version 1 which is not
supported? Is the message supposed to be "version greater than 1 not
supported"?

> + err:
> +    if ( bepath[0] )
> +        free(xenbus_unwatch_path_token(XBT_NIL, bepath, bepath));
> +    if ( msg )
> +        printk("9pfsfront add %u failed, error %s accessing Xenstore\n",
> +               id, msg);
> +    else
> +        printk("9pfsfront add %u failed, %s\n", id, reason);
> +    free_9pfront(dev);

In case of early errors, this will try to free uninitialized evtchn,
ring_ref, etc.

> +    free(msg);
> +    return NULL;
> +}

Samuel

