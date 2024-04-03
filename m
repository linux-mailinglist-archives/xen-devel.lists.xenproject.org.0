Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF189739B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 17:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700592.1093968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2HQ-0003LY-QZ; Wed, 03 Apr 2024 15:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700592.1093968; Wed, 03 Apr 2024 15:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2HQ-0003K0-NV; Wed, 03 Apr 2024 15:12:00 +0000
Received: by outflank-mailman (input) for mailman id 700592;
 Wed, 03 Apr 2024 15:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c57l=LI=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rs2HP-0003Ju-5A
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 15:11:59 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8342e5a8-f1cc-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 17:11:58 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-22988692021so407413fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 08:11:58 -0700 (PDT)
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
X-Inumbo-ID: 8342e5a8-f1cc-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712157117; x=1712761917; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPDJ0BUB/rDc7HOtMUix5dHRcfPqrkvjL7SQSWnlofk=;
        b=ctMqLedWSPrPlI1J1aBzV6O3a+iJyJbxX+n38T4PoDfyoAOOBLeBfRi3DNBGeQV24v
         OSfusmUhqxQQCVZJ3sW3R/3bMWANKxNuiEWyp0DClAPLLe+yqMNRV80liM++arQMX2YM
         lnh6zbDJ4XiZomYpeWICYeQ7XxtzVmJw317KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712157117; x=1712761917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPDJ0BUB/rDc7HOtMUix5dHRcfPqrkvjL7SQSWnlofk=;
        b=MSxmHRDt7odQRnojBpmNYIeqMSAW1m1V6ayT4p7NhYRZtpbqAewHFJPmtcTkESrMEw
         tSrdknjqKAlghNZN6HJY+cb7NSdKQKS9YJlBwvqHPp8kH8QbAv32P4Hb1/kVfd2jF1i3
         6mXQdxJ/qMct2mZFL8LdxSaJ5nqvk8c6+2RnVbojsgQs23uuy07WU2RGkkH/V0Td88K1
         BW/i3cbE8kLxJNn4/BqrBprIwyrFHri4rspziQFfrILLmA+6KvsjgcEFMhXwEKS7kjbp
         0zCpnLQWuuYQ6XqmDVYjch+cCh4HMkdSzJbBEcOmLcbNnmR23H6+tV/Voc65XLUiP5b+
         iJNw==
X-Forwarded-Encrypted: i=1; AJvYcCWnmV3wiMqfgynHsFaWX/SPLC8oWbKHCVTBBdwffippl3FFMscmZTtJO0yP9kzG9Xy4qPL29DCVNxaAYpICduITkyUYNvC1364txP1lrjs=
X-Gm-Message-State: AOJu0Yx8MfIxY5n/Ajn7HMLDACT+51wmf64PRqQgnLUDYQ050jWGcbGE
	4D86gIUutPBjcq8XXSfWEabrCrUjRFrZszBIIz6M477BQIG0uLNZkp7CKMbrcvQe8qjwVbjzo/e
	sZjPai44zyeKxJmiJviX2Qz44RMn450PUixXFqg==
X-Google-Smtp-Source: AGHT+IH2ekgReYg7I2ZjStsBHa5zVhounqfchGCEV9Z71EtjUNl63EycvzrkVnZ5r/iCiWACeqIaYkMzNfjxx4i649w=
X-Received: by 2002:a05:6871:58e:b0:22e:74a1:2ac5 with SMTP id
 u14-20020a056871058e00b0022e74a12ac5mr1025585oan.7.1712157116783; Wed, 03 Apr
 2024 08:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com> <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org> <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
 <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com> <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
 <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com> <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com>
 <d05be83a-e7f1-4c2f-afda-42deee9be203@suse.com> <3f27abc3-9809-4637-a29c-8aeafcd29ade@xen.org>
 <7109ef7e-040c-4d11-ba4b-d898ed2530ff@suse.com> <CA+zSX=bGfc+dsZjg4xmW2fgsnFQLSAh1ChOY3jYU_AD5SJw_7w@mail.gmail.com>
 <5128255f-fe52-4425-b168-34946c0c901e@suse.com> <alpine.DEB.2.22.394.2403181752370.853156@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2403181752370.853156@ubuntu-linux-20-04-desktop>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 3 Apr 2024 16:11:45 +0100
Message-ID: <CA+zSX=ZGG+D3FaCRuxmJygWzwc3KdSYiJKzrp4HLeHxG-stHKA@mail.gmail.com>
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, federico.serafini@bugseng.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org, 
	michal.orzel@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 3:39=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
> > The main use of fixed width types, to me, is in interface structure
> > definitions - between Xen and hardware / firmware, or in hypercall
> > structures. I'm afraid I have a hard time seeing good uses outside of
> > that. Even in inline assembly, types of variables used for inputs or
> > outputs don't strictly need to be fixed-width; I can somewhat accept
> > their use there for documentation purposes.
>
>
> Non-ABI interfaces are OK with native types.
>
> Our ABI interfaces are, for better or for worse, described using C
> header files. Looking at these header files, it should be clear the size
> and alignment of all integer parameters.
>
> To that end, I think we should use fixed-width types in all ABIs,
> including hypercall entry points. In my opinion, C hypercall entry
> points are part of the ABI and should match the integer types used in
> the public header files. I don't consider the little assembly code on
> hypercall entry as important.

So as Jan pointed out in the recent call, the "actual" ABI is
"register X, Y, Z are arguments 1-3".  The key thing for me then is
whether it's clear what values in register X are acceptable.  If the C
function implementing the hypercall has an argument of type "unsigned
int", is it clear what values the guest is allowed to be put into the
corresponding register, and how they'll be interpreted, as opposed to
"unsigned long"?

If we can document the expectations, for each architecture, for how
the "native types" map to sizes, then I think that should be
sufficient.

 -George

