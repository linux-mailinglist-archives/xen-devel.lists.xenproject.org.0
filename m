Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIERG5NFi2kJTwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 15:49:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D400611C124
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 15:49:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226454.1532968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpp3E-00009V-6I; Tue, 10 Feb 2026 14:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226454.1532968; Tue, 10 Feb 2026 14:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpp3E-00007G-3K; Tue, 10 Feb 2026 14:49:16 +0000
Received: by outflank-mailman (input) for mailman id 1226454;
 Tue, 10 Feb 2026 14:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRf0=AO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vpp3C-000077-1F
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 14:49:14 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a94a6065-068f-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 15:49:12 +0100 (CET)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-408199852c5so682987fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 06:49:12 -0800 (PST)
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
X-Inumbo-ID: a94a6065-068f-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770734951; cv=none;
        d=google.com; s=arc-20240605;
        b=M5nUqntcgO9tuDJ+ZltjcPIMfdDbM3FCpzOdzoDbymLmQ4LpY7yR/e7xEoTpIgy2PX
         bVMYswEERQPc7ib5SC4VrZTZGScQEk5Wkc5zl1mcIWlanrVOUZNmYI3oe3QS517UjTJP
         GQZQTCW9DqoROilHKTRzQlj2wm7uTJTv2qQC/+YO/rohvgmZiRseP/tkqEa5SpSNivnf
         hxhGx+u6U2JVFxqcuhcHNX/tO17rTKrNeMuIVag2xYGp1jTTSkF3ASM9rsx5axZrtwjm
         z+ETrJx5dNNTeXtF6YaebWN0lab+DNvC5pTbavbHHM0GsKv3T7uTa4PLxfbUiDbXzPOn
         4hBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h0g7N1VoLGCGCiWjMIUHM+ywsBKDW5F8EoGXdpjsxm4=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=Jjrxspr87rxkb2K9Ysz9mktjGBbfkId7SzKJxUdcy6UVQ2p7lZcsCHn6w7ucbgrBmj
         sGaE9FF7/QiJoOg/7OlHrcCPgPASuiM/yN7J0S8A7X+wwlSI2azppUsv/ThHy+wAaMrb
         nDEZxws77XsruZnyUt5ziKu1rzTxzByucxHXBQrwkt+zZ6+fCHHc9nRN7+RKWRQ0wTQ6
         559on1DOJ+EiVzpJzqIPrchfKM4xZVSP2l2KCQrfu/QrnXinzHwrH2yy/9vKGfGqLgRN
         kVL2lq/gBiPLBcpWuZJ7QaaVT4t9dGxSmiED9jqSaU7gGS9tMoY4hxkMguW7KqfN+hxy
         hNBw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770734951; x=1771339751; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0g7N1VoLGCGCiWjMIUHM+ywsBKDW5F8EoGXdpjsxm4=;
        b=eJ3Gqhu/lCK++zTrdDYD6JxZZRxG2bRJBco7o0cSszzughqJvI5hVB7X1bYa9DkoLh
         pE+XM5ayN+y5C5syhv0oC35OGLuAzhY34o1o4S1QQpztc9Lcplb9Q7ceoaLaJcJwvwa7
         JPKxk75ZmIDNoiIjgiMVwmpRoU20dSgmlCfSVVMkH7oWQ7YupfLCuOpVTCyiOH3oUe5d
         aKeUN8Ylp14RW5w1KCOE3+5pg3YPcmdkhlSE9Q1mIppCW7Q7QgntMa1VX7vXD5Y+c7sU
         lrrHS7oAmqMCOe67lOK2sFcgmM6EnpjnN3EQHS8N7GVQEtTWAAe8ASx7zYlwSPsliUDT
         qJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734951; x=1771339751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h0g7N1VoLGCGCiWjMIUHM+ywsBKDW5F8EoGXdpjsxm4=;
        b=WaU28GkPEZ3oyEafLyoZiI6Wx7br03dXWAM1gLO9hJOrMw879sMnMZYtzk+0S+8RRk
         w5MC+wJ1JeNv3f3gciMacH/CxG8aOKRE8TaYQPPGkAFgPt4AIAQ1WVG/vROL9XqRqvNt
         y+Ag1Y/1DGcLGJ741hGdyrGFPYPeJhmrFlDnQcjJcnuekjJFRkh/n9ypa35/l0fim5wS
         /v0drSUvTxjgg3ApSUwYU21HFNjPZmYjtxV1BkEvOYKUC3T5wvQEltkO2hNC99jjAo0Y
         Y3BhMf90s55GnZnA4ZqYsSqJdIMuCTJ4JNfyxgN2mz1i1vjIwh50w2m1reoQrXAcm+8k
         LlOQ==
X-Gm-Message-State: AOJu0YwDUT8XtE1MEVfkL4Z18/M/Dukv5mqiifsfK+Q/hHpzIoTkzNsV
	95DzNQpHhW6/QOja60Ud1Oin41c7BoseNHgeBEj57RH22JZBfKVyBc/4wdeZuUS0JDGGMUMk/vE
	xFWbs4fI9Y69ttBQjvM/QckLJeY4lOhk55BpfIrEvdw==
X-Gm-Gg: AZuq6aKzl1dwMkkYphJ3LMGcXfc56dCpkrmKEhn7XP/4qnyXLJrJbmcaI7VRJg+I0EX
	MKFwNVMu+3mMAZeTiXjo+tMmtte43oPGGTGfW0P5/OqjdbruEYV4GaRvXMb+s/OSJJv9dneCvT/
	r4qrRyhs+gOmbgiJHqOQaNrirkOOewiSdqOAWEqnMBbjfhRDBE19CnWWXbs05t6eeuki2DayYPL
	oki+RxySEP4hlSS5M2eQPVe0TaLAxQ/ok5Lz5dUbuuqciO+lxLTIiVXJQXVNrM+xJe/TMoW4F3r
	x7eJ0KJZcgcBLNVpMhW9ebbFTlzl4umZq9e9gw==
X-Received: by 2002:a05:6870:960a:b0:409:68f6:569b with SMTP id
 586e51a60fabf-40a96c3f46emr7503833fac.12.1770734950917; Tue, 10 Feb 2026
 06:49:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <f6cbfbf8a30f7d9f4b4c86e663f10de578965c05.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <f6cbfbf8a30f7d9f4b4c86e663f10de578965c05.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 10 Feb 2026 15:48:59 +0100
X-Gm-Features: AZwV_QgkdyupUtA5YpS0SjbsQLiRA7KTwmaPzE3S-06pIrFXocnfHXQXPIfWct8
Message-ID: <CAHUa44H17k-i21LX0Q5YL2nCfxpHGMBcb6LFH3CC-LPGZKyJjQ@mail.gmail.com>
Subject: Re: [PATCH 06/12] xen/arm: ffa: Fix RX/TX map layout and errors
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D400611C124
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> FFA_RXTX_MAP builds a descriptor for the SPMC and the composite region
> offsets must be 8-byte aligned. Xen currently uses a 12-byte header
> size, which produces misaligned RX/TX offsets. Mapping failures also
> return INVALID_PARAMETERS even when the failure is due to resource
> exhaustion, which misreports the error condition.
>
> Round the descriptor header size up to 8 bytes before placing the RX
> region and derive the TX offset from the aligned RX offset. Return
> FFA_RET_NO_MEMORY when the TX or RX buffer mapping fails before the
> error paths unwind.
>
> Functional impact: RXTX_MAP now returns NO_MEMORY on mapping failures
> and the SPMC receives an aligned RX/TX descriptor layout.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_rxtx.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index 50758fb57cdf..eff95a7955d7 100644
> --- a/xen/arch/arm/tee/ffa_rxtx.c
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -119,11 +119,17 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_=
t tx_addr,
>
>      tx =3D __map_domain_page_global(tx_pg);
>      if ( !tx )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
>          goto err_put_rx_pg;
> +    }
>
>      rx =3D __map_domain_page_global(rx_pg);
>      if ( !rx )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
>          goto err_unmap_tx;
> +    }
>
>      /*
>       * Transmit the RX/TX buffer information to the SPM if acquire is su=
pported
> @@ -136,7 +142,8 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>          struct ffa_mem_region *mem_reg;
>
>          /* All must fit in our TX buffer */
> -        BUILD_BUG_ON(sizeof(*rxtx_desc) + sizeof(*mem_reg) * 2 +
> +        BUILD_BUG_ON(ROUNDUP(sizeof(*rxtx_desc), 8) +
> +                     sizeof(*mem_reg) * 2 +
>                       sizeof(struct ffa_address_range) * 2 >
>                       FFA_MAX_RXTX_PAGE_COUNT * FFA_PAGE_SIZE);
>
> @@ -153,8 +160,8 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t =
tx_addr,
>           */
>          rxtx_desc->sender_id =3D ffa_get_vm_id(d);
>          rxtx_desc->reserved =3D 0;
> -        rxtx_desc->rx_region_offs =3D sizeof(*rxtx_desc);
> -        rxtx_desc->tx_region_offs =3D sizeof(*rxtx_desc) +
> +        rxtx_desc->rx_region_offs =3D ROUNDUP(sizeof(*rxtx_desc), 8);
> +        rxtx_desc->tx_region_offs =3D rxtx_desc->rx_region_offs +
>                                      offsetof(struct ffa_mem_region,
>                                               address_range_array[1]);
>
> --
> 2.50.1 (Apple Git-155)
>

