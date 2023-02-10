Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFF26925D3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 19:54:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493584.763581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYWd-0006O6-GA; Fri, 10 Feb 2023 18:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493584.763581; Fri, 10 Feb 2023 18:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYWd-0006Jr-DK; Fri, 10 Feb 2023 18:53:35 +0000
Received: by outflank-mailman (input) for mailman id 493584;
 Fri, 10 Feb 2023 18:53:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qATP=6G=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pQYWb-0006J4-QO
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 18:53:33 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 355a1b2a-a974-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 19:53:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 51E1320162;
 Fri, 10 Feb 2023 19:53:29 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qNXIv7BGRAa; Fri, 10 Feb 2023 19:53:29 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 2AD872015E;
 Fri, 10 Feb 2023 19:53:29 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pQYWW-006gXg-2V;
 Fri, 10 Feb 2023 19:53:28 +0100
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
X-Inumbo-ID: 355a1b2a-a974-11ed-93b5-47a8fe42b414
Date: Fri, 10 Feb 2023 19:53:28 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 6/7] Mini-OS: add open and close handling to the 9pfs
 frontend
Message-ID: <20230210185328.2zqo5xvklpke3ie2@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210104628.14374-7-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 10 févr. 2023 11:46:27 +0100, a ecrit:
> +static bool path_canonical(const char *pathname)
> +{
> +    unsigned int len = strlen(pathname);
> +    const char *c;
> +
> +    /* Empty path is allowed. */
> +    if ( !len )
> +        return true;
> +
> +    /* No trailing '/'. */
> +    if ( pathname[len - 1] == '/' )
> +        return false;
> +
> +    /* No self or parent references. */
> +    c = pathname;
> +    while ( (c = strstr(c, "/.")) != NULL )
> +    {
> +        if ( c[2] == '.' )
> +            c++;
> +        if ( c[2] == 0 || c[2] == '/' )
> +            return false;
> +        c += 2;
> +    }
> +
> +    return true;
> +}

This doesn't seem to be catching "//"?

Samuel

