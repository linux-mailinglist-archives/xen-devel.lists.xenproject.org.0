Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D4298EFE4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 15:01:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809465.1221802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swLRe-0002Qe-TP; Thu, 03 Oct 2024 13:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809465.1221802; Thu, 03 Oct 2024 13:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swLRe-0002OA-Qq; Thu, 03 Oct 2024 13:00:38 +0000
Received: by outflank-mailman (input) for mailman id 809465;
 Thu, 03 Oct 2024 13:00:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swLRd-0002Nl-1I
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 13:00:37 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a172230-8187-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 15:00:34 +0200 (CEST)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2870ce5e9e8so498921fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 06:00:34 -0700 (PDT)
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
X-Inumbo-ID: 7a172230-8187-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727960433; x=1728565233; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxibvbJB47DNuscU5G1ADRroFaBAAYTuYbe3yx7mRG4=;
        b=Gv2bfq56alvsEhSFLHFriFIO3ZnB7gqdSGcgh5A1ozQufX3EzD98JGBTUEjMjyo5tE
         NnyOi6Gzf/bxfz1qdkAdqgdB9uBLa8IOM8/Gb1nS10awMrEkeU6xtCRKDYxerkkMx482
         75UcFD8ez0cK79RMFmRiu2N/NknELDgt8odiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727960433; x=1728565233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxibvbJB47DNuscU5G1ADRroFaBAAYTuYbe3yx7mRG4=;
        b=cHVHMgBmOrtZM5jnrinu5KLhw/nBop9KcWJTt3yGXSTd453iosD8Mm3abzVwe/GxMR
         m7uFlZJj4QXvV8BrLuyXLgDD9Y5BfuvukUYbIQdqHk246q7S/4y2Pr5kD6/SL5TZltUF
         WKroGl0Xpgt0tj6Dwc8DLIxZyjLwKTNLB8vXDodlcNU5pxP1OSthx9UYCR9v3PrdLCI1
         yJbR2B2GtXmsW2tOd/mE+AyxAExbC+Rw5Wzh6vZO3tK2awTRhhGKfA0aAZUZ3rpa8Sdd
         Pboss7IbL7ZwjkErdTf057eijTUinr/DEndACV+BATRqzkfs7KuLQgqVK5hz3NRD7ybH
         ijSQ==
X-Gm-Message-State: AOJu0YzxYdgzg09lci6JPtEpzM8nHnhe0fNnn+FEbU4xXFHZGTFm4jIT
	PK/szIrljzk4PzTE2cZITxK5sD6afuHl40UDd7M9aFJRDCKHuvM35HoAkTMG21IF0/SggB7nMUg
	MG/TJEqe4qS+k9lDiLkY69brm1lp14V5eOhRIGXqVgTXlQ6DEd6Y=
X-Google-Smtp-Source: AGHT+IGU8t0uFlXEGIYQDW2Ot5zEunspJGE3IaPz3mEc7eqp2fIYkKqYmivcr0Pgaks6O6Dy7sXcJt/yeKilf5f3OTs=
X-Received: by 2002:a05:6870:88a7:b0:277:eb68:2878 with SMTP id
 586e51a60fabf-2878914acecmr5833074fac.44.1727960433185; Thu, 03 Oct 2024
 06:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 3 Oct 2024 14:00:22 +0100
Message-ID: <CACHz=ZgZq5T642CHj=2xW8CcShLLrLmet6=CULFGR9sjdz46sA@mail.gmail.com>
Subject: Re: [PATCH 00/20] Update header guards bases on new coding style
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Paul Durrant <paul@xen.org>, Tim Deegan <tim@xen.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Ross Lagerwall <ross.lagerwall@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Juergen Gross <jgross@suse.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>, 
	=?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>, 
	Doug Goldstein <cardoe@cardoe.com>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, 
	George Dunlap <gwd@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 1:19=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> With the help of some script I and manual checking I updated all
> header guards.
>
> As the changes are pretty large patch was split based on maintainers
> to reduce mail spamming.
>
...

CI is failing badly, I need to do more thoroughly testing.

Sorry for the spam.

Frediano

