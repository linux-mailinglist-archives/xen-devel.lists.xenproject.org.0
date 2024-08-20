Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF37F9588FC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780504.1190132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPjA-00076E-57; Tue, 20 Aug 2024 14:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780504.1190132; Tue, 20 Aug 2024 14:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPjA-00074Q-2O; Tue, 20 Aug 2024 14:20:52 +0000
Received: by outflank-mailman (input) for mailman id 780504;
 Tue, 20 Aug 2024 14:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WjV=PT=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sgPj9-0006b2-7b
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:20:51 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65e1ffad-5eff-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:20:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id E13FDA03B3;
 Tue, 20 Aug 2024 16:20:48 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKIHqWii6n_r; Tue, 20 Aug 2024 16:20:48 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id AF42CA03B1;
 Tue, 20 Aug 2024 16:20:48 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sgPj6-00000000UFy-1Xn6; Tue, 20 Aug 2024 16:20:48 +0200
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
X-Inumbo-ID: 65e1ffad-5eff-11ef-a507-bb4a2ccca743
Date: Tue, 20 Aug 2024 16:20:48 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/3] mini-os: mm: introduce generic page table walk
 function
Message-ID: <20240820142048.27m346n5xzj5fi43@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-2-jgross@suse.com>
 <20240820115248.34qg23znyx5qoh37@begin>
 <6e9715ba-7c49-426e-bff4-7569638c0a4b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e9715ba-7c49-426e-bff4-7569638c0a4b@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jan Beulich, le mar. 20 août 2024 16:17:26 +0200, a ecrit:
> On 20.08.2024 13:52, Samuel Thibault wrote:
> > Juergen Gross, le mar. 13 août 2024 15:41:56 +0200, a ecrit:
> >> In x86 mm code there are multiple instances of page table walks for
> >> different purposes.
> >>
> >> Introduce a generic page table walker being able to cover the current
> >> use cases. It will be used for other cases in future, too.
> >>
> >> The page table walker needs some per-level data, so add a table for
> >> that data. Merge it with the already existing pt_prot[] array.
> >>
> >> Rewrite get_pgt() to use the new walker.
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > Reviewed-by: SAmuel Thibault <samuel.thibault@ens-lyon.org>
> 
> Samuel - I've taken the liberty to convert the odd upper-case A.

Oh, sure, thanks :)

Samuel

