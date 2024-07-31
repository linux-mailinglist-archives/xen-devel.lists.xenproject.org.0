Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5F9437FD
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 23:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769099.1179986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZGrV-0002qT-Ij; Wed, 31 Jul 2024 21:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769099.1179986; Wed, 31 Jul 2024 21:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZGrV-0002ni-Fw; Wed, 31 Jul 2024 21:27:57 +0000
Received: by outflank-mailman (input) for mailman id 769099;
 Wed, 31 Jul 2024 21:27:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8eAs=O7=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sZGrU-0002nc-US
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 21:27:56 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bef3cc30-4f83-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 23:27:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 5335FA02F7;
 Wed, 31 Jul 2024 23:27:53 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Iz8zjDtMuoK; Wed, 31 Jul 2024 23:27:53 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 16AB0A02F3;
 Wed, 31 Jul 2024 23:27:53 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sZGrQ-0000000AtAZ-2sPc; Wed, 31 Jul 2024 23:27:52 +0200
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
X-Inumbo-ID: bef3cc30-4f83-11ef-8776-851b0ebba9a2
Date: Wed, 31 Jul 2024 23:27:52 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/3] mini-os: mm: switch need_pgt() to use walk_pt()
Message-ID: <20240731212752.zd5njpd7kgoc433d@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731130026.8467-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Hello,

Juergen Gross, le mer. 31 juil. 2024 15:00:25 +0200, a ecrit:
> -pgentry_t *need_pgt(unsigned long va)
> +static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
> +                         pgentry_t *pte, void *par)
>  {
[...]
> +    if ( lvl == L1_FRAME || (*pte & _PAGE_PRESENT) )

Did you mean (*pte & _PAGE_PSE)?

>      {
> +        *result = pte;
> +        return 1;
>      }

Samuel

