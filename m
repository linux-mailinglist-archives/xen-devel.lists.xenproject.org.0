Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A5706047
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 08:40:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535796.833829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzApG-0008K3-Jb; Wed, 17 May 2023 06:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535796.833829; Wed, 17 May 2023 06:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzApG-0008Hq-Gd; Wed, 17 May 2023 06:39:54 +0000
Received: by outflank-mailman (input) for mailman id 535796;
 Wed, 17 May 2023 06:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ws97=BG=tls.msk.ru=mjt@srs-se1.protection.inumbo.net>)
 id 1pzApF-0008Gy-11
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 06:39:53 +0000
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e64ce83-f47d-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 08:39:49 +0200 (CEST)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A4D0A66D9;
 Wed, 17 May 2023 09:39:47 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3B8745D88;
 Wed, 17 May 2023 09:39:47 +0300 (MSK)
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
X-Inumbo-ID: 9e64ce83-f47d-11ed-8611-37d641c3527e
Message-ID: <986d9eca-5fab-cacb-05c7-b85e4d58665b@msgid.tls.msk.ru>
Date: Wed, 17 May 2023 09:39:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/pt: fix igd passthrough for pc machine with xen
 accelerator
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-stable@nongnu.org
References: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz.ref@aol.com>
 <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

08.02.2023 05:03, Chuck Zmudzinski wrote:
> Commit 998250e97661 ("xen, gfx passthrough: register host bridge specific
> to passthrough") uses the igd-passthrough-i440FX pci host device with
> the xenfv machine type and igd-passthru=on, but using it for the pc
> machine type, xen accelerator, and igd-passtru=on was omitted from that
> commit.
> 
> The igd-passthru-i440FX pci host device is also needed for guests
> configured with the pc machine type, the xen accelerator, and
> igd-passthru=on. Specifically, tests show that not using the igd-specific
> pci host device with the Intel igd passed through to the guest results
> in slower startup performance and reduced resolution of the display
> during startup. This patch fixes this issue.
> 
> To simplify the logic that is needed to support both the --enable-xen
> and the --disable-xen configure options, introduce the boolean symbol
> pc_xen_igd_gfx_pt_enabled() whose value is set appropriately in the
> sysemu/xen.h header file as the test to determine whether or not
> to use the igd-passthrough-i440FX pci host device instead of the
> normal i440FX pci host device.
> 
> Fixes: 998250e97661 ("xen, gfx passthrough: register host bridge specific to passthrough")
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>

Has this change been forgotten?  Is it not needed anymore?

Thanks,

/mjt

