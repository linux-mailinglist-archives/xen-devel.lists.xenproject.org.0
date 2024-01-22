Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24D8363EC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669859.1042315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtxS-0000DN-EH; Mon, 22 Jan 2024 13:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669859.1042315; Mon, 22 Jan 2024 13:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtxS-0000BO-Av; Mon, 22 Jan 2024 13:03:22 +0000
Received: by outflank-mailman (input) for mailman id 669859;
 Mon, 22 Jan 2024 13:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBCN=JA=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rRtxR-0000BH-Oq
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:03:21 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d7dee52-b926-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 14:03:19 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cdeb80fdfdso33345771fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:03:19 -0800 (PST)
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
X-Inumbo-ID: 9d7dee52-b926-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705928599; x=1706533399; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ovq7wzyJDqkQPgxoN3CUwgUnoUxL3ELGjRFUns9TKOs=;
        b=hOirl/SktCsTKiDPMnxc0kZ4FvGcvjWrMCF4Q60Wq7oFegli4Kg3Z+3PW2R4p3Xogj
         FJGjpMc9HyeZgK9zAygEuRJY11YOfy9RH29YcIETF+T0oQ7V0xtjhxCurNy26aIshzAc
         evkDRAeAedd91KO+6qLOElpG3OUMLLy4OjXFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705928599; x=1706533399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ovq7wzyJDqkQPgxoN3CUwgUnoUxL3ELGjRFUns9TKOs=;
        b=Wx15R1ziDpAYn8w34ZKMGklPZ6fPN1VlvzfryCpsccWASDpbZ1y5CUUWNk7CiEd2Sy
         4rYFADEddIQSMTH0NqMmTy5RJhz7L8cxtab4IkMSlbOnnnMFFM/Wy4hnA2k5n5v4TTH3
         ReAtQoDH/kf8qlSv0PTpjleB4nZArtRdT5ziHR8iHYnvnBYmNUPduu/+2jfkpN/SUm4k
         jBTCG/MlIdVtE3MFv63/xaUG8GFNJzdovHE8jWbo6PRiuA+WRPsUF3AKT2+tU5Ct4zsS
         iro3/42j4NFSorh72U489J+XJLmU25zQNFBtkb4zVJ1oww4pT+vhutjzy8ofRzFbkOrI
         4/Hw==
X-Gm-Message-State: AOJu0YzeS1/aLB3qmDU8uu6JRJe9H3t3T8RZVy2C1S+vevdP08iH4gm4
	Z8xtsnlI6dcUyaunurtnCGIPAerEE4U2apD02e8DciEUJLpKVSLBGNoDJPcVuYVZuYMS4yS3y6A
	BW+p464HybMF/9NBmi8OJEqDSgxaEoFOLnDYO3Q==
X-Google-Smtp-Source: AGHT+IHh9sv4EOmyU7ASR91vjRCBsqDw5NreDS75LFTwZFdpBvGPyry+/DOW7GGgIJHq3WPzcRhC/ZStFQ67jcNctvo=
X-Received: by 2002:a2e:a267:0:b0:2cd:fba9:9507 with SMTP id
 k7-20020a2ea267000000b002cdfba99507mr734514ljm.36.1705928599250; Mon, 22 Jan
 2024 05:03:19 -0800 (PST)
MIME-Version: 1.0
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
 <Za23cKyEOl1WTvhZ@itl-email> <CA+zSX=YNjVaGn8=kio=2iT8onHAP61pzP-dicMrr4pKJQ827gw@mail.gmail.com>
 <Za5c5pm9Qai82zvf@mail-itl> <CA+zSX=Zu1e1JSkje9=s5jtEsoT8vmNVhSbC3bJY5Nu-UWTA+gw@mail.gmail.com>
 <Za5kqtWZ4mXCFvzf@mail-itl> <CA+zSX=agZbyZNsS2ca9bEm8p+z=Y53moVfOz57Mrs-AJZmSdmg@mail.gmail.com>
In-Reply-To: <CA+zSX=agZbyZNsS2ca9bEm8p+z=Y53moVfOz57Mrs-AJZmSdmg@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 22 Jan 2024 13:03:08 +0000
Message-ID: <CA+zSX=byLnFTUvFkb8RQCxdGPoz1E3w5vzaO1gTsXBBOp70OfQ@mail.gmail.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 1:02=E2=80=AFPM George Dunlap <george.dunlap@cloud.=
com> wrote:
> 2. two VMs running kernbench, but not competing for vcpu
> 3. four VMs running kernbench, competing for vcpus

Sorry, this should be competing for *P*cpus

 -George

