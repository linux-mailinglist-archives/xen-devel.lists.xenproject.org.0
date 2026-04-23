Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNDCGmHr6Wm2nAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 11:50:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC46C44FFDF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 11:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291844.1570629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFqgb-0005be-88; Thu, 23 Apr 2026 09:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291844.1570629; Thu, 23 Apr 2026 09:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFqgb-0005ZS-4x; Thu, 23 Apr 2026 09:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1291844;
 Thu, 23 Apr 2026 09:49:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wFqgZ-0005ZM-IT
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 09:49:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFqgY-00Agg1-Hf
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 11:49:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e9eb1f-2eae-0a2a0a5409dd-0a2a4503cf0a-10
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 11:49:26 +0200
Received: from [209.85.167.171] (helo=mail-oi1-f171.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e9eb25-672d-0a2a45030019-d155a7abedd4-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 11:49:26 +0200
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-479eb8bcacbso1890027b6e.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 02:49:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1776937764; cv=none;
        d=google.com; s=arc-20240605;
        b=cGSjVgrSBPHy9Hvw2GGSQhAcraIossj786ic1LVvuSquNOPW8AtrRpa2Z4W7/WCYJQ
         5ZqhfaSCroqvlvp7SSSH7W/efEVDn2ietP9oPQsKNQq4CygA4fsCwcbhcq5uGupGeXuK
         4/vpoKtujQkATg+IZrtDe4g3AjAo347sIM7qoKRfDUqiUBYNObCGTQDkVTooED+pJZJ3
         +6G7Wo9udHV8BqLGqDccSJMAA0BmmmbOn33y9et6s8BXN3etMOQBlRdrn1HmukrY1qfC
         2+J+m3fPSqthmbHhn7vF1vTP5qa1JScZjbxUpLndyR1dTHv7oFJO95bctnb722TY+Rr5
         wWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/fZNqAVn4bagQP5iTaHu/LfssAnCl/Ko4AXImy8Rc6I=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=IssusD9Yc0GRoGl7x3oIGrXC012SVqrYaEObL1yWDfZiWWcj5E8fMuvm9FYq8RRtpg
         2cCnjD4T9eJlaNF4k7z0Ou/DRH6w6R4wcvX2qUdB295cthWFT3/ArrowuLC8hUY0F6Q2
         f2a+guyVNcLWwSMM7yxpSC1lWT6jUgmXukbHfKt7Mnig2uD2kOQqRsqNZJ/5qaTYNZ9r
         ezLnh1+hoZ7l93Rzd17nXSaCKhZbeXPeQKvNdyC0L1Cteu669pZvZ/C1af34Ew7ycnE3
         mBrd4/tD3dbmG4bKt4M3hF39H0btbnO3LnOSCTQAjYG48paKy2Oa3AO2weEJWVxmmWS8
         q2ZA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776937764; x=1777542564; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fZNqAVn4bagQP5iTaHu/LfssAnCl/Ko4AXImy8Rc6I=;
        b=GnevYgRytvN8T9GE1TFHWFgIfK6RAAxnDZZrhCoyPZ7NNYzU9FkoRlh7+szhKk2wQM
         Rkc/2ihJbI8wU+DEE+00EkSNfl3nWvC+FTx8bYk3HHRhN24RdpBKk9j5Sq13oUWPdwKk
         JA2loUBfYlq9fAZ2vgmToRKsJLV9JJd6AWMml4EDHwCU7Imkb/KR74vEsA1hEcP+NDqT
         zo4HHcXsefwJ3N1HGGTZqb3TPlJP0spyj7DJkru3vqC8mRQnKtlbcxdSRqITEhfU8Zm/
         8f+NTv1QrVYL1j2178oSyoscDrhDV4MGr4Ni9ybQQFui5KA+CSR9Pmkt8Cnlv7J/t2Uq
         UOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937764; x=1777542564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fZNqAVn4bagQP5iTaHu/LfssAnCl/Ko4AXImy8Rc6I=;
        b=aDKWGhOnOhUdfxhEbfNsI8mHsHJ3GzuXIPhba2gOMgWjSdNpK3FfyHNaYtxjIKPX40
         gtpabUsfVWnUJa/XOXg8F+CbeyiCBGf6mhK3WYHb+Q6+Ln1tv1aErGavb952z9n5KzXU
         sg5SrhhUPFbPoIq2OxckiYgBOQ1zbWZo/U5drEQaPtpA4pra4z9ijn+A9UHWXNy/tkk2
         w7W/ewwgWijVhxGQL4TJn2e6A277nTe478bdqo/cmAZfHZTsm2800P8iqToeOWGLpDLf
         GXk9nYXaBkUVKIO3D8I3AHeXqbYsgsmIfH7G86h3pXRno9JVtS/gDpfkjUrn094qwV8A
         W2/A==
X-Gm-Message-State: AOJu0YxIBpO6mRrMJVJTPwIexYcBfKdHnPGPuE+kdn1MPtq12reJsy2x
	57mS6MLY6P32TzWsWKmnfndGZicV6y0lMTII99yovioRQhVQ0CQh2onOi2QpsOlxJjcaveMmB2G
	jerVw5mE64U1fv0NtJseRt2oaRCuylc7SKk/ZoCfDOQ==
X-Gm-Gg: AeBDievobt1JwCCvP/6S9h6m/Paj0NB/5FIkP/Kh3A/ki4tj9JBgW8FXDf64PgofL2p
	tww9tUqU85q0T7AwcBNn8LgmL8DA3WgYYIMQ1BHz3WN8gsxh6jr3RdLO7xxLKrOMYbl2SgLILtD
	J/CY7ubBSK4J37gymFb7O9XcShLY469w/kqkMAdn7T4az8kdmLsM++rinzdBNhY9lhch2m+k5f9
	i4ZBUH65d0cQKiiTkyajycrHt9R8LUt5e32vFG/Pnhkl1+86R+jtBjVwSCQQc/ArMEei5b6yWUb
	P1H290QZfBFKqgPyCo/gKqPgK8SVXLgK28p/6Jcumirppn9m
X-Received: by 2002:a05:6820:6ae3:b0:694:a362:4b8f with SMTP id
 006d021491bc7-694a3624d01mr4031224eaf.6.1776937764518; Thu, 23 Apr 2026
 02:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776266307.git.bertrand.marquis@arm.com>
 <7053b8c14bbe50cc855dad0a82cde2bb10153d2b.1776266307.git.bertrand.marquis@arm.com>
 <CAHUa44HaFjLf9CcSJMDD5O-R24_Kq_7zabw2Op2X=P1gj+85Sw@mail.gmail.com> <6D745E55-2BBB-49CC-AE8D-D75E9704ED8D@arm.com>
In-Reply-To: <6D745E55-2BBB-49CC-AE8D-D75E9704ED8D@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 23 Apr 2026 11:49:11 +0200
X-Gm-Features: AQROBzDm2dIYwSRJuUDGevnOpJbu4Yy5WlH3ly2sG0PK-aUkmJjRxt1ggz8smZI
Message-ID: <CAHUa44HGhtnekDiC0GOb0+=gHkCOBwfBJWfwmBxF62ukWr8HDw@mail.gmail.com>
Subject: Re: [PATCH 2/6] xen/arm: ffa: Track hypervisor notifications in a bitmap
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1776937766-A3D6B938-3F5D9061/0/0
X-purgate-type: clean
X-purgate-size: 5467
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,linaro.org:email,arm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BC46C44FFDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Thu, Apr 23, 2026 at 9:30=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> Thanks a lot for the review.
>
> > On 22 Apr 2026, at 11:34, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> Hypervisor notifications are currently tracked with a dedicated
> >> buff_full_pending boolean. That state only represents a single HYP
> >> notification bit and keeps HYP bitmap handling tied to single-purpose
> >> bookkeeping.
> >>
> >> Replace the boolean with a hypervisor notification bitmap protected by
> >> notif_lock. INFO_GET reports pending when the bitmap is non-zero, GET
> >> returns and clears the HYP bitmap under the lock, and RX-buffer-full
> >> sets FFA_NOTIF_RX_BUFFER_FULL in the bitmap instead of updating
> >> separate state.
> >>
> >> Initialize and clear the bitmap during domain lifecycle handling, and
> >> use ctx->ffa_id for bitmap create and destroy so the notification stat=
e
> >> stays tied to the cached FF-A endpoint ID.
> >>
> >> No functional changes.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> xen/arch/arm/tee/ffa_notif.c   | 46 ++++++++++++++++++++++++++--------
> >> xen/arch/arm/tee/ffa_private.h |  9 +++++--
> >> 2 files changed, 43 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif=
.c
> >> index 07bc5cb3a430..d15119409a25 100644
> >> --- a/xen/arch/arm/tee/ffa_notif.c
> >> +++ b/xen/arch/arm/tee/ffa_notif.c
> >> @@ -94,8 +94,15 @@ void ffa_handle_notification_info_get(struct cpu_us=
er_regs *regs)
> >>
> >>     notif_pending =3D test_and_clear_bool(ctx->notif.secure_pending);
> >>     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >> +    {
> >>         notif_pending |=3D test_and_clear_bool(ctx->notif.vm_pending);
> >>
> >> +        spin_lock(&ctx->notif.notif_lock);
> >> +        if ( ctx->notif.hyp_pending )
> >> +            notif_pending =3D true;
> >> +        spin_unlock(&ctx->notif.notif_lock);
> >
> > Isn't this a functional change? Before this patch, we didn't consider
> > ctx->notif.buff_full_pending here. Am I missing something?
>
> We did consider it implicitly through vm_pending.
>
> This patch makes that cleaner by using hyp_pending for the Hypervisor
> framework notification itself. Previously, RX-buffer-full was made visibl=
e
> indirectly via vm_pending, and FFA_NOTIFICATION_INFO_GET
> cleared that summary state.
>
> As a result, the guest-visible pending indication could be lost before
> the Hypervisor notification was actually retrieved with
> FFA_NOTIFICATION_GET.
>
> With this change, the pending state is tracked in hyp_pending and is only
> cleared when the Hypervisor notifications are retrieved through
> FFA_NOTIFICATION_GET.
>
> I will reword the commit message to make that clearer.

Thanks

>
> >
> >> +    }
> >> +
> >>     if ( notif_pending )
> >>     {
> >>         /* A pending global notification for the guest */
> >> @@ -174,12 +181,17 @@ void ffa_handle_notification_get(struct cpu_user=
_regs *regs)
> >>             w6 =3D resp.a6;
> >>     }
> >>
> >> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&
> >> -          flags & FFA_NOTIF_FLAG_BITMAP_HYP &&
> >> -          test_and_clear_bool(ctx->notif.buff_full_pending) )
> >> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >>     {
> >> -        ACCESS_ONCE(ctx->notif.vm_pending) =3D false;
> >> -        w7 =3D FFA_NOTIF_RX_BUFFER_FULL;
> >> +        spin_lock(&ctx->notif.notif_lock);
> >> +
> >> +        if ( (flags & FFA_NOTIF_FLAG_BITMAP_HYP) && ctx->notif.hyp_pe=
nding )
> >> +        {
> >> +            w7 =3D ctx->notif.hyp_pending;
> >> +            ctx->notif.hyp_pending =3D 0;
> >> +        }
> >> +
> >> +        spin_unlock(&ctx->notif.notif_lock);
> >>     }
> >>
> >>     ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
> >> @@ -207,12 +219,17 @@ int32_t ffa_handle_notification_set(struct cpu_u=
ser_regs *regs)
> >> void ffa_raise_rx_buffer_full(struct domain *d)
> >> {
> >>     struct ffa_ctx *ctx =3D d->arch.tee;
> >> +    uint32_t prev_bitmap;
> >>
> >>     if ( !ctx )
> >>         return;
> >>
> >> -    ACCESS_ONCE(ctx->notif.buff_full_pending) =3D true;
> >> -    if ( !test_and_set_bool(ctx->notif.vm_pending) )
> >> +    spin_lock(&ctx->notif.notif_lock);
> >> +    prev_bitmap =3D ctx->notif.hyp_pending;
> >> +    ctx->notif.hyp_pending |=3D FFA_NOTIF_RX_BUFFER_FULL;
> >> +    spin_unlock(&ctx->notif.notif_lock);
> >> +
> >> +    if ( !(prev_bitmap & FFA_NOTIF_RX_BUFFER_FULL) )
> >
> > Do we need to check for FFA_NOTIF_RX_BUFFER_FULL? Isn't !prev_bitmap
> > more accurate, if any other bit would ever be used in the bitmap?
>
>   I would keep the bit-specific check here, if that is OK with you.
>
>  This function is about raising the RX buffer full notification,
>  so I think it is clearer to check whether that bit was newly
>  pended rather than whether the whole Hypervisor bitmap
>  was previously empty.
>
> Using !prev_bitmap would also make the condition depend on
> unrelated Hypervisor notifications being pending.
>
> Tell me if you are ok with that.

I see your point, it's fine.

Cheers,
Jens

>
> Cheers
> Bertrand
>

