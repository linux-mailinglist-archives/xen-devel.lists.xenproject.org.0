Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BC668CAF9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 01:10:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490761.759599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPBYj-0004qk-BV; Tue, 07 Feb 2023 00:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490761.759599; Tue, 07 Feb 2023 00:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPBYj-0004nD-7d; Tue, 07 Feb 2023 00:10:05 +0000
Received: by outflank-mailman (input) for mailman id 490761;
 Tue, 07 Feb 2023 00:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFvJ=6D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pPBYi-0004Yx-69
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 00:10:04 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c24db898-a67b-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 01:10:01 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3AEE4CE0ACC;
 Tue,  7 Feb 2023 00:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D255C433EF;
 Tue,  7 Feb 2023 00:09:53 +0000 (UTC)
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
X-Inumbo-ID: c24db898-a67b-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675728594;
	bh=ePu9a/G+QBwUyf7aBR4H9QVI54kwod4y9QZMvCVKXes=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CKTUSbxxaWZOxAmww08e9b9LaC0MUOJ4wXVAPtBA5CzLhQNwaYXGbb3/kBJK3nj/l
	 CQ1MvNhp5dhPxOZCiWjWKVklcDmkhwAfIGDRp+262GjbQx88nxWm3WcfkcOQz+Ln1l
	 WjEbVuqVXaYvpvOqjeZC47Zu3bdoKdlIRUdAmYrm4gkYylAnsimPhaThMbO2UK0WyI
	 +T1hO0pE4zdzurm9k/w4pmsJqUr0m6VM97MIazd8e4s/UUtX4g7yuBhCTi7lR7xSNp
	 w5Y9vQWm99lp44YUOzbbZyYo7BuBm5Ek2erGfr9oTfj4lpdZ5kmaqAU5rUEt5GQv8J
	 M7kJIgZ/5IIfw==
Date: Mon, 6 Feb 2023 16:09:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: ehem+xen@m5p.com, george.dunlap@cloud.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    julien@xen.org
Subject: Re: [PATCH] xen/arm64: Default ACPI support enabled
In-Reply-To: <3b2f49cd-195c-f69b-b5d4-681a7cad58d5@xen.org>
Message-ID: <alpine.DEB.2.22.394.2302061555440.132504@ubuntu-linux-20-04-desktop>
References: <202302031801.313I1SdK033264@m5p.com> <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com> <15b88500-89b0-507a-601c-84a8102bb550@xen.org> <Y+EmIHDyvSCHjEo+@mattapan.m5p.com> <1d685b34-940b-b8ca-e689-b5a42eaccea1@xen.org> <Y+FjUTXdcoy3W9th@mattapan.m5p.com>
 <3b2f49cd-195c-f69b-b5d4-681a7cad58d5@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+George

On Mon, 6 Feb 2023, Julien Grall wrote:
> On 06/02/2023 20:30, Elliott Mitchell wrote:
> > The situation is changing in large entities are pushing ACPI for ARM.  If
> > they succeed (likely) then it will be a case of Xen/ARM MUST support
> > ACPI, or else the project will die. 

We need to be careful when making wide-reaching marketing statements because:
- it is always extremely hard to make accurate prediction of the future
- even seasoned experts often make major guessing mistakes

Bill Gates predicted that OS/2 would take over the world in '87. Many
people on xen-devel might not even know what OS/2 is.

I am not aware of any plans by Xilinx (now AMD) to replace Device Tree
with ACPI. In fact we are investing in Device Tree with System Device
Tree and other related activites (Lopper, etc.)


I suggest to keep the discussion technical and practical. As a
community, we don't enable experimental/unsupported features by default
for obvious reasons. In this case, the feature (ACPI) might give a
chance to Xen to boot on a given platform.

Do we want to make an exception for ACPI to be enabled by default even
if experimental/unsupported? If so, we can look into the details of how
to do that.

But first, we need a policy decision. Who should be the people making
this decision? I'll let George as Community Manager decide if the
decision stands with the ARM maintainers or with the committers.

