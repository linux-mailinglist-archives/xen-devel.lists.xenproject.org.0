Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4C56AFCFF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 03:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507954.782162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZjoh-0005lg-IE; Wed, 08 Mar 2023 02:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507954.782162; Wed, 08 Mar 2023 02:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZjoh-0005j1-FR; Wed, 08 Mar 2023 02:46:11 +0000
Received: by outflank-mailman (input) for mailman id 507954;
 Wed, 08 Mar 2023 02:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVfP=7A=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pZjog-0005iv-L1
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 02:46:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d6770fe-bd5b-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 03:46:03 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E8C97B81B72;
 Wed,  8 Mar 2023 02:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79D2C433EF;
 Wed,  8 Mar 2023 02:45:59 +0000 (UTC)
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
X-Inumbo-ID: 5d6770fe-bd5b-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678243560;
	bh=SAd1tPdVVGsfaed1KN+D1pZxgrRnXO9NXQTlv45uYNs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PpZLnkIiYFZ0RmX1Eb4Di0gmD4q31Og7v7wicPjxsB/Lxw+It/1LFFuxPvoXt8vxx
	 hlPX8G0dqL0i3DxXSfvpH/i0qKZgnoL1A9tSmucDCBQyAmx5e1pkQr7S516QLFNWib
	 MUhlNuIdLQKeqPdJ1aNduZ6uTlN7PdSz4qX6o/QTzfTNIPcof2NEKkagylM3PRysiw
	 pFsKmM2qzUA8PtfvlqvNKWipEtIpF85JlEmthQLOsg1CcEpq6kj0uBD2pJcXyDjrTs
	 yCay9fhCPJcjHZ8idBCJVlnVVPLUxT36jJ8Mh1TgMHmFyVSRAlxr+5D7qs3phCMEZc
	 GsIT63ZqHQWiQ==
Date: Tue, 7 Mar 2023 18:45:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3 2/2] automation: introduce a dom0less test run on
 Xilinx hardware
In-Reply-To: <805be02d-54ec-62e4-02ab-144b9be56880@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303071845530.863724@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2303061531240.863724@ubuntu-linux-20-04-desktop> <20230306233310.1993693-2-sstabellini@kernel.org> <805be02d-54ec-62e4-02ab-144b9be56880@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Mar 2023, Michal Orzel wrote:
> Hi Stefano,
> 
> On 07/03/2023 00:33, Stefano Stabellini wrote:
> > 
> > 
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > The test prepares dom0 and domU binaries and boot artifacts, similarly
> > to the existing QEMU test. (TBD: share preparation steps with the
> > regular QEMU tests.)
> > 
> > However, instead of running the test inside QEMU as usual, it copies
> > the binaries to the tftp server root, triggers a Xilinx ZCU102 board
> > reboot, and connects to the real serial of the board.
> > 
> > For now and due to its novelty, allow_failure on the Xilinx hardware
> > test, and only run the job on protected branches with XILINX_JOBS set to
> > true (the "master" and "staging" on gitlab.com/xen-project/xen qualify).
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thank you!

I spoke with Andrew and he also agreed on the series so I am going to
commit it with one minor change as requested by Andrew: the xilinx job
will not be optional but required. So I removed allowed_failure.

Cheers,

Stefano

