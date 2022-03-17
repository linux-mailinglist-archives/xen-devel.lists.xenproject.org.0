Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B608C4DD0CE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 23:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291782.495494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUyg8-0006V6-Fe; Thu, 17 Mar 2022 22:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291782.495494; Thu, 17 Mar 2022 22:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUyg8-0006S7-Cm; Thu, 17 Mar 2022 22:33:08 +0000
Received: by outflank-mailman (input) for mailman id 291782;
 Thu, 17 Mar 2022 22:33:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbXJ=T4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nUyg7-0006S1-Im
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 22:33:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36a75ced-a642-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 23:33:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C13C60A69;
 Thu, 17 Mar 2022 22:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AEDC340E9;
 Thu, 17 Mar 2022 22:33:03 +0000 (UTC)
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
X-Inumbo-ID: 36a75ced-a642-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647556384;
	bh=iMUKvDmAekaOokQPpgVIlZuMfZgSOS8Wf2NtIclVUJ4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ANzo5b43NRbTYze+e2pDucfAnrZz6RPBfdTI3SCIQOVMn9bbKAmpZbv1BtOl+bGIb
	 /bH1l6IQjHWuS3w78DfkPU3HHxU0bqpin1LfR3BtrDCpJmPh1vmQZWQScRkjXMHJSa
	 uDUhRNsMKqaWa5rfUAj9Kq7Ia53By3jilX/e03k7Kc6WDENeey1HoWQcP6oYTLBaSg
	 6BZPaFkKCIVMmknaeAUm2ipK1z4j4sKeHGdoysDCAddh4z1JAbZX5hFCUET8JNowee
	 9NdObATwaR9LVf18FyuJqkoRQuGu9U1Ud8MS2Wf97OmbDlDixz8I/vyoNvwbwVu0W7
	 hLHpT/r8Yi4Lw==
Date: Thu, 17 Mar 2022 15:33:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org, 
    roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [PATCH v11 3/3] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
In-Reply-To: <20220317140046.64563-4-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2203171532440.3497@ubuntu-linux-20-04-desktop>
References: <20220317140046.64563-1-ayankuma@xilinx.com> <20220317140046.64563-4-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Mar 2022, Ayan Kumar Halder wrote:
> When the data abort is caused due to cache maintenance for an address,
> there are three scenarios:-
> 
> 1. Address belonging to a non emulated region - For this, Xen should
> set the corresponding bit in the translation table entry to valid and
> return to the guest to retry the instruction. This can happen sometimes
> as Xen need to set the translation table entry to invalid. (for eg
> 'Break-Before-Make' sequence). Xen returns to the guest to retry the
> instruction.
> 
> 2. Address belongs to an emulated region - Xen should ignore the
> instruction (ie increment the PC) and return to the guest.
> 
> 3. Address is invalid - Xen should forward the data abort to the guest.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

