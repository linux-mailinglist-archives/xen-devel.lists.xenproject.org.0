Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F54433BD
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 17:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220438.381718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhwxo-0005MH-Rp; Tue, 02 Nov 2021 16:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220438.381718; Tue, 02 Nov 2021 16:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhwxo-0005Jv-O0; Tue, 02 Nov 2021 16:48:44 +0000
Received: by outflank-mailman (input) for mailman id 220438;
 Tue, 02 Nov 2021 16:48:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhwxn-0005JZ-Dh
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 16:48:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhwxn-0001YY-AT
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 16:48:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhwxn-0006mN-9d
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 16:48:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhwxW-0001hI-VE; Tue, 02 Nov 2021 16:48:26 +0000
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
	bh=C221EggYl6Pd3fYSCJGJ8jEmVvm8Y33iC1Ea3euEziA=; b=Dj6uBZzJ5df+5UZQXfu17Rpjec
	SL23MXKKwRP40BB5WYMthiMbV8l7McU9Ra2WjyITlPy5yHGwST0wC7SosBPWXYONpQuDtgaIvPPx0
	jYUbXlV/du8x1Acup2oSDa5ByzfeCZm9D5fgR8VRTwTX+AHe3b0rZUyX7dmvSzpSEMT0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24961.27610.418674.441068@mariner.uk.xensource.com>
Date: Tue, 2 Nov 2021 16:48:26 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Dongli Zhang <dongli.zhang@oracle.com>,
    sstabellini@kernel.org,
    julien@xen.org,
    Volodymyr_Babchuk@epam.com,
    andrew.cooper3@citrix.com,
    george.dunlap@citrix.com,
    wl@xen.org,
    joe.jin@oracle.com,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/1] xen: update system time immediately when
 VCPUOP_register_vcpu_info
In-Reply-To: <ec809d19-670c-bc91-7b08-0cb7734f0d80@suse.com>
References: <20211025173523.3647-1-dongli.zhang@oracle.com>
	<fdcc4adb-c823-2c08-57ed-e4306c1e186e@suse.com>
	<24961.24756.236341.888900@mariner.uk.xensource.com>
	<ec809d19-670c-bc91-7b08-0cb7734f0d80@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 1/1] xen: update system time immediately when VCPUOP_register_vcpu_info"):
> I don't see any noteworthy risks - a call to a function gets added
> in a 2nd place; the function itself has been working fine for years,
> and it is fine to be used in this new context.

Thanks.

I think this part:

| it is fine to be used in this new context.

was where I wanted a 2nd opinion for confirmation.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

