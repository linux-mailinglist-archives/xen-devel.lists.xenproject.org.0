Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E2E70421A
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 02:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534900.832377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyiIn-0005sk-Ez; Tue, 16 May 2023 00:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534900.832377; Tue, 16 May 2023 00:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyiIn-0005qO-BT; Tue, 16 May 2023 00:12:29 +0000
Received: by outflank-mailman (input) for mailman id 534900;
 Tue, 16 May 2023 00:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyiIm-0005nK-JE
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 00:12:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56ece042-f37e-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 02:12:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76E0C611EE;
 Tue, 16 May 2023 00:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFC5C433D2;
 Tue, 16 May 2023 00:12:24 +0000 (UTC)
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
X-Inumbo-ID: 56ece042-f37e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684195945;
	bh=VYP4YsMzJK7J+FTeSVMVRGmOiXTfHuodRvufuPmrgPo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F+0KCvGawRQjrxFPd5abQz3pQyUbH/WIVTb+0PF4zgIxL28eiIWceBqVIALCI0irF
	 W2Wd6zujC5WQZw2KZPUxV580T2TQD/hHR5ITL+xVrh9IK1KSW5/GOShL0G/zs3MLo2
	 YKZlEB1iXZmYIPeZC2OcJnjB4GwBtaMkkHERILhn70VGd4R3BVMf7wvyfdT1harth3
	 14VyF9tAZiZiQzMCUcSOrSBwlnzXeYeKnwTd95VrcmNTQrm/sEFBZdNK4k7Ft4AXRf
	 lU+3gW+Dcqstw/s84qAg7kNroUWxYU/UPptl3ynoYo+fnYhVX6vDEjA8jYhrg5W73Z
	 8oGl07VTP2apg==
Date: Mon, 15 May 2023 17:12:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, roger.pau@citrix.com, 
    andrew.cooper3@citrix.com
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
In-Reply-To: <c22a8925-15e4-47b9-6f5d-f85bbe802255@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305151711480.4125828@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop> <20230513011720.3978354-2-sstabellini@kernel.org> <c22a8925-15e4-47b9-6f5d-f85bbe802255@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 May 2023, Jan Beulich wrote:
> On 13.05.2023 03:17, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> > the tables in the guest. Instead, copy the tables to Dom0.
> 
> Do you really mean "in the guest" (i.e. from Xen's perspective, i.e.
> ignoring that when running on qemu it is kind of a guest itself)?

Yes, I posted the memory corruption info I have on a separate email


> I also consider the statement too broad anyway: Various people have
> run PVH Dom0 without running into such an issue, so it's clearly not
> just "leads to".

Fair enough

