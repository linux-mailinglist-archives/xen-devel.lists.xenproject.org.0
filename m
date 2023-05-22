Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5993470B803
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 10:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537821.837365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11Ea-0007kl-EY; Mon, 22 May 2023 08:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537821.837365; Mon, 22 May 2023 08:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11Ea-0007hw-Bg; Mon, 22 May 2023 08:49:40 +0000
Received: by outflank-mailman (input) for mailman id 537821;
 Mon, 22 May 2023 08:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gfWf=BL=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1q11EY-0007hq-T8
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 08:49:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9542d316-f87d-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 10:49:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 81E5B21961;
 Mon, 22 May 2023 08:49:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4436113336;
 Mon, 22 May 2023 08:49:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XLh+DqEsa2SCYAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Mon, 22 May 2023 08:49:37 +0000
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
X-Inumbo-ID: 9542d316-f87d-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684745377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IAId3F/SOs9VIIcnJZfWqez/AHJ64L6CPRkL8KeTOFI=;
	b=Kb4i9gpNtNVO9+4yiajhKeZQXNmTTFI2P+x2A4Bdy5DSqtRPMbz1jOiIfd3Bv1lXO88dc5
	4HGJGfjw1ErINfy8m3tWfRBDxJDSgRoiEwLP978POX0LWFLK80ONpEIdnVIvwpL/UMqmxi
	iD7I3nUsAErGEkQT6BRoA9POhQfcNDA=
Message-ID: <f1f4ff704480d34931161fac75e5341b9a5e2b2d.camel@suse.com>
Subject: Re: [PATCH v1] xen/sched/null: avoid crash after failed domU
 creation
From: Dario Faggioli <dfaggioli@suse.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>, Juergen Gross
	 <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Date: Mon, 22 May 2023 10:49:36 +0200
In-Reply-To: <93adef92-90fb-80de-c6b4-b41872b74682@amd.com>
References: <20230501203046.168856-1-stewart.hildebrand@amd.com>
	 <30246788-c90e-e338-de4b-e7bb2e440f4e@suse.com>
	 <93adef92-90fb-80de-c6b4-b41872b74682@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (by Flathub.org) 
MIME-Version: 1.0

On Thu, 2023-05-18 at 17:27 -0400, Stewart Hildebrand wrote:
> On 5/5/23 01:59, Juergen Gross wrote:
> > >=20
> > > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >=20
> > Reviewed-by: Juergen Gross <jgross@suse.com>
>=20
> Thanks for the review. Does this still need a maintainer ack?
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

