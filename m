Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A662F8BE9E0
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 18:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718320.1120908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4O6M-0006D6-Rl; Tue, 07 May 2024 16:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718320.1120908; Tue, 07 May 2024 16:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4O6M-0006B0-P7; Tue, 07 May 2024 16:55:38 +0000
Received: by outflank-mailman (input) for mailman id 718320;
 Tue, 07 May 2024 16:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0blL=MK=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s4O6L-0006Ar-Kf
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 16:55:37 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a02cb858-0c92-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 18:55:36 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59a0e4b773so813467166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 09:55:36 -0700 (PDT)
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
X-Inumbo-ID: a02cb858-0c92-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715100936; x=1715705736; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r1PyM22ApUZwyfRX8L8ckcNtjRIFNBKB4u9h89oKmY=;
        b=RkpNj2mQxvl3JLmMIHucW6xkZflAeIVXBWGOLb+4TL5fJ0shkNw6VIfbQhFsr7q9kg
         1OOZqc2nInYi4QvqRGVOsjPHL0FAQukGk/6arFHviZsa+Zvcd1xyUk7jaIgREQgTKZAQ
         0V9V8wLFI+VZHWjSUn7TdB7RDGh4C+iIF55B80ehyWraRcEg4P4PhO3RNo7RWRjtoyIy
         pBf5kBCHcm1bdY3fVWbkuHEAyANNVegSLNXAKOa0/sXp1EuWSWwkScisHyH3pt9x8m/9
         tzSXazEiDNwdXtQ7yaHzvdx0gcZqz3g5DabhGpSY3bqkMpMJuZdc1rba+ijehUiSxWEU
         1HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715100936; x=1715705736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9r1PyM22ApUZwyfRX8L8ckcNtjRIFNBKB4u9h89oKmY=;
        b=SJjWw+XNQKARYahZs4HCake10MuisVZZRLQywANhNRTjRlN/F+xmqFyRTLc9VgX9Cq
         Mfya3PgHSAk98PvcvuEfVQjG5JVuqb1XnxP49KGmE8QqLPsPOPKRJM9C1KRYQAci3cDf
         L5UNPIEOZPqlsoDlByK583XtzYZZI385clkDtqhkK0U30l2PXkEW85EYANtg2fq7feqp
         99Vo5xBXyi/5Ka17uNdDZc1u+zIrVX+rl4e9fdN36ut8KQUSDL2thXFViXgxo8WFWvVn
         JLSMEJeNEd0dAUuiCtfRqYCmgqpay+zji+RYwcC1p4KI4KMAN7PCd3pW/9b8qwxeDobN
         JkPA==
X-Forwarded-Encrypted: i=1; AJvYcCUUDGvnAbumkMa7NPO8LbGCTDs5kWnO4kIaMUZV/37bLD7At4Fcs2tA6bm/DglfxQE2xLp475bfFYxqIMFQNEae0QMkJhZBYuACugJkOSE=
X-Gm-Message-State: AOJu0Yy9NznuNY+OhMOM7qiN2vnDLQhVwC7GQi1MUdKjZ1bgzkoQyo/v
	SAs0g1dMNPYK/TbBsQMJplfbGUZ8/lV0r+WqKCGz7xjjCT4CE/PKODJbnqYrvYptc6TwQ1Uu4GC
	AN2jg+tNiGmMRo3i6MBGMY77mFlg=
X-Google-Smtp-Source: AGHT+IGp2NBJhmznoejOk1f0f9GHTGN+JUTUgQodCAVivgpT9rDkTiLpV5SCdP3UumowcFdDnO9GD0s/BuHUhccKv6Y=
X-Received: by 2002:a50:a687:0:b0:56c:5a12:ac53 with SMTP id
 4fb4d7f45d1cf-5731d9f1788mr201250a12.24.1715100935761; Tue, 07 May 2024
 09:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
 <20240501035448.964625-7-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405031656490.1151289@ubuntu-linux-20-04-desktop>
 <CAJy5ezpgXVp838aA_E8vJDARoO5iQOh07D+Gpn0kMCLj_iXyLw@mail.gmail.com> <398afdf1-8a11-4584-bb07-cf6fc2373d21@xen.org>
In-Reply-To: <398afdf1-8a11-4584-bb07-cf6fc2373d21@xen.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 7 May 2024 18:55:22 +0200
Message-ID: <CAJy5ezpNQP5q0NVaGdXtt5BbJSzCMfTfFt-0RRgVq3+DqMbKgA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/arm64: bpi: Add missing code symbol annotations
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
	jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 11:57=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 06/05/2024 13:54, Edgar E. Iglesias wrote:
> > On Sat, May 4, 2024 at 2:14=E2=80=AFAM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> >>
> >> On Wed, 1 May 2024, Edgar E. Iglesias wrote:
> >>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >>>
> >>> Use the generic xen/linkage.h macros to annotate code symbols
> >>> and add missing annotations.
> >>>
> >>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> >>> ---
> >>>   xen/arch/arm/arm64/bpi.S | 20 ++++++++++++--------
> >>>   1 file changed, 12 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/arm64/bpi.S b/xen/arch/arm/arm64/bpi.S
> >>> index 4e63825220..b16e4d1e29 100644
> >>> --- a/xen/arch/arm/arm64/bpi.S
> >>> +++ b/xen/arch/arm/arm64/bpi.S
> >>> @@ -52,14 +52,15 @@
> >>>    * micro-architectures in a system.
> >>>    */
> >>>       .align   11
> >>> -ENTRY(__bp_harden_hyp_vecs_start)
> >>> +FUNC(__bp_harden_hyp_vecs_start)
> >>>       .rept 4
> >>>       vectors hyp_traps_vector
> >>>       .endr
> >>> -ENTRY(__bp_harden_hyp_vecs_end)
> >>> +GLOBAL(__bp_harden_hyp_vecs_end)
> >>> +END(__bp_harden_hyp_vecs_start)
> >>
> >> Shouldn't GLOBAL be changed to FUNC as well?
> >>
> >
> > I was a bit unsure but went for GLOBAL since the _end labels point to
> > addresses after and outside of the code sequence.
> > But I don't have a strong opinion and am happy to change them to FUNC
> > if you feel that's better.
>
> I don't think it should be FUNC as this is not meant to be called
> directly. I am also under the impression, we were planning to get rid of
> GLOBAL() as well.
>
> Furthermore, __bp_harden_hyp_vec_start is not a function per say. It is
> a pointer to the vector table.
>
>  From the brief look, the same remarks would apply to the rest of bpi.S.
> So I think we want to switch all the ENTRY() to LABEL().

Hi Julien,

The reason I choose FUNC for the start of the symbol is because these
symbols contain
executable code (not only a table of pointers to code somewhere else)
and the ELF spec
says that STT_FUNC means the symbol contains functions or other executable
code (not only callable functions IIUC):

"STT_FUNC The symbol is associated with a function or other executable code=
."
https://refspecs.linuxbase.org/elf/elf.pdf
(Symbol Table 1-20).

I think using LABEL instead of GLOBAL for the _end labels of these
code sequences makes sense.
I'm happy to change the _start labels to LABEL too if you guys feel
that's better.

Cheers,
Edgar

