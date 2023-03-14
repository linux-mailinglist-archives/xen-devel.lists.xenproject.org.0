Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E36B9F5F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 20:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509792.786273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA0u-00085X-8q; Tue, 14 Mar 2023 19:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509792.786273; Tue, 14 Mar 2023 19:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA0u-00082w-5e; Tue, 14 Mar 2023 19:08:48 +0000
Received: by outflank-mailman (input) for mailman id 509792;
 Tue, 14 Mar 2023 19:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snfi=7G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcA0s-00082q-PB
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 19:08:46 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a42d4c4f-c29b-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 20:08:45 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id o12so66233608edb.9
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 12:08:45 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 vs6-20020a170907a58600b0092bef8ad0basm1429885ejc.183.2023.03.14.12.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 12:08:44 -0700 (PDT)
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
X-Inumbo-ID: a42d4c4f-c29b-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678820924;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9bN7i8qGgPABJTaBtFRpMOLVWc/OGL8QFg78cpLEP/M=;
        b=aGI5OcPiePc7ByolVcSQSX5h0Cl6iaQKAt2nldHuHm9rCMuJ+gk2+kotnfb7u6YiqN
         zrg1axtDbh1Chk7ZusoTK4E+rJssFC1Wg1JKMZqhLrVhEKa7PVbI3CBWvDVAGw0WH1Lu
         zbdKu25F5F9zbZ4ewBp7mg546bFPCb/xmrgByHFbQbKLVGgIAYkuF1T+PHEahuC+5LlA
         8Hc5caC+aQNLzftLQF8MQcAyYT9SVrg2xxeDcU+z7mDxKWGYMNy1gDfgDrGFUb+e/Wsr
         ZOu0zsLT36hOUdyubG436PDlLJtFPZN/yVHG8GQLIZrj80eAlo3y/tNk1T/kdfcu+0sb
         za0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678820924;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bN7i8qGgPABJTaBtFRpMOLVWc/OGL8QFg78cpLEP/M=;
        b=NVvXBYKDX3JXzkF5L8lpq4xREfESAEU0f07IP24g68x9U2HcswaJFDTBWzAMBUJ3Wq
         vRU1/2aetxnEhi+AYW1DyIjJQDXCeW32l1VJzhZby59eBQMBwoz3mmvqrDiF/CYwOAZp
         3N0n8QHQEN3nHZEjHB/5h0e4l4pMaSpNZMumvNZmGzkwDYndM3s4MreqdjznaYZ09cKl
         U2NJFWZsKN0KVy+aeJfkIMAhM2fOATJ3lNku7D7zBWEnZQmGd1XXEGfOnwviLfiiSd/o
         VxFcLbKujJy4rq9fdQxNWH3M6O22E4qN2tyAsyHl4LsKb+bCM7kg8p0X4kmN7XAvrO50
         U7/g==
X-Gm-Message-State: AO0yUKXy6oO+j8HdZPHUgWCEoyf113xQdB5ZNWevkecbCZDUg3vcvKSm
	YHqqD95kpROT/1eH0CwpvJQ=
X-Google-Smtp-Source: AK7set/R2U9agF3qJn079PAwjXFpYMT4U90yYcVXHSzSoT2x0+oZsOhVnvsXMGZygx0B/rbmopHy8A==
X-Received: by 2002:a17:907:9952:b0:877:a3c4:807b with SMTP id kl18-20020a170907995200b00877a3c4807bmr3347509ejc.68.1678820924423;
        Tue, 14 Mar 2023 12:08:44 -0700 (PDT)
Message-ID: <645c09598419abf498c3693c463a310a46d74be7.camel@gmail.com>
Subject: Re: [PATCH] xen/cpufreq: Remove <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 14 Mar 2023 21:08:42 +0200
In-Reply-To: <CAKf6xpvdOz2eYXqsxLN879NtMYZvuGWXk7bgcCwnbRfAGofL4Q@mail.gmail.com>
References: <20230313175103.20778-1-jandryuk@gmail.com>
	 <593392ae-91ce-3499-1aa7-fcfe664025cd@suse.com>
	 <CAKf6xpvdOz2eYXqsxLN879NtMYZvuGWXk7bgcCwnbRfAGofL4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-03-14 at 08:14 -0400, Jason Andryuk wrote:
> On Tue, Mar 14, 2023 at 6:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com>
> wrote:
> >=20
> > On 13.03.2023 18:51, Jason Andryuk wrote:
> > > The header is unneeded - there are no uses of BUG() or WARN() in
> > > these
> > > cpufreq files.=C2=A0 Remove the include.=C2=A0 It is still include
> > > transitively
> > > from xen/lib.h.
> > >=20
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >=20
> > This, in a way, is a review comment on Oleksii's "xen: change
> > <asm/bug.h>
> > to <xen/bug.h>". We can certainly put in the change as you have it
> > (for
> > him to drop the touching of the two files), but I'd find it more
> > logical
> > to continue to be part of his change, just with the xen/bug.h
> > replacement
> > includes dropped. Thoughts, either of you?
>=20
> Yes, Oleskii's work brought it to my attention.=C2=A0 I submitted it this
> way to follow the "one change per commit" rule of thumb, seeing it as
> distinct from, though related to, the asm -> xen rename.=C2=A0 If you
> prefer to have it rolled into Oleksii's change, that is fine by me.
I think we can do it as a part of my changes to not produce additional
commits with the similar meaning.
>=20
> > Things would be different if it was clear that the change here was
> > dropping
> > all unnecessary includes from the cpufreq files. But that doesn't
> > look to
> > be the case, as I think ...
>=20
> Correct, I did not inspect other includes.
>=20
> Regards,
> Jason
~ Oleksii


