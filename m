Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A404297F6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 22:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206558.362166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma1cF-0007B5-4w; Mon, 11 Oct 2021 20:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206558.362166; Mon, 11 Oct 2021 20:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma1cF-000782-1L; Mon, 11 Oct 2021 20:09:43 +0000
Received: by outflank-mailman (input) for mailman id 206558;
 Mon, 11 Oct 2021 20:09:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ma1cE-00077w-0Z
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 20:09:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ad9d5e8-2acf-11ec-80f4-12813bfff9fa;
 Mon, 11 Oct 2021 20:09:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B0F160E54;
 Mon, 11 Oct 2021 20:09:39 +0000 (UTC)
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
X-Inumbo-ID: 2ad9d5e8-2acf-11ec-80f4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633982980;
	bh=jnGaE5g/va4Gc5z2OyMEuCE0QBZfW5iZSXLNifEFSII=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Unzv9EK64YQz3uVZtUGAJJfNOsQ30yyX0KUIazox6INRg/kEKq5Oebasr85VxE5jf
	 7xoq0TvelF+/ETMIu3f3p9PnaVWduCg9RLWxsx15+IajJ40J3ov7vuU9d8mUtSL2SZ
	 iQ+x5Fk2k3z3q8BWQ8BDuiw+5ol5nhrSmPr1WRPWq26y32Ns0qv6WwdPuVixoLOVWe
	 UV/3DBoQHaq+0BnPjLoklHa9YXLK69wL9Bti0I48mBXZH2eZ36tFdFoMpCL1WIDO0b
	 oVj0L11M9fQMfXWFPOtbXNTwlrudU9LLxmaL5xZQq754uqm+JKNmqGomNplH2XMAeF
	 E4wfNM8DksjVQ==
Date: Mon, 11 Oct 2021 13:09:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Michal Orzel <michal.orzel@arm.com>
cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Nick Rosbrook <rosbrookn@ainfosec.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
Subject: Re: [PATCH v4 3/3] xen: Expose the PMU to the guests
In-Reply-To: <20211011090047.8878-4-michal.orzel@arm.com>
Message-ID: <alpine.DEB.2.21.2110111308230.25528@sstabellini-ThinkPad-T480s>
References: <20211011090047.8878-1-michal.orzel@arm.com> <20211011090047.8878-4-michal.orzel@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Oct 2021, Michal Orzel wrote:
> Add parameter vpmu to xl domain configuration syntax
> to enable the access to PMU registers by disabling
> the PMU traps(currently only for ARM).
> 
> The current status is that the PMU registers are not
> virtualized and the physical registers are directly
> accessible when this parameter is enabled. There is no
> interrupt support and Xen will not save/restore the
> register values on context switches.
> 
> Please note that this feature is experimental.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Signed-off-by: Julien Grall <julien@xen.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I just wanted to say that I don't have any further comments on this
patch (I saw the ones from Julien which are fine)


