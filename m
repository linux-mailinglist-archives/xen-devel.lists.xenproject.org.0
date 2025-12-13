Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A2CBA65B
	for <lists+xen-devel@lfdr.de>; Sat, 13 Dec 2025 08:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186190.1508016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUJgY-0004eZ-Br; Sat, 13 Dec 2025 07:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186190.1508016; Sat, 13 Dec 2025 07:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUJgY-0004cG-8u; Sat, 13 Dec 2025 07:04:58 +0000
Received: by outflank-mailman (input) for mailman id 1186190;
 Sat, 13 Dec 2025 07:04:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/lp=6T=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vUJgX-0004cA-58
 for xen-devel@lists.xenproject.org; Sat, 13 Dec 2025 07:04:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06fdac60-d7f2-11f0-9cce-f158ae23cfc8;
 Sat, 13 Dec 2025 08:04:54 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 08F094EEBFCB;
 Sat, 13 Dec 2025 08:04:54 +0100 (CET)
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
X-Inumbo-ID: 06fdac60-d7f2-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765609494;
	b=HcU7iz3PF8B4ljCkfL93UMPliDf/lpvsiIo0HEVmGC2l1ljes2Z517CsmTMeCK9EDiNG
	 wvl9UqTtN6PMIfSuDc4goT6O4XcLwX0A3Z8xG6ljig47++7wJ9hxT4E4bHSx2CtyY82rZ
	 jy1gHWABmueo6lHel2SvD9erg6s3ttcpu6pg1zu46B8nlfBor2tyOQYo/FXxo3tYEVz0e
	 T7SysxHHwwv1ck+EwtvhdxBqLMI73hpLIgMENtqXGKpqaaGMeSc/wGpxSPEToG7Y1p4rz
	 gnmUm8J8KLdtIl043RSNtpKfuGhlTy5jS4dCzfJArGM3kgkwGnEom0SOr+RL4I3ga4tYe
	 Y1yBUVWRvOD8tk6cEoGAryH2WVa0aQn8diYtmSwFeqnK2sqZjrU1C5zp25pAVzIikPUop
	 eHfSTb876wgv9QVQ+xxDBRErfCGeczH0jndoNu+tzYhXjPpRt9dhKgrCvdvTx5LK/E0LH
	 K0Mn/yproQ6jm2XjvOGqjGeICPIQ+1kx9oWwvlnODEnLJemt/Svf+OddlnOkSQYM2OMN6
	 oJHgr6HnPhdgs4/xYWBGybKWMmDP5D/Qh0G5LAZzD9thhgzVr42l0DktHy9EsraroC6Uv
	 I0DYlP4JoHcle0SlEWxIrh7iFzw6sGXqyB3BgPyx1Ar8wbdlRSS509u8ACfsrCA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765609494;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=QE0VF2Mh/n3CA5johqzBBgR7JTADL/vP3EQMxSVaNbg=;
	b=NtlqIo2uvWPNjAK2UqleS7zLM+Zunp0qTXCxZpIoPOmefU5dlBYt/pKGH9JuUngdvE9m
	 TVcpEUVVqtRXoP7M6suzT9si8M3WXhdwbPQ8j+YysgDx4qQ/x2o9ni6biFV+sPkj6y0g+
	 az7DTipq1ThfdG/YhDt2hE49S9YbId9SCK01KsAbyWodpeiOznAyMuS+ZGg76kxq9yAd5
	 elzICafbyBYIBKZv+Zy5JOfRXyV72vlSHdlLZbEdzrc6i19Nl+KMC+r23jYoYob1PqmH+
	 MIWdg4d8TQv8ar4wsX/DgjOEZ6Lqx109aDYt1JzXphYS+lPNyZqP9gVq9jepen0gdUqlW
	 R/FqG/C7ahNeH631lkrRbtxix7OpV2g7SUJiaw+rVdSs+FYsdeLDKbY1jxFSB1Kwur9tY
	 9uVdEQyZAB30V3eqE00CV4qv6kbJcpHFVwRrH3NRJFO0ccVpHrN91pQ6WajUOMranWH/w
	 jN5r3tOWM6kZSKa/LigJ6CuiDpiEp4KN73+URVQBwuqELpsVJZlNa5nlikPuSwECEnVUE
	 NOCGKK8YBMJCMySIfm8Sk4dn/NbNpGkCPMfxNq+SxuE27l3sRt9hGe8Vi2hRArwMUXLJH
	 oj8plv0yDLsYeY6QtaSfxzYAKMgsqh5cmXcJ7eSEy+rnLomphga7SmFYTfEjAy0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765609494; bh=0ssRfds6/C1Cb2ZTSetpFwHpTxsLK7pKRqlvVrqsrQM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bMKyNTkVZ7AeOtRrZOqd2ZGpLRk56vRUNs+h8dWa3n3RNkKLn7XyboVRLvEZ/OUf2
	 wPypFqKRiaBiHQmV7efaHzwdGnV5DraV5qWNY27Va/59iLe5JkXzJiF53lzvX8T46q
	 d0SaRcAcrL1q5l3q/XQDHVWSZJecA35rj8mrHxCYLsml8137U3bdh/Hcp45lyOLG4I
	 2TnDkwKG4pDHfucw0jBIvxxwXKnYYgch+PS0wNo4j0GQlj1vs37N2JwLdWBj+oda+t
	 ErvgzxKUbkanIJ3RZx9gP7SkTLv1M26sSunm0pTrvTon3kt1Ec3Z7ioOjybaVZW6JM
	 rU8B4/7ZgSAaA==
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 08:04:54 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH RFC 5/5] x86/shadow: Deviate multi.h as being included
 multiple times
In-Reply-To: <20251212222032.2640580-6-andrew.cooper3@citrix.com>
References: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
 <20251212222032.2640580-6-andrew.cooper3@citrix.com>
Message-ID: <ad38f82d4eb581d622cd5e76c6b352f9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-12 23:20, Andrew Cooper wrote:
> This resolves the Eclair complaint about a MISRA D4.10 violation.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> RFC - this doesn't actually squash the violation, despite being the 
> requisite
> magic string.  I suspect the Eclair config needs tweaking to allow the 
> magic
> anchor string to be after the SDPX tag.
> ---

I think it's just a matter of positioning. The location of the violation 
is at line 11 (the first non-comment statement of the file, and the 
string is matched in a range of -4 lines from that point:

-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is 
intended to be included multiple times\\. \\*/$, begin-4))"}

so I think moving it just below the copyright lines or increasing the 
range should do the trick.

>  xen/arch/x86/mm/shadow/multi.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/x86/mm/shadow/multi.h 
> b/xen/arch/x86/mm/shadow/multi.h
> index fc86d7a8d9cd..b4a6cf1362a6 100644
> --- a/xen/arch/x86/mm/shadow/multi.h
> +++ b/xen/arch/x86/mm/shadow/multi.h
> @@ -2,6 +2,8 @@
>  
> /******************************************************************************
>   * arch/x86/mm/shadow/multi.h
>   *
> + * This file is intended to be included multiple times.
> + *
>   * Shadow declarations which will be multiply compiled.
>   * Parts of this code are Copyright (c) 2006 by XenSource Inc.
>   * Parts of this code are Copyright (c) 2006 by Michael A Fetterman

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

