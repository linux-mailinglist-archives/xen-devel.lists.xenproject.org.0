Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDT7DgOGjGmfqAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:37:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E051124D29
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227653.1534080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAOm-0001af-94; Wed, 11 Feb 2026 13:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227653.1534080; Wed, 11 Feb 2026 13:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAOm-0001Yj-6I; Wed, 11 Feb 2026 13:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1227653;
 Wed, 11 Feb 2026 13:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgMA=AP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vqAOk-0001Yd-Qn
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 13:36:54 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9a59951-074e-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 14:36:53 +0100 (CET)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-45f053b7b90so1221067b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 05:36:53 -0800 (PST)
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
X-Inumbo-ID: b9a59951-074e-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770817012; cv=none;
        d=google.com; s=arc-20240605;
        b=LULxaERMAmUdM5Ppw621PJuE+DuIfAXonx3OppHFidrvMVcsNhXO/A/T2W1stkRbQB
         Vls8C3SMlAyF9/gNSY6JMUcn81xSiBnfQr0ZtjVTeorD0FCyMaI9WmiGBA2/CN5WC5wM
         H//rEApvWveLtN/Q2q38hrtwcvabM6cXkyES4lXg2e6MXIimARw4jtfrkXGh73OIbAWp
         Ymar8BP1+mfCKlH8Ks8gm1fqS/HaN/e/Vdu+iaj3SZNiBb4c6Vep40/PvrqiDusiOZWJ
         3XF3QJ1avsfsnsygzljF+9pFlO0L3AX5AjW4Hw8AsBos0eJL/WANZeV35F44bypB2Y4p
         EvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bG9WsPv8wYxty0mQK/aZ5QkAuSixG25/fMBeMnhcRH8=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=Id+oxA3yGQ+8kllKZC5i76DWrnXvWM/MnN8SYADvaDxYHAL2y6J365ydoyZ1/9hKeZ
         uXTYDKrIw77yPV/GICVBSiYpNJiuyRYlWAoi1k70St2XGTrHX4Tf8fA6e5I0DIBonE6a
         HEtynqERF8Hs4id8I77bXTuFrucvWB6WC4xnLevrd48dfc1TiYS9SfTaXACbNp1WwYy4
         VDBw0XJdXQN5ziHSTTO0ERwYgdiFGEc+ha12rTdiwIXPtKYn5Fgxg+gWgBCaiy86iNyD
         au45TSJLs28yRKco+y093gCJFpmKmAOPYFwtin4CHNl3iS7O43s0cMtNoQpvPjefcMvb
         jJTw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770817012; x=1771421812; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bG9WsPv8wYxty0mQK/aZ5QkAuSixG25/fMBeMnhcRH8=;
        b=JgzgeUeOH/3HEXqPvuhkwsABFN7trajSq3wx6GBlRJ22xrNSfmZFCZpo/z1uhnYUn5
         Q+TKObzgGN32t7k5/eKTEVyfO/Fp3NbG6hr6MbfVaq57lM3zuO1Jyb0oELGYT3+0VMRC
         vfZhHmnba/XrkHQCfkjUTR8Pp+CvS5yAQ5m/J1nFN5WUpY1JQvLmiqU/cACMQnumHj8/
         QKN0SRMaEPzeK/gVrvsHbCze5BQBrpreCnx7muSJdxM0SNaJdZB4flkTs/DOeLwhPf8L
         Cq/p7S3ClibUk8Vn1YaUyz5qdL1RDcI30dtuG69PVSWRto59xg0Ju7L96vO9XRYyoaHV
         /2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770817012; x=1771421812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bG9WsPv8wYxty0mQK/aZ5QkAuSixG25/fMBeMnhcRH8=;
        b=eUAiCh2l3x2B1OOzVnL9BKHIqIwX7fivVM7qlwJlIprk2V1Fxr8HdxrM9ikaHiuzPx
         ZZ1ENfevt02oN781DcUj6OX29zXBYAzAPvgXmPAEkoJqc9bau9GBl4flGNzVVB19cAhe
         jlidp75YOrFcsbqgCOWlM9aPdKO8Rvwq+wEdnCzQ1R9Qv6HWkcXtkNtYW6ecFyuD8+MP
         fxaqnzH9EjLNUH56dg0CMAnAEmxw+KQbwElyl/uYW6N9NNCqXiB+hYN7BE5DICOVKqvJ
         a9Y2vCYnxGr8Gl9gCFblY+gnsSV+E0q2OG1ceODZX0N7UeqrQUzVKFvtqR857OTb8tzy
         tAQw==
X-Gm-Message-State: AOJu0Yw2sMY+OSqHr8zs/yO4UKSl95AaKJv88X78ktmBSrCHemWigQ3B
	ZnSjXGyf7zCXnj8oYKDzCTMaUeXc6hJOAU8T39XESjkvrNbBef17c55LeqN0wEeFJ5O33sTEvWT
	amXECHyeEVpFi62W9TRbdCaaQsx6HakDKZ2TAJ09p8w==
X-Gm-Gg: AZuq6aK6hmDwompYMJjjFnUB/quIlCJ1DYJEdbRSf2e2Iiyt3FzWLQRm1MFi3SjUpSr
	L5HXnfx23mLt1S+tYkjU78iF8K7KPjQvuG4rG20kHQZ9xrssGTyJuqc3QYuUJnBH7087a2OlGy7
	NbzABgR0QozazEM6aBYNoZoH/0WYza9jF7w3BNDq7uZVzD9KwcllhsS1z7Cy8KOyjvjikh4Bl82
	MKS27j5L5gIdkOjR6v7Z4cw3VRgfIOmyMzuDBA37vEbEJVnTeCZSeJotgp8Bwls77xgHpHqt/P5
	850FCH45AU+uArJDqnVmuRVTyOoKOkAscGUtDA==
X-Received: by 2002:a05:6808:c2ac:b0:459:b48b:d51e with SMTP id
 5614622812f47-462fcb63e03mr10677212b6e.24.1770817012145; Wed, 11 Feb 2026
 05:36:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <209e5474e236737dd13e0f7ff8120b05cdb7eabe.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44Ebe03R2nTzUW9tDx5hPC6trZCWOdr94ApawFs20chdWw@mail.gmail.com> <7B367F9A-37E3-4157-A7B2-3EA21EE9FE52@arm.com>
In-Reply-To: <7B367F9A-37E3-4157-A7B2-3EA21EE9FE52@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Feb 2026 14:36:40 +0100
X-Gm-Features: AZwV_Qi1rarmLvovzI2gLCqmihj3DmnYP9NcRgKmqame8ZhWjjrETnPKLOweg5M
Message-ID: <CAHUa44HAtC=vwepiYg=gSvdr_xkwjSaBzS8FL_hnF_dF9RHi0w@mail.gmail.com>
Subject: Re: [PATCH 12/12] xen/arm: ffa: Add message parameter diagnostics
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
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
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,linaro.org:dkim,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E051124D29
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 11, 2026 at 12:48=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 11 Feb 2026, at 11:16, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> MSG_SEND2 and direct request validation failures are silent, making it
> >> hard to diagnose invalid IDs, oversized messages, or unsupported
> >> destination types.
> >>
> >> Add debug logs for parameter validation failures:
> >> - invalid endpoint IDs
> >> - oversized messages
> >> - unsupported destination types
> >> - invalid sender/receiver combinations
> >> - ratelimit MSG_SEND2 busy failures to avoid log flooding
> >>
> >> No functional changes.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> xen/arch/arm/tee/ffa_msg.c | 45 ++++++++++++++++++++++++++++++++++++++
> >> 1 file changed, 45 insertions(+)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> >> index 928f269f6c3a..cc273c9a8e80 100644
> >> --- a/xen/arch/arm/tee/ffa_msg.c
> >> +++ b/xen/arch/arm/tee/ffa_msg.c
> >> @@ -4,6 +4,7 @@
> >>  */
> >>
> >> #include <xen/const.h>
> >> +#include <xen/lib.h>
> >> #include <xen/sizes.h>
> >> #include <xen/types.h>
> >>
> >> @@ -100,6 +101,7 @@ void ffa_handle_msg_send_direct_req(struct cpu_use=
r_regs *regs, uint32_t fid)
> >>     if ( !ffa_fw_supports_fid(fid) )
> >>     {
> >>         ret =3D FFA_RET_NOT_SUPPORTED;
> >> +        gdprintk(XENLOG_DEBUG, "ffa: direct req fid %#x not supported=
\n", fid);
> >>         goto out;
> >>     }
> >>
> >> @@ -108,6 +110,9 @@ void ffa_handle_msg_send_direct_req(struct cpu_use=
r_regs *regs, uint32_t fid)
> >>          (src_dst & GENMASK(15,0)) =3D=3D ffa_get_vm_id(d) )
> >>     {
> >>         ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        gdprintk(XENLOG_DEBUG,
> >> +                 "ffa: direct req invalid src/dst %#x\n",
> >> +                 (uint32_t)src_dst);
> >>         goto out;
> >>     }
> >>
> >> @@ -115,6 +120,9 @@ void ffa_handle_msg_send_direct_req(struct cpu_use=
r_regs *regs, uint32_t fid)
> >>     if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
> >>     {
> >>         ret =3D FFA_RET_NOT_SUPPORTED;
> >> +        gdprintk(XENLOG_DEBUG,
> >> +                 "ffa: direct req to non-secure dst %#x\n",
> >> +                 (uint32_t)(src_dst & GENMASK(15, 0)));
> >>         goto out;
> >>     }
> >>
> >> @@ -166,7 +174,12 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, =
const void *src_buf,
> >>     /* This is also checking that dest is not src */
> >>     ret =3D ffa_endpoint_domain_lookup(dst_id, &dst_d, &dst_ctx);
> >>     if ( ret )
> >> +    {
> >> +        gdprintk(XENLOG_DEBUG,
> >> +                 "ffa: msg_send2 lookup failed: dst %#x ret %d\n",
> >> +                 dst_id, ret);
> >>         return ret;
> >> +    }
> >>
> >>     /* This also checks that destination has set a Rx buffer */
> >>     ret =3D ffa_rx_acquire(dst_ctx , &rx_buf, &rx_size);
> >> @@ -199,6 +212,12 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, =
const void *src_buf,
> >>     /* receiver rx buffer will be released by the receiver*/
> >>
> >> out_unlock:
> >> +    if ( ret )
> >> +    {
> >> +        if ( ret !=3D FFA_RET_BUSY || printk_ratelimit() )
> >
> > Shouldn't this be && ?
>
> The intent here is to log all non BUSY errors but only log BUSY when rate=
limit allows
> to reduce the amount of logs in case of someone polling when the receiver=
 RX buffer
> is busy.
>
> Maybe I should add a comment to make that clearer ?

Yes, please.

Cheers,
Jens

>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >> +            gdprintk(XENLOG_DEBUG, "ffa: msg_send2 to %#x failed: %d\=
n",
> >> +                     dst_id, ret);
> >> +    }
> >>     rcu_unlock_domain(dst_d);
> >>     if ( !ret )
> >>         ffa_raise_rx_buffer_full(dst_d);
> >> @@ -226,7 +245,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs=
 *regs)
> >>
> >>     ret =3D ffa_tx_acquire(src_ctx, &tx_buf, &tx_size);
> >>     if ( ret !=3D FFA_RET_OK )
> >> +    {
> >> +        gdprintk(XENLOG_DEBUG,
> >> +                 "ffa: msg_send2 TX acquire failed: %d\n", ret);
> >>         return ret;
> >> +    }
> >>
> >>     /* create a copy of the message header */
> >>     memcpy(&src_msg, tx_buf, sizeof(src_msg));
> >> @@ -238,6 +261,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs =
*regs)
> >>          dst_id =3D=3D ffa_get_vm_id(src_d) )
> >>     {
> >>         ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        gdprintk(XENLOG_DEBUG,
> >> +                 "ffa: msg_send2 invalid src/dst src %#x dst %#x\n",
> >> +                 src_id, dst_id);
> >>         goto out;
> >>     }
> >>
> >> @@ -246,6 +272,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs =
*regs)
> >>         if (src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_1))
> >>         {
> >>             ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +            gdprintk(XENLOG_DEBUG,
> >> +                     "ffa: msg_send2 invalid msg_offset %u (v1.1)\n",
> >> +                     src_msg.msg_offset);
> >>             goto out;
> >>         }
> >>         /* Set uuid to Nil UUID for v1.1 guests */
> >> @@ -255,6 +284,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs =
*regs)
> >>     else if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_2=
) )
> >>     {
> >>         ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        gdprintk(XENLOG_DEBUG,
> >> +                 "ffa: msg_send2 invalid msg_offset %u (v1.2)\n",
> >> +                 src_msg.msg_offset);
> >>         goto out;
> >>     }
> >>
> >> @@ -263,6 +295,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs =
*regs)
> >>             src_msg.msg_size > (tx_size - src_msg.msg_offset) )
> >>     {
> >>         ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        gdprintk(XENLOG_DEBUG,
> >> +                 "ffa: msg_send2 invalid msg_size %u offset %u tx %zu=
\n",
> >> +                 src_msg.msg_size, src_msg.msg_offset, tx_size);
> >>         goto out;
> >>     }
> >>
> >> @@ -272,6 +307,8 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs =
*regs)
> >>         if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
> >>         {
> >>             ret =3D FFA_RET_NOT_SUPPORTED;
> >> +            gdprintk(XENLOG_DEBUG,
> >> +                     "ffa: msg_send2 to SP not supported\n");
> >>             goto out;
> >>         }
> >>         /*
> >> @@ -288,6 +325,8 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs =
*regs)
> >>
> >>         ret =3D ffa_simple_call(FFA_MSG_SEND2,
> >>                               ((uint32_t)ffa_get_vm_id(src_d)) << 16, =
0, 0, 0);
> >> +        if ( ret )
> >> +            gdprintk(XENLOG_DEBUG, "ffa: msg_send2 to SP failed: %d\n=
", ret);
> >>     }
> >>     else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >>     {
> >> @@ -295,7 +334,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs=
 *regs)
> >>         ret =3D ffa_msg_send2_vm(dst_id, tx_buf, &src_msg);
> >>     }
> >>     else
> >> +    {
> >>         ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        gdprintk(XENLOG_DEBUG,
> >> +                 "ffa: msg_send2 to VM disabled (dst %#x)\n", dst_id)=
;
> >> +    }
> >>
> >> out:
> >>     ffa_tx_release(src_ctx);
> >> @@ -311,6 +354,7 @@ void ffa_handle_run(struct cpu_user_regs *regs, ui=
nt32_t fid)
> >>     if ( !ffa_fw_supports_fid(fid) )
> >>     {
> >>         ret =3D FFA_RET_NOT_SUPPORTED;
> >> +        gdprintk(XENLOG_DEBUG, "ffa: run fid %#x not supported\n", fi=
d);
> >>         goto out;
> >>     }
> >>
> >> @@ -322,6 +366,7 @@ void ffa_handle_run(struct cpu_user_regs *regs, ui=
nt32_t fid)
> >>     if ( !FFA_ID_IS_SECURE(dst >> 16) )
> >>     {
> >>         ret =3D FFA_RET_NOT_SUPPORTED;
> >> +        gdprintk(XENLOG_DEBUG, "ffa: run to non-secure dst %#x\n", ds=
t);
> >>         goto out;
> >>     }
> >>
> >> --
> >> 2.50.1 (Apple Git-155)
> >>
>

