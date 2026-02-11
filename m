Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBwfBYlDjGnYkAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:53:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670A01226EB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227098.1533432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5y5-0001af-F9; Wed, 11 Feb 2026 08:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227098.1533432; Wed, 11 Feb 2026 08:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5y5-0001XZ-C3; Wed, 11 Feb 2026 08:53:05 +0000
Received: by outflank-mailman (input) for mailman id 1227098;
 Wed, 11 Feb 2026 08:53:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgMA=AP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vq5y4-0001XT-8i
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 08:53:04 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f5f0630-0727-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 09:52:57 +0100 (CET)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-66e35b48d11so1897479eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 00:52:57 -0800 (PST)
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
X-Inumbo-ID: 0f5f0630-0727-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770799976; cv=none;
        d=google.com; s=arc-20240605;
        b=U5H+S/0YCDM+FGc/JRiENDVbFQY440jNdaLozF3TcLfrUZnLa2nGzDAMeszVBB1/vb
         ZkO9T7cEriaz8BCnbovZheDY3GFGjJcOg3mviWbpnnuxtFDYAItJHYRW3ks5uZr67emI
         CuNNFFsBW7iVQMwyJpq2jecJi7HoUp5d9ihyuoHFjWj0TgtWYwvzRuXbSCgp0EqTebnp
         mkdhRTGjU8LtVoYhxNVUqguuMcFcCEHsKWzopk0psgac1aDR9XeSnwnGvcHHeVTWfowu
         egM9Qxz7Ie6S9T4G0+OEZeAkzzi4H8+oLvSluvDZPWLNrSJ6wV4Yae8cCJDIBQJL8hXn
         g6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9HIsXnI/DSGjRGPwKbwR9ku+eq4Z+ilVAJsxrveI3og=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=CT30lNxITqvUMSDWDNTNNL4+SdWqUcwtS4v2dr0K9Gda7X1j+GJ2KXZevaT/GvGmcJ
         7P9FH8lQn/ZAlcQa8EgfuIhWR4nEQn4UBjoZcrIB9yRwMkrNESDysXdwColC8WbfFM+a
         kptPZaCStA/NnuJBHr4XlByX16A8450JIoijCjlDf9eMbz4VTSRgnEie2EB0G0Tp4lyy
         MdhepYex0xDjTqUQRl180XLmg8KvsP4NMmvWCwo6MhwCrA7KaDT5w3OgfSyZrgs4Mo+B
         gBqK4js2RMATmb6pL0uzrT32Jdsdb+xnRebGkOxthUhBq1+2j/xZR8rW9Q8/2yclpxAK
         E50g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770799976; x=1771404776; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HIsXnI/DSGjRGPwKbwR9ku+eq4Z+ilVAJsxrveI3og=;
        b=S1+tEJJGg7pEkTuuia2FoheuLueWoFuzJ0KA93zXyiSKCb5aLa6fsWIeEqq0HatHqB
         PnFYdn9eLGzNga88EeYzLICzzW4OeQC5uxsto/1Rzl94UwowLZzbTgO0XGgYqhFPP/ze
         gXRoASFppJA3o1a7cEq/dQuAOLsg+Frjmjot3fLJFkwZu3Bt1BSCA8urfoDRXv5s4BpC
         xaYo5Pmy1Si9vcSMKf1K64Emrx34yF8kkN8SQXwXH84qXxQPExelkt81ZtMaKeN8HvOz
         f+q3YNVktt/MQKBi27SMrOMfyXz0nZUiS2NOMVRASmg8xWgcb869XiQZTUeEBMZS4oNr
         axNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770799976; x=1771404776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9HIsXnI/DSGjRGPwKbwR9ku+eq4Z+ilVAJsxrveI3og=;
        b=R7JULJ5qB8rftodQHXuAG2tLJ5BS6PAMXsh5F3oI+lG6UELtXqujSRDe1Q4S8p1+Jk
         IFksv5FCaunl8VKIx6J/C5JTDIUWudyoOoz5bBeawe+HDZFVHTVC2iIkw+MrT8yp0tHo
         xhgKw0L897u/BLrc4y/SlYK97Ci3DyhxWPBFeqkW00NZ+CfHZGORHwIwHNSq3DP3XpZo
         a06Alz/siurKRvtL3rKwT9AXNrzcXrN5x4MQmeKGW5AHi6YDrskIqTJEtq4HFhOvPrB+
         EW6s26en4mZ6razqEzSh1y5ZGULJcpbhLvSLYgYr8sUDczYEnC/w1/PSxKg7a/RCllkL
         ISpA==
X-Gm-Message-State: AOJu0YxzpquAi+lMf09AhJwmHQEuJ8zkbwE9U7MX+BeBuO8+VFmP5gqF
	VZ7287N6UiNb3643cNnoOXGiVH3NScxp4kvMZBn9GIRQkVyvdG1QmF1MHOt+mXhErwQ5DSHBEmC
	QDkpDcdZTU6GCI30z/ZjJKb6DPwug7G+zyerCuOviYRg6cVFhgicsyr8=
X-Gm-Gg: AZuq6aKbdElQe7aAKufc3kX+3MxzcbZBx7AMrphxa44Es5uBDWmINcyTRaDxHxKGJg+
	vdNfZvztbC/rsxFilwYpeMX7J/BYAFXrbI5w5S5ckuLI2r7YLqgPr1O4EvIIbpn/zGXut0uALJB
	2risbtqxwPRSn7vXOCTzbUsQBd1Y5xzlRSTgLrepUZst93eKLyJvBBOWi/Hxg7durp6vPLQD5dA
	7k62oFvYUW2l5LVfRcreaIJ7iDec3RsezEJIzxLahZrjxAaSKJv919klsZCdjkaSfcwKceGbv7s
	jIEsuPoYX2eituEM/CiK7+cBmGph2qq7O7GHwg==
X-Received: by 2002:a05:6820:4a0c:b0:662:fb70:bcbf with SMTP id
 006d021491bc7-6743aa09771mr658547eaf.15.1770799975961; Wed, 11 Feb 2026
 00:52:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <38d71ac53abeeb4598d6ffb6bdab3717b3531334.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <38d71ac53abeeb4598d6ffb6bdab3717b3531334.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Feb 2026 09:52:43 +0100
X-Gm-Features: AZwV_QiV4UmolsCRVma8gWNLgXZVjFGpG9XEnApvRoRtziub7bzhTn62EHVYBJo
Message-ID: <CAHUa44FR9FGnDd31d6wK_PiV=+JHKTsOWf=EgG2WOkH-x6ZVMw@mail.gmail.com>
Subject: Re: [PATCH 10/12] xen/arm: ffa: Reduce logging noise
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,linaro.org:email,linaro.org:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 670A01226EB
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Several FF-A paths log warnings for expected or recoverable conditions,
> leading to noisy logs during normal operation.
>
> Reduce log noise by:
> - demoting unhandled FID warnings to debug
> - ratelimiting notification and VM teardown failures
> - printing the bit-15 convention warning once per boot
> - adjusting log prefixes for hypervisor-only events
> - adding debug diagnostics for RX/TX acquire failures, with busy cases
>   ratelimited
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c          | 11 ++++++-----
>  xen/arch/arm/tee/ffa_notif.c    | 11 ++++++-----
>  xen/arch/arm/tee/ffa_partinfo.c | 15 ++++++++-------
>  xen/arch/arm/tee/ffa_rxtx.c     | 21 +++++++++++++++++++--
>  4 files changed, 39 insertions(+), 19 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index a46c6e5e67f1..d0b9c9f1ab2e 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -461,7 +461,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>          break;
>
>      default:
> -        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> +        gdprintk(XENLOG_DEBUG, "ffa: unhandled fid 0x%x\n", fid);
>          e =3D FFA_RET_NOT_SUPPORTED;
>          break;
>      }
> @@ -581,7 +581,8 @@ static void ffa_domain_teardown_continue(struct ffa_c=
tx *ctx, bool first_time)
>
>      if ( retry )
>      {
> -        printk(XENLOG_G_INFO "%pd: ffa: Remaining cleanup, retrying\n", =
ctx->teardown_d);
> +        printk(XENLOG_G_DEBUG "%pd: ffa: Remaining cleanup, retrying\n",
> +               ctx->teardown_d);
>
>          ctx->teardown_expire =3D NOW() + FFA_CTX_TEARDOWN_DELAY;
>
> @@ -622,7 +623,7 @@ static void ffa_teardown_timer_callback(void *arg)
>      if ( ctx )
>          ffa_domain_teardown_continue(ctx, false /* !first_time */);
>      else
> -        printk(XENLOG_G_ERR "%s: teardown list is empty\n", __func__);
> +        printk(XENLOG_ERR "%s: teardown list is empty\n", __func__);
>  }
>
>  /* This function is supposed to undo what ffa_domain_init() has done */
> @@ -684,7 +685,7 @@ static bool ffa_probe_fw(void)
>
>      if ( !ffa_get_version(&vers) )
>      {
> -        gprintk(XENLOG_ERR, "Cannot retrieve the FFA version\n");
> +        printk(XENLOG_ERR "ffa: Cannot retrieve the FFA version\n");
>          goto err_no_fw;
>      }
>
> @@ -724,7 +725,7 @@ static bool ffa_probe_fw(void)
>              set_bit(FFA_ABI_BITNUM(ffa_fw_abi_needed[i].id),
>                      ffa_fw_abi_supported);
>          else
> -            printk(XENLOG_INFO "ARM FF-A Firmware does not support %s\n"=
,
> +            printk(XENLOG_WARNING "ARM FF-A Firmware does not support %s=
\n",
>                     ffa_fw_abi_needed[i].name);
>      }
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 37b05747cd21..186e72641237 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -292,8 +292,9 @@ static void notif_vm_pend_intr(uint16_t vm_id)
>              break;
>          }
>      }
> -    if ( !v )
> -        printk(XENLOG_ERR "ffa: can't inject NPI, all vCPUs offline\n");
> +    if ( !v && printk_ratelimit() )
> +        printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs off=
line\n",
> +               d);
>
>  out_unlock:
>      rcu_unlock_domain(d);
> @@ -316,9 +317,9 @@ static void notif_sri_action(void *unused)
>          res =3D ffa_get_ret_code(&resp);
>          if ( res )
>          {
> -            if ( res !=3D FFA_RET_NO_DATA )
> -                printk(XENLOG_ERR "ffa: notification info get failed: er=
ror %d\n",
> -                       res);
> +            if ( res !=3D FFA_RET_NO_DATA && printk_ratelimit() )
> +                printk(XENLOG_WARNING
> +                       "ffa: notification info get failed: error %d\n", =
res);
>              return;
>          }
>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 6b01c4abe915..c9f186b3720c 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -461,9 +461,11 @@ static bool init_subscribers(void *buf, uint16_t cou=
nt, uint32_t fpi_size)
>           */
>          if ( !FFA_ID_IS_SECURE(fpi->id) )
>          {
> -            printk(XENLOG_ERR "ffa: Firmware is not using bit 15 convent=
ion for IDs !!\n"
> -                              "ffa: Secure partition with id 0x%04x cann=
ot be used\n",
> -                              fpi->id);
> +            printk_once(XENLOG_ERR
> +                        "ffa: Firmware is not using bit 15 convention fo=
r IDs !!\n");
> +            printk(XENLOG_ERR
> +                   "ffa: Secure partition with id 0x%04x cannot be used\=
n",
> +                   fpi->id);
>          }
>          else
>          {
> @@ -632,11 +634,10 @@ bool ffa_partinfo_domain_destroy(struct domain *d)
>          res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_v=
m_id(d),
>                                       FFA_MSG_SEND_VM_DESTROYED);
>
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of=
 vm_id %u to %u: res %d\n",
> +        if ( res && printk_ratelimit() )
> +            printk(XENLOG_WARNING
> +                   "%pd: ffa: Failed to report destruction of vm_id %u t=
o %u: res %d\n",
>                     d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
> -        }
>
>          /*
>           * For these two error codes the hypervisor is expected to resen=
d
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index 450ce102cbdc..3147aba21ddf 100644
> --- a/xen/arch/arm/tee/ffa_rxtx.c
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include <xen/const.h>
> +#include <xen/lib.h>
>  #include <xen/domain_page.h>
>  #include <xen/mm.h>
>  #include <xen/sizes.h>
> @@ -82,8 +83,9 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx=
_addr,
>
>      if ( page_count > FFA_MAX_RXTX_PAGE_COUNT || !page_count )
>      {
> -        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (lim=
it %u)\n",
> -               page_count, FFA_MAX_RXTX_PAGE_COUNT);
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: RXTX_MAP: error: %u pages requested (limit %u)\n"=
,
> +                 page_count, FFA_MAX_RXTX_PAGE_COUNT);
>          return FFA_RET_INVALID_PARAMETERS;
>      }
>
> @@ -303,12 +305,15 @@ int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **=
buf, size_t *buf_size)
>      if ( !ctx->page_count )
>      {
>          ret =3D FFA_RET_DENIED;
> +        gdprintk(XENLOG_DEBUG, "ffa: RX acquire denied, no RX/TX mapped\=
n");
>          goto out;
>      }
>
>      if ( !ctx->rx_is_free )
>      {
>          ret =3D FFA_RET_BUSY;
> +        if ( printk_ratelimit() )
> +            gdprintk(XENLOG_DEBUG, "ffa: RX acquire busy\n");
>          goto out;
>      }
>
> @@ -316,7 +321,10 @@ int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **b=
uf, size_t *buf_size)
>      {
>          ret =3D ffa_simple_call(FFA_RX_ACQUIRE, ctx->ffa_id, 0, 0, 0);
>          if ( ret !=3D FFA_RET_OK )
> +        {
> +            gdprintk(XENLOG_DEBUG, "ffa: RX acquire failed: %d\n", ret);
>              goto out;
> +        }
>      }
>      ctx->rx_is_free =3D false;
>      *buf =3D ctx->rx;
> @@ -355,13 +363,22 @@ int32_t ffa_tx_acquire(struct ffa_ctx *ctx, const v=
oid **buf, size_t *buf_size)
>      int32_t ret =3D FFA_RET_DENIED;
>
>      if ( !spin_trylock(&ctx->tx_lock) )
> +    {
> +        gdprintk(XENLOG_DEBUG, "ffa: TX acquire busy\n");
>          return FFA_RET_BUSY;
> +    }
>
>      if ( !ctx->page_count )
> +    {
> +        gdprintk(XENLOG_DEBUG, "ffa: TX acquire denied, no RX/TX mapped\=
n");
>          goto err_unlock;
> +    }
>
>      if ( !ctx->tx )
> +    {
> +        gdprintk(XENLOG_DEBUG, "ffa: TX acquire denied, TX buffer missin=
g\n");
>          goto err_unlock;
> +    }
>
>      *buf =3D ctx->tx;
>      *buf_size =3D ctx->page_count * FFA_PAGE_SIZE;
> --
> 2.50.1 (Apple Git-155)
>

