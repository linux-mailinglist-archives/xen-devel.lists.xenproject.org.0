Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AFD550463
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jun 2022 14:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351814.578557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2XKY-00072p-0K; Sat, 18 Jun 2022 12:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351814.578557; Sat, 18 Jun 2022 12:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2XKX-000713-Te; Sat, 18 Jun 2022 12:13:33 +0000
Received: by outflank-mailman (input) for mailman id 351814;
 Sat, 18 Jun 2022 12:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qCNw=WZ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1o2XKW-0006z2-2k
 for xen-devel@lists.xenproject.org; Sat, 18 Jun 2022 12:13:32 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1063b743-ef00-11ec-bd2d-47488cf2e6aa;
 Sat, 18 Jun 2022 14:13:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id A697D20157;
 Sat, 18 Jun 2022 14:13:28 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdh_QtE20XQS; Sat, 18 Jun 2022 14:13:28 +0200 (CEST)
Received: from begin (cerbere11.aquilenet.fr [185.233.102.190])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 7D6FB20154;
 Sat, 18 Jun 2022 14:13:28 +0200 (CEST)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1o2XKS-00BaWL-DO;
 Sat, 18 Jun 2022 14:13:28 +0200
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
X-Inumbo-ID: 1063b743-ef00-11ec-bd2d-47488cf2e6aa
Date: Sat, 18 Jun 2022 14:13:28 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 3/3] mini-os: fix number of pages for PVH
Message-ID: <20220618121328.54byw5ggucap6x5j@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220618104816.11527-1-jgross@suse.com>
 <20220618104816.11527-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618104816.11527-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Hello,

Juergen Gross, le sam. 18 juin 2022 12:48:16 +0200, a ecrit:
> @@ -124,7 +126,7 @@ void arch_mm_preinit(void *p)
>          do_exit();
>      }
>  
> -    last_free_pfn = e820_get_maxpfn(ret);
> +    last_free_pfn = e820_get_maxpfn(ret - e820_initial_reserved_pfns);

Mmm, but the reserved pfn could be in the middle of the e820 address
space.

Samuel

