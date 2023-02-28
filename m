Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133116A59D9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 14:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503357.775611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzo3-0003ke-Tl; Tue, 28 Feb 2023 13:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503357.775611; Tue, 28 Feb 2023 13:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzo3-0003i6-R1; Tue, 28 Feb 2023 13:14:11 +0000
Received: by outflank-mailman (input) for mailman id 503357;
 Tue, 28 Feb 2023 13:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pWzo2-0003i0-0M
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 13:14:10 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c85b50e9-b769-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 14:14:08 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id i28so383331lfv.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 05:14:08 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 w11-20020ac254ab000000b004d865c781eesm1330635lfk.24.2023.02.28.05.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 05:14:07 -0800 (PST)
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
X-Inumbo-ID: c85b50e9-b769-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dlqoj5iWe/oymfTsrc7Y15VaXrPpCoFoudHuwzCUec8=;
        b=pSzV1nvihnA16L0BU9lHsSZxkHzox9uTTnR/5YuoPcqx4Zxqw3tgQdDQfXPbxq99TZ
         j2rvJuvtwUDQESzQ4KNnObj83DPuLDIaFpCy2amUlRpyidvUb8OKP2lfns3uuL4J5s7W
         XGzWI9l/LMILjnaOP+xXWzVDUHrI+5TwFZf95QFTBaTulHx1gphAFLnjYqiZryh+cbRg
         iBVuzvPbNYuHyIfsEBgEgnRh9WO9UxZazzxDfYYm2yyXbudNvP1kI990uU6l/R3IWB9z
         Adt9YC7Qd7Y9eka+flWXXOT4Upnd8xusYEDgFSkpVlYQAr6FwTbopF6C6ec285o3ILOy
         xw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlqoj5iWe/oymfTsrc7Y15VaXrPpCoFoudHuwzCUec8=;
        b=e2eOf4GzSFFvolz+F2LD65LYhFYo2dxeHZNT6N5waElGdzGfIIWMhvVvyLYRqHajwH
         yr6VBVmHWRBvYh5bmdJmJ7TZwXBbH7bL0WnrqLUwhILIgEFMj8alFJorXFCHgF1YnqOB
         D69hega3xvcenM3EtQr9Hzqde/L7csncbAJiqOVwRiVHWAgXwaYuSJcDa+Prv+W/x3HD
         v/CtZv/06rcvWdsLNchvBN3bGS86hqW4BAQrkseHxViD7ixsHDkkmZ3xlcVkIn4YKYJL
         OW5cd+R6dprRo25S3SP/PhKbOzaMKl+mmmhbOFKXm94GMFctGT7L4JRpo3rP+vjYxJEr
         ux8A==
X-Gm-Message-State: AO0yUKUsXA6l9pw63cMkvlatmjnQVw8GyDxVo6NdRT87GspWDjYmHqpB
	UK1gNGga976rTmnz1pTcUOA=
X-Google-Smtp-Source: AK7set+jqzIhN4nr8IDnoB6h8WoJSPOyCb/dN2aeyQRrGZ7PhlrzHgvMw2MIYGjJ9cg+AgRmUsOn0w==
X-Received: by 2002:a05:6512:3404:b0:4dd:9931:c4f6 with SMTP id i4-20020a056512340400b004dd9931c4f6mr1019471lfr.16.1677590047338;
        Tue, 28 Feb 2023 05:14:07 -0800 (PST)
Message-ID: <9fb7bf20384778ddbe16030cfece3dcb942d0612.camel@gmail.com>
Subject: Re: [PATCH v3 2/4] xen: change <asm/bug.h> to <xen/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,  Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Tue, 28 Feb 2023 15:14:05 +0200
In-Reply-To: <6b6fa456-4653-4fc0-d777-985ee217954f@suse.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
	 <6b6fa456-4653-4fc0-d777-985ee217954f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-27 at 15:29 +0100, Jan Beulich wrote:
> On 24.02.2023 12:31, Oleksii Kurochko wrote:
> > Since the generic version of bug.h stuff was introduced use
> > <xen/bug.h>
> > instead of unnecessary <asm/bug.h>
>=20
> You keep saying "unnecessary" here, but that's not really correct.
> Including asm/bug.h alone simply becomes meaningless. So how about
> "... instead of now useless (in isolation) <asm/bug.h>"?
>=20
> > --- a/xen/arch/x86/include/asm/bug.h
> > +++ b/xen/arch/x86/include/asm/bug.h
> > @@ -1,19 +1,10 @@
> > =C2=A0#ifndef __X86_BUG_H__
> > =C2=A0#define __X86_BUG_H__
> > =C2=A0
> > -#define BUG_DISP_WIDTH=C2=A0=C2=A0=C2=A0 24
> > -#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> > -#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> > -
> > -#define BUGFRAME_run_fn 0
> > -#define BUGFRAME_warn=C2=A0=C2=A0 1
> > -#define BUGFRAME_bug=C2=A0=C2=A0=C2=A0 2
> > -#define BUGFRAME_assert 3
> > -
> > -#define BUGFRAME_NR=C2=A0=C2=A0=C2=A0=C2=A0 4
> > -
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > +#define BUG_FRAME_STRUCT
> > +
> > =C2=A0struct bug_frame {
> > =C2=A0=C2=A0=C2=A0=C2=A0 signed int loc_disp:BUG_DISP_WIDTH;
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int line_hi:BUG_LINE_HI_WIDTH;
>=20
> Why would x86 continue to define its own bug_frame (and other items)?
>=20
Because x86 will be switched to generic one in the following patches of
the patch series and right now it defines only BUG_FRAME_STRUCT which
means that it will not use generic one implemetation now.
The idea of the patch was to rename <asm/bug.h> to <xen/bug.h> with
minimal required changes to keep Xen compilable.

And I am going to back:

-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)

for the same reason as in ARM. these defines are related to 'stuct
bug_frame' so should go with it.
These defines will be removed when an architecture will be switched to
generic implementation.

> Jan
~ Oleksii


