Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ECE943807
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 23:33:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769113.1180003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZGwf-0004QQ-89; Wed, 31 Jul 2024 21:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769113.1180003; Wed, 31 Jul 2024 21:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZGwf-0004Ok-5D; Wed, 31 Jul 2024 21:33:17 +0000
Received: by outflank-mailman (input) for mailman id 769113;
 Wed, 31 Jul 2024 21:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8eAs=O7=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sZGwd-0004MN-QJ
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 21:33:15 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d9b6987-4f84-11ef-bc02-fd08da9f4363;
 Wed, 31 Jul 2024 23:33:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 2F66CA02F7;
 Wed, 31 Jul 2024 23:33:13 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L05rIJDNHBTv; Wed, 31 Jul 2024 23:33:13 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 1106FA02F3;
 Wed, 31 Jul 2024 23:33:13 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sZGwa-0000000B7TN-2lLh; Wed, 31 Jul 2024 23:33:12 +0200
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
X-Inumbo-ID: 7d9b6987-4f84-11ef-bc02-fd08da9f4363
Date: Wed, 31 Jul 2024 23:33:12 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/3] mini-os: mm: introduce generic page table walk
 function
Message-ID: <20240731213312.7qztj2qwv7g4if5e@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731130026.8467-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mer. 31 juil. 2024 15:00:24 +0200, a ecrit:
> +            ptindex[lvl] = (va >> ptdata[lvl].shift) &
> +                           (ptdata[lvl].entries - 1);

It seems that this kind of va+lvl-to-index computation happens several
times? It's probably worth making it a macro.

Samuel

