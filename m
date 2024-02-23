Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A88607AE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 01:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684573.1064496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJPj-0007Be-8H; Fri, 23 Feb 2024 00:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684573.1064496; Fri, 23 Feb 2024 00:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJPj-0007A8-5B; Fri, 23 Feb 2024 00:27:43 +0000
Received: by outflank-mailman (input) for mailman id 684573;
 Fri, 23 Feb 2024 00:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdJPh-0007A2-B6
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 00:27:41 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 589bda61-d1e2-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 01:27:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B74BFCE2817;
 Fri, 23 Feb 2024 00:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DEAC433F1;
 Fri, 23 Feb 2024 00:27:34 +0000 (UTC)
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
X-Inumbo-ID: 589bda61-d1e2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708648056;
	bh=o1hUzMwoVVSEjKKW2uxZHQ9eLm2xHzU/158rOozK1oA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r2DX7ExVRIddodt0pMzkzqXbgJZL6swLh6TLGMev62gEODPBwdotAm+yEQZ46SkRP
	 LILn5ZqCA6sZ5qsRmtP3+FNdDh4Gj57xsnkH7qGarI6gDYTbIEl++5fyO7gGI4+p3V
	 EqMhM6dYQu3OJc7nzCutMYrafBl/C5AvbXJSCECDq3IjPjnPRZVLKb3wyTM+DBLLut
	 sIJYDvvoPa8TdcsbMmUKvzpk9LGAg3I/PwF4MPoXX4bAYsd4P5YS4wQE+C+b316wt/
	 cxXlSVgA0rNzZn9bgOAn2uRFnYCEvGiEApVk66/o/ZM0I6rDaBz1e2eqIL4X8rROUN
	 gMVbriXIkr+Tg==
Date: Thu, 22 Feb 2024 16:27:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v5 1/5] xen/vpci: Clear all vpci status of
 device
In-Reply-To: <9b4ce4c7-6f4e-47ec-b3a4-0b417cd2660c@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402221627250.754277@ubuntu-linux-20-04-desktop>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com> <20240112061317.418658-2-Jiqian.Chen@amd.com> <9b4ce4c7-6f4e-47ec-b3a4-0b417cd2660c@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Feb 2024, Stewart Hildebrand wrote:
> On 1/12/24 01:13, Jiqian Chen wrote:
> > When a device has been reset on dom0 side, the vpci on Xen
> > side won't get notification, so the cached state in vpci is
> > all out of date compare with the real device state.
> > To solve that problem, add a new hypercall to clear all vpci
> > device state. When the state of device is reset on dom0 side,
> > dom0 can call this hypercall to notify vpci.
> > 
> > Co-developed-by: Huang Rui <ray.huang@amd.com>
> > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> 
> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

