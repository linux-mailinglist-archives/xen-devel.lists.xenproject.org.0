Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FB5J1xAjGlOkAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:39:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C77712251F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227080.1533412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5l6-0006kl-6V; Wed, 11 Feb 2026 08:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227080.1533412; Wed, 11 Feb 2026 08:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5l6-0006ia-3I; Wed, 11 Feb 2026 08:39:40 +0000
Received: by outflank-mailman (input) for mailman id 1227080;
 Wed, 11 Feb 2026 08:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgMA=AP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vq5l5-0006iU-Co
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 08:39:39 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 329b38bb-0725-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 09:39:37 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-4043b909ed4so4156135fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 00:39:37 -0800 (PST)
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
X-Inumbo-ID: 329b38bb-0725-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770799176; cv=none;
        d=google.com; s=arc-20240605;
        b=IiMYz9TkNc4nvzon3tTrxIeFomcOSYajOFhcefZYWI03cihfVHzrNROWS8rXFXQ5JX
         X0ynFez7DYK10j3nFqVcVq9WFb/9u2X20IJA2ctHz4mLZLoH4K4Qa7EsUe1RwmAvNN3t
         5SKyHdp2omW+z4LDMgmsFSOWMWn2lD1wOwfLfDJ81I36TvVhIvLsNM0sOG1VhsqwVstw
         K9yRC6sZpMQ7NnzeIq6gcj9wqCGyuNClHKrf/EAAnf/J5ziVZfkD+mvznGhsoCdajQV3
         yB0ZqMEwOoTX6ulQso1kMRyefa4o/wXVLq7oZ2sKM05paKltwesBP0it5ZX4lLNY2N5O
         z7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hw3pn4QmkM7nGCKINq+2aIC0VZdDLM5h7WXdH9RJr8g=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=NPcg/gAZd0GAhiDKt9bRYVzZ/NYBN0bKfZs75zWYR1VAd+ugCfrFL4Xf2hxXoP1dZX
         Kq4h+vHGr7c3CKIgClC1/4x3ejLisWABReo+xFPt5mgU2ygadaRY6z8gtlp5jw+D1f+W
         EvrdYx5kne83wqty4K40IyBbpWlk5pHbWbltoFzzO7EMA2Kuloqf686b1H74x5MCg4kP
         yNi79GA/zDmw5Ld/gwxDzqXdIn8i9dsXpknHJys7WTyVFo0qZFsKr3kMaWpeSdIcA83h
         0nplRHJBmkDNOzte9TbeVRmM8kX3pLUaVYPxvmQMsjHXhiSBAjMw8MyDXGCYBDK40oYF
         pemw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770799176; x=1771403976; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hw3pn4QmkM7nGCKINq+2aIC0VZdDLM5h7WXdH9RJr8g=;
        b=CG11UcWFaQE2cj/3pz/Y9J9kXoda7NRSCg0PfxSECfMLO6e6qmyWNGZ8DjFVl5oZ4m
         gi4GJ+5znFgybEbWg70viaZKo4RRHSC/n21N9bRYEa1cH0G7EaU8aJoE5ezf7e/kCk1n
         3Ta5kglEOobsFmi6qbJymbGQB97G/4MoQuZqw7rmzxLk7obHdP5ARyZiCJD+FzNbno8h
         8eb2CdR14HHOdjDRyYhR2Ctu5xWqBueC8ULSpA2Vj2HEu7ITS4FMzV6JeLtYovvBZIJc
         mdzTIv7+amqhg12KNiIQq+LPPBga794Dk3ab8ZYfVEIJimhktCPmh5V6+ymFzv2P2NkS
         PBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770799176; x=1771403976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hw3pn4QmkM7nGCKINq+2aIC0VZdDLM5h7WXdH9RJr8g=;
        b=vJy0hkTCMnILZb5k1pbbRir7y4mUSefPOZXaTk6VNUamPWslM4B9BKOEdb+fUw7YKZ
         /wDvGrVkgPgr7UHhIelVfZSiS3XuI4y87TmDlDTGPFbga49Oujc449UghV0J9tAEZiTb
         Iyaoe/faGWPrmkEOp6ey0oYpNu5rEtK2sybb67WaQhGt/jaedLg7luv8YHETcpXV2HOY
         xiqefjEq5jt/gqhfDrGMsTUKuczjPxq4VNnbftKquYj2hxKunlOLkimXDAmOo3l6MDdX
         w76DxzKTxy3/iprihqECa4oJ3lmjDWUzFKbRuYM3KsQhIfjgGVneEf1Lu4dEe5dcghJ9
         nUrQ==
X-Gm-Message-State: AOJu0YzX3rEgML/19D00FT1VKq4FvJVofK2yWe2gnzaEpjEIgLMFKVC/
	hTnkBaqydXJIacKqorMD+4TJFRbQZaohoK1fq/lwh76LXzoOUc83Jv6MsxTSfDw/yOTw6ZrGSpW
	47zTW2XEH4jf1yu6RksUzPfBAWejRgilYFqUJvAFXMw==
X-Gm-Gg: AZuq6aIY9MAycuVjVkOkXq1i/kypvg0XUcl+1/e0aATX1zHM6F9fzQjThzcD8ZEWZRK
	SQf7N0CHmXZm3h6quCBLJldChSRAMfstRO5sb8khzekFmrZu6+pIvEedMrs1iWM06wcxdPWXQb+
	MTpzaXkpzyeBf6Cuz7CryVot3NUQrBe3dbyn5MzI9WCWZ4yPMzn8Ta/CaVPY7Dk9Z6Ie1QbHRvd
	fyegRO98zVq0+z7LWDi/jeCIf48Lqn11eI3A3zEsNqlHlPZlaiWI6J0qievsGypzPdVxnyDO9uV
	1+D919zxhwxxVbX3PZsx+Dm8g9cdEP+NO8DmfA==
X-Received: by 2002:a05:6870:31b6:b0:3d2:c24:30fc with SMTP id
 586e51a60fabf-40eaf933529mr515132fac.48.1770799176250; Wed, 11 Feb 2026
 00:39:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <9466059cffcae65acb96a6c3710778f2e9ebcbbd.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <9466059cffcae65acb96a6c3710778f2e9ebcbbd.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Feb 2026 09:39:23 +0100
X-Gm-Features: AZwV_Qg9FbKHeIyDVqX75kroi9gPCtoEJ5GmC8F1o1EoakBir7J_C_lcS3a5yvs
Message-ID: <CAHUa44GM7Lu_iYXyu1RCL+-Ct0f8+gZqssa=OEHH-Wg1GFgFWw@mail.gmail.com>
Subject: Re: [PATCH 09/12] xen/arm: ffa: Fix SEND2 SP support gating
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email,linaro.org:dkim];
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
X-Rspamd-Queue-Id: 0C77712251F
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Xen only maps a VM RX/TX buffer into the SPMC when firmware supports
> FFA_RX_ACQUIRE. Without that mapping, the SPMC cannot access the VM TX
> buffer to relay FFA_MSG_SEND2 to a secure partition.
>
> Advertise FFA_MSG_SEND2 to guests only when VM-to-VM is enabled or when
> the firmware supports both FFA_MSG_SEND2 and FFA_RX_ACQUIRE, and reject
> SEND2 to a secure partition otherwise. Add comments to document the
> mapping/ownership dependency.
>
> Functional impact: SEND2 to a secure partition is reported as
> NOT_SUPPORTED when FFA_RX_ACQUIRE is absent.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c     |  8 +++++++-
>  xen/arch/arm/tee/ffa_msg.c | 11 +++++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index e9e020bb0cb3..a46c6e5e67f1 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -292,7 +292,13 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>              ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          break;
>      case FFA_MSG_SEND2:
> -        if ( ffa_fw_supports_fid(a1) || IS_ENABLED(CONFIG_FFA_VM_TO_VM) =
)
> +        /*
> +         * Forwarding SEND2 to an SP requires the SPMC to see the VM TX =
buffer.
> +         * We only map VM RX/TX into the SPMC when RX_ACQUIRE is support=
ed.
> +         */
> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) ||
> +             (ffa_fw_supports_fid(FFA_MSG_SEND2) &&
> +              ffa_fw_supports_fid(FFA_RX_ACQUIRE)) )
>              ffa_set_regs_success(regs, 0, 0);
>          else
>              ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index 10856fddcbc4..928f269f6c3a 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -274,6 +274,17 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *r=
egs)
>              ret =3D FFA_RET_NOT_SUPPORTED;
>              goto out;
>          }
> +        /*
> +         * The SPMC needs access to the VM TX buffer to relay SEND2.
> +         * We only map VM RX/TX into the SPMC when RX_ACQUIRE is support=
ed.
> +         */
> +        if ( !ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> +        {
> +            ret =3D FFA_RET_NOT_SUPPORTED;
> +            gdprintk(XENLOG_DEBUG,
> +                     "ffa: msg_send2 to SP requires RX_ACQUIRE\n");
> +            goto out;
> +        }
>
>          ret =3D ffa_simple_call(FFA_MSG_SEND2,
>                                ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0,=
 0, 0);
> --
> 2.50.1 (Apple Git-155)
>

