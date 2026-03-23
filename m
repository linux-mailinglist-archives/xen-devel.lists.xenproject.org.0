Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJaPLjYOwWngQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 10:56:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292482EF768
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 10:56:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259141.1552456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4c0r-0006yX-6A; Mon, 23 Mar 2026 09:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259141.1552456; Mon, 23 Mar 2026 09:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4c0r-0006vv-2Y; Mon, 23 Mar 2026 09:55:57 +0000
Received: by outflank-mailman (input) for mailman id 1259141;
 Mon, 23 Mar 2026 09:55:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w4c0p-0006vp-HP
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 09:55:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4c0o-002amn-T7
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 10:55:54 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c10e2a-e002-0a2a0a5209dd-0a2a4505ec7c-2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 10:55:54 +0100
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c10e2a-5aeb-0a2a45050019-d155d0b2c006-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 10:55:54 +0100
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-38bf1561215so24519111fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 02:55:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20230601 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1774259753; cv=none;
        d=google.com; s=arc-20240605;
        b=cqc5bk2z6VcxD39dFXxTcvjbZETMCLpjKIe3xDkN0IYUNwv6RHgus28/urHQ7PbqO0
         tLyP3rCRxCZrYIDQHtZtDa8Gu9eo3Fj/u6l0w6mISuZb4LAhBx/rX20MKjL26d+vXJy0
         eSy5JcKVvNzCIIhOX6SxECsEX+MS0NN/VW9I7iKRpKzuPUO/1GEFsX73BjVHske4Klg+
         Zrxs8xor/ktEPwj7mffq4vpx9IevuqNz3OCXiVbsiqFxglm0kjk9y+ZEKsNaWC1HqBZm
         pFX/KYPPgiCrK9qJwYdNt5uCCXbaNLYOGkm2dQUGSYbVKVUyvCjc/pRFGGSPT9LX1KUs
         sofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLPbw2onjWVOMkZBCIWl6LuaShLC3/07QG9/c79LxmI=;
        fh=GBN05qcnqlbl8HfkjIbFkcC3qDDmUXvMhNLct7r+iS0=;
        b=HmdG9cQVtKtsQNtQJFGQ57yCrzi0SJC8C+vXoAqkrIuRxvrGXQCn2JzuJOdQmpT8Pn
         ed0ecHNuOrNV0aQDnPhb6WJ7qxW9HRy1upyc3Lgvuegt1rVH981oStbXjYyz3fe1LgSo
         yydz5dyBOkoL1DP+RuUC1BvhOYjBzRApWDEDHZeKMTyxx2OpNcb7eBTP25b1isyKd1oW
         zRNi9RpXup7kOB0lDW8zES3qqY30P0/OlGBkZuZ7TXz3fNWztgU9t+aLGUKr/+WRqudw
         rbxp8pyd33dtlY1kkprSg0ZHc9+X5HcpiG0d0RENnllSdpOoNEFNJKS2OScezwQX1thX
         Q+HA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774259753; x=1774864553; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLPbw2onjWVOMkZBCIWl6LuaShLC3/07QG9/c79LxmI=;
        b=TctnqCBoQvlxXSdntUGtQAoOKtX1wMpg/hmO9Pghx6VrBUtunYQXwSHtZHj/scyEc4
         zu77ZFiQQZUGCnNCghxqiVXxRiFcXgDHHfSxVgPiDmoj7efmqu/O5MttrQCGOh4x/Nwb
         bwAwqKSK/4288Qk927tbSF547XJqvJMFiioMp08hho6kP/UNXVkuC/8eARlW7Qlxxi+p
         bTACt8lvSIK48ersqbb2A1EBZ8THBLXqdavKSCMBuCwdjr8LmVoNFtwkQxvYaGl+53C8
         adhphmRRGgdGDlnEPN5HpaE0SZpt/gMZ7maErHPJaXYs7ZZUvIct152PQYYytJ3b8rrk
         Rq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259753; x=1774864553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vLPbw2onjWVOMkZBCIWl6LuaShLC3/07QG9/c79LxmI=;
        b=Y11O4fDHSr7ao6axqhtXbk+LsEHMJnN9E+V43rRJfRTBpcZU09/sjAeQpKv5qga7n6
         728X9Yyl3p+6NDt1GICE5U666qww7NmXROf2Uve8J/FtuzGefmuh+0xAmuZA6yAHEJ1p
         ISuBQk03n57S9e+6JmcADn9EYkcvHmR8LGVUWCo9XjHt8yRXMPNaeJsLIJHJcclkh5x9
         wFbFF4YTH8sd+dlaXIcL6PVGectAfydSlKWxu8TW5rNRCGVJuVuV3xwt4F51P+noO4y8
         jKiy+Yad2/M43IQ//QlmC4Z1m4lA41IeSbhbxt/VRgL8clVa5A8GtPAXNWp7DOItxFkC
         ClTw==
X-Forwarded-Encrypted: i=1; AJvYcCXdigTr6HXXeQgPUaic4G6THJ31f1iKtoOdk0xVRtjQGR18gQtqVcS5OdoGlyU+sEvTXcCfG4O+Urk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEbaoTKXEr4btOoJlt2nI5vbHOICrMRtL4J4AHtCj5kx3wo+wg
	Jw6shlgVhnTFINQJk1aaOFx8YOQBfrGhp0AzOoIsDTNdlVtuP0r8UMKodsspyM5HOzS+IxD1pXN
	hrqnbZlyiWmBP6RZu8U73LZ83yilhtCo=
X-Gm-Gg: ATEYQzzbrlEANTx+MVFUEdtJWLnoOhX6zLWJ255DUaHD1jVUSHG5xkJpRQNPOVhpVNJ
	hRpDG4mSIdENCxc5hbT8xR+JI8fRHsY8cI2PTMrJ2vTQuno4IFZb8/817wPHKIM//aN2zZ6uhZe
	pbrl/DsdXGjESiM43OMRg9HIjPCBQYzwiTn/NhaIDCZCNYympmolsYBR10sMX5FDwZbq75Y1kUC
	+21hqgN2zrvyF7SNXFDmt/jdtSxLKPj7Kup8V55uhx0BWBjMd8Nj8FFc6FUiM1GqqNEH7tVDd4B
	BkOS7g==
X-Received: by 2002:a05:6512:2246:b0:5a2:855f:2843 with SMTP id
 2adb3069b0e04-5a285aefc2fmr3543917e87.11.1774259752893; Mon, 23 Mar 2026
 02:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <3a3180b0f77d815e92c0c232a8f854d34ab7c2ea.1773860069.git.mykola_kvach@epam.com>
 <F2AB3928-C65E-43DC-80F0-1F2F4DDC8037@arm.com> <91968fdb-e0fb-43aa-9f8c-994ed733de6e@xen.org>
 <68A08948-5683-46EA-B5F9-8C8E0C900F5A@arm.com>
In-Reply-To: <68A08948-5683-46EA-B5F9-8C8E0C900F5A@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 23 Mar 2026 11:55:40 +0200
X-Gm-Features: AaiRm52t3EP_5yglYQ-Fy1f0GqSqm2gZt77v86df9VRFbS8MCY9HiXJJ12Um_d0
Message-ID: <CAGeoDV86FMkriBCCATQb=gUYn04eFKBesfwB4TO=B--pjm12gQ@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI arguments
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1774259754-82D44488-F1535419/0/0
X-purgate-type: clean
X-purgate-size: 5199
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,arm.com:email,xen.org:email,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 292482EF768
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand and Julien,

Thanks for the suggestions.

On Sat, Mar 21, 2026 at 2:44=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Julien
>
> > On 21 Mar 2026, at 11:34, Julien Grall <julien@xen.org> wrote:
> >
> > Hi Bertrand,
> >
> > On 19/03/2026 07:47, Bertrand Marquis wrote:
> >> Hi Mykola,
> >>> On 18 Mar 2026, at 19:56, Mykola Kvach <xakep.amatop@gmail.com> wrote=
:
> >>>
> >>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
> >>> using Wn, only the least significant 32 bits are significant and the
> >>> upper 32 bits must be ignored by the implementation.
> >>>
> >>> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in th=
e
> >>> argument registers as an error. Instead, they should be discarded whe=
n
> >>> decoding the arguments.
> >>>
> >>> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may b=
e
> >>> implementation defined when entering from AArch32. Xen zeros them on
> >>> entry, but that guarantee is only relevant for 32-bit domains.
> >>>
> >>> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND and AFFINITY_INFO to read SMC32
> >>> arguments via PSCI_ARG32(), while keeping the SMC64 handling unchange=
d.
> >>>
> >>> Suggested-by: Julien Grall <julien@xen.org>
> >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>> ---
> >>> Link to discussion: https://patchew.org/Xen/cover.1751020456.git.myko=
la._5Fkvach@epam.com/072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.gi=
t.mykola._5Fkvach@epam.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org
> >>> ---
> >>> xen/arch/arm/vpsci.c | 15 +++++++++------
> >>> 1 file changed, 9 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> >>> index 7ba9ccd94b..1e844ed571 100644
> >>> --- a/xen/arch/arm/vpsci.c
> >>> +++ b/xen/arch/arm/vpsci.c
> >>> @@ -303,9 +303,10 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *reg=
s, uint32_t fid)
> >>>     case PSCI_0_2_FN32_CPU_ON:
> >>>     case PSCI_0_2_FN64_CPU_ON:
> >>>     {
> >>> -        register_t vcpuid =3D PSCI_ARG(regs, 1);
> >>> -        register_t epoint =3D PSCI_ARG(regs, 2);
> >>> -        register_t cid =3D PSCI_ARG(regs, 3);
> >>> +        bool smc32 =3D (fid =3D=3D PSCI_0_2_FN32_CPU_ON);
> >>> +        register_t vcpuid =3D smc32 ? PSCI_ARG32(regs, 1) : PSCI_ARG=
(regs, 1);
> >>> +        register_t epoint =3D smc32 ? PSCI_ARG32(regs, 2) : PSCI_ARG=
(regs, 2);
> >>> +        register_t cid =3D smc32 ? PSCI_ARG32(regs, 3) : PSCI_ARG(re=
gs, 3);
> >> It might be nicer to modify PSCI_ARG to take a convention argument ins=
tead of
> >> redoing the same test everywhere, this would make the code nicer and e=
nsure no PSCI_ARG
> >> would have been forgotten.
> >
> > I would definitely agree with that. But...
> >
> >> At the end all those conventions are coming from smccc so we could:
> >> - use smccc_is_conv_64(fid) from smccc.h to get 32 vs 64
> >> - use smccc_get_fn to get the function id without the convention and r=
educe the number of entries
> >> in the switch
> >
> > I am not sure about this suggestion. Not all 32-bit call have a matchin=
g 64-bit call (e.g. PSCI_VERSION).
> >
> > Also, it seems that so far the function ID is always matching between t=
he two convention, it is unclear whether this is guaranteed.
>
> PSCI is an SMCCC spec and smccc defines the fid format with fast call or =
not, 32 or 64 and function id and that is the same for 32
> and 64 but there is no enforcement to provide both 32 and 64 versions (fo=
r example there are some ffa calls which are only available
> in 32 bit mode so 64bit version would get an UNSUPPORTED back).
>
> I am not suggesting we accept both versions when only one is supported he=
re, we can still have the switch base on function id and
> for specific one reject if it is not 32 bit format.
>
> Anyway as said this was more a suggestion than a request so maybe better =
to skip that for now.

I have taken the first part and introduced a helper to centralize
the convention-dependent argument decoding, so the 32-bit argument
handling is no longer open-coded at each call site.

For the second part, I have not switched this patch to dispatch on
smccc_get_fn(fid). While that could reduce some duplication in the
switch, it would also broaden the change beyond the original fix.

In particular, a function-number-based dispatch would require
separating bare PSCI function-number definitions from the full SMCCC
FIDs, and it would also need explicit checks in the handlers for calls
that are only defined in the 32-bit convention, so that unsupported
64-bit forms are still rejected appropriately.

So for now I would prefer to keep the switch on the full FID and keep
this patch focused on fixing the convention-dependent argument decoding
for the affected PSCI calls.

A follow-up cleanup can revisit switching to smccc_get_fn(fid) if we
decide that the extra refactoring is worthwhile.

Regards,
Mykola

>
> Regards
> Bertrand
>
> >
> > Cheers,
> >
> > --
> > Julien Grall
>
>

