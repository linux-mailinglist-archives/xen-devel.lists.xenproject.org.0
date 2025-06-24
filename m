Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E4FAE641A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 13:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023626.1399627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU2JO-00050m-49; Tue, 24 Jun 2025 11:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023626.1399627; Tue, 24 Jun 2025 11:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU2JO-0004yN-0x; Tue, 24 Jun 2025 11:59:38 +0000
Received: by outflank-mailman (input) for mailman id 1023626;
 Tue, 24 Jun 2025 11:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uU2JM-0004yG-Tv
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 11:59:36 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b21193d3-50f2-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 13:59:36 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2cc89c59cc0so3136337fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 04:59:35 -0700 (PDT)
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
X-Inumbo-ID: b21193d3-50f2-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750766374; x=1751371174; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0EpDBayDeBmUFPy+lsJUQFC0eABLtkCz5XhW10E+w0=;
        b=cdww+XC7g3mnq2DQjoT00KY5WGvCGnnyXEv0vGovj6Xm42OJAMKXYmaHym3VBK1Taq
         eWvam6EeTbmuHrnT7x4wIMPJX/n+OgUhQiwzSDOCJbp4DM082+vMPOInyxxyeJ5JT8MD
         QNCkmKDMsXaY4ypBMI4fjpCHRRgZC5sKLZC7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766374; x=1751371174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0EpDBayDeBmUFPy+lsJUQFC0eABLtkCz5XhW10E+w0=;
        b=oLnrJLNuW3iKArq98qKv4/803ej8U3v23CTDkXEE/jqKlhx0CgJ3q/juyAbZ3O9vMy
         uYg8Dui7KUjiMEc46HWvvrnSnkzvfhXAnFTnOSRDnGAjFlxE+oLbqio/QWCp1RgsJ/hP
         m6rBk9qao8SGhk/r9M1ftjMbos6P1GNc6MsvKMNEEWnpyTbEwH8GdrT5Yc42/rZFna3P
         QLEaRkH59hQaMoO0FFsM5E4AvymV23MAtHW2z3DzU393VvGgzT65KoF6USuJb/xcbbCw
         BQEdPXGuPzIVxWSa+ruNEO/uxUi+mdTnimQcXRBMXxBgTJayRt/U7hRc9EhzjKkIB/L0
         Wrvg==
X-Gm-Message-State: AOJu0Yy9X6QZb6Hove3pdGu1ZrAWqPCTAOSwP3ouPA1pClCeaNpxkKag
	uhobyNqpPZAt8zhNKqwU37SRJImjmF7k71/wz5RwwxbKip54gCv0C9wzPV9WBym6zW5Qq90N1hb
	eSLD9vRszgjHt8TK6XuX6eObJGpXixK8iWIg7f/43Yw==
X-Gm-Gg: ASbGncuePUtr9z2YlmTiYoJpdNP8V6/PLCaF88huvgbKPJup574Ce15htDfqXsT67yH
	d1DmJqD7UYaPlEruNvbESTnyKq8pGv8UHnMs7UgwGZOzoziBYY2+nWyf7WsG/tUhilHsQGD7AOH
	uqtS3GefO3/fEayA1ZXT0zqsHhLSjFcuvEduoyjivA
X-Google-Smtp-Source: AGHT+IHj9Ex7rriEsYL7OpPSmQZPVWo4Y3/5pVE4q0bS2KGriGBFcJ054FLkn8Ix28Y6w0tx3NhkX2zbUaWBMJJvt8Q=
X-Received: by 2002:a05:6870:9494:b0:2b8:b76f:1196 with SMTP id
 586e51a60fabf-2ef95cf11bemr1780199fac.19.1750766374285; Tue, 24 Jun 2025
 04:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250624114529.34743-1-frediano.ziglio@cloud.com> <c3f0415a-3a91-4a23-81d7-8e913e4a8f7c@citrix.com>
In-Reply-To: <c3f0415a-3a91-4a23-81d7-8e913e4a8f7c@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Jun 2025 12:59:18 +0100
X-Gm-Features: AX0GCFvaheXfcx4MEt-6l7qljf7RbioszY3m-5LHlPwPIGFZVIrWIM7Nw9da1Pc
Message-ID: <CACHz=Zh0iRXqejwuoEp_LkeQvzDUf3iMOXymB6YaTop3fYsE+w@mail.gmail.com>
Subject: Re: [PATCH v2] xen/efi: Do not undefine not defined macro
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 12:57=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 24/06/2025 12:45 pm, Frediano Ziglio wrote:
> > The "buffer" macro is not defined.
> >
> > Fixes: 59e087bf6a9c ("xen/keyhandler: Drop keyhandler_scratch")
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.=
com>
>
> While correct, the grammar isn't great.  I'd suggest "Drop stale #undef
> buffer" for the subject, and "The "buffer" macro was removed when
> keyhandler_scratch was removed."
>

Fine for me.
Not sure about the acknowledgement.

> Can fix on commit.
>
> ~Andrew

Frediano

