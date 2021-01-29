Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB3330888B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78067.141858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SHb-0000VR-E2; Fri, 29 Jan 2021 11:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78067.141858; Fri, 29 Jan 2021 11:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SHb-0000V2-Az; Fri, 29 Jan 2021 11:49:47 +0000
Received: by outflank-mailman (input) for mailman id 78067;
 Fri, 29 Jan 2021 11:49:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5SHa-0000Ux-3t
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:49:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06f59128-92ad-4a07-9828-0fc7b57f0d1c;
 Fri, 29 Jan 2021 11:49:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03EBCAE53;
 Fri, 29 Jan 2021 11:49:43 +0000 (UTC)
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
X-Inumbo-ID: 06f59128-92ad-4a07-9828-0fc7b57f0d1c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611920983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CVgn/p9vPivDO3a/olC5nMCPMnj0NzurvQDlNoJ25II=;
	b=HtAu8G0funnxAqXJBfUly4RfLqfqQuVvY+AwPeeEm2K1ETSC91v7aiMH4MHRE/ajWLHx5w
	gz/Bce/BDM/e4Lf/Nzx8XtLZbeHnk8A4iJ+MSLY0ADB9aGL62OVVfxsSnZgi7H4gEzVcln
	Pmqh8q8udx5Z+dVR0Gyo8i7JjDGrtos=
Subject: Re: [PATCH v2 3/3] x86: Support booting under Secure Startup via
 SKINIT
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Norbert_Kami=c5=84ski?= <norbert.kaminski@3mdeb.com>,
 Marek Kasiewicz <marek.kasiewicz@3mdeb.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Zygowski <michal.zygowski@3mdeb.com>,
 Piotr Krol <piotr.krol@3mdeb.com>, Krystian Hebel
 <krystian.hebel@3mdeb.com>, "Daniel P . Smith"
 <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210129114510.30966-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <436fcd27-ec06-3181-b236-fe0e75a5edcb@suse.com>
Date: Fri, 29 Jan 2021 12:49:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129114510.30966-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.01.2021 12:45, Andrew Cooper wrote:
> From: Norbert Kamiński <norbert.kaminski@3mdeb.com>
> 
> For now, this is simply enough logic to let Xen come up after the bootloader
> has executed an SKINIT instruction to begin a Secure Startup.
> 
> During a Secure Startup, the BSP operates with the GIF clear (blocks all
> external interrupts, even SMI/NMI), and INIT_REDIRECTION active (converts INIT
> IPIs to #SX exceptions, if e.g. the platform needs to scrub secrets before
> resetting).  To afford APs the same Secure Startup protections as the BSP, the
> INIT IPI must be skipped, and SIPI must be the first interrupt seen.
> 
> Full details are available in AMD APM Vol2 15.27 "Secure Startup with SKINIT"
> 
> Introduce skinit_enable_intr() and call it from cpu_init(), next to the
> enable_nmis() which performs a related function for tboot startups.
> 
> Also introduce ap_boot_method to control the sequence of actions for AP boot.
> 
> Signed-off-by: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
> Signed-off-by: Norbert Kamiński <norbert.kaminski@3mdeb.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


