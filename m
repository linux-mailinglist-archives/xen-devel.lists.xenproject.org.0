Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B4qIwbnjWkm8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:43:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA612E5F0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:43:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229127.1535132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXuO-0002JI-JW; Thu, 12 Feb 2026 14:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229127.1535132; Thu, 12 Feb 2026 14:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXuO-0002GC-Gm; Thu, 12 Feb 2026 14:43:08 +0000
Received: by outflank-mailman (input) for mailman id 1229127;
 Thu, 12 Feb 2026 14:43:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yal/=AQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vqXuN-0002G6-G8
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:43:07 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23537684-0821-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 15:43:05 +0100 (CET)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-40ea36b56b7so1896787fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 06:43:05 -0800 (PST)
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
X-Inumbo-ID: 23537684-0821-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770907384; cv=none;
        d=google.com; s=arc-20240605;
        b=JOS3+mMbhh2Z4KA/izPPzhX107UEQlsz+HSTZ11ou55J9rJqlwY7L/idnHEebDmvF1
         hMY1M/dx3Tla/QNC8ioacblDlQDXj5MSvhzo+3fQhXtHpyvbxsiU975mmbbHcXIF7U95
         lZIwkjUKqG31HR951xCL67qku3FwAtbe9H4ngGg/KOl/AYA4dG7rsemAcKLAlhm6Vwyr
         qInDwyYJMWA21zNyPrCVaIzq3mZHHWE/DqvDsXfguL4xXv5XveWWBxzf50Egbsube8YZ
         /M8Q06GuSHxJR77VH96J5KAxMujIr/RdcuSuuqHsK+6nGFLFp/KgG1sabZAxt7hHvEk0
         A8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fmsGaSKF5EXtyoY37xtT1UIgrvDD2BADzoVe0lfSOe4=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=S/xeuassQH/JaRGGBfttMisg9oKaJ+G8fjiMvx9VtL7YdNLvKyW3NYnq0AgHmf3iQ1
         ZgYAfo1NNXGaz+7ZMnxrYQbd5M+5nzXv8JBa4uw2f5+jwPwP3c98CWVQrp3kx5ivLnp6
         SqV+FdB/1585Km8CQMdLr2hAnnJ6VfVZi3Suk5zdVLvI0uMbjsPVHNHVH0D4mw4SAWUe
         VvFz1sz6jflhKy3vchiENlBJ7BIfn468wZ56c1w/xX/nKb4Dr610NT+HeJg2A+55Jp8k
         QaAoD3jRaOS1UWgCjlpXLP7VlOMdA90FDKKrQNoBu9PS9Pkl6USZGA8DsoFk/DGNVjAt
         RxQQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770907384; x=1771512184; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmsGaSKF5EXtyoY37xtT1UIgrvDD2BADzoVe0lfSOe4=;
        b=oQB41mCVEAG2oi7e9gJefOWkzkXL7Q7fpZM73+Yi8RlAJjR6LsuqmjLnNJfysmCdyY
         i6g9uhJMT6kzOPqu9/j1zW1Dfzq2HtKPD9G6JSqc5eRXdKqaihXeIiXAkEaT1P++MRxJ
         TOccq0cLcpw4sukwPDtbG4iqSY1cuQPHzgW/6R3x+b6CMT6raBHldlwN7NlrS6wJQUpp
         4gyBYnm7f4lROBE/ki9w47vHChaCTT4RdyfM0uuR2/ULsaf9uitbd8/JmtP3L9pfYzpF
         PBPoIbHmk5vtLlvHTYMKOEAGk0ezxSMBxxLpluKNM6TkrftpzaP9EtcmVDeR3CxmMpfv
         5QKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907384; x=1771512184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fmsGaSKF5EXtyoY37xtT1UIgrvDD2BADzoVe0lfSOe4=;
        b=KmTTfSPuB7u3gLcAr7y19Tj0T32zJI9MmdUylLMNXSj5sfFS6FH0tafUs3o13OXAQD
         giuoNQ4BUNGxvdKAIcsAJ58RvQ+RbwvdbAzQ7XsCA2C9ox21A++6NLl1+HD8Czz3zEhn
         pI+h6UXIN8IE3MoQ4sSahYqu9ETucahiE9QNSQNKgaE1M9dAeYj/RhpERY7w5CfdiLOO
         bvtgLq+5SrO4ZtX035w1lQQrCwDQ8fMyIdjwcg10owkqZ6i7zXEenpP909Du1t8tQtet
         msd3A02RMBgsostf5QVXpDPZkSFBTAEuSMEp7vJDeDvz4DQWQvEa49y5WUxh2y/rjbh+
         Mhcw==
X-Gm-Message-State: AOJu0Yy3I0CKO/wGLlNzx420mX4L4Uo6Zs+SYeelk/+8xu6Zqf5cyOCc
	ls8OQQ+hsu7aXNgzYrVHg1JqPDH4V57cxpyOpSnmvFvTbWgP5eGNzBrgnqdAGP15BLBp4fWu2Bd
	lTAKDxLSLLLViaUyd45CQMre9PuPOMBksNSE0holtSA==
X-Gm-Gg: AZuq6aJw7hyLfvTon/q06V+oTMGC89QJgoGbG2iPHfsZ6b5R7NpJadB5OopjUNWRj0Y
	QfGGgRwQ2LwornDK9CUGJZJeO8gCO9zwXeQHGrf1DxCEc8BgFGkJ1VRrSMAKN1o6sfnWkiOBDk/
	LDvkx4UfEJ3U4GfMLMv1ye2RZD1qwpV5GCTVPat1sRnVCxwt2Ooz57/w7GiniY1ni/QGnsbUj0o
	GKra6sCNlt5HXCtm6n2DuuKYz+OPPKim74oZT+P8QWigqYfqgVJ1KYU+ct1CZywKH+vWYZ+MVZi
	HyCxbCh4o7o+UpZQwTvEXAh8CL6SJ8cmqYEVWw==
X-Received: by 2002:a05:6870:d61e:b0:36c:abe0:83d3 with SMTP id
 586e51a60fabf-40eca2fbfaamr1205801fac.39.1770907383709; Thu, 12 Feb 2026
 06:43:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770826406.git.bertrand.marquis@arm.com> <d76dceb237df9fec6f27b7860959b6910351ab1e.1770826406.git.bertrand.marquis@arm.com>
In-Reply-To: <d76dceb237df9fec6f27b7860959b6910351ab1e.1770826406.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 12 Feb 2026 15:42:52 +0100
X-Gm-Features: AZwV_Qg1llTUgkAa7Rqj4ful2P_gxsUqKr43vL-NKJaZbYr_RswNIAUV5FJG3eM
Message-ID: <CAHUa44EHTByK-9eDp6x8q07k7n9PPqqO6gNqHqdNbRRbuoR3Gg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] xen/arm: ffa: Fix FFA_FEATURES validation
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFDA612E5F0
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 11, 2026 at 6:16=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> FFA_FEATURES advertises several ABIs unconditionally, even when firmware
> support is missing or when the ABI is physical-instance-only. This can
> mislead guests about what Xen can actually provide and violates FF-A
> calling conventions. Some SPMCs (Hafnium v2.14 or earlier) also fail to
> report FFA_RX_ACQUIRE despite supporting it.
>
> Update FFA_FEATURES validation to match spec and firmware support:
> - do no check w2-w7 input registers during FFA_FEATURES as they are
>   flagged Should Be Zero by the FF-A specification or are not used by
>   the calls we support.
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
> Changes since v1:
> - remove completely w2-w7 checking as those are SBZ in the spec or
>   unused by xen
> ---
>  xen/arch/arm/tee/ffa.c | 63 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 50 insertions(+), 13 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 23e1f408485b..cb8cd95fdafa 100644
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
> @@ -238,21 +238,30 @@ static void handle_features(struct cpu_user_regs *r=
egs)
>      uint32_t a1 =3D get_user_reg(regs, 1);
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> -    unsigned int n;
>
> -    for ( n =3D 2; n <=3D 7; n++ )
> +    /*
> +     * FFA_FEATURES defines w2 as input properties only for specific
> +     * function IDs and reserves w3-w7 as SBZ. Xen does not currently
> +     * implement any feature that consumes w2, so ignore extra inputs.
> +     */
> +    if ( !is_64bit_domain(d) && smccc_is_conv_64(a1) )
>      {
> -        if ( get_user_reg(regs, n) )
> -        {
> -            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> -            return;
> -        }
> +        /* 32bit guests should only use 32bit convention calls */
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
>      }
>
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
> @@ -261,16 +270,25 @@ static void handle_features(struct cpu_user_regs *r=
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
> @@ -281,6 +299,11 @@ static void handle_features(struct cpu_user_regs *re=
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
> @@ -688,6 +711,20 @@ static bool ffa_probe_fw(void)
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
> 2.52.0
>

