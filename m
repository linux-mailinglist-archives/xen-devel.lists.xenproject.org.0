Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902E802C8E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 08:58:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646552.1008916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3qY-0001gg-Af; Mon, 04 Dec 2023 07:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646552.1008916; Mon, 04 Dec 2023 07:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3qY-0001dk-77; Mon, 04 Dec 2023 07:58:30 +0000
Received: by outflank-mailman (input) for mailman id 646552;
 Mon, 04 Dec 2023 07:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYKC=HP=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1rA3qW-0001dW-7W
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 07:58:28 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6e5437e-927a-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 08:58:26 +0100 (CET)
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
X-Inumbo-ID: e6e5437e-927a-11ee-9b0f-b553b5be7939
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701676704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=olLQmfouF3da3Ez0MZE8XTk1beuCISuKI3rPjmx3/hc=;
	b=jROt4+AA2gHCjQQejTIJ4vx61px4E4T6n7je/BoGancpAFJzJip5U7lrImJxKWIqbbMRtq
	6m5nmG8i3VblkEIRlbtxchdeGxnLTRgHOfbPcp6e1doolQTYPM3nQxS48f+2396sY04H3K
	AQa/bymq0fZit98BLuQWFsktYiAx9A2kt/HaXVoWxeU0DbC+m7maUCeeHta7XD7bkH33+G
	Y4l9w4vk77GVv6YHcaiXBxkFEPjXcRomvw0tdn/apFOqCVUrMU/FjOHXztPcy2fZIeQZN+
	lUF9etwZ2a5wpRp3KdgjkdImnU2gAeMF5oRpJDHp9RxgARd5oA3G8KaBaQunow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701676704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=olLQmfouF3da3Ez0MZE8XTk1beuCISuKI3rPjmx3/hc=;
	b=BfloaVnhH1keEIYiuj2GPUgURfGHFRALvHxjv42XRmGBcfK9HphTyelqVddlgAlKPMoJTx
	zZ5jWZZYCHljWXBw==
To: Jiqian Chen <Jiqian.Chen@amd.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, Alex Deucher
 <Alexander.Deucher@amd.com>, Christian Koenig <Christian.Koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
 <xenia.ragiadakou@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia
 Zhang <Julia.Zhang@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
 <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 1/3] xen/pci: Add xen_reset_device_state
 function
In-Reply-To: <20231124103123.3263471-2-Jiqian.Chen@amd.com>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com>
 <20231124103123.3263471-2-Jiqian.Chen@amd.com>
Date: Mon, 04 Dec 2023 08:58:22 +0100
Message-ID: <87edg2xuu9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 24 2023 at 18:31, Jiqian Chen wrote:
> When device on dom0 side has been reset, the vpci on Xen side
> won't get notification, so that the cached state in vpci is
> all out of date with the real device state.
> To solve that problem, this patch add a function to clear all

Please get rid of 'this patch' all over the series.

# grep -r 'This patch' Documentation/process/

> vpci device state when device is reset on dom0 side.
>
> And call that function in pcistub_init_device. Because when
> we use "pci-assignable-add" to assign a passthrough device in
> Xen, it will reset passthrough device and the vpci state will
> out of date, and then device will fail to restore bar state.
>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>

This Signed-off-by chain is incorrect.

Documentation/process/submitting-patches.rst has a full chapter about
S-O-B and the correct usage.

Thanks,

        tglx

