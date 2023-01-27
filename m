Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D0B67ED07
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 19:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485831.753242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLT6M-0005tj-9x; Fri, 27 Jan 2023 18:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485831.753242; Fri, 27 Jan 2023 18:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLT6M-0005rR-7N; Fri, 27 Jan 2023 18:05:26 +0000
Received: by outflank-mailman (input) for mailman id 485831;
 Fri, 27 Jan 2023 18:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BqQd=5Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLT6K-0005rL-EG
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 18:05:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a16028d-9e6d-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 19:05:22 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E210A618C5;
 Fri, 27 Jan 2023 18:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C926C433D2;
 Fri, 27 Jan 2023 18:05:19 +0000 (UTC)
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
X-Inumbo-ID: 2a16028d-9e6d-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674842720;
	bh=FNk5O2nMDZRZ4nsVzbrBX9duBUtNbM5zNga9Ek+YZGg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ispgKXK1vVVFxa3AQ2E/5cMSUiDFBlEHjaype2LY7U49b4Lxm8eWafy0YWxqsLios
	 nymvWqppUK/Xo4LBuk8dvGF+onNyt9MFcey3m9EncbaNqHqM/SuTRP5mNNNFdt7LVj
	 j4FJhWWZIc2WJwjqiQV8pSdR1MS9mcUkDlziRxFlS0zDzBuDsoaZtpe5N5AeowhrHV
	 jS04+2JF9XKOKVlYEsAGifun5rrDG/lgTMB3nH4gUMD+L5WsIUDQCFH747xIgO58vs
	 HZs997JaajYhREC+ym7/UtZH/M8iuYcIcOUNhfVgyFQK0LlA080Gh0nN+DxdWa1//7
	 kpFq7gcQR8p3A==
Date: Fri, 27 Jan 2023 10:05:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] hw/xen/xen_pt: fix uninitialized variable
In-Reply-To: <20230127050815.4155276-1-marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2301271004530.1978264@ubuntu-linux-20-04-desktop>
References: <20230127050815.4155276-1-marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1316837341-1674842720=:1978264"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1316837341-1674842720=:1978264
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 27 Jan 2023, Marek Marczykowski-Górecki wrote:
> xen_pt_config_reg_init() reads only that many bytes as the size of the
> register that is being initialized. It uses
> xen_host_pci_get_{byte,word,long} and casts its last argument to
> expected pointer type. This means for smaller registers higher bits of
> 'val' are not initialized. Then, the function fails if any of those
> higher bits are set.
> 
> Fix this by initializing 'val' with zero.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen_pt_config_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index cde898b744..8b9b554352 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -1924,7 +1924,7 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
>      if (reg->init) {
>          uint32_t host_mask, size_mask;
>          unsigned int offset;
> -        uint32_t val;
> +        uint32_t val = 0;
>  
>          /* initialize emulate register */
>          rc = reg->init(s, reg_entry->reg,
> -- 
> 2.37.3
> 
--8323329-1316837341-1674842720=:1978264--

