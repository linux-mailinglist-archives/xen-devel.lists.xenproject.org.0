Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3895864B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 13:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780346.1189973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgNUg-0008C2-MU; Tue, 20 Aug 2024 11:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780346.1189973; Tue, 20 Aug 2024 11:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgNUg-00088K-IP; Tue, 20 Aug 2024 11:57:46 +0000
Received: by outflank-mailman (input) for mailman id 780346;
 Tue, 20 Aug 2024 11:57:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WjV=PT=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sgNUf-00087s-JG
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 11:57:45 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68b1128b-5eeb-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 13:57:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id BF681A0242;
 Tue, 20 Aug 2024 13:57:43 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRsckY0ESDaT; Tue, 20 Aug 2024 13:57:43 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id A71F4A023C;
 Tue, 20 Aug 2024 13:57:43 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sgNUd-00000000Fg8-1IZG; Tue, 20 Aug 2024 13:57:43 +0200
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
X-Inumbo-ID: 68b1128b-5eeb-11ef-a507-bb4a2ccca743
Date: Tue, 20 Aug 2024 13:57:43 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] mini-os: mm: convert set_readonly() to use
 walk_pt()
Message-ID: <20240820115743.teyoiov6qx63flna@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813134158.580-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mar. 13 août 2024 15:41:58 +0200, a ecrit:
> +    if ( ro->count == L1_PAGETABLE_ENTRIES )
> +    {
> +         ro->count = 0;
> +         if ( HYPERVISOR_mmu_update(mmu_updates, ro->count, NULL,
> +                                    DOMID_SELF) < 0 )

You need to set ro->count *after* calling mmu_update.

Apart from this, 

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Samuel

