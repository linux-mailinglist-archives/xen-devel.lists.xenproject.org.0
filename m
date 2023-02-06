Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AFC68BC4A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490304.758929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0FY-00063T-HD; Mon, 06 Feb 2023 12:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490304.758929; Mon, 06 Feb 2023 12:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0FY-00061l-E6; Mon, 06 Feb 2023 12:05:32 +0000
Received: by outflank-mailman (input) for mailman id 490304;
 Mon, 06 Feb 2023 12:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8JA=6C=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pP0FW-00061a-RI
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:05:30 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b20074c-a616-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 13:05:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id DF5EB2012F;
 Mon,  6 Feb 2023 13:05:26 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYnBPJhNB15A; Mon,  6 Feb 2023 13:05:26 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 93CEE20127;
 Mon,  6 Feb 2023 13:05:26 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pP0FS-009A6r-0i;
 Mon, 06 Feb 2023 13:05:26 +0100
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
X-Inumbo-ID: 8b20074c-a616-11ed-93b5-47a8fe42b414
Date: Mon, 6 Feb 2023 13:05:26 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 7/7] Mini-OS: add read and write support to 9pfsfront
Message-ID: <20230206120526.242njyptovkpz3jl@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-8-jgross@suse.com>
 <20230206101341.5l7cxb2vvregskrx@begin>
 <77d6d486-5ad5-1f13-e223-79295707d090@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77d6d486-5ad5-1f13-e223-79295707d090@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 06 févr. 2023 11:17:27 +0100, a ecrit:
> On 06.02.23 11:13, Samuel Thibault wrote:
> > 
> > Juergen Gross, le ven. 03 févr. 2023 10:18:09 +0100, a ecrit:
> > > This patch is missing the limitation of read/write messages to stay
> > > below the max. supported message size.
> > 
> > It should at least be asserted.
> 
> It can easily be limited by returning the resulting limit as the
> number of processed bytes.

Strictly speaking, posix allows to return short reads, but that's
usually only handled by applications when they know that they may get
signals. I'd thus rather have read/write loop over the size.

Samuel

