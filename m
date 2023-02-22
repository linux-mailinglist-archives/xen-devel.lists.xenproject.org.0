Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A2969FA93
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 18:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499732.771008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUtKE-0000sp-F3; Wed, 22 Feb 2023 17:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499732.771008; Wed, 22 Feb 2023 17:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUtKE-0000qU-CM; Wed, 22 Feb 2023 17:54:42 +0000
Received: by outflank-mailman (input) for mailman id 499732;
 Wed, 22 Feb 2023 17:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7in=6S=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pUtKD-0000qN-6G
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 17:54:41 +0000
Received: from dog.birch.relay.mailchannels.net
 (dog.birch.relay.mailchannels.net [23.83.209.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f86537c4-b2d9-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 18:54:37 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 479017E13FE
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 17:54:35 +0000 (UTC)
Received: from pdx1-sub0-mail-a307.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id CF8667E1EFB
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 17:54:34 +0000 (UTC)
Received: from pdx1-sub0-mail-a307.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.123.200.110 (trex/6.7.1); Wed, 22 Feb 2023 17:54:35 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a307.dreamhost.com (Postfix) with ESMTPSA id 4PMP1P4f8szQ7
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 09:54:33 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e004a by kmjvbox (DragonFly Mail Agent v0.12);
 Wed, 22 Feb 2023 09:54:29 -0800
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
X-Inumbo-ID: f86537c4-b2d9-11ed-93b6-47a8fe42b414
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1677088474; a=rsa-sha256;
	cv=none;
	b=A11yR1jR0VRK8sbWVZl8BEktB8QVm1bKuuOWsPW6PSpNrTXYvrsHLf2gypnkQhDdK0/4pp
	IKBeBNHYe0PkSvxS80QVdmc/1hutXoSPioUOtlnE/LDuqLqf/HGHa2wzD4cX9Q1y7v7vrS
	j5J6egdgdCvh8eoGBPFL1P1nNvnoxPejrofEgbRwEyxfGaSGDWH6ADO3i1O34iBp9KkA12
	bXXhuv/QPme+Sm8LOOIJTfQnD6Ma/z3U24uEM39lUncz8+J11B3sXHGvqvhyDi9geJhxAH
	S21fHJuipZ+vJF2BzCXntZtp3z06BdXx1N1a0viXGCEEx9rbF7wGdsDQBJgy3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1677088474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=ukKEaiyitO8JgQ7lcfjsogM/CK+0CQFsiEgPLxhpECQ=;
	b=NKNRzIymtrfIHpsabE+/C5W1QFbnuFwVeE2R2++O91pwhHJiS6ETO1QFzmhMWRv1bgxDHY
	1QkCtNbofpX3IB8egf48f4SkEpQd8uGnFnAj9vRHPzHnK8SBgSotqzjSrQdgyeWALpbB+I
	9n1bshqR3CQHDjSALKHRKsSLOI5rtPGc2nIHGMxH2eINS+NVCwGhUKt0cuenPJ+v1q+oHR
	IKAntGwNTdla8+MUnf5oEUcwNtCJATyVOIGNVNQHmucz8kGaLvkDp7c6UMWk+nIWcOAVsb
	SciKS81rSnfvqKdqSXg9mw1FvmTjm1lIhuQOwDWo2gFtBzbh+MPHG/WNQ5Wf/g==
ARC-Authentication-Results: i=1;
	rspamd-9788b98bc-v29wb;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Ski-Illegal: 4b00b3901d902351_1677088475102_3597865880
X-MC-Loop-Signature: 1677088475102:2949484615
X-MC-Ingress-Time: 1677088475102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1677088474;
	bh=ukKEaiyitO8JgQ7lcfjsogM/CK+0CQFsiEgPLxhpECQ=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=n6aSC8JJj9p6YgxlzCV0CgwuEhiplwmIKbx7sibkesNgedAcbvsSKcH8YZSz4Hfys
	 T0DUzGNn8bEMBkJlxII4tNAu/w1Ovc48CJ/3B+ZeuTcPANzCHDU9Myp/rZ4rzWZWlZ
	 TWgPt3FEXYj3D7D1/IF1+zzG5p9LCWr2I1+a0hoE=
Date: Wed, 22 Feb 2023 09:54:29 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: [PATCH linux-next v2 0/2] x86/xen TSC related cleanups
Message-ID: <cover.1677038165.git.kjlx@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
Enclosed please find a pair of patches that perform some additional cleanup
that was suggested by Boris, Jan and Thomas.

Specifically: this resync's arch/x86/include/asm/xen/cpuid.h from its
upstream source in the Xen tree, and then uses one of the new #define-s to
replace a constant in x86/xen/time.c that was previously only numerically
defined.  Pedantic code from v1 is dropped in favor of a more appropriate
return statement.

Changes from v1:

- Coding style fixup in arch/x86/xen/time.c (Feedback from Thomas Gleixner)


Krister Johansen (2):
  xen: update arch/x86/include/asm/xen/cpuid.h
  x86/xen/time: cleanup xen_tsc_safe_clocksource

 arch/x86/include/asm/xen/cpuid.h | 22 ++++++++++++++++++----
 arch/x86/xen/time.c              |  7 ++-----
 2 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.25.1


