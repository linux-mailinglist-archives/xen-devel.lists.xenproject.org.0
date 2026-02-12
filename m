Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJLhJdfnjWkm8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376FB12E7B2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229155.1535193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxn-0004Qb-Iy; Thu, 12 Feb 2026 14:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229155.1535193; Thu, 12 Feb 2026 14:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxn-0004OF-EY; Thu, 12 Feb 2026 14:46:39 +0000
Received: by outflank-mailman (input) for mailman id 1229155;
 Thu, 12 Feb 2026 14:46:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yal/=AQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vqXxl-0002nh-IF
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:46:37 +0000
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0b02eb6-0821-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 15:46:35 +0100 (CET)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7d44b2df00aso3284567a34.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 06:46:35 -0800 (PST)
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
X-Inumbo-ID: a0b02eb6-0821-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770907594; cv=none;
        d=google.com; s=arc-20240605;
        b=a5w+epA7rWy4VBQNuzfm34M+2iVslC7X7Sx3Jjw/OC8CY0TCOPNN/xZOBYzAK6BA3x
         ZbSSw04XRAw5KEUYW2zTin+8igwuOx7EzIOEf8XL+MrDu6sNVnfMODJFwQKR9t2CeDkf
         h0HM6y0IuVh79AQ4BcFLmy+LLCZhsyXEScZuo+CZoRL5Gh9e9o7E/uJPfglYFPeMDvXH
         BD7FIv3ufn7eQju9IepK7ao334j9fJ7qfA+rjMKtYV/cn9xFKej7CRBmxGTyUKYnZ5Jm
         jbhf6BlkpNEXWOI/8K1X7235EciEXvZp/6eRCPs7h3TgVedKwOzAHAPjeFhpCxQ6NPBY
         c7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zrDF7xqizXAwJ8veOYffIQY4VqbAAu4CVWWB5hv0DxI=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=LzBSGUd83wYmLKaMRl0rSCnFjZNkly6+a8MF6Y4SGtaANW0DYKhK0822VE5QflxOaC
         J2POG3A2KvfCD5hsPLwmrshytgwJBA2sHVUr3CQOGUg3fmXr385zHZ2n3Riap+8VfDQq
         R4Wclz+vrJ8GjcEiFp2dnmulJeR/HpuMKq2jE7fQp3UYTGckRrkRKU46gne8KfTgU/be
         VPOrxkI2v+9dvuNdnmalpuqmb09QAVqj2kqTqojFaI74nyecuCVYDb3nkMA+3Zj60ikN
         e6qDUTtouhaDAWDx2/b03JnYYvFx1sCxbG1N3ZW+KinbqNCjWPwpoDl2j8O6BnshFmN4
         7m6Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770907594; x=1771512394; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrDF7xqizXAwJ8veOYffIQY4VqbAAu4CVWWB5hv0DxI=;
        b=RMSObuzXuDcNLNN1w6OejAXZOFf1LLbycXAf4gAtO7c4WfJdKRLssPC4P6JQTd9gZa
         0qsWh/fCqxRXCLK/fA49Z3xofujpGGbMhK1WP61kw1ShmDbvTSBwk6JpPQ48lAp3wNzf
         f0qtp7A9lb1k117S/dwsNZX0SO8MIfuVrd4jPCWbFxKgxLgIu+XM2ZdsGbQM1JAE4P+2
         N3+Fw8aH0bXuTBDQo7S+V5PMjCr/xHe7mlcW+AicfeMF/8YwnpBqAFH2SiDpJ46RrjCB
         xco2Z8I7mDMAvWEUMgnpEM6eTthjgUPOrcW5hUOnWmq9w6lYIlOIqMFc7GNCVGnmXtXe
         mZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907594; x=1771512394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zrDF7xqizXAwJ8veOYffIQY4VqbAAu4CVWWB5hv0DxI=;
        b=V28XsRipNWHErQ3noAN/x8OEX2CUkzf4aTTqs2154JAZVqiVibd8BjbvxYoULdwmM0
         swz7ZOey1eY7AbUsBMemAPOM1qKaK2GYzbfJl40e3Op686Jwr37lZGuSvRX8DSXIPMgY
         uxmxaiSlCH5d5seh+jvBpMdyOXKxs5u5RkXQfTccn8HPSjILr6l+jQIdwttnoYtUYqub
         Nz9RLYZP/hrAQxYPwCbXv83zgNoVIqJMexHmujnCew/JC33EMYL+dOWV/yjyhaw6A4py
         Bh9zhahw5Com5AF7xXKnkkVNR8MQj2IaytT2lJtOYCP1oLOu/c2EQgyIDB3seH5G/NdE
         6awg==
X-Gm-Message-State: AOJu0YzEHGQ1s9dULmvZ/HqXNnHt2Em9HeFG1SUEJgfd7/E/uSznPWpm
	y3VixL9piazfZtlBYynxksAcv5tnZQD8+lHeqlEfI1fUbEwh7OYDAZSrD9PET5IqAt0S0h/VPBD
	w/K77BstQWjKR5ZbwOYJp4BfQpAHTsKXTGe+SYbvgnA==
X-Gm-Gg: AZuq6aIz6yAFRWyvWvrE2TcQ1DogViTXI6iGAZdtQHFx3GbyMXPlfmREw/KSx3pKrwW
	1I+2PL7bSewUaG62Mq61qEV481hbRz/l391pM1LK7k6mEEx3k0hp1Qw2gbQdB0gW7Npjyd3rfSY
	oplyQ1NfBSAb/bf9VxMdy8N7k1nqsXVslkZYFbayrXVXFVouaZD0Uq+CERBphrntCDB1VRAwoVf
	QWOyxOpKRA5DNWsZ1K6yINLfnrAjaq7cVmpMJz00CxnQtFiXPgtPhYpGy0yIOk7zYiNbv6vKOXN
	nE3Q9GIy4nfFPcotmAU3+HuOSMweZrCWtp4LtQ==
X-Received: by 2002:a05:6820:1ca5:b0:66e:7aaa:be64 with SMTP id
 006d021491bc7-6759b9b445amr1400449eaf.55.1770907593967; Thu, 12 Feb 2026
 06:46:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770826406.git.bertrand.marquis@arm.com> <ee4ae1ba137aca30b9e6e53e6a2a07f84fac9c56.1770826406.git.bertrand.marquis@arm.com>
In-Reply-To: <ee4ae1ba137aca30b9e6e53e6a2a07f84fac9c56.1770826406.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 12 Feb 2026 15:46:21 +0100
X-Gm-Features: AZwV_QjEdI2-za8UIiLcMsNddFXfzchzJxx4MlgMROAMdBQ_0PUzMzl7tXN62_8
Message-ID: <CAHUa44F2fAwg+bUUTaYNjBMtvnT1z3xAeDAN9wjcYLdb9dUpYQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] xen/arm: ffa: Add message parameter diagnostics
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
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
X-Rspamd-Queue-Id: 376FB12E7B2
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 11, 2026 at 6:16=E2=80=AFPM Bertrand Marquis
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
> Changes since v1:
> - add a comment to explain ratelimit for BUSY in send2
> ---
>  xen/arch/arm/tee/ffa_msg.c | 49 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index 928f269f6c3a..1eadc62870f2 100644
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
> @@ -199,6 +212,16 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, con=
st void *src_buf,
>      /* receiver rx buffer will be released by the receiver*/
>
>  out_unlock:
> +    if ( ret )
> +    {
> +        /**
> +         * Always print other errors than BUSY but ratelimit BUSY prints
> +         * to prevent large number of prints when sender retries on BUSY=
.
> +         */
> +        if ( ret !=3D FFA_RET_BUSY || printk_ratelimit() )
> +            gdprintk(XENLOG_DEBUG, "ffa: msg_send2 to %#x failed: %d\n",
> +                     dst_id, ret);
> +    }
>      rcu_unlock_domain(dst_d);
>      if ( !ret )
>          ffa_raise_rx_buffer_full(dst_d);
> @@ -226,7 +249,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *r=
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
> @@ -238,6 +265,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
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
> @@ -246,6 +276,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
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
> @@ -255,6 +288,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
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
> @@ -263,6 +299,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
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
> @@ -272,6 +311,8 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
gs)
>          if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
>          {
>              ret =3D FFA_RET_NOT_SUPPORTED;
> +            gdprintk(XENLOG_DEBUG,
> +                     "ffa: msg_send2 to SP not supported\n");
>              goto out;
>          }
>          /*
> @@ -288,6 +329,8 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *re=
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
> @@ -295,7 +338,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *r=
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
> @@ -311,6 +358,7 @@ void ffa_handle_run(struct cpu_user_regs *regs, uint3=
2_t fid)
>      if ( !ffa_fw_supports_fid(fid) )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> +        gdprintk(XENLOG_DEBUG, "ffa: run fid %#x not supported\n", fid);
>          goto out;
>      }
>
> @@ -322,6 +370,7 @@ void ffa_handle_run(struct cpu_user_regs *regs, uint3=
2_t fid)
>      if ( !FFA_ID_IS_SECURE(dst >> 16) )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> +        gdprintk(XENLOG_DEBUG, "ffa: run to non-secure dst %#x\n", dst);
>          goto out;
>      }
>
> --
> 2.52.0
>

