Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0822C929C2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 17:47:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175035.1499954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP1cM-00066t-Fx; Fri, 28 Nov 2025 16:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175035.1499954; Fri, 28 Nov 2025 16:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP1cM-00064S-Bm; Fri, 28 Nov 2025 16:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1175035;
 Fri, 28 Nov 2025 16:46:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGCQ=6E=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1vP1cK-00064M-3e
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 16:46:44 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d06ea8ff-cc79-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 17:46:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 13E3F6016F;
 Fri, 28 Nov 2025 16:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68719C4CEF1;
 Fri, 28 Nov 2025 16:46:39 +0000 (UTC)
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
X-Inumbo-ID: d06ea8ff-cc79-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764348399;
	bh=2/LDXJbhzfaY8TgSwz0wTHwET8ytYKSX0vuKmjOg9q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPTyQiqSWeJ3qKgwhHuE5OPm2JY5XfYMHBl1vU3fZitjs7TtFqOXG3NzAuDjD6JNW
	 IFbSUWsKQ0fmzhLxmPezWj4XweDRXlKLO/6wj5x6PGVU6GfETcgUXjUCWTOS0jxTcw
	 HrvAv/MQ4sVAHQA9n3NwhVs6TjQW+ftvxO/Zj2cidFS/fQMoqa2opCqEUyq9v+LMQF
	 XLIyGc5/Rfig+zszKHU8nQqXljrzlaGN3IPiGjIm7svpG7zmQeKX2kAQ/6WxkNR76s
	 xk50wEPHeuten1KOHxMbuYOzD/oV+DNMSogIHtvNp7AynWGz55u2t8KMobEg0LpQbj
	 EgI5QnJFNq6lA==
Date: Fri, 28 Nov 2025 09:46:37 -0700
From: Keith Busch <kbusch@kernel.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: qemu-devel@nongnu.org, Peter.Turner@cloud.com, ngoc-tu.dinh@vates.tech,
	Klaus Jensen <its@irrelevant.dk>,
	Jesper Devantier <foss@defmacro.it>, xen-devel@lists.xenproject.org
Subject: Re: Default NVMe MDTS value causes Widnows Server 2025 hangs and
 BSODs (during install at least)
Message-ID: <aSnR7elEI_aJ1fFM@kbusch-mbp>
References: <aSl5X4dJHACpJHPU@Mac.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSl5X4dJHACpJHPU@Mac.lan>

On Fri, Nov 28, 2025 at 11:28:47AM +0100, Roger Pau Monné wrote:
> Hello,
> 
> As part of XenServer Windows Server 2025 testing using Xen plus QEMU
> we discovered an issue during install that would lead to either the
> Windows installer getting stuck without making progress (albeit the
> screen was still showing the spinning circle correctly) or a BSOD that
> doesn't seem to have a unique number, the most common one was 0x50
> (PAGE_FAULT_IN_NONPAGED_AREA).
> 
> After a fair amount of debugging and following incorrect leads we have
> narrowed down what triggers the issue to QEMU emulated NVMe reporting
> a MDTS value of 7 by default (so max request size of 512KiB).
> Switching to higher MDTS values seemed to solve the issue.
> 
> The commit that made that change:
> 
> e137d20e7dff hw/block/nvme: add check for mdts
> 
> Didn't contain much justification for the change from unlimited to
> 512KiB max request size.
> 
> Windows is like a black box to me, but I believe there's some error in
> the Windows logic that splits requests, and hence when MDTS is set to
> a sufficiently low value, and Windows has to split NVMe requests, it
> causes Windows to hit an internal bug.  This will be raised with
> Microsoft to get the issue debugged and possibly fixed on their side.
> 
> From limited experimentation setting mdts to 10 (so 4MiB max request
> size) or 9 (2MiB) workarounds the issue.
> 
> Would it be acceptable for QEMU NVMe to consider increasing the
> default MDTS value to something higher than 7 to workaround the issue?
> I've tested both 9 and 10 and they prevent the issue, I would avoid 8
> as it's too close to the current one that causes issues.  I don't have
> many references of other emulated NVMe implementations, I just know
> about Bhyve emulated NVMe, which sets MDTS to 9.
> 
> If bumping MDTS to a higher value is acceptable please let me know and
> I will prepare a patch.

The mdts value is a prameter you can set at the command line. The 512k
default is really pretty reasonable, but you can set it up to 2MB
(mdts=9) if you want before hitting a different software limit that
won't let you go any higher. So rather than patch the device, I'd
recommend you just modify your startup command line parameters instead.

Not sure if it's still the case, but there was a time when Windows
Storport's maximum IO size had been limited to 128k, and that's exactly
what many nvme devices reported for MDTS, so Windows is certainly
supposed to work correctly with such values.

