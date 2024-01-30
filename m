Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B66D8430C6
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 00:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673707.1048158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUx5a-0003nH-Qg; Tue, 30 Jan 2024 23:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673707.1048158; Tue, 30 Jan 2024 23:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUx5a-0003kY-NV; Tue, 30 Jan 2024 23:00:22 +0000
Received: by outflank-mailman (input) for mailman id 673707;
 Tue, 30 Jan 2024 23:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8aAt=JI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rUx5Y-0003kS-DB
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 23:00:20 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5579fbf7-bfc3-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 00:00:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3E1B48285880;
 Tue, 30 Jan 2024 17:00:16 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4106HUw3K3Tz; Tue, 30 Jan 2024 17:00:14 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B47F8828588F;
 Tue, 30 Jan 2024 17:00:14 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KqSWhrrzHuNC; Tue, 30 Jan 2024 17:00:14 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0ED9B8285880;
 Tue, 30 Jan 2024 17:00:14 -0600 (CST)
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
X-Inumbo-ID: 5579fbf7-bfc3-11ee-8a43-1f161083a0e0
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B47F8828588F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1706655614; bh=BReTFiOijXdQ7jIG/pD8I1ddhBj07jT2TqmAAQmbyM8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=SbcLShTPoba8b8oaRCGox8y/md3bEugv6e5U/Uh3Ud4yRaN2jelSoV/0tOHk9wzT/
	 Ms04xXwvMPYcnz2jkStCzdhMeEBkhu6L9Y4USo2Va8pVOB1PS8ORfZQlKq3SDpgAre
	 XJVzyf5t41U1KAweh7POIfNDCvdH8UnWrS/z9z74=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <08a1328c-92c7-486f-9134-00aef1c5c1c2@raptorengineering.com>
Date: Tue, 30 Jan 2024 17:00:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/*/asm-offset: Fix bad copy&paste from x86
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <20240130222808.106006-1-andrew.cooper3@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240130222808.106006-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On 1/30/24 4:28 PM, Andrew Cooper wrote:
> All architectures have copy&pasted bad logic from x86.
>=20
> OFFSET() having a trailing semi-colon within the macro expansion can be=
 a
> problematic pattern.  It's benign in this case, but fix it anyway.
>=20
> Perform style fixes for the other macros, and tame the mess of BLANK()
> position to be consistent (one BLANK() after each block) so the interme=
diate
> form is legible too.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>=20
> Why does PPC have a local copy of ilog2() here?  Especially as it's not=
 used,
> and there's a perfectly good one in <xen/bitops.h>

I believe this was a carryover from before we had asm/bitops.h
implemented on PPC. Now that we have bitops implemented (and we don't
define any offsets that use log2 anymore anyways), this is fine to
remove. Will submit a patch to do so.

As for the actual contents of this patch,

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

