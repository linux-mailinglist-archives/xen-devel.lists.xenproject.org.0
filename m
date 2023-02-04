Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82568AA79
	for <lists+xen-devel@lfdr.de>; Sat,  4 Feb 2023 15:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489531.757864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOJ77-0007R0-Pd; Sat, 04 Feb 2023 14:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489531.757864; Sat, 04 Feb 2023 14:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOJ77-0007Nq-Ld; Sat, 04 Feb 2023 14:01:57 +0000
Received: by outflank-mailman (input) for mailman id 489531;
 Sat, 04 Feb 2023 14:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OLSf=6A=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pOJ75-0007Lb-Q9
 for xen-devel@lists.xenproject.org; Sat, 04 Feb 2023 14:01:55 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78c5f178-a494-11ed-93b5-47a8fe42b414;
 Sat, 04 Feb 2023 15:01:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 7875120150;
 Sat,  4 Feb 2023 15:01:50 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxk5DFMxO5AT; Sat,  4 Feb 2023 15:01:49 +0100 (CET)
Received: from begin (unknown [164.15.244.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 2BB2620135;
 Sat,  4 Feb 2023 15:01:49 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pOJ6y-0003Pd-2J;
 Sat, 04 Feb 2023 15:01:48 +0100
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
X-Inumbo-ID: 78c5f178-a494-11ed-93b5-47a8fe42b414
Date: Sat, 4 Feb 2023 15:01:48 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/7] Mini-OS: xenbus: add support for reading node from
 directory
Message-ID: <20230204140148.pmhv2vnsb7ejobji@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203091809.14478-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Hello,

Juergen Gross, le ven. 03 févr. 2023 10:18:03 +0100, a ecrit:
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
> +    sscanf(str, "%u", value);

I'd say better check that sscanf returned 1 and otherwise return an
error. Otherwise *value may end up uninitialized.

> +    free(str);
> +
> +    return NULL;
> +}

