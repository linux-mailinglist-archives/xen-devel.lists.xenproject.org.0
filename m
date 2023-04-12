Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0526DFF67
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 22:09:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520374.807898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmgmV-0008KV-7I; Wed, 12 Apr 2023 20:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520374.807898; Wed, 12 Apr 2023 20:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmgmV-0008Hp-3W; Wed, 12 Apr 2023 20:09:27 +0000
Received: by outflank-mailman (input) for mailman id 520374;
 Wed, 12 Apr 2023 20:09:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+hK=AD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pmgmU-0008Hj-33
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 20:09:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb58dd50-d96d-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 22:09:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4EF662F85;
 Wed, 12 Apr 2023 20:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C3FC433EF;
 Wed, 12 Apr 2023 20:09:21 +0000 (UTC)
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
X-Inumbo-ID: eb58dd50-d96d-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681330163;
	bh=8B2OVPHQHUwiNOLLrscY/I401k0vtxih3jLGGUDSZUk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=isH2hHlC7MKcTEpi3cvYBuFwSXm7bfi+7UtiCiSxRhJvoJrz1bZTtaEX878g9+FO8
	 ZZuTFhx3o0CydAnW4JtkqWFL/IS1rIea/bPm/69Vs72f5GTfYgCkanvHSEojuUtCNH
	 rMrcizdGo05D0QTIVEWIKkSGHjIQv3z8oPVt4Lycz58HVAx5lRkqHPhYv4e/iemkm2
	 UlLe8bzNTJ4ztwDIZkYpmsVhIYNjFn8K47YZm3ZH4HZPnD7cai47soX5RIsO8wahf2
	 8KAX4BdpEqi/qDwiOJjWH7M9TZHYiwvHMtwpCOlCfl/WYt4Xo1QdQB0UTl5zmdDc2Y
	 hnLqFZYN3h/Hw==
Date: Wed, 12 Apr 2023 13:09:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: David Woodhouse <dwmw2@infradead.org>
cc: qemu-devel@nongnu.org, no Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
    Thomas Huth <thuth@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-8.0 0/5] Xen emulation build/Coverity fixes
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
Message-ID: <alpine.DEB.2.22.394.2304121309050.15580@ubuntu-linux-20-04-desktop>
References: <20230412185102.441523-1-dwmw2@infradead.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Apr 2023, David Woodhouse wrote:
> Some Coverity fixes and minor cleanups. And most notably, dropping
> support for Xen libraries older than 4.7.1.

I just wanted to say that I am fine with this

