Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33228B3237
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712518.1113245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0GpT-0001IZ-OY; Fri, 26 Apr 2024 08:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712518.1113245; Fri, 26 Apr 2024 08:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0GpT-0001Fm-KV; Fri, 26 Apr 2024 08:21:11 +0000
Received: by outflank-mailman (input) for mailman id 712518;
 Fri, 26 Apr 2024 08:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mvt6=L7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s0GpS-0001Fg-1F
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:21:10 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef1a88ec-03a5-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 10:21:09 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57222fc625aso2244229a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:21:09 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a056402271400b00572300f0768sm2728556edd.79.2024.04.26.01.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:21:07 -0700 (PDT)
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
X-Inumbo-ID: ef1a88ec-03a5-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714119668; x=1714724468; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LOkgJC3azMPRkO93Rf/OS/EW5CY4QkXSCHNZXK+VmxQ=;
        b=YX7L5GJ151SPw8DAS7dXGxKlD+rrUyqlPAIXYdwPZvZAIFIPYyNNDccFp3rkKefnO9
         6URTwv03Iye+mxvvVQszwMXoxcE6GxC9oZnwy59/2HGfl/G6PgNApJnbg//mTfV5gR+t
         VoU5O4fogmxTJ3EEhYBqL3+qtQVjS0um44x3LZfS8tn2QqnIQaBYicng4zRYAgz5sJbd
         spWAXfzKEGXFIrXR5OOHap9Y5YX0sPdPG5a4qvaMw5WE6KLuxcizFVGqTaPozJslavTL
         1NiZEQSD5xI2gjnlbG29+MwL47i5BlC+v9dLMwIocvuhZp1X74p/vETPOtYXvYyYCeQN
         a1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714119668; x=1714724468;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOkgJC3azMPRkO93Rf/OS/EW5CY4QkXSCHNZXK+VmxQ=;
        b=tFjV62rXZQwzvJ2Zoo/Dhi4yVE6OxOPbAVcC7MtnIy8jvgHhZdCggX6cSZEomBfEnJ
         4ZNxcESm+kc0nJjLIHH/eKAZB8TEpDmWlgTTqX6mzKqDCjpRu8J637Pt2ws/F7qwgY/4
         tHEOIo9yYag0rww2SZSNKKnagsqM/q4Z0mHvJgcTGm0Ds1U51FOAvPEhJ38zNjq1hjad
         RhcWUQmETrG3ssEDy0rSmY1QOJN1QpGevi6FNMIJ2g0PgtKFLwfWdSx8e3iVmKw9NIqG
         iu2AjcCMiKhrzfw8bRpR0vcKo2ZqrmMCMv8bd13Sm63jOsHHXZl1moYwAkCCN2v8IOrj
         ITvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXsnrkcwBsc99TFUaZqTcGmpRIZIrkStLZOKog/CjyefDvMmaoVhfSAlafXYV/TWOVUOtl1zOI1083MwxgLt0POGBylnUiwux8EZcsrG4=
X-Gm-Message-State: AOJu0YytJ5g3YudURjqZmCTem3/9gb+ifbc/AuzW+V1kFbz6FYr031C4
	a3BX40hJqeCgA4v9jB9ZQB6gHKnUZbMgp6xRaPKlkgV5/qgdEsz+
X-Google-Smtp-Source: AGHT+IHIcEjfAlZlHlM+fVoMbDvmRrxLCpUGrAJxOwxazqUn8HU/mwoc6gVUo6voApBpLVsFkBVcvQ==
X-Received: by 2002:a50:9f8f:0:b0:56d:f246:bfa4 with SMTP id c15-20020a509f8f000000b0056df246bfa4mr1782071edf.23.1714119668101;
        Fri, 26 Apr 2024 01:21:08 -0700 (PDT)
Message-ID: <fb1a228b1bd58d17d7836c3413d3b0a8a9602978.camel@gmail.com>
Subject: Re: [PATCH v8 03/17] xen/bitops: implement fls{l}() in common logic
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 26 Apr 2024 10:21:06 +0200
In-Reply-To: <a6245e9e-a156-4b17-8695-e072915fe78b@suse.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
	 <60bc710b990ed1d45741888df7e97cf25d150e61.1713347222.git.oleksii.kurochko@gmail.com>
	 <a6245e9e-a156-4b17-8695-e072915fe78b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-25 at 17:44 +0200, Jan Beulich wrote:
> On 17.04.2024 12:04, Oleksii Kurochko wrote:
> > Return type was left 'int' because of the following compilation
> > error:
> >=20
> > ./include/xen/kernel.h:18:21: error: comparison of distinct pointer
> > types lacks a cast [-Werror]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (void) (&_x =3D=3D &_y);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
> > =C2=A0=C2=A0=C2=A0 common/page_alloc.c:1843:34: note: in expansion of m=
acro 'min'
> > =C2=A0=C2=A0=C2=A0=C2=A0 1843 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned int inc_order =3D min(MAX_ORDER, flsl(e
> > - s) - 1);
>=20
> Apart from this I'm okay with this patch, assuming Andrew's won't
> change in
> any conflicting way. As to the above - no, I don't see us having
> ffs() / ffsl()
> returning unsigned int, fls() / flsl() returning plain int. Even more
> so that,
> given the LHS variable's type, an unsigned quantity is really meant
> in the
> quoted code.
If I understand you correctly, it's acceptable for fls() / flsl() to
return 'int'. Therefore, I can update the commit message by removing
the part mentioning the compilation error, as it's expected for fls() /
flsl() to return 'int'. Is my understanding correct?

~ Oleksii

