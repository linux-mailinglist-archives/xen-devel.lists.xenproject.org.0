Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA5B2CC30E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 18:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42917.77235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkVcG-0002PF-AI; Wed, 02 Dec 2020 17:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42917.77235; Wed, 02 Dec 2020 17:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkVcG-0002Oq-71; Wed, 02 Dec 2020 17:08:32 +0000
Received: by outflank-mailman (input) for mailman id 42917;
 Wed, 02 Dec 2020 17:08:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DXNT=FG=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1kkVcE-0002Ol-FB
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 17:08:30 +0000
Received: from mail.skyhub.de (unknown [2a01:4f8:190:11c2::b:1457])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebb0d06e-cdce-46b4-b125-b6fb0e05bed1;
 Wed, 02 Dec 2020 17:08:28 +0000 (UTC)
Received: from zn.tnic (p200300ec2f161b00329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f16:1b00:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 88AA91EC0445;
 Wed,  2 Dec 2020 18:08:27 +0100 (CET)
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
X-Inumbo-ID: ebb0d06e-cdce-46b4-b125-b6fb0e05bed1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1606928907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ySegBj5bw98Dubr8StQaVFXEi9kv05WveRbfqUYjPM=;
	b=nupJKD0sLAJ4R4UUPVoZaW60JPZLoqvGYStCVadIUPeYcxQBDe1TC8TasvCIz+cBpUSJMI
	dbbQFVbpPp5/4n1DfFyfcTn82NsC40ZfhEmqPlVJx0HXns7PsZW4zbP9lny+lXVOb5CUuO
	WZuBUXZ7PtfjieBd/pKYBpU6ZLcKRCA=
Date: Wed, 2 Dec 2020 18:08:23 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, peterz@infradead.org,
	luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 04/12] x86/xen: drop USERGS_SYSRET64 paravirt call
Message-ID: <20201202170823.GF2951@zn.tnic>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-5-jgross@suse.com>
 <20201202123235.GD2951@zn.tnic>
 <6be0d1a5-0079-5d90-0c38-85fe4471f1b8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6be0d1a5-0079-5d90-0c38-85fe4471f1b8@suse.com>

On Wed, Dec 02, 2020 at 03:48:21PM +0100, Jürgen Groß wrote:
> I wanted to avoid the additional NOPs for the bare metal case.

Yeah, in that case it gets optimized to a single NOP:

[    0.176692] SMP alternatives: ffffffff81a00068: [0:5) optimized NOPs: 0f 1f 44 00 00

which is nopl 0x0(%rax,%rax,1) and I don't think that's noticeable on
modern CPUs where a NOP is basically a rIP increment only and that goes
down the pipe almost for free. :-)

> If you don't mind them I can do as you are suggesting.

Yes pls, I think asm readability is more important than a 5-byte NOP.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

