Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D702A910F7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 02:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956873.1350128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5DaS-00054Z-QH; Thu, 17 Apr 2025 00:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956873.1350128; Thu, 17 Apr 2025 00:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5DaS-000524-Mo; Thu, 17 Apr 2025 00:58:40 +0000
Received: by outflank-mailman (input) for mailman id 956873;
 Thu, 17 Apr 2025 00:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nF+x=XD=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1u5DaR-00051y-PE
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 00:58:39 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 184b928f-1b27-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 02:58:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9B576A4B0C3;
 Thu, 17 Apr 2025 00:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE9CC4CEE2;
 Thu, 17 Apr 2025 00:58:36 +0000 (UTC)
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
X-Inumbo-ID: 184b928f-1b27-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744851516;
	bh=IJ60gUMEGTmb8XxC1mQ13En+4ayrfd2OTpbrOX8ZN1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=asR2gNEl/7FkbuQ+3UP4beLzsskFfi/ipeAnceSSj7rL1aTmcmirHu0ADrFJl1nA8
	 NmEEUbzJaHKbo/cypO19YlgFaH0l/Y69kfC5sc1VXmOVwHN17FWQxnjaThmZvG6keA
	 WUBp2Ozj8xPdpuJgpZfzk19Ftd3wsieylcIL2PESPXlY9WM2IwclfL9ln625Ie1xYW
	 5oNMh/4Kp9JYKR1e5qdre3WUUOyNO66b94MbZMIa8uP1poMII5p/iK1vqRziVmhFga
	 UqVdL1MpQB5cN0VUkZDBrs3HTR1J1VxPjI76RUpkT16+QpXkTTDI+Wa92QEvL+mK8/
	 tEc7ZZS/i3oTw==
Date: Wed, 16 Apr 2025 17:58:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alexey Nepomnyashih <sdl@nppct.ru>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
Message-ID: <20250416175835.687a5872@kernel.org>
In-Reply-To: <20250414183403.265943-1-sdl@nppct.ru>
References: <20250414183403.265943-1-sdl@nppct.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Apr 2025 18:34:01 +0000 Alexey Nepomnyashih wrote:
>  		get_page(pdata);

Please notice this get_page() here.

>  		xdpf = xdp_convert_buff_to_frame(xdp);
> +		if (unlikely(!xdpf)) {
> +			trace_xdp_exception(queue->info->netdev, prog, act);
> +			break;
> +		}

