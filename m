Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6B8429B0C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 03:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206656.362282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma6eh-0001Rc-6h; Tue, 12 Oct 2021 01:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206656.362282; Tue, 12 Oct 2021 01:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma6eh-0001PV-2U; Tue, 12 Oct 2021 01:32:35 +0000
Received: by outflank-mailman (input) for mailman id 206656;
 Tue, 12 Oct 2021 01:32:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIAI=PA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ma6ef-0001Od-NT
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 01:32:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 456a324a-2afc-11ec-8102-12813bfff9fa;
 Tue, 12 Oct 2021 01:32:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28F8060F43;
 Tue, 12 Oct 2021 01:32:32 +0000 (UTC)
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
X-Inumbo-ID: 456a324a-2afc-11ec-8102-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634002352;
	bh=LehBiNxPKkdBlc0pnX5/g6rgQkE4rqRjslMnfsgQJB8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gWJ4H2vVY7t/wGWZBcDS7nPcjQo3YklTOakwewlKA500Ja9/boFudUJCDphArBcLr
	 4jmfGgXf6kl1L/F+csfXcTRX6AmjvVm2NVF/75cJeEqPUOrdNZwh6/7P3OHWqaGOHQ
	 +LZ4zFHwRe2GMZ1eNLfZxpUFlbgq/sI8PqHAnGBRDCA5WWx7p/ZLca2DYbkq/uJr6s
	 ME+7QOiQnA/ybqSlhroLMCz7N5vksYdJj3bn8PW0jPpR9RbfO0meSzFCw2sGeBvw0U
	 BZ6HGtoFuE+Q/wh0MRWjtjjN6QeE1Eq5LJHz68BSeUW6x3fhC0HyPm6J6itAqLpJnS
	 NhpfiQjJIA6JA==
Date: Mon, 11 Oct 2021 18:32:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andre Przywara <Andre.Przywara@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 09/11] xen/arm: Transitional change to build HAS_VPCI
 on ARM.
In-Reply-To: <647F47F9-E89B-43C3-8226-5F59286CA0C8@arm.com>
Message-ID: <alpine.DEB.2.21.2110111318460.25528@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <b9653c6247060574cf68e1f780ef1db3dd0c20d3.1633540842.git.rahul.singh@arm.com> <YWQjTOypE96IqWmA@MacBook-Air-de-Roger.local> <647F47F9-E89B-43C3-8226-5F59286CA0C8@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-763960906-1633983540=:25528"
Content-ID: <alpine.DEB.2.21.2110111832290.25528@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-763960906-1633983540=:25528
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110111832291.25528@sstabellini-ThinkPad-T480s>

On Mon, 11 Oct 2021, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 11 Oct 2021, at 12:43, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Oct 06, 2021 at 06:40:35PM +0100, Rahul Singh wrote:
> >> This patch will be reverted once we add support for VPCI MSI/MSIX
> >> support on ARM.
> >> 
> >> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> >> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Reviewed-by: Roger Pau Monné <rogewr.pau@citrix.com>
> 
> Thanks

Thanks! I committed this patch.
--8323329-763960906-1633983540=:25528--

