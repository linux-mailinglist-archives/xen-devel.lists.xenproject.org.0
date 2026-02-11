Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA+VKx9XjGm9lQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:17:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17231233E2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:17:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227197.1533529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7H6-0006qv-8o; Wed, 11 Feb 2026 10:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227197.1533529; Wed, 11 Feb 2026 10:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7H6-0006o3-5P; Wed, 11 Feb 2026 10:16:48 +0000
Received: by outflank-mailman (input) for mailman id 1227197;
 Wed, 11 Feb 2026 10:16:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgMA=AP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vq7H5-0006nx-1K
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:16:47 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c408716f-0732-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 11:16:45 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6740e0bd21bso329608eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 02:16:45 -0800 (PST)
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
X-Inumbo-ID: c408716f-0732-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770805004; cv=none;
        d=google.com; s=arc-20240605;
        b=Gp7d91ObsQDWy1Y1WysZNXQS8eknDP42F99LvuG6z58SpsdOjeNG7FPD2bXIACFi9M
         jdjCs68sIM1qosD1EQ+aXE6uBQKwpuOx2uKfBhcVOSWZ2uQBtaPw+O4nqhfmVCEdf6ry
         Nhvr7HrWKDiPW1OIPXjhAoLWSWmO8YfYKxO8LlGnxOc2vKNQ/Z77+/p3kLwU/jC1Pf4j
         1LhiqaCDhcUHbwzp2sbXFl7R1gYWpzxM2IXo7Nzr1p2+huty7/blaVZAuXssk/rFtLow
         o7yrwZpaOzn/4jMKjU5yjRXhMzXoIQGzmGE3psw/KpwQJj6TM+4CKcNHMgYdpod4grcx
         G5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBzEpI6yzSuiNuN55EcuEkswXj0DVLUl3gKhgokc9OU=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=iV4ZS8vB00NInEoZr9MGfh16FKo+/lpC+8s3v7A2t453CmQSVcNXCV9j/MbvKo1IEL
         /rWk4BHGMqDK8c/ZZmNTa/orGam46MA3f8RReOyoISNtT9/+JDDKLVmf75MGNnHWqYe0
         9biPnLmiecqKZRMU3PXB7QL7rVF0Pcm5D1l3a2qt6vXuEwaH2NwDwy/wB0SGt+gsRLaj
         TBt5LLpq8RHpbcvNtChmlvg8DgWyuacsJMlJjHP5u8uK2biildzhlfQdis5NEQes0feQ
         O5335ci32QpoG4/kmG/ML9q5UnmDj9WUuz7F9AjaqnCQBVPwfmJ1MGbHmghFLSziqPop
         EBGQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770805004; x=1771409804; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBzEpI6yzSuiNuN55EcuEkswXj0DVLUl3gKhgokc9OU=;
        b=wEC7UBsnnTGljP+sXvsQgZpXbQk+O8VhyI5gNru7bNNsYVmpHz22J/EYjbVtnt1g97
         efEPE6QPVqR4N1Ud0PRg4bLnbjvTS1qkHgNGTZYGoPP8AngQZXI7Ukt6ElsLfPqmeiRS
         PsXykfwKNcXkO8Az8g277oClBBJKRCBFRCFJVV5Nr4C0pQjOtmdR9zFPGbHWUVPlj/3c
         8U/JWfB26vlfS8WrpuiDtNPMcuUK5NtiPdkjj2pEI61dnSqktFVoTixPYWeX0hHdC/jG
         QFCFNd2w85ZMT+slTXRQLejOb526I4uhnHKQmuGUM1/3wdEHu96DFXjgmyf0MQ88tz81
         /LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805004; x=1771409804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBzEpI6yzSuiNuN55EcuEkswXj0DVLUl3gKhgokc9OU=;
        b=efnC8ADvtgIrvw3E+kP0oDWHndonsK5GTzIejhaW8k7wiIpA+lbVv3KFo2I9yoYQas
         /XY6MgYZerBrh21wPvIgpAENENVm3cD62xOt50DinjehBQg83kCGGdgQ78bXjsHSOpcL
         b7xtl7Ag3BFwHTAp/NKVUtEI8kgBChREhP5KXeWcA/sAH/Y/uOdTHlQIwLinDYbKSK2E
         CfBj+gJa1mzIRPNwcowAfTbikv77Wj8NnrgKMUS4TZuAIXprGMzAeNb3BnKP9ZR5NRM3
         Ds7zTsHi+woKF35Nvn+NpQXlerOM/P/8z0WByilaXpl/o24WlCzpSnicFZC7U6+dOb8O
         XGLA==
X-Gm-Message-State: AOJu0Yzy5vQ8pEFXrhgQEV8OQ63tNRveABivJhpQgqdw/F2d3aZB+mnS
	Ydi9obQqpM4LbYaJYLDmluvsNbRhWW4Lwnqe2FcIrqCpw/kKmMR/fbipiXnH/5xr2hr/z1HK7mD
	fjSoX/3SuzV5qGCBE3TWOtOKV8T4FwZ5MOel6sCbQOlNKGmvGVKyx
X-Gm-Gg: AZuq6aKifq7j4o5BLufO0SVKQR8Doqod6ZnIAhc+YrsiGkxo7YbqRnYAHGSR5x3C0M+
	NSB5wnD5AxUNbKql+AE8wRRFRmiCZjGIC77+5EiiSBSTQewO+SfphbUBHVscQkR//rm6mx24XQ/
	r4sni1QPPLZ4zamds+YSEzpHKCGAIKd2oFG1JMuv8xCjqVgBMV3MX60b+FMI9lG74iKMbbjcOx2
	Cq2aiK3mJ5Ube1K+3khiilkHpOkEeAEIMhAkLVGuRJoiCINo99WD/zTvtGQE9kpQhq0IEN/eEny
	RWSBZ1ENr4zzOkEULqDwgsuUzwsQ07X4YuDDDw==
X-Received: by 2002:a05:6820:210a:b0:663:a6e:49a7 with SMTP id
 006d021491bc7-6747f385ef7mr573545eaf.19.1770805003715; Wed, 11 Feb 2026
 02:16:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <209e5474e236737dd13e0f7ff8120b05cdb7eabe.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <209e5474e236737dd13e0f7ff8120b05cdb7eabe.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Feb 2026 11:16:31 +0100
X-Gm-Features: AZwV_QipjR6ieZFOpUfyFCXBksh_L80RmeFuP26ja6kDoLgiLqXMLWph2x0RSdA
Message-ID: <CAHUa44Ebe03R2nTzUW9tDx5hPC6trZCWOdr94ApawFs20chdWw@mail.gmail.com>
Subject: Re: [PATCH 12/12] xen/arm: ffa: Add message parameter diagnostics
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,arm.com:email];
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
X-Rspamd-Queue-Id: D17231233E2
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> MSG_SEND2 and direct request validation failures are silent, making it
> hard to diagnose invalid IDs, oversized messages, or unsupported
> destination types.
>
> Add debug logs for parameter validation failures:
> - invalid endpoint IDs
> - oversized messages
> - unsupported destination types
> - invalid sender/receiver combinations
> - ratelimit MSG_SEND2 busy failures to avoid log flooding
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_msg.c | 45 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index 928f269f6c3a..cc273c9a8e80 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include <xen/const.h>
> +#include <xen/lib.h>
>  #include <xen/sizes.h>
>  #include <xen/types.h>
>
> @@ -100,6 +101,7 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_r=
egs *regs, uint32_t fid)
>      if ( !ffa_fw_supports_fid(fid) )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> +        gdprintk(XENLOG_DEBUG, "ffa: direct req fid %#x not supported\n"=
, fid);
>          goto out;
>      }
>
> @@ -108,6 +110,9 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_r=
egs *regs, uint32_t fid)
>           (src_dst & GENMASK(15,0)) =3D=3D ffa_get_vm_id(d) )
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: direct req invalid src/dst %#x\n",
> +                 (uint32_t)src_dst);
>          goto out;
>      }
>
> @@ -115,6 +120,9 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_r=
egs *regs, uint32_t fid)
>      if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: direct req to non-secure dst %#x\n",
> +                 (uint32_t)(src_dst & GENMASK(15, 0)));
>          goto out;
>      }
>
> @@ -166,7 +174,12 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, con=
st void *src_buf,
>      /* This is also checking that dest is not src */
>      ret =3D ffa_endpoint_domain_lookup(dst_id, &dst_d, &dst_ctx);
>      if ( ret )
> +    {
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: msg_send2 lookup failed: dst %#x ret %d\n",
> +                 dst_id, ret);
>          return ret;
> +    }
>
>      /* This also checks that destination has set a Rx buffer */
>      ret =3D ffa_rx_acquire(dst_ctx , &rx_buf, &rx_size);
> @@ -199,6 +212,12 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, con=
st void *src_buf,
>      /* receiver rx buffer will be released by the receiver*/
>
>  out_unlock:
> +    if ( ret )
> +    {
> +        if ( ret !=3D FFA_RET_BUSY || printk_ratelimit() )

Shouldn't this be && ?

Cheers,
Jens

> +            gdprintk(XENLOG_DEBUG, "ffa: msg_send2 to %#x failed: %d\n",
> +                     dst_id, ret);
> +    }
>      rcu_unlock_domain(dst_d);
>      if ( !ret )
>          ffa_raise_rx_buffer_full(dst_d);
> @@ -226,7 +245,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *r=
egs)
>
>      ret =3D ffa_tx_acquire(src_ctx, &tx_buf, &tx_size);
>      if ( ret !=3D FFA_RET_OK )
> +    {
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: msg_send2 TX acquire failed: %d\n", ret);
>          return ret;
> +    }
>
>      /* create a copy of the message header */
>      memcpy(&src_msg, tx_buf, sizeof(src_msg));
> @@ -238,6 +261,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
gs)
>           dst_id =3D=3D ffa_get_vm_id(src_d) )
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: msg_send2 invalid src/dst src %#x dst %#x\n",
> +                 src_id, dst_id);
>          goto out;
>      }
>
> @@ -246,6 +272,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
gs)
>          if (src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_1))
>          {
>              ret =3D FFA_RET_INVALID_PARAMETERS;
> +            gdprintk(XENLOG_DEBUG,
> +                     "ffa: msg_send2 invalid msg_offset %u (v1.1)\n",
> +                     src_msg.msg_offset);
>              goto out;
>          }
>          /* Set uuid to Nil UUID for v1.1 guests */
> @@ -255,6 +284,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
gs)
>      else if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_2) =
)
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: msg_send2 invalid msg_offset %u (v1.2)\n",
> +                 src_msg.msg_offset);
>          goto out;
>      }
>
> @@ -263,6 +295,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
gs)
>              src_msg.msg_size > (tx_size - src_msg.msg_offset) )
>      {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: msg_send2 invalid msg_size %u offset %u tx %zu\n"=
,
> +                 src_msg.msg_size, src_msg.msg_offset, tx_size);
>          goto out;
>      }
>
> @@ -272,6 +307,8 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
gs)
>          if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
>          {
>              ret =3D FFA_RET_NOT_SUPPORTED;
> +            gdprintk(XENLOG_DEBUG,
> +                     "ffa: msg_send2 to SP not supported\n");
>              goto out;
>          }
>          /*
> @@ -288,6 +325,8 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
gs)
>
>          ret =3D ffa_simple_call(FFA_MSG_SEND2,
>                                ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0,=
 0, 0);
> +        if ( ret )
> +            gdprintk(XENLOG_DEBUG, "ffa: msg_send2 to SP failed: %d\n", =
ret);
>      }
>      else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>      {
> @@ -295,7 +334,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *r=
egs)
>          ret =3D ffa_msg_send2_vm(dst_id, tx_buf, &src_msg);
>      }
>      else
> +    {
>          ret =3D FFA_RET_INVALID_PARAMETERS;
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: msg_send2 to VM disabled (dst %#x)\n", dst_id);
> +    }
>
>  out:
>      ffa_tx_release(src_ctx);
> @@ -311,6 +354,7 @@ void ffa_handle_run(struct cpu_user_regs *regs, uint3=
2_t fid)
>      if ( !ffa_fw_supports_fid(fid) )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> +        gdprintk(XENLOG_DEBUG, "ffa: run fid %#x not supported\n", fid);
>          goto out;
>      }
>
> @@ -322,6 +366,7 @@ void ffa_handle_run(struct cpu_user_regs *regs, uint3=
2_t fid)
>      if ( !FFA_ID_IS_SECURE(dst >> 16) )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> +        gdprintk(XENLOG_DEBUG, "ffa: run to non-secure dst %#x\n", dst);
>          goto out;
>      }
>
> --
> 2.50.1 (Apple Git-155)
>

