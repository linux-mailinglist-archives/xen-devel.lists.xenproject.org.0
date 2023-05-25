Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524C710D7B
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 15:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539609.840680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BEh-0005Hu-8Z; Thu, 25 May 2023 13:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539609.840680; Thu, 25 May 2023 13:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BEh-0005FY-5t; Thu, 25 May 2023 13:42:35 +0000
Received: by outflank-mailman (input) for mailman id 539609;
 Thu, 25 May 2023 13:42:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ga2A=BO=citrix.com=prvs=5022cd99a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q2BEf-0005FS-0l
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 13:42:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdbc6bbe-fb01-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 15:42:30 +0200 (CEST)
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
X-Inumbo-ID: fdbc6bbe-fb01-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685022150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y+1eK+8GwXxwMdgbWvFqnH4uW+OjTUI42zbErWbZYAA=;
  b=Mgo17UC78NA0You37/UFEdqu1VuzgCsmMvd4+Prwe+R8UzovzJv3cdUN
   JTVvjG3KcGVbzOhjQgYTUjO4yXZjTgYhllaKa99WIdHG9Ex7JCf1By6z5
   DAg13OPul98UOAI//W/bngiJ61z4XdgmwIyDbAK3o7hNQbI/9r38NIwBa
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110414499
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:9C2jNKOx2qPvnObvrR1pl8FynXyQoLVcMsEvi/4bfWQNrUpw32NSx
 mBOXWvXPPuMYWvzeop+PIu0oUtTvpTTm9U1GQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5AFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vx5B04X+
 dUHEzsyfyqug767x7eYUPY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTHZkMwhrJ9
 woq+UzEQS4AG/uj+QG11WOrp+rLgGDjZKkrQejQGvlC3wTImz175ActfVmxrOS9i0W+c8lCM
 EFS8S0rxYAw6UiqQ9/VTxC+5nmesXY0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOq8seVTEsk
 FiTkLvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKk6lh/VR8xvOLK0hNbyXzr3x
 li3QDMW3utJy5RRjuPioA6B2mj3znTUcuIrzh/ZWE384ipmX4WadraF7QTW6vNjNpnMGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHgk0PSZ8PEi3yiDAdJ3T3
 r/FGftA9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLGetUbQDUNbpgsfvsTODpH
 zF3bpHi9vmieLemPnm/HXA7djjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/I7Nj7dNxvwP/s+Rp
 yHVZ6Ot4Aan7ZExAVnQOy8LhXKGdcoXkE/XygR3YwjziiZ9O9r0hErdHrNuFYQaGCVY5aYcZ
 5E4lw+oWJyjlhyvF+whUKTA
IronPort-HdrOrdr: A9a23:ccpegqxAVeuqIkSJKZy6KrPwKb1zdoMgy1knxilNoH1uA6qlfq
 WV98jzuiWE7Ar5NEtBpTniAtjmfZq/z/NICOAqVN/JYOCBghrKEGgI1/qG/9SPIVydygdr78
 tdmnlFaeEZXDBB4/oTvmGDfOod/A==
X-Talos-CUID: 9a23:kDIQmGB06HouOpn6EzNp8mFNFuk6SXbi3U39JxO1DmNKUqLAHA==
X-Talos-MUID: 9a23:lzwWvgnHe9K/Jvj3goqrdnpfd/hyzIOSOHs9toQBmsyAKG9oBxyk2WE=
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="110414499"
Date: Thu, 25 May 2023 14:42:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 05/15] build: introduce a generic command for gzip
Message-ID: <0365c706-efdc-48fd-b182-b703b63843a3@perard>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-6-anthony.perard@citrix.com>
 <9e8f44e5-7dbd-5369-2ac5-5cf171908648@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9e8f44e5-7dbd-5369-2ac5-5cf171908648@suse.com>

On Wed, May 24, 2023 at 09:17:09AM +0200, Jan Beulich wrote:
> On 23.05.2023 18:38, Anthony PERARD wrote:
> > Make the gzip command generic and use -9 which wasn't use for
> > config.gz. (xen.gz does use -9)
> 
> You mention xen.gz here, but you don't make its rule use this new
> construct. Is that intentional (and if so, why)? (There we also go
> through $@.new, and being consistent in that regard would imo be
> desirable as well.)

It was kind of a justification to say that -9 was ok, because we already
use it.

But I can't use it for xen.gz because the generic command is added to
Rules.mk. But I can probably add cmd_gzip to Kbuild.include instead and
use it for xen.gz, (with simply $(call cmd,) instead of using
if_changed).

Thanks,

-- 
Anthony PERARD

