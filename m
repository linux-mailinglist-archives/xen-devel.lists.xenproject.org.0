Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CA79A325E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 04:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821516.1235373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1cIW-0001BJ-PW; Fri, 18 Oct 2024 02:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821516.1235373; Fri, 18 Oct 2024 02:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1cIW-00019b-Mo; Fri, 18 Oct 2024 02:01:00 +0000
Received: by outflank-mailman (input) for mailman id 821516;
 Fri, 18 Oct 2024 02:00:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WtqF=RO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t1cIU-00019V-Uw
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 02:00:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d005a6d4-8cf4-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 04:00:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F9925C5962;
 Fri, 18 Oct 2024 02:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02B0C4CEC3;
 Fri, 18 Oct 2024 02:00:53 +0000 (UTC)
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
X-Inumbo-ID: d005a6d4-8cf4-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729216855;
	bh=7PTAIz+36Vc79ODWymyO64T6mDCP1k7N1wRDWcZcvDM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kbg3HS6DkPt9RNYsNfaP3B2jDiXGzCp7pAnMKSOM0mUC0jRRAXGTXaHL2FOdga6AV
	 0XI+YOSb2B9Y5nhWlS0ySDBf2PMEdaZKFAlBhJ0yj8yIo6jFpYSn7ZsAiggWjbO2lL
	 rGbbzwK+zpIEhRT5hwWK4LhVpY6Wt9VuZcTpLCFK+p8bHfYKDriZ669JllIJDM0NRq
	 foetEZ+rzPv+B6WCORaho2iTR4QUJX8+iuYlxN7UEC3oQMn2OgroWVNiHzAKIrXG+h
	 klLLZ18KD72n2V4OInssfHHg5Ve9pIiDYrcocyi7n62nIiCWyT14CbxhSsrcj7UC4G
	 gtsJMEoOjzDlA==
Date: Thu, 17 Oct 2024 19:00:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [XEN PATCH v1 3/3] CI: Refresh and upgrade the Fedora
 container
In-Reply-To: <ZxFDUf2zYE1Qzr6v@l14>
Message-ID: <alpine.DEB.2.22.394.2410171900240.2416588@ubuntu-linux-20-04-desktop>
References: <cover.1729170005.git.javi.merino@cloud.com> <178560672106e37648304f5e597cc0b16c8db6db.1729170005.git.javi.merino@cloud.com> <ZxFDUf2zYE1Qzr6v@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Oct 2024, Anthony PERARD wrote:
> On Thu, Oct 17, 2024 at 05:20:21PM +0100, Javi Merino wrote:
> > From: Andrew Cooper <andrew.cooper3@citrix.com>
> > 
> > Fedora 29 is long out of date.  Move forward 5 years to Fedora 40.
> > 
> > Include all the usual improvements.  Rework the container to be non-root, use
> > heredocs for legibility, and switch to the new naming scheme.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Assuming it was tested successfully:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


