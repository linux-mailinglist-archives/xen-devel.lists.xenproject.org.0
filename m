Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IEhBd1A+GnCrwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 08:46:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA14B8FCB
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 08:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299524.1574065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJn4Y-0003c6-HR; Mon, 04 May 2026 06:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299524.1574065; Mon, 04 May 2026 06:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJn4Y-0003ae-E7; Mon, 04 May 2026 06:46:30 +0000
Received: by outflank-mailman (input) for mailman id 1299524;
 Mon, 04 May 2026 06:46:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wJn4W-0003aY-SL
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 06:46:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJn4V-000t0Z-Q5
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 08:46:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f840c1-e002-0a2a0a5209dd-0a2a4502b22a-16
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:46:27 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f840c3-af86-0a2a45020019-d155d0b6d848-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:46:27 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-39380e79936so14187561fa.2
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 23:46:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1777877187; cv=none;
        d=google.com; s=arc-20240605;
        b=dB2AtvMAyFGNn4HIdCOXjiHVAnP6l3jeZOD0v5WdyCLvvmiK9+k5/+2ylVKXjoo3hp
         kNHpykHoqxKZH3xVDoE2WTal5B+iU0OOODaUSHRkO6s9rofQattsXJyxaKLlCREXzhOH
         83+7gO2fSKNWvewowJwbS88j/OjA/YCzwEMAUkgt2ctSMMHQXy9IqN78lko363GnoWFg
         hdDFotuaRdtHyVDsjuGTIQfwybxofcFL0/WgyNP9m9vjjF3i3sNUEiz2O3lL/xJKD2sL
         UUCVED9ab0m6XXgs8L0XGr5E+dVLSTqVMX5i8hjoli7WzSIAdr6KcLJjcg8h3vLyU8WI
         GfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hl7+8bj11o7w8ySG0svFpcCKviuJf6j1XMQI0d4D6G0=;
        fh=UkW1QsykQMC33yWXr4pJKF3hWw8k7K8wwFcwAAasZs8=;
        b=anMoty4zWM9KXvdfmv7bhAGNp0RaprBiJJq2I9fdQIf696oucwlr6ift7qfEZuE0Do
         EhoRg07QLk5V9BBVyynZAmc4tgVaZ7639aE54DqEk/KqlHHaoNAeZsOcPCi4yf44KhbC
         7pRNanhwLYW5Vxoux/x26/D2K3jGv3nwSGFvkEsanVJdIOr2ff+sSFRqFCh1bjGWo07p
         NnE/rs5eGF5RrSTDW9HB1AmVD97PVG7egkYKi4vCS/CXuAZ+xr4G4vqxS+H5CPHyiFfP
         jYecirjRFnHvQtMLaoyzuV/lFFUW4rUgd0Z2/R10t5PbqYal2qNVTb7RCHlGSMJCSg8O
         7pbw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777877187; x=1778481987; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl7+8bj11o7w8ySG0svFpcCKviuJf6j1XMQI0d4D6G0=;
        b=Szwa1rxkj02uOHkPZZv6Txqjjy169YjqoJDH+8JcL+gxhNgVPS6FjSQe7PdoWiGLXx
         i4NLHCcizeg9GGzZDw8FU8f/gkLpbO9pkm/lbWNbc+LQfz22Asxl2GEZ1e5aSwGiI4Le
         be90HVUukqEQsq3BrcrjHE8R+6donnR65poy9xK/eMKdT3KYZiBAGGULZqC5cOx7b6p4
         +gN3PnWfOncgH8dE5vneubCA2m+KF8kzxkIBijEcL2VBNf8RF8S7vsS3HhMiV+ZjCAgJ
         Nkt4eRzVVNbP65jQ/Rrlvx1+zn2PYT35JSkaUTyhzQOcBggK6hDWDtk3oPWB4/rfTp07
         b+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877187; x=1778481987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hl7+8bj11o7w8ySG0svFpcCKviuJf6j1XMQI0d4D6G0=;
        b=G9fozv/QI6KdHnFdIAOg7Mbq2OfliAgIi7t4bpaRMucVuTHMqj2MAyOuuurKU7pBws
         7LaBfGfdSnQTlohvKWB07GCWJdWyxzgy/Ap3dgau7nkGCLLck9AuF5B7F7VugrvE96iF
         DxTn2ZjlAl1axFZpwyRKU4iN7DBod/WqE8JbwJ+3/DP5Kh8Tv0zMdnMpn0cWMzaxh4u/
         4+cu028lUNYHt3E5KMuHCdEq0ahIi8E2MxBlB0f65jkqAUtBQHJ6jRaA9DcX2zL47FwD
         elAF9PHTemIwDd9yBrVLTD+c+1NDFvghznKgc/avg/xrcx09EzdBpQgabzGEObSJaQBb
         ClnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QJU4fCE0YAkP//71MglrqEIDGh9zC99aLZajQWOpcA2KBsgp4cQJghTbnllXOQFZJBt7zd3rWeXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZwawQFJ5grQFZgMsmh805idQaeFC2C6jyFbb2CsxKIe/mm894
	KsD20J1RX4fLusvQqymf9BWQWlKM92OZVh63z9M9NZwci8qnHrv/tfSxjExPV7/MeVqfYDUfUfN
	fi/wKgNSjaeMk5kJ9u3rZ6LaqmoyFSQI=
X-Gm-Gg: AeBDievvbAzBDSNE8dxq377sTgxB7qIqxEu5FFVxtn1Ml8+s9TQ8uFYpkB0o3A9++gn
	4R5iiffVXaOHW6cFp2ltyTfnHKXGrDndunru57ySv1LxQsCAbg06NVNOWCTc384zrphNr00/rgp
	b+GyVtO8OXew0XmPk9DNe+2a//P7dZw8QWeyN4ub/bfu8mB2dvvHneQeorHHh8NWp+HlTI1wynC
	Hc7idZKmoKOIjFJ1GLR6kyIx0mgILj41LTuyY4DXMYeSu239GXGVyrD/6EgpwzMLeT8VVXighdw
	Q9dYmlhHF2bTfQPWS5oltiPtSzE=
X-Received: by 2002:a05:651c:1588:b0:38e:4810:4f36 with SMTP id
 38308e7fff4ca-393784ab329mr21544591fa.9.1777877186540; Sun, 03 May 2026
 23:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
 <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com> <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
 <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com> <CAGeoDV_Cdpa6beFemKaVcCguwmo95x0g0rsRYbS1x5dAUxFPLQ@mail.gmail.com>
 <5fb9b5ee-ee71-49ec-b545-62c8ec27fc15@suse.com> <CAGeoDV-HCKUXZ-CZBASLik=xkR02w-n=5+HVsYGwfDf4zD-3zA@mail.gmail.com>
 <425cdc68-5e25-4e01-b5d9-6469e2d08abb@suse.com> <DDF9A244-22CB-416E-A855-D85FECE0A3C2@arm.com>
 <CAGeoDV_0r8_-dB33G5U81+Q1yncgzgLgMF5Ar_rmVt5h8-rgZQ@mail.gmail.com>
In-Reply-To: <CAGeoDV_0r8_-dB33G5U81+Q1yncgzgLgMF5Ar_rmVt5h8-rgZQ@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 4 May 2026 09:46:15 +0300
X-Gm-Features: AVHnY4Jw3kqRt7TJitevrk3OlcM1c5n1EjC3wDuFDI48sg8R8MMzH8eUCqfFhW4
Message-ID: <CAGeoDV-FWcrCHnE92s6Y+gpoVqa6vJDzB63Z6uXtL2T6Jfr7xw@mail.gmail.com>
Subject: Ping: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32
 PSCI arguments
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1777877187-83563161-A7876D74/0/0
X-purgate-type: clean
X-purgate-size: 8388
X-Rspamd-Queue-Id: 65DA14B8FCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email,arm.com:email,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi all,

Gentle ping on this patch.

Bertrand has re-confirmed his Reviewed-by, and the previous discussion
looks resolved from my side.

Could this be picked up if there are no remaining concerns?

Best regards,
Mykola

On Thu, Apr 23, 2026 at 8:13=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> Hi Bertrand,
>
> On Wed, Apr 15, 2026 at 3:31=E2=80=AFPM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
> >
> > Hi Jan and Mykola,
> >
> > > On 1 Apr 2026, at 14:24, Jan Beulich <jbeulich@suse.com> wrote:
> > >
> > > On 01.04.2026 11:51, Mykola Kvach wrote:
> > >> On Wed, Apr 1, 2026 at 12:22=E2=80=AFPM Jan Beulich <jbeulich@suse.c=
om> wrote:
> > >>> On 01.04.2026 10:49, Mykola Kvach wrote:
> > >>>> On Wed, Apr 1, 2026 at 11:14=E2=80=AFAM Jan Beulich <jbeulich@suse=
.com> wrote:
> > >>>>> On 01.04.2026 09:13, Mykola Kvach wrote:
> > >>>>>> On Wed, Apr 1, 2026 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@sus=
e.com> wrote:
> > >>>>>>> On 31.03.2026 20:31, Mykola Kvach wrote:
> > >>>>>>>> From: Mykola Kvach <mykola_kvach@epam.com>
> > >>>>>>>>
> > >>>>>>>> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC c=
alls
> > >>>>>>>> using Wn, only the least significant 32 bits are significant a=
nd the
> > >>>>>>>> upper 32 bits must be ignored by the implementation.
> > >>>>>>>>
> > >>>>>>>> So for SMC32 PSCI calls, Xen must not treat non-zero upper bit=
s in the
> > >>>>>>>> argument registers as an error. Instead, they should be discar=
ded when
> > >>>>>>>> decoding the arguments.
> > >>>>>>>>
> > >>>>>>>> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bit=
s may be
> > >>>>>>>> implementation defined when entering from AArch32. Xen zeros t=
hem on
> > >>>>>>>> entry, but that guarantee is only relevant for 32-bit domains.
> > >>>>>>>>
> > >>>>>>>> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND, AFFINITY_INFO and SYSTE=
M_SUSPEND
> > >>>>>>>> to read SMC32 arguments via PSCI_ARG32(), while keeping the SM=
C64
> > >>>>>>>> handling unchanged.
> > >>>>>>>>
> > >>>>>>>> No functional change is intended for PSCI 0.1.
> > >>>>>>>>
> > >>>>>>>> Suggested-by: Julien Grall <julien@xen.org>
> > >>>>>>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > >>>>>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > >>>>>>>
> > >>>>>>> I thought I might as well include this in my next commit sweep,=
 but isn't
> > >>>>>>> this R-b being invalidated by ...
> > >>>>>>>
> > >>>>>>>> ---
> > >>>>>>>> v3:
> > >>>>>>>> - use PSCI_ARG_CONV for SYSTEM_SUSPEND
> > >>>>>>>
> > >>>>>>> ... this change. That's ...
> > >>>>>>>
> > >>>>>>>> @@ -422,14 +427,8 @@ bool do_vpsci_0_2_call(struct cpu_user_re=
gs *regs, uint32_t fid)
> > >>>>>>>>     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > >>>>>>>>     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> > >>>>>>>>     {
> > >>>>>>>> -        register_t epoint =3D PSCI_ARG(regs, 1);
> > >>>>>>>> -        register_t cid =3D PSCI_ARG(regs, 2);
> > >>>>>>>> -
> > >>>>>>>> -        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> > >>>>>>>> -        {
> > >>>>>>>> -            epoint &=3D GENMASK(31, 0);
> > >>>>>>>> -            cid &=3D GENMASK(31, 0);
> > >>>>>>>> -        }
> > >>>>>>>> +        register_t epoint =3D PSCI_ARG_CONV(regs, 1, is_conv_=
64);
> > >>>>>>>> +        register_t cid =3D PSCI_ARG_CONV(regs, 2, is_conv_64)=
;
> > >>>>>>>>
> > >>>>>>>>         perfc_incr(vpsci_system_suspend);
> > >>>>>>>>         PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoin=
t, cid));
> > >>>>>>>
> > >>>>>>> ... this hunk aiui, which is far from merely cosmetic imo. Whil=
e
> > >>>>>>
> > >>>>>> Nobody said that the change had to be purely cosmetic in order t=
o keep
> > >>>>>> the tag. I understood it differently from the official Xen
> > >>>>>> documentation pages.
> > >>>>>>
> > >>>>>>> behavior looks to remain the same for PSCI_1_0_FN32_SYSTEM_SUSP=
END, it
> > >>>>>>
> > >>>>>> Exactly. If the changes are not substantial, I do not see a reas=
on to
> > >>>>>> drop the tag ...
> > >>>>>>
> > >>>>>>> clearly changes for PSCI_1_0_FN64_SYSTEM_SUSPEND. That may be i=
ntended
> > >>>>>>> and for the better, but the change clearly wasn't reviewed by B=
ertrand,
> > >>>>>>> nor - when offering the R-b - did he ask for this extra change.
> > >>>>>>
> > >>>>>> ... and this is also how I understood the Xen patch submission
> > >>>>>> guidelines [1], which say:
> > >>>>>>
> > >>>>>> "Note that if there are several revisions of a patch, you ought =
to
> > >>>>>> copy tags that have accumulated during the review. For example, =
if
> > >>>>>> person A and person B added a Reviewed-by: tag to v1 of your pat=
ch,
> > >>>>>> include it into v2 of your patch. If you make substantial change=
s
> > >>>>>> after certain tags were already applied, you will want to consid=
er
> > >>>>>> which ones are no longer applicable (and may require re-providin=
g)."
> > >>>>>>
> > >>>>>> So my understanding was that tags should normally be kept across
> > >>>>>> revisions, unless the changes are substantial enough to make the=
m no
> > >>>>>> longer applicable.
> > >>>>>
> > >>>>> Maybe our understanding of "substantial" differs. To me that's an=
ything
> > >>>>> changing functionality. Style adjustments, typo corrections, and =
alike
> > >>>>> generally aren't substantial (albeit even then there may be excep=
tions).
> > >>>>
> > >>>> Thanks for clarifying what you consider substantial.
> > >>>>
> > >>>> Even under that interpretation, I do not see a functionality chang=
e
> > >>>> here. "Refactoring" seems like the more accurate term in this case=
:
> > >>>> the internal form changes, but the intended external behavior does
> > >>>> not.
> > >>>>
> > >>>> It may be that we are using "functional change" in slightly differ=
ent
> > >>>> senses here.
> > >>>>
> > >>>> For v3, the switch to PSCI_ARG_CONV() in SYSTEM_SUSPEND was meant =
to
> > >>>> make this case consistent with the helper-based argument decoding =
used
> > >>>> elsewhere, not to change behavior.
> > >>>>
> > >>>> In particular, I do not see a functional change for
> > >>>> PSCI_1_0_FN64_SYSTEM_SUSPEND: v2 used PSCI_ARG(regs, 1/2), and in =
v3
> > >>>> PSCI_ARG_CONV(regs, 1/2, is_conv_64) should resolve to the same th=
ing
> > >>>> when is_conv_64 is true.
> > >>>
> > >>> Isn't the whole point of the patch to alter behavior when is_conv_6=
4 is
> > >>> false? For that case PSCI_1_0_FN64_SYSTEM_SUSPEND behavior looks to
> > >>> change in v3, when it didn't in v2. Whereas for
> > >>> PSCI_1_0_FN32_SYSTEM_SUSPEND the v3 change indeed only eliminates o=
pen-
> > >>> coding, which one may or may not regard as "substantial".
> > >>
> > >> I think the point I was trying to make is slightly narrower: in this
> > >> code path, is_conv_64 is derived directly from fid via
> > >> smccc_is_conv_64(fid) before the switch (fid).
> > >>
> > >> So for PSCI_1_0_FN64_SYSTEM_SUSPEND, I do not see how
> > >> is_conv_64 =3D=3D false could arise here: if we are in the FN64 case=
,
> > >> the function ID already encodes the 64-bit convention.
> > >>
> > >> Conversely, if is_conv_64 is false here, then this cannot be the
> > >> FN64 case.
> > >
> > > Ah, I see. To figure that out, I would have had to do a proper review=
. I
> > > was after committing only, which ought to be an entirely mechanical s=
tep.
> > >
> > >> On that basis, I do not see a behavioral change for the FN64
> > >> SYSTEM_SUSPEND case in v3.
> > >
> > > I agree (now). I'm still not going to pick up that patch, but rather
> > > leave it to the Arm maintainers. While not as clear cut as it first
> > > seemed to me, I still consider it within the grey area.
> >
> > Sorry for the delay, this felt through in my filters as it was reviewed=
-by already.
> >
> > I am ok with the changes done which make sense (mask is now done
> > directly).
> >
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Thank you for taking another look.
>
> With your Reviewed-by in place, and since I do not expect any further
> changes from my side, I believe this patch should now be ready for the
> Arm maintainers to pick up.
>
> Best regards,
> Mykola
>
> >
> > Cheers
> > Bertrand
> >
> > >
> > > Jan
> >
> >

