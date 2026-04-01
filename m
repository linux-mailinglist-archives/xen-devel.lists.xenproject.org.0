Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC3FN8vFzGkWWgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 09:14:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD89375A53
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 09:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269785.1558683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7plV-0000zC-08; Wed, 01 Apr 2026 07:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269785.1558683; Wed, 01 Apr 2026 07:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7plU-0000xk-TL; Wed, 01 Apr 2026 07:13:24 +0000
Received: by outflank-mailman (input) for mailman id 1269785;
 Wed, 01 Apr 2026 07:13:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w7plT-0000xe-HR
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 07:13:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7plS-004IY9-T3
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 09:13:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ccc587-e002-0a2a0a5209dd-0a2a4506c8f4-38
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 09:13:22 +0200
Received: from [209.85.208.179] (helo=mail-lj1-f179.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ccc592-3034-0a2a45060019-d155d0b3e831-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 09:13:22 +0200
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-38cbe79dddcso9054161fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 00:13:22 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1775027602; cv=none;
        d=google.com; s=arc-20240605;
        b=gh3VuERp4uSi6ympnEn2DT+d0DYvNpstZkWNM03ubqCfPscGmO1kQ9XXUfWvQO1OSG
         XJlzUHPnI81lk66kw41AMsSwppvr3UYWI1SpYFp9J+XopP61u6uJ8b0Ss659/rrQQ0Rd
         GJIoImTpC6rcMwlHgUt0MayGBIHKOb9HSJagMEz/bIq5ggnkCRY2K5/0MSQuDgylSQcy
         yXZt1e1Rd7HajruqVsKUFYZA47FDZeSulEgLdC67RwiPAH3ITv/HyooP+MfESuJHSjXo
         CdVvKu0lgby/dI/DR30ZnCaNcLFxTL8+ioRyuwetSr0mU16dd9Xi6La45OQlt0+Ss+q6
         gBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QqLKcW5/vOR8do81aXnyE1SL7e4br5ZMunRXNu5gcSQ=;
        fh=wVCc8vTL6v/RB2XehmDNFBP74B6UunmJbBdbvzL1iiY=;
        b=YVy8MzKkdIuQeD5lmxlElDZoVwcx4Z2uyyNLM1Nd2saIsimhZxxL2yDYE90l2l3a0S
         WuuLThHFSRx7m++OPTgPkl5PZGkDCjbjdujEM5i2I6MAxFrInem+kLY1X4Z/X56/pQOK
         f4VYIn/D/4SA6MIA2LbLcIILoMrSKzHXIocdQpJBx07LLw1zq2cLgSMF3QnroQuz/HDO
         3HI3XnT7QpBd+nexOwaw+KsLiyrQLk5YZVMMqevgzinwApD+BEqYt0t5OGNynjX59mb9
         GUbst5epP5jCNFZtKMUeP5N36WR42ZNgTFDTBKG8nTFYkFiYeuPxIOs3YkY5RPBJ1DsU
         oh5g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775027602; x=1775632402; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqLKcW5/vOR8do81aXnyE1SL7e4br5ZMunRXNu5gcSQ=;
        b=ojhPRU0HLBxdSXi5/fJMU3KOyDA3EBZKcSLtOuDBiaZiXiqdZP8Y5Qm4iPsuHjyTaa
         S6z9A3bIq6yN9dYjtwiDczws9eWG06FEtTNoXiH8urijtmstrbrQyf3HO/KivJ0+WY80
         SHBdSLBKIxMDBjxX1UwJ1Nf7xZI04vl5Hh4M/eDo2yfYQ3X5Ty8b1JFdYm2rK6KneGRG
         hTFFMEofbrJ4nmJF9KV4sXRR21xQzp870rj1/+RXuQ2wURtpqqFTW2z+cd5pd1EgeYIN
         nSeDVEM/jzSzX9L11qqaC3Hxn7l100+sXw6a282yZ6HY8S9XzbGzLwdSSSI3BH9VvmAO
         IIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775027602; x=1775632402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqLKcW5/vOR8do81aXnyE1SL7e4br5ZMunRXNu5gcSQ=;
        b=NQBmYS5R+blza1FeM0aJ7Al4TkYApE8zAYnceMUkhaeH1hJrmkCqaW1H3PMhB8B90B
         2b/mOkWgX4f9/69jj8Su/xJ5P7i4NnbYZVPMk7lYnPFOyMBlCmha90m3/coCvQslkbYV
         4r1dECYeTiPnYaw8hvwmRGWbnmXwQu29aLm7NC3a9CoNO44o5lyipzMgclPVI7rd6Vix
         fHr8gp+gtlRPVKMVrHA0rg0iyolZP8lsmVcj5RKFFLwFxb6No/UVj1nhPIAHhT4eOBXC
         dhojQRgb2Tck4ow6Sl8LgIzcX+9f8Pw6moyh6L4NGrkYBtCZb0frBFUUmCSSmGTrfq7n
         ILCA==
X-Forwarded-Encrypted: i=1; AJvYcCUQG5iiZDwaWKpY+sx8XwHLjH1caBKH9oFb5zkfUlGaxbrrWOznQh181nz99lzIfSel9h7GsXzsLVc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBeWDnwsbL8fXVULHYOvmpPst8U7sf54veiscou4KsJ8e3Ikor
	2hiLHpK0+yVQ9hLWvc/6Ofi277WD23Bu33qzdjsiP6elfIWwnb3EI3Y9UFnar3hKm7rV7fZfgzX
	SlwTwKSnhVGUJbRuprcXoBXVJJu9EdAlOoLVsR6A=
X-Gm-Gg: ATEYQzwmyTqyjQwyDsxSG4aKMupN3ot1QoaR8335cL8QbOeO2kom4fEyyjVXVyBu+r6
	n12EVifzDjgoJr+hNuhnMPrY0KdETOUJVQOmhpak/PMaMAtZ474yXCuMispuScYU6TB4KBXppew
	x4iYvprZSBIIIpm+IswQad6gpOZ+CuTWcbE1hWMwgqGdtSChfzAM59Cpcej63Dt1DdklUwS7Qid
	00CE+9Qy0rcI6Oh8ixSZXtD55fx5v/nY0WhGqIjQQOnGqZ9962MD/VQV35XqxN8hSjSSN604/vm
	LMVo
X-Received: by 2002:a05:6512:130e:b0:5a1:3d21:7b55 with SMTP id
 2adb3069b0e04-5a2c1f35119mr866631e87.43.1775027601442; Wed, 01 Apr 2026
 00:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
 <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com>
In-Reply-To: <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 1 Apr 2026 10:13:10 +0300
X-Gm-Features: AQROBzCsqScaJPrS9xoojwVZMluMyQDN-QvbeXLOZ0pzS5-wjtEVSbvt33Yg_BE
Message-ID: <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI arguments
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1775027602-815891C2-D0B242C1/0/0
X-purgate-type: clean
X-purgate-size: 3702
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3CD89375A53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jan,

On Wed, Apr 1, 2026 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 31.03.2026 20:31, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
> > using Wn, only the least significant 32 bits are significant and the
> > upper 32 bits must be ignored by the implementation.
> >
> > So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in the
> > argument registers as an error. Instead, they should be discarded when
> > decoding the arguments.
> >
> > Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may be
> > implementation defined when entering from AArch32. Xen zeros them on
> > entry, but that guarantee is only relevant for 32-bit domains.
> >
> > Update PSCI v0.2+ CPU_ON, CPU_SUSPEND, AFFINITY_INFO and SYSTEM_SUSPEND
> > to read SMC32 arguments via PSCI_ARG32(), while keeping the SMC64
> > handling unchanged.
> >
> > No functional change is intended for PSCI 0.1.
> >
> > Suggested-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> I thought I might as well include this in my next commit sweep, but isn't
> this R-b being invalidated by ...
>
> > ---
> > v3:
> >  - use PSCI_ARG_CONV for SYSTEM_SUSPEND
>
> ... this change. That's ...
>
> > @@ -422,14 +427,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs,=
 uint32_t fid)
> >      case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >      case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >      {
> > -        register_t epoint =3D PSCI_ARG(regs, 1);
> > -        register_t cid =3D PSCI_ARG(regs, 2);
> > -
> > -        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> > -        {
> > -            epoint &=3D GENMASK(31, 0);
> > -            cid &=3D GENMASK(31, 0);
> > -        }
> > +        register_t epoint =3D PSCI_ARG_CONV(regs, 1, is_conv_64);
> > +        register_t cid =3D PSCI_ARG_CONV(regs, 2, is_conv_64);
> >
> >          perfc_incr(vpsci_system_suspend);
> >          PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid))=
;
>
> ... this hunk aiui, which is far from merely cosmetic imo. While

Nobody said that the change had to be purely cosmetic in order to keep
the tag. I understood it differently from the official Xen
documentation pages.

> behavior looks to remain the same for PSCI_1_0_FN32_SYSTEM_SUSPEND, it

Exactly. If the changes are not substantial, I do not see a reason to
drop the tag ...

> clearly changes for PSCI_1_0_FN64_SYSTEM_SUSPEND. That may be intended
> and for the better, but the change clearly wasn't reviewed by Bertrand,
> nor - when offering the R-b - did he ask for this extra change.

... and this is also how I understood the Xen patch submission
guidelines [1], which say:

"Note that if there are several revisions of a patch, you ought to
copy tags that have accumulated during the review. For example, if
person A and person B added a Reviewed-by: tag to v1 of your patch,
include it into v2 of your patch. If you make substantial changes
after certain tags were already applied, you will want to consider
which ones are no longer applicable (and may require re-providing)."

So my understanding was that tags should normally be kept across
revisions, unless the changes are substantial enough to make them no
longer applicable.

In any case, if you do not think the tag should be kept, I am fine with
waiting for Bertrand to re-confirm it.


Best regards,
Mykola

[1] https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches

>
> Jan

