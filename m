Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKDPLk87jGlZjgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:18:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D48E122297
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:18:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227044.1533372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5QA-0002DN-Jz; Wed, 11 Feb 2026 08:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227044.1533372; Wed, 11 Feb 2026 08:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5QA-0002Bc-H9; Wed, 11 Feb 2026 08:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1227044;
 Wed, 11 Feb 2026 08:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgMA=AP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vq5Q9-0002BW-M0
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 08:18:01 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cec58b8-0722-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 09:17:59 +0100 (CET)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-45c715116dbso1030790b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 00:17:59 -0800 (PST)
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
X-Inumbo-ID: 2cec58b8-0722-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770797878; cv=none;
        d=google.com; s=arc-20240605;
        b=M3phq9/+dfUxcuXoXwSKQzUIY/hRc7st9K62fZcLz/xoyH1eusRk4VSeNX3pmsYX4q
         kwEDqv4FIDdQcxu7Ou6sVL/I/wq0MkXsChD3vTVQtej+Ij5hGp1/Hkz1vF/QGY8pZvW+
         ybeiC3e4Y4jsFS9h13VX5CJIe8lUTWsdtVKYY7adwGMexATbjy2+OasaaJ0+a752UliT
         ziKNUX40YTA9YNn/7lcZbvPkTx6WFyIwUKbH38gyswx1oWkEcXD4kUbdC/zAM2W7D0pr
         9LIRH/hesCaX/z/WqaVEVX2zno0JBsHuZR2U+5m2O8B4YL23JE3npY1OurBnheqq2z3R
         1/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZvwsY8t0d7Xd+Mem21a0yyFMKg8oqPUl/yzfR3i0ZWc=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=Kwi1aB8YZq9WSO+mS+gqFBDJk5AvA9tpzCTzOoounBubvfATm5OjAGps9P/t1v+jSQ
         WxAp66OqAqeV5r6n3gpWuM1VVsTExo8hAPlZbjpHH+z1OVpPO8VviQpTPOUYQF+PkyG7
         xADZzyPX2N8Nj6DbfTNUrm1Dm91uAUR03Gv/RdydsI06hJWSLP6kSxUMO7WXddXLAfnh
         1VtSL8x91LTciMPf0gj5AyI82SOqPfLS22heipumDFQblsXBWfzjWZKr/MUNVykeay3m
         x9oc8bnhnnyamafadS6sc0IO6aFEugmiIVETZdJIEym4+yUCfZCKTHoVSJ7k28oKvkd3
         b6fg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770797878; x=1771402678; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvwsY8t0d7Xd+Mem21a0yyFMKg8oqPUl/yzfR3i0ZWc=;
        b=GxOzyixVFtLRaIazy60bN8XsF8i+bCJ71U54o/5rUrXpKbjotboDsTDBizA3ssgQsX
         bOKtZksYqVdNW/YGTZQGC09E2jL0ZTF2GH0Orz/ZO+jMZlIkV8UmANWXdR88he05tFCJ
         MYuiCvONx5v5+lsD03FOZwpZgUjDj1rKy6xvL6NkQCehEsinzjK4y2qxFflDv7WdrM4k
         lwS5GOr3X5aMhRNi8psl3fgIjEN+si22MXgA7XlCnfS8GaqTzvUK92LGG+BX1tjPEHBu
         qC5YzjLRiodIFk3mR5KMqdcKCkS33JG7sCA6wNrR+RC3ECmTvZF9za08VbdEte32d34s
         8zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770797878; x=1771402678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZvwsY8t0d7Xd+Mem21a0yyFMKg8oqPUl/yzfR3i0ZWc=;
        b=MyBzjvuN0OqdezwNPjeM+wYjbOJUZjg04Ok414LKDta+GApWjAg016p/sGlHJmt2C1
         7Qp7I0Rfu7uCrDO2trBxsls4ehi9zco+H1sIKqtKKi7ZaKBECrN595tywxCERtHVy4PL
         zZ3fO8krO/WNUR/VFXru0c2+5A7W4MyJO39116yxShvVaARp1TFSak/QY2IMIMSsMpG/
         gUb0cB0n/f9oBUzpRtp1GYe2nbyMssASXAuQOXdBHrCgb1uxoEWfzUaaBIJ7dtOHCu3O
         Nf1V7Uh5Yt/GvM3NsMczHj2SSsC0BO+cu3UzTrMCj2NVNCiJLSo2ZNu/N08meI9OTvMA
         621Q==
X-Gm-Message-State: AOJu0Yy9LURN+7HgGLUyRLtY8Vx3A0xRnFjEi3NUQa9VMhvwHQoHdL1M
	1qYYmhmKJxMvvvNWhE9hD/I1mG8CjKJweJYxyZIOZ7rZfPfuw6vAK3G9N5eE7LoMGaj/nptoKZZ
	2OUQXf+CMK6fXkX0URcBrpY4pADLBrdQT27xAEsM3Vw==
X-Gm-Gg: AZuq6aJp7l+nycPUJhTkH3IjMEhYH0mOu0o8Vp+IPwZCIjIpSXwFhlqwQBz8UmNqKWY
	VD4Iigpk2CGjOUOjeZNEOase1gMqfn+B6QHVtyPiKVrVbLkRtzuK1Hy5xRhGbuW1nLNVYtPU1HI
	IdfjpF0A3xvemurc950fHBrTcgQqLonqA/KSbvE8TbReTTBmtQ2VQnG7jg62UMmyVXw9OZI72HF
	a83ouhMptKqZGzulOZu1JrIcM9TcX2IR4R2wv0oy1VRbITXfm+K1AU1622qiJ+GbcR9a3CWR9Yh
	GkE92+rH/6hdixRPVyX4xpdp5cC/2JdjKARE4Q==
X-Received: by 2002:a05:6808:238f:b0:450:a9d0:b790 with SMTP id
 5614622812f47-462fcb66cc5mr8365484b6e.46.1770797878205; Wed, 11 Feb 2026
 00:17:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <5331b33343441028d10c290b21b82acce295fff0.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <5331b33343441028d10c290b21b82acce295fff0.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Feb 2026 09:17:46 +0100
X-Gm-Features: AZwV_QhE0gcct39M8TIW1-bQXxJYBmkPBkcr8-Z4pFs7iATDwX9jHErhRwWV-kg
Message-ID: <CAHUa44FWRepyAakwXLjObbA=8O_LMBR5jk0-WEAXZdgsQCsHOw@mail.gmail.com>
Subject: Re: [PATCH 08/12] xen/arm: ffa: Fix FFA_FEATURES validation
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:dkim,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: 0D48E122297
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> FFA_FEATURES currently accepts non-zero input properties (w2-w7) from
> guests and advertises several ABIs unconditionally, even when firmware
> support is missing or when the ABI is physical-instance-only. This can
> mislead guests about what Xen can actually provide and violates FF-A
> calling conventions. Some SPMCs (Hafnium v2.14 or earlier) also fail to
> report FFA_RX_ACQUIRE despite supporting it.
>
> Update FFA_FEATURES validation to match spec and firmware support:
> - reject non-zero w2-w7 input properties with INVALID_PARAMETERS
> - reject 64-bit calling conventions from 32-bit guests with NOT_SUPPORTED
> - return NOT_SUPPORTED for physical-instance-only ABIs
> (FFA_NOTIFICATION_BITMAP_{CREATE,DESTROY}, FFA_RX_ACQUIRE)
> - advertise FFA_INTERRUPT as supported
> - gate message ABIs on firmware support:
> - FFA_MSG_SEND_DIRECT_REQ_{32,64}
> - FFA_MSG_SEND_DIRECT_REQ2 (also requires FF-A 1.2 negotiation)
> - FFA_MSG_SEND2 (or VM-to-VM enabled)
> - report MEM_SHARE_{32,64} only when FFA_MEM_SHARE_64 is supported
> - stop advertising FFA_MSG_YIELD (not implemented)
>
> Update firmware probing: drop FFA_MEM_SHARE_32 checks (deprecated) and
> add FFA_RX_ACQUIRE to the probed set. If FFA_MSG_SEND2 is reported but
> FFA_RX_ACQUIRE is not, assume RX_ACQUIRE support and warn to work
> around the Hafnium bug.
>
> Functional impact: guests now see ABI support that reflects firmware
> capabilities and Xen implementation status. When SEND2 is present but
> RX_ACQUIRE is not reported, Xen assumes RX_ACQUIRE support.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c | 62 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 55 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 6de2b9f8ac8e..e9e020bb0cb3 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -91,10 +91,10 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[] =
=3D {
>      FW_ABI(FFA_PARTITION_INFO_GET),
>      FW_ABI(FFA_NOTIFICATION_INFO_GET_64),
>      FW_ABI(FFA_NOTIFICATION_GET),
> +    FW_ABI(FFA_RX_ACQUIRE),
>      FW_ABI(FFA_RX_RELEASE),
>      FW_ABI(FFA_RXTX_MAP_64),
>      FW_ABI(FFA_RXTX_UNMAP),
> -    FW_ABI(FFA_MEM_SHARE_32),
>      FW_ABI(FFA_MEM_SHARE_64),
>      FW_ABI(FFA_MEM_RECLAIM),
>      FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
> @@ -240,19 +240,39 @@ static void handle_features(struct cpu_user_regs *r=
egs)
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      unsigned int n;
>
> +    /*
> +     * Xen does not accept any non-zero FFA_FEATURES input properties fr=
om
> +     * VMs. The spec only defines w2 input properties for FFA_MEM_RETRIE=
VE_REQ
> +     * (NS-bit negotiation for SP/SPMC) and FFA_RXTX_MAP (buffer size an=
d
> +     * alignment), so w2 must be MBZ for our callers.
> +     */

The spec (version 1.2) lists them as SBZ, except for w2, which is MBZ,
for Feature IDs.
However, if we're to return an error, invalid parameters is a better choice=
.

Cheers,
Jens

>      for ( n =3D 2; n <=3D 7; n++ )
>      {
>          if ( get_user_reg(regs, n) )
>          {
> -            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +            ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
>              return;
>          }
>      }
>
> +    if ( !is_64bit_domain(d) && smccc_is_conv_64(a1) )
> +    {
> +        /* 32bit guests should only use 32bit convention calls */
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
>      switch ( a1 )
>      {
> +    case FFA_NOTIFICATION_BITMAP_CREATE:
> +    case FFA_NOTIFICATION_BITMAP_DESTROY:
> +    case FFA_RX_ACQUIRE:
> +        /* Physical-instance-only ABIs are not exposed to VMs. */
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
>      case FFA_ERROR:
>      case FFA_VERSION:
> +    case FFA_INTERRUPT:
>      case FFA_SUCCESS_32:
>      case FFA_SUCCESS_64:
>      case FFA_FEATURES:
> @@ -261,16 +281,25 @@ static void handle_features(struct cpu_user_regs *r=
egs)
>      case FFA_RXTX_UNMAP:
>      case FFA_MEM_RECLAIM:
>      case FFA_PARTITION_INFO_GET:
> +        ffa_set_regs_success(regs, 0, 0);
> +        break;
>      case FFA_MSG_SEND_DIRECT_REQ_32:
>      case FFA_MSG_SEND_DIRECT_REQ_64:
> -    case FFA_MSG_SEND2:
>      case FFA_RUN:
> -    case FFA_INTERRUPT:
> -    case FFA_MSG_YIELD:
> -        ffa_set_regs_success(regs, 0, 0);
> +        if ( ffa_fw_supports_fid(a1) )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +    case FFA_MSG_SEND2:
> +        if ( ffa_fw_supports_fid(a1) || IS_ENABLED(CONFIG_FFA_VM_TO_VM) =
)
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          break;
>      case FFA_MSG_SEND_DIRECT_REQ2:
> -        if ( ACCESS_ONCE(ctx->guest_vers) >=3D FFA_VERSION_1_2 )
> +        if ( ACCESS_ONCE(ctx->guest_vers) >=3D FFA_VERSION_1_2 &&
> +             ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ2) )
>          {
>              ffa_set_regs_success(regs, 0, 0);
>          }
> @@ -281,6 +310,11 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>          break;
>      case FFA_MEM_SHARE_64:
>      case FFA_MEM_SHARE_32:
> +        if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
> +        {
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +            break;
> +        }
>          /*
>           * We currently don't support dynamically allocated buffers. Rep=
ort
>           * that with 0 in bit[0] of w2.
> @@ -688,6 +722,20 @@ static bool ffa_probe_fw(void)
>                     ffa_fw_abi_needed[i].name);
>      }
>
> +    /*
> +     * Hafnium v2.14 or earlier does not report FFA_RX_ACQUIRE in
> +     * FFA_FEATURES even though it supports it.
> +     */
> +    if ( !ffa_fw_supports_fid(FFA_RX_ACQUIRE) &&
> +         ffa_fw_supports_fid(FFA_MSG_SEND2) )
> +    {
> +        printk(XENLOG_WARNING
> +               "ARM FF-A Firmware reports FFA_MSG_SEND2 without FFA_RX_A=
CQUIRE\n");
> +        printk(XENLOG_WARNING
> +               "ffa: assuming RX_ACQUIRE support (workaround)\n");
> +        set_bit(FFA_ABI_BITNUM(FFA_RX_ACQUIRE), ffa_fw_abi_supported);
> +    }
> +
>      if ( !ffa_rxtx_spmc_init() )
>      {
>          printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
> --
> 2.50.1 (Apple Git-155)
>

