Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNF1DP37iWluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:23:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92B111DB5
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225608.1532149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpT6X-0000OE-Iq; Mon, 09 Feb 2026 15:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225608.1532149; Mon, 09 Feb 2026 15:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpT6X-0000MW-FS; Mon, 09 Feb 2026 15:23:13 +0000
Received: by outflank-mailman (input) for mailman id 1225608;
 Mon, 09 Feb 2026 15:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/H=AN=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vpT6V-0000MN-Ou
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:23:11 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38b99d21-05cb-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 16:23:02 +0100 (CET)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7d18dd2adf7so2720554a34.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 07:23:02 -0800 (PST)
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
X-Inumbo-ID: 38b99d21-05cb-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770650581; cv=none;
        d=google.com; s=arc-20240605;
        b=UIFU+BB/fLBt6SqBeIDA5BtCfbI0rJ2wBG2k7P2uMldqPVxr+Qn0Tp+vAHsG3rz/iE
         WL6M+BaHb5LMjsnCOMiFuUx+l/SzRAeHqElhtx292SXFvxT3rJFDRlOUymZ1/Xu1ToLm
         8O4X6BfQj2g96UC9lU5LjnhMrnfeEhYzhDDiVObLeTXGIYa9I5LH5VvPnoqsu0k3kt9e
         0LNb67ECUQT+eglhNLoCgdRC7H6Csv3gwTVlJHS0v2kizjAkCxGnqoKKc77cT8PtjGNw
         DBZPqPZcA9KzLIdmAIM8vWh2sZnUGNzv5xqEfDsWDDwWJ/5l0AlGBkHfrgNjY8qXs+g4
         QRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mfdDFWL+0l2twDO+TgLnRaPXlODpXnZ3nrJFy445z+c=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=hVZcFItlIbZneOBgpVSFB+WR2/+bh1opGM05ni7+WKg+esVLE7QgDNssi3214emoi6
         et3CcALrVLABJVmqaEKqrpkd/Wgve/HbvYKXb+vTn/Li9EbCP8qyUa62l1+kbQ2UEMpQ
         BPkOMroQ6ymQSMBMUTvdjE6FV/NwDSNr/+nPCr4GSIcArHMwNASAt6jnxIGonXuWccao
         SbbF9jSuXd7iQYcCaEF6pnrQN6lWcsgqW76Ter7EuvcDrYTpebvzn70ppU1qhQJtviOS
         j2iuNHPNvG+hIp1WoR3Ygqvo3ycJQY5B1AQHHDYMhKTnrXCbvdSinETWUX12vmhHzcbc
         3jsQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770650581; x=1771255381; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfdDFWL+0l2twDO+TgLnRaPXlODpXnZ3nrJFy445z+c=;
        b=d9vj/iKUr3PwHwUB17EAZrgjCN4xtNs1vOAUddy+Ahy/VCQfI1u+jwWdPfSMwxGfwF
         YlxfqmU7/3Ct9POimQYMVgpz9Zx+66Zj4VxnN8xDuHT7dOC6rDmvXdrRHhis8ujPyCMA
         LyzVyflql9auWEM7jhfYel+E+6sBsIo1QQ4547GZEuHahBVnP5mhS9TugmtHd5WMrKCN
         wU0XEpS7ehaxj2M5t1ngeuFdNHKyesrE4gCC5Wd7wmraeyqxgAdvIuIV6EZwkTlVdU0C
         mOif4TLAV5SZkfrXgXCk3a4Nmv3qxh4YdjsMYYMegILX30Ok4CgOuhrqEJdstWMEaiM+
         ykHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650581; x=1771255381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfdDFWL+0l2twDO+TgLnRaPXlODpXnZ3nrJFy445z+c=;
        b=RfN+EBpP9M27luhNDf2NKetD5Pm1BpLYJpUdsQXgIJaOHbotjaA2Pr9bB/GHvG67Av
         X4HADYqZZa3kLkMTMQwkI9mmf8O24+CEevaVgZnMkFnUqQlW+tef9HDQ01K864esYgcm
         LYM7HDo1kvjWGxB7FOGoN5030/lf8hB/kNKUbcfKaMnEFEmSTHV3atAjAryOscrWSyND
         n+Qh1wMb+t9fgBEyWoVYMt7jVvBz8CGLUHp++mmX2a6W0qIyqhsmynE4AT09veTXubZ0
         FBblXJLRukrzOacg4fvBczaxH3uXEYeJY8JiBBoN3G8PerhJEvStPbXTkoB7fla5yxnE
         xcBA==
X-Gm-Message-State: AOJu0Yw3sQTgfllVh8HNJA86yDAh8qnQAGMUpkd15vAks3/lqSQGk7Px
	1yr5BHt8+n9LCmHLG3AbybDrVSD4DVZc6bWxXCn7Dqv6fDH8WmtUVSHW+4rWASb5MNzmMHtLkaw
	8xw342DK+6HPL82mZULimqv/Gg3mMUpjwQkDPXVcMjg==
X-Gm-Gg: AZuq6aIYerDhtpg6YN6aX+MqOSQ/Db3JVWkIu+2SFM4ukTIiM/A9C3Dpon6N32sRO0f
	oGVLsGKAkLk+nY0TtUl8CkvUdn3k7Vlwn4SoqrBDzNSYZSKHAwUtS+YWjDy21SyuWCPzR9Rw46b
	k7bXVl90tZxap5yxWvTVSo4J9XZhkLJcRHFkhs4uhuYc0oD+xZdMJGjT4CUIWDwh89F6lHOHzxt
	ILc+npvNKY3Jzq559UloA1Ki/GI2s8lvzXkztuA0imqHWe/j7n8KbvaJCMlLKxn2YI47fR2/jMt
	8mANnhl00aHx9hiVU2jSPZ92Qw==
X-Received: by 2002:a05:6820:80d:b0:668:d715:109c with SMTP id
 006d021491bc7-66d0c94e466mr5625709eaf.65.1770650580542; Mon, 09 Feb 2026
 07:23:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <97a064c81ee5ea26774c189538f9f1e37dd3eebc.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44Ey=Ph_m8r933K5enqPJgFuyVgY+2Qhtj3pi+V_Fw4=6A@mail.gmail.com>
 <19C7C710-4447-42AC-AFF3-F3122606BC0C@arm.com> <0680A28E-E2A6-4A75-9C82-1348ACD17E2F@arm.com>
In-Reply-To: <0680A28E-E2A6-4A75-9C82-1348ACD17E2F@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 9 Feb 2026 16:22:48 +0100
X-Gm-Features: AZwV_Qj6c6GxPDju0TvmjeWC8_BhN37-lHrOcYZ2w9bO9OIg8h6DUOPfBTHNqII
Message-ID: <CAHUa44H0Z9YWqKP_Dy8Va2L2GxhVJvOFrG+51+JhG+NukmV2yg@mail.gmail.com>
Subject: Re: [PATCH 03/12] xen/arm: ffa: Harden shm page parsing
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,mail.gmail.com:mid,linaro.org:email,linaro.org:dkim];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[arm.com:server fail,lists.xenproject.org:server fail,linaro.org:server fail];
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
X-Rspamd-Queue-Id: 6B92B111DB5
X-Rspamd-Action: no action

Hi Bertrand,

On Mon, Feb 9, 2026 at 4:11=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 9 Feb 2026, at 15:26, Bertrand Marquis <Bertrand.Marquis@arm.com> wr=
ote:
> >
> > Hi Jens,
> >
> >> On 9 Feb 2026, at 10:31, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >>
> >> Hi Bertrand,
> >>
> >> On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
> >> <bertrand.marquis@arm.com> wrote:
> >>>
> >>> get_shm_pages() uses unchecked address arithmetic and does not enforc=
e
> >>> alignment, so malformed descriptors can cause overflow or slip throug=
h
> >>> validation. The reclaim path also repeats handle-to-shm-mem conversio=
n
> >>> in multiple places, duplicating error handling.
> >>>
> >>> Harden page parsing and reclaim handling:
> >>> - add ffa_safe_addr_add() and use it to detect address overflows
> >>> - enforce alignment checks in get_shm_pages() and return FF-A errors
> >>> - introduce ffa_secure_reclaim() and use it for MEM_RECLAIM and teard=
own
> >>> - simplify ffa_mem_share() argument handling and allow max page count
> >>>
> >>> Functional impact: invalid or misaligned memory ranges now fail earli=
er
> >>> with proper error codes; behavior for valid descriptors is unchanged.
> >>>
> >>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>> ---
> >>> xen/arch/arm/tee/ffa_private.h | 11 +++++++
> >>> xen/arch/arm/tee/ffa_shm.c     | 57 +++++++++++++++++----------------=
-
> >>> 2 files changed, 40 insertions(+), 28 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pr=
ivate.h
> >>> index b625f1c72914..58562d8e733c 100644
> >>> --- a/xen/arch/arm/tee/ffa_private.h
> >>> +++ b/xen/arch/arm/tee/ffa_private.h
> >>> @@ -632,4 +632,15 @@ static inline void ffa_uuid_set(struct ffa_uuid =
*id, uint32_t val0,
> >>>    id->val[1] =3D ((uint64_t)val3 << 32U) | val2;
> >>> }
> >>>
> >>> +/*
> >>> + * Common overflow-safe helper to verify that adding a number of pag=
es to an
> >>> + * address will not wrap around.
> >>> + */
> >>> +static inline bool ffa_safe_addr_add(uint64_t addr, uint64_t pages)
> >>> +{
> >>> +    uint64_t off =3D pages * FFA_PAGE_SIZE;
> >>> +
> >>> +    return (off / FFA_PAGE_SIZE) =3D=3D pages && addr <=3D UINT64_MA=
X - off;
> >>> +}
> >>> +
> >>> #endif /*__FFA_PRIVATE_H__*/
> >>> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> >>> index 90800e44a86a..4c0b45cde6ee 100644
> >>> --- a/xen/arch/arm/tee/ffa_shm.c
> >>> +++ b/xen/arch/arm/tee/ffa_shm.c
> >>> @@ -96,16 +96,14 @@ struct ffa_shm_mem {
> >>>    struct page_info *pages[];
> >>> };
> >>>
> >>> -static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> >>> -                             register_t addr, uint32_t pg_count,
> >>> -                             uint64_t *handle)
> >>> +static int32_t ffa_mem_share(uint32_t tot_len, uint64_t *handle)
> >>> {
> >>>    struct arm_smccc_1_2_regs arg =3D {
> >>>        .a0 =3D FFA_MEM_SHARE_64,
> >>>        .a1 =3D tot_len,
> >>> -        .a2 =3D frag_len,
> >>> -        .a3 =3D addr,
> >>> -        .a4 =3D pg_count,
> >>> +        .a2 =3D tot_len,
> >>> +        .a3 =3D 0,
> >>> +        .a4 =3D 0,
> >>>    };
> >>>    struct arm_smccc_1_2_regs resp;
> >>>
> >>> @@ -131,12 +129,16 @@ static int32_t ffa_mem_share(uint32_t tot_len, =
uint32_t frag_len,
> >>>    }
> >>> }
> >>>
> >>> -static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_h=
i,
> >>> -                               uint32_t flags)
> >>> +static int32_t ffa_secure_reclaim(struct ffa_shm_mem *shm, uint32_t =
flags)
> >>
> >> I agree with moving the uint64_to_regpair() call into this function,
> >> but I'm puzzled by the new name. What's secure?
> >
> > This is to distinguish with reclaim for VM to VM sharing in the future =
as here
> > reclaim is asked to the secure world.
> >
> > But in fact to be coherent I should also have renamed ffa_mem_share to =
ffa_secure_share.
> >
> > Would you be ok with that ?
>
> Looking at this a bit more, we are usually using spmc and not secure.
>
> Would you be ok if I rename both those to:
> ffa_spmc_share
> ffa_spmc_reclaim

Yes, that sounds good.

Cheers,
Jens

