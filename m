Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677939C809A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 03:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836028.1251911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBPWh-00064I-Sx; Thu, 14 Nov 2024 02:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836028.1251911; Thu, 14 Nov 2024 02:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBPWh-00062I-Q6; Thu, 14 Nov 2024 02:24:07 +0000
Received: by outflank-mailman (input) for mailman id 836028;
 Thu, 14 Nov 2024 02:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npsv=SJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tBPWg-00062C-Jw
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 02:24:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83251571-a22f-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 03:24:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 558615C59FA;
 Thu, 14 Nov 2024 02:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D02FC4CEC3;
 Thu, 14 Nov 2024 02:23:59 +0000 (UTC)
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
X-Inumbo-ID: 83251571-a22f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjgzMjUxNTcxLWEyMmYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTUxMDQ0LjQxMDE2Miwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731551041;
	bh=L5HFsfr+BApkigXVeX/+BvlJX2/g+/I04iWxXLqn8vY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lm7TT4HmtqeRD5VFP1plxzSHey12ZqXBAe6K6YPyJ6kz2wMd0PpN09nwkPaFxWdqq
	 uN2ckS+7SF0jZ0/vgQ5VGVA5qnbw4PFVXvVyLXxFuQiICbN0XB+YbsBrXR2wPbTDhD
	 XhDjFKmWX5jwss/EYKFzS7XUpMkp+ZKbBHj2hzQKhLJvIOA61JadN8pL+Jdiuwn+VD
	 LaVWO51qrH7noCegMLSMorRYxJxMf3Z/hI2As6p+KXt2t6CtJ8cNmCt/xvnZSWfNRK
	 PDNQ5xnEuBD9h/WKAJd3ccOLp5FxmiQkF5Qt62WeNqqdA13Z5q+0fVOcs5GKtLRUWl
	 aRRSK8cndNkVg==
Date: Wed, 13 Nov 2024 18:23:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: alessandro.zucchelli@bugseng.com, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen:add deviations for MISRA C 2012 Rule R5.2
In-Reply-To: <24b117ed-dd5a-47a7-8c5d-ddddd7407ac9@suse.com>
Message-ID: <alpine.DEB.2.22.394.2411131822260.222505@ubuntu-linux-20-04-desktop>
References: <41a1127e6d77d2be350e7679bd1034e0c2918e94.1731487210.git.alessandro.zucchelli@bugseng.com> <39168f90-7c80-451d-9c20-50da0de4af78@suse.com> <3789df92285b2c08b855369f46f3a229@bugseng.com> <24b117ed-dd5a-47a7-8c5d-ddddd7407ac9@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Nov 2024, Jan Beulich wrote:
> On 13.11.2024 11:48, Alessandro Zucchelli wrote:
> > At this link you can see all the violations of Rule 5.2:
> > 
> > https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/40_characters/X86_64/8143097084/PROJECT.ecd;/by_service/MC3R1.R5.2.html
> 
> Thank you. From a cursory look these all appear to be a result of the 40
> chars limit we put in place (quite arbitrarily). That's not mentioned at
> all ...
> 
> > By deviating the two macros CHECK_NAME_ and DEFINE_COMPAT_HANDLE all the 
> > violations are addressed.
> > 
> > On 2024-11-13 11:31, Jan Beulich wrote:
> >> On 13.11.2024 09:41, Alessandro Zucchelli wrote:
> >>> This addresses violations of MISRA C:2012 Rule 5.2 which states as
> >>> following: Identifiers declared in the same scope and name space shall
> >>> be distinct.
> >>>
> >>> This deviation addresses violations of Rule 5.2 arising from
> >>> identifiers generated through token pasting macros CHECK_NAME_ and
> >>> DEFINE_COMPAT_HANDLE.
> 
> ... in the description.
> 
> Together with the 5.4 patch having the same lack of context, I wonder
> whether we shouldn't simply up that limit.

Yes: if we up to the limit to 64 (another arbitrary number), can be mark
both 5.4 and 5.1 as clean? If so, I think we should do it right away.


> Or else, as suggested there,
> to instead exclude such derived identifiers. After all the derived ones
> will be distinct as long as what they're derived from is distinct.
> 
> Finally - please don't top-post.
> 
> Jan
> 
> >> For each of the two, can you provide an example of where collisions
> >> result? At least for the latter I can't even see how that would
> >> work without the compiler complaining (i.e. the build breaking).

