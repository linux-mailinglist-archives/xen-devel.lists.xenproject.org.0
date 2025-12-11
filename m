Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E43CB5731
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 11:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183808.1506388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdbU-00069n-Ic; Thu, 11 Dec 2025 10:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183808.1506388; Thu, 11 Dec 2025 10:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdbU-00067c-FT; Thu, 11 Dec 2025 10:08:56 +0000
Received: by outflank-mailman (input) for mailman id 1183808;
 Thu, 11 Dec 2025 10:08:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BerU=6R=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTdbS-00067V-O7
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 10:08:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65bbd800-d679-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 11:08:53 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 2C1BC4EEBF88;
 Thu, 11 Dec 2025 11:08:52 +0100 (CET)
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
X-Inumbo-ID: 65bbd800-d679-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765447732;
	b=vRha09mNxRITmc2y6bunHw7z8sfqN8nIfWweoUi5N2gtOqzcy503pon3RL4GakXpHcvP
	 ykJPyhiWz3uuc/+gYSj1K06rsJYAMVS2vF9MupTlUZbvkKuxUDYgGtLvG7LgCQYt/+Vwv
	 U2Xm0MemLtAs79q8zGYTzY8sl8HvBNAgf0GLrx76cict/sxoZfMwI+YnGBOIOjgucgxa5
	 6bHvrxLRUEhDhUYqRXvWVUUKZ26+uZDuJR15F9MiJf7zVIbm9bssmDCwfQoIkn3WkS/UU
	 V60Gng8vNJq57MnyI3FSTlEvExXnlV7OrVJPy1ZOqiUS7OklPf5msLu487aezDcQbzE5r
	 13pHXzs7kyD6Yx557FJhHgqHQE7RRLDWp0ichCrFL5iNJBMpbuQ9+/TG+WqlNRIqVH5lj
	 cuFlYipNYrOAWpEvb3Rcu2citt9h9IQi3UKPIwlU3mku9poWlOopZepLAptU5eiRR+uPM
	 oNuQmqnvDJ+IO47vjZxYEb11K0u9rkD4BBBrPFlhoPMBPfSH1MGjYqagXvlaFrGfyxgAh
	 JUsRcjdGB0D4KLVxbjmlsV+YeKsKJcQa1HdHFKHFB9FnMIEOTCSD1ManFqGvjzvgYtVil
	 2GAeTzchwv8k5N7fcrSUW1v7ZzUy/STD0yZn4matwNKb7sJv2p4XcVdHqXM3gkg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765447732;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=mmWFVtypNzq9EuifoL5h7yLYleyMTHCl6degh+7Fj9o=;
	b=VP1M3VJ3JkYAkTUuvjCRoSPQGgMYrmMeN2XGtzFmSMslRmhMF4bxwvZlg+1RH+SX8ckU
	 7Bt5Ta6qPY1Iv/fe5ykjE1/1VBYoe05iVfPf7GPDivEDEL54XaEeEhklOLE3qY2TCLK/h
	 PuvMCI4GMBUcFD8pX5kFzogH3JushzVxo3ptAaJGj2kDiZA1kFMxo4p3QhgwOFLMdn1HR
	 kqZ2ct6RuGMRhmGVsN+Er4WwbtjKlgyJWsE6KNxmYbjSsCBPbagWcBpNU0nCLM4q20cos
	 APQNJhg48hY64CONtcqOfYFmY4dr1RGalsuATYT/8LIJEEfiC9J1HVNpIntdRlSX3HOw7
	 bN9OnVMvvFSgOKksPuUhMOSCK1Do3eFF61E0Veh9qE/cYzizboiliNsmAqbf+JVt8xmF7
	 5RlOoHMH5+/bbmBx9aeWH4yx7BWXAXW8XUTfRKYaEBjmJ7R6+vQQZ0u5vALG4pQRqztTH
	 iKqhwXmhNqEfhfBSG6qxvJthDVA8LOCrOxwDy1N5bAKQuV7N99G7miiK8SyPiB0NPexew
	 1hNeOcJaNm+ryE1rm+0+zgRHfkeQen/DkES/QwgHVhOFIctjHWe00iw5cdj/U931fTvoi
	 KFwi3es4H32SZhP0mtKxGZNRDrwpR0iAFK0NRKLC3LdFhfbPTI8WVVHVMV0zh2Q=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765447732; bh=vNvER5SHN9QCPsBCQzwWLJw7VeUQAnvmR3PLG0GpD8U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=w0mBdcMFiT0JlwhV6kzS58hM/U3YBGFzfEcSrGSsJEXEgvkxVB96GqLSFz/p8jHvU
	 qDl6YGbCM5Cwbk1gmD2tmrkxLvsumnQhlT+dhiM4vyy+XkcUH2yYh/ZImmdD4NHa63
	 Kx/EYHHW/PXj3iMDk3ctRLKg/+4GycdwpqSiYmZ8I3Zc+UiZGRXR5RPsK6P7B9FlOw
	 uelYznqrSaEHA48XebO0VoUnBZdp1JqUAJaHKAB0qieI7Ma0rUHIUvtNgfR1oN8nXS
	 JObZ0d5xUtBsFDj3WFB4z1WkKG2GcSiatA7vbq2PGdnIawJsQWNUqNff1A8CLJIudB
	 JhQRLl3AgmptQ==
MIME-Version: 1.0
Date: Thu, 11 Dec 2025 11:08:52 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Current Eclair analysis
In-Reply-To: <c0d5cf8c-cb57-47a5-a989-f65677e565aa@suse.com>
References: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
 <c0d5cf8c-cb57-47a5-a989-f65677e565aa@suse.com>
Message-ID: <dab08dfc1de25d7573c401ecad8a1f21@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-11 11:00, Jan Beulich wrote:
> On 10.12.2025 19:14, Andrew Cooper wrote:
>> The Eclair step is now the dominating aspect of wallclock time.  While
>> the recent changes were a step in the right direction, we need some
>> adjustments.
> 
> One other question, related to the "dominating" aspect, but not to any
> of the points raised so far. Can scan results possibly be recorded
> somehow, somewhere, such that upon re-scanning the same tree (pre-push
> test followed by post-push test) the identical re-scan can be avoided?
> And perhaps even incrementally - if only .c files change within a (set
> of) commit(s), only re-scan those, rather than everything? Could be
> extended to .h files if dependencies were properly taken into account.
> 
> Jan

We support incremental analysis, but it requires non-trivial changes to 
the current Xen integration. If someone wants to invest time and/or 
resources in it, I can support the effort, but it requires a fair deal 
of rearrangements of scripting in order to avoid losing information

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

