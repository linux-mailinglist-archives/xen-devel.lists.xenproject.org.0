Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1D69D206
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 18:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498286.769133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9mb-0005Xu-3W; Mon, 20 Feb 2023 17:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498286.769133; Mon, 20 Feb 2023 17:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9mb-0005Ut-0N; Mon, 20 Feb 2023 17:16:57 +0000
Received: by outflank-mailman (input) for mailman id 498286;
 Mon, 20 Feb 2023 17:16:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEKe=6Q=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pU9mY-0005Un-NT
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 17:16:54 +0000
Received: from poodle.tulip.relay.mailchannels.net
 (poodle.tulip.relay.mailchannels.net [23.83.218.249])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c5ba0b6-b142-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 18:16:52 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id A1C2F3C0CE3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 17:16:48 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 415CB3C0E1F
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 17:16:48 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.116.179.67 (trex/6.7.1); Mon, 20 Feb 2023 17:16:48 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4PL8Gl1rTqz1NZ
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 09:16:46 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0067 by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 20 Feb 2023 09:16:43 -0800
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
X-Inumbo-ID: 5c5ba0b6-b142-11ed-933d-83870f6b2ba8
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1676913408; a=rsa-sha256;
	cv=none;
	b=l492S/ueqfNkE2hF1aShCsu/8ItsPVcUL6qlv4ymyreqGZkXfEIDad8Ih6qK2DFGD6Tw7r
	MApxXTfOhA9o1BKZFEnuj9ePu0RvCD/0jVGYgRKLBVfhSCbBtdgrlNPqNgm5nBB+3azy8E
	1mnwHa+0XX/2VDWsx4V/d9ZGT6y+LYWF6Ha8RHA/KTd31ogjjxy6g4ujRCVRWQg8YGc53y
	XZ/FxGWKwAJq5AdqTi2syyzPkhkcCiuOSNQ9EoVKhane3/gPSmfbztMBWdvbsZGLoe7XbV
	D+r+QRf5+U6H8N+bp+r9XcrzVnBp5MxdZblrKlYF5GcvgCfL8xbgbhse95jCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1676913408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=fUu5dy7aqGfj6EXLkWJV8gzrUOJ39VlTABuiXGf/DAY=;
	b=dWv8T6EfGWnWfCcAqPLtxresHVmUaAPkwYmnChDuuSVqErJatinWWUOQF/yJts2O3nEF70
	37o9cn0f2OT+Cc5zD/ismISXQ8R4rKUUZVRUfL0BlCDvFLv4vmaU3UBikYYd/lWRNDxQ46
	9UACjHt8ZJGVCUa6UOx7PkF/M5rZLFEnvf9DpwaJ/OHcGGaf/8VeIxlBAavkjXT2Sh7COk
	wIX8lKZc1aosjm+8RXakqatGozKZrjfy8Z3BK89oV157AZm42OxsIXC5fK2o2ekt8Xybo+
	S4sDp/9sG2N/e6CJNE3xQShOha/lThI9+5PkydsJvanCEvFHI+JJrea8fokOMA==
ARC-Authentication-Results: i=1;
	rspamd-9788b98bc-l6ctm;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Bored-Irritate: 6331909a11482b5b_1676913408494_3548150860
X-MC-Loop-Signature: 1676913408494:2375623452
X-MC-Ingress-Time: 1676913408493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1676913407;
	bh=fUu5dy7aqGfj6EXLkWJV8gzrUOJ39VlTABuiXGf/DAY=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=oizMo8h8X0zgNVSz/6yhg8Unuwn+LyOASs/GaiBa5lJZoI4RqD5eNKfWf1+Vy+OX0
	 yqFQoihSD0/b2C8QrM1J5naHejiLxMUA6Y10JbaEfZaqRunqILMW2/yVJoUWFMwHVl
	 XovQOnLWQ6Drv/037PMZkbB6BymxPGFCm/tc4KRs=
Date: Mon, 20 Feb 2023 09:16:43 -0800
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
Subject: [PATCH linux-next 0/2] x86/xen TSC related cleanups
Message-ID: <cover.1676610413.git.kjlx@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
Enclosed please find a pair of patches that perform some additional cleanup
that was suggested by Boris and Jan.

Specifically: this resync's arch/x86/include/asm/xen/cpuid.h from its
upstream source in the Xen tree, and then uses one of the new #define-s to
replace a constant in x86/xen/time.c that was previously only numerically
defined.

Krister Johansen (2):
  xen: update arch/x86/include/asm/xen/cpuid.h
  x86/xen/time: cleanup xen_tsc_safe_clocksource

 arch/x86/include/asm/xen/cpuid.h | 22 ++++++++++++++++++----
 arch/x86/xen/time.c              |  4 ++--
 2 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.25.1


