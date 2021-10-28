Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30943E316
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 16:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218065.378353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg64Z-0004iD-P1; Thu, 28 Oct 2021 14:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218065.378353; Thu, 28 Oct 2021 14:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg64Z-0004ek-LX; Thu, 28 Oct 2021 14:08:03 +0000
Received: by outflank-mailman (input) for mailman id 218065;
 Thu, 28 Oct 2021 14:08:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg64Y-0004ec-II
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:08:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg64Y-0000W3-GX
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:08:02 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg64Y-0004wW-FV
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:08:02 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mg64Q-0002Iu-6U; Thu, 28 Oct 2021 15:07:54 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=rGbI1nrbEtRmTuOQzyt+xuWb0qGYgmHYv+GOx5TdSAM=; b=uvYds+3CwPADEzYOQcLJtIlsMS
	XK9z/LbIS68NWpAwKRy90bvaV3TUtxFjwAilaelZn1xNIwIbVh2YadVMyOJc+k2cndHyE9lKBRThm
	XRzxNmlIDiuKakBRHN1BfY+OBBzL3hoJN9Ws2DWShoCmnnCCctFsaeSHKuqjlraPw46M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24954.44729.11634.91132@mariner.uk.xensource.com>
Date: Thu, 28 Oct 2021 15:07:53 +0100
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@arm.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien.grall.oss@gmail.com>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
In-Reply-To: <5bd3b7e3-5193-4d16-5d3a-950d973e664d@xen.org>
References: <20211026122903.15042-1-michal.orzel@arm.com>
	<e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org>
	<70c30a6c-b779-805e-079a-41bb484894b9@xen.org>
	<cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com>
	<01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
	<alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s>
	<CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
	<alpine.DEB.2.21.2110271658330.20134@sstabellini-ThinkPad-T480s>
	<4554621d-63da-ea3e-e56a-4e01d0cef347@xen.org>
	<560e75eb-fa0d-a13a-219c-3c1db0b28fa1@arm.com>
	<5bd3b7e3-5193-4d16-5d3a-950d973e664d@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock"):
> Right. PCI passthrough is not going to work in 4.16 whether this patch 
> is merged or not. We are past the code freeze and as you said the code 
> (and potentially the locking) is going to be reworked for PCI passthrough.
> 
> So, I think this is a bad idea to rush this patch in 4.16. Instead, we 
> should focus on getting a consistent locking for 4.17 that would cover 
> the removal part and all PCI and DT concurrent call.

Thanks for this clear communication.  As the release manager I very
much appreciate it.  Michal, do you disagree with Julien's analysis ?

If not, I would like to take this patch off my list of stuff I have on
my radar for 4.16.

Thanks,
Ian.

