Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B587FE7A4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 04:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644380.1005277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XjX-000763-VY; Thu, 30 Nov 2023 03:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644380.1005277; Thu, 30 Nov 2023 03:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XjX-00074G-SO; Thu, 30 Nov 2023 03:28:59 +0000
Received: by outflank-mailman (input) for mailman id 644380;
 Thu, 30 Nov 2023 03:28:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8XjV-00074A-Pm
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 03:28:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95941185-8f30-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 04:28:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0988FCE1F29;
 Thu, 30 Nov 2023 03:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9548C433C7;
 Thu, 30 Nov 2023 03:28:48 +0000 (UTC)
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
X-Inumbo-ID: 95941185-8f30-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701314929;
	bh=OsuSg0EUHTYImGqH1iVt7K1UuksM3mcd/sOi3cXeBsw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SPPdKngWIdxrw4H2VFOl+md/LEiY45R+61UIWf3aKpXuj9zzsdxOIIEGZfWUdefF2
	 53/X48giq1SQhN0ooOlYQzMQJBqaXeCMj9mXIHATSJiLelAW9KcNnv5fgWLbJ8Je24
	 VRo6gnTpMOhD+vpZQvYt+Xc6AwNH8ZgqYsVR8cttdmiU7eEDVx8ryexTLtp6Pv9/wp
	 BS6Po4o9vOeG6RDtiCMbAy5dbIJQtbhmGssXiWMIZHBtxCjeaKmAd03sx4XMRFtqnM
	 sZf4eNiM+5byolWfKDU6jEypgUbbAiO91+XqwIqgeI0cxnxHJro7G80HtL0R069FLM
	 gFbpXzawu/gSw==
Date: Wed, 29 Nov 2023 19:28:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 3/6] automation: prevent QEMU access to /dev/mem in
 PCI passthrough tests
In-Reply-To: <5c7cf4c680200c37187b90eebc49f600865c65ec.1700790421.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2311291927160.3533093@ubuntu-linux-20-04-desktop>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com> <5c7cf4c680200c37187b90eebc49f600865c65ec.1700790421.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2137811248-1701314928=:3533093"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2137811248-1701314928=:3533093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 Nov 2023, Marek Marczykowski-Górecki wrote:
> /dev/mem access doesn't work in dom0 in lockdown and in stubdomain.
> Simulate this environment with removing /dev/mem device node. Full test
> for lockdown and stubdomain will come later, when all requirements will
> be in place.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Nice! I was going to suggest to do the same for other PCI Passthrough
tests but this is the only one I believe?

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This can be applied only after QEMU change is committed. Otherwise the
> test will fail.
> ---
>  automation/scripts/qubes-x86-64.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index d81ed7b931cf..7eabc1bd6ad4 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -163,6 +163,8 @@ ifconfig eth0 up
>  ifconfig xenbr0 up
>  ifconfig xenbr0 192.168.0.1
>  
> +# ensure QEMU wont have access /dev/mem
> +rm -f /dev/mem
>  # get domU console content into test log
>  tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
>  xl create /etc/xen/domU.cfg
> -- 
> git-series 0.9.1
> 
--8323329-2137811248-1701314928=:3533093--

