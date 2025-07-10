Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D81AFF60A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 02:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038814.1411000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZfGQ-00032F-Dz; Thu, 10 Jul 2025 00:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038814.1411000; Thu, 10 Jul 2025 00:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZfGQ-0002zj-AF; Thu, 10 Jul 2025 00:35:50 +0000
Received: by outflank-mailman (input) for mailman id 1038814;
 Thu, 10 Jul 2025 00:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mn5d=ZX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uZfGO-0002zd-Bq
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 00:35:48 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d155355b-5d25-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 02:35:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F1C3D61453;
 Thu, 10 Jul 2025 00:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CCAC4CEEF;
 Thu, 10 Jul 2025 00:35:43 +0000 (UTC)
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
X-Inumbo-ID: d155355b-5d25-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752107744;
	bh=JXUGK5aTIYjv5ATFTSktPZy41UDbMtCn82SnTBrSVXk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Xp+hGOhc8IA9lq+oOiu1P8rFuqGombgiu6hR49fzVcqELw1Y3JU2aQUheRSVIFhls
	 JZZxX2BMYTGGCO6Kae7rK7Y9FMJ+ZSdU9YoNYlc5XF6h/a/wLHsfLsby8nlfsh/3hT
	 C/6SmMd0QBm1/wvWtCAo2l03N0WF6IyAoo5qAIq5bwIaC8XrgLV7mIhTeAhhb28Pu9
	 bcPrL7st2TPFWKn9ktVorXQ9t33P44IcszbqsRIKEMD4zErdtxt41uT//NRxqCdk/D
	 u4m88zOBjvxnvXmE9jhG5UKZAxGkbU1QVnSIz4+szJUcpIA71S0VLByweqiGcT/cuW
	 VjF77rXM9Xdrw==
Date: Wed, 9 Jul 2025 17:35:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/x86: address violations of Rule 11.3
In-Reply-To: <27ca400b-ceac-40c4-a6ed-f26c1129ae2a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507091723470.605088@ubuntu-linux-20-04-desktop>
References: <20250624002018.4121819-1-victorm.lira@amd.com> <20250624002018.4121819-2-victorm.lira@amd.com> <b31da849-283e-4f84-854a-50da2d0878d7@suse.com> <alpine.DEB.2.22.394.2507071453370.605088@ubuntu-linux-20-04-desktop> <6b23c2a3-9e2c-492b-843f-c3f830394f3e@suse.com>
 <alpine.DEB.2.22.394.2507081031210.605088@ubuntu-linux-20-04-desktop> <27ca400b-ceac-40c4-a6ed-f26c1129ae2a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Jul 2025, Jan Beulich wrote:
> > What fine grained deviation do you have in mind?
> 
> Ones for almost(?) everything that is having actual code changes right now
> in this series.

We could easily deviate alternative.c based on the file name alone. But
for the rest:

emulate.c: casts from unsigned char* (byte aligned) to uint64_t* (8 bytes
aligned)

vlapic.h: casts from uint8_t* (byte aligned) to uint32_t* (4 bytes aligned)

setup.c: games with symbols

iommu_init.c: cast from uint32_t* (4 bytes aligned) to uint64_t* (8 bytes
aligned)

How would you deviate these in general terms? Or are you suggesting to
use SAF tags for each of them?

I suggest we consider taking the patch as is, or globally deviating this
rule for x86 (or keep the rule but not enabling it in ECLAIR for x86).

