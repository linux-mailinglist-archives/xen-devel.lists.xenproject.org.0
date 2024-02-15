Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4C7855896
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 02:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681210.1059841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raQEc-00051d-9Q; Thu, 15 Feb 2024 01:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681210.1059841; Thu, 15 Feb 2024 01:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raQEc-0004ze-6o; Thu, 15 Feb 2024 01:08:18 +0000
Received: by outflank-mailman (input) for mailman id 681210;
 Thu, 15 Feb 2024 01:08:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Am97=JY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1raQEa-0004zW-W7
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 01:08:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1696e61-cb9e-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 02:08:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E6BB961BAF;
 Thu, 15 Feb 2024 01:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F9FC433F1;
 Thu, 15 Feb 2024 01:08:11 +0000 (UTC)
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
X-Inumbo-ID: b1696e61-cb9e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707959292;
	bh=5Q/RVqOudlFSQhp6a5DJPyfkNbZS1Px8Ch1jDrJZJXQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hJyHDvv5Rkx/xrV47j2ITxJTKBQpiOiAVM90lGBTIg7Ufoz08YQ1nNy7Y8YU6lWWB
	 Ethdt5SL124D9Fy/ydkXO3TgtEHXgoR+8P+p4I9A1X+bGI4/3a/p41htTYNFTyp3A3
	 gOw1/PYiNpvMyKSrCV/Heza+rtTSeNQTpeRMHMEJJ3qz04Fri9wBT0/akej4pe+3hr
	 3IWCKIutn5IoN/91c4reuZ4N4F1cXCJE7b+WhI107265WvZlnT7iUuc4HNhzTf0NJe
	 7OAGb/cpuNxtNijqKzmOvrACVkxloLBjjDBKWIboZuYnd3j/5/2WsZFn8fxQ+56um5
	 ayOoEmEkyB4Kw==
Date: Wed, 14 Feb 2024 17:08:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/3] xen-analysis.py: Enable Xen deviation tag at the
 end of the line
In-Reply-To: <20240131110241.3951995-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2402141707290.1925432@ubuntu-linux-20-04-desktop>
References: <20240131110241.3951995-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jan 2024, Luca Fancellu wrote:
> This serie is enabling the xen-analysis tool to parse and substitute correctly
> a deviation tag put at the end of the line containing a deviation to be deviated.
> 
> Before this serie the only way to deviate a violation was to put the tag in the
> line above:
> 
> /* SAF-<id>-safe deviate the bla bla bla */
> <line containing the violation>
> 
> But there are places in the code base where using the tag in the line above is
> not convinient, for example:
> 
> if ( (expression) &&
>      ((expression with violation) ||
>      (expression) )
> {
>   [...]
> }
> 
> In the above example is better to have the suppression comment at the end of the
> line:
> 
> if ( (expression) &&
>      ((expression with violation) || /* SAF-<id>-safe deviate the bla bla bla */
>      (expression) )
> {
>   [...]
> }
> 
> This clearly brings up the question about the code style line length, which in
> this case needs to be amended for Xen deviation tags that goes above the limit.


Hi Luca,

I tested the series in a number of configurations and everything works
as expected. Great!

For the whole series:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

