Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC852B0A5
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 05:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331575.555105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrA6p-0000SR-VV; Wed, 18 May 2022 03:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331575.555105; Wed, 18 May 2022 03:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrA6p-0000Qd-SI; Wed, 18 May 2022 03:12:23 +0000
Received: by outflank-mailman (input) for mailman id 331575;
 Wed, 18 May 2022 03:12:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nrA6o-0000QX-Jr
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 03:12:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54b22b7a-d658-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 05:12:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDE86B81E5E;
 Wed, 18 May 2022 03:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F85DC385B8;
 Wed, 18 May 2022 03:12:18 +0000 (UTC)
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
X-Inumbo-ID: 54b22b7a-d658-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652843538;
	bh=/bXNAQ83vbS03juk3paZ340au3reFClkFeg3WeBW+yI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kh5yAZngV1xwN2uye96+w02/IDBjmLwOSpXivNoafstjWeNShfXVZockJlBMrAZm1
	 ybcIO0SyiGa8yt4OsYED7imcAAqUaV5dBLETEvGQdb2lHXVwbIr5d8WXzB3lGPF6sH
	 adTDf5e7TCO1rEUFtPmS0WtVlON5PS9mLWugM5Go+aeN8S42HCUeCIWWkTJeBTpL0n
	 FQLL6UXtZ95og/0hmxLj6fH7JeGqd0eQDfsmhIcGRry9q1AwOnuSmfQfe5IJpmu4pl
	 U/iVmv9yCGkCSwBxr6UypGex6vfsUrkMwaCvPlt4zZc2dWA8g1n9DyiE31F1l8xPze
	 rk0v1EA9rXvAw==
Date: Tue, 17 May 2022 20:12:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: George Dunlap <George.Dunlap@citrix.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Process for cherry-picking patches from other projects
In-Reply-To: <5e4d505c-a02c-eb54-8299-b1078943a8a5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205172012100.1905099@ubuntu-linux-20-04-desktop>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com> <5e4d505c-a02c-eb54-8299-b1078943a8a5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 May 2022, Jan Beulich wrote:
> Hmm. The present rules written down in docs/process/sending-patches.pandoc
> are a result of me having been accused of unduly stripping S-o-b (and maybe
> a few other) tags. If that was for a real reason (and not just because of
> someone's taste), how could it ever be okay to remove S-o-b? (Personally I
> agree with what you propose, it just doesn't line up with that discussion
> we had not all that long ago.)

This is the meaning of the DCO: https://developercertificate.org

The relevant case is:

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

IANAL but I read this as to mean that only the submitter Signed-off-by
is required. Also consider that the code could come from a place where
Signed-off-by is not used. As long as the copyright checks out, then we
are OK.

