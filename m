Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B5BAEEA81
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 00:34:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029311.1403070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWN4N-0004AR-V5; Mon, 30 Jun 2025 22:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029311.1403070; Mon, 30 Jun 2025 22:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWN4N-00047Z-S5; Mon, 30 Jun 2025 22:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1029311;
 Mon, 30 Jun 2025 22:33:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72g7=ZN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uWN4L-00047T-Rr
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 22:33:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 450c2bb5-5602-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 00:33:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 055E55C4AF7;
 Mon, 30 Jun 2025 22:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FE9C4CEE3;
 Mon, 30 Jun 2025 22:33:36 +0000 (UTC)
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
X-Inumbo-ID: 450c2bb5-5602-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751322818;
	bh=vkuoGTmfjS9ph8yoPPL9os/Cf8RjuXqnbO56e9M2Ats=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aOyEbEam6smZjrZgmIa/rIDL7d02MET7TsaKrcsfaH9pLy6Ug3Z2EicmSNqb9X3Op
	 1SyeT5xbGljGvhaeerpGSMYjSi908tpW4LpNcCBhL4B11QWBviQNC505SPGwVJAIhP
	 cMyBYnaHtED+5LMvD2KCR/bwZCm7raP3xtoUiFiCXz2qi7cg7eRJwpBi22UT4PzFOO
	 RPEsVZHOUHclg1OeMG0P1TH99Sx8JHjhXr/5qvwyFaQeNKqTXqEaWt+5J3QqhPTbhl
	 hhZ3jr2oAwcPI1XW9Os+p/i6VKgJ9RUCqN9lfHGPDJejEOa7NmuvOD4Felp4y1zpFv
	 OXNSILTHz0bdQ==
Date: Mon, 30 Jun 2025 15:33:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 8/8] docs: armproposa: l to add separate SCMI node
 for Xen agent
In-Reply-To: <5992e6bf-e9ea-480f-bcd3-a6cf1c335190@xen.org>
Message-ID: <alpine.DEB.2.22.394.2506301530480.862517@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <3f7e1e99f5d1018064f3c4825aff16bd487cf558.1747669845.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2505231309090.147219@ubuntu-linux-20-04-desktop> <e5e8b7b3-a9c3-4e1a-9241-6776990b6e11@epam.com>
 <alpine.DEB.2.22.394.2506171720390.1780597@ubuntu-linux-20-04-desktop> <e4bf11e1-5bf5-4428-bd73-4fd2cb2029fb@epam.com> <alpine.DEB.2.22.394.2506221451440.8066@ubuntu-linux-20-04-desktop> <3468bb57-3178-460b-8fb2-3ce106475319@xen.org>
 <df2ee229-ec98-4097-a6bb-b16910c540e9@epam.com> <c8521929-50dd-4113-bb35-1d64e3a0645c@xen.org> <d92874cc-e8f3-46d3-815d-1c21c42dc96b@epam.com> <41566d23-464b-4676-8e01-e2f27d377a94@xen.org> <6689b22a-f85e-40ba-a89b-7935df1bdd28@epam.com>
 <5992e6bf-e9ea-480f-bcd3-a6cf1c335190@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jun 2025, Julien Grall wrote:
> Hi,
> 
> On 30/06/2025 12:57, Oleksii Moisieiev wrote:
> > KVM [1] is not applicable here as it starts under/inside Linux, so it
> > doesn't have direct access to SCMI, the Linux does.
> > And Linux will see only one SCMI transport (Agent).
> > Seems, the only option possible is virtio-scmi (qemu) - the virtio-scmi
> > potentially can simulate multi-channel,
> > but this is out if scope of this work.
> > QNX [0] relies on configuration files rather than the Device Tree.
> To clarify, I didn't ask to implement anything in KVM or QNX. I asked to write
> the bindings in a way that they are not Xen specific to give a chance to for
> other to re-use them. Yes today KVM and QNX would not use them... But I also
> still don't see why we should actively prevent them to use the bindings you
> come up with...

I agree with Julien. We can still have the property or node under
/chosen to avoid conflicts and confusion while still making the node
more generic so at least in theory it could be reused by other
hypervisors -- remove the "xen," prefix from
"xen,scmi-secondary-agents".

