Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B91A90A8AC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 10:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741896.1148571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ7ty-0001pQ-KY; Mon, 17 Jun 2024 08:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741896.1148571; Mon, 17 Jun 2024 08:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ7ty-0001nt-HZ; Mon, 17 Jun 2024 08:39:46 +0000
Received: by outflank-mailman (input) for mailman id 741896;
 Mon, 17 Jun 2024 08:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yk4M=NT=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1sJ7tw-0001nn-HZ
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 08:39:44 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 225bb6de-2c85-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 10:39:42 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111aeso1738480a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 01:39:39 -0700 (PDT)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbb05b465sm5550010a12.18.2024.06.17.01.39.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2024 01:39:38 -0700 (PDT)
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
X-Inumbo-ID: 225bb6de-2c85-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718613578; x=1719218378; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mugjmrlf67djGV/fxLe8luEpsefrPNOLtNy50E6bwxg=;
        b=cKZ1TXy/GZDAICt44p+ehGNhtXB9/laXRcZ04Sq/p4yVLtAf1PsxSiEOVIVeSZ7xbA
         utd+SE6qcTml7b30/v53PZS3/XjR5lufRDl2GDa67TwcZMpSk1k6aeVMNVDoFBPtgsj+
         sa4e7bD+SUfczAAwyv98J0iMzRqpT/1z4/RZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718613578; x=1719218378;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mugjmrlf67djGV/fxLe8luEpsefrPNOLtNy50E6bwxg=;
        b=Vnz4QGZ1rYRhNC9xByUCSoXZC5WioAgIIXO8TK6qLPGV8CTJRUShCupEGIUypZYhLU
         iVYjy9nvxjvKP8/GQnvIdk64IzU6DOb8SGrzLfZqeKSBChNbpIuB/Gs8LyKxp62mlSwS
         ATguNgtaXDbsrQN1OpcLF00UuoAR3ZfSz3s8uv519wg+K4o/KomRSgJWzLpFbkI0Q6f3
         Pv+1/S8r9+pL8YZ4vZu/QxJ6DwMAMZSkrpNTGBCHubovq5kM1WW+jzJ+O95XW5UvRzPL
         H7HG827nSgcB3GMutWkqkOtJ4oTb0uE7cSPupE4uEWGuRqmFKwwL82v6uKwb3kWxkZcJ
         LJlw==
X-Forwarded-Encrypted: i=1; AJvYcCUBhQm62Txto31+JS/q+NyapMJLyNqaa/MDnpdklK33aedw9huPB08z5JPyM/tuG3tfgiqAfshROwPRF8f76fGoJX0zSTO+LXK7uMx19+o=
X-Gm-Message-State: AOJu0Yzza4nGcTIZiUWVpXm54gwFCty3E0DBegXOa9XwFREPNr++/oDL
	SosDiqn7n3O5rEH4LiuBsiC5nTIUSXvfl5PRiHi92WHrPDgdJ4TVUe7BDLLT4Rk=
X-Google-Smtp-Source: AGHT+IE49XWB+Mgt1gTXGnih61wtOUA32pZiLFXyBDTp7KuBSH7u24HdwKdObO7fODBLy5fk8mdS8A==
X-Received: by 2002:a50:9b18:0:b0:57a:2e93:fe80 with SMTP id 4fb4d7f45d1cf-57cbd66349bmr5800234a12.18.1718613578571;
        Mon, 17 Jun 2024 01:39:38 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH for-4.19? v6 3/9] xen: Refactor altp2m options into a
 structured format
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <217202e9-608f-4788-b689-8140567e4485@suse.com>
Date: Mon, 17 Jun 2024 09:39:26 +0100
Cc: =?utf-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <91079292-EE0F-4A85-A86D-9649CBBF529D@cloud.com>
References: <cover.1718038855.git.w1benny@gmail.com>
 <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
 <8787608f-f3b0-4fb3-95ee-98050cf95182@suse.com>
 <CAKBKdXiiZdz70nWx7kqp2S5RdbRsku+qtn6z9DBk44LZOgp3Qw@mail.gmail.com>
 <217202e9-608f-4788-b689-8140567e4485@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On 11 Jun 2024, at 10:14, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 11.06.2024 10:00, Petr Bene=C5=A1 wrote:
>> On Tue, Jun 11, 2024 at 8:41=E2=80=AFAM Jan Beulich =
<jbeulich@suse.com> wrote:
>>>=20
>>> On 10.06.2024 19:10, Petr Bene=C5=A1 wrote:
>>>> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>>>>=20
>>>> Encapsulate the altp2m options within a struct. This change is =
preparatory
>>>> and sets the groundwork for introducing additional parameter in =
subsequent
>>>> commit.
>>>>=20
>>>> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
>>>> Acked-by: Julien Grall <jgrall@amazon.com> # arm
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
>>>=20
>>> Looks like you lost Christian's ack for ...
>>>=20
>>>> ---
>>>> tools/libs/light/libxl_create.c     | 6 +++---
>>>> tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-
>>>=20
>>> ... the adjustment of this file?
>>=20
>> In the cover email, Christian only acked:
>>=20
>>> tools/ocaml/libs/xc/xenctrl.ml       |   2 +
>>> tools/ocaml/libs/xc/xenctrl.mli      |   2 +
>>> tools/ocaml/libs/xc/xenctrl_stubs.c  |  40 +++++++---
>=20
> Right, but above I was talking about the last of these three files.
>=20
> Jan

Consider all of this Acked by me. I think this email-based workflow when =
we are going through several iterations are quite a burden.

=E2=80=94 C=

